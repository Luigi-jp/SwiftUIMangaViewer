//
//  ViewerRepository.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/22.
//

import Foundation

enum ViewerRepository {

    private static let pages: [Page] = {
        [
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=0"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=1"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=2"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=3"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=4"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=5"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=6"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=7"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=8"),
            Page(imageUrl: "https://placehold.jp/800x1200.png?text=9"),
        ]
    }()

    static func fetchPages() async throws -> [Page] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return pages
    }
}
