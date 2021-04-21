//
//  ZPFHomeViewController.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/27.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import "ZPFHomeViewController.h"
#import "FFTabBarItemCenterView.h"

@interface ZPFHomeViewController ()
@property (nonatomic, strong) FFTabBarItemCenterView *tabBarItemCenterView;
@end

@implementation ZPFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view addSubview:self.tabBarItemCenterView];
//    NSLog(@"%ld///%ld",(long)[PlayManager sharedPlayManager].playProgress,(long)[PlayManager sharedPlayManager].audioTime);
}

//- (FFTabBarItemCenterView *)tabBarItemCenterView{
//    if (!_tabBarItemCenterView) {
//        _tabBarItemCenterView = [[FFTabBarItemCenterView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
//        _tabBarItemCenterView.backgroundColor = [UIColor lightGrayColor];
//        _tabBarItemCenterView.center = self.view.center;
//    }
//    return _tabBarItemCenterView;
//}
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"didStartProgressAction" object:@(100)];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"didStartCoverImageRotationAction" object:@(10)];
////    [PlayManager sharedPlayManager].playProgress = 50;
////    [PlayManager sharedPlayManager].audioTime = 100;
//    NSLog(@"===%ld///%ld",(long)[PlayManager sharedPlayManager].playProgress,(long)[PlayManager sharedPlayManager].audioTime);
//}

@end
