//
//  PlayInfo.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/31.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlayInfo : NSObject

/** 播放进度*/
@property (nonatomic, assign) NSInteger playProgress;

/**
 最后播放音频的总时长
 */
@property (nonatomic, assign) NSInteger audioTime;

@end

NS_ASSUME_NONNULL_END
