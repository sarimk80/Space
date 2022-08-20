//
//  HomeView.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            TabView {
                
                SpaceNewsView()
                    .tag(0)
                    .tabItem {
                        Label("Space news", systemImage: "newspaper.fill")
                    }
                
                ContentView()
                    .tag(1)
                    .tabItem {
                        Label("Space Bodies", systemImage:"globe.americas")
                    }
                AstroView()
                    .tag(2)
                    .tabItem {
                        Label("Astronats", systemImage: "person.3")
                    }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
