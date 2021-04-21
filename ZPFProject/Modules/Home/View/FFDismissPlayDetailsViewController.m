//
//  FFDismissPlayDetailsViewController.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2019/1/30.
//  Copyright © 2019 周鹏飞. All rights reserved.
//

#import "FFDismissPlayDetailsViewController.h"

@interface FFDismissPlayDetailsViewController ()

@end

@implementation FFDismissPlayDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    backBtn.backgroundColor = [UIColor redColor];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    UIButton *pauseBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 100, 100, 100)];
    pauseBtn.backgroundColor = [UIColor grayColor];
    [pauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    pauseBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    [pauseBtn addTarget:self action:@selector(pauseAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseBtn];
}

- (void)backAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pauseAction{
    
}


@end
