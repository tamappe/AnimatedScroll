//
//  ContentView.swift
//  ScrollAnimation
//
//  Created by 玉置 on 2020/07/30.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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

struct AlbumView: View {
    var album: Album
    
    var body: some View {
        HStack {
            Image(album.album_cover)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 12) {
                Text(album.album_name)
                    .fontWeight(.bold)
                Text(album.album_author)
            }
            .padding(.leading, 10)
            Spacer(minLength: 0)
        }
        .background(Color.white.shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 4))
        .cornerRadius(15)
    }
}

struct Album {
    var album_name: String
    var album_author: String
    var album_cover: String
}

var albums = [
    Album(album_name: "Let Her Go", album_author: "Passenger", album_cover: "p1"),
    Album(album_name: "Bad Blood", album_author: "Taylor Swift", album_cover: "p2"),
    Album(album_name: "Believer", album_author: "Kurt Hugo Schneider", album_cover: "p3"),
    Album(album_name: "Let Me Love You", album_author: "DJ Snake", album_cover: "p4"),
    Album(album_name: "Shape Of You", album_author: "Ed Sherran", album_cover: "p5"),
    Album(album_name: "Blank Space", album_author: "Taylor Swift", album_cover: "p6"),
    Album(album_name: "Havana", album_author: "Camila Cabello", album_cover: "p7"),
    Album(album_name: "Red", album_author: "Taylor Swift", album_cover: "p8"),
    Album(album_name: "I Like It", album_author: "J Balvin", album_cover: "p9"),

]
