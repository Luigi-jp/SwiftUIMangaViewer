//
//  TopView.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/21.
//

import SwiftUI

struct TopView: View {
    @State private var isPresentViewer = false

    var body: some View {
        Button {
            isPresentViewer = true
        } label: {
            Text("Viewerを起動")
        }
        .fullScreenCover(isPresented: $isPresentViewer) {
            MangaViewerView()
        }
    }
}

#Preview {
    TopView()
}
