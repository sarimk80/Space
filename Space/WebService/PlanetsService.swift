//
//  PlanetsService.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

//https://api.spaceflightnewsapi.net/v3/articles

//http://api.open-notify.org/astros.json

import Foundation
import Combine

class PlanetsService: PlanetProtocol {
    
    func getAllAstros() -> AnyPublisher<Astros, Error> {
        let url = URL(string: "http://api.open-notify.org/astros.json")
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map{value in
                print(value)
                return value.data
            }
            .decode(type: Astros.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getSpaceNews() -> AnyPublisher<[SpaceNews], Error> {
        let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles")
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map{value in
                print(value)
                return value.data
            }
            .decode(type: [SpaceNews].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
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
