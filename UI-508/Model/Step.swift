//
//  Step.swift
//  UI-508
//
//  Created by nyannyan0328 on 2022/03/15.
//

import SwiftUI

struct Step: Identifiable {
    var id = UUID().uuidString
    var value : CGFloat
    var key : String
    var color : Color = Color("Purple")
}

var steps: [Step] = [

    Step(value: 500, key: "1-4 AM"),
    Step(value: 240, key: "5-8 AM",color: Color("Green")),
    Step(value: 350, key: "9-11 AM"),
    Step(value: 430, key: "12-4 PM",color: Color("Green")),
    Step(value: 690, key: "5-8 PM"),
    Step(value: 540, key: "9-12 PM",color: Color("Green")),
]
