//
//  DetailView.swift
//  Space
//
//  Created by sarim khan on 14/08/2022.
//

import SwiftUI

struct DetailView: View {
    
    var detailObject:Bodies
    
    @Namespace var nspace

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            LazyVStack {
                    Image(detailObject.isPlanet ? detailObject.id : gerRandomMoonImage())
                        .resizable()
                        .matchedGeometryEffect(id: "image", in: nspace)
                        .frame(width: 250,height: 250)
                    Text(detailObject.englishName)
                }
            .navigationTitle(detailObject.englishName)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
        detailObject: Bodies(id: "neptune", name: "Neptune", englishName: "Neptune", isPlanet: true, moons: [Moons(moon: "Triton", rel: "https://api.le-systeme-solaire.net/rest/bodies/triton")], semimajorAxis: 4498396441, perihelion: 4498396441, aphelion: 4537039826, eccentricity: 0.0113, inclination: 1.769, mass: Mass(massValue: 1.02413, massExponent: 10), vol: Vol(volValue: 6.254, volExponent: 13), density: 1.638, gravity: 11.15, escape: 23560, meanRadius: 24622, equaRadius: 24764, polarRadius: 24341, flattening: 0.01708, dimension: "", sideralOrbit: 60189, sideralRotation: 16.11, aroundPlanet: nil, discoveredBy: "Urbain Le Verrier, John Couch Adams, Johann Galle", discoveryDate: "23/09/1846", alternativeName: "", axialTilt: 28.3, avgTemp: 55, mainAnomaly: 256.228, argPeriapsis: 256.932, longAscNode: 131.823, bodyType: "Planet", rel: "https://api.le-systeme-solaire.net/rest/bodies/neptune"))
    }
}
