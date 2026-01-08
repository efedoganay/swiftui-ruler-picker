//
//  RulerWeightPicker.swift
//  Promille
//
//  Created by Fikret Efe Doğanay on 8.01.2026.
//

import SwiftUI
import SwiftData

struct RulerWeightPicker : View {
    @State private var scrollID: Int? = 75
    var body: some View {
        VStack {
            Text("\(scrollID!)" + " kg")
                .font(.largeTitle)
            ZStack {
                Color.gray.opacity(0.2)
                    .frame(width: 330, height: 130)
                
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 0) {
                        ForEach((35..<170), id: \.self) { measure in
                            VStack(alignment: .center, spacing: 8) {
                                Rectangle()
                                    .frame(width: measure % 5 == 0 ? 4: 2, height: measure % 5 == 0 ? 40: 30)
                                
                                if (measure % 5 == 0) {
                                    Text("\(measure)")
                                        .bold()
                                        .foregroundStyle(scrollID == measure ? .red : .black)
                                        .scaleEffect(scrollID == measure ? 1.2 : 1.0)
                                        .animation(.linear(duration: 1), value: 1.0)
                                        .sensoryFeedback(.increase, trigger: scrollID)
                                }
                            }
                            .frame(width: 45, alignment: .top)
                        }
                        
                    }
                    .scrollTargetLayout()
                }
                .frame(width: 315, height: 130, alignment: .top)
                .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
                .scrollPosition(id: $scrollID, anchor: .center)
                .scrollIndicators(.hidden)
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 4, height: 40)
                    .offset(y:50)
            }
            .frame(width: 330, height: 130)
            .clipped()
        }
        Text("set your weight").font(.largeTitle)
    }
}




#Preview {
    RulerWeightPicker()
        .modelContainer(for: Item.self, inMemory: true)
}
