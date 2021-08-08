//
//  ShoppingMainView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/26.
//

import SwiftUI

struct ShoppingTabView: View {
    
    var body: some View{
        TabView{
            ShoppingMainView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Shop")
                    }
                }
            ShoppingCartView()
                .tabItem {
                    VStack{
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
        }
    }
}

struct ShoppingMainView: View {
    
    @State private var selected = tabs[0]
    @Namespace var animation
    @State private var isShow = false
    
    let sortedItems = items.sorted{$0.rating > $1.rating}
    
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
                            .font(.system(size:35, weight: .bold, design: .rounded))
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(sortedItems.indices){index in
                                    NavigationLink(
                                        destination: ShoppingDetailView(selectedItem: sortedItems[index], animation: animation),
                                        label: {
                                            BestItemCardView(item: sortedItems[index], animation: animation, rankingNumber: index+1)
                                        })
                                }
                            }
                        }
                    }
                    
                    Spacer().frame(height: 50)
                    
                    VStack(alignment: .leading){
                        Text("Updated Item")
                            .font(.system(size:35, weight: .bold, design: .rounded))
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25){
                            
                            ForEach(items.shuffled()){item in
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
            .navigationBarItems(leading:
                                    Button(action: {

                                    }){
                                        Image(systemName: "line.horizontal.3")
                                            .font(.system(size: 25, weight: .bold))
                                            .foregroundColor(.cyon)
                                    },
                                trailing:
                                    Button(action: {

                                    }){
                                        Image(systemName: "magnifyingglass")
                                            .font(.system(size: 25, weight: .bold))
                                            .foregroundColor(.cyon)
                                    })
        }
        
    }
}

struct ShoppingCartView: View {
    @State private var buttonClicked = false
    
    var body: some View{
        VStack{
            Text("My Cart")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)
            
            List(myCart){ cartItem in
                HStack{
                    Image(cartItem.image)
                        .resizable()
                        .frame(width: 100, height: 150)
                    
                    VStack(alignment: .leading){
                        Text(cartItem.title)
                            .font(.system(size:25, weight: .bold, design: .rounded))
                        
                        Text("\(cartItem.color)-\(cartItem.size)")
                            .font(.system(size:20, weight: .bold, design: .rounded))
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                        
                        Spacer()
                        
                        HStack{
                            Text("\(cartItem.price * cartItem.count)")
                                .font(.system(size:25, weight: .bold, design: .rounded))
                            
                            Spacer()
                            
                            HStack{
                                Button(action:{

                                }){
                                    Image(systemName: "minus")
                                        
                                }
                                
                                Text("\(cartItem.count)")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .border(Color.cyon, width: 2)
                                    .cornerRadius(5)
                                
                                Button(action:{

                                }){
                                    Image(systemName: "plus")
                                }
                            }
                            .font(.system(size:20, weight: .bold, design: .rounded))
                            .foregroundColor(.cyon)
                        }
                        
                    }
                    .padding(.leading)
                }
            }.listStyle(SidebarListStyle())
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            HStack{
                Text("Total")
                    .font(.system(size:30, weight: .bold, design: .rounded))
                    .foregroundColor(.cyon)
                
                Spacer()
                
                Text("\(totalSum(carts: myCart))")
                    .font(.system(size:30, weight: .bold, design: .rounded))
            }
            
            
            Button(action:{
                self.buttonClicked.toggle()
            }){
                Text(buttonClicked ? "Purchase completed" : "Purchase Now")
            }
            .buttonStyle(BuyButtonStyle())
        }
        .padding()
    }
}

struct ShoppingDetailView : View {
    @Environment(\.presentationMode) var presentationMode
    var selectedItem: ShopItem
    
    var animation: Namespace.ID
    
    @State private var selectedColor = "colors"
    
    @State private var buttonClicked = false
    
