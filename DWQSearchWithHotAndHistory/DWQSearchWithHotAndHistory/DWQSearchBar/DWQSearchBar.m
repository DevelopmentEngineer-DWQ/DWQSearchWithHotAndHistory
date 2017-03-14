//
//  XZSearchBar.m
//  DWQSearchWithHotAndHistory
//
//  Created by 杜文全 on 16/8/14.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved. © 2016年 Fangxuele－iOS. All rights reserved.
//

#import "DWQSearchBar.h"
#import "UIViewExt.h"
@implementation DWQSearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.placeholder = @"搜索你想要学习的语言";
//        [self setValue:LLColor(232, 178, 176) forKeyPath:@"_placeholderLabel.textColor"];
        self.layer.masksToBounds = YES;
//        self.layer.cornerRadius  = 15;
        self.backgroundColor = [UIColor colorWithRed:236/255.0 green:237/255.0 blue:232/255.0 alpha:1];
        self.returnKeyType=UIReturnKeySearch;
        // 添加搜索图
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索-拷贝"]];
        imgView.contentMode = UIViewContentModeCenter;
        imgView.width += 30;
        self.leftView = imgView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.returnKeyType =UIReturnKeySearch;

    }
    
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
