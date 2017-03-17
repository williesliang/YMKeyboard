//
//  YMKeyboardBar.m
//  YMKeyboard
//
//  Created by 刘彦铭 on 2017/3/17.
//  Copyright © 2017年 刘彦铭. All rights reserved.
//

#import "YMKeyboardBar.h"

@implementation YMKeyboardBar

+ (instancetype)instanse
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
}


@end
