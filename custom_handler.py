import io  # Import for handling byte streams
from ts.torch_handler.image_classifier import ImageClassifier
from PIL import Image
import torch
from torchvision import transforms

class CustomImageClassifier(ImageClassifier):
    def preprocess(self, data):
        """Custom preprocessing to resize images to (256, 256)."""
        image = data[0].get("data") or data[0].get("body")
        image = Image.open(io.BytesIO(image)).convert("RGB")
        transform = transforms.Compose([
            transforms.Resize((256, 256)),  # Updated size
            transforms.ToTensor(),
        ])
        return transform(image).unsqueeze(0)


