import 'package:flutter/material.dart';
import 'produtData.dart';
import 'charts.dart';
import 'login.dart';
import 'showProduct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 75,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin:
                          const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                              height: 25,
                              child: Image.asset('assets/images/d.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Profit',
                                style: TextStyle(color: Color(0xff4F6068)),
                              ),
                              Text(
                                'U\$ 14,751.16',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff343B3F)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin:
                          const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                      height: 60,
                      //  width: MediaQuery.of(context).size.width*0.16,
                      decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                              //  width: MediaQuery.of(context).size.width*0.03,

                              // color: Colors.pink,
                              height: 25,
                              child: Image.asset('assets/images/m1.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Profit',
                                style: TextStyle(color: Color(0xff4F6068)),
                              ),
                              Text(
                                'U\$ 14,751.16',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff343B3F)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin:
                          const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                      height: 60,
                      //    width: MediaQuery.of(context).size.width*0.16,
                      decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                              // width: MediaQuery.of(context).size.width*0.03,
                              // color: Colors.pink,
                              height: 25,
                              child: Image.asset('assets/images/h1.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Expenses',
                                style: TextStyle(color: Color(0xff4F6068)),
                              ),
                              Text(
                                'U\$ 14,751.16',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff343B3F)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin:
                          const EdgeInsets.only(right: 20, top: 10, bottom: 10),
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.03,
                              // color: Colors.pink,
                              height: 25,
                              child: Image.asset('assets/images/p1.png')),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Clients',
                                style: TextStyle(color: Color(0xff4F6068)),
                              ),
                              Text(
                                '129',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff343B3F)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(
                            right: 0, top: 10, bottom: 10),
                        height: 60,
                        decoration: BoxDecoration(
                            color: const Color(0xff5D62B5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: [
                            Container(
                                height: 25,
                                child: Image.asset('assets/images/l.png')),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Username',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width * 0.445,
                      decoration: BoxDecoration(
                          color: const Color(0xffDADADA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          const Text(
                            'Stock Value',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff343B3F)),
                          ),
                          Container(
                            height: 240,
                            child: ChartsDemo(),

                            // Image.asset('assets/images/g.png')
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.445,
                    decoration: BoxDecoration(
                        color: const Color(0xffDADADA),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        const Text(
                          'Stock Ammount',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff343B3F)),
                        ),
                        Container(
                          height: 240,
                          child: ChartsDemo(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ShowProduct(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
