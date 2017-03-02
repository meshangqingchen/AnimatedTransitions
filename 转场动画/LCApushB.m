//
//  LCApushB.m
//  转场动画
//
//  Created by 3D on 17/3/2.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "LCApushB.h"
#import "ViewController.h"
#import "BViewController.h"
#
@implementation LCApushB

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;

}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    ViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BViewController *toViewController = (BViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    LCCollectionViewCell *cell = self.clickCell;
    
    UIView *cellImageSnapshot = [cell.backImageView snapshotViewAfterScreenUpdates:NO];//cell.backImageView的快照
    cellImageSnapshot.frame = [containerView convertRect:cell.backImageView.frame fromView:cell.contentView];
    cell.backImageView.hidden = YES;
    
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        toViewController.view.alpha = 1.0;
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
        
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        cell.backImageView.hidden = NO;
        toViewController.imageView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

}
@end
