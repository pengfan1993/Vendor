//
//  UIView+ZZToast.m
//  Test
//
//  Created by coderP on 2021/1/7.
//  Copyright © 2021 coderP. All rights reserved.
//

#import "UIView+ZZToast.h"
#import <Toast/UIView+Toast.h>
static NSTimeInterval lastShowToastTime = 0; //上一次展示toast的时间
@implementation UIView (ZZToast)
- (void)zz_showToastWithMessage:(NSString *)message {
    
    CSToastStyle *style   = [[CSToastStyle alloc] initWithDefaultStyle];
    style.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    style.titleColor      = [UIColor whiteColor];
    
    [self zz_showToastWithMessage:message
                         duration:1
                 andLimitDuration:0
                      andPosition:CSToastPositionBottom
                         andStyle:style];
    
}

- (void)zz_showToastWithMessage:(NSString *)message duration:(NSTimeInterval)duration andLimitDuration:(NSTimeInterval)limitDuration
    andPosition:(id)position
    andStyle:(CSToastStyle *)style {
    
    NSTimeInterval currentTime = CFAbsoluteTimeGetCurrent();
    
    if( (currentTime - lastShowToastTime )>= limitDuration ){
        
        lastShowToastTime = currentTime;
        [self makeToast:message duration:duration position:position style:style];
        
    }else {
        return;
    }
    
}
- (void)zz_showToastWithMessage:(NSString *)message andTextColor:(UIColor *)textColor andBackGroundColor:(UIColor *)backGroundColor andPosition:(CGPoint)position andLimitDuration:(NSTimeInterval)limitDuration {
    
    CSToastStyle *style   = [[CSToastStyle alloc] initWithDefaultStyle];
    style.backgroundColor = backGroundColor;
    style.titleColor      = textColor;
    
    NSTimeInterval currentTime = CFAbsoluteTimeGetCurrent();
    if( (currentTime - lastShowToastTime )>= limitDuration ){
        lastShowToastTime = currentTime;
        [self makeToast:message
               duration:1.5
               position:[NSValue valueWithCGPoint:position]
                  style:style];
        
    }else {
        return;
    }
    
}
@end
