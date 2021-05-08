
import Augmentor

def data_augmentation(dir_path: str):
    sample = Augmentor.Pipeline(source_directory=dir_path)
    sample.rotate(probability=0.7, max_left_rotation=10, max_right_rotation=10)
    sample.zoom(probability=0.5, min_factor=1.1, max_factor=1.5)
    sample.skew(probability=0.5, magnitude=0.5)
    sample.shear(probability=0.5, max_shear_left=10, max_shear_right=10)
    sample.crop_random(probability=0.5, percentage_area=0.9, randomise_percentage_area=True)
    sample.sample(25)

data_augmentation(dir_path="./Training Data/Aymane")


