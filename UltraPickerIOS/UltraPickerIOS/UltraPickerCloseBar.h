//
//  UltraPickerCloseBar.h
//  UltraPickerIOS
//
//  Created by Tim Sawtell on 3/10/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@interface UltraPickerCloseBar : UIToolbar

@property (nonatomic, copy) NSString *closeButtonText;
@property (nonatomic, copy) RCTBubblingEventBlock onClose;
@property (nonatomic, copy) NSString *testID;

@end
