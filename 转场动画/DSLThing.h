//
//  DSLThing.h
//  转场动画
//
//  Created by 3D on 17/3/2.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DSLThing : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property(nonatomic,strong) UIImage *image;
@property (nonatomic, copy, readonly) NSString *overview;

+ (NSArray*)exampleThings;

- (instancetype)initWithTitle:(NSString*)title image:(UIImage*)image overview:(NSString*)overview;

@end
