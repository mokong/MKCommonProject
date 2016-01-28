//
//  UIColor+HexRGB.m
//  MKCommonProject
//
//  Created by mokong on 16/1/28.
//  Copyright © 2016年 mokong. All rights reserved.
//

#import "UIColor+HexRGB.h"

@implementation UIColor (HexRGB)

#define Default_Void_Color [UIColor whiteColor]

#pragma mark - Category Utils

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    if (nil != hexString) {
        
        NSString *cString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if (cString.length != 6) {
            return Default_Void_Color;
        }
        if ([cString hasPrefix:@"#"]) {
            cString = [cString substringFromIndex:1];
        }
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        return [UIColor colorWithRed:((float)r/255.0f)
                               green:((float)g/255.0f)
                                blue:((float)b/255.0f)
                               alpha:1.0];
    }
    return Default_Void_Color;
}

@end
