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
@interface BViewController ()

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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
