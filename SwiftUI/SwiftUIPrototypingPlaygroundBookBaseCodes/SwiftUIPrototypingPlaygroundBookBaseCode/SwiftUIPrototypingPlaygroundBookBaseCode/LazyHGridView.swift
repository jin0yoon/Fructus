//
//  LazyHGridView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/28.
//

import SwiftUI

struct LazyHGridView: View {
    
    @State var gridLayout: [GridItem] = [ GridItem() ]
    
    var body: some View {
        NavigationView {
            ScrollView (.horizontal) {
                LazyHGrid(rows: gridLayout, alignment: .top, spacing: 10) {
                    
                    ForEach(samplePhotos.indices) { index in
                        
                        Image(samplePhotos[index].name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: gridLayout.count == 1 ? 400 : gridLayout.count == 2 ? 250 : gridLayout.count == 3 ? 150 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring())
            }
            
            .navigationTitle("Coffee Feed")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 4 + 1)
                    }) {
                        Image(systemName: "square.grid.2x2")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
