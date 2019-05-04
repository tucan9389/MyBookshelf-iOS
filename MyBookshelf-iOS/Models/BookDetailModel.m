//
//  BookDetailModel.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookDetailModel.h"

@implementation BookDetailModel

- (instancetype) initWithInfo: (NSDictionary *)info {
    self = [super init];
    if(self) {
        NSLog(@"_init: %@", self);
        if (info[@"title"]) self.title = info[@"title"];
        if (info[@"subtitle"]) self.subtitle = info[@"subtitle"];
        if (info[@"imageURL"]) self.imageURL = info[@"imageURL"];
        if (info[@"isbn13"]) self.isbn13 = info[@"isbn13"];
        if (info[@"price"]) self.price = info[@"price"];
        if (info[@"url"]) self.url = info[@"url"];
        
        if (info[@"desc"]) self.desc = info[@"desc"];
        if (info[@"rating"]) self.rating = info[@"rating"];
        if (info[@"authors"]) self.authors = info[@"authors"];
        if (info[@"publisher"]) self.publisher = info[@"publisher"];
        if (info[@"language"]) self.language = info[@"language"];
        if (info[@"pages"]) self.pages = info[@"pages"];
        if (info[@"year"]) self.year = info[@"year"];
        if (info[@"isbn10"]) self.isbn10 = info[@"isbn10"];
        if (info[@"error"]) self.error = info[@"error"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.subtitle forKey:@"subtitle"];
    [encoder encodeObject:self.imageURL forKey:@"imageURL"];
    [encoder encodeObject:self.isbn13 forKey:@"isbn13"];
    [encoder encodeObject:self.price forKey:@"price"];
    [encoder encodeObject:self.url forKey:@"url"];
    
    [encoder encodeObject:self.desc forKey:@"desc"];
    [encoder encodeObject:self.rating forKey:@"rating"];
    [encoder encodeObject:self.authors forKey:@"authors"];
    [encoder encodeObject:self.publisher forKey:@"publisher"];
    [encoder encodeObject:self.language forKey:@"language"];
    [encoder encodeObject:self.pages forKey:@"pages"];
    [encoder encodeObject:self.year forKey:@"year"];
    [encoder encodeObject:self.isbn10 forKey:@"isbn10"];
    [encoder encodeObject:self.error forKey:@"error"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if(self = [super init]) {
        self.title = [decoder decodeObjectOfClass:[NSString class] forKey:@"title"];
        self.subtitle = [decoder decodeObjectOfClass:[NSString class] forKey:@"subtitle"];
        self.imageURL = [decoder decodeObjectOfClass:[NSString class] forKey:@"imageURL"];
        self.isbn13 = [decoder decodeObjectOfClass:[NSString class] forKey:@"isbn13"];
        self.price = [decoder decodeObjectOfClass:[NSString class] forKey:@"price"];
        self.url = [decoder decodeObjectOfClass:[NSString class] forKey:@"url"];
        
        self.desc = [decoder decodeObjectOfClass:[NSString class] forKey:@"desc"];
        self.rating = [decoder decodeObjectOfClass:[NSString class] forKey:@"rating"];
        self.authors = [decoder decodeObjectOfClass:[NSString class] forKey:@"authors"];
        self.publisher = [decoder decodeObjectOfClass:[NSString class] forKey:@"publisher"];
        self.language = [decoder decodeObjectOfClass:[NSString class] forKey:@"language"];
        self.pages = [decoder decodeObjectOfClass:[NSString class] forKey:@"pages"];
        self.year = [decoder decodeObjectOfClass:[NSString class] forKey:@"year"];
        self.isbn10 = [decoder decodeObjectOfClass:[NSString class] forKey:@"isbn10"];
        self.error = [decoder decodeObjectOfClass:[NSString class] forKey:@"error"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
