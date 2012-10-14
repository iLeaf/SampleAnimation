//
//  testImage.h
//  SampleAnimation
//
//  Created by Atsushi Hirasugi on 12/10/14.
//  Copyright (c) 2012年 Atsushi Hirasugi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestImage : UIImageView {
    UIImageView *imgScopeView_;
    UIImageView *imgRippleView_;
}

@property BOOL animating;

- (void)startRippling;

-(void)scopeOn;

@end
