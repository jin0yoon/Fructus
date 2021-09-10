//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 윤진영 on 2021/09/08.
//

/*
 An app that uses the SwiftUI app life cycle has a structure that conforms to the App protocol. The structure’s body property returns one or more scenes, which in turn provide content for display. The @main attribute identifies the app’s entry point.
 
 SwiftUI를 사용하는 앱 life cycle은 앱 프로토콜을 준수하는 structure를 가진다.
 Structure의 body property는 하나 또는 여러개의 scenes를 반환하며,
 이 scene들은 다시 표시할 콘텐츠를 제공한다.
 @main attrubute는 앱의 진입점을 식별한다.
 */

import SwiftUI

@main
struct LandmarksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
