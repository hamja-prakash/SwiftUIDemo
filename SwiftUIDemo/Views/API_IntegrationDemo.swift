import SwiftUI

struct API_IntegrationDemo: View {
    @ObservedObject var viewModel = APIViewModel()
    
    var body: some View {
        List(viewModel.clients , id: \.id) { user in
            userCell(user: user)
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                        .background(.clear)
                        .foregroundColor(.white)
                        .padding(
                            EdgeInsets(
                                top: 5,
                                leading: 5,
                                bottom: 5,
                                trailing: 5
                            )
                        )
                )
                .listRowSeparator(.hidden)
        }
    }
    
    func userCell(user: Client) -> some View {
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: user.avatar_url ?? "Unknown user")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 60, height: 60)
            }
            
            Text(user.login ?? "")
                .font(.headline)
            
            Spacer()
        }
    }
}

struct API_IntegrationDemo_Previews: PreviewProvider {
    static var previews: some View {
        API_IntegrationDemo()
    }
}
