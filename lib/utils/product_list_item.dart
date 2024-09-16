import 'package:elevate_task/utils/my_app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../domain/entities/ProductResponseEntity.dart';

class ProductListItem extends StatelessWidget {
  ProductsEntity responseEntity;
  ProductListItem({required this.responseEntity});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: MyAppColor.primaryColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    child: Image.network(
                      responseEntity.image ?? "",
                      fit: BoxFit.contain ,
                      width: double.infinity,
                      height: 100.h,
                    ),
                  ),
                  Positioned(
                      top: 3.h,
                      right: 1.w,
                      child: Image.asset("assets/images/favIcon.png"))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              responseEntity.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20.sp,
                color: MyAppColor.darkPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "EGP ${responseEntity.price}",
              maxLines: 1,
              style: TextStyle(
                fontSize: 18.sp,
                color: MyAppColor.darkPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  "Review (${responseEntity.rating?.rate ?? 0.0})",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: MyAppColor.darkPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Image.asset(MyAppColor.starIcon,),
                  SizedBox(width: 13.w,),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 35.sp,
                    color: MyAppColor.primaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
