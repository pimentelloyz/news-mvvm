import Foundation

struct NewsListViewModel {
    let articles: [Article]
    
    init(_ articles: [Article]) {
        self.articles = articles
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfSections(_ sectins: Int) -> Int {
        return self.articles.count
    }
    
    func numberOfRowsInSections(_ index: Int) -> NewsViewModel {
        return NewsViewModel(self.articles[index])
    }
}

struct NewsViewModel {
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension NewsViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
