//
//  ViewController.m
//  MBBarMenuDemo
//
//  Created by Max Bothe on 25/12/14.
//  Copyright (c) 2014 Max Bothe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSInteger firstItemIsFavorite;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.firstItemIsFavorite = FALSE;

    MBBarMenuItem *item1 = [[MBBarMenuItem alloc] initWithTitle:@"Favorite"
                                                         target:self
                                                         action:@selector(toggleFirstItem)];
    item1.image = [UIImage imageNamed:@"starOutline"];
    item1.imageActivated = [UIImage imageNamed:@"star"];
    item1.titleActivated = @"Unfavorite";
    item1.isActivated = ^BOOL() {
        return self.firstItemIsFavorite;
    };
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

- (void)toggleFirstItem
{
    self.firstItemIsFavorite = !self.firstItemIsFavorite;
    [self updateUI];
}

- (void)print
{
    NSLog(@"Pressed item");
}

@end
