//
//  CoreSettingsView.swift
//  Pomelo
//
//  Created by Stossy11 on 14/7/2024.
//

import SwiftUI
import Foundation
import Sudachi

struct CoreSettingsView: View {
    @State private var text: String = ""
    @State private var isLoading: Bool = true
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                TextEditor(text: $text)
                    .padding()
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let configfolder = documentDirectory.appendingPathComponent("config", conformingTo: .folder)
                    let fileURL = configfolder.appendingPathComponent("config.ini")
                
                    presentationMode.wrappedValue.dismiss()
                    
                    do {
                        try FileManager.default.removeItem(at: fileURL)
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                    
                    Sudachi.shared.settingsSaved()
                    
                } label: {
                    Text("Reset File")
                }
            }
        }
        .onAppear {
            loadFile()
        }
        .onDisappear() {
            saveFile()
        }
    }
    
    private func loadFile() {
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let configfolder = documentDirectory.appendingPathComponent("config", conformingTo: .folder)
        let fileURL = configfolder.appendingPathComponent("config.ini")
        
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            } catch {
                print("Error reading file: \(error)")
            }
        } else {
            text = "" // Initialize with empty text if file doesn't exist
        }
        isLoading = false
    }
    
    private func saveFile() {
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let configfolder = documentDirectory.appendingPathComponent("config", conformingTo: .folder)
        let fileURL = configfolder.appendingPathComponent("config.ini")
        
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
            Sudachi.shared.settingsSaved()
            print("File saved successfully!")
        } catch {
            print("Error saving file: \(error)")
        }
    }
}
