//
//  HttpClient.swift
//  SimpleMVVM
//
//  Created by Normi on 2022/6/21.
//

import Foundation

class HttpClient {
    typealias SuccessBlockVoid = () -> ()
    typealias SuccessBlockBooks = ([Book]) -> ()
    typealias FailBlock = (ApiError) -> ()
    
    static func fetchData(success: SuccessBlockBooks?,
                          fail: FailBlock?) { /** fake data **/
        let b1 = Book(id: 0,
                      name: "One Hundred Years of Solitude",
                      des: "by Gabriel García Márquez, John Lee, et al.",
                      imageUrlString: "https://m.media-amazon.com/images/I/51bu58-DHXL.jpg")
        let b2 = Book(id: 1,
                      name: "The Moon And Sixpence",
                      des: "by W. Somerset Maugham, Stanley Green, et al.",
                      imageUrlString: "https://m.media-amazon.com/images/I/51iYrJUn2yL.jpg")
        let b3 = Book(id: 2,
                      name: "The Stranger",
                      des: "by Albert Camus, Jonathan Davis, et al.",
                      imageUrlString: "https://m.media-amazon.com/images/I/51JYpBmELnL.jpg")
        success?([b1, b2, b3])
    }
    
    /// delete book
    static func delete(id: Int,
                       success: SuccessBlockVoid?,
                       fail: FailBlock?) { /** fake data **/
        success?()
    }
}

extension HttpClient {
    struct Resp: Codable {
        let success: Bool
        let code: Int
        let msg: String
        let data: [Book]
    }
    
    struct Book: Codable {
        let id: Int
        let name: String
        let des: String
        let imageUrlString: String
    }
    
    struct ApiError {
        let code: Int
        let msg: String
    }
}
