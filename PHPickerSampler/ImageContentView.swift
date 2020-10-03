//
//  ImageContentView.swift
//  PHPickerSampler
//
//  Created by Justin Sato on 2020/09/30.
//  
//

import SwiftUI
import PhotosUI

struct ImageContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var image: UIImage?
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.gray)
            
            Button("add Image") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, onDismiss: onDismiss, content: photoPicker)
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(title: Text("Error while showing error"), message: nil, dismissButton: .default(Text("close"), action: {
                showingAlert = false
            }))
        })
    }
    
    func onDismiss() {
        print("onDismiss")
    }
    
    func photoPicker() -> PhotoPicker {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        configuration.preferredAssetRepresentationMode = .current
        return PhotoPicker(configuration: configuration, isPresented: $isPresented, image: $image, showingAlert: $showingAlert)
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageContentView()
        }
    }
}
