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
                                .frame(width: geometry.size.width)
                                .frame(maxHeight: .infinity)
                                .background(Color.white)
                                .gesture (
                                    SpatialTapGesture()
                                        .onEnded { value in
                                            if value.location.x < geometry.size.width / 3 {
                                                state.nextPage()
                                            } else if value.location.x > (geometry.size.width / 3 * 2) {
                                                state.previousPage()
                                            } else {
                                                state.toggleDisplayMode()
                                            }
                                        }
                                )
                        }
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
        .overlay(alignment: .top) {
            ViewerMenuHeaderView()
                .offset(y: state.isMenuMode ? 0 : -100)
                .opacity(state.isMenuMode ? 1.0 : 0)
                .animation(.easeOut, value: state.isMenuMode)
        }
        .overlay(alignment: .center) {
            ViewerPageIndicatorView(currentPage: state.currentIndex, totalPage: state.pages.count)
                .opacity(state.isMenuMode ? 1.0 : 0)
                .animation(.easeOut, value: state.isMenuMode)
                .allowsHitTesting(false)
        }
        .overlay(alignment: .bottom) {
            ViewerMenuFooterView(
                currentPage: Binding(
                    get: {
                        state.currentIndex
                    }, set: { value in
                        state.updatePageIndex(index: value)
                    }
                ),
                totalPage: state.pages.count
            )
                .offset(y: state.isMenuMode ? 0 : 100)
                .opacity(state.isMenuMode ? 1.0 : 0)
                .animation(.easeOut, value: state.isMenuMode)
        }
        .onChange(of: state.isMenuMode) { withAnimation{} }
        .task {
            await state.load()
        }
    }
}

#Preview {
    MangaViewerView(state: MangaViewerViewState())
}
