import SwiftUI

struct ContentView: View {

    @ObservedObject var vm: ViewModel
    @State private var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            TradeView(vm: vm)
                .tabItem {
                    Image("trade")
                    Text("Trade")
                }.tag(0)
            TopView(vm: vm)
                .tabItem {
                    Image("user")
                    Text("Top")
                }.tag(1)
        }
        .onAppear() {
            // Apperance setup
            UITabBar.appearance().backgroundColor = .tabBarBackground
            UITabBar.appearance().barTintColor = .tabBarBackground
            // Notification setup
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if error != nil {
                    //
                } else if granted {
                    //
                } else {
                    //
                }
            }
        }
    }
}

#Preview {
    ContentView(vm: ViewModel())
}
