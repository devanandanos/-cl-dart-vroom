class Car {
  String name;
  double price;

  Car(this.name, this.price);

  void changePrice(double newPrice) {
    price = newPrice;
    print("Price of $name updated to ₹$price");
  }
}

class Person {
  String name;
  double moneyLeft;
  List<Car> ownedCars = [];

  Person(this.name, this.moneyLeft);

  void buyCar(Car car) {
    if (moneyLeft >= car.price) {
      ownedCars.add(car);
      moneyLeft -= car.price;
      print("$name bought ${car.name} for ₹${car.price}");
    } else {
      print("$name doesn't have enough money to buy ${car.name}");
    }
  }

  void sellCar(Car car) {
    if (ownedCars.contains(car)) {
      ownedCars.remove(car);
      moneyLeft += car.price;
      print("$name sold ${car.name} for ₹${car.price}");
    } else {
      print("$name doesn't own ${car.name} to sell");
    }
  }

  void showStatus() {
    print("\n$name's Status:");
    print("Money left: ₹$moneyLeft");
    print("Owned cars:");
    for (var car in ownedCars) {
      print("- ${car.name} (₹${car.price})");
    }
  }
}

void main() {
  Car car1 = Car("Swift", 500000);
  Car car2 = Car("Thar", 1200000);

  Person deva = Person("Deva", 1000000);

  deva.buyCar(car1);
  deva.buyCar(car2);

  deva.showStatus();

  car2.changePrice(950000);
  deva.buyCar(car2);

  deva.showStatus();

  deva.sellCar(car1);

  deva.showStatus();
}
