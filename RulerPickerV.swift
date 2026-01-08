//
//  RulerPicker.swift
//  Promille
//
//  Created by Fikret Efe Doğanay on 8.01.2026.
//
import SwiftData
import SwiftUI

struct RulerHeightPicker : View {
    @State private var scrollID: Int? = 170
    var body: some View {
        VStack {
            Text("\(scrollID!)" + " cm")
                .font(.largeTitle)
            ZStack {
                Color.gray.opacity(0.2)
                    .frame(width: 130, height: 400)
                
                ScrollView {
                    LazyVStack(spacing: 25) {
                        ForEach((100..<240).reversed(), id: \.self) { measure in
                            HStack(alignment: .center, spacing: 8) {
                                Rectangle()
                                    .frame(width: measure % 5 == 0 ? 40: 30, height: measure % 5 == 0 ? 4: 2)
                                
                                if (measure % 5 == 0) {
                                    Text("\(measure)")
                                        .bold()
                                        .foregroundStyle(scrollID == measure ? .red : .black)
                                        .scaleEffect(scrollID == measure ? 1.2 : 1.0)
                                        .animation(.linear(duration: 1), value: 1.0)
                                        .sensoryFeedback(.increase, trigger: scrollID)
                                }
                            }
                            .frame(height: 0, alignment: .center)
                            .frame(maxWidth: 150, alignment: .leading)
                        }
                        
                    }
                    .frame(maxWidth: 130, alignment: .center)
                    .scrollTargetLayout()
                }
                .frame(width: 130, height: 400)
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .scrollPosition(id: $scrollID, anchor: .center)
                .scrollIndicators(.hidden)
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 40, height: 4)
                    .offset(x: 45)
            }
            .frame(width: 150, height: 400)
            .clipped()
        }
        Text("set your height").font(.largeTitle)
    }
}
