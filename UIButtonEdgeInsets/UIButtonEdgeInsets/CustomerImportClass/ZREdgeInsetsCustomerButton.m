//
//  ZREdgeInsetsCustomerButton.m
//  UIButtonEdgeInsets
//
// github地址:https://github.com/Jerryisme/UIButtonEdgeInsets
// 简书地址:https://www.jianshu.com/p/cfd589b5a0d9
// 简书个人主页:https://www.jianshu.com/u/281c41cc90bc

#import "ZREdgeInsetsCustomerButton.h"

@implementation ZREdgeInsetsCustomerButton

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self setEdgeInsetsStyle:_edgeInsetsStyle];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self setEdgeInsetsStyle:_edgeInsetsStyle];
}

- (void)setEdgeInsetsStyle:(ZRButtonEdgeInsetsStyle)edgeInsetsStyle {
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    
    [self layoutIfNeeded];
    
    _edgeInsetsStyle = edgeInsetsStyle;
    CGFloat space = self.imageTitleSpace;
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
    
    switch (edgeInsetsStyle) {
        case ZRButtonEdgeInsetsStyleImageTop:
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
        case ZRButtonEdgeInsetsStyleImageLeft:
        {
            space = space * 0.5;
            
            imageInsetsLeft = -space;
            imageInsetsRight = -imageInsetsLeft;
            
            titleInsetsLeft = space;
            titleInsetsRight = -titleInsetsLeft;
        }
            break;
        case ZRButtonEdgeInsetsStyleImageBottom:
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
        case ZRButtonEdgeInsetsStyleImageRight:
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
    
    // 增加内容高度防止裁剪(stack overflow查到的,不明白什么意思,没有实际作用)
//    CGFloat edgeOffset = fabs(labelHeight - imageHeight) / 2.0;
//    self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0.0, edgeOffset, 0.0);
}

- (void)setImageTitleSpace:(CGFloat)imageTitleSpace {
    _imageTitleSpace = imageTitleSpace;
    
    [self setEdgeInsetsStyle:_edgeInsetsStyle];
}


@end
