//
//  FFTabBar.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/29.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import "FFTabBar.h"
#import "FFTabBarItemCenterView.h"
#import "FFDismissPlayDetailsViewController.h"

@interface FFTabBar ()

@property (nonatomic, strong) UIButton *centerBtn;
@property (nonatomic, strong) FFTabBarItemCenterView *ffTabbarItemcenterView;

@end

@implementation FFTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加中间按钮到TabBar上
        [self addSubview:self.ffTabbarItemcenterView];
    }
    return self;
}

//重新布局TabBarItem
- (void)layoutSubviews{
    [super layoutSubviews];
    //把tabBarButton取出来
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonArray addObject:view];
        }
    }
    
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat centerBtnWidth = CGRectGetWidth(self.ffTabbarItemcenterView.frame);
    CGFloat centerBtnHeight = CGRectGetHeight(self.ffTabbarItemcenterView.frame);
    
    //s设置按钮的中间位置
    self.ffTabbarItemcenterView.center = CGPointMake(barWidth / 2, (barHeight - SafeAreaBottomHeight) / 2);
    //重新布局其他TabBarItem
    //平均分配其他TabBarItem的宽度
    CGFloat barItemWidth = (barWidth - centerBtnWidth) / tabBarButtonArray.count;
    //逐个布局TabBarItem，修改UITabBarButton的frame
    [tabBarButtonArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect frame = view.frame;
        if (idx >= tabBarButtonArray.count / 2) {
            //重新设置x坐标，若果排在中按钮的右边需要加上centerBtn的宽度
            frame.origin.x = idx * barItemWidth + centerBtnWidth;
        } else {
            frame.origin.x = idx *barItemWidth;
        }
        //重新设置宽度
        frame.size.width = barItemWidth;
        view.frame = frame;
    }];
    //把中间按钮放到试图最前面
    [self bringSubviewToFront:self.ffTabbarItemcenterView];
}

#pragma mark - Getter
/** v1版本：
- (UIButton *)centerBtn{
    if (!_centerBtn) {
        _centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        [_centerBtn setImage:[UIImage imageNamed:@"centerIcon"] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(didCenterBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerBtn;
}
 */

- (FFTabBarItemCenterView *)ffTabbarItemcenterView{
    if (!_ffTabbarItemcenterView) {
        _ffTabbarItemcenterView = [[FFTabBarItemCenterView alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        _ffTabbarItemcenterView.progress = [PlayManager sharedPlayManager].playProgress;
        //音频播放
        [_ffTabbarItemcenterView.ffProgressView setTabBarCenterPlayBlock:^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationPlayAudioStart object:@(10)];
            FFDismissPlayDetailsViewController *vc = [[FFDismissPlayDetailsViewController alloc] init];
            // 可以这样获取tabBarController
            id delegate = [UIApplication sharedApplication].delegate;
            UITabBarController *tabBarController = [delegate tabBarController];
            [tabBarController.selectedViewController presentViewController:vc animated:YES completion:nil];
            /** 实验阶段暂时注释
             
             */
        }];
        
        //弹出音频详情
        [_ffTabbarItemcenterView.ffProgressView setTabBarCenterPopUpDetailBlock:^{
            FFDismissPlayDetailsViewController *vc = [[FFDismissPlayDetailsViewController alloc] init];
            // 可以这样获取tabBarController
            id delegate = [UIApplication sharedApplication].delegate;
            UITabBarController *tabBarController = [delegate tabBarController];
            [tabBarController.selectedViewController presentViewController:vc animated:YES completion:nil];
        }];
        
    }
    return _ffTabbarItemcenterView;
}



#pragma mark - Action
/** v1版本：
- (void)didCenterBtnAction:(UIButton *)sender{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"点击了中间的按钮" message:@"do something!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:action];
    // 可以这样获取tabBarController
    id delegate = [UIApplication sharedApplication].delegate;
    UITabBarController *tabBarController = [delegate tabBarController];
    
    [tabBarController.selectedViewController presentViewController:alertController animated:YES completion:nil];
}
*/
@end
