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
    // 根据字典字段反射出我们想要的类，并初始化控制器
    Class class = NSClassFromString(dict[@"className"]);
    UIViewController *vc = [[class alloc] init];
      // 获取参数列表，使用枚举的方式，对控制器属性进行KVC赋值
    NSDictionary *properties = dict[@"propertys"];
    [properties enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         // 在属性赋值时，做容错处理，防止因为后台数据导致的异常
        [vc setValue:obj forKey:key];
    }];
      // 从字典中获取方法名，并调用对应的方法
    SEL selector = NSSelectorFromString(dict[@"method"]);
    // 如果想消除黄色警告，可以通过clang编译指令消除
    [vc performSelector:selector];
    [navController pushViewController:vc animated:YES];
}
@end
