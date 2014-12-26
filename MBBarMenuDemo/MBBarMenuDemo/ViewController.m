//
//  ViewController.m
//  MBBarMenuDemo
//
//  Created by Max Bothe on 25/12/14.
//  Copyright (c) 2014 Max Bothe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MBBarMenuItem *item1 = [[MBBarMenuItem alloc] initWithTitle:@"Foo"
                                                         target:self
                                                         action:@selector(print)];
    item1.image = [UIImage imageNamed:@"starOutline"];
    [self addBarMenuItem:item1];

    MBBarMenuItem *item2 = [[MBBarMenuItem alloc] initWithTitle:@"Bar"
                                                         target:self
                                                         action:@selector(print)];
    [self addBarMenuItem:item2];

    MBBarMenuItem *item3 = [[MBBarMenuItem alloc] initWithTitle:@"Baz"
                                                         target:self
                                                         action:@selector(print)];
    [self addBarMenuItem:item3];
}

- (void)print
{
    NSLog(@"Pressed item");
}

@end
