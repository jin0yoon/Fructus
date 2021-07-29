//
//  OutlineGroupView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/28.
//

import SwiftUI

let questions: [String] = [
    "공정 사용이란 무엇인가요?",
    "공개 도메인이란 무엇인가요?",
    "2차적 저작물이란 무엇인가요?",
    "미국 이외 국가의 저작권에 대한 자세한 정보는 어디에서 찾을 수 있나요?"
]

let answers: [String] = [
    "공정 사용이란 특정 상황에서 저작권 소유자의 허가 없이 저작권 보호 자료를 재사용할 수 있음을 의미하는 법적 원칙입니다.\n\n법원에서는 다음과 같은 4가지 원칙에 따라 사례별로 공정 사용 여부를 결정합니다.\n * 사용 목적 및 특성\n * 저작권 보호 자료의 특성\n * 사용된 저작권 보호 자료의 양 및 중요도\n * 저작권 보호 자료의 잠재 시장 또는 가치에 미치는 영향",
    "저작물은 시간이 지나면 저작권 보호를 받지 못하게 되며 이때 모든 사용자가 무료로 사용할 수 있는 '공개 도매인'에 속하게 된다고 이야기합니다. 일반적으로 저작권 보호 자료가 공개 도메인에 포함되기까지 수년의 시간이 걸립니다.\n\n저작권 보호 기간은 다음과 같은 요소에 따라 달라집니다.\n\n저작권 보호 자료가 발표된 장소와 시기\n저작권 보호 자료에 고용인 저작권 보유 원칙이 적용되는지 여부\n미국 연방정부 기관에서 제작한 저작권 보호 자료 중 일부는 게시되자마자 공개 도메인에 포함되기도 합니다.공개 도메인의 규칙은 국가별로 다를 수 있습니다.",
    "저작권 소유자의 원본 콘텐츠에 기반하여 저작물을 만들려면 저작권 소유자의 허가를 받아야 합니다. 2차적 저작물에는 팬 픽션, 속편, 번역, 외전, 각생 등이 포함됩니다. 등장인물, 줄거리 및 저작권 보호를 받는 자료의 기타 요소에 근거한 동영상을 업로드하기 전에 전문가에게 법적 조언을 구하는 것이 좋습니다.",
    "유럽연합 집행위원회 웹사이트에서 유럽연합 국가의 저작권에 대한 유용한 정보와 링크를 확인할 수 있습니다.\n\n세계지적재산권기구(WIPO)에서 각국의 지적재산권 및 저작권 사무국 목록을 볼 수 있으며 현재 거주 국가의 저작권법에 대해 알아볼 수 있습니다."
    ]

struct FaqData: Identifiable {
    var id = UUID()
    var text: String
    var children: [FaqData]?
    
    static func result() -> [FaqData] {
        let answer1 = [FaqData(text: answers[0])]
        let answer2 = [FaqData(text: answers[1])]
        let answer3 = [FaqData(text: answers[2])]
        let answer4 = [FaqData(text: answers[3])]
        
        return [FaqData(text: "저작권 관련 일반 질문", children: [
            FaqData(text: questions[0], children: answer1),
            FaqData(text: questions[1], children: answer2),
            FaqData(text: questions[2], children: answer3),
            FaqData(text: questions[3], children: answer4)
        ])
        ]
    }
}

struct OutlineGroupView: View {
    
    var body: some View {
        NavigationView{
            List{
                ForEach(FaqData.result()){faq in
                    Section(header: EmptyView()){
                        OutlineGroup(faq, children: \.children) {
                            Text("\($0.text)")
                        }
                    }
                }
            }
            .navigationTitle("FAQ")
        }
    }
}

struct OutlineGroupView_Previews: PreviewProvider {
    static var previews: some View {
        OutlineGroupView()
    }
}
