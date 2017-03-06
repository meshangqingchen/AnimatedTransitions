//
//  LCApopA.m
//  转场动画
//
//  Created by 3D on 17/3/6.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCApopA.h"
#import "ViewController.h"
#import "BViewController.h"
@implementation LCApopA
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 3;
    
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    
    BViewController *fromViewController = (BViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
//     cellImageSnapshot.frame = [containerView convertRect:cell.backImageView.frame fromView:cell.contentView];
    
    UIView *fromImageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:NO];
    fromImageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.view];
    
    fromViewController.imageView.hidden = YES;
    fromViewController.cell.backImageView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:fromImageSnapshot];

    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1.0;
        CGRect frame = [containerView convertRect:fromViewController.cell.backImageView.frame fromView:fromViewController.cell.contentView];
        fromImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
       
        fromViewController.imageView.hidden = NO;
        fromViewController.cell.backImageView.hidden = NO;
        [fromImageSnapshot removeFromSuperview];
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
    
}
@end
