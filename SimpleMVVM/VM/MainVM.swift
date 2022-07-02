//
//  MainVM.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/21.
//

import Foundation

protocol MainVMDelegate: NSObjectProtocol {
    func MainVMDidUpdate(infos: [MainVM.Info])
    func MainVMDidRecvError(code: Int, msg: String)
}

class MainVM {
    typealias Info = MainView.Info
    weak var delegate: MainVMDelegate?
    private var infos = [MainVM.Info]()
    
    func fetchData() {
        HttpClient.fetchData { [weak self](books) in
            let infos = books.map({ Info(imageUrlString: $0.imageUrlString,
                                         title: $0.name,
                                         desString: $0.des) })
            self?.infos = infos
            self?.delegate?.MainVMDidUpdate(infos: infos)
        } fail: { [weak self](error) in
            self?.delegate?.MainVMDidRecvError(code: error.code,
                                               msg: error.msg)
        }
    }
    
    func delete(index: Int) {
        HttpClient.delete(id: index,
                          success: { [weak self] in
            guard let self = self else { return }
            self.infos.remove(at: index)
            self.delegate?.MainVMDidUpdate(infos: self.infos)
        }, fail: { [weak self](error) in
            self?.delegate?.MainVMDidRecvError(code: error.code,
                                               msg: error.msg)
        })
    }
}
