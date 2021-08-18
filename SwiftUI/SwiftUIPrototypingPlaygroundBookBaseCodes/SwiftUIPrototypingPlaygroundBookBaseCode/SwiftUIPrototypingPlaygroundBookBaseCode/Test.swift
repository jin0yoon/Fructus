//
//  Test.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/08/16.
//

import SwiftUI

struct ProjectView : View {
    
    @State private var selectedProjecting = "참여 가능한 프로젝트"
    @State private var selectedPart = "환경"
    
    @State private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack{
            HStack{
                ForEach(0 ..< projecting.count) {index in
                    if projecting[index] == selectedProjecting {
                        Button(action : {

                        }) {
                            Text(projecting[index])
                        }
                        .foregroundColor(.white)
                        .frame(width: 250, height: 30)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.purple, lineWidth:1))
                        .background(Color.purple)
                    } else {
                        Button(action: {
                            selectedProjecting = projecting[index]
                        }) {
                            Text(projecting[index])
                        }
                        .foregroundColor(.gray)
                        .frame(width: 250, height: 30)
                        .clipShape(Rectangle())
                        .overlay(Rectangle().stroke(Color.purple, lineWidth:1))
                    }
                }
            }
            .padding(.top, 10)
            
            LazyVGrid(columns: gridItemLayout, spacing: 20){
                ForEach(0 ..< part.count) {index in
                    if part[index] == selectedPart {
                        Button(action: {
                            
                        }){
                            Text(part[index])
                        }
                        .foregroundColor(.white)
                        .frame(width: 150, height: 20)
                        .background(Color.purple)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.purple, lineWidth: 1))
                    } else {
                        Button(action : {
                            selectedPart = part[index]
                        }) {
                            Text(part[index])
                        }
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 20)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.purple, lineWidth:1))
                    }
                }
            }
            ScrollView(showsIndicators: false){
                VStack(spacing:20) {
                    ForEach(0 ..< possibleProject.count) {index in
                        var ppr = possibleProject[index]
                        ZStack {
                            Image(uiImage: ppr.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .frame(width:400, height:200)
                            Rectangle()
                                .background(Color.black)
                                .opacity(0.3)
                                .frame(width:400, height:200)
                            VStack(alignment:.leading, spacing: 10) {
                                Text(ppr.part)
                                    .font(.system(size:9))
                                    .foregroundColor(.green)
                                    .frame(width:62, height:16)
                                    .background(Color.black)
                                    .clipShape(Capsule())
                                    .padding(.horizontal, 60)
                                    .padding(.top, 10)
                                Spacer()
                                Text(ppr.explanation)
                                    .font(.system(size:10))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 60)
                                Text(ppr.name)
                                    .foregroundColor(.white)
                                    .font(.system(size:16))
                                    .padding(.horizontal, 60)
                                HStack {
                                    Text(ppr.place)
                                        .font(.system(size:10))
                                        .padding(.horizontal, 60)
                                    Text(ppr.date)
                                        .font(.system(size:10))
                                    Spacer()
                                    Text(ppr.personnel)
                                        .frame(width:50, height:16)
                                        .font(.system(size:10))
                                        .background(Color.black)
                                        .clipShape(Capsule())
                                        .foregroundColor(.purple)
                                        .padding(.bottom, 10)
                                        .padding(.horizontal, 50)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct PossibleProject: Identifiable {
    var id: String = UUID().uuidString
    var image: UIImage
    var part: String
    var explanation: String
    var name: String
    var place: String
    var date: String
    var personnel: String //Int
}

let possibleProject = [
    PossibleProject(image:#imageLiteral(resourceName: "c2_item1.png"), part:"기타", explanation:"제주 오름그리기 및 전시 프로젝트", name:"제주 오름 전시 프로젝트", place:"이아갤러리", date:"9.14.(화) 오후 7시", personnel:"3/5"),
    PossibleProject(image:#imageLiteral(resourceName: "c2_item2.png"), part:"환경", explanation:"일상 속 제로웨이스트를 실천하고, 이를 습관화하기", name:"제주 플라스틱 Zero 프로젝트", place:"지구별가게", date:"8.21.(토) 오후 2시", personnel:"3/5" ),
    PossibleProject(image:#imageLiteral(resourceName: "c2_item3.png"), part:"환경", explanation:"환경을 생각한 장난감 재사용하기", name:"환경을 생각한 장난감 프로젝트", place:"관심사", date:"8.20.(금) 오후 7시", personnel:"3/5"),
    PossibleProject(image:#imageLiteral(resourceName: "c2_item4.png"), part:"기획/마케팅", explanation:"고객 분석의 시작은 데이터분석으로부터!", name:"구글애널리틱스 A부터 Z까지", place:"청년센터", date:"8.19.(목) 오후7시", personnel:"3/5"),
    PossibleProject(image:#imageLiteral(resourceName: "c2_item5.png"), part:"환경", explanation:"제주에서 비건을 하는 사람들과 같이 레시피 공유하기", name:"제주에서 비건 프로젝트를?", place:"카페901", date:"8.19.(목) 오후 7시", personnel:"3/5"),
    PossibleProject(image:#imageLiteral(resourceName: "c2_item6.png"), part:"기획/마케팅", explanation:"SNS마케팅 활용법과, 개인 퍼스널브랜딩", name:"퍼스널브랜딩으로 시작하는 SNS", place:"온라인", date:"8.18.(수) 오후 7시", personnel:"3/5")
]

let projecting = ["참여 가능한 프로젝트", "지난 프로젝트"]
let part = ["기획/마케팅", "프로그래밍", "데이터", "디자인", "스타트업", "환경", "봉사", "스터디", "기타"]


struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
