//
//  ContentView.swift
//  InteractiveFigures
//
//  Created by Daniel Tsivkovski on 4/20/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1;
    
    var body: some View {
        Text("Figure Box")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding([.top], 10)
        TabView(selection: $selection) {
            CircleFigure()
                .tabItem {
                    Image(systemName: "circle")
                    Text("Circle Figure")
                }
                .tag(1)
            RectangleFigure()
                .tabItem {
                    Image(systemName: "square")
                    Text("Square Figure")
                }.tag(2)
            CapsuleFigure()
                .tabItem {
                    Image(systemName: "capsule")
                    Text("Capsule Figure")
                }.tag(3)
        }
    }
}

#Preview {
    ContentView()
}
