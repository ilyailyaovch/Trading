import SwiftUI

struct TopView: View {

    @ObservedObject var vm: ViewModel
    @State var incrementWork = true

    var body: some View {
        NavigationStack {
            ZStack {
                Color.windowBackground
                TopUsersList
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.windowBackground)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Top 10 Traiders")
                        .bold()
                        .font(.system(size: 22))
                        .foregroundStyle(.white)
                }
            }
        }
    }
    var TopUsersList: some View {
        ScrollView(showsIndicators: false) {
            TopUsersListHeader
            LazyVStack(spacing: 0) {
                ForEach (vm.users.top, id: \.id) { user in
                    TopUserView(user: user)
                }
            }
            .cornerRadius(8.75)
        }
        .cornerRadius(8.75)
        .padding(.top)
        .padding(.horizontal, 12)
        .onAppear() {
            if incrementWork {
                vm.updateUsers()
                incrementWork = false
            }
        }
    }
    var TopUsersListHeader: some View {
            HStack(spacing: 0) {
                Text("№")
                    .frame(width: 20, alignment: .leading)
                Spacer()
                Text("Сountry")
                    .frame(width: 50, alignment: .leading)
                Spacer()
                Text("Name")
                    .frame(width: 80, alignment: .leading)
                Spacer()
                Text("Deposit")
                    .frame(width: 80, alignment: .leading)
                Spacer()
                Text("Profit")
                    .frame(width: 80, alignment: .leading)
            }
            .padding(15)
            .font(.system(size: 12))
            .bold()
            .foregroundStyle(.white.opacity(0.5))
            .background(.listBackground)
    }
}

#Preview {
    TopView(vm: ViewModel())
}
