//
//  ContentView.swift
//  Shared
//
//  Created by Pavlov, Ilia on 3/29/22.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker(" ", selection: $wakeUp)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
