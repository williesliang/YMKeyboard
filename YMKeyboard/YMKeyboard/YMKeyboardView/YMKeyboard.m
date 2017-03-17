//
//  YMKeyboard.m
//  YMKeyboard
//
//  Created by 刘彦铭 on 2017/3/17.
//  Copyright © 2017年 刘彦铭. All rights reserved.
//

#import "YMKeyboard.h"


@implementation YMKeyboard

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        [self initKeyBoardNumber];

    }
    return self;
}


#pragma 键盘自定义视图
- (void)initKeyBoardNumber
{
//    self.frame=CGRectMake(0, kScreenHeight-243, kScreenWidth, 243);
    CGFloat space=1;
    CGFloat btnw = (self.frame.size.width - 4*space)/ 4 ;
    CGFloat btnh = (self.frame.size.height - 3*space) / 4 ;
    
    for (int i=0; i<9; i++) {
        
        NSString *str=[NSString stringWithFormat:@"%d",i+1];
        UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
        
        if (i<3) {
            button.frame = CGRectMake(i%3*(btnw+space), i/3*(btnh+space), btnw, btnh);
        }
        else{
            button.frame = CGRectMake(i%3*(btnw+space), i/3*btnh+i/3*space, btnw, btnh);
        }
        button.backgroundColor=[UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:24];
        [button setTitle:str forState:UIControlStateNormal];
        button.tag=i+1;
        [button addTarget:self action:@selector(keyBoardAciont:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    UIButton *dian = [UIButton buttonWithType:UIButtonTypeSystem];
    dian.frame = CGRectMake(0,btnh*3+space*3 , btnw, btnh);
    dian.backgroundColor = [UIColor whiteColor];
    [dian setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    dian.titleLabel.font = [UIFont systemFontOfSize:24];
    [dian addTarget:self action:@selector(keyBoardAciont:) forControlEvents:UIControlEventTouchUpInside];
    [dian setTitle:@"." forState:UIControlStateNormal];
    dian.tag=11;
    [self addSubview:dian];
    
    UIButton *ling = [UIButton buttonWithType:UIButtonTypeSystem];
    ling.frame = CGRectMake(btnw+space,btnh*3+space*3, btnw, btnh);
    ling.backgroundColor = [UIColor whiteColor];
    [ling setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    ling.titleLabel.font = [UIFont systemFontOfSize:24];
    [ling setTitle:@"0" forState:UIControlStateNormal];
    ling.tag = 0;
    [ling addTarget:self action:@selector(keyBoardAciont:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:ling];
    
    UIButton *computer = [UIButton buttonWithType:UIButtonTypeSystem];
    computer.frame = CGRectMake(btnw*2+space*2,btnh*3+space*3, btnw, btnh);
    computer.backgroundColor = [UIColor whiteColor];
//    [computer setTitle:@"退出编辑" forState:UIControlStateNormal];
    [computer setImage:[UIImage imageNamed:@"keyboard"] forState:UIControlStateNormal];
    computer.tag = 12;
    [computer addTarget:self action:@selector(keyBoardAciont:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:computer];
    
    UIButton *delete = [UIButton buttonWithType:UIButtonTypeSystem];
    delete.frame = CGRectMake(btnw*3+space*3,0, btnw+space, btnh*2+space);
    delete.backgroundColor = [UIColor whiteColor];
    [delete addTarget:self action:@selector(keyBoardAciont:) forControlEvents:UIControlEventTouchUpInside];
    delete.tag = 10;
    
//    UIImageView *deleteImage=[[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth/4-1 - 28) * 1.0 / 2, 50, 28, 20)];
//    deleteImage.image=[UIImage imageNamed:@"goumai_03"];
//    [delete addSubview:deleteImage];
    
     [delete setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [self addSubview:delete];
    
    UIButton *confirm=[UIButton buttonWithType:UIButtonTypeSystem];
    confirm.frame=CGRectMake(btnw*3+space*3,btnh*2+space*2, btnw+space, btnh*2+space);
    confirm.backgroundColor=[UIColor blueColor];
    [confirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirm.titleLabel.font=[UIFont systemFontOfSize:20];
    [confirm setTitle:@"确 定" forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(keyBoardAciont:) forControlEvents:UIControlEventTouchUpInside];
    confirm.tag = 13;
    [self addSubview:confirm];
}

#pragma 键盘点击按钮事件
- (void)keyBoardAciont:(UIButton *)sender
{
    
    UIButton* btn = (UIButton*)sender;
    
    NSInteger number = btn.tag;
    
    // no delegate, print log info
    if (nil == _delegate) {
//        NSLog(@"button tag [%ld]",(long)number);
        return;
    }
    
    if (number <= 9 && number >= 0) {
        [_delegate numberKeyBoard:number];
        return;
    }
    
    if (10 == number) {
        [_delegate cancelKeyBoard];
        return;
    }
    if (11 == number) {
        [_delegate periodKeyBoard];
        return;
    }
    if (12 == number) {
        [_delegate changeKeyBoard];
        return;
    }
    
    if (13 == number) {
        [_delegate finishKeyBoard];
        return;
    }
    
}

@end
