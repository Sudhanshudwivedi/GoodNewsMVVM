//
//  ArticleViewModel.swift
//  GoodNewsMVVM
//
//  Created by Sudhanshu Dwivedi on 19/11/20.
//

import Foundation


struct ArticleListViewModel{
    let articles : [Article]
    
    init(_ articles : [Article]) {
        self.articles = articles
    }
}

extension ArticleListViewModel{
    
    var numberOfSections : Int{
        return 1
    }
    
    func numberOfRowsInSection(section:Int) -> Int{
        return self.articles.count
    }
    
    func articleAtIndex(index : Int) -> ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article : Article
    init(_ article:Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    var title : String{
        return article.title
    }
    
    var description : String{
        return article.description
    }
}

