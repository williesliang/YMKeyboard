//
//  YMKeyboardView.m
//  YMKeyboard
//
//  Created by 刘彦铭 on 2017/3/17.
//  Copyright © 2017年 刘彦铭. All rights reserved.
//

#import "YMKeyboardView.h"
#import "YMKeyboard.h"
#import "YMKeyboardBar.h"

#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
#define kKeyboardBarH 44
#define kKeyboardH 243

@interface YMKeyboardView () <YMKeyboardDelegate>

@property (strong, nonatomic) UIView *cover;
@property (assign, nonatomic) CGFloat height;

@property (nonatomic, strong) YMKeyboard *keyboard;
@property (nonatomic, strong) UITextField *leftTextField;

@end

@implementation YMKeyboardView

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        [self setup];
    }
    return self;
}


- (void)setup {
    
    self.height = kKeyboardBarH + kKeyboardH;
    self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, self.height);
    self.backgroundColor = [UIColor redColor];
    
    // 遮盖
    _cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_cover addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverClicked:)]];
    _cover.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    
    [_cover addSubview:self];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_cover];
    
    [self addkeyboardBar];
    [self addKeyboard];
}

- (void)coverClicked:(UIView *)cover
{
    [self hidden];
}

- (void)addkeyboardBar {
    YMKeyboardBar *keyboardBar = [YMKeyboardBar instanse];
    keyboardBar.backgroundColor = [UIColor whiteColor];
    keyboardBar.frame = CGRectMake(0, 0, self.frame.size.width, kKeyboardBarH);
    
    [self addSubview:keyboardBar];
    [keyboardBar becomeFirstResponder];
    self.leftTextField = keyboardBar.leftTextField;
}

- (void)addKeyboard {
    YMKeyboard *keyboard = [[YMKeyboard alloc] initWithFrame:CGRectMake(0, kKeyboardBarH, self.frame.size.width, kKeyboardH)];
    
    [self addSubview:keyboard];
    
    self.keyboard = keyboard;
    
    self.leftTextField.inputView = self.keyboard;
    self.keyboard.delegate = self;
    [self.leftTextField reloadInputViews];
}

#pragma mark - YMKeyboardDelegate
- (void)hidenKeyBoard
{
//    NSLog(@"键盘隐藏");
    [self.leftTextField resignFirstResponder];
    [self hidden];
}

- (void)numberKeyBoard:(NSInteger)number
{
    NSString *str = self.leftTextField.text;
    self.leftTextField.text = [NSString stringWithFormat:@"%@%ld",str,(long)number];
}

- (void)cancelKeyBoard
{
    
    NSMutableString *muStr = [[NSMutableString alloc] initWithString:self.leftTextField.text];
    if (muStr.length <= 0) {
        return;
    }
    [muStr deleteCharactersInRange:NSMakeRange([muStr length] - 1, 1)];
    self.leftTextField.text = muStr;
}

// 输入点
-(void)periodKeyBoard{
    
    if ([self.leftTextField.text isEqualToString:@""]) {
        return;
    }
    //判断当前时候存在一个点
    if ([self.leftTextField.text rangeOfString:@"."].location == NSNotFound) {
        //输入中没有点
        NSMutableString  *mutableString=[[NSMutableString alloc]initWithFormat:@"%@%@",self.leftTextField.text,@"."];
        self.leftTextField.text=mutableString;
    }
}

// 切换键盘
-(void)changeKeyBoard{
    [self hidenKeyBoard];
}

// 确定
-(void)finishKeyBoard{
    [self.leftTextField endEditing:YES];
    
    
    [self hidden];
}


- (void)show {
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -_height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hidden {
    [UIView animateWithDuration:0.25 animations:^{
        self.transform = CGAffineTransformIdentity;
        [self.leftTextField resignFirstResponder];
    } completion:^(BOOL finished) {
        [_cover removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
