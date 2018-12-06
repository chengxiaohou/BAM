//
//  NewsVC.m
//  BAM
//
//  Created by 橙晓侯 on 2018/1/25.
//  Copyright © 2018年 橙晓侯. All rights reserved.
//

#import "NewsVC.h"

@interface NewsVC () <SFSafariViewControllerDelegate>
@property (weak, nonatomic) IBOutlet EETableView *tableView;
@property (weak, nonatomic) IBOutlet HMSegmentedControl *segment;

@end

@implementation NewsVC
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self configNotification];
    [self configUI];
//    [self refreshUI];
    [self configMultiTabDatas];
    [self configSegment];
    [self configMJRefresh];
}

#pragma mark 配置UI
- (void)configUI
{
    
}

#pragma mark 分栏数据准备
- (void)configMultiTabDatas
{
    TheTab *tab0     = [TheTab new];
    tab0.datas       = [NSMutableArray new];
    tab0.url         = @"https://sspai.com/feed";
    tab0.title       = @"少数派";
    tab0.typeName    = @"RSS文章列表";
    tab0.pageSize    = 10;
    tab0.pageNo      = 1;
    tab0.index       = 0;
    tab0.type        = @(tab0.index);
    
    TheTab *tab1     = [TheTab new];
    tab1.datas       = [NSMutableArray new];
    tab1.url         = @"http://www.zhihu.com/rss";
    tab1.title       = @"知乎";
    tab1.typeName    = @"RSS文章列表";
    tab1.pageSize    = 10;
    tab1.pageNo      = 1;
    tab1.index       = 1;
    tab1.type        = @(tab1.index);
    
    TheTab *tab2     = [TheTab new];
    tab2.datas       = [NSMutableArray new];
    tab2.url         = @"https://dedicated.wallstreetcn.com/rss.xml";
    tab2.title       = @"RSS文章列表";
    tab2.typeName    = tab2.title;
    tab2.pageSize    = 10;
    tab2.pageNo      = 1;
    tab2.index       = 2;
    tab2.type        = @(tab2.index);
    
    self.tabDatas = [@[tab0, tab1, tab2] mutableCopy];
}

#pragma mark 配置Segment
- (void)configSegment
{
    NSMutableArray *temps = [NSMutableArray new];
    for (TheTab *tab in self.tabDatas) {
        
        [temps addObject:tab.title];
    }
    
    _segment.sectionTitles = temps;
    
    _segment.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    _segment.segmentEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
    _segment.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    _segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
    // 类型宽度
    _segment.segmentWidthStyle = HMSegmentedControlSegmentWidthStyleFixed;
    
    // 边框
    _segment.borderType = HMSegmentedControlBorderTypeBottom;
    _segment.borderWidth = 1;
    _segment.borderColor = BGGreyColor;
    
    // 分割线
    _segment.verticalDividerEnabled = YES;
    _segment.verticalDividerColor = BGGreyColor;
    _segment.verticalDividerWidth = 1.0f;
    
    // 选择指示器
    _segment.selectionIndicatorHeight = 4.0f;
    _segment.selectionIndicatorColor = ThemeColor;
    
    // 文字
    _segment.titleTextAttributes = @{
                                     NSForegroundColorAttributeName : [UIColor blackColor],
                                     NSFontAttributeName : [UIFont systemFontOfSize:15.0f]
                                     };
    _segment.selectedTitleTextAttributes = @{
                                             NSForegroundColorAttributeName : ThemeColor,
                                             NSFontAttributeName : [UIFont systemFontOfSize:15.0f]
                                             };
    
    MJWeakSelf
    [_segment setIndexChangeBlock:^(NSInteger index) {
        
        weakSelf.tabIndex = index;
        [weakSelf.tableView.mj_header beginRefreshing];
    }];
}

#pragma mark 上下拉刷新
- (void)configMJRefresh
{
    MJRefreshNormalHeader *head = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self requestListAtPage:FirstPage];
    }];
    _tableView.mj_header = head;
    
    MJRefreshBackNormalFooter *foot = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        TheTab *t = self.tabDatas[self.tabIndex];
        [self requestListAtPage:t.pageNo+1];
    }];
    _tableView.mj_footer = foot;
    // 立即执行
    [_tableView.mj_header beginRefreshing];
}


#pragma mark 请求新闻分页列表
- (void)requestListAtPage:(NSInteger)page
{
    
    NSString *url = TAB.url;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 下载RSS数据源
        NSData *rssData = [IDNFeedParser dataFromUrl:url];
        // 读取获取RSS源基本信息
        IDNFeedInfo* info = [IDNFeedParser feedInfoWithData:rssData fromUrl:url];
        // 获取RSS文章列表
        Datas = [[IDNFeedParser feedItemsWithData:rssData fromUrl:url] mutableCopy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.title = info.title;
            [_tableView.mj_header endRefreshing];
            [_tableView reloadData];
        });
    });
    
}

#pragma mark - ......::::::: UITableViewDataSource :::::::......

#pragma mark TV段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark TV行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return TAB.datas.count;
}

#pragma mark ［配置TV单元格］
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TVCell *cell = [tableView dequeueReusableCellWithIdentifier:TAB.typeName forIndexPath:indexPath];
    NSArray *arr = Datas;
    IDNFeedItem *mod = Datas[ROW];
    cell.lb1.text = mod.title;
    SetImageViewImageWithURL_P(cell.imgView1, mod.image)
    return cell;
}

#pragma mark TV单元格点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    IDNFeedItem *mod = Datas[ROW];
    NSURL *url = [NSURL URLWithString:mod.link];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
    safariVC.delegate = self;
    [self presentViewController:safariVC animated:1 completion:nil];
}

- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller
{
    [controller.navigationController popViewControllerAnimated:1];
}

@end
