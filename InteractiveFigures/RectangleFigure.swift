//
//  RectangleFigure.swift
//  InteractiveFigures
//
//  Created by Daniel Tsivkovski on 4/23/25.
//

import SwiftUI

struct RectangleFigure: View {
    
    @State private var cornerValue: CGSize = .zero;
    
    var pinch: some Gesture {
        MagnifyGesture()
            .onChanged { value in
                // update corner value based on magnification / pinch value
                cornerValue = CGSize(
                    width: max(0, value.magnification * 40),
                    height: max(0, value.magnification * 40)
                )
                
            }
            .onEnded { value in
                // reset back to zero if no longer pinching
                cornerValue = .zero;
            }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: cornerValue)
                .fill(Gradient(colors: [.blue, .green]))
                .frame(width: 300, height: 300)
            Text("Zoom in on me!").font(.largeTitle).fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .gesture(pinch)
        .animation(.spring, value: cornerValue)
    }
}

#Preview {
    RectangleFigure()
}
