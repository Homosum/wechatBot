//
//  NetworkManger.h
//  wechatBot
//
//  Created by Homosum on 17/5/1.
//  Copyright © 2017年 homosum. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperation.h>
@protocol NetworkMangerDelegate <NSObject>

-(void)failedLoading;

@end
#import <Foundation/Foundation.h>

@interface NetworkManger : NSObject
@property(nonatomic,weak)id delegate;
+(instancetype)sharedInstance;
-(void)getLoginImgWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                      failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure andKey:(NSString*)key;
@end
