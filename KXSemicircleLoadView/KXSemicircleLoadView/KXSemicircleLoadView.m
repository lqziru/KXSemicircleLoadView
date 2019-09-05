//
//  PayAnimateView.m
//  PayLoadingView
//
//  Created by yite on 2018/12/21.
//  Copyright © 2018 yite. All rights reserved.
//

#import "KXSemicircleLoadView.h"

@interface KXSemicircleLoadView()<CAAnimationDelegate>
{
    float rate;
}
@property (strong,nonatomic)CAShapeLayer *roundLayer;
#define ANIMATETIME 0.8
@end

@implementation KXSemicircleLoadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.color = [UIColor colorWithWhite:0.6 alpha:1];
        self.lineWidth = 2;
        [self addAnimationLayer];
    }
    
    return self;
}

- (void)addAnimationLayer {
    CGSize size = self.bounds.size;
    
    UIBezierPath *roundPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:size.height/2];
    
    self.roundLayer.path = roundPath.CGPath;
    self.roundLayer.strokeColor = self.color.CGColor;
    self.roundLayer.fillColor = [UIColor clearColor].CGColor;
    self.roundLayer.frame = CGRectMake(0, 0, size.width, size.height);
    self.roundLayer.lineWidth = self.lineWidth;
    self.roundLayer.hidden = YES;
    self.roundLayer.lineCap = kCALineCapRound;
    [self.layer addSublayer:self.roundLayer];
}

- (void)start
{
    self.roundLayer.hidden = NO;
    [self showDoingAnimation];
}

- (void)stop
{
    self.roundLayer.hidden = YES;
    [self.roundLayer removeAllAnimations];
}

- (void)showDoingAnimation {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.repeatCount = MAXFLOAT;
    
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    startAnimation.fromValue = @(0);
    startAnimation.toValue = @(0.9);
    startAnimation.beginTime = 0 ;
    startAnimation.duration = ANIMATETIME;
    startAnimation.fillMode = kCAFillModeForwards;
    startAnimation.removedOnCompletion  = NO;
    startAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.62 :0.0 :0.38 :1.0];
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    endAnimation.fromValue = @(0);
    endAnimation.toValue = @(0.9);
    endAnimation.duration = ANIMATETIME;
    endAnimation.beginTime = ANIMATETIME;
    endAnimation.fillMode = kCAFillModeForwards;
    endAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.62 :0.0 :0.38 :1.0];
    
    rate = M_PI/2;
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @(rate);
    rotationAnimation.toValue = @(rate + 2 * M_PI);
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotationAnimation.duration = 2*ANIMATETIME;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    
    group.removedOnCompletion = NO;
    group.animations = @[startAnimation,endAnimation,rotationAnimation];
    group.duration = 2*ANIMATETIME;
    [self.roundLayer removeAllAnimations];
    [self.roundLayer addAnimation:group forKey:@"round_group_ani"];
    
    [CATransaction commit];
}

- (CAShapeLayer *)roundLayer {
    if(!_roundLayer) {
        _roundLayer  = [CAShapeLayer layer];
    }
    return _roundLayer;
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.roundLayer.strokeColor = color.CGColor;
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    self.roundLayer.lineWidth = lineWidth;
}

@end
