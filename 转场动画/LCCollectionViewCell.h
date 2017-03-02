//
//  LCCollectionViewCell.h
//  转场动画
//
//  Created by 3D on 17/3/2.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIImageView *backImageView;
@property(nonatomic,strong) UILabel *label;

-(void)bingModel:(id)model;
@end
