//
//  ZPFListenViewController.m
//  ZPFProject
//
//  Created by 周鹏飞 on 2018/12/27.
//  Copyright © 2018年 周鹏飞. All rights reserved.
//

#import "ZPFListenViewController.h"

@interface ZPFListenViewController ()<UIWebViewDelegate>

@end

@implementation ZPFListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createUIWebViewTest {
    // 1.创建webview
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    webView.delegate = self;
    // 2.1 创建一个远程URL
    NSURL *remoteURL = [NSURL URLWithString:@"https://wxpay.wxutil.com/mch/pay/h5.v2.php"];
    
    // 2.2 创建一个本地URL
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"first" ofType:@"html"];
    NSURL *locationURL = [NSURL URLWithString:urlStr];
    
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:remoteURL];
    // 4.加载网页
    [webView loadRequest:request];
    // 5.最后将webView添加到界面
    [self.view addSubview:webView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self createUIWebViewTest];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
    NSString *scheme = [url scheme];
    if ([scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"]) {
        return YES;
    }
    else
    {
        [[UIApplication sharedApplication]openURL:url];
        return NO;
    }
    return YES;
}

@end
