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
            
            ZStack {
                VideoPlayer(player: player)
                
                Rectangle()
                    .onTapGesture {
                        isPresented.toggle()
                    }
                    .foregroundColor(.black)
                    .opacity(player != nil ? 0 : 1.0)
            }
            
            Spacer(minLength: 20)
                .fixedSize()
            
            Button("tap to show PHPicker") {
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
