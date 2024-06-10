class Dir {
  final int id_dir;
  final String name_dir;
  final int customer_id;
  final String type_dir;
  final int created_by;
  final String created_date;
  final String last_MDF_by;
  final String last_MDF_date;
  final String deleted;

  Dir({
    required this.id_dir,
    required this.name_dir,
    required this.customer_id,
    required this.type_dir,
    required this.created_by,
    required this.created_date,
    required this.last_MDF_by,
    required this.last_MDF_date,
    required this.deleted,
  });

  factory Dir.fromJson(Map<String, dynamic> json) {
    return Dir(
      id_dir: int.parse(json['id_dir']),
      name_dir: json['name_dir'],
      customer_id: int.parse(json['customer_id']),
      type_dir: json['type_dir'],
      created_by: int.parse(json['created_by']),
      created_date: json['created_date'],
      last_MDF_by: json['last_MDF_by'],
      last_MDF_date: json['last_MDF_date'],
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_dir': id_dir,
      'name_dir': name_dir,
      'customer_id': customer_id,
      'type_dir': type_dir,
      'created_by': created_by,
      'created_date': created_date,
      'last_MDF_by': last_MDF_by,
      'last_MDF_date': last_MDF_date,
      'deleted': deleted,
    };
  }
}
