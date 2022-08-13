//
//  PlanetsProtocols.swift
//  Space
//
//  Created by sarim khan on 13/08/2022.
//

import Foundation
import Combine

protocol PlanetProtocol {
    func getAllPlanets() -> AnyPublisher<SpaceBodies,Error>
}
