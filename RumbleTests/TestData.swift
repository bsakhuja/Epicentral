//
//  TestData.swift
//  RumbleTests
//
//  Created by Brian Sakhuja on 11/7/23.
//

import Foundation

let testFeature_nc73649170: Data = """
    {
          "mag": 0.34,
          "place": "5km NW of The Geysers, CA",
          "time": 1636129710550,
          "updated": 1636129809904,
          "tz": null,
          "url": "https://earthquake.usgs.gov/earthquakes/eventpage/nc73649170",
          "detail": "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson",
          "felt": null,
          "cdi": null,
          "mmi": null,
          "alert": null,
          "status": "automatic",
          "tsunami": 0,
          "sig": 2,
          "net": "nc",
          "code": "73649170",
          "ids": ",nc73649170,",
          "sources": ",nc,",
          "types": ",nearby-cities,origin,phase-data,",
          "nst": 11,
          "dmin": 0.001816,
          "rms": 0.03,
          "gap": 62,
          "magType": "md",
          "type": "earthquake",
          "title": "M 0.3 - 5km NW of The Geysers, CA"
        }
    """.data(using: .utf8)!

let testQuakesData: Data = """
    {"type":"FeatureCollection","metadata":{"generated":1636130213000,"url":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson","title":"USGS All Earthquakes, Past Month","status":200,"api":"1.10.3","count":9104},"features":[{"type":"Feature","properties":{"mag":0.34,"place":"5km NW of The Geysers, CA","time":1636129710550,"updated":1636129809904,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/nc73649170","detail":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":0,"sig":2,"net":"nc","code":"73649170","ids":",nc73649170,","sources":",nc,","types":",nearby-cities,origin,phase-data,","nst":11,"dmin":0.001816,"rms":0.03,"gap":62,"magType":"md","type":"earthquake","title":"M 0.3 - 5km NW of The Geysers, CA"},"geometry":{"type":"Point","coordinates":[-122.7968369,38.8093338,4.65]},"id":"nc73649170"},
    {"type":"Feature","properties":{"mag":2.25999999,"place":"4 km ENE of Pahala, Hawaii","time":1636129061070,"updated":1636129255400,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/hv72783692","detail":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/hv72783692.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":0,"sig":79,"net":"hv","code":"72783692","ids":",hv72783692,","sources":",hv,","types":",origin,phase-data,","nst":42,"dmin":null,"rms":0.119999997,"gap":127,"magType":"md","type":"earthquake","title":"M 2.3 - 4 km ENE of Pahala, Hawaii"},"geometry":{"type":"Point","coordinates":[-155.434173583984,19.2189998626709,34.8699989318848]},"id":"hv72783692"},
    {"type":"Feature","properties":{"mag":0.87,"place":"8km NW of The Geysers, CA","time":1636128941980,"updated":1636130052015,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/nc73649165","detail":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649165.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":0,"sig":12,"net":"nc","code":"73649165","ids":",nc73649165,","sources":",nc,","types":",nearby-cities,origin,phase-data,scitech-link,","nst":22,"dmin":0.008485,"rms":0.02,"gap":49,"magType":"md","type":"earthquake","title":"M 0.9 - 8km NW of The Geysers, CA"},"geometry":{"type":"Point","coordinates":[-122.8133316,38.831501,2.21]},"id":"nc73649165"},
    {"type":"Feature","properties":{"mag":2.48,"place":"37km ENE of Ensenada, B.C., MX","time":1636128601890,"updated":1636128819182,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/ci39849871","detail":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/ci39849871.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":0,"sig":95,"net":"ci","code":"39849871","ids":",ci39849871,","sources":",ci,","types":",nearby-cities,origin,phase-data,scitech-link,","nst":14,"dmin":0.2566,"rms":0.17,"gap":110,"magType":"ml","type":"earthquake","title":"M 2.5 - 37km ENE of Ensenada, B.C., MX"},"geometry":{"type":"Point","coordinates":[-116.2463333,31.9651667,19.17]},"id":"ci39849871"},
    {"type":"Feature","properties":{"mag":0.51,"place":"15km NE of Little Lake, CA","time":1636127455870,"updated":1636129810317,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/ci39849855","detail":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/ci39849855.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"reviewed","tsunami":0,"sig":4,"net":"ci","code":"39849855","ids":",ci39849855,","sources":",ci,","types":",nearby-cities,origin,phase-data,scitech-link,","nst":12,"dmin":0.007215,"rms":0.08,"gap":64,"magType":"ml","type":"earthquake","title":"M 0.5 - 15km NE of Little Lake, CA"},"geometry":{"type":"Point","coordinates":[-117.7733333,36.0221667,1.84]},"id":"ci39849855"},
    {"type":"Feature","properties":{"mag":1.8,"place":"29 km WNW of Rachel, Nevada","time":1636126658738,"updated":1636129630877,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/nn00827478","detail":"https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nn00827478.geojson","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"reviewed","tsunami":0,"sig":50,"net":"nn","code":"00827478","ids":",nn00827478,","sources":",nn,","types":",origin,phase-data,","nst":7,"dmin":0.509,"rms":0.1503,"gap":216.76,"magType":"ml","type":"earthquake","title":"M 1.8 - 29 km WNW of Rachel, Nevada"},"geometry":{"type":"Point","coordinates":[-116.0623,37.7392,0]},"id":"nn00827478"}],"bbox":[-179.9818,-62.918,-7.3,179.9919,86.307,655.67]}
    """.data(using: .utf8)!

