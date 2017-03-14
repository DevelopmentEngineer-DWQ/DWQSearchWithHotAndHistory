//
//  HotSerachCell.h
//  DWQSearchWithHotAndHistory
//
//  Created by 杜文全 on 16/8/14.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import <UIKit/UIKit.h>
#import "DWQTagView.h"

@interface HotSerachCell : UITableViewCell

/** 热门搜索tagView */
@property (nonatomic, strong) DWQTagView *dwqTagV;

/** 热门搜索标签的数据源数组 */
@property (nonatomic, strong) NSArray *hotSearchArr;

@end
