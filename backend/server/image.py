import requests
import os 
from ultralytics import YOLO
from functools import cache
from pytesseract import image_to_string
from PIL import Image
from io import BytesIO

from settings import UPLOAD_PATH, MODEL_PATH, FOOD_SET

@cache
def get_or_initialize_model() -> YOLO:
    model = YOLO(MODEL_PATH)
    return model

def run_inference(image: str) -> set[str]:
    '''
    run_inference returns a str[] that contains ingredient names
    and raw Image object that contains the original Image with 
    bounding boxes labeled  
    '''

    delete_upload = False
    if image.startswith("http"):
        image = upload_file_from_url(image)
        delete_upload = True
    
    model: YOLO = get_or_initialize_model()
    result = model.predict(f"{UPLOAD_PATH}/{image}.png")[0]
    boxes = result.boxes
    
    ingredient_names: set[str] = set()

    for box in boxes:
        # need >=50% confidence level
        if box.conf[0].item() >= 0.5: 
            box_name: str = result.names[box.cls[0].item()]
            ingredient_names.add(box_name)

    img: Image = Image.fromarray(result.plot()[:, :, ::-1])

    img_bytes: BytesIO = BytesIO()
    img.save(img_bytes, format="JPEG")
    
    if delete_upload:
        # delete the upload afterwards
        os.remove(f"{UPLOAD_PATH}/{image}.png")

    img_bytes: bytes = img_bytes.getvalue()

    with open(f"boxes/{image}_boxes.jpg", "wb") as file:
        file.write(img_bytes)

    return ingredient_names

def scan_image(image: str):
    '''
    scan_image returns a list[str] that represents all the food
    found in the image -- it does this by filtering the image,
    passing it through Tesseract OCR, then uses the edit distance 
    to fix any inconsistences
    '''
    delete_upload = False
    if image.startswith("http"):
        image = upload_file_from_url(image)
        delete_upload = True

    img = Image.open(f"{UPLOAD_PATH}/{image}.png")
    img = img.convert("L")
    img = img.resize((2000, 2000))
    
    img = filter_scanned_image(img)

    text = image_to_string(img, lang="eng")
    text = text.replace("\n", " ")
    
    words: set = set()
    for line in text.split():
        if not line.strip(): continue
        line = line.strip().lower()
        best = (1000, "")
        
        for word in FOOD_SET:
            if len(line) >= len(word):
                value = (levenshtein_distance(line, word), word)
                if value < best:
                    best = value
            if best[0] <= 1:
                words.add("-".join(best[1].split(" ")))
    
    if delete_upload:
        # delete the upload afterwards
        os.remove(f"{UPLOAD_PATH}/{image}.png")

    return words

# util
def upload_file_from_url(url: str):
    image_data = requests.get(url).content
    filename = str(hash(url))

    if not os.path.exists(f"{UPLOAD_PATH}/{filename}.png"):
        with open(f"{UPLOAD_PATH}/{filename}.png", "wb") as file:
            file.write(image_data)
    
    return filename

def filter_scanned_image(img: Image) -> Image:
    '''
    filter_scanned_image returns an PIL Image that
    represents the original img collapsed to only
    two colors: black and white -- makes it easier
    for Tesseract OCR to read the text 
    '''
    cutoff_black = 160
    cutoff_white = 200

    px = img.load()
    px2 = img.copy().load()

    for r in range(img.size[0]):
        for c in range(img.size[1]):
            if px2[r,c] >= cutoff_white:
                px[r,c] = 255
            elif px2[r,c] <= cutoff_black:
                px[r,c] = 0
            else:
                if 0 < r < img.size[0]-1 and 0 < c < img.size[1]-1:
                    if max(px2[r-1,c], px2[r+1,c], px2[r,c-1], px2[r,c+1]) > px2[r,c] + 10:
                        px[r,c] = 0
                    else:
                        px[r,c] = 255
                else:
                    # somehow?
                    px[r,c] = 255
    
    px2 = img.copy().load()
    rseen = set()

    for r in range(img.size[0]):
        for c in range(img.size[1]):
            if px2[r,c] <= cutoff_black and not (r,c) in rseen:
                cseen = set()
                q = [(r,c)]

                while q:
                    qr, qc = q.pop()
                    if px2[qr,qc] <= cutoff_white and not (qr,qc) in cseen:
                        cseen.add((qr,qc))
                        rseen.add((qr,qc))

                        if qc != 0:
                            q.append((qr, qc-1))
                        if qc != img.size[1]-1:
                            q.append((qr, qc+1))
                        if qr != 0:
                            q.append((qr-1, qc))
                        if qr != img.size[0]-1:
                            q.append((qr+1, qc))
                
                if len(cseen) > 25000:
                    for qr,qc in cseen:
                        px[qr,qc] = 255
                if len(cseen) < 20:
                    for qr,qc in cseen:
                        px[qr,qc] = 255
    
    return img

def levenshtein_distance(word, other) -> int:
    '''
    levenshtein_distance calculates the edit distance
    of word and other -- helps detect malformed words 
    by Tesseract OCR
    '''
    matrix = [[0] * (len(other) + 1) for _ in range(len(word) + 1)]

    for i in range(len(word) + 1):
        matrix[i][0] = i
    for j in range(len(other) + 1):
        matrix[0][j] = j

    for i in range(1, len(word) + 1):
        for j in range(1, len(other) + 1):
            cost = 0 if word[i - 1] == other[j - 1] else 1
            matrix[i][j] = min(matrix[i-1][j] + 1,         # deletion
                               matrix[i][j-1] + 1,         # insertion
                               matrix[i-1][j-1] + cost)   # substitution

    distance = matrix[len(word)][len(other)]
    return distance