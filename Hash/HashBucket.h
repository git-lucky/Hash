//
//  HashBucket.h
//  Hash
//
//  Created by Tim Hise on 2/26/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashBucket : NSObject

@property (strong, nonatomic) id obj;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) HashBucket *next;

@end
