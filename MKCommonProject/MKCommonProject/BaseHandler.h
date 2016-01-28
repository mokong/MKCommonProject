//
//  BaseHandler.h
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief handler成功的回调，回调无数据
 */
typedef void (^SuccessBlock)();


/**
 *  @brief handler成功后的回调，回调带有数据
 */
typedef void (^SuccessResponseBlock)(id response);


/**
 *  @brief handler失败后的回调
 *
 */
typedef void (^FailureBlock)();


@interface BaseHandler : NSObject



@end
