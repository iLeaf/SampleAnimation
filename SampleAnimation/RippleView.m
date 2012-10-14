//
//  RippleView.m
//  SampleAnimation
//
//  Created by Atsushi Hirasugi on 12/10/14.
//  Copyright (c) 2012年 Atsushi Hirasugi. All rights reserved.
//

#import "RippleView.h"

@implementation RippleView

@synthesize animating=animating_;

- (id)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    self.animating = NO;
    return self;
}

// 波紋のアニメーションを開始する
- (void)startRippling
{
    if(self.animating) return;
    
    // 初期状態の設定
    // 最初は frame の中心に 0x0 のサイズで．
    self.bounds = CGRectMake(self.frame.size.width/2, self.frame.size.height/2, 0, 0);
    [UIView animateWithDuration:1.5f // 1.5秒置きに
                          delay:0.0f // 0.0秒後から
                        options:UIViewAnimationOptionRepeat // 永遠に繰り返す
     |UIViewAnimationOptionCurveEaseOut // 初めは早く終わりは遅くなるような変化
     |UIViewAnimationOptionAllowUserInteraction // アニメーション中でもユーザによるViewの操作を可能にする
                     animations:^{
                         // このブロックの中にアニメーションの最終状態を記述する
                         self.alpha = 0.0; // alphaを0にする
                         self.bounds = CGRectMake(0, 0, 192, 192); // 波紋のサイズを192x192でframe全体に
                     }
                     completion:nil]; // アニメーションが終わっても何もしない
    self.animating = YES;
}

@end
