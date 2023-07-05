//
//  HomeScreenViewModel.swift
//  FoodDelivery
//
//  Created by Мария Газизова on 03.07.2023.
//

import Combine

class HomeScreenViewModel: ObservableObject {
    @Published var coordinator: HomeScreenCoordinator
    @Published var categories: [Category] = []
    @Published var dishes: [Dish] = []
    @Published var cartDishes: [Dish: Int] = [:]
    @Published var tags: [Tag] = []
    @Published var selectedDish: Dish?
    
    private var networkService: NetworkServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceProtocol,
         coordinator: HomeScreenCoordinator) {
        self.networkService = networkService
        self.coordinator = coordinator
        
        getAllCategories()
        getAllDishes()
    }
    
    func getAllCategories() {
        let request = CategoriesAPI.getCategories
        
        networkService.execute(request,
                               model: CategoriesResponseModel.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                self.categories = response.сategories
            case .failure(let error):
                print("ERROR \(error.localizedDescription)")
            }
        }.store(in: &cancellable)
    }
    
    func getAllDishes() {
        let request = DishesAPI.getDishes
        
        networkService.execute(request,
                               model: DishesResponseModel.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                self.dishes = response.dishes
                self.parseTags(from: self.dishes)
            case .failure(let error):
                print("ERROR \(error.localizedDescription)")
            }
        }.store(in: &cancellable)
    }
}

extension HomeScreenViewModel {
    private func parseTags(from dishes: [Dish]) {
        let stringTags = dishes.flatMap {$0.tags}
        
        let counts = stringTags.reduce(into: [:]) { counts, tag in
            counts[tag, default: 0] += 1
        }
        
        counts.forEach {
            self.tags.append(Tag(name: $0.key, count: $0.value))
        }
        
        self.tags.sort {
            $0.count > $1.count
        }
    }
}
