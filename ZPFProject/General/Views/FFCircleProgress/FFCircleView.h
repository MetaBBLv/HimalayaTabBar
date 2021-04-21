//
//  FFCircleView.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFCircleView : UIView

/** 进度*/
@property (nonatomic, assign) float progress;
/** 圆环宽度*/
@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)initWithFrame:(CGRect)frame LineWidth:(CGFloat)lineWidth;
@end

NS_ASSUME_NONNULL_END
