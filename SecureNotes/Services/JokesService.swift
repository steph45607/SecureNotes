//
//  ShortStoryService.swift
//  SecureNotes
//
//  Created by Stephanie Staniswinata on 04/09/25.
//

import Foundation

struct JokesService {
    static func fetchChuckJokes(completion: @escaping (Result<Joke_Chuck, APIError>) -> Void){
    //    state a constant for the url
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
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
                let joke = try JSONDecoder().decode(Joke_Chuck.self, from: data)
                completion(.success(joke))
            } catch {
                completion(.failure(.requestFailed))
            }
        
        }.resume()
    }
    
    static func fetchTechJokes(completion: @escaping (Result<Joke_Tech, APIError>) -> Void){
    //    state a constant for the url
        guard let url = URL(string: "https://techy-api.vercel.app/api/json") else {
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
                let joke = try JSONDecoder().decode(Joke_Tech.self, from: data)
                completion(.success(joke))
            } catch {
                completion(.failure(.requestFailed))
            }
        
        }.resume()
    }
    
    static func fetchOfficeJokes(completion: @escaping (Result<Joke_Office, APIError>) -> Void){
    //    state a constant for the url
        guard let url = URL(string: "https://official-joke-api.appspot.com/random_joke") else {
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
                let joke = try JSONDecoder().decode(Joke_Office.self, from: data)
                completion(.success(joke))
            } catch {
                completion(.failure(.requestFailed))
            }
        
        }.resume()
    }
    
    static func fetchIp(completion: @escaping (Result<Ip, APIError>) -> Void){
    //    state a constant for the url
        guard let url = URL(string: "https://api.myip.com/") else {
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
                let ip = try JSONDecoder().decode(Ip.self, from: data)
                completion(.success(ip))
            } catch {
                completion(.failure(.requestFailed))
            }
        
        }.resume()
    }
    
    static func fetchFruit(completion: @escaping (Result<Fruit, APIError>) -> Void){
//        let number = Int.random(in: 1...101)
    //    state a constant for the url
        guard let url = URL(string: "https://fruityvice.com/api/fruit/9") else {
            completion(.failure(.invalidURL))
            return
        }
        
    //    create a session data task
        URLSession.shared.dataTask(with: url){ data, response, error in
            print(url)
            
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
                let fruit = try JSONDecoder().decode(Fruit.self, from: data)
                completion(.success(fruit))
            } catch {
                completion(.failure(.requestFailed))
            }
        
        }.resume()
    }

    
    
}
