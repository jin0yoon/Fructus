//
//  ContentView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/18.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(strokeColor)
            
            Circle()
                .trim(from: 0, to: CGFloat(fractionCompleted))
                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}


struct ContentView: View {
    @State private var progress = 0.2

    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
