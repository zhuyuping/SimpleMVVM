//
//  MainView.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/21.
//

import UIKit
import SDWebImage

protocol MainViewDelegate: NSObjectProtocol {
    func mainViewDidSelectCell(info: MainView.Info)
    func mainViewDidDetele(at index: Int)
}

class MainView: UIView {
    private let tableView = UITableView(frame: .zero)
    private var infos = [Info]()
    weak var delegate: MainViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func commonInit() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func update(infos: [Info]) {
        self.infos = infos
        tableView.reloadData()
    }
}

extension MainView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let info = infos[indexPath.row]
        let url = URL(string: info.imageUrlString)!
        let placeholderImage = UIImage(named: "p1")
        cell.imageView?.sd_setImage(with: url, placeholderImage: placeholderImage)
        cell.textLabel?.text = info.title
        cell.detailTextLabel?.text = info.desString
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let info = infos[indexPath.row]
        delegate?.mainViewDidSelectCell(info: info)
    }
    
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        delegate?.mainViewDidDetele(at: indexPath.row)
    }
}

extension MainView { /** Model **/
    struct Info {
        let imageUrlString: String
        let title: String
        let desString: String
    }
}

