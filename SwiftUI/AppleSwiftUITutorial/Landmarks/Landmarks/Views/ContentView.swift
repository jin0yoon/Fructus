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
        VStack {
            
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage()
            //These adjustments make room for the text by moving the image upwards.
            //이러한 조정은 이미지를 위로 이동하여 텍스트를 위한 공간을 만듭니다.
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                //When you apply a modifier to a layout view like a stack, SwiftUI applies the modifier to all the elements contained in the group.
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here")
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
