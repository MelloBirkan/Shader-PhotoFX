//
//  GrayScaleEffectView.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct FilterEffectsView: View {
  @State private var isGrayScaleEnabled: Bool = false
  @State private var isSepiaEnabled: Bool = false
  @State private var isInvertEnabled: Bool = false
  
  let fxs = ["Grayscale", "Sepia", "Invert"]
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        ImageShaderView(height: geometry)
          .layerEffect(
            Shader(
              function: ShaderFunction(library: .default, name: "grayscale"),
              arguments: []
            ),
            maxSampleOffset: .zero,
            isEnabled: isGrayScaleEnabled
          )
          .layerEffect(
            Shader(
              function: ShaderFunction(library: .default, name: "sepia"),
              arguments: []
            ),
            maxSampleOffset: .zero,
            isEnabled: isSepiaEnabled
          )
          .layerEffect(
            Shader(
              function: ShaderFunction(library: .default, name: "invert"),
              arguments: []
            ),
            maxSampleOffset: .zero,
            isEnabled: isInvertEnabled
          )
        
        
        VStack(alignment: .leading, spacing: 20) {
          ToggleFXButton(isFXEnabled: $isGrayScaleEnabled, text: "Grayscale")
          ToggleFXButton(isFXEnabled: $isSepiaEnabled, text: "Sepia")
          ToggleFXButton(isFXEnabled: $isInvertEnabled, text: "Invert")
          
          
          
          if isGrayScaleEnabled || isSepiaEnabled  || isInvertEnabled {
            Text("Effect is active")
              .font(.subheadline)
              .foregroundColor(.green)
          }
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 15)
            .fill(Color(.systemBackground))
            .shadow(radius: 5)
        )
        .padding()
        
        Spacer()
      }
      .background(Color(.systemGray6))
    }
  }
}

#Preview {
  FilterEffectsView()
}

struct ToggleFXButton: View {
  @Binding var isFXEnabled: Bool
  let text: String
  
  var body: some View {
    Toggle(isOn: $isFXEnabled) {
      HStack {
        Image(systemName: "camera.filters")
          .foregroundColor(.blue)
        Text("Enable \(text) FX")
          .font(.headline)
      }
    }
    .toggleStyle(SwitchToggleStyle(tint: .blue))
  }
}
