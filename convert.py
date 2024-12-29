import torch
from torchvision import models

# Load your model
model = models.densenet121(pretrained=False)
num_classes = 138
model.classifier = torch.nn.Linear(in_features=1024, out_features=num_classes)
model.eval()

model.load_state_dict(torch.load("dense121_aug.pth", map_location=torch.device("cpu"))['model_state_dict'])


# Example input tensor for tracing
example_input = torch.randn(1, 3, 256, 256)

# Convert to TorchScript
traced_model = torch.jit.trace(model, example_input)
traced_model.save("densenet121.pt")
