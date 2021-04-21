//
//  ZPFMineViewController.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/27.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import "ZPFMineViewController.h"
#import "FFMineHeaderView.h"

@interface ZPFMineViewController ()
@property (nonatomic, strong) FFMineHeaderView *headerView;
@end

@implementation ZPFMineViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - Setup View / Data

- (void)setUpUI {
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_message_n"] style:UIBarButtonItemStyleDone target:self action:@selector(didMessageAction)];
    UIBarButtonItem *QRCode = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"me_qr_code"] style:UIBarButtonItemStyleDone target:self action:@selector(didQRCodeAction)];
    UIBarButtonItem *setting = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"meSetNor"] style:UIBarButtonItemStyleDone target:self action:@selector(didSettingAction)];
    self.navigationItem.rightBarButtonItems = @[QRCode,setting];
    
    [self.view addSubview:self.headerView];
    
}

- (void)loadData {

}

#pragma mark - Observer

#pragma mark - Notification

#pragma mark - Event Response

#pragma mark - Override Methods

#pragma mark - Delegate

#pragma mark - Public Methods

#pragma mark - Private Methods
///消息中心
- (void)didMessageAction {
    
}

///我的二维码
- (void)didQRCodeAction {
    
}

///设置
- (void)didSettingAction {
    
}

#pragma mark - Setter / Getter
- (FFMineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[FFMineHeaderView alloc] initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 50/WIDTH_6_SCALE)];
    }
    return _headerView;
}
#pragma mark - Network

@end
