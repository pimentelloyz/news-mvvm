import Foundation
import UIKit

class NewsTableViewController: UITableViewController {
    
    var newsListViewModel: NewsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=b74cc1855f5946c2b578cbe57c8ce0d9")!
        Webservice().getNews(url: url) { snapshot in
            if let data = snapshot {
                self.newsListViewModel = NewsListViewModel(data.articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension NewsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.newsListViewModel == nil ? 0 : self.newsListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsListViewModel == nil ? 0 : newsListViewModel.numberOfSections(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsUITableViewCell", for: indexPath) as? NewsUITableViewCell else {
            fatalError("Não foi possível inicializar NewsUITableViewCell")
        }
        
        let article = self.newsListViewModel.articles[indexPath.row]
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        
        return cell
    }
}
