//
//  Model.swift
//  CryptoApp
//
//  Created by Fazil P on 3/1/2023
//


import Foundation


struct MainData: Codable {
    let data: [Data]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct Data: Codable {
    let id: Int?
    let name, symbol, slug: String?
    let numMarketPairs: Int?
    let quote: Quote?
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case quote
    }
}

struct Quote: Codable {
    let usd: Usd?
    
    enum CodingKeys: String, CodingKey {
           case usd = "USD"
       }
}

struct Usd: Codable {
    let price, volume24H, volumeChange24H, percentChange1H: Double?
    let percentChange24H, percentChange7D, percentChange30D: Double?
    
    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
    }
}



