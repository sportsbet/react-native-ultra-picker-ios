# React Native Ultra Picker iOS

A multiple column (component) UIPickerView component 

  - Supports Typescript!
  - es5 compliant

# Why?

Picker from React-Native (at the time of writing) only supports a single column. This native component allows for n columns and an optional Close Bar, with callbacks for `onClose` and `onChanged`.

# Version 0.1.8

- Fixes a bug that was triggered after presenting a picker when another picker has been already presented and the second one has less sections than the first.
- Updated example app to support RN 57

# Version 0.1.5

- Minimum React-Native version: 0.48.1
- Minimum React version: 16.0
- Use 0.1.4 if this is an issue for your project
- Fixed the lines indicating the selected row not rendering
- Added support for `testID` property on the picker view and the close bar

# Version 0.1.4

Added support for custom Font and Size on items in the picker, see updated example.

# Installing

``` 
yarn install "react-native-ultra-picker-ios"
react-native link react-native-ultra-picker-ios
```
- Open your existing app's .xcodeproj file
- Drag the /.node_modules/react-native-ultra-picker-ios/UltraPickerIOS/UltraPickerIOS.xcodeproj file into the Libraries group in your xcode project (Figure A)
- Choose your app's Target and select the Build Phases tab.
Under Link Binary With Libraries click the + button and add `libUltraPickerIOS.a` (Figure B)

# Running the Example

Note: You *must* use `yarn`. If you use `npm`, it will do some symlinking thing
which causes the React Packager to get very upset.

* `cd example`
* `yarn && react-native link react-native-ultra-picker-ios`
* `yarn start`

Then run a simulator either using Xcode or `react-native run-ios`.

![Example](http://i.imgur.com/QJCljAq.png)


# License:

```
The MIT License

Copyright (c) 2017 Sportsbet Pty Ltd

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
```
