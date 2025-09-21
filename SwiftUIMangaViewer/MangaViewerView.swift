//
//  MangaViewerView.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/21.
//

import SwiftUI

struct MangaViewerView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://placehold.jp/800x1200.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    MangaViewerView()
}
