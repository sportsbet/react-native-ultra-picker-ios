//
//  UltraPickerCloseBar.m
//  UltraPickerIOS
//
//  Created by Tim Sawtell on 3/10/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//

#import "UltraPickerCloseBar.h"

@implementation UltraPickerCloseBar

- (void)setCloseButtonText:(NSString *)closeButtonText
{
    _closeButtonText = closeButtonText;
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];

    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:closeButtonText
                                                                      style:UIBarButtonItemStyleDone
                                                                     target:self
                                                                     action:@selector(doneTapped)];
    self.items = @[flex, barButtonDone];

    [self setBackgroundImage:[UIImage new]
          forToolbarPosition:UIToolbarPositionAny
                  barMetrics:UIBarMetricsDefault];

    self.backgroundColor = [UIColor clearColor]; // set using the backgroundColor style in the react view
    self.clipsToBounds = YES; // removes the border. Again, use the view style in React to change this
}

- (void) setTestID:(NSString *)testID
{
    _testID = testID;
    self.accessibilityIdentifier = testID;
}

- (void)doneTapped
{
    if (self.onClose) {
        self.onClose(nil);
    }
}

@end
