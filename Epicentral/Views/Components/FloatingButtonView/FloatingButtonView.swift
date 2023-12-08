//
//  FloatingButtonView.swift
//  Plate
//
//  Created by Brian Sakhuja on 11/21/23.
//

import SwiftUI

struct FloatingButtonView: View {
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .font(.title.weight(.semibold))
                .padding()
                .background(Color.xanadu)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4)
            
        }
    }
}

#Preview("List") {
    FloatingButtonView(imageName: "list.bullet") { }
}

#Preview("Map") {
    FloatingButtonView(imageName: "map") { }
}
