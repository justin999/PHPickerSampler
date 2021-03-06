//
//  PhotoPicker.swift
//  PHPickerSampler
//
//  Created by Justin Sato on 2020/10/01.
//  
// ref: https://developer.apple.com/forums/thread/651743?answerId=617747022#617747022

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration
    @Binding var isPresented: Bool
    @Binding var image: UIImage?
    @Binding var showingAlert: Bool
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: PHPickerViewControllerDelegate {
      
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            print(results)
            parent.isPresented = false // Set isPresented to false because picking has finished.
            if
                let provider = results.first?.itemProvider,
                provider.canLoadObject(ofClass: UIImage.self)
            {
                provider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let error = error {
                        print("*** error: \(error)")
                        self?.parent.showingAlert = true
                        return
                    }
                    
                    if let image = image as? UIImage {
                        self?.parent.image = image
                    }
                }
            }
        }
    }
}
