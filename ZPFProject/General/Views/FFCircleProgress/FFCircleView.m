//
//  FFCircleView.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import "FFCircleView.h"

@interface FFCircleView ()<CAAnimationDelegate>
{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_progressLayer;
}

@end

@implementation FFCircleView

- (instancetype)initWithFrame:(CGRect)frame LineWidth:(CGFloat)lineWidth{
    if (self = [super initWithFrame:frame]) {
        _lineWidth = lineWidth;
        //构建圆环
        [self progressUIBuild];
        //点击播放监听
        [[NSNotificationCenter defaultCenter] addObserverForName:kNotificationPlayAudioStart object:nil queue:[NSOperationQueue currentQueue] usingBlock:^(NSNotification * _Nonnull note) {
            //添加圆环进度动画
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
            animation.delegate = self;
            animation.duration = [note.object floatValue];
            animation.fromValue = @(0);
            animation.toValue = @(1);
            animation.repeatCount = 1;
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            [self->_progressLayer addAnimation:animation forKey:@"strokeEndAnimation"];
        }];
        
        
    }
    return self;
}

#pragma mark - 构建圆环
- (void)progressUIBuild{
    float centerX = self.bounds.size.width / 2.0;
    float centerY = self.bounds.size.height / 2.0;
    //半径
    float radius = (self.bounds.size.width - _lineWidth) / 2.0;
    
    //创建贝塞尔曲线路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:radius startAngle:(-0.5f * M_PI) endAngle:1.5f * M_PI clockwise:YES];
    
    
    //添加圆环背景
    CAShapeLayer *backGroundLayer = [CAShapeLayer layer];
    backGroundLayer.frame = self.bounds;
    backGroundLayer.fillColor = [UIColor clearColor].CGColor;
    backGroundLayer.strokeColor = [UIColor colorWithHexString:@"#E4E4E4"].CGColor;
    backGroundLayer.lineWidth = _lineWidth;
    backGroundLayer.path = [path CGPath];
    backGroundLayer.strokeEnd = 1;
    [self.layer addSublayer:backGroundLayer];
    
    //创建进度Layer
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = FFMainColor.CGColor;
    _progressLayer.lineWidth = _lineWidth;
    _progressLayer.lineCap = kCALineCapButt;
    _progressLayer.path = [path CGPath];
    NSLog(@"%ld",(long)[PlayManager sharedPlayManager].playProgress);
    _progressLayer.strokeEnd = [PlayManager sharedPlayManager].playProgress;
    [self.layer addSublayer:_progressLayer];
    
}

- (void)setProgress:(float)progress{
    _progress = progress;
    _progressLayer.strokeEnd = progress;
    [_progressLayer removeAllAnimations];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"动画开始！,%@",anim);
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    if (flag) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationPlayAudioFinish object:nil];
    }
    NSLog(@"核心动画结束!");
}
@end
