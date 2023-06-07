import SwiftUI

struct ContentView: View {
    @State var rotationAngle: Angle = .zero
    @State var saturnPosition: CGPoint = CGPoint(x: -50, y: 100)
    @State var cometPosition: CGPoint = CGPoint(x: 300, y: -400)
    @State var ufoPosition: CGPoint = CGPoint(x: 250, y: 100)
    @State var isTiltedRight = false
    @State var ufoOpacity = 1.0
    var body: some View {
        GeometryReader {proxy in 
            VStack {
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .rotationEffect(self.rotationAngle, anchor: .center)
                Text("🪐")
                    .position(self.saturnPosition)
                Text("☄️")
                    .position(self.cometPosition)
                Text("🛸")
                    .position(self.ufoPosition)
                    .opacity(self.ufoOpacity)
                    .rotationEffect(self.isTiltedRight ? Angle(degrees: 45): .zero, anchor: .center)
            }
            .font(.system(size: 100))
            .onAppear {
                withAnimation(.linear.repeatForever(autoreverses: false).speed(0.1)) {
                    self.rotationAngle = Angle(degrees: self.rotationAngle.degrees + 360)
                    self.saturnPosition = CGPoint(x: proxy.size.width, y: Double.random(in: 0...300))
                }
                withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.04)) { 
                    self.ufoPosition = CGPoint(x: proxy.size.width/2, y: 0)
                    self.isTiltedRight.toggle()
                    
                }
                withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(0.1)) { 
                    self.ufoOpacity = 0.6
                }
                withAnimation(.linear.speed(0.1)) {
                    self.cometPosition = CGPoint(x: 200, y: proxy.size.height + 50)
                }
            }
        }
    }
}

