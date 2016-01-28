//
//  MKHttpClient.m
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import "MKHttpClient.h"
#import <Reachability.h>
#import <netinet/in.h>
#import "MKJSONResponseSerializerWithData.h"

@interface MKHttpClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation MKHttpClient

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sessionManager = [AFHTTPSessionManager manager];
        // 响应结果的序列话类型
        self.sessionManager.responseSerializer = [MKJSONResponseSerializerWithData serializer];
    }
    return self;
}

+ (MKHttpClient *)defaultClient {
    static MKHttpClient *defaultClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultClient = [[MKHttpClient alloc] init];
    });
    return defaultClient;
}

- (void)requestWithPath:(NSString *)url
                 method:(NSInteger)method
             parameters:(id)parameters
         prepareExecute:(PrepareExecuteBlock)prepareExecute
                success:(void (^)(NSURLSessionDataTask *, id))success
                failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    // 请求的URL
    DLog(@"requsetPath: %@", url);
    
    // 判断网络状况（有链接：执行请求；无链接：弹出提示，同时发出通知）
    if ([self isConnectionAvailable]) {
        // 预处理（显示加载信息...）
        if (prepareExecute) {
            prepareExecute();
        }
        
        switch (method) {
            case MKHttpRequestTypeGet:
            {
                [self.sessionManager GET:url parameters:parameters progress:nil success:success failure:failure];
            }
                break;
            case MKHttpRequestTypePost:
            {
                [self.sessionManager POST:url parameters:parameters progress:nil success:success failure:failure];
            }
                break;
            case MKHttpRequestTypeDelete:
            {
                [self.sessionManager DELETE:url parameters:parameters success:success failure:failure];
            }
                break;
            case MKHttpRequestTypePut:
            {
                [self.sessionManager PUT:url parameters:parameters success:success failure:failure];
            }
                break;
  
            default:
                break;
        }
    }
    else {
        // 网络错误
        [self showExceptionDialog];
        
        // 发出网络异常通知
        [[NSNotificationCenter defaultCenter] postNotificationName:k_Noti_Network_Error object:nil];
    }
}

- (void)requsetWithPathInHead:(NSString *)url
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask *))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    if ([self isConnectionAvailable]) {
        [self.sessionManager HEAD:url
                       parameters:parameters
                          success:success
                          failure:failure];
    }
    else {
        // 网络错误
        [self showExceptionDialog];
        
        // 发出网络异常通知
        [[NSNotificationCenter defaultCenter] postNotificationName:k_Noti_Network_Error object:nil];
    }
}

// 检查网络是否链接
- (BOOL)isConnectionAvailable {
    // Creat zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        DLog(@"Error. Could not recover network reachability flags");
        return NO;
    }
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

// 网络错误提示
- (void)showExceptionDialog {
    [[[UIAlertView alloc] initWithTitle:@"提示"
                                message:@"网络异常，请检查网络链接"
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil, nil] show];
}
         
@end
