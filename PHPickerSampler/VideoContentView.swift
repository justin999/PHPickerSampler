//
//  VideoContentView.swift
//  PHPickerSampler
//
//  Created by Justin Sato on 2020/10/04.
//  
//

import SwiftUI
import PhotosUI
import AVKit

struct VideoContentView: View {
    @State private var player: AVPlayer?
    @State private var isPresented = false
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 50)
                .fixedSize()
            
            VideoPlayer(player: player)
            
            Spacer(minLength: 20)
                .fixedSize()
            
            Button("set video") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, content: videoPicker)
            
            Spacer(minLength: 50)
                .fixedSize()
        }
    }
    
    private func videoPicker() -> VideoPicker {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.preferredAssetRepresentationMode = .current
        configuration.filter = .videos
        
        return VideoPicker(configuration: configuration, isPresented: $isPresented, player: $player, showingAlert: $showingAlert)
    }
}

struct VideoContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoContentView()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
