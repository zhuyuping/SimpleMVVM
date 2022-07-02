//
//  BookDetailView.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/25.
//

import UIKit
import SDWebImage

class BookDetailView: UIView {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        detailLabel.textColor = .placeholderText
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(detailLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
        
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        detailLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    }
    
    func update(info: Info) {
        let url = URL(string: info.imageUrl)!
        let placeholderImage = UIImage(named: "p1")
        imageView.sd_setImage(with: url, placeholderImage: placeholderImage)
        titleLabel.text = info.title
        detailLabel.text = info.desString
    }
}

extension BookDetailView {
    struct Info {
        let imageUrl: String
        let title: String
        let desString: String
    }
}
