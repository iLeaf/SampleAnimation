//
//  studio_iLeafViewController.m
//  SampleAnimation
//
//  Created by Atsushi Hirasugi on 12/10/14.
//  Copyright (c) 2012年 Atsushi Hirasugi. All rights reserved.
//

#import "studio_iLeafViewController.h"

@interface studio_iLeafViewController ()

@end

@implementation studio_iLeafViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //UIImage *img = [UIImage imageNamed:@"dripimg.png"];
    tst_ = [[TestImage alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    
    //tst.image = img;
    //tst.contentMode = UIViewContentModeScaleAspectFit;
    //tst.contentMode = UIViewContentModeCenter;
    
    //UIImage *img = [UIImage imageNamed:@"dripimg.png"];
    //TestImage *tst = [[TestImage alloc] initWithImage:nil];
    
    [self.view addSubview:tst_];
    //[self.view setNeedsDisplay];
    
}


-(IBAction)testButton:(id)sender {
    [tst_ scopeOn];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
