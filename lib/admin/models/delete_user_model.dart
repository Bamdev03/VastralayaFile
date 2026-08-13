class DeleteUserModel {
    DeleteUserModel({
        required this.success,
        required this.message,
    });

    final bool? success;
    final String? message;

    factory DeleteUserModel.fromJson(Map<String, dynamic> json){ 
        return DeleteUserModel(
            success: json["success"],
            message: json["message"],
        );
    }

}
