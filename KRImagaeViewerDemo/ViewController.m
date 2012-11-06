//
//  ViewController.m
//  KRImagaeViewerDemo
//
//  Created by Kalvar on 12/10/21.
//  Copyright (c) 2012年 Kuo-Ming Lin. All rights reserved.
//

#import "ViewController.h"
#import "KRImageViewer.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize krImageViewer;

- (void)viewDidLoad
{
    krImageViewer = [[KRImageViewer alloc] initWithDragMode:krImageViewerModeOfTopToBottom];
    self.krImageViewer.maxConcurrentOperationCount = 1;
    self.krImageViewer.dragDisapperMode            = krImageViewerDisapperAfterMiddle;
    self.krImageViewer.allowOperationCaching       = YES;
    [self preloads];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [self.krImageViewer resetView:self.view.window];
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [krImageViewer release];
    [super dealloc];
}

#pragma Method Samples
-(void)preloads{
    //To setup the Keys and URLs.
    NSDictionary *_downloads = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"http://farm9.staticflickr.com/8459/7945134514_e5a779ee5f_s.jpg", @"1",
                                @"http://farm9.staticflickr.com/8435/7944303392_a856d79802_s.jpg", @"2",
                                @"http://farm9.staticflickr.com/8449/7943919662_67f7345f8b_s.jpg", @"3",
                                nil];
    //We suggest the to preload the Images.
    [self.krImageViewer preloadImageURLs:_downloads];
}

-(IBAction)browsingPreloads:(id)sender{
    self.krImageViewer.scrollToPage     = 2;
    [self.krImageViewer start];
}

-(IBAction)browsingURLs:(id)sender{
    NSDictionary *_downloads = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"http://farm9.staticflickr.com/8459/7945134514_e5a779ee5f_s.jpg", @"1",
                                @"http://farm9.staticflickr.com/8435/7944303392_a856d79802_s.jpg", @"2",
                                @"http://farm9.staticflickr.com/8449/7943919662_67f7345f8b_s.jpg", @"3",
                                nil];
    
    //Another browsing method of the images.
    [self.krImageViewer browseImageURLs:_downloads];
    
    //Or you can browse an image as you wanna watch.
    [self.krImageViewer browseAnImageURL:@"http://farm9.staticflickr.com/8449/7943919662_67f7345f8b_s.jpg"];
}

-(IBAction)browsingImages:(id)sender{
    //Or you can browse UIImages.
    NSArray *_directWatchs = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"image1.jpg"],
                              [UIImage imageNamed:@"image2.jpg"],
                              [UIImage imageNamed:@"image3.jpg"],
                              [UIImage imageNamed:@"image4.jpg"],
                              [UIImage imageNamed:@"image5.jpg"],
                              nil];
    [self.krImageViewer browseImages:_directWatchs];
}

@end