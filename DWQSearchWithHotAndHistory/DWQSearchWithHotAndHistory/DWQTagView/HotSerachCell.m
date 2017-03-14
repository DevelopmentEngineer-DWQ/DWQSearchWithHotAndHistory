//
//  HotSerachCell.m
//  DWQSearchWithHotAndHistory
//
//  Created by 杜文全 on 16/8/14.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import "HotSerachCell.h"

@implementation HotSerachCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.dwqTagV = [[DWQTagView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 0)];
        self.contentView.userInteractionEnabled = YES;
        [self.contentView addSubview:self.dwqTagV];
    }
    return self;
}

-(void)setHotSearchArr:(NSArray *)hotSearchArr
{
    _hotSearchArr = hotSearchArr;

    /** 注意cell的subView的重复创建！（内部已经做了处理了......） */
    [self.dwqTagV setTagWithTagArray:hotSearchArr];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
