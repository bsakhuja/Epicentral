//
//  LoadingIndicator.swift
//  Rumble
//
//  Created by Brian Sakhuja on 11/9/23.
//

import SwiftUI

struct LoadingIndicator: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .opacity(0.2)
            VStack(spacing: 20) {
                ProgressView()
                Text("Loading...")
                    .foregroundStyle(Color.gray)
            }
        }
        .frame(width: 100, height: 100)
        
    }
}

#Preview {
    LoadingIndicator()
}
