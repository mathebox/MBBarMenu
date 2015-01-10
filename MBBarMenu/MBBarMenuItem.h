//
//  MBBarMenuItem.h
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

/**
 `MBBarMenuItem` encapsulates all properties for one item shown in the menu.
 */
@interface MBBarMenuItem : NSObject

/**
 The title of the item. Shown in the navigation bar if no image was set.
 Always shon in the alert controller.

 @see image
 */
@property (nonatomic, strong) NSString *title;

/**
 The target object of the action.
 */
@property (nonatomic, strong) id target;

/**
 The action to be triggered on the target object.
 */
@property (nonatomic) SEL action;

/**
 The image which optionally replaces the title in the navigation bar.
 */
@property (nonatomic, strong) UIImage *image;

/**
 The callback which determines if the item should be rendered in activated state or not.
 */
@property (copy) BOOL (^isActivated)(void);

/**
 The alternative title shown in activated state.
 */
@property (nonatomic, strong) NSString *titleActivated;

/**
 The alternative image which replaces the image in activated state.
 */
@property (nonatomic, strong) UIImage *imageActivated;

/**
 Creates a new `MBBarMenuIten`.

 @param title The title of the new item
 @param target The target of the new item
 @param action The action of the new item

 @return The new `MBBarMenuIten`
 */
- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action;

@end
