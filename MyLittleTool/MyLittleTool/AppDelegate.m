//
//  AppDelegate.m
//  MyLittleTool
//
//  Created by QUQU on 16/8/19.
//  Copyright © 2016年 QUQU. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)redirectNSlogToDocumentFolder
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    NSString *time = [dateFormatter stringFromDate:[NSDate date]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *basePath = [documentDirectory stringByAppendingString:@"/AppLog"];
    
    //    //
    //    NSString *today = [time substringToIndex:10];
    //    NSString *date = [[NSUserDefaults standardUserDefaults] objectForKey:@"DateKey"];
    //    if (![date isEqualToString:today]) {
    //        [defaultManager removeItemAtPath:basePath error:nil];
    //        [[NSUserDefaults standardUserDefaults] setObject:today forKey:@"DateKey"];
    //        [[NSUserDefaults standardUserDefaults] synchronize];
    //    }
    BOOL isDir = NO;
    BOOL isExist = [defaultManager fileExistsAtPath:basePath isDirectory:&isDir];
    if (isExist == NO || isDir == NO) {
        [defaultManager removeItemAtPath:basePath error:nil];
        [defaultManager createDirectoryAtPath:basePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *fileName = [NSString stringWithFormat:@"%@.log", time];
    NSString *logFilePath = [basePath stringByAppendingPathComponent:fileName];
    NSLog(@"logFilePath==%@", logFilePath);
    // 先删除已经存在的文件
    [defaultManager removeItemAtPath:logFilePath error:nil];
    
    // 将log输入到文件
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
