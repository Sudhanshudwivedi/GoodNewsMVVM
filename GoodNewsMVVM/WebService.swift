//
//  WebService.swift
//  GoodNewsMVVM
//
//  Created by Sudhanshu Dwivedi on 19/11/20.
//

import Foundation


class WebService{
    func getArticleData(url : URL, completion : @escaping ([Article]?) ->()){
        URLSession.shared.dataTask(with: url) { (data, respnse, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            if let data = data{
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList{
                    completion(articleList.articles)
                }
            }
        }.resume()
    }
}
