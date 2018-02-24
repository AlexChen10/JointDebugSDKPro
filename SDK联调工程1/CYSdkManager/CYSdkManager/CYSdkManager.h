//
//  CYSdkManager.h
//  CYSdkManager
//
//  Created by 陈玉 on 18/2/23.
//  Copyright © 2018年 陈玉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@interface CYSdkManager : NSObject

typedef void(^SucessBlock)(NSURLSessionDataTask *task, id responseObject);

typedef void(^FailureBlock)(NSURLSessionDataTask *task, NSError *error);

+ (CYSdkManager *)sharedCYSdkManager;

//查询卡信息接口
- (void)queryMessageWithCardNo:(NSString *)cardNo success:(SucessBlock)success failure:(FailureBlock)failure;

@end
