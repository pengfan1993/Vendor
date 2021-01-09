//
//  UIImage+ZZGIFImage.h
//  Test
//
//  Created by coderP on 2021/1/7.
//  Copyright © 2021 coderP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GIFimageBlock)(UIImage *GIFImage);

@interface UIImage (ZZGIFImage)

/** 根据本地GIF图片名 获得GIF image对象 */
+ (UIImage *)zz_imageWithGIFNamed:(NSString *)name;

/** 根据一个GIF图片的data数据 获得GIF image对象 */
+ (UIImage *)zz_imageWithGIFData:(NSData *)data;

/** 根据一个GIF图片的URL 获得GIF image对象 */
+ (void)zz_imageWithGIFUrl:(NSString *)url and:(GIFimageBlock)gifImageBlock;
@end

NS_ASSUME_NONNULL_END
