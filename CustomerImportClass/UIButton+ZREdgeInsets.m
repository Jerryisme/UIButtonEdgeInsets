//
//  UIButton+ZREdgeInsets.m
//  UIZR_ButtonEdgeInsets
//
// github地址:https://github.com/Jerryisme/UIButtonEdgeInsets
// 简书地址:https://www.jianshu.com/p/cfd589b5a0d9
// 简书个人主页:https://www.jianshu.com/u/281c41cc90bc

#import "UIButton+ZREdgeInsets.h"

@implementation UIButton (ZREdgeInsets)

- (void)layoutButtonWithEdgeInsetsStyle:(ZR_ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space {
    CGFloat imageWidth = CGRectGetWidth(self.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.titleLabel.frame);
    CGFloat imageHeight = CGRectGetHeight(self.imageView.frame);
    CGFloat labelHeight = CGRectGetHeight(self.titleLabel.frame);
    
    if (labelWidth == 0) {
        CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        labelWidth  = titleSize.width;
    }
    
    CGFloat imageInsetsTop = 0.0f;
    CGFloat imageInsetsLeft = 0.0f;
    CGFloat imageInsetsBottom = 0.0f;
    CGFloat imageInsetsRight = 0.0f;
    
    CGFloat titleInsetsTop = 0.0f;
    CGFloat titleInsetsLeft = 0.0f;
    CGFloat titleInsetsBottom = 0.0f;
    CGFloat titleInsetsRight = 0.0f;
    
    switch (style) {
        case ZR_ButtonEdgeInsetsStyleImageTop:
        {
            imageInsetsTop = - labelHeight - space;
            imageInsetsLeft = 0;
            imageInsetsBottom = 0;
            imageInsetsRight = - labelWidth;
            
            titleInsetsTop = 0;
            titleInsetsLeft = - imageWidth;
            titleInsetsBottom = - imageHeight - space;
            titleInsetsRight = 0;
        }
            break;
        case ZR_ButtonEdgeInsetsStyleImageLeft:
        {
            space = space * 0.5;
            
            imageInsetsLeft = -space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case ZR_ButtonEdgeInsetsStyleImageBottom:
        {
            imageInsetsTop = labelHeight + space;
            imageInsetsLeft = 0;
            imageInsetsBottom = 0;
            imageInsetsRight = - labelWidth;
            
            titleInsetsTop = 0;
            titleInsetsLeft = - imageWidth;
            titleInsetsBottom = imageHeight + space;
            titleInsetsRight = 0;
        }
            break;
        case ZR_ButtonEdgeInsetsStyleImageRight:
        {
            space = space * 0.5;
            
            imageInsetsLeft = labelWidth + space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = - (imageWidth + space);
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageInsetsTop, imageInsetsLeft, imageInsetsBottom, imageInsetsRight);
    self.titleEdgeInsets = UIEdgeInsetsMake(titleInsetsTop, titleInsetsLeft, titleInsetsBottom, titleInsetsRight);
}

@end
