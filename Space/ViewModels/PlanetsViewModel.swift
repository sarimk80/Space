//
//  PlanetsViewModel.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import Foundation
import Combine

enum PlanetsViewState {
    case initial
    case loading
    case loaded(planets:[Bodies],moons:[Bodies],spaceBodies:SpaceBodies)
    case error(errorMessage:String)
}

class PlanetsViewModel:ObservableObject{
    
    @Published var planetViewState:PlanetsViewState=PlanetsViewState.initial
    
    let planetService : PlanetsService=PlanetsService()
    
    var planets:[Bodies]=[]
    var moons:[Bodies]=[]
    var _spaceBodies:SpaceBodies?
    
    var cancellable = Set<AnyCancellable>()
    
    init() {
            getAllPanets()
    }
    
    func getAllPanets()   {
        planetService.getAllPlanets()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.planetViewState=PlanetsViewState.error(errorMessage: "\(error.localizedDescription)")
                }
            } receiveValue: {  spaceBody in
                
                spaceBody.bodies.forEach { bodies in
                    if(bodies.isPlanet){
                        self.planets.append(bodies)
                    }else{
                        self.moons.append(bodies)
                    }
                }
                
                self.planetViewState=PlanetsViewState.loaded(planets: self.planets, moons: self.moons,spaceBodies: spaceBody)
            }
            .store(in: &cancellable)

    }
}
