import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceRowWidget extends StatefulWidget {
  const DeviceRowWidget({Key key}) : super(key: key);

  @override
  _DeviceRowWidgetState createState() => _DeviceRowWidgetState();
}

class _DeviceRowWidgetState extends State<DeviceRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Container(
              width: 80,
              height: 90,
              decoration: BoxDecoration(
                color: Color(0xFF262D34),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Color(0xFFEFD3D7),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color(0xFFEFD3D7),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 55,
                            height: 55,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/icons8-desktop-64.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    AutoSizeText(
                      'My Desktop',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFF262D34),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Color(0xFF7D8CC4),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color(0xFF7D8CC4),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Container(
                          width: 25,
                          height: 25,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/icons8-laptop-96.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                AutoSizeText(
                  'My Laptop',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).tertiaryColor,
                        fontSize: 13,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