let testDetail_hv72783692 = """
    {"type":"Feature","properties":{"mag":2.25999999,"place":"4 km ENE of Pahala, Hawaii","time":1636129061070,"updated":1636129255400,"tz":null,"url":"https://earthquake.usgs.gov/earthquakes/eventpage/hv72783692","felt":null,"cdi":null,"mmi":null,"alert":null,"status":"automatic","tsunami":0,"sig":79,"net":"hv","code":"72783692","ids":",hv72783692,","sources":",hv,","types":",origin,phase-data,","nst":42,"dmin":null,"rms":0.119999997,"gap":127,"magType":"md","type":"earthquake","title":"M 2.3 - 4 km ENE of Pahala, Hawaii","products":{"origin":[{"indexid":"834411","indexTime":1636129256903,"id":"urn:usgs-product:hv:origin:hv72783692:1636129255400","type":"origin","code":"hv72783692","source":"hv","updateTime":1636129255400,"status":"UPDATE","properties":{"azimuthal-gap":"127","depth":"34.8699989318848","depth-type":"from location","error-ellipse-azimuth":"339","error-ellipse-intermediate":"1728.0000696","error-ellipse-major":"2015.9999376","error-ellipse-minor":"864.0000336","error-ellipse-plunge":"71","error-ellipse-rotation":"0","evaluation-status":"preliminary","event-type":"earthquake","eventParametersPublicID":"quakeml:hv.anss.org/Event/HV/72783692#163612925540","eventsource":"hv","eventsourcecode":"72783692","eventtime":"2021-11-05T16:17:41.070Z","horizontal-error":"0.68","latitude":"19.2189998626709","longitude":"-155.434173583984","magnitude":"2.25999999","magnitude-error":"0.839999974","magnitude-num-stations-used":"24","magnitude-source":"HV","magnitude-type":"md","num-phases-used":"52","num-stations-used":"42","origin-source":"HV","pdl-client-version":"Version 2.4.0 2020-05-11","quakeml-magnitude-publicid":"quakeml:hv.anss.org/Netmag/HV/95279212","quakeml-origin-publicid":"quakeml:hv.anss.org/Origin/HV/75783687","quakeml-publicid":"quakeml:hv.anss.org/Event/HV/72783692","review-status":"automatic","standard-error":"0.119999997","title":"4 km ENE of Pahala, Hawaii","version":"0","vertical-error":"0.790000021"},"preferredWeight":157,"contents":{"contents.xml":{"contentType":"application/xml","lastModified":1636129255000,"length":195,"url":"https://earthquake.usgs.gov/realtime/product/origin/hv72783692/hv/1636129255400/contents.xml"},"quakeml.xml":{"contentType":"application/xml","lastModified":1636129255000,"length":2966,"url":"https://earthquake.usgs.gov/realtime/product/origin/hv72783692/hv/1636129255400/quakeml.xml"}}}],"phase-data":[{"indexid":"834412","indexTime":1636129257794,"id":"urn:usgs-product:hv:phase-data:hv72783692:1636129255400","type":"phase-data","code":"hv72783692","source":"hv","updateTime":1636129255400,"status":"UPDATE","properties":{"azimuthal-gap":"127","depth":"34.8699989318848","depth-type":"from location","error-ellipse-azimuth":"339","error-ellipse-intermediate":"1728.0000696","error-ellipse-major":"2015.9999376","error-ellipse-minor":"864.0000336","error-ellipse-plunge":"71","error-ellipse-rotation":"0","evaluation-status":"preliminary","event-type":"earthquake","eventParametersPublicID":"quakeml:hv.anss.org/Event/HV/72783692#163612925540","eventsource":"hv","eventsourcecode":"72783692","eventtime":"2021-11-05T16:17:41.070Z","horizontal-error":"0.68","latitude":"19.2189998626709","longitude":"-155.434173583984","magnitude":"2.25999999","magnitude-error":"0.839999974","magnitude-num-stations-used":"24","magnitude-source":"HV","magnitude-type":"md","num-phases-used":"52","num-stations-used":"42","origin-source":"HV","pdl-client-version":"Version 2.4.0 2020-05-11","quakeml-magnitude-publicid":"quakeml:hv.anss.org/Netmag/HV/95279212","quakeml-origin-publicid":"quakeml:hv.anss.org/Origin/HV/75783687","quakeml-publicid":"quakeml:hv.anss.org/Event/HV/72783692","review-status":"automatic","standard-error":"0.119999997","version":"0","vertical-error":"0.790000021"},"preferredWeight":157,"contents":{"contents.xml":{"contentType":"application/xml","lastModified":1636129255000,"length":195,"url":"https://earthquake.usgs.gov/realtime/product/phase-data/hv72783692/hv/1636129255400/contents.xml"},"quakeml.xml":{"contentType":"application/xml","lastModified":1636129255000,"length":106487,"url":"https://earthquake.usgs.gov/realtime/product/phase-data/hv72783692/hv/1636129255400/quakeml.xml"}}}]}},"geometry":{"type":"Point","coordinates":[-155.434173583984,19.2189998626709,34.8699989318848]},"id":"hv72783692"}
    """.data(using: .utf8)!
