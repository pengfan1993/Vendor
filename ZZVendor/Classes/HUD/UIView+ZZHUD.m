//
//  UIView+ZZHUD.m
//  Test
//
//  Created by coderP on 2021/1/7.
//  Copyright © 2021 coderP. All rights reserved.
//

#import "UIView+ZZHUD.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "UIImage+ZZGIFImage.h"

@implementation UIView (ZZHUD)
- (void)zz_showMessage:(NSString *)message {
    //设置文字颜色
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
    [SVProgressHUD showWithStatus:message];
    [SVProgressHUD dismissWithDelay:2];
}
- (void)zz_showMessage:(NSString *)message andImage:(NSString *)image {
    //设置文字颜色
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0]];
    [SVProgressHUD setImageViewSize:CGSizeMake(50, 50)];
    UIImage *showImage = [UIImage imageNamed:image];
    if (showImage != nil) {
        [SVProgressHUD showImage:showImage status:message];
    }
    [SVProgressHUD dismissWithDelay:2];
}
- (void)zz_ShowGifWithName:(NSString *)gifName andMessage:(NSString *)message {
    [SVProgressHUD setBackgroundColor:UIColor.whiteColor];
    [SVProgressHUD setForegroundColor:[UIColor colorWithRed: 47.0 /255.0 green: 204.0 / 255.0 blue: 205.0 / 255.0 alpha:1]];
    [SVProgressHUD setImageViewSize:CGSizeMake(80, 80)];
    [SVProgressHUD showImage:[UIImage zz_imageWithGIFNamed:gifName] status:message];
    
}
@end
