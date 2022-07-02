//
//  Extensions.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/25.
//

import Foundation

extension BookDetailView.Info {
    init(info: MainView.Info) {
        self.desString = info.desString
        self.imageUrl = info.imageUrlString
        self.title = info.title
    }
}

extension MainView.Info {
    init(book: HttpClient.Book) {
        imageUrlString = book.imageUrlString
        title = book.name
        desString = book.des
    }
}
