//
//  ViewController.m
//  collectionView
//
//  Created by du-lq on 2019/2/11.
//  Copyright © 2019 du-lq. All rights reserved.
//

#import "ViewController.h"
#import "LQCollectionViewLayout.h"
#import "MyCollectionViewCell.h"
#import "DuViewController.h"
#import "LinViewController.h"
#import "QingViewController.h"
#import "HeartViewController.h"
#import "collectionView-Swift.h"
#import "BasicInfoViewController.h"


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,EWWaterFallLayoutDataSource>
@property(nonatomic,copy) NSMutableArray *characterArray;
@end

/**
 采用自定义布局
 */
@implementation ViewController
static NSString * const reuseIdentifier = @"MyCell";
-(NSMutableArray *)characterArray{
    if (!_characterArray) {
        _characterArray=[NSMutableArray array];
    }
    return _characterArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"首页";
    NSArray *temCharacter=[NSArray arrayWithObjects:@"很",@"高",@"兴",@"认",@"❤️",@"识",@"你", nil];
    [self.characterArray addObjectsFromArray:temCharacter];
    LQCollectionViewLayout *customFlow=[[LQCollectionViewLayout alloc]init];
    customFlow.delegate=self;
    UICollectionView *viewcoll=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:customFlow];;
    [viewcoll registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [viewcoll registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementaryView"];
    viewcoll.delegate=self;
    viewcoll.dataSource=self;
    viewcoll.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:viewcoll];
//    self.automaticallyAdjustsScrollViewInsets
//    UIScrollView's contentInsetAdjustmentBehavior
    viewcoll.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentAutomatic;
    // Do any additional setup after loading the view, typically from a nib  .
}

-(void)initNavigation{
    self.navigationController.navigationBar.hidden=NO;
    self.navigationController.navigationBar.translucent=YES;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 60;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CGFloat red = arc4random_uniform(256)/ 255.0;
    CGFloat green = arc4random_uniform(256)/ 255.0;
    CGFloat blue = arc4random_uniform(256)/ 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    
    cell.backgroundColor=color;
    cell.layer.cornerRadius=8;
    cell.clipsToBounds=NO;
    
    cell.cellLabel.text=[self.characterArray objectAtIndex:arc4random()%self.characterArray.count];
    cell.cellLabel.font=[UIFont systemFontOfSize:28];

    
    return cell;
}
- (CGFloat)waterFallLayout:(LQCollectionViewLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth{
    return  60 + arc4random() % 3 * 30;
}
- (NSUInteger)columnCountInWaterFallLayout:(LQCollectionViewLayout *)waterFallLayout{
    return  5;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *selectedCell=(MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *cellText=selectedCell.cellLabel.text;
    NSUInteger index=[self.characterArray indexOfObject:cellText];
    if (index+1) {
        switch (index) {
            case 0:
            {
                DuViewController *duVC=[[DuViewController alloc]init];
                [self.navigationController pushViewController:duVC animated:YES];
            }
                break;
            case 1:
            {
                LinViewController *linVC=[[LinViewController alloc]init];
                [self.navigationController pushViewController:linVC animated:YES];
            }
                break;
            case 2:
            {
                QingViewController *qingVC=[[QingViewController alloc]init];
                [self.navigationController pushViewController:qingVC animated:YES];
            }
                break;
            case 3:
            {
                BasicInfoViewController *heartVC=[[BasicInfoViewController alloc]init];
                [self.navigationController pushViewController:heartVC animated:YES];
            }
                break;
            case 4:
            {
                SwiftViewController *heartVC=[[SwiftViewController alloc]init];
                [self.navigationController pushViewController:heartVC animated:YES];
            }
                break;
            case 5:
                
                break;
                
            default:
                break;
        }
    }
    
}
@end
