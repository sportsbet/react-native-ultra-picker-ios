//
//  UPIView.m
//  Ultra-Picker-iOS
//
//  Created by Tim Sawtell on 3/9/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//

#import "UltraPickerIOSView.h"

@interface UltraPickerIOSView() <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation UltraPickerIOSView

- (void) setComponentsData:(NSArray *)componentsData
{
    if (componentsData != _componentsData) {
        _componentsData = [componentsData copy];
        [self setNeedsLayout];
    }
}

- (void) setSelectedIndexes:(NSArray<NSNumber *> *)selectedIndexes
{
    _selectedIndexes = selectedIndexes;
    if (!self.componentsData) {
        return;
    }
    for (NSInteger i = 0; i < selectedIndexes.count; i++) {
        NSInteger index = [selectedIndexes[i] integerValue];
        [self selectRow:index inComponent:i animated:NO];
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.componentsData.count;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self.componentsData objectAtIndex:component] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self labelForRow:row forComponent:component];
}

- (NSString *)labelForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[self.componentsData objectAtIndex:component] objectAtIndex:row] valueForKey:@"label"];
}

- (NSString *)valueForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[self.componentsData objectAtIndex:component] objectAtIndex:row] valueForKey:@"value"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSDictionary *event = @{
                            @"newIndex": @(row),
                            @"component": @(component),
                            @"newValue": [self valueForRow:row forComponent:component],
                            @"newLabel": [self labelForRow:row forComponent:component]
                            };
    
    if (self.onChange) {
        self.onChange(event);
    }
}

@end
