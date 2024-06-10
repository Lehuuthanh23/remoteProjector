class PacketModel {
  String packetId;
  String namePacket;
  String price;
  String monthQty;
  String detail;

  PacketModel({
    required this.packetId,
    required this.namePacket,
    required this.price,
    required this.monthQty,
    required this.detail,
  });

  factory PacketModel.fromJson(Map<String, dynamic> json) {
    return PacketModel(
      packetId: json['packet_id'],
      namePacket: json['name_packet'],
      price: json['price'],
      monthQty: json['month_qty'],
      detail: json['detail'].trim(),
    );
  }
}
