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
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: .zero) {
                    ForEach(Array(0..<10).reversed(), id: \.self) { i in
                        ZStack(alignment: .bottom) {
                            AsyncImage(url: URL(string: "https://placehold.jp/800x1200.png")) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            Text("\(i)")
                                .font(.largeTitle)
                        }
                    }
                    .frame(width: geometry.size.width)
                }
            }
            .defaultScrollAnchor(.trailing)
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MangaViewerView()
}
