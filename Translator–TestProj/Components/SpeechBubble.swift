//
//  SpeechBubble.swift
//  Translator–TestProj
//
//  Created by Max Oliinyk on 18.04.2025.
//

import SwiftUI


struct SpeechBubble: View {
    
    let message: String

    var body: some View {
        ZStack {
            BubbleShape()
                .fill(.lavender)
                .shadow(radius: 4)
            
            Text(message)
                .foregroundColor(.primary)
                .font(.system(size: 18, weight: .medium))
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: 300)
        .frame(maxHeight: 150)
    }
}


struct BubbleShape: Shape {
    func path(in rect: CGRect) -> Path {

        let cornerRadius: CGFloat = 24
        let tailWidth: CGFloat = 26
        let tailHeight: CGFloat = 80
        let tailPosition: CGFloat = 86
        

        let tailBaseLeft = CGPoint(
            x: rect.midX + tailPosition,
            y: rect.maxY
        )
        let tailTip = CGPoint(
            x: rect.midX + 50,
            y: rect.maxY + tailHeight
        )
        let tailBaseRight = CGPoint(
            x: rect.midX + tailPosition + tailWidth,
            y: rect.maxY
        )

        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        path.addLine(to: tailBaseLeft)
        path.addLine(to: tailTip)
        path.addLine(to: tailBaseRight)
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(0),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(270),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(180),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true)
        
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    SpeechBubble(message: "please feed me bro")
}
