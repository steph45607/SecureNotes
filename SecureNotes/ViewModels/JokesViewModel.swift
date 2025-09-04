//
//  ShortStoryViewModel.swift
//  SecureNotes
//
//  Created by Stephanie Staniswinata on 04/09/25.
//

import Foundation

class JokesViewModel: ObservableObject {
    @Published var chuck: Joke_Chuck?
    @Published var tech: Joke_Tech?
    @Published var office: Joke_Office?
    @Published var ip: Ip?
    @Published var fruit: Fruit?
    @Published var errorMessage: String?
    
    func loadChuck() {
        JokesService.fetchChuckJokes { [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let chuck):
                    self?.chuck = chuck
                    
                case .failure(let error):
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    func loadTech() {
        JokesService.fetchTechJokes { [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let tech):
                    self?.tech = tech
                    
                case .failure(let error):
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    func loadOffice() {
        JokesService.fetchOfficeJokes { [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let office):
                    self?.office = office
                    
                case .failure(let error):
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    func loadIp() {
        JokesService.fetchIp { [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let ip):
                    self?.ip = ip
                    
                case .failure(let error):
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    func loadFruit() {
        JokesService.fetchFruit { [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let fruit):
                    self?.fruit = fruit
                    
                case .failure(let error):
                    self?.errorMessage = self?.mapError(error)
                }
            }
        }
    }
    
    
    private func mapError(_ error: APIError) -> String {
        switch error{
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed:
            return "Request Failed"
        case .decodingError:
            return "Decoding failed"
        }
    }
}
