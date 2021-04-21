//
//  FFTabBarViewController.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/28.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import "FFTabBarViewController.h"
#import "FFTabBar.h"
#import "FFNavigationViewController.h"
#import "ZPFHomeViewController.h"
#import "ZPFListenViewController.h"
#import "ZPFFoundViewController.h"
#import "ZPFMineViewController.h"

@interface FFTabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) NSMutableArray *ffViewControllers;

@property (nonatomic, copy) NSArray<UIImage *> *homeImageArray;
@property (nonatomic, copy) NSArray<UIImage *> *listenImageArray;
@property (nonatomic, copy) NSArray<UIImage *> *foundImageArray;
@property (nonatomic, copy) NSArray<UIImage *> *mineImageArray;

@property (nonatomic, strong) UIImageView *animationImageView;

@end

@implementation FFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    //初始化TabBar
    [self setUpTabBar];
    //添加全部的childViewController
    [self setUpAllChildViewController];
}

#pragma mark - 初始化TabBar
- (void)setUpTabBar{
    //利用KVO来使用自定义的tabBar
    [self setValue:[[FFTabBar alloc] init] forKey:@"tabBar"];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage new]];
    //1.去掉UITabBarController上面的黑色线条
    self.tabBar.barStyle = UIBarStyleBlack;
    //2.设置UITabBarController的颜色
    [UITabBar appearance].translucent = NO;
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    //3.设置阴影
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
    self.tabBar.layer.shadowOpacity = 0.3;
    
}

#pragma mark - 初始化ViewController
- (void)setUpAllChildViewController{
    _ffViewControllers = @[].mutableCopy;
    _homeVc = [[ZPFHomeViewController alloc] init];
    [self addChildViewController:_homeVc title:@"首页" imageName:@"tab_home_1_33x25_" selectImageName:@"tab_home_15_33x25_"];
    _linstenVc = [[ZPFListenViewController alloc] init];
    [self addChildViewController:_linstenVc title:@"我听" imageName:@"tab_hear_1_33x25_" selectImageName:@"tab_hear_15_33x25_"];
    _foundVc = [[ZPFFoundViewController alloc] init];
    [self addChildViewController:_foundVc title:@"发现" imageName:@"tab_find_1_33x25_" selectImageName:@"tab_find_15_33x25_"];
    _mineVc = [[ZPFMineViewController alloc] init];
    [self addChildViewController:_mineVc title:@"账户" imageName:@"tab_me_1_33x25_" selectImageName:@"tab_me_15_33x25_"];
    
    self.viewControllers = _ffViewControllers;
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{
    childController.title = title;
    //未选中图片
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //未选中字体的颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:FFLightFontColor,NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} forState:UIControlStateNormal];
    //选中字体颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:FFMainColor,NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} forState:UIControlStateSelected];
    //包装导航h控制器
    FFNavigationViewController *navigation = [[FFNavigationViewController alloc] initWithRootViewController:childController];
    [_ffViewControllers addObject:navigation];
}

#pragma mark UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    NSInteger index = [tabBar.items indexOfObject:item];
    if (index == self.selectedIndex) {
        return;
    }
    [self animationWithIndex:index];
}

- (void)animationWithIndex:(NSInteger)index {
    
    NSMutableArray *animationObjects = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIImageView *tabBarSwappableImageView in tabBarButton.subviews) {
                if ([tabBarSwappableImageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [animationObjects addObject:tabBarSwappableImageView];
                }
            }
        }
    }
    
    UIImageView *viewObject = [animationObjects objectAtIndex:index];
    [self bounceAnimationWithAnimationObjects:viewObject index:index];
}

- (void)bounceAnimationWithAnimationObjects:(UIImageView *)viewObject index:(NSInteger)index {
    
    switch (index) {
        case 0:
        {
            viewObject.animationImages = self.homeImageArray;
        }
            break;
        case 1:
        {
            viewObject.animationImages = self.listenImageArray;
        }
            break;
        case 2:
        {
            viewObject.animationImages = self.foundImageArray;
        }
            break;
        case 3:
        {
            viewObject.animationImages = self.mineImageArray;
        }
            break;
    }
    viewObject.animationDuration = 0.5f;
    viewObject.animationRepeatCount = 1;
    [viewObject startAnimating];
}

