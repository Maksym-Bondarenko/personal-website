class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;
  final String? logoUrl;

  Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    this.logoUrl,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
  });
}

class Education {
  final String institution;
  final String degree;
  final String duration;
  final String? description;
  final String? logoUrl;

  Education({
    required this.institution,
    required this.degree,
    required this.duration,
    this.description,
    this.logoUrl,
  });
}

class Skill {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final String category; // e.g., 'Programming', 'Design', etc.

  Skill({
    required this.name,
    required this.proficiency,
    required this.category,
  });
}

class Publication {
  final String title;
  final String journal;
  final String date;
  final String? description;
  final String? url;

  Publication({
    required this.title,
    required this.journal,
    required this.date,
    this.description,
    this.url,
  });
}

class PortfolioData {
  final String name;
  final String title;
  final String email;
  final String phone;
  final String about;
  final String? profileImageUrl;
  final String? resumeUrl;
  final Map<String, String> socialLinks; // key: platform, value: URL
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Education> education;
  final List<Skill> skills;
  final List<Publication> publications;

  PortfolioData({
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.about,
    this.profileImageUrl,
    this.resumeUrl,
    required this.socialLinks,
    required this.experiences,
    required this.projects,
    required this.education,
    required this.skills,
    required this.publications,
  });

  /// Updated sample data from Maksym Bondarenko's CV
  static PortfolioData sampleData() {
    return PortfolioData(
      name: 'Maksym Bondarenko',
      title: 'Software Engineer (Full Stack / Mobile / ML)',
      email: 'maksym.r.bondarenko@gmail.com',
      phone: '+49 1575 9039808',
      about:
          'Software Engineer with 5+ years of experience in **full-stack** development. Passionate about creating **impactful** solutions in **web**, **mobile**, and **AI**. My academic journey spans four countries, and I enjoy building products that drive **meaningful change**.',
      profileImageUrl: 'assets/profile/profile_photo.JPG',
      resumeUrl: 'assets/downloads/Maksym_Bondarenko_CV.pdf',
      socialLinks: {
        'github': 'https://github.com/Maksym-Bondarenko',
        'linkedin': 'https://www.linkedin.com/in/maksym-bondarenko-252677136/',
        'scholar':
            'https://scholar.google.com/citations?hl=de&user=rHlFJbQAAAAJ',
      },

      // --------------------------
      // Experience with bullet points & X-Y-Z format
      // --------------------------
      experiences: [
        Experience(
          company: 'MSG Systems',
          position: 'Full Stack Developer',
          duration: '04/2021 - 03/2024',
          description: '''
- Accomplished a **custom system sale** to a **global manufacturing company** (80k+ employees) by **enhancing application quality** and thorough code reviews, resulting in greater trust and adoption.
- Accelerated **employee onboarding** by **upgrading** the account management system, achieving **50% faster** provisioning through optimized UI and new automation.
- Achieved **80%** unit test coverage, leading to a **50%** reduction in user complaints by performing **regular bug fixes** and adopting **test-driven development**.
- Improved **software delivery** by establishing a **CI/CD pipeline**, enabling continuous integration and leading **frontend development** for a software craftsmanship product.
''',
        ),
        Experience(
          company: 'SAP UCC (EaaS provider)',
          position: 'Software Developer',
          duration: '12/2018 - 08/2020',
          description: '''
- Led **implementation** of an **educational account management system** for **5,000+** users by collaborating with cross-functional teams.
- Reduced user complaints by **90%** by **enhancing security** and **usability** through regular user testing and refined UX.
''',
        ),
      ],

      // --------------------------
      // Projects with more links/info
      // --------------------------
      projects: [
        Project(
          title: 'SafeStreets',
          description: '''
A **city safety awareness** startup providing hazard alerts and safe route planning. 
- **Finalist** in TMA Accelerator and SIA Incubator, selected from 47 startups. 
- Participated in major IT conferences (**Bits & Pretzels**, **ITCS**), joined **2Hearts** (Europe’s largest tech community for migrants). 
- Built a pre-MVP with **Flutter**, **GCP**, and **Google Maps API**.
''',
          technologies: ['Flutter', 'GCP', 'Google Maps API'],
          githubUrl: null,
          liveUrl: 'https://themigrantaccelerator.com/alumni-startups/',
        ),
        Project(
          title: 'Cloud-Prism (Non-Profit)',
          description: '''
An **educational** initiative for **refugee tech training**. 
- Helped participants transition to **entry-level** tech roles through structured learning. 
- Oversaw **platform architecture** and **frontend**. 
- Official site: cloud-prism.com
''',
          technologies: ['Vue.js', 'Firebase', 'Docker'],
          githubUrl: null,
          liveUrl: 'https://cloud-prism.com/',
        ),
        Project(
          title: 'Digital Product School - Government Admin Tool',
          description: '''
Completed a **3-month** full-time scholarship by **UnternehmerTUM**. 
- Developed a **mobile administrative tool** that reduced government process times by **50%**. 
- Leveraged **Flutter**, **Firebase**, and **DevOps** practices for continuous iteration.
''',
          technologies: ['Flutter', 'Firebase', 'DevOps'],
          githubUrl: null,
          liveUrl: 'https://www.digitalproductschool.io/',
        ),
      ],

      // --------------------------
      // Education remains similar
      // --------------------------
      education: [
        Education(
          institution: 'ETH Zurich & Technical University of Munich (TUM)',
          degree: 'M.Sc. in Computer Science',
          duration: '04/2022 - 05/2025',
          description:
              'Focus on **algorithms & data structures**. Thesis: "Dynamic Selection of ROI for Enhanced **Heart Rate** Detection Using **Machine Learning**" in collaboration with ETH Zurich and Khalifa University.',
        ),
        Education(
          institution: 'Technical University of Munich (TUM)',
          degree: 'B.Sc. in Computer Science',
          duration: '10/2018 - 03/2022',
          description:
              'Minor in **Business Administration**. Thesis on the administration of business games, graded **A**. Co-author of "**eLearning - Technologies and Infrastructures**" by Dr. Thomas Hüttl.',
        ),
        Education(
          institution:
              'Kharkiv National University of Radio Electronics (NURE)',
          degree: 'B.Sc. in Computer Engineering',
          duration: '09/2016 - 06/2021',
          description:
              'Faculty of **Computer Engineering** and Control. Transferred credits to TUM for exchange programs.',
        ),
      ],

      // --------------------------
      // Skills in three categories: programming, technical, spoken languages
      // --------------------------
      skills: [
        // PROGRAMMING LANGUAGES (from best to worst)
        Skill(
          name: 'JavaScript / TypeScript',
          proficiency: 0.95,
          category: 'Programming Languages',
        ),
        Skill(
          name: 'Java',
          proficiency: 0.9,
          category: 'Programming Languages',
        ),
        Skill(
          name: 'Dart',
          proficiency: 0.85,
          category: 'Programming Languages',
        ),
        Skill(
          name: 'C++ / Haskell',
          proficiency: 0.65,
          category: 'Programming Languages',
        ),

        // TECHNICAL
        Skill(name: 'Angular', proficiency: 0.9, category: 'Technical'),
        Skill(name: 'Spring Boot', proficiency: 0.8, category: 'Technical'),
        Skill(name: 'DevOps / CI-CD', proficiency: 0.8, category: 'Technical'),
        Skill(name: 'Docker', proficiency: 0.8, category: 'Technical'),
        Skill(name: 'Firebase', proficiency: 0.8, category: 'Technical'),
        Skill(name: 'Vue.js', proficiency: 0.75, category: 'Technical'),
        Skill(name: 'React', proficiency: 0.75, category: 'Technical'),
        Skill(name: 'GCP', proficiency: 0.75, category: 'Technical'),
        Skill(name: 'ML / QA', proficiency: 0.7, category: 'Technical'),
        Skill(name: 'SAPUI5', proficiency: 0.7, category: 'Technical'),

        // SPOKEN LANGUAGES (from best to worst)
        Skill(
          name: 'Ukrainian',
          proficiency: 1.0,
          category: 'Spoken Languages',
        ), // native
        Skill(
          name: 'Russian',
          proficiency: 1.0,
          category: 'Spoken Languages',
        ), // native
        Skill(
          name: 'English',
          proficiency: 0.95,
          category: 'Spoken Languages',
        ), // proficient
        Skill(
          name: 'German',
          proficiency: 0.95,
          category: 'Spoken Languages',
        ), // proficient
        Skill(
          name: 'French',
          proficiency: 0.6,
          category: 'Spoken Languages',
        ), // intermediate
        Skill(
          name: 'Norwegian',
          proficiency: 0.4,
          category: 'Spoken Languages',
        ), // beginner
      ],

      // --------------------------
      // Publications, including new Med-Dev conference
      // --------------------------
      publications: [
        Publication(
          title:
              'Learning by gaming: Improvement of User Experience of a Simulation Game...',
          journal: 'IEEE Global Engineering Education Conference (EDUCON)',
          date: 'March 2022',
          url: 'https://ieeexplore.ieee.org/document/9766623',
          description:
              'Authored and presented at EDUCON 2022; the application is used at TUM to teach Information Systems students.',
        ),
        Publication(
          title: 'Co-author: "eLearning - Technologies and Infrastructures"',
          journal: 'Book by Dr. Thomas Hüttl',
          date: '2022',
          description:
              'Joint publication focusing on eLearning architectures and administration tools, referencing TUM case studies.',
        ),
        // ADD first Med-Dev conference
        Publication(
          title: 'First Med-Dev Conference',
          journal: 'Med-Dev 2023',
          date: '2023',
          description:
              'Presented my research on **rPPG** with **real-time HR estimation** from **RGB videos** at the inaugural Med-Dev conference.',
        ),
      ],
    );
  }
}
