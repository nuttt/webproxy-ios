//
//  LocalCache.m
//  WebProxy
//
//  Created by Nuttapon Pattanavijit on 7/8/14.
//  Copyright (c) 2014 nuttt. All rights reserved.
//

#import "LocalCache.h"
#import "FilePathHelper.h"
#import "sqlite3.h"

NSString *DATABASE_FILE = @"localCache.sqlite";

@interface LocalCache()

@property (nonatomic) sqlite3 *database;

@end

@implementation LocalCache

- (instancetype)init
{
    self = [super init];
    
    if(self) {
        [self initTable];
    }
    
    return self;
}

- (void)open {
    
    NSString *stringPath = [FilePathHelper libraryPathOf:DATABASE_FILE];
    int status = sqlite3_open([stringPath UTF8String], &_database);
    
    if(status != SQLITE_OK) {
        _database = NULL;
    }
    
}

- (void)close
{
    sqlite3_close(_database);
}


- (int) initTable {
    
    [self open];
    
    char *errorMessage;
    const char *query = "CREATE TABLE IF NOT EXISTS request_cache (request TEXT PRIMARY KEY  NOT NULL , filepath TEXT NOT NULL )";
    
    int result = sqlite3_exec(self.database, query, NULL, NULL, &errorMessage);
    
    [self close];
    
    return result;
    
}

- (void) test
{
    [self addFilePath:@"path3" forRequest:@"request3"];
}

- (void) addFilePath: (NSString*) filepath
               forRequest: (NSString*) request
{
    [self open];
    char *sql = "insert into request_cache values (?, ?);";
    sqlite3_stmt *stmt;
    if (sqlite3_prepare_v2(self.database, sql, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [request UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [filepath UTF8String], -1, NULL);
    }
    if (sqlite3_step(stmt) != SQLITE_DONE)
        NSLog(@"This should be real error checking!");
    sqlite3_finalize(stmt);
    [self close];
}

- (NSString*) getFilePathFromRequest: (NSString*) requestString
{
    
    [self open];
    
    const char *errorMessage;
    const char *query = [[NSString stringWithFormat:@"select * from request_cache where request='%@'", requestString] UTF8String];
    
    sqlite3_stmt *statement;
    
    NSString *filePathString;
    
    if(sqlite3_prepare_v2(self.database, query, -1, &statement, &errorMessage) == SQLITE_OK){
        
        while(sqlite3_step(statement) == SQLITE_ROW) {
//            char *request = (char*) sqlite3_column_text(statement, 0);
            char *filepath = (char*) sqlite3_column_text(statement, 1);
            
            filePathString = [NSString stringWithUTF8String:filepath];
        }
        
        sqlite3_finalize(statement);
    }
    
    [self close];
    
    return filePathString;
}

@end
