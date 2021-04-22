import Foundation

class Webservice {
    func getNews(url: URL, completion: @escaping (NewsList?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil)
            } else if let data = data {
                let newsList = try? JSONDecoder().decode(NewsList.self, from: data)
                completion(newsList)
            }
        }.resume()
    }
}
