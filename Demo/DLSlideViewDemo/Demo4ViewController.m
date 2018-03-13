//
//  NavigationBarDemoViewController.m
//  DLSlideViewDemo
//
//  Created by dongle on 12/3/18.
//  Copyright © 2018年 dongle. All rights reserved.
//

#import "Demo4ViewController.h"
#import "DLSlideView.h"
#import "DLTabbarView.h"
#import "DLTitleBarItemView.h"
#import "DLBottomTrackerView.h"
#import "PageNViewController.h"

@interface Demo4ViewController ()<DLTabbarDelegate, DLSlideViewDelegate, DLSlideViewDataSource>
@property (strong, nonatomic) DLTabbarView *slideBarView;
@property (strong, nonatomic) DLSlideView *slideView;

@end

@implementation Demo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.slideView = [[DLSlideView alloc] initWithFrame:self.view.bounds];
    self.slideView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.slideView];
    
    self.slideBarView = [[DLTabbarView alloc] initWithFrame: CGRectMake(50, 0, 320-100, 35)];
    self.slideBarView.insets = UIEdgeInsetsMake(5, 3, 2, 2);
    self.slideBarView.itemSpaceX = 3;
    self.navigationItem.titleView = self.slideBarView;
    self.slideView.delegate = self;
    self.slideView.dataSource = self;
    self.slideView.basedViewController = self;
    
    self.slideBarView.delegate = self;
    
    DLTitleBarItemConfiguration *config = [DLTitleBarItemConfiguration new];
    config.itemNormalFont = [UIFont systemFontOfSize:12];
    config.itemNormalColor = [UIColor blackColor];
    config.itemSelectedColor = [UIColor redColor];
    NSMutableArray *itemArray = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        DLTitleBarItemView *itemView = [[DLTitleBarItemView alloc] initWithFrame:CGRectMake(0, 0, 30, 30) title:[NSString stringWithFormat:@"title%d", i] configuration:config];
        [itemArray addObject:itemView];
    }
    self.slideBarView.barItemViewArray = itemArray;
    
    DLBottomTrackerView *tracker = [[DLBottomTrackerView alloc] initWithFrame:CGRectMake(0, 0, 10, 2)];
    tracker.bottomPadding = 2;
    tracker.backgroundColor = [UIColor redColor];
    self.slideBarView.trackerView = tracker;
    
    [self.slideBarView rebuildTabbar];
    self.slideView.selectedIndex = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark DLSlideBarDelegate
- (void)DLTabbar:(id)sender selectedAt:(NSInteger)index{
    self.slideView.selectedIndex = index;
}

#pragma mark DLSlideView
- (NSInteger)numberOfControllersInDLSlideView:(DLSlideView *)sender{
    return 3;
}

- (UIViewController *)DLSlideView:(DLSlideView *)sender controllerAt:(NSInteger)index{
    PageNViewController *ctrl = [[PageNViewController alloc] init];
    int32_t rgbValue = rand();
    ctrl.view.backgroundColor = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    ctrl.pageLabel.text = [NSString stringWithFormat:@"%ld", (long)index];
    return ctrl;
}

- (void)DLSlideView:(DLSlideView *)slide switchingFrom:(NSInteger)oldIndex to:(NSInteger)toIndex percent:(float)percent{
    [self.slideBarView switchingFromIndex:oldIndex toIndex:toIndex percent:percent];
}
- (void)DLSlideView:(DLSlideView *)slide didSwitchTo:(NSInteger)index{
    [self.slideBarView setSelectedIndex:index];
}
- (void)DLSlideView:(DLSlideView *)slide switchCanceled:(NSInteger)oldIndex{
    [self.slideBarView setSelectedIndex:oldIndex];
}

@end
