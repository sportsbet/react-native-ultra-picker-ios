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

NSInteger const UIPickerDefaultFontSize = 17.0;

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
    return [[[self.componentsData objectAtIndex:component] valueForKey:@"items"] count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self labelForRow:row forComponent:component];
}

- (NSString *)labelForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"label"];
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *displayLabel;
    
    if (view) {
        displayLabel = (UILabel *)view;
    }else {
        displayLabel = [UILabel new];
        displayLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    UIFont *font = nil;
    
    //Check for property on the Item first, then the Group
    if ([[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"fontFamily"] != nil) {
        NSString *fontName= [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"fontFamily"];
        NSInteger fontSize = UIPickerDefaultFontSize;
        if ([[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"fontSize"] != nil) {
            NSString *size = [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"fontSize"];
            if ([size integerValue] > 0) {
                fontSize = [size integerValue];
            }
        }
        font = [UIFont fontWithName:fontName size:fontSize];
    }else {
        if ([[self.componentsData objectAtIndex:component] valueForKey:@"fontFamily"] != nil) {
            NSString *fontName = [[self.componentsData objectAtIndex:component] valueForKey:@"fontFamily"];
            NSInteger fontSize = UIPickerDefaultFontSize;
            if ([[self.componentsData objectAtIndex:component] valueForKey:@"fontSize"] != nil) {
                NSString *size = [[self.componentsData objectAtIndex:component] valueForKey:@"fontSize"];
                if ([size integerValue] > 0) {
                    fontSize = [size integerValue];
                }
            }
            font = [UIFont fontWithName:fontName size:fontSize];
        }
    }

    if (font) {
        displayLabel.font = font;
    }
    
    displayLabel.text = [self labelForRow:row forComponent:component];
    
    return displayLabel;
}

- (NSString *)valueForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[[[self.componentsData objectAtIndex:component] valueForKey:@"items"] objectAtIndex:row] valueForKey:@"value"];
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
