//
//  SupportedCountries.swift
//  MVCNewsApp
//
//  Created by ibaikaa on 23/4/23.
//

import Foundation

enum SupportedCountries: String, CaseIterable {
    case ar = "🇦🇷 Argentina"
    case au = "🇦🇺 Australia"
    case at = "🇦🇹 Austria"
    case be = "🇧🇪 Belgium"
    case br = "🇧🇷 Brazil"
    case bg = "🇧🇬 Bulgaria"
    case ca = "🇨🇦 Canada"
    case cn = "🇨🇳 China"
    case co = "🇨🇴 Colombia"
    case cu = "🇨🇺 Cuba"
    case cz = "🇨🇿 Czech Republic"
    case eg = "🇪🇬 Egypt"
    case fr = "🇫🇷 France"
    case de = "🇩🇪 Germany"
    case gr = "🇬🇷 Greece"
    case hk = "🇭🇰 Hong Kong"
    case hu = "🇭🇺 Hungary"
    case `in` = "🇮🇳 India"
    case id = "🇮🇩 Indonesia"
    case ie = "🇮🇪 Ireland"
    case il = "🇮🇱 Israel"
    case it = "🇮🇹 Italy"
    case jp = "🇯🇵 Japan"
    case lv = "🇱🇻 Latvia"
    case lt = "🇱🇹 Lithuania"
    case my = "🇲🇾 Malaysia"
    case mx = "🇲🇽 Mexico"
    case ma = "🇲🇦 Morocco"
    case nl = "🇳🇱 Netherlands"
    case nz = "🇳🇿 New Zealand"
    case ng = "🇳🇬 Nigeria"
    case no = "🇳🇴 Norway"
    case ph = "🇵🇭 Philippines"
    case pl = "🇵🇱 Poland"
    case pt = "🇵🇹 Portugal"
    case ro = "🇷🇴 Romania"
    case ru = "🇷🇺 Russia"
    case sa = "🇸🇦 Saudi Arabia"
    case rs = "🇷🇸 Serbia"
    case sg = "🇸🇬 Singapore"
    case sk = "🇸🇰 Slovakia"
    case sl = "🇸🇮 Slovenia"
    case za = "🇿🇦 South Africa"
    case kr = "🇰🇷 South Korea"
    case se = "🇸🇪 Sweden"
    case ch = "🇨🇭 Switzerland"
    case tw = "🇹🇼 Taiwan"
    case th = "🇹🇭 Thailand"
    case tr = "🇹🇷 Turkey"
    case ae = "🇦🇪 UAE"
    case ua = "🇺🇦 Ukraine"
    case gb = "🇬🇧 United Kingdom"
    case us = "🇺🇸 United States"
    case ve = "🇻🇪 Venezuela"
    
    static func getCountryRawValueForDefault(default country: SupportedCountries) -> String {
        country.rawValue
    }
}

