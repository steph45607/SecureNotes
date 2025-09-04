//
//  ShortStoryService.swift
//  SecureNotes
//
//  Created by Stephanie Staniswinata on 04/09/25.
//

import Foundation

enum APIError : Error {
    case invalidURL
    case decodingError
    case requestFailed
}

struct ShortStoryService {
    static func fetchShortStoryData(completion: @escaping (Result<ShortStory, APIError>) -> Void){
    //    state a constant for the url
        guard let url = URL(string: "https://shortstories-api.onrender.com/") else {
            completion(.failure(.invalidURL))
            return
        }
        
    //    create a session data task
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            //        error - if the api totally doesnt work, it cant call, not valid
            //        error handling, api not being called
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            do{
                let story = try JSONDecoder().decode(ShortStory.self, from: data)
                completion(.success(story))
            } catch {
                completion(.failure(.requestFailed))
            }
        
        }.resume()
    }

    
    
}
