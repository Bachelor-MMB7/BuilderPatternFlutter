// Pizza Builder Pattern Example

// Product Class
class Pizza {
  final String dough;
  final String sauce;
  final List<String> toppings;
  final String size;
  final bool extraCheese;

  Pizza({
    required this.dough,
    required this.sauce,
    required this.toppings,
    required this.size,
    this.extraCheese = false,
  });

  @override
  String toString() {
    return 'Pizza($size, $dough crust, $sauce sauce, ${toppings.join(", ")}'
        '${extraCheese ? ", extra cheese" : ""})';
  }
}

// Builder Class
class PizzaBuilder {
  String? _dough;
  String? _sauce;
  List<String> _toppings = [];
  String? _size;
  bool _extraCheese = false;

  PizzaBuilder setDough(String dough) {
    _dough = dough;
    return this;
  }

  PizzaBuilder setSauce(String sauce) {
    _sauce = sauce;
    return this;
  }

  PizzaBuilder addTopping(String topping) {
    _toppings.add(topping);
    return this;
  }

  PizzaBuilder setSize(String size) {
    _size = size;
    return this;
  }

  PizzaBuilder withExtraCheese() {
    _extraCheese = true;
    return this;
  }

  Pizza build() {
    if (_dough == null) throw Exception('Dough type is required');
    if (_size == null) throw Exception('Size is required');

    return Pizza(
      dough: _dough!,
      sauce: _sauce ?? 'tomato',
      toppings: _toppings,
      size: _size!,
      extraCheese: _extraCheese,
    );
  }

  // Named constructors for common pizzas
  static PizzaBuilder margherita() {
    return PizzaBuilder()
      ..setDough('thin')
      ..setSauce('tomato')
      ..addTopping('mozzarella')
      ..addTopping('basil');
  }

  static PizzaBuilder pepperoni() {
    return PizzaBuilder()
      ..setDough('regular')
      ..setSauce('tomato')
      ..addTopping('mozzarella')
      ..addTopping('pepperoni');
  }
}

// Usage Example
void main() {
  // Build custom pizza
  final customPizza = PizzaBuilder()
    .setDough('thick')
    .setSauce('bbq')
    .setSize('large')
    .addTopping('chicken')
    .addTopping('red onion')
    .addTopping('bacon')
    .withExtraCheese()
    .build();

  print(customPizza);

  // Build using preset
  final margherita = PizzaBuilder.margherita()
    .setSize('medium')
    .build();

  print(margherita);
}