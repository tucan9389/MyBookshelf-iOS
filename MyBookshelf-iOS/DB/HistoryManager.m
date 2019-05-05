//
//  HistoryManager.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 04/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "HistoryManager.h"
#import "BookDetailModel.h"
#import "BookDBManager.h"

static NSString *const historyKey = @"history";

@interface HistoryManager()

@property (nonatomic, strong) BookDBManager* dbManager;

@end

@implementation HistoryManager

static HistoryManager *_sharedInstance = nil;

+(HistoryManager *)shared {
    @synchronized([HistoryManager class]) {
        if (!_sharedInstance)
            _sharedInstance = [[self alloc] init];
        return _sharedInstance;
    }
    return nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.dbManager = [[BookDBManager alloc] initWithKey:historyKey];
    }
    return self;
}

-(void)readWithDetailModel: (BookModel *)bookDetail {
    [self.dbManager addBook:bookDetail];
}

-(NSArray *)bookmarks {
    return [self.dbManager bookmarks];
}


@end
