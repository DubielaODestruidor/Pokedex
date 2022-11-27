//
//  ContentView.swift
//  PokeDex
//
//  Created by João Dubiela on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            Text("Hello, world!")
                .padding()
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
