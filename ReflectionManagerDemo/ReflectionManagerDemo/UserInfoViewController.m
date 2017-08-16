//
//  UserInfoViewController.m
//  ReflectionManagerDemo
//
//  Created by uzone on 2017/8/16.
//  Copyright © 2017年 uzone. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
}
- (void)refreshUserInformation {
    NSLog(@"User Name : %@, User Age : %ld", self.name, [self.age integerValue]);
}

@end
