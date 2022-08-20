//
//  AstroView.swift
//  Space
//
//  Created by sarim khan on 20/08/2022.
//

import SwiftUI

struct AstroView: View {
    
    @StateObject private var astroViewModel=AstroViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                //VStack {
                    
                    switch astroViewModel.astroViewState{
                    case .loading:
                        ProgressView()
                    case .initial:
                        ProgressView()
                    case .error(let error):
                        Text(error)
                    case .loaded(let astro,let craft,let people):
                        List {
                            ForEach(people, id:\.self) { peoples in
                                Section {
                                    ForEach(craft[peoples]!) { elements in
                                        Text(elements.name)
                                            .fontWeight(.semibold)
                                            .font(.subheadline)
                                            
                                    }
                                } header: {
                                    Text(peoples)
                                        
                                }
                                
                            }
                        }
                        .listStyle(.grouped)
                    }
                //}
                
            }
            .navigationTitle("Astors")
        }
    }
}

struct AstroView_Previews: PreviewProvider {
    static var previews: some View {
        AstroView()
    }
}
