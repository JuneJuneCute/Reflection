//
//  AppDelegate.m
//  ReflectionManagerDemo
//
//  Created by uzone on 2017/8/16.
//  Copyright © 2017年 uzone. All rights reserved.
//

#import "AppDelegate.h"

#import "ReflectionManager.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.naviController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.window.rootViewController = self.naviController;
    [self.window makeKeyAndVisible];
    
    //模拟远程调用，延迟十秒
    [self testRemoteNotification];
    return YES;
}

- (void)testRemoteNotification {
    //模拟远程通知的调用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *dict = @{
                //类名
                @"className":@"UserInfoViewController",
                // 数据参数
                @"propertys":@{@"name": @"zhangsan",@"age": @18},
                // 调用方法名
                @"method":@"refreshUserInformation"};
        [self application:[UIApplication sharedApplication] didReceiveRemoteNotification:dict fetchCompletionHandler:^(UIBackgroundFetchResult result) {
            
        }];
        
    });
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [ReflectionManager pushWithDictionary:userInfo WithNavController:self.naviController];
    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - ----- Setter && Getter ------

- (ViewController *)viewController {
    if (!_viewController) {
        _viewController = [[ViewController alloc] init];
    }
    return (id)_viewController;
}

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _window;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
