//
//  ContentView.swift
//  RelaxApp
//
//  Created by ITIT on 03/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        LogInView()
    }
}

#Preview {
    ContentView()
}
