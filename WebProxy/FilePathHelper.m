//
//  FilePathHelper.m
//  WebProxy
//
//  Created by Nuttapon Pattanavijit on 7/8/14.
//  Copyright (c) 2014 nuttt. All rights reserved.
//

#import "FilePathHelper.h"

@implementation FilePathHelper

+ (NSString*) path:(NSSearchPathDirectory) searchPathDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSUserDomainMask, YES);
    return paths[0];
}

+ (NSString*) documentPath
{
    return [self path:NSDocumentationDirectory];
}

+ (NSString*) documentPathOf:(NSString*)fileName
{
    return [[self documentPath] stringByAppendingPathComponent:fileName];
}

+ (NSString*) libraryPath
{
    return [self path:NSLibraryDirectory];
}

+ (NSString*) libraryPathOf:(NSString*)fileName
{
    return [[self libraryPath] stringByAppendingPathComponent:fileName];
}

+ (NSString*) cachePath
{
    return [self path:NSCachesDirectory];
}

+ (NSString*) cachePathOf:(NSString*)fileName
{
    return [[self cachePath] stringByAppendingPathComponent:fileName];
}

@end
