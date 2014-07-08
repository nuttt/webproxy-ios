//
//  UrlCache.m
//  WebProxy
//
//  Created by Nuttapon Pattanavijit on 7/2/14.
//  Copyright (c) 2014 nuttt. All rights reserved.
//

#import "UrlCache.h"

@implementation UrlCache

- (NSCachedURLResponse *)cachedResponseForRequest:(NSURLRequest *)request
{
    
    
    NSLog(@"\n\n------------------------------\n\n");
    
    
    NSLog(@"request string: %@", [[request URL] absoluteString]);
    
    NSLog(@"request header field: %@", [request allHTTPHeaderFields]);
    
//    NSString *http = [[NSString alloc] initWithData:[request HTTPBody] encoding:NSUTF8StringEncoding];
//    NSLog(@"Body: %@", http);
    
    NSLog(@"body length:%d",[[request HTTPBody] length]);
    NSLog(@"method: %@",[request HTTPMethod]);
    

    
    NSCachedURLResponse *cacheResponse = [super cachedResponseForRequest:request];
    
    NSData *data = [cacheResponse data];
    
//    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    NSURLResponse *response = [cacheResponse response];
    NSString *mime = [response MIMEType];
    
    NSLog(@"MIME: %@", mime);
    
//    NSHTTPURLResponse *httpresponse = (NSHTTPURLResponse*) response;
    
//    NSLog(@"hexData: %@", [data description]);
    
//    NSLog(@"hexData: @%", [data description]);
//    NSLog(@"stringDataSample: %@",[dataString substringToIndex:MAX([dataString length] - 1, 50)]);
    
    
    return cacheResponse;
}

@end
