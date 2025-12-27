import 'package:flutter/material.dart';
import 'package:row_up/Screens/Drawer/under_construction_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';

import '../Screens/Drawer/profile_screen.dart';
import '../Screens/Drawer/settings_screen.dart';

/// Navigation drawer providing access to app settings and information
/// Accessible from the main app bar hamburger menu
class InformationDrawer extends StatelessWidget {
  const InformationDrawer({super.key});

  static const List<_DrawerItem> _drawerTopItems = [
    _DrawerItem(
      icon: Icons.person_outline_rounded,
      label: 'Profile',
      screen: ProfileScreen(),
    ),
    _DrawerItem(
      icon: Icons.settings_outlined,
      label: 'Settings',
      screen: SettingsScreen(),
    ),
  ];

  static const List<_DrawerItem> _drawerBottomItems = [
    _DrawerItem(
      icon: Icons.info_outline_rounded,
      label: 'About',
      screen: UnderConstructionScreen(),
    ),
    _DrawerItem(
      icon: Icons.help_outline_rounded,
      label: 'Help (FAQ)',
      screen: UnderConstructionScreen(),
    ),
    _DrawerItem(
      icon: Icons.bug_report_outlined,
      label: 'Report a bug',
      screen: UnderConstructionScreen(),
    ),
  ];

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.pop(context); // Close drawer first
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  Widget _buildDrawerTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(
          icon,
          color: AppColors.onSurface(context).withValues(alpha: 0.7),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.onSurface(context),
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onTap: onTap,
        dense: true,
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  List<Widget> _buildDrawerItems(
    List<_DrawerItem> items,
    BuildContext context,
  ) {
    return items
        .map(
          (item) => _buildDrawerTile(
            context: context,
            icon: item.icon,
            title: item.label,
            onTap: () => _navigateToScreen(context, item.screen),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.midnight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Custom Header
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.accent(context).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.rowing_rounded,
                    color: AppColors.accent(context),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'RowUp',
                  style: TextStyle(
                    color: AppColors.onSurface(context),
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'Elite Rowing Tracker',
                  style: TextStyle(
                    color: AppColors.onSurface(context).withValues(alpha: 0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: AppColors.onSurface(context).withValues(alpha: 0.05),
            thickness: 2,
            indent: 24,
            endIndent: 24,
            height: 1,
          ),

          const SizedBox(height: 12),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ..._buildDrawerItems(_drawerTopItems, context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.onSurface(context).withValues(alpha: 0.05),
                    indent: 24,
                    endIndent: 24,
                  ),
                ),
                ..._buildDrawerItems(_drawerBottomItems, context),
              ],
            ),
          ),

          // Bottom section
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Currently in development',
              style: TextStyle(
                color: AppColors.onSurface(context).withValues(alpha: 0.3),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem {
  final IconData icon;
  final String label;
  final Widget screen;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
