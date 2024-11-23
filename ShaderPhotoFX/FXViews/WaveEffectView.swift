//
//  WaveEffectView.swift
//  ShaderPhotoFX
//
//  Created by Marcello Gonzatto Birkan on 23/11/24.
//

import SwiftUI

struct WaveEffectView: View {
    @State private var waveSpeed: CGFloat = 1
    @State private var waveAmplitude: CGFloat = 5
    @State private var waveFrequency: CGFloat = 15
    let initialDate: Date = Date()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 20) {
                    TimelineView(.animation) { context in
                        let elapsedTime = context.date.timeIntervalSince1970 - initialDate.timeIntervalSince1970
                        
                        Image("ff7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height * 0.6)
                            .distortionEffect(
                                Shader(
                                    function: ShaderFunction(library: .default, name: "wave"),
                                    arguments: [
                                        .float(elapsedTime),
                                        .float(waveSpeed),
                                        .float(waveFrequency),
                                        .float(waveAmplitude)
                                    ]
                                ),
                                maxSampleOffset: .zero
                            )
                    }
                    
                    VStack(spacing: 30) {
                        ControlView(title: "Speed", value: $waveSpeed, range: 1...15, icon: "speedometer")
                        ControlView(title: "Frequency", value: $waveFrequency, range: 1...50, icon: "waveform.path.ecg")
                        ControlView(title: "Amplitude", value: $waveAmplitude, range: 1...35, icon: "waveform.path")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(.systemBackground))
                            .shadow(radius: 5)
                    )
                    .padding()
                }
            }
            .background(Color(.systemGray6))
        }
    }
}

struct ControlView: View {
    let title: String
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.headline)
            }
            
            HStack {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.blue)
                Slider(value: $value, in: range)
                    .accentColor(.blue)
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.blue)
            }
            
            Text("Value: \(value, specifier: "%.1f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    WaveEffectView()
}
