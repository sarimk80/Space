//
//  AstroViewModel.swift
//  Space
//
//  Created by sarim khan on 20/08/2022.
//

import Foundation
import Combine

enum AstroViewState {
    case initial
    case loading
    case loaded(astros:Astros,crafts:[String:[People]], key:[String])
    case error(errorMessage:String)
}

class AstroViewModel: ObservableObject {
    
    @Published var astroViewState = AstroViewState.initial
    var cancellable=Set<AnyCancellable>()
    
    let planetService:PlanetsService=PlanetsService()
    
    init() {
        getAllAstro()
    }
    
    
    func getAllAstro()  {
        planetService.getAllAstros().sink {[weak self] completion in
            switch completion{
            case .finished:
                break
            case .failure(let error):
                self?.astroViewState = AstroViewState.error(errorMessage: error.localizedDescription)
                print(error)
            }
        } receiveValue: {[weak self] astors in
            
            let groupByDeviceName : [String:[People]] = Dictionary(grouping: astors.people){ $0.craft }
            
            let returnKey : [String] = groupByDeviceName.map{$0.key}
            
            self?.astroViewState = AstroViewState.loaded(astros: astors,crafts: groupByDeviceName,key: returnKey)
            
        }
        .store(in: &cancellable)
        
    }
}
