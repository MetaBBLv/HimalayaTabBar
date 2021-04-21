//
//  FFTabBarItemCenterView.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import "FFTabBarItemCenterView.h"
//#import "FFProgressView.h"

@interface FFTabBarItemCenterView ()
//{
//    FFProgressView *_ffProgressView;
//}
@end

@implementation FFTabBarItemCenterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.ffProgressView];
    }
    return self;
}


#pragma mark - Lazy Loading
- (FFProgressView *)ffProgressView{
    if (!_ffProgressView) {
        CGFloat margin = 19.0f;
        CGFloat circleWidth = self.bounds.size.width - 2 * margin;
        _ffProgressView = [[FFProgressView alloc] initWithFrame:CGRectMake(0, 0, circleWidth, circleWidth)];
        _ffProgressView.center = CGPointMake(self.center.x, self.center.y + 1);
    }
    return _ffProgressView;
}

- (void)setProgress:(float)progress{
    _progress = progress;
    _ffProgressView.progress = progress;
}
@end
