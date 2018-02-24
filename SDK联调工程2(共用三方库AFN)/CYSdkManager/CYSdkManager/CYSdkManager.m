//
//  CYSdkManager.m
//  CYSdkManager
//
//  Created by 陈玉 on 18/2/23.
//  Copyright © 2018年 陈玉. All rights reserved.
//

#import "CYSdkManager.h"

@implementation CYSdkManager

+ (CYSdkManager *)sharedCYSdkManager {

    static CYSdkManager *_shareClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
    
        _shareClient = [[CYSdkManager alloc]init];
    });
    
    return _shareClient;
    
}

- (void)queryMessageWithCardNo:(NSString *)cardNo success:(SucessBlock)success failure:(FailureBlock)failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(task,error);
        
    }];
}

@end
