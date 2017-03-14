//
//  UltraPickerIOS
//
//  Created by Tim Sawtell on 3/10/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//

import * as React from 'react';
import {
  StyleSheet,
  View
} from 'react-native';

import { requireNativeComponent } from 'react-native';
const UltraPickerIOSNative = requireNativeComponent("UltraPickerIOS", null) as React.ComponentClass<UltraPickerIOSNative>;
const UltraPickerIOSCloseBarNative = requireNativeComponent("UltraPickerIOSCloseBar", null) as React.ComponentClass<UltraPickerIOSCloseBarNative> ;
const DEFAULT_CLOSEBAR_HEIGHT = 44
const DEFAULT_PICKER_HEIGHT = 216

export interface UltraPickerIOSNative {
    componentsData?: any,
    selectedIndexes?: Number[]
    onChange?: (result: any) => void
    style?: StyleSheet.Style
}

export interface UltraPickerIOSCloseBarNative {
    closeButtonText?: string
    onClose?: (result: any) => void
    style?: StyleSheet.Style
}

export interface ComponentItem {
    name: string,
    selected?: boolean
}

export interface ComponentGroup {
    items?: ComponentItem[]
}

export class Group extends React.Component<ComponentGroup, any> {
    render() {
        return null
    }
}

export class Item extends React.Component<ComponentItem, any> {
    render() {
        return null
    }
}

export interface UltraPickerIOSProps {
    onChange?: (result: any) => void
    style: any
}

export interface UltraPickerIOSState {
    componentsData?: ComponentGroup[]
    selectedIndexes?: Number[]
    closeBar?: JSX.Element
}

export class UltraPickerIOS extends React.Component<UltraPickerIOSProps, UltraPickerIOSState> {

    constructor(props) {
        super(props);
        this._stateBasedOnProps.bind(this)
        this.state = this._stateBasedOnProps(props)
    }

    _stateBasedOnProps(nextProps): UltraPickerIOSState {
        let nextState = {
            componentsData: null,
            closeBar: null,
            selectedIndexes: null
        }
        let components = []
        let selectedIndexes = []
        if (!nextProps.children) {
            return nextState
        }
        let pickerChildren = null
        if (nextProps.children.constructor === Array) {
            pickerChildren = nextProps.children
        } else {
            pickerChildren = [nextProps.children]
        }
        pickerChildren.forEach((child, index) => {
            if (child.type.name === "UltraPickerIOSCloseBar") {
                nextState.closeBar = child
            } else if (child.type.name === "Group") {
                let group = []
                let groupSelectedItem = 0 // item at index 0 by default
                let items = null
                if (child.props.children) {
                    if (child.props.children.constructor === Array) {
                        items = child.props.children
                    } else { 
                        items = [child.props.children]
                    }
                    items.forEach((item, index) => {
                        if (item.type.name === "Item" && item.props.name) {
                            group.push(item.props.name)
                            if (item.props.selected) {
                                groupSelectedItem = index
                            }
                        }
                    })
                    if (group.length > 0) {
                        components.push(group)
                        selectedIndexes.push(groupSelectedItem)
                    }
                }
            }
        })
        nextState.componentsData = components
        nextState.selectedIndexes = selectedIndexes
        return nextState
    }

    componentWillReceiveProps(nextProps) {
        this.state = this._stateBasedOnProps(nextProps)
    }

    render() {
        // Allow the caller to not specify any style yet make this component visible 
        // via default heights. Adjust the size of `parentViewStyle` so that if there
        // is a CloseBar provided, the picker is the same size as specified by 
        // UltraPickerIOS.style and the parent (encapsulating) view is made larger 
        // to fit the CloseBar
        let pickerViewStyle = {
            height: DEFAULT_PICKER_HEIGHT,
            ...StyleSheet.flatten(this.props.style)
        }
         let parentViewStyle = {
            ...pickerViewStyle
        }
        if (this.state.closeBar) {
            parentViewStyle.height = parentViewStyle.height + DEFAULT_CLOSEBAR_HEIGHT
        }
        return (
            <View style={parentViewStyle}>
                {this.state.closeBar}
                <UltraPickerIOSNative
                    style={pickerViewStyle}
                    onChange={this.props.onChange}
                    componentsData={this.state.componentsData}
                    selectedIndexes={this.state.selectedIndexes}
                />
            </View>
        )
    }
}

export interface UltraPickerIOSCloseBarProps {
    closeButtonText?: string
    onClose?: (result: any) => void
    style?: StyleSheet.Style
}

export class UltraPickerIOSCloseBar extends React.Component<UltraPickerIOSCloseBarProps, any> {

    render() {
        let style = {
            height: DEFAULT_CLOSEBAR_HEIGHT,
            ... StyleSheet.flatten(this.props.style)
        }
        let closeButtonText = this.props.closeButtonText || "Close"
        return (
            <UltraPickerIOSCloseBarNative
                style={style || this.props.style}
                closeButtonText={closeButtonText}
                onClose={this.props.onClose}
            />
        )
    }
}
