//
//  ViewController.m
//  CYSDKDemo
//
//  Created by 陈玉 on 18/2/23.
//  Copyright © 2018年 陈玉. All rights reserved.
//

#import "ViewController.h"
#import <CYSdkManager/CYSdkManager.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self layoutSubViews];
}

- (void)layoutSubViews {
    
    UIButton *getCardInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    getCardInfoBtn.frame = CGRectMake(50, 190, self.view.frame.size.width-2*50, 100);
    getCardInfoBtn.backgroundColor = [UIColor grayColor];
    getCardInfoBtn.titleLabel.numberOfLines = 0;
    [getCardInfoBtn setTitle:@"调用SDK工程中读取信息接口(共用第三方demo的AFN库)" forState:UIControlStateNormal];
    [getCardInfoBtn addTarget:self action:@selector(onGetCardInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:getCardInfoBtn];
    
    
    UIButton *getInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    getInfoBtn.frame = CGRectMake(50, 350, self.view.frame.size.width-2*50, 100);
    getInfoBtn.backgroundColor = [UIColor grayColor];
    getInfoBtn.titleLabel.numberOfLines = 0;
    [getInfoBtn setTitle:@"第三方demo中自己请求接口(用自己demo工程中AFN库)" forState:UIControlStateNormal];
    [getInfoBtn addTarget:self action:@selector(onGetInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:getInfoBtn];
}

- (void)onGetCardInfoBtnClick {
    
    [[CYSdkManager sharedCYSdkManager] queryMessageWithCardNo:@"" success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"responseObject===%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"error==%@",error);
    }];
    
}

- (void)onGetInfoBtnClick {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"第三方demo中自己调用接口responseObject===%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"第三方demo中自己调用接口error==%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
