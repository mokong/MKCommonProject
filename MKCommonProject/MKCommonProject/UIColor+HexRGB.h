//
//  UIColor+HexRGB.h
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexRGB)

/**
 *  @brief 根据颜色码返回颜色对象
 *
 *  @param hexString 颜色码
 *
 *  @return 颜色对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

@end
