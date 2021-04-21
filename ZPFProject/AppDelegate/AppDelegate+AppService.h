//
//  AppDelegate+AppService.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/29.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN
/**
 包含第三方 和 应用内业务的实现，减轻入口代码压力
 */
@interface AppDelegate (AppService)
    
    /** 初始化服务*/
    - (void)initService;
    
    /** 初始化Window*/
    - (void)initWindow;
    
    //单例
    + (AppDelegate *)shareAppDelegate;

@end

NS_ASSUME_NONNULL_END
