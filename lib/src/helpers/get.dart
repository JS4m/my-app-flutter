class Get {
  Get._();
  //esto es una nueva instancia de la clase get
  static Get i = Get._();
//guardamos nuestras dependencias , en data , se guarda un tipo de dato authentication Repositorio
//es por eso que se crea esto para poder acceder desde cualquier
//desde cualquier parte del proyecto
  Map<String, dynamic> _data = Map();
  //aqui despues de guardar varios tipos de datos de Map
  //los podré diferenciar con tag
  String _getKey(Type t, String tag) {
    if (tag != null) {
      return "${t.toString()}$tag";
    }
    return t.toString();
  }

  void put<T>(dynamic dependency, {String tag}) {
    final String key = _getKey(T, tag);

    ///print("put key $key");
    _data[key] = dependency;
  }

  T find<T>({String tag}) {
    final String key = _getKey(T, tag);
    //print("find key $key");
    if (!_data.containsKey(key)) {
      throw AssertionError("$key No funciona, crear la llamada primero al put");
    }
    return _data[key];
  }

  void remove<T>({String tag}) {
    final String key = _getKey(T, tag);
    _data.remove(key);
  }
}
