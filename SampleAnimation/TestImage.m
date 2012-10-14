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
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            imgScopeView_.alpha = 0;
        }];
    }
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
