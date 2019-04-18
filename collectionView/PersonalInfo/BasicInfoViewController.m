//
//  BasicInfoViewController.m
//  iSkyWalker
//
//  Created by malie on 2018/11/29.
//  Copyright © 2018 malie. All rights reserved.
//

#import "BasicInfoViewController.h"
#import "Masonry.h"
#import "MicroDefine.h"
#import "BasicTableViewCell.h"

@interface BasicInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tabBasicInfo;
    NSArray *arrTittle;
    NSDictionary *dicContent;
}

@end

@implementation BasicInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ColorFromRGB(0xf1f4f6);
//    arrTittle = @[@"工号",@"籍贯",@"生日",@"部门",@"手机号",@"民族",@"毕业学校",@"资位",@"职系",@"入职日期",@"年资",@"费用代码",@"技委会"];
//    dicContent = @{@"EMP_NAME":@"",
//                   @"EMP_NO":@"C",
//                   @"AREA":@"",
//                   @"COMPANY":@"",
//                   @"DEPT_NAME":@"IT IOS开发课",
//                   @"EMP_MOBILE_TELNO":@"1",
//                   @"HEAD_SHIP":@"汉族",
//                   @"JITUAN":@"",
//                   @"POST_LEVEL":@"师二",
//                   @"POST_RANK_ID":@"数位内容B",
//                   @"IN_FOXCONN_DATE":@"2018/07/13",
//                   @"WORK_YEARS":@"2.1年",
//                   @"DEPT_COST":@"8",
//                   @"COMMITTEE_NAME":@"资讯科技技委会"};
    arrTittle = @[@"工作单位",@"籍贯",@"生日",@"职业",@"手机号",@"民族",@"毕业学校",@"专业",@"星座",@"微信",@"QQ",@"爱好",@"人生态度"];
    dicContent = @{@"EMP_NAME":@"***",
                   @"EMP_NO":@"",
                   @"AREA":@"**省**市",
                   @"COMPANY":@"19**/**/**",
                   @"DEPT_NAME":@"IT IOS开发工程师",
                   @"EMP_MOBILE_TELNO":@"18*********",
                   @"HEAD_SHIP":@"汉族",
                   @"JITUAN":@"大学",
                   @"POST_LEVEL":@"计算机",
                   @"POST_RANK_ID":@"天秤座",
                   @"IN_FOXCONN_DATE":@"181********",
                   @"WORK_YEARS":@"5*******",
                   @"DEPT_COST":@"音乐,摄影,篮球,科技",
                   @"COMMITTEE_NAME":@"年轻就应该多折腾"};
    [self initNavigation];
    [self initTableview];
}

#pragma mark - 初始化顶部导航栏UI
- (void)initNavigation
{

    self.navigationItem.title = @"我的";
    
}

-(void)initTableview
{
    tabBasicInfo = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATION_TOTAL_HEIGHT) style:UITableViewStyleGrouped];
    tabBasicInfo.backgroundColor = [UIColor clearColor];
    tabBasicInfo.delegate = self;
    tabBasicInfo.dataSource = self;
    tabBasicInfo.bounces = NO;
    tabBasicInfo.separatorStyle = UITableViewCellSeparatorStyleNone;
    tabBasicInfo.showsVerticalScrollIndicator = YES;
    [self.view addSubview:tabBasicInfo];
    [tabBasicInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(5*(W_RATE));
        make.top.mas_equalTo(self.view.mas_top).offset(15*(H_RATE));
        make.right.mas_equalTo(self.view.mas_right).offset(-5*(W_RATE));
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    tabBasicInfo.contentInsetAdjustmentBehavior=UIScrollViewContentInsetAdjustmentAutomatic;
}

#pragma mark --------获取用户信息-------


#pragma mark ---tableview代理--
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strId = @"basicCell";
    BasicTableViewCell *cell = [[BasicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    
    switch (indexPath.section)
    {
        case 0:
            {
                cell.imgvHead.hidden = NO;
                cell.lbName.hidden = NO;
                cell.lbLine.hidden = YES;
                cell.lbTitle.hidden = YES;
                cell.lbContent.hidden = YES;
                cell.imgvHead.image = [UIImage imageNamed:@"heart1.jpg"];
                cell.lbName.text = dicContent[@"EMP_NAME"];
            }
            break;
        case 1:
        {
            cell.imgvHead.hidden = YES;
            cell.lbName.hidden = YES;
            cell.lbLine.hidden = NO;
            cell.lbTitle.hidden = NO;
            cell.lbContent.hidden = NO;
            cell.lbTitle.text = arrTittle[indexPath.row];
            switch (indexPath.row) {
                case 0:
                    {
                    cell.lbContent.text = dicContent[@"EMP_NO"];
                    }
                    break;
                case 1:
                {
                    cell.lbContent.text = dicContent[@"AREA"];
                }
                    break;
                case 2:
                {
                    cell.lbContent.text = dicContent[@"COMPANY"];
                }
                    break;
                case 3:
                {
                    cell.lbContent.text = dicContent[@"DEPT_NAME"];
                }
                    break;
                case 4:
                {
                    cell.lbContent.text = dicContent[@"EMP_MOBILE_TELNO"];
                }
                    break;
                case 5:
                {
                    cell.lbContent.text = dicContent[@"HEAD_SHIP"];
                }
                    break;
                case 6:
                {
                    cell.lbContent.text = dicContent[@"JITUAN"];
                }
                    break;
                case 7:
                {
                    cell.lbContent.text = dicContent[@"POST_LEVEL"];
                }
                    break;
                case 8:
                {
                    cell.lbContent.text = dicContent[@"POST_RANK_ID"];
                }
                    break;
                case 9:
                {
                    cell.lbContent.text = dicContent[@"IN_FOXCONN_DATE"];
                }
                    break;
                case 10:
                {
                    cell.lbContent.text = dicContent[@"WORK_YEARS"];
                }
                    break;
                case 11:
                {
                    cell.lbContent.text = dicContent[@"DEPT_COST"];
                }
                    break;
                case 12:
                {
                    cell.lbContent.text = dicContent[@"COMMITTEE_NAME"];
                    cell.lbLine.hidden = YES;
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            
        default:
            break;
    }
    
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }else
        return 13;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 135*(H_RATE);
    }
    return 56*(H_RATE);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10*(H_RATE);
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *uv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.000001)];
    uv.backgroundColor = [UIColor clearColor];
    return uv;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *uv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5*(H_RATE))];
    uv.backgroundColor = [UIColor clearColor];
    return uv;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
