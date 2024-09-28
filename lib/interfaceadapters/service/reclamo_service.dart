import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/error_handling.dart';
import '../../constants/utils2.dart';
import '../../domain/provider/user_provider.dart';

class ReclamoService {
  Future<void> createReclamo({
    required BuildContext context,
    required String descripcion,
    required String descripcionSitio,
    required int idoficina,
    //required String usuarioId,
    List<XFile>? images,
    double? latitude,
    double? longitude,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$uri/reclamo/crear'),
      );
      String usuarioId = Provider.of<UserProvider>(context, listen: false)
          .getUserId();

      print('mandamos el $usuarioId');
      request.fields['descripcionreclamo'] = descripcion;
      request.fields['descripcionsitioreclamo'] = descripcionSitio;
      request.fields['idoficina'] = idoficina.toString();
      request.fields['latitude'] = latitude.toString();
      request.fields['longitude'] = longitude.toString();
      request.fields['idusuarioreclamo'] = usuarioId;

      /*DateTime now = DateTime.now();
      String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      request.fields['horareclamo'] = formattedTime.toString();
      print(formattedTime);*/
      if (images != null) {
        for (var image in images) {
          var mimeTypeData =
              lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])?.split('/');
          request.files.add(await http.MultipartFile.fromPath(
            'images',
            image.path,
            contentType: mimeTypeData != null
                ? MediaType(mimeTypeData[0], mimeTypeData[1])
                : MediaType('image', 'jpg'),
          ));
          print('Imagen añadida: ${image.path}');
        }
      }

      var res = await request.send();
      final response = await http.Response.fromStream(res);

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar2(
            context,
            '¡Reclamo creado exitosamente!',
          );
        },
      );
    } catch (error) {
      print('Error durante la creación del reclamo: $error');
    }
  }
}
