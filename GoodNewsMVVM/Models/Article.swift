//
//  Article.swift
//  GoodNewsMVVM
//
//  Created by Sudhanshu Dwivedi on 19/11/20.
//

import Foundation

struct ArticleList:Decodable{
    let articles : [Article]
}

struct Article : Decodable {
    let title : String
    let description : String
}
