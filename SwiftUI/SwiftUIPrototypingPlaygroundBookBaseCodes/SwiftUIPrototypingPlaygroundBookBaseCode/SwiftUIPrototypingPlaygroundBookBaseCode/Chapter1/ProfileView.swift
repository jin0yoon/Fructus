//
//  ProfileView.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var follower = 105
    @State private var following = 96
    
    @State private var isAccountToggle = false
    @State private var isDisturbToggle = false
    
    var body: some View {
        VStack (spacing: 15){
            
            Image("sv_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("Codershigh")
                .font(.system(size:30, weight: .heavy, design: .rounded))
                .foregroundColor(.white)
            
            Button(action: {
                
            }, label: {
                Text("Edit Profile")
            })
            .buttonStyle(MyButtonStyle())
            
            Text("@iOS developer")
                .font(.system(size:20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            HStack(spacing: 30){
                HStack{
                    Image("instagram")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text("coders_high_")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                        .foregroundColor(.cyon)
                }
                
                HStack{
                    Image("youtube")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text("스위프트하이")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                        .foregroundColor(.cyon)
                }
            }
            
            HStack(spacing: 30){
                HStack{
                    Text("\(follower)")
                        .font(.system(size:40, weight: .heavy, design: .rounded))
                    Text("follower")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                }
                
                HStack{
                    Text("\(following)")
                        .font(.system(size:40, weight: .heavy, design: .rounded))
                    Text("following")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                }
                
            }
            .foregroundColor(.white)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
            
            HStack{
                Label(
                    title: { Text("Private Account") },
                    icon: { Image(systemName: "lock") }
                )
                .font(.system(size:25, weight: .bold, design: .rounded))
                
                Spacer()
                
                Toggle("", isOn: $isAccountToggle)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .cyon))
            }
            .padding()
            
            HStack{
                Label(
                    title: { Text("Do not disturb") },
                    icon: { Image(systemName: "bell") }
                )
                .font(.system(size:25, weight: .bold, design: .rounded))
                
                Spacer()
                
                Toggle("", isOn: $isDisturbToggle)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .cyon))
            }
            .padding()
        }
    }
}

struct MyButtonStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.system(size:20, weight: .heavy, design: .rounded))
            .foregroundColor(.black)
            .padding(10)
            .padding(.horizontal, 30)
            .background(Color.cyon)
            .clipShape(Capsule())
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}

extension Color {
    static let cyon = Color(red: 26 / 255, green: 232 / 255, blue: 212 / 255)
}
