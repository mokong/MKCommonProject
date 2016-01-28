//
//  MKHttpClient.h
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

// HTTP REQUEST METHOD TYPE
typedef NS_ENUM(NSInteger, MKHttpRequestType) {
    MKHttpRequestTypeGet,
    MKHttpRequestTypePost,
    MKHttpRequestTypeDelete,
    MKHttpRequestTypePut,
};

/**
 *  @brief 请求开始前预处理的回调
 */
typedef void (^PrepareExecuteBlock)(void);

/****************** MKHttpClient *****************/
@interface MKHttpClient : NSObject

+ (MKHttpClient *)defaultClient;

/**
 *  @brief HTTP请求(GET/POST/DELETE/PUT)
 *
 *  @param url            接口前缀
 *  @param method         请求类型
 *  @param parameters     请求参数
 *  @param prepareExecute 预处理回调
 *  @param success        请求成功回调
 *  @param failure        请求失败回调
 */
- (void)requestWithPath:(NSString *)url
                 method:(NSInteger)method
             parameters:(id)parameters
         prepareExecute:(PrepareExecuteBlock)prepareExecute
                success:(void (^)(NSURLSessionDataTask *task, id response))success
                failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  @brief HTTP请求head
 *
 *  @param url        path
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
- (void)requsetWithPathInHead:(NSString *)url
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *task))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
