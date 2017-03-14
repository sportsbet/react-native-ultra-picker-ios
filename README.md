# React Native Ultra Picker iOS

A multiple column (component) UIPickerView component 

  - Supports Typescript!
  - es5 compliant

# Why?

Picker from React-Native (at the time of writing) only supports a single column. This native component allows for n columns and an optional Close Bar, with callbacks for `onClose` and `onChanged`

# Installing

``` 
npm install "react-native-ultra-picker-ios"
```
Open your existing app's .xcodeproj file
Drag the /.node_modules/react-native-ultra-picker-ios/UltraPickerIOS/UltraPickerIOS.xcodeproj file into the Libraries group in your xcode project (Figure A)
Choose your app's Target and select the Build Phases tab.
Under Link Binary With Libraries click the + button and add `libUltraPickerIOS.a` (Figure B)

![XCode setup](http://i.imgur.com/ko69aL3.png)

# Example

```
// index.ios.js
import { UltraPickerIOS, 
  UltraPickerIOSCloseBar, 
  Group,
  Item
 } from "react-native-ultra-picker-ios"
 
export default class reactNativeUltraPickerIosExample extends React.Component {
   
   pickerClosed() {
    console.log("Closed");
  }

  pickerChanged(result) {
    console.log(JSON.stringify(result.nativeEvent));
  }

  render() {
    return (  
      <View style={styles.container}>
        <UltraPickerIOS onChange={this.pickerChanged} style={styles.ultraPicker}>
          <UltraPickerIOSCloseBar style={styles.closeBar} onClose={this.pickerClosed} />
          <Group>
            <Item name="Dune" />
            <Item name="Dune Messiah" />
            <Item name="Children of Dune" />
            <Item name="God Emperor of Dune" />
            <Item name="Heretics of Dune" selected={true} />
            <Item name="Chapterhouse: Dune"/>
          </Group>
          <Group>
            <Item name="Paperback" />
            <Item name="Kobo" />
            <Item name="Kindle" selected={true} />
            <Item name="Nook" />
          </Group>
        </UltraPickerIOS>
      </View>
    );
  }
}

let styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center"
  },
  closeBar: {
    height: 44
  },
  ultraPicker: {
    height: 220
  }
});
```

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
