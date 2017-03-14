# DWQSearchWithHotAndHistory
带有热门和搜索历史的搜索框
![DWQ-LOGO.jpeg](http://upload-images.jianshu.io/upload_images/2231137-1545493cd60adb2b.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##引述
  在已上架的上百万个APP中，估计会有60%以上的app带有搜索功能🔍；用到搜索，我想大多数开发者首先会想到的是UISearchBar控件，UISearchBar是在iOS6之后加入的，那么之前搜索框的是用UITextfield实现的。今天要分享的这个带搜索历史和热门的搜索框就是基于UITextfield的。其实，虽然说是带搜索框和热门。SerchBar完全可以和下面的热门和历史分开。

##DWQSearchWithHotAndHistory组成

![DWQSearch.png](http://upload-images.jianshu.io/upload_images/2231137-3ccb597202e50702.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 1.DWQSearchBar   ：基于UITextfield定制的搜索框，方便设置圆角等。

- 2.DWQTagView     ：包含了Tagview和热门和历史的自定义Cell

##DWQSearchWithHotAndHistory的实现：

- 1.DWQSearchBar其实就是一个UITextfield，使用到了UITextfield的leftView；和UITextfield的代理方法

- 2.DWQTagView 根据文字长短改变tagView的Frame；处理titletag超出屏幕边界，主要操作逻辑为：

```objective-c

 /** 如果新的tagLab超出屏幕边界 */
        if (previousFrame.origin.x + previousFrame.size.width + textStrSize.width + HORIZONTAL_MARGIN > self.bounds.size.width) {
            newRect.origin = CGPointMake(10, previousFrame.origin.y + textStrSize.height + VERTICAL_MARGIN);
            totalHeight += textStrSize.height + VERTICAL_MARGIN;
        }
        else {
            newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + HORIZONTAL_MARGIN, previousFrame.origin.y);
        }
        newRect.size = textStrSize;
        [tag setFrame:newRect];
        previousFrame = tag.frame;
        [self setHight:self andHight:totalHeight + textStrSize.height];

```
- 3.热门和搜索历史都为TableView的一个自定义cell

##DWQSearchWithHotAndHistory的使用

- 1.将DWQSearchWithHotAndHistory拖入工程中

- 2.引入头文件 "DWQSearchBar.h ”"DWQTagView.h"
 "HistorySearchCell.h" "HotSerachCell.h"

- 3.创建DWQSearchBar，示例代码如下：

```objective-c
  self.view.backgroundColor=[UIColor whiteColor];
    DWQSearchBar *bar = [[DWQSearchBar alloc] initWithFrame:CGRectMake(0, 0, DWQMainScreenWidth - 100, 30)];
    bar.layer.cornerRadius=15;
    bar.layer.masksToBounds=YES;
    bar.placeholder=@"输入要学习的语言";
    _searchBar = bar;
    
    bar.delegate = self;
    self.navigationItem.titleView = bar;

```
- 2.初始化热门和历史走索需要的数据

```objective-c

 /**
     *  造热门搜索的假数据
     */
    self.historyArr = [NSMutableArray arrayWithObjects:@"C语言",@"C#",@"HTML5",@"objective-c?"@"Swift", nil];
    
    self.HotArr = [NSMutableArray arrayWithObjects:@"你想要搜索什么呢",@"web编程",@"JAVA8",@"JAVAVEE",@"Objective-c",@"SWift",@"iOS分享之路",@"MacBokPro",@"iOS直播",@"APPLE", nil];

```

- 3.创建TableView，并实现tableview的代理方法,部分代码示例

```objective-c
#pragma mark -- 懒加载
-(UITableView *)tableview
{
    if (!_tableview) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableview registerClass:[HotSerachCell class] forCellReuseIdentifier:HotCellID];
        [_tableview registerNib:[UINib nibWithNibName:@"HistorySearchCell" bundle:nil] forCellReuseIdentifier:HistoryCellID];
        _tableview.backgroundColor = [UIColor colorWithWhite:0.934 alpha:1.000];
    }
    return _tableview;
}

```
##DWQSearchWithHotAndHistory效果展示

![DWQSearch.gif](http://upload-images.jianshu.io/upload_images/2231137-11f7dd483fad38aa.gif?imageMogr2/auto-orient/strip)
