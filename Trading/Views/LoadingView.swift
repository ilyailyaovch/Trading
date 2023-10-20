import SwiftUI

struct LoadingView: View {

    @State var progress: CGFloat = 0.0
    @State var fullScreenCoverPresented = false

    var body: some View {
        ZStack {
            Image(.BG)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ProgressView(value: progress, total: 100)
                    .progressViewStyle(.linear)
                    .accentColor(.accent)
                    .frame(width: 300, height: 20)
                    .scaleEffect(CGSize(width: 1, height: 20))
                    .cornerRadius(12)
                    .overlay(Text("\(Int(progress))%")
                        .foregroundColor(.white))
                    .onAppear {
                        ongoingProgress()
                    }
                    .fullScreenCover(isPresented: $fullScreenCoverPresented) {
                        ContentView(vm: ViewModel())
                    }
                Spacer()
            }
        }
    }

    private func ongoingProgress() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            for value in stride(from: 0, through: 100, by: 1) {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(value) * 0.03) {
                    progress = CGFloat(value)
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                fullScreenCoverPresented = true
            }
        }
    }
}

#Preview {
    LoadingView()
}
