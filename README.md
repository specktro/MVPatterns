#  Architectural Patterns
There are a lot of them and in this sample project touches on top the following ones:

## MVC, Model View Controller
The classic and didactic pattern, the simplest architecture for `UIKit` and center into the controller represented by the `UIViewController` class, all the domain code is in the controller and it manages the workers, navigation, model, everything! Sometimes this pattern is called **Massive View Controllers** (for obvious reasons).

Inside the `MenuRouter` class we are going to find the following method `showMVC(from:)` and the module's initialization:

```Swift
let model: Person = Person(firstName: "No", lastName: "Name")
let newView: MVCViewController = MVCViewController()
newView.person = model
view?.navigationController?.pushViewController(newView, animated: true)
```

## MVP, Model View Presenter
An alternative solution to the **massive** problem, now the domain login is inside the presenter and the `UIViewController` is just "the view", the communication is through protocols and delegation.

Inside the `MenuRouter` class we are going to find the following method `showMVP(from:)` and the module's initialization:

```Swift
let model: Person = Person(firstName: "No", lastName: "Name")
let newView: MVPViewController = MVPViewController()
let presenter: GreetingPresenter = GreetingPresenter(view: newView, person: model)
newView.presenter = presenter
view?.navigationController?.pushViewController(newView, animated: true)
```

## MVVM, Model View View Model
An alternative solution to the **massive** problem, now the domain login is inside the view model and the `UIViewController` is just "the view", the communication is through observers or a reactive framework, such [RxSwift](https://github.com/ReactiveX/RxSwift) or [Combine](https://developer.apple.com/documentation/combine).

Inside the `MenuRouter` class we are going to find the following method `showMVP(from:)` and the module's initialization:

```Swift
let model: Person = Person(firstName: "No", lastName: "Name")
let viewModel: GreetingViewModel = GreetingViewModel(person: model)
let newView: MVVMViewController = MVVMViewController()
newView.viewModel = viewModel
view?.navigationController?.pushViewController(newView, animated: true)
```

## MVVM, Model View View Model with SwiftUI
An alternative solution to the **massive** problem, now the domain login is inside the view model and here we have `View`'s, the communication is through observers from [Combine](https://developer.apple.com/documentation/combine).

Inside the `MenuRouter` class we are going to find the following method `showSwiftUI(from:)` and the module's initialization:

```Swift
let messageViewModel: MessageViewModel = MessageViewModel(person: model)
let messageView: SimpleMessageView = SimpleMessageView(viewModel: messageViewModel)
let newView: UIHostingController = UIHostingController(rootView: messageView)
view?.navigationController?.pushViewController(newView, animated: true)
```

## VIPER, View Interactor Presenter Entity y Router
A modular pattern with protocol communication through the layers, if you want a deep explanation you can read [this](https://specktro.hashnode.dev/introduction-to-viper).

Inside the `MenuRouter` class we are going to find the following method `showVIPER(from:)` and the module's initialization:

```Swift
let messageRouter: MessageRouterProtocol = MessageRouter()
let newView: MessageViewProtocol = messageRouter.createModule()
view?.navigationController?.pushViewController(newView, animated: true)
```

All the logic is inside the `createModule()` method from `MessageRouter` class.
