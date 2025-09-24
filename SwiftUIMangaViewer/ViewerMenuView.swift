//
//  ViewerMenuView.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/22.
//

import SwiftUI

struct ViewerMenuHeaderView: View {
    var body: some View {
        HStack(spacing: 8) {
            Button {
                // close action
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.white)
            }
            .frame(width: 30, height: 30)
            Text("Title")
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
            Spacer()
                .frame(width: 30, height: 30)
        }
        .frame(height: 50)
        .padding(.horizontal, 20)
        .background(Color.black.opacity(0.9))
    }
}

struct ViewerMenuFooterView: View {
    @Binding var currentPage: Int
    var totalPage: Int

    private var sliderValue: Binding<Double> {
        .init(
            get: { Double(currentPage) },
            set: { currentPage = Int($0) },
        )
    }
    private var sliderRange: ClosedRange<Double> {
        return 0...(max(0, Double(totalPage - 1)))
    }

    var body: some View {
        VStack(spacing: 8) {
            Slider(
                value: sliderValue,
                in: sliderRange,
                step: 1
            )
            .rotationEffect(Angle(degrees: 180))
            HStack {
                Spacer()
                // 各種ボタンが入る想定
            }
        }
        .frame(height: 80)
        .padding(.horizontal, 20)
        .background(Color.black.opacity(0.9))
    }
}

struct ViewerPageIndicatorView: View {
    let currentPage: Int
    let totalPage: Int

    var body: some View {
        VStack {
            Text((currentPage + 1).description)
            Rectangle()
                .frame(width: 50, height: 1)
            Text(totalPage.description)
        }
        .foregroundStyle(Color.white)
        .frame(width: 120, height: 120)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.black.opacity(0.7))
        )
    }
}
