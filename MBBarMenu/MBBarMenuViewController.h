//
//  MBBarMenuViewController.h
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

#import <UIKit/UIKit.h>
#import "MBBarMenuItem.h"

#define DEFAULT_MAX_ITEM_COUNT_PHONE    1
#define DEFAULT_MAX_ITEM_COUNT_PAD      4

/**
 `MBBarMenuViewController` is a subclass of `UIViewcontroller`. It handles the arrangement of 
 `MBBarMenuItem`s.

 @see MBBarMenuItem
 */
@interface MBBarMenuViewController : UIViewController

/**
 The maximum count of items shown in the navigation bar on an iPhone. The default value is 1.

 @warning `maximumItemCountPhone` must be 1 or greater
 */
@property (nonatomic) NSInteger maximumItemCountPhone;

/**
 The maximum count of items shown in the navigation bar on an iPad. The default value is 4.

 @warning `maximumItemCountPhone` must be 1 or greater
 */
@property (nonatomic) NSInteger maximumItemCountPad;

/**
 Indicates wheter the menu is shown or not. The default value is false.
 */
@property (nonatomic) BOOL menuHidden;

/**
 Adds a `MBBarMenuItem` to the menu.

 @param item The `MBBarMenuItem` to be added
 */
- (void)addBarMenuItem:(MBBarMenuItem *)item;

/**
 Removes a `MBBarMenuItem` from the menu.

 @param item The `MBBarMenuItem` to be removed
 */
- (void)removeBarMenuItem:(MBBarMenuItem *)item;

/**
 Refreshes the appearence of all items shown in the navigation bar. If there were additions or
 removals of items, the number of items shown in the navigation bar will be adjusted.
 */
- (void)updateUI;

@end
