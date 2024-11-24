//
//  PixelEffectView.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct PixelEffectView: View {
  @State private var pixelSize: CGFloat = 1

  var body: some View {
    GeometryReader { geometry in
      VStack {
        ImageShaderView(height: geometry)
          .distortionEffect(
            Shader(
              function: ShaderFunction(library: .default, name: "pixellate"),
              arguments: [.float(pixelSize)]
            ),
            maxSampleOffset: .zero
          )

        VStack(alignment: .leading, spacing: 20) {
          Text("Pixel Size")
            .font(.headline)

          HStack {
            Image(systemName: "minus.circle.fill")
              .foregroundColor(.blue)
            Slider(value: $pixelSize, in: 1...10)
              .accentColor(.blue)
            Image(systemName: "plus.circle.fill")
              .foregroundColor(.blue)
          }

          Text("Current Value: \(pixelSize, specifier: "%.1f")")
            .font(.subheadline)
            .foregroundColor(.secondary)
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
  PixelEffectView()
}
