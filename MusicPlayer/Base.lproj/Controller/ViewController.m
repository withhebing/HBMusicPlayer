//
//  ViewController.m
//  MusicPlayer
//
//  Created by Beans on 16/7/17.
//  Copyright © 2016年 iceWorks. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
#pragma mark - H&V
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLbl;
@property (weak, nonatomic) IBOutlet UILabel *durationLbl;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lyricLbls;

#pragma mark - H
@property (weak, nonatomic) IBOutlet UIView *hCenterView;
@property (weak, nonatomic) IBOutlet UIImageView *hSingerIcon;

#pragma mark - V
@property (weak, nonatomic) IBOutlet UIView *vCenterView;
@property (weak, nonatomic) IBOutlet UIImageView *vSingerIcon;
@property (weak, nonatomic) IBOutlet UILabel *singerLbl;
@property (weak, nonatomic) IBOutlet UILabel *albumLbl;

#pragma mark - 私有属性

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 毛玻璃效果
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleBlack;
    [self.bgImageView addSubview:toolbar];  // 添加在bgImageView, 只让背景图毛玻璃效果, 否则所有的
    [toolbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.bgImageView);
    }];

    // 2. 切圆角
    self.vSingerIcon.layer.cornerRadius = self.vSingerIcon.bounds.size.width * 0.5;
    self.vSingerIcon.layer.masksToBounds = YES;
}

- (IBAction)play {
}

- (IBAction)previous {
}

- (IBAction)next {
}

- (IBAction)sliderValueChange {
}

@end
