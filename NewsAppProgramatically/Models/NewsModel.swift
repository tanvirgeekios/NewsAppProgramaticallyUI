//
//  NewsModel.swift
//  NewsAppProgramatically
//
//  Created by MD Tanvir Alam on 26/2/21.
//

import Foundation

struct NewsModel:Codable {
    let status:String
    let totalResults:Int
    let articles:[News]
}

struct News:Codable {
    let author:String?
    let title:String?
    let description:String?
    let url:String?
    let urlToImage:String?
}
