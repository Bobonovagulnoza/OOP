import 'package:flutter/material.dart';

void main() {
  Phone phone = Phone(
    brand: "iPhone",
    model: "Pro",
    price: 1200000,
    discountedPrice: 1000000,
    storageCapacity: 128,
    ramSize: 8,
    batteryCapacity: 5000,
    screenSize: 6.7,
    is5GEnabled: true,
    os: "iOS",
    manufacturingYear: 2023,
  );

  print(phone.getDetails());
}

class Phone {
  // Private fields (Encapsulation)
  final String brand;
  final String model;
  double _price;
  double _discountedPrice;
  int _storageCapacity;
  int _ramSize;
  int _batteryCapacity;
  double screenSize;
  bool is5GEnabled;
  final String os;
  final int manufacturingYear;
  int warrantyYears;
  List<String> features;

  // Constructor
  Phone({
    required this.brand,
    required this.model,
    required double price,
    required double discountedPrice,
    required int storageCapacity,
    required int ramSize,
    required int batteryCapacity,
    required this.screenSize,
    required this.is5GEnabled,
    required this.os,
    required int manufacturingYear,
    this.warrantyYears = 2,
    List<String>? features,
  })  : _price = _validatePrice(price),
        _discountedPrice = _validatePrice(discountedPrice),
        _storageCapacity = _validateStorage(storageCapacity),
        _ramSize = _validateRam(ramSize),
        _batteryCapacity = _validateBattery(batteryCapacity),
        manufacturingYear = _validateYear(manufacturingYear),
        features = features ?? [];

  // Getters
  double get price => _price;
  double get discountedPrice => _discountedPrice;
  int get storageCapacity => _storageCapacity;
  int get ramSize => _ramSize;
  int get batteryCapacity => _batteryCapacity;

  // Setters with validation
  set price(double newPrice) {
    _price = _validatePrice(newPrice);
  }

  set discountedPrice(double newDiscountedPrice) {
    _discountedPrice = _validatePrice(newDiscountedPrice);
  }

  set storageCapacity(int newStorage) {
    _storageCapacity = _validateStorage(newStorage);
  }

  set ramSize(int newRam) {
    _ramSize = _validateRam(newRam);
  }

  set batteryCapacity(int newBattery) {
    _batteryCapacity = _validateBattery(newBattery);
  }

  // Methods
  String getDetails() {
    return "Brand: $brand, Model: $model, Price: \$$price, Discounted Price: \$$discountedPrice, "
        "Storage: ${storageCapacity}GB, RAM: ${ramSize}GB, Battery: ${batteryCapacity}mAh, "
        "Screen: ${screenSize} inches, 5G: ${is5GEnabled ? 'Yes' : 'No'}, OS: $os, "
        "Manufacturing Year: $manufacturingYear, Warranty: $warrantyYears years, "
        "Features: ${features.join(', ')}";
  }

  void applyDiscount(double discount) {
    if (discount < 0 || discount > 100) {
      throw ArgumentError("Discount must be between 0 and 100");
    }
    discountedPrice = price - (price * discount / 100);
  }

  void upgradeStorage(int newSize) {
    if (newSize > _storageCapacity) {
      _storageCapacity = newSize;
    } else {
      throw ArgumentError("New storage size must be greater than current size.");
    }
  }

  void upgradeRam(int newRam) {
    if (newRam > _ramSize) {
      _ramSize = newRam;
    } else {
      throw ArgumentError("New RAM size must be greater than current size.");
    }
  }

  int calculateBatteryLife(int usageHours) {
    int remainingBattery = batteryCapacity - (usageHours * 200);
    return remainingBattery > 0 ? remainingBattery : 0;
  }

  bool isLatestModel() {
    return manufacturingYear == DateTime.now().year;
  }

  void toggle5G() {
    is5GEnabled = !is5GEnabled;
  }

  String compareWith(Phone anotherPhone) {
    if (ramSize > anotherPhone.ramSize && storageCapacity > anotherPhone.storageCapacity) {
      return "$model is better than ${anotherPhone.model}";
    } else if (ramSize < anotherPhone.ramSize && storageCapacity < anotherPhone.storageCapacity) {
      return "${anotherPhone.model} is better than $model";
    }
    return "Both phones are comparable";
  }

  void addCustomFeature(String feature) {
    features.add(feature);
  }

  int getRemainingWarranty(int currentYear) {
    int remainingYears = (manufacturingYear + warrantyYears) - currentYear;
    return remainingYears > 0 ? remainingYears : 0;
  }

  // Private Validation Methods
  static double _validatePrice(double price) {
    if (price <= 0) throw ArgumentError("Price must be positive");
    return price;
  }

  static int _validateStorage(int storage) {
    if (storage < 32) throw ArgumentError("Storage must be at least 32GB");
    return storage;
  }

  static int _validateRam(int ram) {
    if (ram < 2) throw ArgumentError("RAM must be at least 2GB");
    return ram;
  }

  static int _validateBattery(int battery) {
    if (battery < 1000) throw ArgumentError("Battery must be at least 1000mAh");
    return battery;
  }

  static int _validateYear(int year) {
    int currentYear = DateTime.now().year;
    if (year > currentYear) throw ArgumentError("Manufacturing year cannot be in the future");
    return year;
  }
}
