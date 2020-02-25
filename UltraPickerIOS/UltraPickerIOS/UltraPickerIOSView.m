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

NSInteger const UPPickerDefaultFontSize = 17.0;

@implementation UltraPickerIOSView

- (void) setComponentsData:(NSArray *)componentsData
{
    if (componentsData != _componentsData) {
        _componentsData = [componentsData copy];
        [self setNeedsLayout];
        
        if (self.selectedIndexes) {
            for (NSInteger i = 0; i < self.selectedIndexes.count; i++) {
                if (i < self.componentsData.count) {
                    NSInteger index = [self.selectedIndexes[i] integerValue];
                    [self selectRow:index inComponent:i animated:NO];
                }
            }
        }
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

- (void) setTestID:(NSString *)testID
{
    _testID = testID;
    self.accessibilityIdentifier = testID;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    // Never return zero, or the selection indicator lines won't render
    return MAX(self.componentsData.count, 1);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // Never return zero, or the selection indicator lines won't render
    return MAX([[[self.componentsData objectAtIndex:component] valueForKey:@"items"] count], 1);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self labelForRow:row forComponent:component];
}

- (NSString *)labelForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *text = [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"label"];
    if (!text) {
        return @"";
    } else {
        return text;
    }
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *displayLabel;
    
    if (view) {
        displayLabel = (UILabel *)view;
    }else {
        displayLabel = [UILabel new];
        displayLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    NSString *fontName;
    NSInteger fontSize;
    UIFont *font = nil;
    
    //Check for property on the Item first, then the Group
    NSString *itemFontFamily = [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"fontFamily"];
    NSString *itemFontSize = [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"fontSize"];
    
    if (itemFontFamily != nil || itemFontSize != nil) {
        fontName = itemFontFamily;
        fontSize = itemFontSize.integerValue;
    } else {
        NSString *groupFontFamily = [[self.componentsData objectAtIndex:component] valueForKey:@"fontFamily"];
        NSString *groupFontSize = [[self.componentsData objectAtIndex:component] valueForKey:@"fontSize"];
        
        fontName = groupFontFamily;
        fontSize = groupFontSize.integerValue;
    }
    
    if (fontName != nil) {
        font = [UIFont fontWithName:fontName size:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }

    if (font) {
        displayLabel.font = font;
    }
    
    displayLabel.text = [self labelForRow:row forComponent:component];
    
    return displayLabel;
}

- (NSString *)valueForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *text = [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"value"];
    if (!text) {
        return @"";
    } else {
        return text;
    }
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
