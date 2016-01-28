//
//  AppUtils.h
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtils : NSObject

/******************** SystemUtils ********************/

/**
*  @brief 提示框,内容是msg
*
*  @param msg 提示框内容
*/
+ (void)alertWithMessage:(NSString *)msg;


/**
 *  @brief 关闭键盘
 */
+ (void)dismissKeyboard;


/******************** NSString Utils ********************/

/**
 *  @brief 去除nil和Null字符
 *
 *  @param inputStr 要转换的字符串
 *
 *  @return 转换后的字符串
 */
+ (NSString *)emptyStringFromNullOrNil:(NSString *)inputStr;


/******************** UILabel Utils ********************/

/**
 *  @breif label添加行间距
 *
 *  @param lineSpace   行间距
 *  @param targetLabel label
 */
+ (void)addLineSpace:(CGFloat)lineSpace
             toLabel:(UILabel *)targetLabel;


/******************** SVProgressHUD Utils ********************/

/**
 *  HUD是否正在显示
 *
 *  @return YES／NO
 */
+ (BOOL)isHUDVisible;

/**
 *  HUD正在加载, 提示文字msg
 *
 *  @param msg 提示msg
 */
+ (void)showProgressHUDWithMessage:(NSString *)msg;

/**
 *  HUD加载成功, 提示文字msg
 *
 *  @param msg 提示msg
 */
+ (void)showSuccessHUDWithMessage:(NSString *)msg;

/**
 *  HUD加载失败, 提示文字msg
 *
 *  @param msg 提示msg
 */
+ (void)showErrorHUDWithMessage:(NSString *)msg;

/**
 *  关闭HUD
 */
+ (void)dismissHUD;


/******************** NSDate Utils ********************/

/**
 *  根据foramtter将date转为string
 *
 *  @param tempDate  要转换的date
 *  @param formatter formatter
 *
 *  @return 转换的结果
 */
+ (NSString *)stringFromDate:(NSDate *)tempDate formatter:(NSString *)formatter;

/**
 *  根据formatter将string转为date
 *
 *  @param tempString 要转换的string
 *  @param formatter  formatter
 *
 *  @return 转换的结果
 */
+ (NSDate *)dateFromString:(NSString *)tempString formatter:(NSString *)formatter;


/******************** Veriry Utils ********************/

/**
 *  判断手机号是否合法
 *
 *  @param phoneNumber 手机号
 *
 *  @return 返回结果
 */
+ (BOOL)validateMobile:(NSString *)phoneNumber;


@end
