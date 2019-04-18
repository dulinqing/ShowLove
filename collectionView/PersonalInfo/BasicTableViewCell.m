//
//  BasicTableViewCell.m
//  iSkyWalker
//
//  Created by malie on 2018/11/29.
//  Copyright © 2018 malie. All rights reserved.
//

#import "BasicTableViewCell.h"
#import "MicroDefine.h"
#import "Masonry.h"

@implementation BasicTableViewCell


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        _imgvHead = [[UIImageView alloc]init];
        _imgvHead.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imgvHead];
    
        
        _lbName = [[UILabel alloc]init];
        _lbName.font = [UIFont systemFontOfSize:28];
        _lbName.textColor = ColorFromRGB(0x383838);
        _lbName.textAlignment = NSTextAlignmentLeft;
        [_lbName sizeToFit];
        [self addSubview:_lbName];
        
        _lbLine = [[UILabel alloc]init];
        _lbLine.backgroundColor = ColorFromRGB(0xe0e0e0);
        _lbLine.alpha = 0.4;
        [self addSubview:_lbLine];
        
        _lbTitle = [[UILabel alloc]init];
        _lbTitle.font = [UIFont systemFontOfSize:18];
        _lbTitle.textColor = ColorFromRGB(0x383838);
        _lbTitle.textAlignment = NSTextAlignmentLeft;
        [_lbTitle sizeToFit];
        [self addSubview:_lbTitle];
        
        _lbContent = [[UILabel alloc]init];
        _lbContent.font = [UIFont systemFontOfSize:18];
        _lbContent.textColor = ColorFromRGB(0x383838);
        _lbContent.textAlignment = NSTextAlignmentLeft;
        [_lbContent sizeToFit];
        [self addSubview:_lbContent];
        
        [_imgvHead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(24*(W_RATE));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.height.equalTo(@(88*H_RATE));
        }];
        _imgvHead.layer.cornerRadius=44*H_RATE;
        
        [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imgvHead.mas_right).offset(15*(W_RATE));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [_lbLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.height.equalTo(@(1*(H_RATE)));
            
        }];
        
        [_lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(14*(W_RATE));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [_lbContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(158*(W_RATE));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.lessThanOrEqualTo(@(380*(W_RATE)));
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
