//
//  MKJSONResponseSerializerWithData.m
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import "MKJSONResponseSerializerWithData.h"

@implementation MKJSONResponseSerializerWithData

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing  _Nullable *)error
{
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (*error != nil) {
            NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
            userInfo[JSONResponseSerializerWithDataKey] = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
            (*error) = newError;
        }
        return nil;
    }
    return [super responseObjectForResponse:response data:data error:error];
}

@end
