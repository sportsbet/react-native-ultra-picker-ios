/// <reference types="react-native" />
/// <reference types="react" />
import * as React from 'react';
import { StyleSheet } from 'react-native';
export interface UltraPickerIOSNative {
    componentsData?: any;
    selectedIndexes?: Number[];
    onChange?: (result: any) => void;
    style?: StyleSheet.Style;
}
export interface UltraPickerIOSCloseBarNative {
    closeButtonText?: string;
    onClose?: (result: any) => void;
    style?: StyleSheet.Style;
}
export interface ComponentItem {
    name: string;
    selected?: boolean;
}
export interface ComponentGroup {
    items?: ComponentItem[];
}
export declare class Group extends React.Component<ComponentGroup, any> {
    render(): any;
}
export declare class Item extends React.Component<ComponentItem, any> {
    render(): any;
}
export interface UltraPickerIOSProps {
    onChange?: (result: any) => void;
    style: any;
}
export interface UltraPickerIOSState {
    componentsData?: ComponentGroup[];
    selectedIndexes?: Number[];
    closeBar?: JSX.Element;
}
export declare class UltraPickerIOS extends React.Component<UltraPickerIOSProps, UltraPickerIOSState> {
    constructor(props: any);
    _stateBasedOnProps(nextProps: any): UltraPickerIOSState;
    componentWillReceiveProps(nextProps: any): void;
    render(): JSX.Element;
}
export interface UltraPickerIOSCloseBarProps {
    closeButtonText?: string;
    onClose?: (result: any) => void;
    style?: StyleSheet.Style;
}
export declare class UltraPickerIOSCloseBar extends React.Component<UltraPickerIOSCloseBarProps, any> {
    render(): JSX.Element;
}
