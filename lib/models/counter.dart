class Counter {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value += 1;
  }

  void decrement() {
    _value -= 1;
  }
}
