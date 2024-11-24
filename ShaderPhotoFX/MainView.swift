//
//  ContentView.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        Image(.seventhlogo)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 200, height: 200)
          .clipShape(RoundedRectangle(cornerRadius: 8))
          .shadow(radius: 10)
        
        List {
          NavigationLink(destination: PixelEffectView().navigationTitle("Pixelate")) {
            HStack {
              Image(systemName: "square.grid.3x3.fill")
                .foregroundColor(.blue)
              Text("Pixelate")
                .font(.headline)
            }
            .padding(.vertical, 8)
          }
          
          NavigationLink(destination: WaveEffectView().navigationTitle("Waves")) {
            HStack {
              Image(systemName: "waveform")
                .foregroundColor(.blue)
              Text("Waves")
                .font(.headline)
            }
            .padding(.vertical, 8)
          }
          
          NavigationLink(destination: GrayScaleEffectView().navigationTitle("Grayscale")) {
            HStack {
              Image(systemName: "camera.filters")
                .foregroundColor(.blue)
              Text("Grayscale")
                .font(.headline)
            }
            .padding(.vertical, 8)
          }
        }
        .listStyle(InsetGroupedListStyle())
      }
      .navigationTitle("Shader Effects")
    }
  }
}

#Preview {
  MainView()
}
