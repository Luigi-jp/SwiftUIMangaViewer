//
//  MangaViewerViewState.swift
//  SwiftUIMangaViewer
//
//  Created by 佐藤瑠偉史 on 2025/09/22.
//

import Observation

enum DisplayMode {
    case viewer
    case menu
}

@Observable class MangaViewerViewState {
    var currentPage: Page.ID? {
        guard !pages.isEmpty else {
            return nil
        }
        return pages[currentIndex].id
    }

    var isMenuMode: Bool {
        displayMode == .menu
    }

    private(set) var pages: [Page] = []
    private(set) var displayMode: DisplayMode = .viewer
    private(set) var isLoading = false
    private(set) var currentIndex = 0 {
        didSet {
            displayMode = .viewer
        }
    }

    func load() async {
        isLoading = true

        defer {
            isLoading = false
        }

        do {
            pages = try await ViewerRepository.fetchPages()
        } catch {
            // error handling
        }
    }

    func nextPage() {
        currentIndex = min(currentIndex + 1, pages.count - 1)
    }

    func previousPage() {
        currentIndex = max(currentIndex - 1, 0)
    }

    func updatePageIndex(id: Page.ID?) {
        currentIndex = pages.firstIndex(where: { $0.id == id }) ?? 0
    }

    func toggleDisplayMode() {
        displayMode = displayMode == .viewer ? .menu : .viewer
    }
}
