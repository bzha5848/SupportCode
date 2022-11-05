# The new config inherits a base config to highlight the necessary modification
_base_ = '/content/mmdetection/configs/atss/atss_r101_fpn_1x_coco.py'

# We also need to change the num_classes in head to match the dataset's annotation
model = dict(
    bbox_head=dict(
        type='ATSSHead',
        num_classes=1
        ))

# Modify dataset related settings
dataset_type = 'COCODataset'
classes = ('plum',)
data = dict(
    train=dict(
        img_prefix='/content/mmdetection/plumCOCO/train/',
        classes=classes,
        ann_file='/content/mmdetection/plumCOCO/train.json'),
    val=dict(
        img_prefix='/content/mmdetection/plumCOCO/val/',
        classes=classes,
        ann_file='/content/mmdetection/plumCOCO/val.json'),
    test=dict(
        img_prefix='/content/mmdetection/plumCOCO/test/',
        classes=classes,
        ann_file='/content/mmdetection/plumCOCO/test.json'))

evaluation = dict(interval=1, metric='bbox', save_best='bbox_mAP')

runner = dict(type='EpochBasedRunner', max_epochs=100)

# We can use the pre-trained Mask RCNN model to obtain higher performance
load_from = 'checkpoints/atss_r101_fpn_1x_20200825-dfcadd6f.pth'

# resume_from = '/content/mmdetection/work_dirs/plum/epoch_204.pth'