# Live-Demo

<div class="flex flex-col items-center justify-center mt-12">

<img src="/images/qr/qrGithub.png" class="w-64 h-64"  alt=""/>

<a href="https://github.com/Bachelor-MMB7/builder-pattern-demo" target="_blank" class="mt-4 text-gray-400 hover:text-blue-400">github.com/Bachelor-MMB7/builder-pattern-demo</a>

</div>

---

# Demo-UML

```mermaid
classDiagram
    direction LR

    class BurgerBuilder {
        <<interface>>
        +setCheese() BurgerBuilder
        +setPickles() BurgerBuilder
        +setTomato() BurgerBuilder
        +setLettuce() BurgerBuilder
        +setSauce(String sauce) BurgerBuilder
        +build() Burger
        +reset() BurgerBuilder
    }

    class ClassicBurgerBuilder {
        -String _bun = "Brioche"
        -String _patty = "Rind"
        -bool _cheese
        -bool _pickles
        -bool _tomato
        -bool _lettuce
        -String _sauce
        +setCheese() ClassicBurgerBuilder
        +setPickles() ClassicBurgerBuilder
        +setTomato() ClassicBurgerBuilder
        +setLettuce() ClassicBurgerBuilder
        +setSauce(String sauce) ClassicBurgerBuilder
        +build() Burger
        +reset() ClassicBurgerBuilder
    }

    class VeggieBurgerBuilder {
        -String _bun = "Vollkorn"
        -String _patty = "Gemüse"
        -bool _cheese
        -bool _pickles
        -bool _tomato
        -bool _lettuce
        -String _sauce
        +setCheese() VeggieBurgerBuilder
        +setPickles() VeggieBurgerBuilder
        +setTomato() VeggieBurgerBuilder
        +setLettuce() VeggieBurgerBuilder
        +setSauce(String sauce) VeggieBurgerBuilder
        +build() Burger
        +reset() VeggieBurgerBuilder
    }

    class Burger {
        <<Product>>
        +String bun
        +String patty
        +bool cheese
        +bool pickles
        +bool tomato
        +bool lettuce
        +String sauce
        +getDescription() String
    }

    class BurgerDirector {
        <<Director>>
        +makeFullyLoaded(BurgerBuilder) Burger
        +makeMinimal(BurgerBuilder) Burger
        +makeClassicCombo(BurgerBuilder) Burger
        +makeFreshBurger(BurgerBuilder) Burger
    }

    BurgerBuilder <|.. ClassicBurgerBuilder : implements
    BurgerBuilder <|.. VeggieBurgerBuilder : implements
    ClassicBurgerBuilder ..> Burger : creates
    VeggieBurgerBuilder ..> Burger : creates
    BurgerDirector --> BurgerBuilder : uses
```
