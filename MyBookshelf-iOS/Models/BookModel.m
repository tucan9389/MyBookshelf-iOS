//
//  BookModel.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookModel.h"

@implementation BookModel

- (instancetype) initWithInfo: (NSDictionary *)info {
    self = [super init];
    if(self) {
        NSLog(@"_init: %@", self);
        if (info[@"title"]) self.title = info[@"title"];
        if (info[@"subtitle"]) self.subtitle = info[@"subtitle"];
        if (info[@"image"]) self.imageURL = info[@"image"];
        if (info[@"isbn13"]) self.isbn13 = info[@"isbn13"];
        if (info[@"price"]) self.price = info[@"price"];
        if (info[@"url"]) self.url = info[@"url"];
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
}

- (id)initWithCoder:(NSCoder *)decoder {
    if(self = [super init]) {
        self.title = [decoder decodeObjectOfClass:[NSString class] forKey:@"title"];
        self.subtitle = [decoder decodeObjectOfClass:[NSString class] forKey:@"subtitle"];
        self.imageURL = [decoder decodeObjectOfClass:[NSString class] forKey:@"imageURL"];
        self.isbn13 = [decoder decodeObjectOfClass:[NSString class] forKey:@"isbn13"];
        self.price = [decoder decodeObjectOfClass:[NSString class] forKey:@"price"];
        self.url = [decoder decodeObjectOfClass:[NSString class] forKey:@"url"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
