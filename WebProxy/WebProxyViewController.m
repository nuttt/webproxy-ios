//
//  WebProxyViewController.m
//  WebProxy
//
//  Created by Nuttapon Pattanavijit on 7/2/14.
//  Copyright (c) 2014 nuttt. All rights reserved.
//

#import "WebProxyViewController.h"

@interface WebProxyViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebProxyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"http://google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    
    _webView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
