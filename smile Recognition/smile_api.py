from flask import Flask, request, jsonify
from PIL import Image
import cv2
import os
import numpy as np
import requests

app = Flask(__name__)

# Load pre-trained Haar cascade for smile detection
smile_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_smile.xml')

# Home route
@app.route('/')
def home():
    return "Smile Detection API is Running ✅"

# Smile detection route
@app.route('/smile-detection', methods=['POST'])
def smile_detection():
    try:
        data = request.get_json()

        if not data or 'image_url' not in data:
            return jsonify({"error": "No image URL provided"}), 400

        image_url = data['image_url']

        # Download the image
        response = requests.get(image_url)
        if response.status_code != 200:
            return jsonify({"error": "Failed to download image"}), 400

        image_np = np.frombuffer(response.content, np.uint8)
        img = cv2.imdecode(image_np, cv2.IMREAD_COLOR)

        if img is None:
            return jsonify({"error": "Could not decode the image"}), 400

        # Convert to grayscale
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Detect smiles
        smiles = smile_cascade.detectMultiScale(gray, scaleFactor=1.8, minNeighbors=20)

        smiling = len(smiles) > 0

        return jsonify({"smiling": smiling})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Only one main block
if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))  # Dynamically use Heroku's assigned port
    app.run(host="0.0.0.0", port=port, debug=True)