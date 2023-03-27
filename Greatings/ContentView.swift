

import SwiftUI
struct DataItemModel: Identifiable {
    let id = UUID()
    let text: String
    let color: Color
}

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading) {
                TitleView()
                Spacer()
                MessagesView()
                Spacer()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
            ContentView()
            ContentView().preferredColorScheme(.dark)
        
    }
}

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.red, .yellow, .blue, .yellow], startPoint: .topLeading, endPoint: .bottomLeading).opacity(0.2).edgesIgnoringSafeArea(.all)
    }
}

struct TitleView: View {
    @State var isRotated : Bool = false
    @State var captionIndex : Int = 0
    
    var caption : [String] = [
        "Exploring the iOS programming",
        "Learning how to bake",
        "Programming recipes",
        "A guest for knowledge"
        ]
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -3.0) {
                Text("Greetings").font(.largeTitle)
                    .fontWeight(.bold)
                Text(caption[captionIndex]).font(.headline).fontWeight(.thin)
            }.padding()
                .onTapGesture {
                captionIndex = Int.random(in: 0..<caption.count)
                }
            Spacer()
            Circle()
                .strokeBorder(AngularGradient(gradient: Gradient(
                colors: [
                .blue, .red, .green]),
                center:
                .center, angle: .zero), lineWidth: 10)
                .rotationEffect(isRotated ? .zero : .degrees(360))
                .frame(maxWidth: 70, maxHeight: 70)
                .onTapGesture {
                    withAnimation(Animation.spring()) {
                        isRotated.toggle()
                    }
                    
                }
        }.padding()
    }
}

struct MessagesView: View {
    let messages = [
        DataItemModel(text: "Hello There", color: .green),
        DataItemModel(text: "Welcome The Swift Programming", color: .gray),
        DataItemModel(text: "Are You Ready to,", color: .yellow),
        DataItemModel(text: "start exploring", color: .red),
        DataItemModel(text: "Boom", color: .purple),
    ]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(messages) { message in
                TextView(text: message.text, color: message.color)
            }
        }.padding()
    }
}

struct TextView: View {
    let text: String
    @State var color: Color
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .orange,
        Color(red: 0.5, green: 0, blue: 0.5),
        Color(red: 0, green: 0.5, blue: 0.5),
        Color(red: 139 / 255, green: 207 / 255, blue: 240 / 255),
        Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255),
    ]
    var body: some View {
        Text(text)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .background(color.opacity(0.8))
            .cornerRadius(20)
            .shadow(color: color.opacity(0.4), radius: 5, x: 10, y: 10)
            .onTapGesture {
                let randm = Int.random(in: 0 ..< colors.count)
                color = colors[randm]
            }
    }
}
