//
//  Item.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/26.
//

import SwiftUI

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
