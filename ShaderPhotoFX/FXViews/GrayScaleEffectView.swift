//
//  GrayScaleEffectView.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct GrayScaleEffectView: View {
  @State private var isGrayScaleEnabled: Bool = false

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

        VStack(alignment: .leading, spacing: 20) {
          Toggle(isOn: $isGrayScaleEnabled) {
            HStack {
              Image(systemName: "camera.filters")
                .foregroundColor(.blue)
              Text("Enable Grayscale Effect")
                .font(.headline)
            }
          }
          .toggleStyle(SwitchToggleStyle(tint: .blue))

          if isGrayScaleEnabled {
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
  GrayScaleEffectView()
}
