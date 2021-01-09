//
//  UIView+ZZHUD.h
//  Test
//
//  Created by coderP on 2021/1/7.
//  Copyright © 2021 coderP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZZHUD)
/// 快速展示一个HUD
/// @param message 展示的信息
-(void)zz_showMessage:(NSString *)message;


/// 展示一个文本信息和一个图片
/// @param message 信息
/// @param image 图片名
-(void)zz_showMessage:(NSString *)message andImage:(NSString * )image;

/// 展示一个HUD 带文本信息和GIF图片
/// @param gifName <#gifName description#>
/// @param message <#message description#>
-(void)zz_ShowGifWithName:(NSString *)gifName andMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
