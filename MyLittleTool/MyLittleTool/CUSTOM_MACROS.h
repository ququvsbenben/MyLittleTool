//
//  CUSTOM_MACROS.h
//  MyLittleTool
//
//  Created by QUQU on 16/8/19.
//  Copyright © 2016年 QUQU. All rights reserved.
//

/**
 *  自定义宏
 */
#ifndef CUSTOM_MACROS_h
#define CUSTOM_MACROS_h

//---区分开发和发布环境Log
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


//---

#define kSCREEN_WIDTH               [UIScreen mainScreen].bounds.size.width             //屏幕宽度
#define kSCREEN_HEIGHT              [UIScreen mainScreen].bounds.size.height            //屏幕高度
#define kSCALING                    (1/[UIScreen mainScreen].scale)                     //缩放比例

/** 获取 AppDelegate 对象*/
#define kAPP_DELEGATE               (AppDelegate *)[[UIApplication sharedApplication] delegate]
/** 获取 AppWindow  对象*/
#define kAPP_WINDOW                 [[[UIApplication sharedApplication] delegate] window]

#define kRGB_COLOR(r, g, b)         [UIColor colorWithRed:(r)/255.0                             \
                                    green:(g)/255.0                                             \
                                    blue:(b)/255.0                                              \
                                    alpha:1.0]

#define kLOAD_Xib(xibname)          [[[NSBundle mainBundle] loadNibNamed:xibname                \
                                    owner:self options:nil] lastObject]

#define kALERT(title,msg)           if(msg)[[[UIAlertView alloc] initWithTitle:title            \
                                    message:msg delegate:nil                                    \
                                    cancelButtonTitle:@"确定"                                    \
                                    otherButtonTitles:nil,nil] show]

/** 是否iOS8及以上系统 */
#define IS_iOS_V8                   ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
/** 是否iphone 4 */
#define IS_iPhone4                  (ScreenHeight <= 480)

//---正则检验字符串

/** 检查字符串是否为英文字符串 */
#define IS_ENWORD_STRING(str)       ([[NSPredicate predicateWithFormat:@"SELF MATCHES %@",      \
                                    @"^([a-zA-Z])"] evaluateWithObject:str])
/** 检查字符串是否为数字字符串 */
#define IS_NUMBERI_STRING(str)      ([[NSPredicate predicateWithFormat:@"SELF MATCHES %@",      \
                                    @"^([0-9\\n]+)"] evaluateWithObject:str])
/** 检查字符串是否为英文和数字组成的字符串 */
#define IS_EN_AND_NUM_STRING(str)   ([[NSPredicate predicateWithFormat:@"SELF MATCHES %@",      \
                                    @"^[A-Za-z0-9\\\\s\\n]+$"] evaluateWithObject:str])
/** 检查字符串是否是合法手机号 */
#define IS_MOBILE_STRING(str)       ([[NSPredicate predicateWithFormat:@"SELF MATCHES %@",      \
                                    @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9]))\\d{8}$"]        \
                                    evaluateWithObject:str])

#define StretchableImage(image)     [image resizableImageWithCapInsets:                         \
                                    UIEdgeInsetsMake(image.size.height/2-1,                     \
                                    image.size.width/2-1,                                       \
                                    image.size.height/2-1,                                      \
                                    image.size.width/2-1)]

#define STRINGHASVALUE(str)         (str && [str isKindOfClass:[NSString class]] &&             \
                                    [str stringByTrimmingCharactersInSet:                       \
                                    [NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0)

//---打开URL
#define canOpenURL(appScheme)       ([[UIApplication sharedApplication]                         \
                                    canOpenURL:[NSURL URLWithString:appScheme]])
#define openURL(appScheme)          ([[UIApplication sharedApplication]                         \
                                    openURL:[NSURL URLWithString:appScheme]])

#endif /* CUSTOM_MACROS_h */
