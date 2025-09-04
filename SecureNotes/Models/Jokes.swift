//
//  Joke_Chuck.swift
//  SecureNotes
//
//  Created by Stephanie Staniswinata on 04/09/25.
//

import Foundation

struct Joke_Chuck: Codable{
    let value: String
}

struct Joke_Tech: Codable{
    let message: String
}

struct Joke_Office: Codable{
    let setup: String
    let punchline: String
}

struct Ip: Codable{
    let ip: String
    let country: String
}


struct Fruit: Codable{
    let name: String
    let family: String
    let order: String
    let genus: String
    let nutritions: Nutrition
}

struct Nutrition: Codable{
    let calories: Int
    let fat: Double
    let sugar: Int
    let carb: Int
    let protein: Double
}
