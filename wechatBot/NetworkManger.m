//
//  NetworkManger.m
//  wechatBot
//
//  Created by Homosum on 17/5/1.
//  Copyright © 2017年 homosum. All rights reserved.
//

#import "NetworkManger.h"
#import <AFNetworking.h>
#define URL_BOT @"http://www.tuling123.com/openapi/api"
@implementation NetworkManger{
    AFHTTPRequestOperationManager*manger;
    AFHTTPRequestOperationManager*manager_ad;
}
+(NetworkManger*)sharedInstance
{
    static dispatch_once_t onceToken;
    static NetworkManger*sSharedInstance;
    dispatch_once(&onceToken, ^{
        sSharedInstance=[[NetworkManger alloc]init];
    });
    return sSharedInstance;
}
-(id)init
{
    if (self =[super init]) {
        manger=[[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@""]];
        manger.requestSerializer=[AFHTTPRequestSerializer serializer];
        [manger.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manger.requestSerializer.timeoutInterval = 60.f;
        [manger.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    }
    return self;
}
- (void)catchResponseWithRespond:(id)respond
                       operation:(AFHTTPRequestOperation *)operation
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    
    success(operation,respond);
    
}
-(void)getLoginImgWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure andKey:(NSString*)key
{
    NSMutableDictionary*dict=[NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:key forKey:@"key"];
    [dict setObject:@"你妈妈是谁" forKey:@"info"];
    [dict setObject:@"98765" forKey:@"userid"];
    [manger POST:URL_BOT parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //
        [self catchResponseWithRespond:responseObject operation:operation success:success failure:failure];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        //
    }];
}

@end
