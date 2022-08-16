//
//  PlanetListView.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import SwiftUI

enum Route : Hashable{
    
    
    case detail(bodies:Bodies)
}

struct PlanetListView: View {
    
    var planetsAndMoon:[Bodies]
    @State private var moonImage:String = ""
        
    var body: some View {
        LazyVStack {
            ForEach(planetsAndMoon) { value in
                
                NavigationLink(value: Route.detail(bodies: value)) {
                    PlanetCard(planetImage: value.id,
                               planetName: value.name,
                               moonsCount: value.moons?.count ?? 0,
                               discoverBy: value.discoveredBy.isEmpty ? "Not Known" : value.discoveredBy,
                               isPlanet: value.isPlanet,
                               aroundPlanet: value.aroundPlanet?.planet ?? "",
                               moonImage: $moonImage
                               
                    )

                }
                .buttonStyle(.plain)
            }
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .detail(let bodies):
                DetailView(detailObject: bodies)
                
            }
        }
        
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView(
            planetsAndMoon: dummyBodies
        )
    }
}
