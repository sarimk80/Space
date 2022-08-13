//
//  PlanetListView.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import SwiftUI

struct PlanetListView: View {
    
    var planetsAndMoon:[Bodies]
    
    var body: some View {
        ForEach(planetsAndMoon) { value in
            PlanetCard(planetImage: value.id,
                       planetName: value.name,
                       moonsCount: value.moons?.count ?? 0,
                       discoverBy: value.discoveredBy.isEmpty ? "Not Known" : value.discoveredBy,
                       isPlanet: value.isPlanet,
                       aroundPlanet: value.aroundPlanet?.planet ?? ""
            )
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
