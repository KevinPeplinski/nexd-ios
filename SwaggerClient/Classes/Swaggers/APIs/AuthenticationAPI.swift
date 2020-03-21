//
// AuthenticationAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire
import RxSwift


open class AuthenticationAPI {
    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authControllerLogin(body: LoginPayload, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        authControllerLoginWithRequestBuilder(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     - parameter body: (body)  
     - returns: Observable<Void>
     */
    open class func authControllerLogin(body: LoginPayload) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            authControllerLogin(body: body) { data, error in
                if let error = error {
                    observer.on(.error(error))
                } else {
                    observer.on(.next(data!))
                }
                observer.on(.completed)
            }
            return Disposables.create()
        }
    }

    /**
     - POST /api/auth/login
     - 

     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func authControllerLoginWithRequestBuilder(body: LoginPayload) -> RequestBuilder<Void> {
        let path = "/api/auth/login"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

    /**

     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authControllerRegister(body: RegisterPayload, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        authControllerRegisterWithRequestBuilder(body: body).execute { (response, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     - parameter body: (body)  
     - returns: Observable<Void>
     */
    open class func authControllerRegister(body: RegisterPayload) -> Observable<Void> {
        return Observable.create { observer -> Disposable in
            authControllerRegister(body: body) { data, error in
                if let error = error {
                    observer.on(.error(error))
                } else {
                    observer.on(.next(data!))
                }
                observer.on(.completed)
            }
            return Disposables.create()
        }
    }

    /**
     - POST /api/auth/register
     - 

     - parameter body: (body)  

     - returns: RequestBuilder<Void> 
     */
    open class func authControllerRegisterWithRequestBuilder(body: RegisterPayload) -> RequestBuilder<Void> {
        let path = "/api/auth/register"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getNonDecodableBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true)
    }

}
