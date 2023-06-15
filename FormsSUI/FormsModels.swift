//
//  FormsModels.swift
//  FormsSUI
//
//  Created by Ephrem RAY on 14/06/2023.
//

import Foundation
import UIKit
import SwiftUI

class FormInfo: ObservableObject {
    var sections: [FormSection] = [] {
        willSet {
            objectWillChange.send()
        }
    }
}

class FormSection: Identifiable {
    let id = UUID()
    var header: String? = nil
    var footer: String? = nil
    var rows: [RowItem] = []
}

class RowItem: Identifiable, ObservableObject {
    let id = UUID()
    var kind: Kind { .na }
    var config: RowItemSUI!
    
    enum Kind {
        case na
        case text
        case toggle
    }
}

struct RowItemSUI: ObservableObject {
    //Text
    var valueStr: String = "" {
        willSet {
            objectWillChange.send()
        }
    }
    var placeholder: String = ""
}


class TextRowItem: RowItem {
    override var kind: RowItem.Kind { .text }
    var value: String = ""
//    var valueBinding: Binding<String> {
//        return Binding<String>(
//            get: { self.value },
//            set: { newValue in self.value = newValue })
//    }
    
    var placeholder: String = ""
    
    var keyboardType: UIKeyboardType = .default
    var contentType: UITextContentType? = nil
    
    init(value: String = "", placeholder: String = "", keyboardType: UIKeyboardType = .default, contentType: UITextContentType? = nil) {
        self.value = value
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.contentType = contentType
        super.init()
        self.config = RowItemSUI()
    }
}

class ToggleRowItem: RowItem {
    var value: Bool = false
//    var valueBinding: Binding<Bool> {
//        return Binding<Bool>(
//            get: { self.value },
//            set: { newValue in self.value = newValue })
//    }
}
