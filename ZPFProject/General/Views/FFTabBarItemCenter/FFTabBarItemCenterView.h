//
//  FFTabBarItemCenterView.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FFProgressView.h"

NS_ASSUME_NONNULL_BEGIN

/**
 自定义TabBarCenter类
 */
@interface FFTabBarItemCenterView : UIView
/** 背景View*/
@property (nonatomic, strong) UIView *backGroundView;
/** 音频播放进度条*/
@property (nonatomic, strong) FFProgressView *ffProgressView;;
/** 播放封面*/
@property (nonatomic, strong) UIImageView *coverImageiView;
/** 播放按钮*/
@property (nonatomic, strong) UIButton *playBtn;
/** 播放进度百分比*/
@property (nonatomic, assign) float progress;
@end

NS_ASSUME_NONNULL_END
