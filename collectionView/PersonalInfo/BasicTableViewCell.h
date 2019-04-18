//
//  BasicTableViewCell.h
//  iSkyWalker
//
//  Created by malie on 2018/11/29.
//  Copyright © 2018 malie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *imgvHead;
@property(nonatomic,strong)UILabel *lbName;
@property(nonatomic,strong)UILabel *lbTitle;
@property(nonatomic,strong)UILabel *lbContent;
@property(nonatomic,strong)UILabel *lbLine;

@end

NS_ASSUME_NONNULL_END
