//
//  ContentView.swift
//  ChangerOfColors
//
//  Created by Лидия Ладанюк on 30.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var RedSliderValue = Double.random(in: 0...255)
    @State private var GreenSliderValue = Double.random(in: 0...255)
    @State private var BlueSliderValue = Double.random(in: 0...255)
    @State private var textValue = ""
    
    var body: some View {
        ZStack {
            Color(red: 80 / 255,
                  green: 130 / 255,
                  blue: 180 / 255)
                .edgesIgnoringSafeArea(.all)
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 350, height: 170)
                .cornerRadius(20.0)
                .foregroundColor(
                    Color(red: RedSliderValue / 255,
                          green: GreenSliderValue / 255,
                          blue: BlueSliderValue / 255))
            HStack {
                Sliders(value: $RedSliderValue, color: .red)
                TextFields(value: $textValue)
            }
            HStack {
                Sliders(value: $GreenSliderValue, color: .red)
                TextFields(value: $textValue)
            }
            HStack {
                Sliders(value: $BlueSliderValue, color: .red)
                TextFields(value: $textValue)
            }
            Spacer()
        }
        .padding()
        }
    }
    
    private func string(from slider: Sliders) -> String {
        String(format: "%.2f", Sliders.init(value: $RedSliderValue, color: .black) as! CVarArg)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}

struct Sliders: View {
    
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
                .frame(width: 40)
            Slider(value: $value, in: 1...100, step: 1)
                .listItemTint(.black)
        }
    }
}

struct TextFields: View {
    
    @Binding var value: String
    
    var body: some View {
        TextField("0", text: $value)
            .frame(width: 40, height: 30)
            .background(RoundedRectangle(cornerRadius: 5).fill(Color.white))
        
    }
}

