//
//  HashTable.h
//  Hash
//
//  Created by Tim Hise on 2/26/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject

- (void)insertObject:(id)obj forKey:(NSString *)key;

- (id)objectForKey:(NSString *)key;

- (void)removeObjectForKey:(NSString *)key;

@end


