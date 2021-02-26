//
//  NewsViewModel.swift
//  NewsAppProgramatically
//
//  Created by MD Tanvir Alam on 26/2/21.
//

import Foundation

class NewsListViewModel {
    var newsList = [NewsViewModel]()
    func setNewsList(){
        NetworkManger.shared.getNews { (newsArray) in
            if let newsArray = newsArray{
                self.newsList = newsArray.map(NewsViewModel.init)
            }
        }
    }
}

class NewsViewModel{
    let news:News
    init(news:News){
        self.news = news
    }
    
    var author:String{
        return news.author ?? "Unknown Author"
    }
    
    var title:String{
        return news.title ?? "Unknown Title"
    }
    
    var description:String{
        return news.description ?? "Unknown Description"
    }
    var url:String{
        return news.url ?? ""
    }
    
    var urlToImage:String{
        return news.urlToImage ?? "https://i.pinimg.com/originals/92/7c/07/927c07dc27f1db0ede925d8a7667c062.jpg"
    }
}
