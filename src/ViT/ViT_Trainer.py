import torch
import torch.nn as nn
import torch.optim as optim
from timm import create_model
from tqdm import tqdm


# Trainer Class
class Trainer:
    def __init__(self, model, optimizer, loss_fn, device, scheduler=None):
        self.model = model.to(device)
        self.optimizer = optimizer
        self.loss_fn = loss_fn
        self.device = device
        self.scheduler = scheduler

    def train_epoch(self, train_loader):
        """Train for one epoch and return loss & accuracy."""
        self.model.train()
        total_loss, correct = 0, 0

        with tqdm(train_loader, desc="Training", unit="batch") as t:
            for images, labels in t:
                images, labels = images.to(self.device), labels.to(self.device)
                self.optimizer.zero_grad()
                logits = self.model(images)
                loss = self.loss_fn(logits, labels)
                loss.backward()
                self.optimizer.step()

                total_loss += loss.item() * len(images)
                correct += (logits.argmax(dim=1) == labels).sum().item()

                t.set_postfix(loss=loss.item())

        return total_loss / len(train_loader.dataset), correct / len(train_loader.dataset)

    @torch.no_grad()
    def evaluate(self, test_loader):
        """Evaluate model and return loss, accuracy."""
        self.model.eval()
        total_loss, correct = 0, 0

        with tqdm(test_loader, desc="Validating", unit="batch") as t:
            for images, labels in t:
                images, labels = images.to(self.device), labels.to(self.device)
                logits = self.model(images)
                loss = self.loss_fn(logits, labels)

                total_loss += loss.item() * len(images)
                correct += (logits.argmax(dim=1) == labels).sum().item()

        avg_loss = total_loss / len(test_loader.dataset)
        accuracy = correct / len(test_loader.dataset)

        return avg_loss, accuracy

    def train(self, train_loader, val_loader, epochs):
        """Train model and return training & validation metrics."""
        train_losses, train_accuracies = [], []
        val_losses, val_accuracies = [], []
        learning_rates = []

        for epoch in range(epochs):
            print(f"Epoch {epoch+1}/{epochs}")
            train_loss, train_acc = self.train_epoch(train_loader)
            val_loss, val_acc = self.evaluate(val_loader)

            train_losses.append(train_loss)
            train_accuracies.append(train_acc)
            val_losses.append(val_loss)
            val_accuracies.append(val_acc)

            # Log learning rate
            current_lr = self.optimizer.param_groups[0]["lr"]
            learning_rates.append(current_lr)

            # Step scheduler if used
            if self.scheduler:
                self.scheduler.step()

            print(f"Train Loss: {train_loss:.4f}, Accuracy: {train_acc:.4f}")
            print(f"Val Loss: {val_loss:.4f}, Accuracy: {val_acc:.4f}")

        return train_losses, train_accuracies, val_losses, val_accuracies, learning_rates


# Function to Load and Modify ViT Model
def load_vit_classification_head(model_name, num_classes, device):
    """
    Load a ViT model, modify its classification head, and prepare for training.
    """
    model = create_model(model_name, pretrained=True, num_classes=num_classes)

    # Freeze all layers except the classifier head
    for param in model.parameters():
        param.requires_grad = False

    # Only unfreeze the classifier head
    for param in model.head.parameters():
        param.requires_grad = True

    return model.to(device)

# Function to Load and Modify ViT Model
def load_vit(model_name, num_classes, device):
    """
    Load a ViT model, modify its classification head, and prepare for training.
    """
    model = create_model(model_name, pretrained=True, num_classes=num_classes)

    # Unfreeze all layers (full fine-tuning)
    for param in model.parameters():
        param.requires_grad = True

    return model.to(device)