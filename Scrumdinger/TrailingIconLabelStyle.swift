//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Pragatha Muthusamy on 9/10/22.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack {
            configuration.title
            configuration.icon
        }
       
    }
    
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
