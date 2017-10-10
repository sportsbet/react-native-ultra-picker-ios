//
//  UPIManager.m
//  Ultra-Picker-iOS
//
//  Created by Tim Sawtell on 3/9/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//

#import "UltraPickerIOSView.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface UltraPickerIOSManager : RCTViewManager

@end

@implementation UltraPickerIOSManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    UltraPickerIOSView *view = [UltraPickerIOSView new];
    view.delegate = view;
    view.dataSource = view;
    // Work around an iOS bug that hides the selection indicator lines
    [view selectRow:0 inComponent:0 animated:YES];
    return view;
}


RCT_EXPORT_VIEW_PROPERTY(componentsData, NSArray)
RCT_EXPORT_VIEW_PROPERTY(selectedIndexes, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(testID, NSString)

@end
