//
//  RecipeController.swift
//  Foodie
//
//  Created by Julian A. Fordyce on 5/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

class RecipeController {
    
    private let recipeBaseURL = URL(string: "https://api.edamam.com/search")!
    private let appID = "0ea3b4e2"
    private let appKey = "1c4cdea7b8eb5f04662bf5b361eaa708"
    
    var recipe: Recipe?
    var recipes: [Recipe] = []
    
    func fetchRecipes(completion: @escaping(Error?, [Recipe]?) -> Void) {
        
        var components = URLComponents(url: recipeBaseURL, resolvingAgainstBaseURL: true)
        
        let foodQueryItem = URLQueryItem(name: "q", value: "chicken")
        let clientIDQueryItem = URLQueryItem(name: "app_id", value: appID)
        let appKeyItem = URLQueryItem(name: "app_key", value: appKey)
        
        components?.queryItems = [foodQueryItem, clientIDQueryItem, appKeyItem]
        
        
        guard let requestURL = components?.url else {
            NSLog("Not able to construct URL")
            completion(NSError(), nil)
            return
        }
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching search results: \(error)")
                completion(error, nil)
                return
            }
            
            guard let data = data else {
                NSLog("Request didn't return valid data.")
                completion(NSError(), nil)
                return
            }
            
            let newJSONDecoder = JSONDecoder()
            newJSONDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let results = try newJSONDecoder.decode([Recipe].self, from: data)
                self.recipes = results
                print(results)
                completion(nil, results)
                return
            } catch {
                NSLog("Error decoding JSON: \(error)")
                completion(error, nil)
                return
            }
        }.resume()
    }

    
    
    
    
    
}
