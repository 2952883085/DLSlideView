//
//  DLTabbarView.h
//  DLSlideViewDemo
//
//  Created by 苏东乐 on 16/6/22.
//  Copyright © 2016年 dongle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLTabbarProtocol.h"
#import "DLTabbarItemViewProtocol.h"
#import "DLTabbarTrackerViewProtocol.h"

//@protocol DLTabbarViewDelegate
//- (void)DLTabbarView:(id)sender switchingFrom:(NSInteger)fromIndex view:(UIView *)fromView to:(NSInteger)toIndex view:(UIView *)toView percent:(float)percent;
//- (UIView *)DLTabbarView:(id)sender viewAtIndex:(NSInteger)index;
//- (CGFloat)DLTabbarView:(id)sender widthAtIndex:(NSInteger)index;
//- (void)DLTabbarView:(id)sender selectAt:(NSInteger)index view:(UIView *)selectedView deSelectedAt:(NSInteger)deIndex view:(UIView *)deSelectedView;
//
//@property(nonatomic, readonly) NSInteger tabbarCount;
//@end

@interface DLTabbarView : UIView <DLTabbarProtocol>
@property(nonatomic, strong) NSArray<UIView<DLTabbarItemViewProtocol> *> *barItemViewArray;
@property(nonatomic, strong) UIView<DLTabbarTrackerViewProtocol>* trackerView;

@property(nonatomic, assign) UIEdgeInsets insets;
@property(nonatomic, assign) CGFloat itemSpaceX;
@property(nonatomic, strong) UIView *backgroundView;

@property(nonatomic, readonly) UIScrollView *scrollView;

- (void)rebuildTabbar;

// DLSlideTabbarProtocol
@property(nonatomic, assign) NSInteger selectedIndex;
@property(nonatomic, readonly) NSInteger tabbarCount;
@property(nonatomic, weak) id<DLTabbarDelegate> delegate;

- (void)switchingFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex percent:(float)percent;

@end
