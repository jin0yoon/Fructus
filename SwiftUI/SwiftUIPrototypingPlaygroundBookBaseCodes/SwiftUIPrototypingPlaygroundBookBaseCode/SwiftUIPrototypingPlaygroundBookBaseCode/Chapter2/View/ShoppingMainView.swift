//
//  ShoppingMainView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/26.
//

import SwiftUI

struct ShoppingMainView: View {
    
    @State private var selected = tabs[0]
    @Namespace var animation
    
    var body: some View {
        NavigationView{
            VStack{
                HStack(spacing:0){
                    ForEach(tabs, id:\.self){tab in
                        TabButton(title: tab, selected: $selected, animation: animation)
                        
                        if tab != tabs.last{
                            Spacer(minLength: 0)
                            
                        }
                    }
                }
                .padding()
                .padding(.top, 5)
                .background(Color.tabBackground)
                
                ScrollView(showsIndicators: false){
                    VStack(alignment: .leading){
                        Text("Best Item")
                            .font(.system(size:40, weight: .bold, design: .rounded))
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(items.sorted{$0.rating > $1.rating}){item in
                                    //CardView
                                    CardView(item: item, animation: animation)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Updated Item")
                            .font(.system(size:40, weight: .bold, design: .rounded))
                        
                        //신규상품목록
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25){
                            
                            ForEach(items){item in
                                //CardView
                                CardView(item: item, animation: animation)
                            }
                        }
                    }
                }
                .padding(5)
                Spacer(minLength: 0)
            }
            .navigationBarTitle("Shop", displayMode: .inline)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {}){
                        
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {}){
                        
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    }
                }
            })
        }
        
    }
}

struct ShoppingMainView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingMainView()
            .preferredColorScheme(.dark)
    }
}

var tabs = ["All", "Shirts", "Pants", "Sirts", "Outer"]

struct TabButton: View {
    var title: String
    @Binding var selected: String
    
    var animation: Namespace.ID
    
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                selected = title
            }
        }){
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .black : .white)
                .padding(.vertical, 10)
                .padding(.horizontal, selected == title ? 20 : 0)
                .background(
                    
                    ZStack{
                        if selected == title{
                            Color.cyon
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                    
                )
        }
    }
}

struct CardView: View {
    var item: Item
    var animation: Namespace.ID
    
    var body: some View{
        
        VStack(alignment: .leading){
            Image(item.image)
                .resizable()
                .frame(width: 150, height: 200)
            
            Divider().frame(width: 150)
            
            Text(item.title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(item.price)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
    }
}

extension Color {
//    static let cyon = Color(red: 26 / 255, green: 232 / 255, blue: 212 / 255)
    static let tabBackground = Color(red: 46 / 255, green: 46 / 255, blue: 46 / 255)
}
