//
//  AstrosModel.swift
//  Space
//
//  Created by sarim khan on 18/08/2022.
//

import Foundation

struct Astros:Codable {
    let number:Int//": 10,
    let people:[People]
}

struct People:Codable,Identifiable {
    var id:UUID=UUID()
    let name:String//": "Oleg Artemyev",
    let craft:String//": "ISS"
}
