//
//  GroupBoxView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/28.
//

import SwiftUI

struct HealthRow: Identifiable, Hashable {
    var id = UUID()
    var label: String
    var image: String
    var value: String
    var unit: String
}

var healthData: [HealthRow] = [
    HealthRow(label: "실외 걷기", image: "figure.walk", value: "1031", unit: "Songs"),
    HealthRow(label: "자전거 타기", image: "bicycle", value: "3619", unit: "Times")
    ]

struct GroupBoxView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Summary")
                        .font(.system(size:30, design: .rounded))
                    
                    GroupBox{
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                
                                VStack(alignment: .leading, spacing: 2){
                                    Text("움직이기")
                                        .font(.system(.headline, design: .rounded))
                                    
                                    Text("7 days pressure")
                                        .font(.system(.callout, design: .rounded))
                                        .foregroundColor(.red)
                                }
                                
                                VStack(alignment: .leading, spacing: 2){
                                    Text("운동하기")
                                        .font(.system(.headline, design: .rounded))
                                    
                                    Text("7 days pressure")
                                        .font(.system(.callout, design: .rounded))
                                        .foregroundColor(.green)
                                }
                                
                                VStack(alignment: .leading, spacing: 2){
                                    Text("일어서기")
                                        .font(.system(.headline, design: .rounded))
                                    
                                    Text("7 days pressure")
                                        .font(.system(.callout, design: .rounded))
                                        .foregroundColor(.blue)
                                }
                                
                            }
                            Spacer()
                            
                            
                        }
                    }.groupBoxStyle(SummaryGroupBoxStyle(color: .red))
                    
                    
                    Text("신체 신호")
                        .font(.system(size:30, design: .rounded))
                    
                    GroupBox(label: Label("평균 심박수", systemImage: "heart.fill")) {
                        HealthValueView(value: "100", unit: "BPM")
                    }.groupBoxStyle(HealthGroupBoxStyle(color: .red))
                    
                    Text("운동")
                        .font(.system(size:30, design: .rounded))
                    
                    ForEach(healthData) { item in
                        GroupBox(label: Label(item.label, systemImage: item.image)) {
                            HealthValueView(value: item.value, unit: item.unit)
                        }.groupBoxStyle(HealthGroupBoxStyle(color: .red))
                    }
                    
                }.padding()
            }.background(Color(.systemGroupedBackground)).edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Health")
        }
    }
}

struct HealthGroupBoxStyle: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        GroupBox(label: HStack {
            configuration.label
                .foregroundColor(color)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color(.systemGray4))
                .imageScale(.small)
        }) {
            configuration.content
                .padding(.top)
        }
    }
}

struct SummaryGroupBoxStyle: GroupBoxStyle {
    var color: Color

    @ScaledMetric var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        GroupBox{
            configuration.content
        }
    }
}

struct HealthValueView: View {
    var value: String
    var unit: String
    
    @ScaledMetric var size: CGFloat = 1
    
    @ViewBuilder var body: some View {
        HStack {
            Text(value)
                .font(.system(size: 24 * size, weight: .bold, design: .rounded))
                + Text(" \(unit)")
                .font(.system(size: 14 * size, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct GroupBoxView_Previews: PreviewProvider {
    static var previews: some View {
        GroupBoxView()
    }
}
