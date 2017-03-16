//
//  UltraPickerIOS
//
//  Created by Tim Sawtell on 3/10/17.
//  Copyright © 2017 Sportsbet. All rights reserved.
//
"use strict";
var __extends = (this && this.__extends) || (function () {
    var extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
    return function (d, b) {
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var __assign = (this && this.__assign) || Object.assign || function(t) {
    for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
            t[p] = s[p];
    }
    return t;
};
Object.defineProperty(exports, "__esModule", { value: true });
var React = require("react");
var react_native_1 = require("react-native");
var react_native_2 = require("react-native");
var UltraPickerIOSNative = react_native_2.requireNativeComponent("UltraPickerIOS", null);
var UltraPickerIOSCloseBarNative = react_native_2.requireNativeComponent("UltraPickerIOSCloseBar", null);
var DEFAULT_CLOSEBAR_HEIGHT = 44;
var DEFAULT_PICKER_HEIGHT = 216;
var Group = (function (_super) {
    __extends(Group, _super);
    function Group() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Group.prototype.render = function () {
        return null;
    };
    return Group;
}(React.Component));
exports.Group = Group;
var Item = (function (_super) {
    __extends(Item, _super);
    function Item() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    Item.prototype.render = function () {
        return null;
    };
    return Item;
}(React.Component));
exports.Item = Item;
var UltraPickerIOS = (function (_super) {
    __extends(UltraPickerIOS, _super);
    function UltraPickerIOS(props) {
        var _this = _super.call(this, props) || this;
        _this._stateBasedOnProps.bind(_this);
        _this.state = _this._stateBasedOnProps(props);
        return _this;
    }
    UltraPickerIOS.prototype._stateBasedOnProps = function (nextProps) {
        var nextState = {
            componentsData: null,
            closeBar: null,
            selectedIndexes: null
        };
        var components = [];
        var selectedIndexes = [];
        if (!nextProps.children) {
            return nextState;
        }
        var pickerChildren = null;
        if (nextProps.children.constructor === Array) {
            pickerChildren = nextProps.children;
        }
        else {
            pickerChildren = [nextProps.children];
        }
        pickerChildren.forEach(function (child, index) {
            if (child.type.name === "UltraPickerIOSCloseBar") {
                nextState.closeBar = child;
            }
            else if (child.type.name === "Group") {
                var group_1 = [];
                var groupSelectedItem_1 = 0; // item at index 0 by default
                var items = null;
                if (child.props.children) {
                    if (child.props.children.constructor === Array) {
                        items = child.props.children;
                    }
                    else {
                        items = [child.props.children];
                    }
                    items.forEach(function (item, index) {
                        if (item.type.name === "Item" && item.props.label) {
                            group_1.push({
                                label: item.props.label,
                                value: (item.props.value || null)
                            });
                            if (item.props.selected) {
                                groupSelectedItem_1 = index;
                            }
                        }
                    });
                    if (group_1.length > 0) {
                        components.push(group_1);
                        selectedIndexes.push(groupSelectedItem_1);
                    }
                }
            }
        });
        nextState.componentsData = components;
        nextState.selectedIndexes = selectedIndexes;
        return nextState;
    };
    UltraPickerIOS.prototype.componentWillReceiveProps = function (nextProps) {
        this.state = this._stateBasedOnProps(nextProps);
    };
    UltraPickerIOS.prototype.render = function () {
        // Allow the caller to not specify any style yet make this component visible 
        // via default heights. Adjust the size of `parentViewStyle` so that if there
        // is a CloseBar provided, the picker is the same size as specified by 
        // UltraPickerIOS.style and the parent (encapsulating) view is made larger 
        // to fit the CloseBar
        var pickerViewStyle = __assign({ height: DEFAULT_PICKER_HEIGHT }, react_native_1.StyleSheet.flatten(this.props.style));
        var parentViewStyle = __assign({}, pickerViewStyle);
        if (this.state.closeBar) {
            parentViewStyle.height = parentViewStyle.height + DEFAULT_CLOSEBAR_HEIGHT;
        }
        return (React.createElement(react_native_1.View, { style: parentViewStyle },
            this.state.closeBar,
            React.createElement(UltraPickerIOSNative, { style: pickerViewStyle, onChange: this.props.onChange, componentsData: this.state.componentsData, selectedIndexes: this.state.selectedIndexes })));
    };
    return UltraPickerIOS;
}(React.Component));
exports.UltraPickerIOS = UltraPickerIOS;
var UltraPickerIOSCloseBar = (function (_super) {
    __extends(UltraPickerIOSCloseBar, _super);
    function UltraPickerIOSCloseBar() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    UltraPickerIOSCloseBar.prototype.render = function () {
        var style = __assign({ height: DEFAULT_CLOSEBAR_HEIGHT }, react_native_1.StyleSheet.flatten(this.props.style));
        var closeButtonText = this.props.closeButtonText || "Close";
        return (React.createElement(UltraPickerIOSCloseBarNative, { style: style || this.props.style, closeButtonText: closeButtonText, onClose: this.props.onClose }));
    };
    return UltraPickerIOSCloseBar;
}(React.Component));
exports.UltraPickerIOSCloseBar = UltraPickerIOSCloseBar;
