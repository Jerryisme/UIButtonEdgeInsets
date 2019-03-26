//
//  TestViewController.m
//  UIButtonEdgeInsets
//
// github地址:https://github.com/Jerryisme/UIButtonEdgeInsets
// 简书地址:https://www.jianshu.com/p/cfd589b5a0d9
// 简书个人主页:https://www.jianshu.com/u/281c41cc90bc


#import "TestViewController.h"
#import "ZREdgeInsetsCustomerButton.h"
#import "UIButton+ZREdgeInsets.h"

#define ZR_SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define ZR_SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 整体偏移
    [self contentEdgeInsetsWay];
    // 扩大图片点击区域
    [self onlyImageEdgeInsetsWay];
    // 子类(继承)
    [self setUpSubClassWay];
    // 类别
    [self setUpCategoryWay];
}

#pragma mark --- 整体偏移
- (void)contentEdgeInsetsWay {
    UIButton *contentEdgeInsetsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    contentEdgeInsetsButton.frame = CGRectMake(0, ZR_SCREENHEIGHT - 100, 120, 60);
    [contentEdgeInsetsButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [contentEdgeInsetsButton setTitle:@"整体偏移" forState:UIControlStateNormal];
    [contentEdgeInsetsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    contentEdgeInsetsButton.titleLabel.font = [UIFont systemFontOfSize:14];
    contentEdgeInsetsButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:contentEdgeInsetsButton];
    contentEdgeInsetsButton.contentEdgeInsets = UIEdgeInsetsMake(20, 15, 0, 0);
}

#pragma mark --- 扩大图片点击区域
- (void)onlyImageEdgeInsetsWay {
    UIButton *imageEdgeInsetsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    imageEdgeInsetsButton.frame = CGRectMake(ZR_SCREENWIDTH - 60, ZR_SCREENHEIGHT - 100, 60, 60);
    [imageEdgeInsetsButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [imageEdgeInsetsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    imageEdgeInsetsButton.titleLabel.font = [UIFont systemFontOfSize:14];
    imageEdgeInsetsButton.backgroundColor = [UIColor blueColor];
    imageEdgeInsetsButton.imageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageEdgeInsetsButton];
    imageEdgeInsetsButton.imageEdgeInsets = UIEdgeInsetsMake(-15, -15, 0, 0);
}

#pragma mark --- 子类(继承)
- (void)setUpSubClassWay {
    ZREdgeInsetsCustomerButton *subClassTopButton = [ZREdgeInsetsCustomerButton buttonWithType:UIButtonTypeCustom];
    subClassTopButton.frame = CGRectMake(ZR_SCREENWIDTH / 4, 100, ZR_SCREENWIDTH / 2, 60);
    [subClassTopButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [subClassTopButton setTitle:@"上(子类)" forState:UIControlStateNormal];
    [subClassTopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subClassTopButton.titleLabel.font = [UIFont systemFontOfSize:14];
    subClassTopButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:subClassTopButton];
    subClassTopButton.imageTitleSpace = 5;
    subClassTopButton.edgeInsetsStyle = ZRButtonEdgeInsetsStyleImageTop;
    
    ZREdgeInsetsCustomerButton *subClassLeftButton = [ZREdgeInsetsCustomerButton buttonWithType:UIButtonTypeCustom];
    subClassLeftButton.frame = CGRectMake(ZR_SCREENWIDTH / 6 / 2, CGRectGetMaxY(subClassTopButton.frame) + 15, ZR_SCREENWIDTH / 3, 40);
    [subClassLeftButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [subClassLeftButton setTitle:@"左(子类)" forState:UIControlStateNormal];
    [subClassLeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subClassLeftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    subClassLeftButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:subClassLeftButton];
    subClassLeftButton.imageTitleSpace = 10;
    subClassLeftButton.edgeInsetsStyle = ZRButtonEdgeInsetsStyleImageLeft;
    
    ZREdgeInsetsCustomerButton *subClassBottomButton = [ZREdgeInsetsCustomerButton buttonWithType:UIButtonTypeCustom];
    subClassBottomButton.frame = CGRectMake(ZR_SCREENWIDTH / 4, CGRectGetMaxY(subClassLeftButton.frame) + 15, ZR_SCREENWIDTH / 2, 60);
    [subClassBottomButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [subClassBottomButton setTitle:@"下(子类)" forState:UIControlStateNormal];
    [subClassBottomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subClassBottomButton.titleLabel.font = [UIFont systemFontOfSize:14];
    subClassBottomButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:subClassBottomButton];
    subClassBottomButton.imageTitleSpace = 5;
    subClassBottomButton.edgeInsetsStyle = ZRButtonEdgeInsetsStyleImageBottom;
    
    ZREdgeInsetsCustomerButton *subClassRightButton = [ZREdgeInsetsCustomerButton buttonWithType:UIButtonTypeCustom];
    subClassRightButton.frame = CGRectMake(ZR_SCREENWIDTH - (ZR_SCREENWIDTH / 6 / 2 + ZR_SCREENWIDTH / 3), CGRectGetMaxY(subClassTopButton.frame) + 15, ZR_SCREENWIDTH / 3, 40);
    [subClassRightButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [subClassRightButton setTitle:@"右(子类)" forState:UIControlStateNormal];
    [subClassRightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    subClassRightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    subClassRightButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:subClassRightButton];
    subClassRightButton.imageTitleSpace = 10;
    subClassRightButton.edgeInsetsStyle = ZRButtonEdgeInsetsStyleImageRight;
}
#pragma mark --- 类别
- (void)setUpCategoryWay {
    UIButton *categoryTopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    categoryTopButton.frame = CGRectMake(ZR_SCREENWIDTH / 4, 300, ZR_SCREENWIDTH / 2, 60);
    [categoryTopButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [categoryTopButton setTitle:@"上(类别)" forState:UIControlStateNormal];
    [categoryTopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    categoryTopButton.titleLabel.font = [UIFont systemFontOfSize:14];
    categoryTopButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:categoryTopButton];
    [categoryTopButton layoutButtonWithEdgeInsetsStyle:ZR_ButtonEdgeInsetsStyleImageTop imageTitlespace:5];
    
    UIButton *categoryLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    categoryLeftButton.frame = CGRectMake(ZR_SCREENWIDTH / 6 / 2, CGRectGetMaxY(categoryTopButton.frame) + 15, ZR_SCREENWIDTH / 3, 40);
    [categoryLeftButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [categoryLeftButton setTitle:@"左(类别)" forState:UIControlStateNormal];
    [categoryLeftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    categoryLeftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    categoryLeftButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:categoryLeftButton];
    [categoryLeftButton layoutButtonWithEdgeInsetsStyle:ZR_ButtonEdgeInsetsStyleImageLeft imageTitlespace:10];
    
    UIButton *categoryBottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    categoryBottomButton.frame = CGRectMake(ZR_SCREENWIDTH / 4, CGRectGetMaxY(categoryLeftButton.frame) + 15, ZR_SCREENWIDTH / 2, 60);
    [categoryBottomButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [categoryBottomButton setTitle:@"下(类别)" forState:UIControlStateNormal];
    [categoryBottomButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    categoryBottomButton.titleLabel.font = [UIFont systemFontOfSize:14];
    categoryBottomButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:categoryBottomButton];
    [categoryBottomButton layoutButtonWithEdgeInsetsStyle:ZR_ButtonEdgeInsetsStyleImageBottom imageTitlespace:5];
    
    UIButton *categoryRightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    categoryRightButton.frame = CGRectMake(ZR_SCREENWIDTH - (ZR_SCREENWIDTH / 6 / 2 + ZR_SCREENWIDTH / 3), CGRectGetMaxY(categoryTopButton.frame) + 15, ZR_SCREENWIDTH / 3, 40);
    [categoryRightButton setImage:[UIImage imageNamed:@"TestImage"] forState:UIControlStateNormal];
    [categoryRightButton setTitle:@"右(类别)" forState:UIControlStateNormal];
    [categoryRightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    categoryRightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    categoryRightButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:categoryRightButton];
    [categoryRightButton layoutButtonWithEdgeInsetsStyle:ZR_ButtonEdgeInsetsStyleImageRight imageTitlespace:10];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
