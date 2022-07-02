//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/21.
//

import UIKit

class MainVC: UIViewController {
    private let mainView = MainView()
    private let vm = MainVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        commonInit()
        vm.fetchData()
    }
    
    private func setup() {
        title = "Books List"
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func commonInit() {
        mainView.delegate = self
        vm.delegate = self
    }
}

extension MainVC: MainViewDelegate {
    func mainViewDidDetele(at index: Int) {
        vm.delete(index: index)
    }
    
    /** View Event **/
    func mainViewDidSelectCell(info: MainView.Info) {
        let bookDetailInfo = BookDetailVC.Info(info: info)
        let vc = BookDetailVC(info: bookDetailInfo)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainVC: MainVMDelegate { /** VM Event **/
    func MainVMDidRecvError(code: Int, msg: String) {
        /// can show error msg here
    }
    
    func MainVMDidUpdate(infos: [MainVM.Info]) {
        mainView.update(infos: infos)
    }
}

