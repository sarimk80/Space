//
//  SpaceNews.swift
//  Space
//
//  Created by sarim khan on 17/08/2022.
//

import Foundation


struct SpaceNews:Codable,Hashable,Identifiable {
    let id:Int//": 16175,
    let title:String
    //": "Seeking Regulatory Mercy: The case for extending constellation deployment deadlines",
    let url:String
    //    ": "https://spacenews.com/seeking-regulatory-mercy-the-case-for-extending-constellation-deployment-deadlines/",
    let imageUrl:String//": "https://spacenews.com/wp-content/uploads/2022/08/AdobeStock_428436598.jpg",
    let newsSite:String//": "SpaceNews",
    let summary:String
    //    ": "Will regulators show mercy for constellation hopefuls battling unprecedented manufacturing and launch constraints outside their control?",
    let publishedAt:String//": "2022-08-17T08:01:24.000Z",
    let  updatedAt:String//": "2022-08-17T08:01:24.753Z",
    let  featured:Bool//": false,
    
}
