//
//  ContentView.swift
//  SecureNotes
//
//  Created by Stephanie Staniswinata on 03/09/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var name: String = "Blick Stamts"
    @State private var weatherManager = WeatherManager()
    @State private var locationManager = LocationManager()
    
    @StateObject private var shortStory = ShortStoryViewModel()
    @StateObject private var jokeVM = JokesViewModel()
    
    var body: some View {
        VStack{
            Text("The Book Review")
                .font(.largeTitle)
                .fontDesign(.serif)
                .padding()
            Divider()
            HStack{
                Spacer()
                Text(
                    "\(Date.now.formatted(date: .abbreviated, time: .omitted))"
                )
                .fontDesign(.serif)
                Spacer()
                //                Text("\(weatherManager.temperature)")
                if let ip = jokeVM.ip{
                    Text(ip.ip)
                        .fontDesign(.serif)
                }
                //                else{
                //                    ProgressView("Loading...")
                //                }
                Spacer()
                Text("Review count")
                    .fontDesign(.serif)
                Spacer()
            }
            Divider()
            Text(name)
                .font(.title)
                .fontDesign(.serif)
                .padding()
            Divider()
            HStack{
                if let story = shortStory.story{
                    VStack{
                        Text(story.title)
                            .font(.headline)
                        Text(story.author)
                            .font(.caption)
                        ScrollView{
                            Text(story.story)
                                .font(.body)
                                .padding()
                        }
                        Text(story.moral)
                            .font(.callout)
                            .italic()
                            .padding()
                    }
                    .fontDesign(.serif)
                }
                else{
                    ProgressView("Loading...")
                }
                Divider()
                VStack{
                    Text("Giggle Corner")
                        .font(.headline)
                    if let chuck = jokeVM.chuck
                        , let tech = jokeVM.tech
                        , let office = jokeVM.office
                    {
                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text(chuck.value)
                                HStack{
                                    Spacer()
                                    Text("-Chuck")
                                        .italic()
                                }
                            }
                                
                            VStack(alignment: .leading){
                                Text(tech.message)
                                HStack{
                                    Spacer()
                                    Text("-Tech")
                                        .italic()
                                }
                            }
                                                            
                            VStack(alignment: .leading){
                                Text(office.setup)
                                Text(office.punchline)
                                HStack{
                                    Spacer()
                                    Text("-Office")
                                        .italic()
                                }
                            }
                        }
                        .padding()
                        
                    }
                    else{
                        ProgressView("Loading...")
                    }
                    Divider()
                    Text("Fruit Nutrition")
                    if let fruit = jokeVM.fruit{
                        VStack{
                            Text(fruit.name)
                                .font(.headline)
//                            HStack{
//                                Text("Family")
//                                    .font(.caption)
//                                Text(String(fruit.nutritions.calories))
//                            }
//                            Text(fruit.order)
//                                .font(.callout)
//                                .italic()
                        }
                        .fontDesign(.serif)
                    }
                    else{
                        ProgressView("Loading...")
                    }
                    
                }
                .fontDesign(.serif)
            }
            Spacer()
        }
        .onAppear(){
            shortStory.loadStory()
            jokeVM.loadChuck()
            jokeVM.loadTech()
            jokeVM.loadOffice()
            jokeVM.loadIp()
            jokeVM.loadFruit()
            
            locationManager.checkLocationAuthorization()
            let coordinate = locationManager.lastKnownLocation
            Task{
                await weatherManager
                    .getWeather(
                        lat: coordinate?.latitude ?? -6.21462,
                        long: coordinate?.longitude ?? 106.84513
                    )
            }
        }

    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
