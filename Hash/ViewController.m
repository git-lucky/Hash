//
//  ViewController.m
//  Hash
//
//  Created by Tim Hise on 2/26/14.
//  Copyright (c) 2014 CleverKnot. All rights reserved.
//

#import "ViewController.h"
#import "HashTable.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HashTable *table = [HashTable new];
    
    [table insertObject:@"brad" forKey:@"broheim"];
    [table insertObject:@"Clem" forKey:@"heimbro"];
    [table insertObject:@"Bennett" forKey:@"eimhbro"];
    [table insertObject:@"Tim" forKey:@"imhbroe"];
    [table insertObject:@"Zuri" forKey:@"broeimh"];
    [table insertObject:@"hahaa" forKey:@"hahaa"];
    
    [table objectForKey:@"heimbro"];
    [table objectForKey:@"broheim"];
    [table objectForKey:@"brony"];
    
    [table removeObjectForKey:@"eimhbro"];
    [table removeObjectForKey:@"Bennett"];
    [table removeObjectForKey:@"broeimh"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
