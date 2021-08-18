//
//  ContentView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/18.
//

import SwiftUI

//struct ContentView : View {
//    @State private var projecting = ["참여 가능한 프로젝트", "지난 프로젝트"]
//    @State private var selectedProjecting = "참여 가능한 프로젝트"
//    @State private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//    @State private var part = ["기획/마케팅", "프로그래밍", "데이터", "디자인", "스타트업", "환경", "봉사", "스터디", "기타"]
//    @State private var selectedPart = "기획/마케팅"
//    @State private var possibleProject = [
//        Project(image:#imageLiteral(resourceName: "monkey"), part:"기타", explanation:"제주 오름그리기 및 전시 프로젝트", name:"제주 오름 전시 프로젝트", place:"이아갤러리", date:"9.14.(화) 오후 7시", personnel:"3/5", isPossibleProject: true ),
//        Project(image:#imageLiteral(resourceName: "c2_item3"), part:"환경", explanation:"일상 속 제로웨이스트를 실천하고, 이를 습관화하기", name:"제주 플라스틱 Zero 프로젝트", place:"지구별가게", date:"8.21.(토) 오후 2시", personnel:"3/5", isPossibleProject: true ),
//        Project(image:#imageLiteral(resourceName: "coffee-8"), part:"환경", explanation:"환경을 생각한 장난감 재사용하기", name:"환경을 생각한 장난감 프로젝트", place:"관심사", date:"8.20.(금) 오후 7시", personnel:"3/5", isPossibleProject: true ),
//        Project(image:#imageLiteral(resourceName: "coffee-8"), part:"기획/마케팅", explanation:"고객 분석의 시작은 데이터분석으로부터!", name:"구글애널리틱스 A부터 Z까지", place:"청년센터", date:"8.19.(목) 오후7시", personnel:"3/5", isPossibleProject: false ),
//        Project(image:#imageLiteral(resourceName: "lion"), part:"환경", explanation:"제주에서 비건을 하는 사람들과 같이 레시피 공유하기", name:"제주에서 비건 프로젝트를?", place:"카페901", date:"8.19.(목) 오후 7시", personnel:"3/5", isPossibleProject: false ),
//        Project(image:#imageLiteral(resourceName: "coffee-12"), part:"기획/마케팅", explanation:"SNS마케팅 활용법과, 개인 퍼스널브랜딩", name:"퍼스널브랜딩으로 시작하는 SNS", place:"온라인", date:"8.18.(수) 오후 7시", personnel:"3/5", isPossibleProject: false )
//    ]
//
//
//    var body: some View {
//        VStack{
//            HStack {
//                if Projecting[index] == selectedProjecting {
//                    button(action: {
//
//                    }){
//                        Text(select[index])
//                    }
//                    .ButtonStyle(SelectedProjectButtonStyle())
//                } else {
//                    button(action: {
//                        selectedSelect = part[index]
//                    }) {
//                        Text(part[index])
//                    }
//                    .ButtonStyle(SelectedUnProjectButtonStyle())
//                }
//            }
//            LazyVGrid(columns: gridItemLayout, spacing: 20){
//                ForEach(0 ..< part.count) {index in
//                    if part[index] == selectedPart {
//                        Button(action: {
//
//                        }){
//                            Text(part[index])
//                        }
//                        .ButtonStyle(SelectedPartButtonStyle())
//                    } else {
//                        Button(action : {
//                            selectPart = part[index]
//                        }) {
//                            Text(part[index])
//                        }
//                        .ButtonStyle(UnselectedPartButtonStyle())
//                    }
//                }
//            }
//            .frame(heigh:100)
//            ScrollView{
//                VStack {
//                    ForEach(0 ..< possibleProject.count) {index in
//                        var ppr = possibleProject[index]
//                        ZStack {
//                            Image(uiImage: ppr.image)
//                                .resizable()
//                                .frame(heigh:200, width:500)
//                            VStack {
//                                HStack {
//                                    Text(ppr.part)
//                                        .frame(heigh:5, width:5)
//                                        .background(Color.gray)
//                                        .clipShape(Capsule())
//                                        .overlay(Capsule().stroke(Color.green, lineWidth:1))
//                                    Spacer
//                                }
//                                Spacer
//                                Text(ppr.explanation)
//                                    .font(system(size:10))
//                                Text(ppr.name)
//                                    .font(system(size:30))
//                                HStack {
//                                    Text(ppr.place)
//                                        .font(system(size:10))
//                                    Text(ppr.date)
//                                        .font(system(sixe:10))
//                                    Spacer
//                                    Text(ppr.personnel)
//                                }
//                            }
//                        }
//                    }
//                }
//                .frame(heigh:500)
//                .padding()
//            }
//        }
//
//    }
//}
//
////추가적인 View가 필요한 경우 아래와 같은 View를 추가하시면 됩니다.
//
//
//struct Projecting: Identifiable {
//    var id: String = UUID().uuidString
//    var select: String
//}
//
//struct Project: Identifiable {
//    var id: String = UUID().uuidString
//    var image: UIImage
//    var part: String
//    var explanation: String
//    var name: String
//    var place: String
//    var date: String
//    var personnel: String //Int
//    var isPossibleProject : Bool
//}


//struct SelectedPartButtonStyle: Buttonstyle {
//    func makebody(configuration: configuration) -> some View {
//        configuration.label
//            .foregroundColor(.black)
//            .frame(width: 10, height: 10)
//            .background(Color.purple)
//            .clipShape(Capsule())
//            .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
//    }
//}
//
//struct UnselectedPartButtonStyle: Buttonstyle {
//    func makebody(configuration: configuration) -> some View {
//        configuration.label
//            .foregroundColor(.white)
//            .frame(width: 10, heigt: 10)
//            .background(Color.White)
//            .clipShape(Capsule())
//            .overlay(Capsule().stroke(Color.gray, lineWidth:1))
//
//    }
//
//}
//
//struct SelectedProjectButtonStyle: Buttonstyle {
//    func makebody(configuration: configuration) -> some View {
//        configuration.label
//            .foregrounColor(.purple)
//            .frame(width: 30, height: 10)
//            .clipShape(Rectangle())
//            .overlay(Rectangle().stroke(Color.gray, lineWidth:1))
//    }
//}
//
//struct SelectedUnProjectButtonStyle: Buttonstyle {
//    func makebody(configuration: configuration) -> some View {
//        configuration.label
//            .foregroundColor(.gray)
//            .frame(width: 30, height: 10)
//            .clipShape(Rectangle())
//            .overlay(Rectangle().stroke(Color.gray,lineWidth:1))
//    }
//}


//struct GaugeProgressStyle: ProgressViewStyle {
//    var strokeColor = Color.blue
//    var strokeWidth = 25.0
//
//    func makeBody(configuration: Configuration) -> some View {
//        let fractionCompleted = configuration.fractionCompleted ?? 0
//
//        return ZStack {
//
//            Circle()
//                .stroke(lineWidth: 20.0)
//                .opacity(0.3)
//                .foregroundColor(strokeColor)
//
//            Circle()
//                .trim(from: 0, to: CGFloat(fractionCompleted))
//                .stroke(strokeColor, style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
//                .rotationEffect(.degrees(-90))
//        }
//    }
//}
//
//
//struct ContentView: View {
//    @State private var progress = 0.2
//
//    var body: some View {
//        ProgressView(value: progress, total: 1.0)
//            .progressViewStyle(GaugeProgressStyle())
//            .frame(width: 200, height: 200)
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
