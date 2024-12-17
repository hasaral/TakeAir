

import Foundation

// MARK: - Weather
public struct Weather: Codable {
    public let location: Location
    public let current: Current
    
    public init(location: Location, current: Current) {
        self.location = location
        self.current = current
    }
    
}

//// MARK: - Current
public struct Current: Codable {
    public let lastUpdatedEpoch: Int
    public let lastUpdated: String
    public let tempC: Double
    public let tempF: Double
    public let isDay: Int
    public let condition: Condition
    public let windMph: Double
    public let windKph: Double
    public let windDegree: Int
    public let windDir: String
    public let pressureMB: Int
    public let pressureIn: Double
    public let precipMm: Int
    public let precipIn: Int
    public let humidity: Int
    public let cloud: Int
    public let feelslikeC: Double
    public let feelslikeF: Double
    public let windchillC: Double
    public let windchillF: Double
    public let heatindexC: Double
    public let heatindexF: Double
    public let dewpointC: Double
    public let dewpointF: Double
    public let visKM: Int
    public let visMiles: Int
    public let uv: Double?
    //public let gustMph: Double
    //public let gustKph: Int
    
    public init(lastUpdatedEpoch: Int, lastUpdated: String,tempC: Double, tempF: Double, isDay: Int, condition: Condition,windMph: Double, windKph: Double, windDegree: Int, windDir: String, pressureMB: Int, pressureIn: Double, precipMm: Int, precipIn: Int, humidity: Int, cloud: Int,feelslikeC: Double, feelslikeF: Double, windchillC: Double,windchillF: Double,heatindexC: Double,heatindexF: Double,dewpointC: Double,dewpointF: Double,visKM: Int,visMiles: Int, uv: Double) {
        self.lastUpdatedEpoch = lastUpdatedEpoch
        self.lastUpdated = lastUpdated
        self.tempC = tempC
        self.tempF = tempF
        self.isDay = isDay
        self.condition = condition
        self.windMph = windMph
        self.windKph = windKph
        self.windDegree = windDegree
        self.windDir = windDir
        self.pressureMB = pressureMB
        self.pressureIn = pressureIn
        self.precipMm = precipMm
        self.precipIn = precipIn
        self.humidity = humidity
        self.cloud = cloud
        self.feelslikeC = feelslikeC
        self.feelslikeF = feelslikeF
        self.windchillC = windchillC
        self.windchillF = windchillF
        self.heatindexC = heatindexC
        self.heatindexF = heatindexF
        self.dewpointC = dewpointC
        self.dewpointF = dewpointF
        self.visKM = visKM
        self.visMiles = visMiles
        self.uv = uv
    }
    
    public enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv = "uv"
        //case gustMph = "gust_mph"
        //case gustKph = "gust_kph"
    }
}

// MARK: - Condition
public struct Condition: Codable {
    public let text, icon: String
    public let code: Int
    
    public init(text: String, icon: String, code: Int) {
        self.text = text
        self.icon = icon
        self.code = code
    }
    
}

// MARK: - Location
public struct Location: Codable {
    public let name, region, country: String
    public let lat, lon: Double
    public let tzID: String
    public let localtimeEpoch: Int
    public let localtime: String
    
    public init(name: String, region: String, country: String, lat: Double, lon: Double, tzID: String, localtimeEpoch: Int, localtime: String) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.tzID = tzID
        self.localtimeEpoch = localtimeEpoch
        self.localtime = localtime
    }
    
    public enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime = "localtime"
    }
}






