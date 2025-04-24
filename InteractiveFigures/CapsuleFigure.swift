//
//  CapsuleFigure.swift
//  InteractiveFigures
//
//  Created by Daniel Tsivkovski on 4/23/25.
//

import SwiftUI

struct CapsuleFigure: View {
    
    @State private var offset: CGSize = .zero;
    @State private var rotation: Double = 0;
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                // offset based on drag translation distance
                offset = CGSize(
                    width: value.translation.width,
                    height: value.translation.height
                )
                // slight rotation to either size
                rotation = value.translation.width / 10;
            }
            .onEnded { value in
                // reset offset and rotation to 0, bouncing back
                offset = .zero;
                rotation = .zero;
            }
    }
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Gradient(colors: [.blue, .black]))
                .frame(width: 200, height: 75)
            HStack {
                // emoji face for the capsule
                Text("🫵😄👌")
                    .font(.largeTitle)
            }
        }
        .offset(offset)
        .rotationEffect(.degrees(rotation))
        .gesture(drag)
        .animation(.spring(duration: 1.5), value: offset)
        .animation(.spring(duration: 0.5), value: rotation)
    }
}

#Preview {
    CapsuleFigure()
}
