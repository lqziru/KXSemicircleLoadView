//
//  PayAnimateView.h
//  PayLoadingView
//
//  Created by yite on 2018/12/21.
//  Copyright © 2018 yite. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface KXSemicircleLoadView : UIView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat lineWidth;

- (void)start;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
