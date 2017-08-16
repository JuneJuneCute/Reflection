//
//  ReflectionManager.m
//  ReflectionManagerDemo
//
//  Created by uzone on 2017/8/16.
//  Copyright © 2017年 uzone. All rights reserved.
//

#import "ReflectionManager.h"

@implementation ReflectionManager
+ (void)pushWithDictionary:(NSDictionary *)dict WithNavController:(UINavigationController *)navController {
    Class class = NSClassFromString(dict[@"className"]);
    UIViewController *vc = [[class alloc] init];
    NSDictionary *properties = dict[@"properties"];
    [properties enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //如果没有这个字段obj为nil，让它报错好了，这样就知道问题出在哪了
        [vc setValue:obj forKey:key];
    }];
    SEL selector = NSSelectorFromString(dict[@"method"]);
    [vc performSelector:selector];
    [navController pushViewController:vc animated:YES];
}
@end
