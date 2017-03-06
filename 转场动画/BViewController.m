//
//  BViewController.m
//  转场动画
//
//  Created by 3D on 17/3/1.
//  Copyright © 2017年 3D. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#import "BViewController.h"
#import "Masonry.h"
#import "LCApopA.h"
@interface BViewController ()
<UINavigationControllerDelegate>

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.imageView = [UIImageView new];
    [self.view addSubview:_imageView];
    _imageView.backgroundColor = [UIColor whiteColor];
    _imageView.frame = CGRectMake(0, 0, (SCREEN_WIDTH-10)/2, (SCREEN_WIDTH-10)/2);
    _imageView.center = self.view.center;
    _imageView.image  = self.image;
//    [self.navigationController popViewControllerAnimated:YES];
    self.label = [UILabel new];
    [self.view addSubview:_label];
    self.label.text = self.lableStr;
    self.label.numberOfLines = 0;
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.width.mas_equalTo(self.imageView);
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(20);
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.delegate = self;
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPop) {
        return [LCApopA new];
    }
    
    return nil;
}

-(void)dealloc{

    NSLog(@"=====");
}
@end
