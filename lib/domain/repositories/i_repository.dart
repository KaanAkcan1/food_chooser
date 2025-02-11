abstract class IRepository<T> {
  Future<void> add(T item);
  Future<void> update(T item);
  Future<void> delete(String id);
  Future<List<T>> getAll();
  Future<T?> getById(String id);
}
