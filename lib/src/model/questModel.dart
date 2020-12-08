class Quest{
  final int id;
  final String name;
  final String descripition;
  final int status;

  Quest({this.id, this.name, this.descripition, this.status});

  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'name' : name,
      'descripition' : descripition,
      'status': status
    };
  }

}