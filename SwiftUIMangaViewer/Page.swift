//
//  Page.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/22.
//

import Foundation

struct Page: Identifiable, Hashable, Sendable {
    let id: UUID
    let imageUrl: String

    init(id: UUID = UUID(), imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
    }
}
