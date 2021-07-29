//
//  SpacerDivider.swift
//  SwiftUIPrototypingPlaygroundBookBaseCode
//
//  Created by 윤진영 on 2021/07/28.
//

import SwiftUI

struct SpacerDivider: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack(spacing:0){
                    Text("Genres + Moods")
                        .font(.system(size:20, weight: .bold, design: .rounded))
                    Spacer()
                    Text("View as list")
                        .font(.system(size:15, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                VStack(spacing:0){
                    HStack(spacing:0){
                        Image("hophop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 100)
                        
                        Spacer()
                        
                        Image("pop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 100)
                    }
                    Spacer()
                    
                    HStack(spacing:0){
                        Image("rock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 100)
                        
                        Spacer()
                        
                        Image("latin")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 100)
                    }
                }
                
                Divider()
                
                Text("Podcasts")
                    .font(.system(size:30, weight: .bold, design: .rounded))
                
                Spacer()
                
                VStack(alignment: .leading){
                    
                    Text("Part 1: The National Day Show")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    
                    Text("Selamat bersuti semua. Kami nyanyikan kembali lagu-lagu yang dah biasa kita dengar dalam hari kebangsaan.")
                        .font(.system(size:10, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "play.circle.fill")
                        Text("YESTERDAY - 2HR 24MIN")
                            .font(.system(size:20, weight: .semibold, design: .rounded))
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "arrow.down.circle")
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    
                    Text("Part 2: The National Day Show")
                        .font(.system(size:20, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    
                    Text("Selamat bersuti semua. Kami nyanyikan kembali lagu-lagu yang dah biasa kita dengar dalam hari kebangsaan.")
                        .font(.system(size:10, weight: .semibold, design: .rounded))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    HStack{
                        Image(systemName: "play.circle.fill")
                        Text("TODAY - 2HR 24MIN")
                            .font(.system(size:20, weight: .semibold, design: .rounded))
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "arrow.down.circle")
                    }
                }
            }
        }
        .padding()
    }
}

struct SpacerDivider_Previews: PreviewProvider {
    static var previews: some View {
        SpacerDivider()
    }
}

