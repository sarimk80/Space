//
//  PlanetsService.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import Foundation
import Combine

class PlanetsService: PlanetProtocol {
    func getAllPlanets() -> AnyPublisher<SpaceBodies, Error> {
        
        let url = URL(string: "https://api.le-systeme-solaire.net/rest.php/bodies")
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map{value in
                print(value)
                return value.data
            }
            .decode(type: SpaceBodies.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}