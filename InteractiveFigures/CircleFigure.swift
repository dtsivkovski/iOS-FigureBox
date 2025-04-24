//
//  CircleFigure.swift
//  InteractiveFigures
//
//  Created by Daniel Tsivkovski on 4/20/25.
//

import SwiftUI

struct CircleFigure: View {
    
    @State private var rotation : Double = 0;
    @State private var pastRotation : Double = 0;
    
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 0)
        .onChanged { value in
            // update rotation value with translation and past rotation value
            rotation = pastRotation + value.translation.width;
        }
        .onEnded { value in
            pastRotation = rotation // update past rotation value when you let go of the shape
        }
    }
    
    var body: some View {
        ZStack {
            // background circle
            Circle()
                .fill(Gradient(colors: [.red, .purple]))
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-rotation))
            // foreground text
            Text("Rotate me!").font(.largeTitle).fontWeight(.semibold)
                .foregroundStyle(.white)
                .rotationEffect(.degrees(rotation))
        }
        .gesture(drag)
        .animation(.spring, value: rotation)
    }
}

#Preview {
    CircleFigure()
}
