//
//  BookDetailVC.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/25.
//

import UIKit

class BookDetailVC: UIViewController {
    typealias Info = BookDetailView.Info
    private let bookDetailView = BookDetailView()
    private var info: Info!
    
    init(info: Info) {
        super.init(nibName: nil, bundle: nil)
        self.info = info
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        commonInit()
    }
    
    private func setup() {
        title = "Books Detail"
        view.addSubview(bookDetailView)
        bookDetailView.translatesAutoresizingMaskIntoConstraints = false
        bookDetailView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bookDetailView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bookDetailView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bookDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func commonInit() {
        bookDetailView.update(info: info)
    }
}
