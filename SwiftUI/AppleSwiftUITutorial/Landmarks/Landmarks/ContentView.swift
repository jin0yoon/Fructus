//
//  ContentView.swift
//  Landmarks
//
//  Created by 윤진영 on 2021/09/08.
//

/*
 요소 -> Command + click -> inspector
 */

/*
 To customize a SwiftUI view, you call methods called modifiers.
 Modifiers wrap a view to change its display or other properties.
 Each modifier returns a new view,
 so it’s common to chain multiple modifiers, stacked vertically.
 */

/*
 A spacer expands to make its containing view use all of the space of its parent view, instead of having its size defined only by its contents.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
