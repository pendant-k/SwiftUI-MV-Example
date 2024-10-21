import Foundation

// products will be access to main thread
// UI 업데이트는 반드시 메인 스레드에서 실행되어야한다.
@MainActor
class StoreModel: ObservableObject {
    let webservice: WebService
    @Published var products: [Product] = []

    init(webservice: WebService) {
        self.webservice = webservice
    }

    func populateProducts() async throws {
        products = try await webservice.getProducts()
    }
}
