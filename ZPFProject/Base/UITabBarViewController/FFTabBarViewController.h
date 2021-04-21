//
//  FFTabBarViewController.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/28.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPFHomeViewController;
@class ZPFListenViewController;
@class ZPFFoundViewController;
@class ZPFMineViewController;

NS_ASSUME_NONNULL_BEGIN

@interface FFTabBarViewController : UITabBarController
    
        @property (nonatomic, strong) ZPFHomeViewController *homeVc;
        @property (nonatomic, strong) ZPFListenViewController *linstenVc;
        @property (nonatomic, strong) ZPFFoundViewController *foundVc;
        @property (nonatomic, strong) ZPFMineViewController *mineVc;

@end

NS_ASSUME_NONNULL_END
