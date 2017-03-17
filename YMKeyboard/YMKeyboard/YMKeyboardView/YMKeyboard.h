//
//  YMKeyboard.h
//  YMKeyboard
//
//  Created by 刘彦铭 on 2017/3/17.
//  Copyright © 2017年 刘彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

//创建自定义键盘协议
@protocol YMKeyboardDelegate <NSObject>
//创建协议方法
@required//必须执行的方法
- (void)numberKeyBoard:(NSInteger) number;
- (void)cancelKeyBoard;
- (void)finishKeyBoard;
@optional//不必须执行方法
- (void)changeKeyBoard;
- (void)periodKeyBoard;

@end

@interface YMKeyboard : UIView
{
@private//私有的协议方法
    id<YMKeyboardDelegate> _delegate;
}

@property (nonatomic, strong) id<YMKeyboardDelegate> delegate;


@end
