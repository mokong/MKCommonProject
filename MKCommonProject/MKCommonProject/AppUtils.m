
//
//  AppUtils.m
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

#pragma mark - SystemUtils
+ (void)alertWithMessage:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:@"取消", nil];
    [alert show];
}

+ (void)dismissKeyboard {
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

#pragma mark - NSString Utils
+ (NSString *)emptyStringFromNullOrNil:(NSString *)inputStr {
    if ([inputStr isEqual:[NSNull null]] || nil == inputStr) {
        inputStr = @"";
    }
    return inputStr;
}

#pragma mark - UILabel Utils
+ (void)addLineSpace:(CGFloat)lineSpace toLabel:(UILabel *)targetLabel {
    NSMutableAttributedString *mutableAttributedStr = [[NSMutableAttributedString alloc] initWithString:targetLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [mutableAttributedStr addAttributes:@{NSParagraphStyleAttributeName:paragraphStyle} range:NSMakeRange(0, targetLabel.text.length)];
    targetLabel.attributedText = mutableAttributedStr;
}

#pragma mark - SVProgressHUD Utils
+ (BOOL)isHUDVisible {
    return [SVProgressHUD isVisible];
}

+ (void)showProgressHUDWithMessage:(NSString *)msg {
    [SVProgressHUD showWithStatus:msg];
}

+ (void)showSuccessHUDWithMessage:(NSString *)msg {
    [SVProgressHUD showSuccessWithStatus:msg];
}

+ (void)showErrorHUDWithMessage:(NSString *)msg {
    [SVProgressHUD showErrorWithStatus:msg];
}

+ (void)dismissHUD {
    [SVProgressHUD dismiss];
}

#pragma mark - NSDate Utils
+ (NSString *)stringFromDate:(NSDate *)tempDate formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter stringFromDate:tempDate];
}

+ (NSDate *)dateFromString:(NSString *)tempString formatter:(NSString *)formatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = formatter;
    return [dateFormatter dateFromString:tempString];
}


#pragma mark - Verify Utils

+ (BOOL)validateMobile:(NSString *)phoneNumber {
    // 手机号以13/15/17/18开头，八个\d数字
    NSString *phoneRegex = @"^((13[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phoneNumber];
}

@end
