//
//  PlanetsCard.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import SwiftUI

struct PlanetCard: View {
    let planetImage:String
    let planetName:String
    let moonsCount:Int
    let discoverBy:String
    let isPlanet:Bool
    let aroundPlanet:String
    
    @Namespace var nspace
    
    var body: some View {
        HStack {
            
            Image(isPlanet ? planetImage : gerRandomMoonImage())
                .resizable()
                .matchedGeometryEffect(id: "image", in: nspace)
                .frame(width: 100,height: 100)
            VStack(alignment: .leading,spacing: 8) {
                
                Text(planetName)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                
                isPlanet ?
                Text("\(moonsCount) Moon")
                    .font(.subheadline)
                    .fontWeight(.light):
                Text("Revolver around \(aroundPlanet)")
                    .font(.subheadline)
                    .fontWeight(.light)
                
                
                Text("Discover By: \(discoverBy) ")
                    .font(.caption)
                    .fontWeight(.light)
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            
        }
        
        .padding()
        .background(Color("CardColor"))
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.3), radius: 5,x: 5,y: 5)
        .padding()
        .buttonStyle(.plain)
    }
}

struct PlanetsCard_Previews: PreviewProvider {
    static var previews: some View {
        PlanetCard(planetImage: "pluto", planetName: "Earth", moonsCount: 1, discoverBy: "No bosy", isPlanet: false, aroundPlanet: ""
            
        )
    }
}


