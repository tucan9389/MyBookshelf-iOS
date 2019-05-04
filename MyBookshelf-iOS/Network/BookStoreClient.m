//
//  BookStoreAPIClient.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookStoreClient.h"

#import "BookModel.h"
#import "BookDetailModel.h"

NSString *const Scheme = @"https";
NSString *const BaseURL = @"api.itbook.store";

@implementation BookStoreClient

static BookStoreClient *_sharedInstance = nil;

+(BookStoreClient *)shared {
    @synchronized([BookStoreClient class]) {
        if (!_sharedInstance)
            _sharedInstance = [[self alloc] init];
        return _sharedInstance;
    }
    return nil;
}

-(void)requestWithPath: (NSString *)path params: (NSDictionary *)params completion: (void (^)(id))completion {
    NSURLComponents *components = [NSURLComponents new];
    [components setScheme:Scheme];
    [components setHost:BaseURL];
    for (NSString *key in params.allKeys) {
        [components setQuery: [NSString stringWithFormat:@"%@=%@", key, params[key]]];
    }
    [components setPath:path];
    
    NSURL *url = [components URL];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        id jsonDictionaryOrArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError || !jsonDictionaryOrArray) {
            NSLog(@"json error : %@", [jsonError localizedDescription]);
            completion(nil);
        } else {
            completion(jsonDictionaryOrArray);
        }
    }];
    [downloadTask resume];
}

-(void)requestNewAPIWithCompletion: (void (^)(NSArray *))completion {
    NSString *path = @"/1.0/new";
    
    [self requestWithPath:path params:@{} completion:^(id result) {
        if (result) {
            NSArray *books = [self convertToBookModelWithJSON: result[@"books"]];
            completion(books);
        } else {
            completion(@[]);
        }
    }];
}

-(void)requestSearchAPIWithQuery: (NSString *)query page: (NSNumber *)page completion: (void (^)(NSArray *))completion {
    NSString *path = @"/1.0/search";
    if (query) {
        path = [NSString stringWithFormat:@"%@/%@", path, query];
        if (page) {
            path = [NSString stringWithFormat:@"%@/%@", path, page];
        }
    }
    
    [self requestWithPath:path params:@{} completion:^(id result) {
        if (result) {
            NSArray *books = [self convertToBookModelWithJSON: result[@"books"]];
            completion(books);
        } else {
            completion(@[]);
        }
    }];
}

-(void)requestDetailBookAPIWithQuery: (NSNumber *)isbn13 completion: (void (^)(BookDetailModel *))completion {
    NSString *path = @"/1.0/books";
    if (isbn13) {
        path = [NSString stringWithFormat:@"%@/%@", path, isbn13];
    }
    
    [self requestWithPath:path params:@{} completion:^(id result) {
        if (result) {
            BookDetailModel *bookDetail = [[BookDetailModel alloc] initWithInfo: result];
            completion(bookDetail);
        } else {
            completion(nil);
        }
    }];
}

-(NSArray *)convertToBookModelWithJSON: (NSArray *)bookInfos {
    if (bookInfos) {
        NSMutableArray *books = [[NSMutableArray alloc] init];
        for (int i=0; i<bookInfos.count; i++) {
            NSDictionary *bookInfo = bookInfos[i];
            BookModel *book = [[BookModel alloc] initWithInfo: bookInfo];
            [books addObject:book];
        }
        return books;
    } else {
        return @[];
    }
}

@end
