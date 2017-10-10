//
//  UPIView.h
//  Ultra-Picker-iOS
//
//  Created by Tim Sawtell on 3/9/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTComponent.h>

@interface UltraPickerIOSView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, copy) NSArray <NSArray <NSDictionary<NSString *, id> *> *> *componentsData;
@property (nonatomic, copy) NSArray <NSNumber*> *selectedIndexes;
@property (nonatomic, copy) RCTBubblingEventBlock onChange;
@property (nonatomic, copy) NSString *testID;
@end
