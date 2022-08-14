//
//  Helper.swift
//  Space
//
//  Created by sarim khan on 14/08/2022.
//

import Foundation

func gerRandomMoonImage() -> String {
    let random = Int.random(in: 1...15)
    let image = "moon_\(random)"
    return image
}
