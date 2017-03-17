//
//  ViewController.m
//  YMKeyboard
//
//  Created by 刘彦铭 on 2017/3/17.
//  Copyright © 2017年 刘彦铭. All rights reserved.
//

#import "ViewController.h"

#import "YMKeyboardView.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YMKeyboardView *keyboardView =  [[YMKeyboardView alloc] init];
    
    [keyboardView show];
    
    NSLog(@"%p", keyboardView);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
