//
//  ViewerPageView.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/22.
//

import SwiftUI

struct ViewerPageView: View {
    let page: Page

    var body: some View {
        AsyncImage(url: URL(string: page.imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    ViewerPageView(page: Page(imageUrl: "https://placehold.jp/800x1200.png?text=0"))
}
