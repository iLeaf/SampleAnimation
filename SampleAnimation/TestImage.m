//
//  testImage.m
//  SampleAnimation
//
//  Created by Atsushi Hirasugi on 12/10/14.
//  Copyright (c) 2012年 Atsushi Hirasugi. All rights reserved.
//

#import "TestImage.h"

@implementation TestImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // 任意のタッチ範囲をframeに指定 （この場合は画像サイズ）
        UIImage *img = [UIImage imageNamed:@"dripimg.png"];
        self.frame = CGRectMake(100,
                                100,
                                img.size.width,
                                img.size.height);
        self.backgroundColor = [UIColor blueColor];
        
        
        //self.contentMode = UIViewContentModeCenter;
        //UIImage *img2 = [UIImage imageNamed:@"tabimg1@2x.png"];
        
        
        // 波画像表示
        imgRippleView_ = [[UIImageView alloc] initWithImage:img];
        [self addSubview:imgRippleView_];
        imgRippleView_.frame = CGRectMake(imgRippleView_.frame.origin.x,
                                   imgRippleView_.frame.origin.y,
                                   imgRippleView_.frame.size.width/2,
                                   imgRippleView_.frame.size.height/2);
        imgRippleView_.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        
        // スコープ画像
        UIImage *imgScope = [UIImage imageNamed:@"dripimg.png"];
        imgScopeView_ = [[UIImageView alloc] initWithImage:imgScope];
        [self addSubview:imgScopeView_];
        imgScopeView_.frame = CGRectMake(imgScopeView_.frame.origin.x+10,
                                   imgScopeView_.frame.origin.y-30,
                                   imgScopeView_.frame.size.width/2,
                                   imgScopeView_.frame.size.height/2);
        
        
        // 中心にマーカーを表示
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        [self addSubview:imgView];
        imgView.frame = CGRectMake(imgView.frame.origin.x,
                                   imgView.frame.origin.y,
                                   imgView.frame.size.width/2,
                                   imgView.frame.size.height/2);
        imgView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        imgView.backgroundColor = [UIColor redColor];
        
        
        //NSLog(@"%f %f", img.size.width, img.size.height);
    }
    
    return self;
}

-(void)scopeOn
{
    if (imgScopeView_.alpha == 0) {
        [UIView animateWithDuration:0.2 animations:^{
            imgScopeView_.alpha = 1;
            [self startRippling];
            self.animating = YES;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            imgScopeView_.alpha = 0;
            self.animating = NO;
        }];
    }
}


// 波紋のアニメーションを開始する
- (void)startRippling
{
    if(self.animating) return;
    
    // 初期状態の設定
    // 最初は frame の中心に 0x0 のサイズで．
    //imgRippleView_.bounds = CGRectMake(imgRippleView_.frame.size.width/2, imgRippleView_.frame.size.height/2, 0, 0);
    
    imgRippleView_.bounds = CGRectMake(0, 0,
                                       imgRippleView_.frame.size.width/2,
                                       imgRippleView_.frame.size.height/2);
    imgRippleView_.alpha = 1.0; // alphaを0にする
    
    [UIView animateWithDuration:1.5f // 1.5秒置きに
                          delay:0.0f // 0.0秒後から
                        options:UIViewAnimationOptionRepeat // 永遠に繰り返す
     |UIViewAnimationOptionCurveEaseOut // 初めは早く終わりは遅くなるような変化
     |UIViewAnimationOptionAllowUserInteraction // アニメーション中でもユーザによるViewの操作を可能にする
                     animations:^{
                         // このブロックの中にアニメーションの最終状態を記述する
                         imgRippleView_.alpha = 0.0; // alphaを0にする
                         imgRippleView_.bounds = CGRectMake(0, 0,
                                                            imgRippleView_.frame.size.width*2,
                                                            imgRippleView_.frame.size.height*2);
                     }
                     completion:nil]; // アニメーションが終わっても何もしない
    self.animating = YES;
}


-(void)drawRect:(CGRect)rect {
    NSLog(@"drawRect");
}

/*
// 画面描画
- (void)drawRect:(CGRect)rect {
    
    NSLog(@"drawRect");
    
    // グラフィックコンテキスト取得
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // CoreGraphicsの原点が左下なので原点を合わせる
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 線の色を R,G,B,A で設定
    CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0);
    // 線の太さ
    CGContextSetLineWidth(context, 10);
    
    // Pathを作成
    CGContextBeginPath(context);
    // Pathの位置設定
    CGContextMoveToPoint(context, 100.0, 100.0);
    CGContextAddLineToPoint(context, 50.0, 150.0);
    CGContextAddLineToPoint(context, 100.0, 150.0);
    // Pathの描画
    CGContextDrawPath(context, kCGPathStroke);
    
    // 描画
    CGContextFlush(context);
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
