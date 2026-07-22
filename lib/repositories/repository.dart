abstract class Repository<T> {
  Future<List<T>> getAll();

  Future<void> save(List<T> items);
}
