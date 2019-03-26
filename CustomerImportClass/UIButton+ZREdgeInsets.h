//
//  UIButton+ZREdgeInsets.h
//  UIZR_ButtonEdgeInsets
//
// github地址:https://github.com/Jerryisme/UIButtonEdgeInsets
// 简书地址:https://www.jianshu.com/p/cfd589b5a0d9
// 简书个人主页:https://www.jianshu.com/u/281c41cc90bc

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZR_ButtonEdgeInsetsStyle) {
    ZR_ButtonEdgeInsetsStyleImageTop,
    ZR_ButtonEdgeInsetsStyleImageLeft,
    ZR_ButtonEdgeInsetsStyleImageBottom,
    ZR_ButtonEdgeInsetsStyleImageRight
};

@interface UIButton (ZREdgeInsets)

- (void)layoutButtonWithEdgeInsetsStyle:(ZR_ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
