//
//  AlbumView.swift
//  ScrollAnimation
//
//  Created by 玉置 on 2020/07/30.
//

import SwiftUI

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
