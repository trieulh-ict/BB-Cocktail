extension ListExt<T> on List<T> {
  T firstOrNull() {
    try {
      final T value = this.first;
      return value;
    } catch (e) {
      return null;
    }
  }
}
