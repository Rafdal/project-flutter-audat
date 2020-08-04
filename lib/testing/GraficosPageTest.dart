import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class GraficosPageTest extends StatefulWidget {
  @override
  _GraficosPageTestState createState() => _GraficosPageTestState();
}

class _GraficosPageTestState extends State<GraficosPageTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 3),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Consumo energetico histórico', style: TextStyle(color: Colors.black54),),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: LineChart(
                                      LineChartData(
                                        minY: 0,
                                        maxY: 15,
                                        titlesData: FlTitlesData(
                                          leftTitles: SideTitles(
                                            interval: 3,
                                            showTitles: true
                                          ),
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 0:
                                                  return 'LU';
                                                case 1:
                                                  return 'MA';
                                                case 2:
                                                  return 'MI';
                                                case 3:
                                                  return 'JU';
                                                case 4:
                                                  return 'VI';
                                                case 5:
                                                  return 'SA';
                                                case 6:
                                                  return 'DO';
                                              }
                                              return '';
                                            },
                                          )
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        gridData: FlGridData(
                                          // show: false,
                                          horizontalInterval: 2
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            belowBarData: BarAreaData(
                                              show: true,
                                              colors: [
                                                Colors.blue.withOpacity(0.15)
                                              ]
                                            ),
                                            isStrokeCapRound: true,
                                            shadow: Shadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 1),
                                              blurRadius: 3,
                                            ),
                                            barWidth: 4,
                                            isCurved: true,
                                            colors: [
                                              Colors.blue,
                                            ],
                                            dotData: FlDotData(
                                              show: false,
                                            ),
                                            spots: [
                                              FlSpot(0, 5),
                                              FlSpot(0.7, 7),
                                              FlSpot(1, 12),
                                              FlSpot(2, 7),
                                              FlSpot(3, 8),
                                              FlSpot(4, 6),
                                              FlSpot(5, 7),
                                              FlSpot(6, 3),
                                            ]
                                          ),


                                          LineChartBarData(
                                            belowBarData: BarAreaData(
                                              show: true,
                                              colors: [
                                                Colors.orange.withOpacity(0.15),
                                              ]
                                            ),
                                            isStrokeCapRound: true,
                                            shadow: Shadow(
                                              color: Colors.grey,
                                              offset: Offset(0, 1),
                                              blurRadius: 3,
                                            ),
                                            barWidth: 2,
                                            dashArray: [
                                              4,0
                                            ],
                                            isCurved: true,
                                            colors: [
                                              Colors.orange,
                                            ],
                                            dotData: FlDotData(
                                              show: false,
                                            ),
                                            spots: [
                                              FlSpot(0, 9),
                                              FlSpot(0.5, 5.5),
                                              FlSpot(1, 5),
                                              FlSpot(2, 6),
                                              FlSpot(3, 5),
                                              FlSpot(3.3, 11),
                                              FlSpot(3.6, 5),
                                              FlSpot(4, 4),
                                              FlSpot(5, 5),
                                              FlSpot(5.5, 9),
                                              FlSpot(6, 7),
                                            ]
                                          )
                                        ]
                                      ),
                                      // swapAnimationDuration: const Duration(milliseconds: 250),
                                    ),
                                  ) 
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}