//
//  FilePathHelper.h
//  WebProxy
//
//  Created by Nuttapon Pattanavijit on 7/8/14.
//  Copyright (c) 2014 nuttt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilePathHelper : NSObject

+ (NSString*) path:(NSSearchPathDirectory) searchPathDirectory;

+ (NSString*) documentPath;
+ (NSString*) documentPathOf:(NSString*)fileName;

+ (NSString*) libraryPath;
+ (NSString*) libraryPathOf:(NSString*)fileName;

+ (NSString*) cachePath;
+ (NSString*) cachePathOf:(NSString*)fileName;

@end
