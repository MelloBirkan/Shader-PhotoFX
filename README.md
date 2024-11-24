# ShaderPhotoFX 📸

Um aplicativo iOS que demonstra o poder dos Shaders Metal para aplicação de efeitos visuais em imagens em tempo real. Este projeto foi desenvolvido como parte da disciplina de Computação Visual.

![Demo do App](gifs/appDemonstrativo.gif)

## 📝 Sobre o Projeto

ShaderPhotoFX é uma aplicação que utiliza Metal Shading Language (MSL) e SwiftUI para criar efeitos visuais dinâmicos em imagens. O app demonstra conceitos fundamentais de computação gráfica através de implementações práticas de shaders.

## ✨ Funcionalidades

O aplicativo oferece três efeitos principais:

### 1. Efeito Pixelate
Permite pixelizar a imagem com controle dinâmico do tamanho dos pixels.

![Demo do App](gifs/pixelate.gif)

```cpp
[[ stitchable ]] float2 pixellate(float2 position, float size) {
float2 pixellatedPosition = round(position / size) size;
return pixellatedPosition;
}
```

### 2. Efeito Wave
Aplica uma distorção ondular animada com controles para:
- Velocidade da onda
- Frequência
- Amplitude

![Demo do App](gifs/wave.gif)

```cpp
[[ stitchable ]] float2 wave(float2 position, float time, float speed, float frequency, float amplitude) {
float positionY = position.y + sin((time speed) + (position.x / frequency)) amplitude;
return float2(position.x, positionY);
}
```

### 3. Filtros
Inclui três filtros clássicos de processamento de imagem:
- Escala de Cinza
- Sépia
- Inversão de Cores

![Demo do App](gifs/filters.gif)

## 🔧 Tecnologias Utilizadas

### Metal Shading Language (MSL)
MSL é uma linguagem baseada em C++ desenvolvida pela Apple para programação de shaders. No projeto, utilizamos MSL para implementar:

- Distorção de geometria (Wave effect)
- Manipulação de pixels (Pixelate effect)
- Transformações de cor (Filtros)

### SwiftUI
A interface do usuário foi construída inteiramente em SwiftUI, aproveitando recursos modernos como:
- GeometryReader para layouts responsivos
- Bindings para controles em tempo real
- TimelineView para animações
- Integração nativa com Metal através de modificadores como `.layerEffect` e `.distortionEffect`

## 💻 Implementação dos Shaders

### Pixelate Shader
O shader de pixelização funciona arredondando as coordenadas de textura para criar um efeito de "blocos":

```cpp
[[ stitchable ]] float2 pixellate(float2 position, float size) {
float2 pixellatedPosition = round(position / size) size;
return pixellatedPosition;
}
```

### Wave Shader
O shader de onda utiliza funções trigonométricas para criar distorção:

```cpp
[[ stitchable ]] float2 wave(float2 position, float time, float speed, float frequency, float amplitude) {
float positionY = position.y + sin((time speed) + (position.x / frequency)) amplitude;
return float2(position.x, positionY);
}
```

### Filtros
Exemplo do shader de escala de cinza:

```cpp
[[ stitchable ]] half4 grayscale(float2 position, SwiftUI::Layer layer) {
half4 originalColor = layer.sample(position);
float grayscaleValue = (originalColor.r + originalColor.g + originalColor.b) / 3.0;
return half4(grayscaleValue, grayscaleValue, grayscaleValue, originalColor.a);
}
```

## 🎓 Conceitos de Computação Visual Aplicados

1. **Processamento de Imagens**
   - Manipulação de pixels
   - Transformações de cor
   - Filtros de convolução

2. **Computação Gráfica**
   - Transformações geométricas
   - Coordenadas de textura
   - Interpolação

3. **Shaders**
   - Vertex shaders
   - Fragment shaders
   - Programação paralela em GPU


## 📚 Recursos de Aprendizado

Para aprender mais sobre os conceitos utilizados:

- [Metal Shading Language Specification](https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf)
- [Apple Metal Documentation](https://developer.apple.com/documentation/metal/)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)