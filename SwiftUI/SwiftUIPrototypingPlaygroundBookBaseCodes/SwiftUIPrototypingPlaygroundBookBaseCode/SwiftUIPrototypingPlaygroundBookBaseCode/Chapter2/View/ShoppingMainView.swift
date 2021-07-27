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
    @State private var isShow = false
    
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
                                    NavigationLink(
                                        destination: ShoppingDetailView(selectedItem: item, animation: animation),
                                        label: {
                                            CardView(item: item, animation: animation)
                                        })
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading){
                        Text("Updated Item")
                            .font(.system(size:40, weight: .bold, design: .rounded))
                        
                        //신규상품목록
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25){
                            
                            ForEach(items.shuffled()){item in
                                //CardView
                                NavigationLink(
                                    destination: ShoppingDetailView(selectedItem: item, animation: animation),
                                    label: {
                                        CardView(item: item, animation: animation)
                                    })
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

struct ShoppingDetailView : View {
    var selectedItem: Item
    
    var animation: Namespace.ID
    
    var body: some View{
        VStack {
            Image(selectedItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text(selectedItem.title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
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

struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var price: String
    var rating: String
    var image: String
    var colors: [String]
    var size: [String]
}

var items = [
    Item(title: "3 colors knit", price: "54,000", rating: "4.9", image: "c2_item1", colors: ["white", "brown", "olive"], size: ["S", "M", "L", "XL"]),
    Item(title: "4 colors T shirts", price: "27,000", rating: "4.3", image: "c2_item2", colors: ["white", "black", "navy", "stripe"], size: ["S", "M", "L", "XL"]),
    Item(title: "Sleeveless shirts", price: "36,000", rating: "4.2", image: "c2_item3", colors: ["black", "navy"], size: ["S", "M", "L", "XL"]),
    Item(title: "6 colors Round T shirts", price: "29,900", rating: "3.8", image: "c2_item4", colors: ["white", "red", "wine", "blue", "yellow", "dark-gray"], size: ["S", "M", "L", "XL"]),
    Item(title: "Short Knit", price: "39,900", rating: "4.0", image: "c2_item5", colors: ["white", "brown", "gray"], size: ["S", "M", "L", "XL"]),
    Item(title: "Basic T shirts", price: "18,900", rating: "4.1", image: "c2_item6", colors: ["white", "gray", "black"], size: ["S", "M", "L", "XL"])
]

extension Color {
//    static let cyon = Color(red: 26 / 255, green: 232 / 255, blue: 212 / 255)
    static let tabBackground = Color(red: 46 / 255, green: 46 / 255, blue: 46 / 255)
}
