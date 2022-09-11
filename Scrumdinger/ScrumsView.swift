//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Pragatha Muthusamy on 9/10/22.
//

import SwiftUI

struct ScrumsView: View {
    let scrums : [DailyScrum]
    
    var body: some View {
        List {
            
            ForEach(scrums) { scrum in
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)
            }
        }
        
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
