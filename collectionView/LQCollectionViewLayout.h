//
//  LQCollectionViewLayout.h
//  collectionView
//
//  Created by du-lq on 2019/2/12.
//  Copyright © 2019 du-lq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class LQCollectionViewLayout;

@protocol EWWaterFallLayoutDataSource<NSObject>

@required
/**
 * 每个item的高度
 */
- (CGFloat)waterFallLayout:(LQCollectionViewLayout *)waterFallLayout heightForItemAtIndexPath:(NSUInteger)indexPath itemWidth:(CGFloat)itemWidth;

@optional
/**
 * 有多少列
 */
- (NSUInteger)columnCountInWaterFallLayout:(LQCollectionViewLayout *)waterFallLayout;

/**
 * 每列之间的间距
 */
- (CGFloat)columnMarginInWaterFallLayout:(LQCollectionViewLayout *)waterFallLayout;

/**
 * 每行之间的间距
 */
- (CGFloat)rowMarginInWaterFallLayout:(LQCollectionViewLayout *)waterFallLayout;

/**
 * 每个item的内边距
 */
- (UIEdgeInsets)edgeInsetsInWaterFallLayout:(LQCollectionViewLayout *)waterFallLayout;

@end

@interface LQCollectionViewLayout : UICollectionViewLayout
@property (nonatomic, weak) id<EWWaterFallLayoutDataSource> delegate;
@end

NS_ASSUME_NONNULL_END
