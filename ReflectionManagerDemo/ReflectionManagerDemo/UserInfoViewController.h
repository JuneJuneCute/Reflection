//
//  UserInfoViewController.h
//  ReflectionManagerDemo
//
//  Created by uzone on 2017/8/16.
//  Copyright © 2017年 uzone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController
/** 用户名 */
@property (nonatomic,strong) NSString *name;
/** 用户年龄 */
@property (nonatomic,strong) NSNumber *age;

/**
 *  使用反射机制反射为SEL后，调用的方法
 */
- (void)refreshUserInformation;
@end
