//
//  ViewController.swift
//  GoodNewsMVVM
//
//  Created by Sudhanshu Dwivedi on 19/11/20.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet var tableView : UITableView!
    private var articlesListVM : ArticleListViewModel!{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    
    func setupUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        self.tableView.register(UINib(nibName: "Main", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        
    }

    func getData(){

        let url = Constants().url
        WebService().getArticleData(url: url) { (articles) in
            if let articles = articles {
                self.articlesListVM = ArticleListViewModel(articles)
            }
        }
    }
}


extension ArticleViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCell Not found")
        }
        
        let articleVM = self.articlesListVM.articleAtIndex(index: indexPath.row)
        cell.descriptionLabel.text = articleVM.title
        cell.titleLabel.text = articleVM.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articlesListVM == nil  ? 0 : articlesListVM.articles.count
    }
}
