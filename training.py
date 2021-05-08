
import turicreate as tc
import os

def load_trainable_data(data_dir: str):
    data = tc.image_analysis.load_images(data_dir, with_path=True)
    data['label'] = data['path'].apply(lambda path: os.path.basename(os.path.dirname(path)))
    data.save('aymane-face.sframe')
    return data

# data = load_trainable_data(data_dir='./Training Data/Aymane/output')
# data.explore()

def train(data_path: str):
    dataset = tc.SFrame(data_path)
    train_data, test_data = dataset.random_split(0.8)
    model = tc.image_classifier.create(train_data, target='label', model='resnet-50', max_iterations='500')
    model.export_coreml('faceRecognition.mlmodel')

