//
//  UtilMacros.h
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/29.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#ifndef UtilMacros_h
#define UtilMacros_h


//屏幕宽高
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

/**iphone X 导航栏 */
#define SafeAreaTopHeight (SCREEN_HEIGHT == 812.0 ? 88 : 64)
/**iphone X tabbar底部 */
#define SafeAreaBottomHeight (SCREEN_HEIGHT == 812.0 ? 34 : 0)
/**iphone X 顶部状态栏高度 */
#define SafeAreaTopStateHeight (SCREEN_HEIGHT == 812.0 ? 44 : 20)

//5S宽高比例
#define WIDTH_5S_SCALE 320.0 * [UIScreen mainScreen].bounds.size.width
#define HEIGHT_5S_SCALE 568.0 * [UIScreen mainScreen].bounds.size.height

//6宽高比例
#define WIDTH_6_SCALE 375.0 * [UIScreen mainScreen].bounds.size.width
#define HEIGHT_6_SCALE 667.0 * [UIScreen mainScreen].bounds.size.width

//强弱引用
#define kWeakSelf(type) __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}


#endif /* UtilMacros_h */
