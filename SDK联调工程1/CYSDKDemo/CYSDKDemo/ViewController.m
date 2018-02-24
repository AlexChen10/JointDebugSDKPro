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
    
    getCardInfoBtn.frame = CGRectMake(100, 190, self.view.frame.size.width-2*100, 50);
    getCardInfoBtn.backgroundColor = [UIColor grayColor];
    [getCardInfoBtn setTitle:@"读取信息" forState:UIControlStateNormal];
    [getCardInfoBtn addTarget:self action:@selector(onGetCardInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:getCardInfoBtn];
}

- (void)onGetCardInfoBtnClick {
    
    [[CYSdkManager sharedCYSdkManager] queryMessageWithCardNo:@"" success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"responseObject===%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"error==%@",error);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
