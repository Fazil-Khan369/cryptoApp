//
//  CurrencyDataFetch.swift
//  CryptoApp
//
//  Created by Fazil P on 3/1/2023.
//

import Foundation

class CurrencyDataFetch {
    
    static let shared = CurrencyDataFetch()
    
    func getAPI ( onCompletion :@escaping ([Data]) ->() ){
        let urlString = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=e45e1192-f3ce-4c23-8e4d-ee6834ce0701"
        let url  = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data , response , error) in
            guard let data  = data  else {
                print(" data was nil")
                return
            }
            
            guard let arrayOfmovies = try? JSONDecoder().decode(MainData.self, from: data) else {
                print("couldnt decode Json")
                
                return}
            
            onCompletion(arrayOfmovies.data)
            print(arrayOfmovies)
            
        }
        
        task.resume()
    }
}
