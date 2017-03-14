//
//  HistorySearchCell.h
//  DWQSearchWithHotAndHistory
//  Created by 杜文全 on 16/8/14.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import <UIKit/UIKit.h>

@interface HistorySearchCell : UITableViewCell
/** 历史搜索标签名 */
@property (weak, nonatomic) IBOutlet UILabel *tagNameLab;
/** 删除标签Btn */
@property (weak, nonatomic) IBOutlet UIButton *removeTagBtn;

@end
