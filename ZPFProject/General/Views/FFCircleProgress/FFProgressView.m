//
//  FFProgressView.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import "FFProgressView.h"
#import "FFCircleView.h"

@interface FFProgressView ()
{
    FFCircleView *_ffCircleView;
    UILabel *_percentLabel;  //百分比
    UIImageView *_coverImageView;   //封面View
    UIImageView *_playImageView;    //播放按钮图片
}
@end

@implementation FFProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
        //点击播放监听
        [[NSNotificationCenter defaultCenter] addObserverForName:kNotificationPlayAudioStart object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification * _Nonnull note) {
            
            //添加圆环进度动画
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            animation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
            animation.duration = 5.0f;
            animation.cumulative = NO;
            animation.repeatCount = HUGE_VALF;
            animation.removedOnCompletion = NO;
            [self->_coverImageView.layer addAnimation:animation forKey:@"rotationAnimation"];
        }];
        //播放完成监听
        [[NSNotificationCenter defaultCenter] addObserverForName:kNotificationPlayAudioFinish object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification * _Nonnull note) {
            [self->_coverImageView.layer removeAllAnimations];
            self->_playImageView.hidden = NO;
            self->_coverImageView.alpha = 0.5;
        }];
    }
    return self;
}

#pragma mark - 初始化UI
- (void)setUpUI{
    float lineWidth = 0.11 * self.bounds.size.width;
//    _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
//    _percentLabel.text = @"0%";
//    _percentLabel.textColor = [UIColor whiteColor];
//    _percentLabel.textAlignment = NSTextAlignmentCenter;
//    _percentLabel.font = [UIFont systemFontOfSize:50];
//    [self addSubview:_percentLabel];
    
    _ffCircleView = [[FFCircleView alloc] initWithFrame:self.bounds LineWidth:lineWidth / 2];
    [self addSubview:_ffCircleView];
    
    _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width - lineWidth, self.bounds.size.width - lineWidth)];
    _coverImageView.userInteractionEnabled = YES;
    _coverImageView.center = self.center;
    _coverImageView.layer.cornerRadius = _coverImageView.bounds.size.width / 2;
    _coverImageView.layer.masksToBounds = YES;
    _coverImageView.image = [UIImage imageNamed:@"other_cover"];
    _coverImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_coverImageView];
    UITapGestureRecognizer *detailTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapBarCenterPopUpDetailAction)];
    [_coverImageView addGestureRecognizer:detailTap];
    
    _coverImageView.alpha = 0.5;
    _playImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    _playImageView.userInteractionEnabled = YES;
    _playImageView.center = CGPointMake(self.bounds.size.width / 2 + 2, self.bounds.size.width / 2);
    _playImageView.contentMode = UIViewContentModeScaleAspectFit;
    _playImageView.image = [UIImage imageNamed:@"play_h_50x50_"];
    [self addSubview:_playImageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTabBarCenterPlayAction)];
    [_playImageView addGestureRecognizer:tap];
    
    
}

#pragma mark - setter方法
- (void)setProgress:(float)progress{
    _progress = progress;
    _ffCircleView.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
}

#pragma mark - events Handing
- (void)didTabBarCenterPlayAction{
    _coverImageView.alpha = 1;
    _playImageView.hidden = YES;
    if ([self respondsToSelector:@selector(tabBarCenterPlayBlock)]) {
        self.tabBarCenterPlayBlock();
    }
}

- (void)didTapBarCenterPopUpDetailAction{
    if ([self respondsToSelector:@selector(tabBarCenterPopUpDetailBlock)]) {
        self.tabBarCenterPopUpDetailBlock();
    }
}
@end
