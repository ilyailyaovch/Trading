import SwiftUI

struct TopUserView: View {

    var user: UserModel

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text(String(user.position))
                .font(.body)
                .frame(width: 20, alignment: .leading)
            Spacer()
            Text(user.country)
                .font(.body)
                .frame(width: 40, alignment: .leading)
            Spacer()
            Text(user.name)
                .font(.body)
                .frame(width: 80, alignment: .leading)
            Spacer()
            Text("$\(user.deposit)")
                .font(.body)
                .frame(width: 80, alignment: .leading)
            Spacer()
            Text("$\(user.profit)")
                .font(.body)
                .frame(width: 80, alignment: .leading)
                .foregroundColor(.customGreen)
        }
        .padding(15)
        .foregroundColor(.white)
        .background(user.position % 2 != 0 ? .windowBackground : .listBackground)
    }
}

#Preview {
    VStack {
        TopUserView(user: ViewModel().users.top[0])
        TopUserView(user: ViewModel().users.top[9])
    }.preferredColorScheme(.dark)
}
