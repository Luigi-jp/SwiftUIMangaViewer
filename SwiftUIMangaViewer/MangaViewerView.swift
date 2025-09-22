//
//  MangaViewerView.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/21.
//

import SwiftUI

struct MangaViewerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentPage = 0

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
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
                            .gesture (
                                SpatialTapGesture()
                                    .onEnded { value in
                                        if value.location.x < geometry.size.width / 3 {
                                            currentPage = min(currentPage + 1, 9)
                                            proxy.scrollTo(currentPage)
                                        } else if value.location.x > (geometry.size.width / 3 * 2) {
                                            currentPage = max(currentPage - 1, 0)
                                            proxy.scrollTo(currentPage)
                                        }
                                    }
                            )
                        }
                        .frame(width: geometry.size.width)
                    }
                }
                .defaultScrollAnchor(.trailing)
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    MangaViewerView()
}
