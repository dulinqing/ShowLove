//
//  CustomCollectionViewController.m
//  collectionView
//
//  Created by du-lq on 2019/2/11.
//  Copyright © 2019 du-lq. All rights reserved.
//

#import "CustomCollectionViewController.h"
#import "MyCollectionViewCell.h"


/**
 采用原有的布局
 */
@interface CustomCollectionViewController ()

@end

@implementation CustomCollectionViewController

static NSString * const reuseIdentifier = @"MyCell";
- (instancetype)init
{
    self = [super init];
    if (self) {
        UICollectionViewFlowLayout *customFlow=[[UICollectionViewFlowLayout alloc]init];
        customFlow.minimumLineSpacing=10;
        customFlow.minimumInteritemSpacing=5;
        customFlow.estimatedItemSize=CGSizeMake(100, 100);
        customFlow.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        customFlow.scrollDirection=UICollectionViewScrollDirectionVertical;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = NO;
        self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:customFlow];
        [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"supplementaryView"];
        self.collectionView.backgroundColor=[UIColor whiteColor];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Register cell classes
//    self.collectionView.backgroundColor=[UIColor whiteColor];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 3;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    
//    cell.backgroundColor=[UIColor redColor];
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
