/**
 * React Native Ultra Picker Example
 * @flow
 */

import * as React from "react"
import {
  AppRegistry,
  StyleSheet,
  View
} from "react-native"

import { 
  UltraPickerIOS, 
  UltraPickerIOSCloseBar, 
  Group,
  Item
 } from "react-native-ultra-picker-ios"
 
export class reactNativeUltraPickerIosExample extends React.Component {
   
   pickerClosed() {
    console.log("Closed");
  }

  pickerChanged(result) {
    console.log(JSON.stringify(result.nativeEvent));
  }

  render() {
    return (  
      <View style={styles.container}>
        <UltraPickerIOS testID={"UltraPickerView"} onChange={this.pickerChanged} style={styles.ultraPicker}>
          <UltraPickerIOSCloseBar buttonTestID={"UltraPickerCloseBarButton"} style={styles.closeBar} onClose={this.pickerClosed} />
          <Group fontFamily="Copperplate-Bold" fontSize="14.0">
            <Item label="Dune" value={{someKey: "some value"}} fontFamily="Futura-CondensedExtraBold" fontSize="10.0" />
            <Item label="Dune Messiah" />
            <Item label="Children of Dune" selected={true} />
            <Item label="God Emperor of Dune" />
            <Item label="Heretics of Dune" />
            <Item label="Chapterhouse: Dune" />
          </Group>
          <Group>
            <Item label="Paperback"/>
            <Item label="Kobo" selected={true} />
            <Item label="Kindle"/>
            <Item label="Nook" />
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

AppRegistry.registerComponent("example", () => reactNativeUltraPickerIosExample)
