//
//  HashTable.m
//  Hash
//
//  Created by Tim Hise on 2/26/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "HashTable.h"
#import "HashBucket.h"

@interface HashTable ()

@property (strong, nonatomic) NSMutableArray *bucketArray;
@property (nonatomic) int tableSize;

@end

@implementation HashTable

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.tableSize = 100;
        self.bucketArray = [NSMutableArray new];
        
        for (int i = 0 ; i < self.tableSize; i++) {
            HashBucket *bucket = [HashBucket new];
            [self.bucketArray insertObject:bucket atIndex:i];
        }
    }
    return self;
}

- (void)insertObject:(id)obj forKey:(NSString *)key
{
    int index = [self hashThis:key];
//    NSLog(@"index of inserted obj %d", index);
    HashBucket *bucket = self.bucketArray[index];
    
    if (bucket.obj) {
        HashBucket *newBucket = [HashBucket new];
        newBucket.next = bucket;
        newBucket.obj = obj;
        newBucket.key = key;
        [self.bucketArray removeObject:bucket];
        [self.bucketArray insertObject:newBucket atIndex:index];
    } else {
        bucket.obj = obj;
        bucket.key = key;
    }
}

- (id)objectForKey:(NSString *)key
{
    int index = [self hashThis:key];
    
    HashBucket *bucket = self.bucketArray[index];
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            NSLog(@"got a bucket with object %@ for key %@ at index %i", bucket.obj, bucket.key, index);
            return bucket.obj;
        } else {
            bucket = bucket.next;
        }
    }
    NSLog(@"nothing here");
    return nil;
}

- (int)hashThis:(NSString *)key
{
    int total = 0;
    
    for (int i = 0; i < key.length ; i++) {
        int letterValue = [key characterAtIndex:i];
//        NSLog(@"letterValue %d", letterValue);
        total += letterValue;
    }
    total = total % self.tableSize;
//    NSLog(@"total %d", total);
    return total;
}

- (void)removeObjectForKey:(NSString *)key
{
    int index = [self hashThis:key];
    
    HashBucket *bucket = self.bucketArray[index];
    HashBucket *previousBucket;
    
    while (bucket) {
        if ([bucket.key isEqualToString:key]) {
            if (bucket.next) {
                previousBucket.next = bucket.next;
                NSLog(@"%@ replaced %@", bucket.next.obj, bucket.obj);
                return;
            } else {
                NSLog(@"formatted that bucket");
                bucket.key = nil;
                bucket.obj = nil;
                return;
            }
        } else {
            previousBucket = bucket;
            bucket = bucket.next;
        }
    }
    NSLog(@"No bucket with that key");
}

@end
