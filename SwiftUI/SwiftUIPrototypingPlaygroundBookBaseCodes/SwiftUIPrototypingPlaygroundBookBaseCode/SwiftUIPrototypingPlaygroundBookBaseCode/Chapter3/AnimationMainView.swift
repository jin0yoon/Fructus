//
//  AnimationMainView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/28.
//

import SwiftUI

struct AnimationMainView: View {
    
    @State private var leftArmAngle = 300
    
    @State private var rightArmAngle = 240
    
    var body: some View {
        
        HStack(spacing: 50){
            
            VStack{
                RotatedShape(shape: Rectangle(), angle: Angle(degrees: Double(leftArmAngle)))
                    .frame(width: 50, height: 200)
                    .foregroundColor(.pink)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                if leftArmAngle < 310{
                                    leftArmAngle += 10
                                }else if leftArmAngle > 280{
                                    leftArmAngle -= 10
                                }
                                
                            }
                    )
                
                Spacer().frame(height: 250)
            }
            
            
            VStack{
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .strokeBorder(Color.pink, lineWidth: 5)
                    .frame(width: 150, height: 200)
                
                HStack(spacing: 80){
                    RotatedShape(shape: Rectangle(), angle: Angle(degrees: 190))
                        .frame(width: 50, height: 200)
                        .foregroundColor(.green)
                    
                    RotatedShape(shape: Rectangle(), angle: Angle(degrees: 170))
                        .frame(width: 50, height: 200)
                        .foregroundColor(.green)
                }
            }
            
            VStack{
                RotatedShape(shape: Rectangle(), angle: Angle(degrees: Double(rightArmAngle)))
                    .frame(width: 50, height: 200)
                    .foregroundColor(.pink)
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                if rightArmAngle < 250{
                                    rightArmAngle += 10
                                }else if rightArmAngle > 220{
                                    rightArmAngle -= 10
                                }
                                
                            }
                    )
                
                Spacer().frame(height: 250)
            }
            
        }
        .frame(width: 500, height: 800)
        
    }
}

struct AnimationMainView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationMainView()
    }
}
