//
//  MBBarMenuViewController.m
//  MBBarMenu
//
//  Created by Max Bothe on 25/12/14.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014 Max Bothe
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "MBBarMenuViewController.h"

#define ACTION_IMAGE_PADDING            4
#define BACKGROUND_CLEAR_IMAGE_NAME     @"barButtonBackgroundClear"
#define BACKGROUND_FILLED_IMAGE_NAME    @"barButtonBackground"
#define MORE_IMAGE                      [UIImage imageNamed:@"more"]

@interface MBBarMenuViewController ()

@property (nonatomic, strong) NSMutableArray *items;
@property (readonly) NSInteger maximumItemCount;

@end

@implementation MBBarMenuViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.maximumItemCountPhone = DEFAULT_MAX_ITEM_COUNT_PHONE;
        self.maximumItemCountPad = DEFAULT_MAX_ITEM_COUNT_PAD;
        self.items = [NSMutableArray array];
    }
    return self;
}

- (NSInteger)maximumItemCount
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? self.maximumItemCountPad : self.maximumItemCountPhone;
}

- (NSInteger)barButtonCount
{
    return self.items.count <= self.maximumItemCount ? self.items.count : self.maximumItemCount - 1;
}

- (NSString *)titleForMenuItem:(MBBarMenuItem *)bmItem
{
    NSString *title;
    if (bmItem.titleActivated && bmItem.isActivated && bmItem.isActivated()) {
        title = bmItem.titleActivated;
    } else {
        title = bmItem.title;
    }
    return title;
}

- (UIImage *)imageForMenuItem:(MBBarMenuItem *)bmItem
{
    UIImage *image;
    if (bmItem.imageActivated && bmItem.isActivated && bmItem.isActivated()) {
        image = bmItem.imageActivated;
    } else if (bmItem.image) {
        image = bmItem.image;
    }
    return image;
}

- (UIImage *)backgroundImageForMenuItem:(MBBarMenuItem *)bmItem
{
    NSString *backgroundName = (bmItem.isActivated && bmItem.isActivated()) ?
                                BACKGROUND_FILLED_IMAGE_NAME : BACKGROUND_CLEAR_IMAGE_NAME;
    UIImage *background = [UIImage imageNamed:backgroundName];
    background = [background imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    background = [background resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
    return background;
}

- (UIImage *)combineImage:(UIImage *)image1 withBackground:(UIImage *)image2
{
    if (!image1) {
        return nil;
    }

    CGSize size = CGSizeMake(image2.size.width + 2*ACTION_IMAGE_PADDING,
                             image2.size.height + 2*ACTION_IMAGE_PADDING);
    UIGraphicsBeginImageContext(size);
    [image2 drawInRect:CGRectMake(0, 0, size.width, size.height)];
    [image1 drawInRect:CGRectMake(ACTION_IMAGE_PADDING, ACTION_IMAGE_PADDING,
                                  image2.size.width, image2.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

- (UIImage *)actionImageForMenuItem:(MBBarMenuItem *)bmItem
{
    UIImage *image = [self imageForMenuItem:bmItem];
    UIImage *background = [self backgroundImageForMenuItem:bmItem];
    return [self combineImage:image withBackground:background];
}

- (UIBarButtonItem *)barButtomItemForMenuItem:(MBBarMenuItem *)bmItem
{
    UIBarButtonItem *item;
    if (bmItem.image) {
        item = [[UIBarButtonItem alloc] initWithImage:[self imageForMenuItem:bmItem]
                                                style:UIBarButtonItemStylePlain
                                               target:bmItem.target
                                               action:bmItem.action];
    } else {
        item = [[UIBarButtonItem alloc] initWithTitle:[self titleForMenuItem:bmItem]
                                                style:UIBarButtonItemStylePlain
                                               target:bmItem.target
                                               action:bmItem.action];
    }

    UIImage *background = [self backgroundImageForMenuItem:bmItem];
    [item setBackgroundImage:background forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

    return item;
}

- (void)addBarMenuItem:(MBBarMenuItem *)item
{
    [self.items addObject:item];
    [self updateUI];
}

- (void)removeBarMenuItem:(MBBarMenuItem *)item
{
    [self.items removeObject:item];
    [self updateUI];
}

- (void)updateUI
{
    NSInteger barButtonCount = [self barButtonCount];

    NSMutableArray *barButtons = [NSMutableArray new];
    [[self.items subarrayWithRange:NSMakeRange(0, barButtonCount)] enumerateObjectsUsingBlock:^(MBBarMenuItem *bmItem, NSUInteger idx, BOOL *stop) {
        [barButtons addObject:[self barButtomItemForMenuItem:bmItem]];
    }];

    NSInteger alertButtonCount = self.items.count - barButtonCount;
    if (alertButtonCount > 1) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:MORE_IMAGE
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(pressedMoreButton)];
        [barButtons addObject:item];
    }

    self.navigationItem.rightBarButtonItems = [barButtons.reverseObjectEnumerator allObjects];
}

- (void)pressedMoreButton
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];

    NSInteger barButtonCount = [self barButtonCount];
    NSRange range = NSMakeRange(barButtonCount, self.items.count);
    [[self.items subarrayWithRange:range] enumerateObjectsUsingBlock:^(MBBarMenuItem *bmItem, NSUInteger idx, BOOL *stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:[self titleForMenuItem:bmItem]
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction *action) {
            [bmItem.target performSelector:bmItem.action withObject:nil afterDelay:0.0];
        }];

        [action setValue:[self actionImageForMenuItem:bmItem] forKey:@"image"];
        [alert addAction:action];
    }];

    alert.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItems.firstObject;
    [self presentViewController:alert animated:YES completion:nil];
}

@end
