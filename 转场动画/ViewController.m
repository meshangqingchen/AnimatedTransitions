//
//  ViewController.m
//  转场动画
//
//  Created by 3D on 17/3/1.
//  Copyright © 2017年 3D. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#import "ViewController.h"
#import "BViewController.h"
#import "LCCollectionViewCell.h"
#import "BViewController.h"
#import "DSLThing.h"
#import "LCApushB.h"
@interface ViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
UINavigationControllerDelegate>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property(nonatomic,strong) NSArray *dataArr;
@property(nonatomic,strong) LCApushB *atob;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

-(instancetype)init{
    if (self = [super init]) {
        _dataArr = [DSLThing exampleThings];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    _flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:_flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    _flowLayout.minimumLineSpacing = 10;
    _flowLayout.minimumInteritemSpacing = 10;
    _flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-10)/2, (SCREEN_WIDTH-10)/2+20);
    [self.collectionView registerClass:[LCCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];

}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell bingModel:_dataArr[indexPath.row]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DSLThing *model = self.dataArr[indexPath.row];
    
    self.atob = [LCApushB new];
    self.atob.clickCell = (LCCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    
    BViewController *bvc = [BViewController new];
    bvc.image = model.image;
    [self.navigationController pushViewController:bvc animated:YES];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    if (operation == UINavigationControllerOperationPush) {
        return self.atob;
    }

    return nil;
}


@end
