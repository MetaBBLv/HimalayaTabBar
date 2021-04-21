//
//  FFProgressView.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 tabBar中心按钮的点击事件（播放功能）
 */
typedef void(^tabBarCenterPlay)(void);
/**
 tabBar中心按钮的点击事件（弹出音频详情）
 */
typedef void(^tabBarCenterPopUpDetail)(void);

@interface FFProgressView : UIView

/** 进度百分比*/
@property (nonatomic, assign) float progress;

@property (nonatomic, copy) tabBarCenterPlay tabBarCenterPlayBlock;
@property (nonatomic, copy) tabBarCenterPopUpDetail tabBarCenterPopUpDetailBlock;

@end

NS_ASSUME_NONNULL_END
