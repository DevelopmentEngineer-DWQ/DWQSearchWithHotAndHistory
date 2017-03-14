//
//  DWQTagView.h
//  DWQSearchWithHotAndHistory
//  ----------------------搜索用的标签View、----------------------
//  Created by 杜文全 on 16/8/14.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import <UIKit/UIKit.h>

@protocol DWQTagViewDelegate <NSObject>

-(void)DWQTagView:(UIView*)dwq fetchWordToTextFiled:(NSString *)KeyWord;;

@end

@interface DWQTagView : UIView<UIGestureRecognizerDelegate>
{
    CGRect previousFrame;
    NSInteger totalHeight;
}
@property (nonatomic, weak) id<DWQTagViewDelegate> delegate;
/**
 *  整个View的背景颜色
 */
@property (nonatomic, strong) UIColor *BigBGColor;
/**
 *  设置子标签View的单一颜色
 */
@property (nonatomic, strong) UIColor *singleTagColor;
/**
 *  标签文本数组的赋值
 */
-(void)setTagWithTagArray:(NSArray *)arr;

@end
