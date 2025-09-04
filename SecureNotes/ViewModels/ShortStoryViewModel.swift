//
//  ShortStoryViewModel.swift
//  SecureNotes
//
//  Created by Stephanie Staniswinata on 04/09/25.
//

import Foundation

class ShortStoryViewModel: ObservableObject {
    @Published var story: ShortStory?
    @Published var errorMessage: String?
    
    func loadStory() {
        ShortStoryService.fetchShortStoryData { [weak self] result in
            DispatchQueue.main.async{
                switch result{
                case .success(let story):
                    self?.story = story
                    
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