    var body: some View{
        VStack{
            Image(selectedItem.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            VStack(alignment: .leading){
                Text(selectedItem.title)
                    .font(.system(size:30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                HStack{
                    Text("Price")
                        .font(.system(size:20, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("\(selectedItem.price)")
                        .font(.system(size:30, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .padding(.leading, 180)
                
                HStack{
                    Text("Color")
                        .font(.system(size:20, weight: .medium, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Picker(selection: $selectedColor,
                           label:
                            HStack(spacing:5){
                                Text(selectedColor)
                                    .font(.system(size:30, weight: .bold, design: .rounded))
                                Image(systemName: "chevron.down")
                                    .font(.system(size:20, weight: .medium, design: .rounded))
                            }
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    ){
                        ForEach(selectedItem.colors, id: \.self){ color in
                            Text(color).tag(color)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                .padding(.leading, 180)
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            Button(action:{
                self.buttonClicked.toggle()
            }){
                Text(buttonClicked ? "Purchase completed" : "Purchase Now")
            }
            .buttonStyle(BuyButtonStyle())
            
            HStack(spacing: 20){
                Button(action:{
                    addCart(selectedItem: selectedItem, selectedColor: selectedColor)
                }){
                    Text("Cart")
                }
                .buttonStyle(CartButtonStyle())
                
                Button(action:{
                    
                }){
                    Text("Share")
                }
                .buttonStyle(CartButtonStyle())
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .padding(.bottom)
            
        }
        .navigationBarTitle("Detail", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.cyon)
                                },
                            trailing:
                                Button(action: {
                                    
                                }){
                                    Image(systemName: "magnifyingglass")
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.cyon)
                                })
        .onAppear(){
            selectedColor = selectedItem.colors[0]
        }
    }
}

struct ShoppingMainView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingTabView()
            .preferredColorScheme(.dark)
    }
}

var tabs = ["All", "Shirts", "Pants", "Skirts", "Outer"]

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
    var item: ShopItem
    var animation: Namespace.ID
    
    var body: some View{
        
        VStack(alignment: .leading){
            Image(item.image)
                .resizable()
                .frame(width: 180, height: 200)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            Text(item.title)
                .font(.system(size:20, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .lineLimit(1)
            
            Text("\(item.price)")
                .font(.system(size:25, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(width: 180)
    }
}

struct BestItemCardView: View {
    var item: ShopItem
    var animation: Namespace.ID
    var rankingNumber: Int
    
    var body: some View{
        
        VStack(alignment: .leading){
            Image(item.image)
                .resizable()
                .frame(width: 150, height: 200)
            
            Text(String(format: "%02d", rankingNumber))
                .font(.system(size:20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            Text(item.title)
                .font(.system(size:20, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .lineLimit(1)
            
            Text("\(item.price)")
                .font(.system(size:25, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(width: 150)
    }
}

struct MyCart: Identifiable{
    var id = UUID().uuidString
    var title: String
    var price: Int
    var image: String
    var count: Int
    var color: String
    var size: String
}

var myCart : [MyCart] = [
    MyCart(title: "3 colors knit", price: 54000, image: "c2_item1", count: 1, color: "white", size: "L"),
    MyCart(title: "Sleeveless shirts", price: 36000, image: "c2_item3", count: 1, color: "black", size: "M"),
    MyCart(title: "Basic T shirts", price: 18900, image: "c2_item6", count: 1, color: "gray", size: "XL")
]

func totalSum(carts:[MyCart]) -> Int {
    var prices : [Int] = []
    
    //for문, forEach 둘 다
//    for i in 0..<carts.count{
//        prices.append(carts[i].price)
//    }
    
    carts.forEach{ cart in
        prices.append(cart.price)
    }
    
    return prices.reduce(0, +)
}

func addCart(selectedItem: ShopItem, selectedColor: String) {
    if !selectedItem.cart{
        myCart.append(MyCart(title: selectedItem.title, price: selectedItem.price, image: selectedItem.image, count: 1, color: selectedColor, size: "L"))
    }
    print(myCart)
}

struct ShopItem: Identifiable {
    var id = UUID().uuidString
    var title: String
    var price: Int
    var rating: String
    var image: String
    var colors: [String]
    var size: [String]
    var cart: Bool
}

var items = [
    ShopItem(title: "3 colors knit", price: 54000, rating: "4.9", image: "c2_item1", colors: ["white", "brown", "olive"], size: ["S", "M", "L", "XL"], cart: true),
    ShopItem(title: "4 colors T shirts", price: 27000, rating: "4.3", image: "c2_item2", colors: ["white", "black", "navy", "stripe"], size: ["S", "M", "L", "XL"], cart: false),
    ShopItem(title: "Sleeveless shirts", price: 36000, rating: "4.2", image: "c2_item3", colors: ["black", "navy"], size: ["S", "M", "L", "XL"], cart: true),
    ShopItem(title: "6 colors Round T shirts", price: 29900, rating: "3.8", image: "c2_item4", colors: ["white", "red", "wine", "blue", "yellow", "dark-gray"], size: ["S", "M", "L", "XL"], cart: false),
    ShopItem(title: "Short Knit", price: 39900, rating: "4.0", image: "c2_item5", colors: ["white", "brown", "gray"], size: ["S", "M", "L", "XL"], cart: false),
    ShopItem(title: "Basic T shirts", price: 18900, rating: "4.1", image: "c2_item6", colors: ["white", "gray", "black"], size: ["S", "M", "L", "XL"], cart: true)
]

extension Color {
//    static let cyon = Color(red: 26 / 255, green: 232 / 255, blue: 212 / 255)
    static let tabBackground = Color(red: 46 / 255, green: 46 / 255, blue: 46 / 255)
}

struct BuyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size:30, weight: .heavy, design: .rounded))
            .foregroundColor(.black)
            .padding(10)
            .frame(width: 400)
            .background(Color.cyon)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.cyon, lineWidth: 5))
            .padding(.top)
    }
}

struct CartButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size:30, weight: .heavy, design: .rounded))
            .foregroundColor(.cyon)
            .padding(10)
            .frame(width: 190)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.cyon, lineWidth: 2))
            .padding(.vertical, 10)
    }
}
