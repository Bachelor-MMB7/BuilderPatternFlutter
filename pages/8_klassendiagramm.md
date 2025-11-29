# Klassendiagramm

Builder Pattern einfache Struktur

```mermaid
classDiagram
    direction LR

    class BurgerDirector {
        <<Director>>
        +makeClassicBurger() Burger
        +makeVeggieBurger() Burger
    }

    class BurgerBuilder {
        <<Builder>>
        -_bun: String
        -_patty: String
        -_cheese: bool
        -_pickles: bool
        +BurgerBuilder(bun, patty)
        +setCheese() void
        +setPickles() void
        +build() Burger
    }

    class Burger {
        <<Product>>
        -bun: String
        -patty: String
        -cheese: bool
        -pickles: bool
        +Burger(bun, patty, cheese, pickles)
        +getDescription() String
    }

    BurgerDirector --> BurgerBuilder : verwendet
    BurgerBuilder ..> Burger : erstellt
```

**Legende:**
- **Director** (BurgerDirector): Kapselt vordefinierte Rezepte
- **Builder** (BurgerBuilder): Ermöglicht schrittweisen Aufbau
- **Product** (Burger): Das fertige Objekt
