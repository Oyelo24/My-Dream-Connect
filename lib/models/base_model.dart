abstract class BaseModel {
  Map<String, dynamic> toJson();
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}