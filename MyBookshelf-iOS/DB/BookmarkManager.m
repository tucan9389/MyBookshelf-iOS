//
//  BookmarkManager.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 04/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookmarkManager.h"
#import "BookDetailModel.h"
#import "BookDBManager.h"

static NSString *const bookmarkKey = @"bookmarks";

@interface BookmarkManager()

@property (nonatomic, strong) BookDBManager* dbManager;

@end

@implementation BookmarkManager

static BookmarkManager *_sharedInstance = nil;

+(BookmarkManager *)shared {
    @synchronized([BookmarkManager class]) {
        if (!_sharedInstance)
            _sharedInstance = [[self alloc] init];
        return _sharedInstance;
    }
    return nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dbManager = [[BookDBManager alloc] initWithKey:bookmarkKey];
    }
    return self;
}

-(void)bookmarkWithDetailModel: (BookModel *)book {
    [self.dbManager addBook:book];
}

-(void)unbookmarkWithDetailModel: (BookModel *)book {
    [self.dbManager removeBook:book];
}

-(NSArray *)bookmarks {
    return [self.dbManager bookmarks];
}

-(BOOL)contains: (BookModel *)book {
    for (BookModel *b in self.bookmarks) {
        if ([b.isbn13 isEqualToString:book.isbn13]) return YES;
    }
    return NO;
}

@end
