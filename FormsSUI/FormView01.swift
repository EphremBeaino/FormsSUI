//
//  FormView01.swift
//  FormsSUI
//
//  Created by Ephrem RAY on 14/06/2023.
//

import SwiftUI

struct FormView01: View {
    @State var title: String = ""
    @ObservedObject var formInfo: FormInfo
    
    
    
    var body: some View {
        NavigationView {
            Form {
                ForEach($formInfo.sections) { $section in
                    Section {
                        ForEach($section.rows) { $row in
                            TextField(row.config.placeholder, text: $row.config.valueStr)
                        }
                    } header: {
                        if let title = section.header {
                            Text(title)
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    } footer: {
                        if let title = section.footer {
                            Text(title)
                        }
                    }
                }
            }
        }
    }
}

struct FormView01_Previews: PreviewProvider {
    static var previews: some View {
        var form = FormInfo()
        
        var section1 = FormSection()
        section1.header = "All we need is your consent"
        section1.footer = "From the other side"
        form.sections.append(section1)
        
        var nameField = TextRowItem()
        section1.rows.append(nameField)
        
        return FormView01(formInfo: form)
    }
}
