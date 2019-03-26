# UIButtonEdgeInsets
通过调整 UIButton的imageEdgeInsets 和titleEdgeInsets属性实现图片和文字的布局
### UIButtonEdgeInsets使用:
此Demo中分别通过继承(ZREdgeInsetsCustomerButton)和类别(UIButton+ZREdgeInsets)两种方式来调整UIButton的imageEdgeInsets和titleEdgeInsets属性,实现文字与图片的布局.
> ※满足UI设计即可,图片要求不可大于UIButton的Size.如果过于复杂,建议自定义UIView

![Demo效果图](https://upload-images.jianshu.io/upload_images/2198604-084bccf3e7277f06.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

除此外,Demo的TestViewController中还列举了整体偏移(设置contentEdgeInsets来实现)和扩大图片点击区域(设置imageEdgeInsets来实现)的例子.如下图:
![](https://upload-images.jianshu.io/upload_images/2198604-0b0a773aa6d5b3bf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
> 功能相对比较简单,唯一的好处就是可以下载Demo,直接拖进去就能用.当然,如果介意前面的ZR的话,一个一个修改太麻烦.教大家一个一键去除的方法,记得.h和.m里面都要修改.
1.command + F搜索当前页代码;
2.将输入框旁边的Find下拉选择Replace;
3.上方输入"想要修改的",下方输入"将要改成的";
4.最后点击右侧的All,就全部替换掉了.

#### Demo要说的就这么多了,现在我要来讲一下我的理解,因为是个人理解,欢迎大家指正和提出问题,希望能和大家共同成长.

#### contentEdgeInsets
```
@property(nonatomic)          UIEdgeInsets contentEdgeInsets UI_APPEARANCE_SELECTOR; // 外观属性选择器的标志
//default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.(在苹果电视系统10或以后,除了自定义,否则默认是非零的)
```
按钮的内容整体(包含titleLabel和imageView)进行偏移.
#### imageEdgeInsets&& titleEdgeInsets
```
@property(nonatomic)          UIEdgeInsets titleEdgeInsets;                // default is UIEdgeInsetsZero
@property(nonatomic)          UIEdgeInsets imageEdgeInsets;                // default is UIEdgeInsetsZero
```
在我看来,titleLabel和imageView虽然是UIButton内的两个控件,但是它们也是一个整体,它们是针对当前位置(UIButton的contentRect)而不是针对距离UIButton边框的距离.也就是设置的对齐方式(contentVerticalAlignment和contentHorizontalAlignment)来控制的.//这句话不怎么好理解,可能表述的不清晰.
##### 对齐方式contentVerticalAlignment和contentHorizontalAlignment
```
@property(nonatomic) UIControlContentVerticalAlignment contentVerticalAlignment;     // 
// how to position content vertically inside control. default is center
typedef NS_ENUM(NSInteger, UIControlContentVerticalAlignment) {
    UIControlContentVerticalAlignmentCenter  = 0, // 水平方向-居中
    UIControlContentVerticalAlignmentTop     = 1, // 水平方向-左对齐
    UIControlContentVerticalAlignmentBottom  = 2, // 水平方向-右对齐
    UIControlContentVerticalAlignmentFill    = 3, // 水平方向-拉伸,图片可能会被拉大
};
@property(nonatomic) UIControlContentHorizontalAlignment contentHorizontalAlignment; //
// how to position content horizontally inside control. default is center
typedef NS_ENUM(NSInteger, UIControlContentHorizontalAlignment) {
    UIControlContentHorizontalAlignmentCenter = 0, // 竖直方向-居中
    UIControlContentHorizontalAlignmentLeft   = 1, // 竖直方向-顶部
    UIControlContentHorizontalAlignmentRight  = 2, // 竖直方向-底部
    UIControlContentHorizontalAlignmentFill   = 3, // 竖直方向-拉伸,图片可能被拉大
    UIControlContentHorizontalAlignmentLeading  API_AVAILABLE(ios(11.0), tvos(11.0)) = 4, // 竖直方向-首对齐
    UIControlContentHorizontalAlignmentTrailing API_AVAILABLE(ios(11.0), tvos(11.0)) = 5, // 竖直方向-尾对齐
};
```
### UIEdgeInsets
```
typedef struct UIEdgeInsets {
    CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
} UIEdgeInsets;
浮点型  上,  左,  下,  右;  //对每条边向内方向的偏移量，可以为正值（向内偏移）也可以为负值（向外偏移）
```
contentVerticalAlignment---contentHorizontalAlignment---UIEdgeInsets注释写的比较清晰,直接看注释就可以啦.
#### 最后,觉得有用记得给个star✨!非常感谢!

##### 简书地址:https://www.jianshu.com/p/cfd589b5a0d9
##### 简书个人主页:https://www.jianshu.com/u/281c41cc90bc
