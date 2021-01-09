//
//  UIView+ZZToast.h
//  Test
//
//  Created by coderP on 2021/1/7.
//  Copyright © 2021 coderP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSToastStyle;
NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZZToast)
/// 在当前的view弹窗提示信息
/// @param message 提示信息
/// @param duration 弹窗消失时间
/// @param limitDuration 多少秒内不弹窗（例: 设置1S，就表示1S内弹窗一次）
/// @param position 弹窗显示的位置
- (void)zz_showToastWithMessage:(NSString *)message duration:(NSTimeInterval)duration andLimitDuration:(NSTimeInterval)limitDuration andPosition:(id)position andStyle:(CSToastStyle *)style;

/// 快速弹窗提示，默认在视图底部，白底黑字体
/// @param message 展示的消息
- (void)zz_showToastWithMessage:(NSString *)message;



/// 展示一个吐司
/// @param message 信息
/// @param textColor 文本颜色
/// @param backGroundColor 吐司背景色
/// @param position 吐司展示的位置
/// @param limitDuration 限制短时间内多次弹窗，如果设置为1s表示1s内只弹窗一次
- (void)zz_showToastWithMessage:(NSString *)message andTextColor:(UIColor *)textColor andBackGroundColor:(UIColor *)backGroundColor andPosition:(CGPoint)position andLimitDuration:(NSTimeInterval)limitDuration;
@end

NS_ASSUME_NONNULL_END
