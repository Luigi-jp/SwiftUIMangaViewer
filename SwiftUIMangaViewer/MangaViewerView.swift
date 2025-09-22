//
//  MangaViewerView.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/21.
//

import SwiftUI

struct MangaViewerView: View {
    @Environment(\.dismiss) var dismiss
    let state: MangaViewerViewState

    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .center, spacing: .zero) {
                        ForEach(state.pages.reversed()) { page in
                            ViewerPageView(page: page)
                            .gesture (
                                SpatialTapGesture()
                                    .onEnded { value in
                                        if value.location.x < geometry.size.width / 3 {
                                            state.nextPage()
                                        } else if value.location.x > (geometry.size.width / 3 * 2) {
                                            state.previousPage()
                                        }
                                    }
                            )
                        }
                        .frame(width: geometry.size.width)
                    }
                    .scrollTargetLayout()
                }
                .defaultScrollAnchor(.trailing)
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .scrollPosition(id: Binding(
                    get: {
                        state.currentPage
                    }, set: { id in
                        state.updatePageIndex(id: id)
                    }
                ))
            }
        }
        .overlay {
            if state.isLoading {
                ProgressView()
            }
        }
        .ignoresSafeArea(.all)
        .task {
            await state.load()
        }
    }
}

#Preview {
    MangaViewerView(state: MangaViewerViewState())
}
