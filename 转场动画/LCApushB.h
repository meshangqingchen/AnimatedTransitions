//
//  LCApushB.h
//  转场动画
//
//  Created by 3D on 17/3/2.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LCCollectionViewCell.h"
@interface LCApushB : NSObject<UIViewControllerAnimatedTransitioning>
@property(nonatomic,strong) LCCollectionViewCell *clickCell;
@end
