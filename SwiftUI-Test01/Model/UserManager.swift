//
//  UserManager.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import Foundation
import SwiftUI



class UserManager: ObservableObject {
    @Published var userName: [Name] = []
    @Published var posts: [Post] = []
    @Published var comics: [Comic]? = []
    
    func fetchPost() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("\(error.localizedDescription)")
            }
            
            guard let safeData = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(APIComicResult.self, from: safeData)
                DispatchQueue.main.async {
                    self.comics = result.data.results

                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
