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
    return view;
}


RCT_EXPORT_VIEW_PROPERTY(componentsData, NSArray)
RCT_EXPORT_VIEW_PROPERTY(selectedIndexes, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

@end
