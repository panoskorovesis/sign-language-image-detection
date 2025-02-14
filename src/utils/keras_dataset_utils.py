from tqdm import tqdm
import matplotlib.pyplot as plt
import seaborn as sns

def get_class_count(dataset):
    """Find out how many elements bellong to each class
    This method is used in plot_class_distribution to plot
    the distribution of the data
    
    Return:
        class_counts: A dictionary with the class name as a key
        and the total items as a value
    """
    class_counts = {}
    for images, labels in tqdm(dataset):
        for label in labels:
            # Here the label is a tensor with 1 element
            # We have to convert it to numpy
            label = label.numpy()
            # Count it
            class_counts[label] = class_counts.get(label, 0) + 1
    # Return the counts
    return class_counts

def plot_class_distribution(dataset, title: str):
    """Get how many elements belong to each class and plot them
    
    This method can help us see if there is an inbalance in the data
    """
    # Get the class counts
    class_counts = get_class_count(dataset)
    
    # Set the figure size
    plt.figure(figsize=(12, 6))
    # Add the data
    ax = sns.barplot(class_counts)
    # Set the title
    ax.set_title(title)
    
    # Rotate x-axis labels for better readability
    plt.xticks(rotation=45, ha='right')
    # Adjust layout to make room for rotated labels
    plt.tight_layout()
    plt.show()


def plot_keras_history(history):
    """Plot the loss and accuracy of the models
    """
    import pandas as pd

    # Covert the object to a dataframe for easier access
    history_df = pd.DataFrame(history.history)

    #############
    # loss plot #
    #############
    plt.subplot(1, 2, 1)
    sns.lineplot(data=history_df[['loss', 'val_loss']], palette='tab10', dashes=False)
    plt.title('Model Loss')
    plt.ylabel('Loss')
    plt.xlabel('Epoch')
    plt.legend(['Train Loss', 'Validation Loss'])

    #################
    # accuracy plot #
    #################
    plt.subplot(1, 2, 2)
    sns.lineplot(data=history_df[['accuracy', 'val_accuracy']], palette='tab10', dashes=False)
    plt.title('Model Accuracy')
    plt.ylabel('Model Accuracy')
    plt.xlabel('Epoch')
    plt.legend(['Train Accuracy', 'Validation Accuracy'])

    plt.show()