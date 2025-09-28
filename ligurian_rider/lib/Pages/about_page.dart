import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'About Me',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            
            // Profile Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    // Profile Icon
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.motorcycle,
                        size: 50,
                        color: Colors.blue[600],
                      ),
                    ),
                    
                    const SizedBox(height: 25),
                    
                    // Title
                    Text(
                      'Motorcycle Enthusiast',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Description
                    Text(
                      "I'm a guy that likes to go around with his motorcycle and thought that it would be cool to show everyone some of the streets that I explore during my rides.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // YouTube Channel Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[400]!, Colors.red[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withValues(alpha: 0.3),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.play_circle_filled,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    
                    const SizedBox(width: 20),
                    
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Check out my',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'YouTube Channel',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Features Cards
            Row(
              children: [
                Expanded(
                  child: _buildFeatureCard(
                    icon: Icons.map,
                    title: 'Routes',
                    description: 'Explore amazing motorcycle routes',
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildFeatureCard(
                    icon: Icons.favorite,
                    title: 'Passion',
                    description: 'Share the love for motorcycling',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required MaterialColor color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color[100],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              icon,
              size: 25,
              color: color[600],
            ),
          ),
          
          const SizedBox(height: 15),
          
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          
          const SizedBox(height: 8),
          
          Text(
            description,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
