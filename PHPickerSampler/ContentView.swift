//
//  ContentView.swift
//  PHPickerSampler
//
//  Created by Justin Sato on 2020/09/30.
//  
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                List {
                    NavigationLink(destination: ImageContentView()) {
                        Text("Images")
                    }
                    NavigationLink(destination: VideoContentView()) {
                        Text("Videos")
                    }
                }
                .navigationTitle("PHPickerSampler")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
