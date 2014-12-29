# MBBarMenu
MBBarMenu simplifies the arrangement of multiple UIBarButtonItems in an iOS UINavigationBar. Up to a given count the items will be shown normally. If the number of items exceeds this threshold, all remaining items will be shown in a UIAlertController.

[![Build Status](https://travis-ci.org/mathebox/MBBarMenu.svg?branch=master)](https://travis-ci.org/mathebox/MBBarMenu) [![Cocoapods](https://cocoapod-badges.herokuapp.com/v/MBBarMenu/badge.png)](http://cocoapods.org/?q=mbbarmenu) ![Platform](https://cocoapod-badges.herokuapp.com/p/MBBarMenu/badge.png) ![Lisence](https://cocoapod-badges.herokuapp.com/l/MBBarMenu/badge.png)

### on iPhone
![MBBarMenu Example Phone](https://raw.githubusercontent.com/mathebox/MBBarMenu/master/assets/example_phone.png)
![MBBarMenu Example Phone 2](https://raw.githubusercontent.com/mathebox/MBBarMenu/master/assets/example_phone_2.png)

### on iPad
![MBBarMenu Example Pad](https://raw.githubusercontent.com/mathebox/MBBarMenu/master/assets/example_pad.png)

# Install
### manually
- Copy the MBBarMenu directory to your project

### via CocoaPods
- Add `pod ‘MBBarMenu’` to your [Podfile](http://cocoapods.org/)
- Run `pod install`
- Run `open App.xcworkspace`

# Getting started
### Setup view controller
- Subclass ```MBBarMenuViewController```
- The view controller must be place inside a ```UINavigationController```

### Add menu items
```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    MBBarMenuItem *item = [[MBBarMenuItem alloc] initWithTitle:@"Foo" target:self action:@selector(bar)];
    [self addBarMenuItem:item];
}
```

# Customize
### MBBarMenuViewController
- **maximumItemCountPhone**: maximum number of items for the navigation bar on iPhones (default: 1)
- **maximumItemCountPad**: maximum number of items for the navigation bar on iPads (default: 4)

### MBBarMenuItem
- **title**: the text of the item shown in the navigation bar or alert controller (required)
- **action**: the action to be triggered after selecting the item (required)
- **target**: the receiver of the action (required)
- **image**: the image replacing the text in the navigation bar; also shown in the alert controller
- **isActivated**: the handler to determine the state of an item { ON | OFF }
- **titleActivated**: the text of the item in activated state
- **imageActivated**: the image for the item in activated state

# Todo
- Consider iPhone landscape mode
- Does it also work on dark navigation bars?
- Improve state updates of single items (currently all items will be recreated)

# License
	The MIT License (MIT)
	
	Copyright (c) 2014 Max Bothe
	
	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	
	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
