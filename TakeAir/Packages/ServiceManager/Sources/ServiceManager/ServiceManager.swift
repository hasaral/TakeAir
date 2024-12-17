
import Foundation
import Combine
import SwiftUI
import Utilities
import CommonModel

public enum SerState {
    case pending, search
}

public enum SearchState {
    case pending, searchResponse([WeatherElement]), getDetail(Weather), error
}

public class NetworkManager: @unchecked Sendable {
    
    public static let shared = NetworkManager()
    public var serState = CurrentValueSubject<SerState, Never>(.pending)
    public var searchState = CurrentValueSubject<SearchState, Never>(.pending)
    @AppStorage("searchKey") var searchKey: String?
    
    public init() {
        
    }
    
    public func statusCheck() async {
        if searchKey == "" || searchKey == nil {
            self.serState.send(.search)
        } else {
            try? await baseCall()
        }
    }
    
    public func baseCall() async throws -> Weather {
        
        guard let url = URL(string: APIConstants.businessId(with: searchKey ?? "", setType: .setInfo)) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        //
        //            }
        
        do  {
            
            let decoder = JSONDecoder()
            let decodeResponse = try decoder.decode(Weather.self, from: data)
            self.serState.send(.search)
            self.searchState.send(.getDetail(decodeResponse))
            return decodeResponse
        } catch {
            self.serState.send(.search)
            throw APError.invalidResponse
        }
    }
}

extension NetworkManager {
    
    public func search(with text: String) async throws -> [WeatherElement] {
        if text == "" {
            self.searchState.send(.pending)
            return []
        }
        guard let url = URL(string: APIConstants.businessId(with: text, setType: .search)) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        //
        //            }
        
        do  {
            let decoder = JSONDecoder()
            let decodeResponse = try decoder.decode([WeatherElement].self, from: data)
            self.searchState.send(.searchResponse(decodeResponse))
            return decodeResponse
        } catch {
            throw APError.invalidResponse
        }
    }
}

public enum APError: Error {
    case invalidURL
    case invalidResponse
}

public struct WeatherElement: Codable, Identifiable, Sendable {
    public let id: Int
    public let name, region, country: String
    public let lat, lon: Double
    public let url: String
    
    public init(id: Int, name: String, region: String, country: String, lat: Double, lon: Double, url: String) {
        self.id = id
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.url = url
    }
}

public struct APIConstants {
    
    public init() {}
    
    public static func businessId(with path: String, setType: DevBundle) -> String {
        switch setType {
        case .setInfo:
            return  DevBundle.setInfo.url + path + "&key=" + (UserManager().retrive() ?? "") ?? ""
            
        case .search:
            return DevBundle.search.url + path + "&key=" + (UserManager().retrive() ?? "") ?? ""
        }
    }
}

public enum DevBundle: String, CaseIterable {
    case setInfo
    case search
    
    var url : String {
        switch self {
        case .setInfo:
            return "https://api.weatherapi.com/v1/current.json?q="
            
        case .search:
            return "https://api.weatherapi.com/v1/search.json?q="
            
        }
    }
}

extension View {
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}

