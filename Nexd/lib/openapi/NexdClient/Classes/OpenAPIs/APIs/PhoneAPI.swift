//
// PhoneAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import RxSwift



open class PhoneAPI {
    /**
     Creates a new help request for a call and creates a user for the phoneNumber
     
     - parameter sid: (path) call sid 
     - parameter helpRequestCreateDto: (body)  
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: Observable<Call>
     */
    open class func phoneControllerConverted(sid: String, helpRequestCreateDto: HelpRequestCreateDto, apiResponseQueue: DispatchQueue = NexdClientAPI.apiResponseQueue) -> Observable<Call> {
        return Observable.create { observer -> Disposable in
            phoneControllerConvertedWithRequestBuilder(sid: sid, helpRequestCreateDto: helpRequestCreateDto).execute(apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    observer.onNext(response.body!)
                case let .failure(error):
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    /**
     Creates a new help request for a call and creates a user for the phoneNumber
     - POST /phone/calls/{sid}/help-request
     - BASIC:
       - type: http
       - name: bearer
     - parameter sid: (path) call sid 
     - parameter helpRequestCreateDto: (body)  
     - returns: RequestBuilder<Call> 
     */
    open class func phoneControllerConvertedWithRequestBuilder(sid: String, helpRequestCreateDto: HelpRequestCreateDto) -> RequestBuilder<Call> {
        var path = "/phone/calls/{sid}/help-request"
        let sidPreEscape = "\(APIHelper.mapValueToPathItem(sid))"
        let sidPostEscape = sidPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{sid}", with: sidPostEscape, options: .literal, range: nil)
        let URLString = NexdClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: helpRequestCreateDto)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Call>.Type = NexdClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**
     Returns all calls with the given parameters
     
     - parameter userId: (query) If included, filter by userId, \&quot;me\&quot; for the requesting user, otherwise all users are replied.  (optional)
     - parameter limit: (query)  (optional)
     - parameter converted: (query) true if you only want to query calls which are already converted to a        &#39;help request, false otherwise. Returns all calls if undefined. (optional)
     - parameter country: (query)  (optional)
     - parameter zip: (query)  (optional)
     - parameter city: (query)  (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: Observable<[Call]>
     */
    open class func phoneControllerGetCalls(userId: String? = nil, limit: Double? = nil, converted: Bool? = nil, country: String? = nil, zip: String? = nil, city: String? = nil, apiResponseQueue: DispatchQueue = NexdClientAPI.apiResponseQueue) -> Observable<[Call]> {
        return Observable.create { observer -> Disposable in
            phoneControllerGetCallsWithRequestBuilder(userId: userId, limit: limit, converted: converted, country: country, zip: zip, city: city).execute(apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    observer.onNext(response.body!)
                case let .failure(error):
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    /**
     Returns all calls with the given parameters
     - GET /phone/calls
     - BASIC:
       - type: http
       - name: bearer
     - parameter userId: (query) If included, filter by userId, \&quot;me\&quot; for the requesting user, otherwise all users are replied.  (optional)
     - parameter limit: (query)  (optional)
     - parameter converted: (query) true if you only want to query calls which are already converted to a        &#39;help request, false otherwise. Returns all calls if undefined. (optional)
     - parameter country: (query)  (optional)
     - parameter zip: (query)  (optional)
     - parameter city: (query)  (optional)
     - returns: RequestBuilder<[Call]> 
     */
    open class func phoneControllerGetCallsWithRequestBuilder(userId: String? = nil, limit: Double? = nil, converted: Bool? = nil, country: String? = nil, zip: String? = nil, city: String? = nil) -> RequestBuilder<[Call]> {
        let path = "/phone/calls"
        let URLString = NexdClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "userId": userId?.encodeToJSON(), 
            "limit": limit?.encodeToJSON(), 
            "converted": converted?.encodeToJSON(), 
            "country": country?.encodeToJSON(), 
            "zip": zip?.encodeToJSON(), 
            "city": city?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<[Call]>.Type = NexdClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Returns available numbers
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - returns: Observable<[PhoneNumberDto]>
     */
    open class func phoneControllerGetNumbers(apiResponseQueue: DispatchQueue = NexdClientAPI.apiResponseQueue) -> Observable<[PhoneNumberDto]> {
        return Observable.create { observer -> Disposable in
            phoneControllerGetNumbersWithRequestBuilder().execute(apiResponseQueue) { result -> Void in
                switch result {
                case let .success(response):
                    observer.onNext(response.body!)
                case let .failure(error):
                    observer.onError(error)
                }
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }

    /**
     Returns available numbers
     - GET /phone/numbers
     - returns: RequestBuilder<[PhoneNumberDto]> 
     */
    open class func phoneControllerGetNumbersWithRequestBuilder() -> RequestBuilder<[PhoneNumberDto]> {
        let path = "/phone/numbers"
        let URLString = NexdClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[PhoneNumberDto]>.Type = NexdClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
