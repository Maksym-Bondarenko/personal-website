import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/portfolio_data.dart';
import '../providers/theme_provider.dart';
import '../sections/contact_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/home_section.dart';
import '../sections/projects_section.dart';
import '../sections/publications_section.dart';
import '../sections/skills_section.dart';
import '../widgets/animated_background.dart';
import '../widgets/footer.dart';
import '../widgets/hover_effect.dart';
import '../widgets/section_container.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final PortfolioData _portfolioData = PortfolioData.sampleData();

  // For desktop scrolling:
  late final ScrollController _scrollController;
  final List<String> _sectionTitles = [
    'Home',
    'Experience',
    'Projects',
    'Skills',
    'Education',
    'Publications',
    'Contact',
  ];
  late final Map<String, GlobalKey> _sectionKeys;
  double _scrollPosition = 0.0;
  double _maxScrollExtent = 1.0;
  int _activeSection = 0;

  // For mobile PageView:
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _pageController = PageController();

    _sectionKeys = {
      'Home': GlobalKey(),
      'Experience': GlobalKey(),
      'Projects': GlobalKey(),
      'Skills': GlobalKey(),
      'Education': GlobalKey(),
      'Publications': GlobalKey(),
      'Contact': GlobalKey(),
    };
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  // DESKTOP SCROLL LISTENER
  void _onScroll() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      _maxScrollExtent = _scrollController.position.maxScrollExtent;
    });

    // Update active section for desktop nav
    for (int i = _sectionTitles.length - 1; i >= 0; i--) {
      final key = _sectionKeys[_sectionTitles[i]];
      if (key?.currentContext != null) {
        final box = key!.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);
        if (position.dy <= MediaQuery.of(context).size.height / 2) {
          if (_activeSection != i) {
            setState(() => _activeSection = i);
          }
          break;
        }
      }
    }
  }

  // DESKTOP SCROLL-TO-SECTION
  void _scrollToSection(int index) {
    final key = _sectionKeys[_sectionTitles[index]];
    if (key?.currentContext != null) {
      final box = key!.currentContext!.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      final offset = position.dy + _scrollController.offset;

      _scrollController.animateTo(
        offset - 100, // Offset for app bar
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutQuad,
      );
    }
  }

  // MOBILE WIDGET BUILD
  Widget _buildMobileBody() {
    // Each section is one "page" in the PageView
    final pages = [
      _buildMobilePage(
        child: HomeSection(data: _portfolioData),
        hasTitle: false,
      ),
      _buildMobilePage(
        child: ExperienceSection(experiences: _portfolioData.experiences),
        title: 'Experience',
      ),
      _buildMobilePage(
        child: ProjectsSection(projects: _portfolioData.projects),
        title: 'Projects',
      ),
      _buildMobilePage(
        child: SkillsSection(skills: _portfolioData.skills),
        title: 'Skills',
      ),
      _buildMobilePage(
        child: EducationSection(educationList: _portfolioData.education),
        title: 'Education',
      ),
      if (_portfolioData.publications.isNotEmpty)
        _buildMobilePage(
          child: PublicationsSection(publications: _portfolioData.publications),
          title: 'Publications',
        ),
      _buildMobilePage(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            ContactSection(data: _portfolioData),
            const SizedBox(height: 20),
            Footer(name: _portfolioData.name),
          ],
        ),
      ),
    ];

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: pages,
        ),
        // Smooth indicator at bottom
        Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: pages.length,
              axisDirection: Axis.vertical,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                spacing: 16,
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).dividerColor.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // One "page" in the mobile PageView
  Widget _buildMobilePage({
    Widget? child,
    String? title,
    bool hasTitle = true,
  }) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 16),
      child: SingleChildScrollView(
        // If you want the entire page to scroll,
        // but typically for a snap effect, you'd want no scroll inside the page.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasTitle && title != null) ...[
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 60,
                height: 3,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
            ],
            child ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  // DESKTOP LAYOUT BUILD
  Widget _buildDesktopBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSideNavigation(), // The vertical nav bar
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Home section (no title)
                  SizedBox(
                    key: _sectionKeys['Home'],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 60),
                      child: HomeSection(data: _portfolioData),
                    ),
                  ),
                  SectionContainer(
                    title: 'Experience',
                    sectionKey: _sectionKeys['Experience'],
                    child: ExperienceSection(
                      experiences: _portfolioData.experiences,
                    ),
                  ),
                  SectionContainer(
                    title: 'Projects',
                    sectionKey: _sectionKeys['Projects'],
                    child: ProjectsSection(projects: _portfolioData.projects),
                  ),
                  SectionContainer(
                    title: 'Skills',
                    sectionKey: _sectionKeys['Skills'],
                    child: SkillsSection(skills: _portfolioData.skills),
                  ),
                  SectionContainer(
                    title: 'Education',
                    sectionKey: _sectionKeys['Education'],
                    child: EducationSection(
                      educationList: _portfolioData.education,
                    ),
                  ),
                  if (_portfolioData.publications.isNotEmpty)
                    SectionContainer(
                      title: 'Publications',
                      sectionKey: _sectionKeys['Publications'],
                      child: PublicationsSection(
                        publications: _portfolioData.publications,
                      ),
                    ),
                  SectionContainer(
                    title: 'Contact',
                    sectionKey: _sectionKeys['Contact'],
                    isLastSection: true,
                    child: ContactSection(data: _portfolioData),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Footer(name: _portfolioData.name),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
        // Optionally add a vertical smooth indicator for the desktop layout too
        // We'll place an "AnimatedSmoothIndicator" at the right side.
        // It uses _activeSection as the "activeIndex."
        PositionedIndicatorDesktop(
          activeIndex: _activeSection,
          count: _sectionTitles.length,
          onDotClicked: _scrollToSection,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 900;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(isSmallScreen ? 60 : 80),
        child: _buildAppBar(isSmallScreen),
      ),
      floatingActionButton: isSmallScreen ? _buildMobileFAB() : null,
      body: AnimatedGradientBackground(
        scrollPosition: isSmallScreen ? 0 : _scrollPosition,
        maxScrollExtent: isSmallScreen ? 100 : _maxScrollExtent,
        child: SafeArea(
          child: isSmallScreen ? _buildMobileBody() : _buildDesktopBody(),
        ),
      ),
    );
  }

  // Reuse your existing AppBar logic
  Widget _buildAppBar(bool isSmallScreen) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface.withOpacity(0.9),
      elevation: 0,
      title:
          isSmallScreen
              ? Text(
                _portfolioData.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
              : const SizedBox.shrink(),
      actions: [
        // Possibly show a "desktop nav" if not small screen
        if (!isSmallScreen) _buildDesktopNavigation(),
        // Theme toggle
        IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => themeProvider.toggleTheme(),
          tooltip:
              themeProvider.isDarkMode
                  ? 'Switch to Light Mode'
                  : 'Switch to Dark Mode',
        ),
      ],
    );
  }

  Widget _buildDesktopNavigation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < _sectionTitles.length; i++)
          if (i > 0) // skip "Home" if you want
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: HoverEffect(
                onTap: () => _scrollToSection(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        _activeSection == i
                            ? Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.1)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _sectionTitles[i],
                    style: TextStyle(
                      fontWeight:
                          _activeSection == i
                              ? FontWeight.bold
                              : FontWeight.normal,
                      color:
                          _activeSection == i
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }

  // Desktop side nav
  Widget _buildSideNavigation() {
    return Container(
      width: 60,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < _sectionTitles.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: HoverEffect(
                onTap: () => _scrollToSection(i),
                child: Tooltip(
                  message: _sectionTitles[i],
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          _activeSection == i
                              ? Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.1)
                              : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getIconForSection(i),
                      color:
                          _activeSection == i
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.6),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Mobile floating menu button
  Widget _buildMobileFAB() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => _buildMobileNavigationSheet(),
        );
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      child: const Icon(Icons.menu),
    );
  }

  // Mobile nav bottom sheet
  Widget _buildMobileNavigationSheet() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // You could add a jump to each page if you wanted:
          for (int i = 0; i < _sectionTitles.length; i++)
            ListTile(
              leading: Icon(_getIconForSection(i)),
              title: Text(_sectionTitles[i]),
              onTap: () {
                Navigator.pop(context);
                // jump to that page
                _pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad,
                );
              },
            ),
        ],
      ),
    );
  }

  IconData _getIconForSection(int index) {
    switch (_sectionTitles[index]) {
      case 'Home':
        return Icons.home;
      case 'Experience':
        return Icons.work;
      case 'Projects':
        return Icons.code;
      case 'Skills':
        return Icons.star;
      case 'Education':
        return Icons.school;
      case 'Publications':
        return Icons.article;
      case 'Contact':
        return Icons.contact_mail;
      default:
        return Icons.circle;
    }
  }
}

// OPTIONAL: A floating position indicator for desktop that references _activeSection
class PositionedIndicatorDesktop extends StatelessWidget {
  final int activeIndex;
  final int count;
  final ValueChanged<int>? onDotClicked;

  const PositionedIndicatorDesktop({
    Key? key,
    required this.activeIndex,
    required this.count,
    this.onDotClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // To place it on top of everything, wrap in a Stack or do a Positioned.
    // In this example, we'll do a "stack" approach.
    // Because the desktop layout is a Row, we can’t just “Positioned” inside it easily
    // without some extra parent stack. So a simpler approach:
    return const SizedBox.shrink(); // If you don’t want an indicator at all.
    // If you DO want a desktop indicator, you’d do something like:
    /*
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: AnimatedSmoothIndicator(
          // or AnimatedSmoothIndicator from 1.x
          activeIndex: activeIndex,
          count: count,
          effect: WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            spacing: 8,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotColor: Theme.of(context).dividerColor.withOpacity(0.3),
          ),
          onDotClicked: onDotClicked,
        ),
      ),
    );
    */
  }
}
