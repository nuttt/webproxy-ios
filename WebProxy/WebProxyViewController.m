//
//  WebProxyViewController.m
//  WebProxy
//
//  Created by Nuttapon Pattanavijit on 7/2/14.
//  Copyright (c) 2014 nuttt. All rights reserved.
//

#import "WebProxyViewController.h"
#import "UrlCache.h"
#import "LocalCache.h"

@interface WebProxyViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) UrlCache *cache;

@end

@implementation WebProxyViewController

- (UrlCache *)cache {
    if(!_cache) {
        _cache = [[UrlCache alloc] init];
    }
    return _cache;
}

- (NSString*) dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    return paths[0];
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//    
//    [NSURLCache setSharedURLCache:self.cache];
//    [self.cache removeAllCachedResponses];
//    
//    NSURL *url = [NSURL URLWithString:@"http://www.blognone.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [_webView loadRequest:request];
//    
//}

//- (void)viewDidLoad
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
//    
//    NSString *documentDirectory = [self dataFilePath];
//    NSString *tempDir = NSTemporaryDirectory();
//    
//    NSString *tempFile = [tempDir stringByAppendingPathComponent:@"text.txt"];
//    NSLog(@"@%", tempDir);
//    
//    
//    
//    sqlite3 *database;
//    
//    int result = sqlite3_open("", <#sqlite3 **ppDb#>)
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LocalCache *l = [[LocalCache alloc] init];
    
    [l test];
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
