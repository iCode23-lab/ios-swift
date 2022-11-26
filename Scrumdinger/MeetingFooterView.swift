//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Pragatha Muthusamy on 11/25/22.
//

import Foundation
import UIKit
import SwiftUI

struct MeetingFooterView : View {
    
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
            guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil}
            return index + 1
        }
    
    private var isLastSpeaker: Bool {
           return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
           guard let speakerNumber = speakerNumber else { return "No more speakers" }
           return "Speaker \(speakerNumber) of \(speakers.count)"
       }
   
    var body: some View {
        
        VStack {
            
            HStack {
                
                if isLastSpeaker {
                    Text(speakerText)
                } else {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {}).previewLayout(.sizeThatFits)
    }
}
