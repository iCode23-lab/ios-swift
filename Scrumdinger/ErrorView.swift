//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Pragatha Muthusamy on 11/25/22.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text("An error occurred")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            
        }
       
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
            ErrorWrapper(error: SampleError.errorRequired,
                         guidance: "You can safely ignore this error.")
        }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
