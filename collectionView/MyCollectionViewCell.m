//
//  MyCollectionViewCell.m
//  collectionView
//
//  Created by du-lq on 2019/2/11.
//  Copyright © 2019 du-lq. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *charLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        charLabel.textAlignment=NSTextAlignmentCenter;
        charLabel.textColor=[UIColor whiteColor];
        [self addSubview:charLabel];
        self.cellLabel=charLabel;
    }
    return self;
}

- (void)layoutSubviews{
    self.cellLabel.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}
@end
