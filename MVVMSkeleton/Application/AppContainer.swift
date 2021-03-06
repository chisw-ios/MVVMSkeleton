//
//  AppContainer.swift
//  MVVMSkeleton
//
//  Created by Roman Savchenko on 28.11.2021.
//

import Foundation

protocol AppContainer: AnyObject {
    var authService: AuthService { get }
    var userService: UserService { get }
    var appSettingsService: AppSettingsService { get }
}

final class AppContainerImpl: AppContainer {
    let authService: AuthService
    let userService: UserService
    let appSettingsService: AppSettingsService

    init() {
        let network = NetworkImpl()
        let appConfiguration = AppConfigurationImpl()

        let authService = AuthServiceImpl(network: network)
        self.authService = authService

        let userService = UserServiceImpl(configuration: appConfiguration)
        self.userService = userService

        let appSettingsService = AppSettingsServiceImpl()
        self.appSettingsService = appSettingsService
    }
}

//import Swinject
//final class AppContainerImpl: AppContainer {
//    private let container: Container
//
//    var authService: AuthService {
//        container.resolve(AuthService.self)!
//    }
//    var userService: UserService {
//        container.resolve(UserService.self)!
//    }
//    var appSettingsService: AppSettingsService {
//        container.resolve(AppSettingsService.self)!
//    }
//
//    init() {
//        self.container = Container()
//        setupContainer()
//    }
//
//    private func setupContainer() {
//        container.register(Network.self) { _ in NetworkImpl() }
//        container.register(AuthService.self) { r in
//            AuthServiceImpl(network: r.resolve(Network.self)!)
//        }
//        container.register(AppSettingsService.self) { _ in AppSettingsServiceImpl()}.inObjectScope(.container)
//    }
//}
