//
//  Shaders.metal
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;


[[ stitchable ]] float2 pixellate(float2 position, float size) {
    float2 pixellatedPosition = round(position / size) * size;
    return pixellatedPosition;
}

[[ stitchable ]] float2 wave(float2 position, float time, float speed, float frequency, float amplitude) {
    float positionY = position.y + sin((time * speed) + (position.x / frequency)) * amplitude;
    return float2(position.x, positionY);
}

[[ stitchable ]] half4 grayscale(float2 position, SwiftUI::Layer layer) {
    half4 originalColor = layer.sample(position);
    float grayscaleValue = (originalColor.r + originalColor.g + originalColor.b) / 3.0;
    return half4(grayscaleValue, grayscaleValue, grayscaleValue, originalColor.a);
}

[[ stitchable ]] half4 sepia(float2 position, SwiftUI::Layer layer) {
    half4 color = layer.sample(position);
    
    float3 sepiaR = float3(0.393, 0.769, 0.189);
    float3 sepiaG = float3(0.349, 0.686, 0.168);
    float3 sepiaB = float3(0.272, 0.534, 0.131);
    
    half3 sepia = half3(
        dot(float3(color.r, color.g, color.b), sepiaR),
        dot(float3(color.r, color.g, color.b), sepiaG),
        dot(float3(color.r, color.g, color.b), sepiaB)
    );
    
    return half4(sepia, color.a);
}
