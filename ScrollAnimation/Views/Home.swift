//
//  Home.swift
//  ScrollAnimation
//
//  Created by 玉置 on 2020/07/30.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Album Songs")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white.shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5))
            .zIndex(0)
            
            GeometryReader{ mainView in
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(albums, id: \.album_name) { album in
                            GeometryReader { item in
                                AlbumView(album: album)
                                    .scaleEffect(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY), anchor: .top)
                                    .opacity(Double(scaleValue(mainFrame: mainView.frame(in: .global).minY, minY: item.frame(in: .global).minY)))
                            }
                            .frame(height: 100)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 25)
                }
                .zIndex(1)
            }
            
            
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.top)
    }
    
    func scaleValue(mainFrame: CGFloat, minY: CGFloat) -> CGFloat {
        withAnimation(.easeOut) {
            let scale = (minY - 25) / mainFrame
            print(scale)
            
            if scale > 1 {
                return 1
            } else {
                return scale
            }
        }
    }
}
