//
//  BookDBManager.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 04/05/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookDBManager.h"
#import "BookModel.h"

@interface BookDBManager()

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSMutableArray *_bookmarks;

@end

@implementation BookDBManager

- (instancetype)initWithKey:(NSString *)key
{
    self = [super init];
    if (self) {
        self.key = key;
    }
    return self;
}

-(NSMutableArray *)bookmarks {
    if (!self._bookmarks) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
        NSArray *storedBookmarks = @[];
        if (!data) {
            [self saveWithBookmarks:storedBookmarks];
        } else {
            NSSet *classes = [NSSet setWithObjects:[NSArray class], [BookModel class], nil];
            storedBookmarks = [NSKeyedUnarchiver unarchivedObjectOfClasses:classes fromData:data error:nil];
        }
        self._bookmarks = [NSMutableArray arrayWithArray:storedBookmarks];
    }
    return self._bookmarks;
}

-(void)saveWithBookmarks:(NSMutableArray *)bookmarks {
    self._bookmarks = bookmarks;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:bookmarks requiringSecureCoding:YES error:nil];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:self.key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)addBook:(BookModel *)model {
    NSMutableArray *bookmarks = [self bookmarks];
    
    for (BookModel *book in bookmarks) {
        if (book.isbn13 == model.isbn13) {return;}
    }
    
    [bookmarks addObject:model];
    
    [self saveWithBookmarks:bookmarks];
}

-(void)removeBook:(BookModel *)model {
    NSMutableArray *bookmarks = [self bookmarks];
    
    for (BookModel *book in bookmarks) {
        if (book.isbn13 == model.isbn13) {
            [bookmarks removeObject:book];
            break;
        }
    }
    [self saveWithBookmarks:bookmarks];
}

@end