#pragma mark - TabBar帧动画图片设置
- (NSArray<UIImage *> *)homeImageArray{
    if (!_homeImageArray) {
        _homeImageArray = @[[UIImage imageNamed:@"tab_home_1_33x25_"],
                            [UIImage imageNamed:@"tab_home_2_33x25_"],
                            [UIImage imageNamed:@"tab_home_3_33x25_"],
                            [UIImage imageNamed:@"tab_home_4_33x25_"],
                            [UIImage imageNamed:@"tab_home_5_33x25_"],
                            [UIImage imageNamed:@"tab_home_6_33x25_"],
                            [UIImage imageNamed:@"tab_home_7_33x25_"],
                            [UIImage imageNamed:@"tab_home_8_33x25_"],
                            [UIImage imageNamed:@"tab_home_9_33x25_"],
                            [UIImage imageNamed:@"tab_home_10_33x25_"],
                            [UIImage imageNamed:@"tab_home_11_33x25_"],
                            [UIImage imageNamed:@"tab_home_12_33x25_"],
                            [UIImage imageNamed:@"tab_home_13_33x25_"],
                            [UIImage imageNamed:@"tab_home_14_33x25_"],
                            [UIImage imageNamed:@"tab_home_15_33x25_"],
                            ];
    }
    return _homeImageArray;
}

- (NSArray<UIImage *> *)listenImageArray{
    if (!_listenImageArray) {
        _listenImageArray = @[[UIImage imageNamed:@"tab_hear_1_33x25_"],
                              [UIImage imageNamed:@"tab_hear_2_33x25_"],
                              [UIImage imageNamed:@"tab_hear_3_33x25_"],
                              [UIImage imageNamed:@"tab_hear_4_33x25_"],
                              [UIImage imageNamed:@"tab_hear_5_33x25_"],
                              [UIImage imageNamed:@"tab_hear_6_33x25_"],
                              [UIImage imageNamed:@"tab_hear_7_33x25_"],
                              [UIImage imageNamed:@"tab_hear_8_33x25_"],
                              [UIImage imageNamed:@"tab_hear_9_33x25_"],
                              [UIImage imageNamed:@"tab_hear_10_33x25_"],
                              [UIImage imageNamed:@"tab_hear_11_33x25_"],
                              [UIImage imageNamed:@"tab_hear_12_33x25_"],
                              [UIImage imageNamed:@"tab_hear_13_33x25_"],
                              [UIImage imageNamed:@"tab_hear_14_33x25_"],
                              [UIImage imageNamed:@"tab_hear_15_33x25_"],
                              ];
    }
    return _listenImageArray;
}

- (NSArray<UIImage *> *)foundImageArray{
    if (!_foundImageArray) {
        _foundImageArray = @[[UIImage imageNamed:@"tab_find_1_33x25_"],
                             [UIImage imageNamed:@"tab_find_2_33x25_"],
                             [UIImage imageNamed:@"tab_find_3_33x25_"],
                             [UIImage imageNamed:@"tab_find_4_33x25_"],
                             [UIImage imageNamed:@"tab_find_5_33x25_"],
                             [UIImage imageNamed:@"tab_find_6_33x25_"],
                             [UIImage imageNamed:@"tab_find_7_33x25_"],
                             [UIImage imageNamed:@"tab_find_8_33x25_"],
                             [UIImage imageNamed:@"tab_find_9_33x25_"],
                             [UIImage imageNamed:@"tab_find_10_33x25_"],
                             [UIImage imageNamed:@"tab_find_11_33x25_"],
                             [UIImage imageNamed:@"tab_find_12_33x25_"],
                             [UIImage imageNamed:@"tab_find_13_33x25_"],
                             [UIImage imageNamed:@"tab_find_14_33x25_"],
                             [UIImage imageNamed:@"tab_find_15_33x25_"],
                             ];
    }
    return _foundImageArray;
}

- (NSArray<UIImage *> *)mineImageArray{
    if (!_mineImageArray) {
        _mineImageArray = @[[UIImage imageNamed:@"tab_me_1_33x25_"],
                            [UIImage imageNamed:@"tab_me_2_33x25_"],
                            [UIImage imageNamed:@"tab_me_3_33x25_"],
                            [UIImage imageNamed:@"tab_me_4_33x25_"],
                            [UIImage imageNamed:@"tab_me_5_33x25_"],
                            [UIImage imageNamed:@"tab_me_6_33x25_"],
                            [UIImage imageNamed:@"tab_me_7_33x25_"],
                            [UIImage imageNamed:@"tab_me_8_33x25_"],
                            [UIImage imageNamed:@"tab_me_9_33x25_"],
                            [UIImage imageNamed:@"tab_me_10_33x25_"],
                            [UIImage imageNamed:@"tab_me_11_33x25_"],
                            [UIImage imageNamed:@"tab_me_12_33x25_"],
                            [UIImage imageNamed:@"tab_me_13_33x25_"],
                            [UIImage imageNamed:@"tab_me_14_33x25_"],
                            [UIImage imageNamed:@"tab_me_15_33x25_"],
                            ];
    }
    return _mineImageArray;
}

@end
