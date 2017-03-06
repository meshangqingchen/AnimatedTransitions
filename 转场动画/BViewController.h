//
//  BViewController.h
//  转场动画
//
//  Created by 3D on 17/3/1.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCCollectionViewCell.h"
@interface BViewController : UIViewController
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) NSString *lableStr;

@property(nonatomic,strong) LCCollectionViewCell *cell;
@end
