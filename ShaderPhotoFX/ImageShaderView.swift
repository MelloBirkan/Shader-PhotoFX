//
//  ImagePreview.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct ImageShaderView: View {
  @Binding var shader: CGFloat
  
  let height: GeometryProxy
  
  var body: some View {
    Image("ff7")
        .resizable()
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .aspectRatio(contentMode: .fit)
        .frame(height: height.size.height * 0.6)
  
        .distortionEffect(
            Shader(
                function: ShaderFunction(library: .default, name: "pixellate"),
                arguments: [.float(shader)]
            ),
            maxSampleOffset: .zero
        )
        .padding(.horizontal)
        .shadow(radius: 10)
  }
}
