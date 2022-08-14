//
//  ContentView.swift
//  Space
//
//  Created by sarim khan on 08/08/2022.
//

import SwiftUI

enum Tabs: String, CaseIterable, Identifiable {
    case planets , moons
    var id: Self { self }
}

struct ContentView: View {
    
    var bodiesTesting:[Bodies]=dummyBodies
    @State private var tabs:Tabs = .planets
    @StateObject private var planetViewModel:PlanetsViewModel=PlanetsViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        
                        
                        
                        //Spacer()
                        
                        switch planetViewModel.planetViewState{
                        case .initial:
                            ProgressView()
                        case .error(let error):
                            Text("\(error)")
                        case .loaded(let planets, let moon, let spaceBodies):
                            selectedView(selectedTab: tabs,planets: planets,moon: moon)
                        case .loading:
                            ProgressView()
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Celestial objects")
            .toolbarBackground(Color("BackgroundColor"), in: .navigationBar)
            .toolbar {
                ToolbarItem(placement:.principal) {
                    Picker("", selection: $tabs) {
                        Text("Planets").tag(Tabs.planets)
                        Text("Moons").tag(Tabs.moons)
                    }
                    .padding()
                    .pickerStyle(.segmented)
                }
            }
        }
        
        
    }
    
    func selectedView(selectedTab:Tabs,planets:[Bodies],moon:[Bodies]) -> some View {
        switch selectedTab {
        case .planets:
            return PlanetListView(planetsAndMoon: planets)
            
            
        case .moons:
            return  PlanetListView(planetsAndMoon: moon)
            
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


