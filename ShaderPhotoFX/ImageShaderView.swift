//
//  ImagePreview.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct ImageShaderView: View {
  let height: GeometryProxy
  
  var body: some View {
    Image("ff7")
      .resizable()
      .clipShape(RoundedRectangle(cornerRadius: 8))
      .aspectRatio(contentMode: .fit)
      .frame(height: height.size.height * 0.6)
      .padding(.horizontal)
      .shadow(radius: 10)
    
  }
}
