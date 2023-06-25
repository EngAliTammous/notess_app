
abstract class DataBaseOperations<Model>{

// Model => generic

  Future<int> create(Model model);

  Future<List<Model>> read(int categoryId);

  Future<bool> update(Model model);

  Future<bool> delete(int id);


}