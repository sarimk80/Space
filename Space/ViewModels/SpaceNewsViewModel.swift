//
//  SpaceNewsViewModel.swift
//  Space
//
//  Created by sarim khan on 17/08/2022.
//

import Foundation
import Combine

enum SpaceNewsState {
    case initial
    case loading
    case loaded( spaceNews:[SpaceNews])
    case error(error:String)
}

class SpaceNewsViewModel:ObservableObject{
    
    @Published var spaceNewsState:SpaceNewsState = SpaceNewsState.initial
    
    let planetService : PlanetsService=PlanetsService()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getSpaceNews()
    }
    
    func getSpaceNews()  {
        
        planetService.getSpaceNews().sink { completion in
            switch completion{
            case .finished:
                break
            case .failure(let error):
                self.spaceNewsState=SpaceNewsState.error(error: error.localizedDescription)
            }
        } receiveValue: {[weak self] value in
            self?.spaceNewsState=SpaceNewsState.loaded(spaceNews: value)
        }
        .store(in: &cancellable)
        
    }
    
}
