//
//  NetworkManager.swift
//  NewsAppProgramatically
//
//  Created by MD Tanvir Alam on 26/2/21.
//

import Foundation

class NetworkManger{
    let imageCache = NSCache<NSString,NSData>()
    static let shared = NetworkManger()
    private init(){}
    private let baseUrlString = "https://newsapi.org/v2/"
    private let topHeadLines = "top-headlines?country=us&category=business"
    
    func getNews(completionHandler: @escaping ([News]?)->Void){
        let urlString = "\(baseUrlString)\(topHeadLines)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else{
                return
            }
            let newsEnvelop = try? JSONDecoder().decode(NewsModel.self,from:data)
            newsEnvelop == nil ? completionHandler(nil) : completionHandler(newsEnvelop!.articles)
        }.resume()
    }
    
    func getImage(urlString:String, completion: @escaping (Data?)->Void){
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)){
            completion(cachedImage as Data)
        }else{
            URLSession.shared.dataTask(with: url) { (data, resposne, error) in
                guard error == nil, let data = data else{
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string:urlString))
                completion(data)
            }.resume()
        }
    }
}
