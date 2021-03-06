import 'package:almanhaj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'constants.dart';

customCachedNetworkImage({
  required String? url,
  required BuildContext context,
  required BoxFit fit,
  required String title,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  if (url == null || url.isEmpty) {
    return SizedBox(
      child: Image.asset(
        Assets.image.logo2021,
        height: 100,
        width: width,
        fit: BoxFit.contain,
      ),
    );
  } else {
    return Container(
      color: Colors.transparent,
      width: width,
      child:  CachedNetworkImage(
              imageUrl: url,
              fit: fit,
              placeholder: (_, __) => const Center(
                    child: SpinKitChasingDots(
                      color: kPrimaryBlueColor,
                      size: 20,
                    ),
                  ),
              errorWidget: (context, url, error) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  textDirection: TextDirection.rtl,
                  children: [
                    Image.asset(
                      Assets.image.logo2021,
                      height: 100,
                      width:width,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      title,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: headingStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: HexColor("#323232")),
                    )
                  ],
                );
              })

    );
  }
}

customCachedNetworkImageWitoutTitle({
  required String? url,
  required BuildContext context,
  required BoxFit fit,
}) {

    if (url == null ||  url.isEmpty) {
      return SizedBox(
        child: Image.asset(
          Assets.image.logo2021,
          height: 100,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: (Uri.parse(url).isAbsolute)
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                placeholder: (_, __) => const Center(
                        child: SpinKitChasingDots(
                      color: kPrimaryBlueColor,
                      size: 15,
                    )),
                errorWidget: (context, url, error) {
                  return Image.asset(
                    Assets.image.logo2021,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  );
                })
            : Image.asset(
                Assets.image.logo2021,
                height: 100,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
              ),
      );
    }

}
