//
//  YMKeyboardBar.h
//  YMKeyboard
//
//  Created by 刘彦铭 on 2017/3/17.
//  Copyright © 2017年 刘彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMKeyboardBar : UIView
@property (weak, nonatomic) IBOutlet UITextField *leftTextField;
@property (weak, nonatomic) IBOutlet UITextField *rightTextField;

+ (instancetype)instanse;

@end
