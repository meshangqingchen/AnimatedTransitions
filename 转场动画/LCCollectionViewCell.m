//
//  LCCollectionViewCell.m
//  转场动画
//
//  Created by 3D on 17/3/2.
//  Copyright © 2017年 3D. All rights reserved.
//
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#import "LCCollectionViewCell.h"
#import "Masonry.h"
#import "DSLThing.h"
@implementation LCCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

-(void)setupViews{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.backImageView = [UIImageView new];
    [self.contentView addSubview:_backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
        make.height.mas_equalTo((SCREEN_WIDTH-10)/2);
    }];
    
    self.label = [UILabel new];
    [self.contentView addSubview:_label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_equalTo(20);
    }];
    
    
};

-(void)bingModel:(id)model{
    DSLThing *dsm = model;
    self.backImageView.image = dsm.image;
    self.label.text = dsm.title;
}
@end
