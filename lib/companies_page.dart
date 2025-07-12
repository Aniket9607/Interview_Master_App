import 'package:flutter/material.dart';
import 'Company_code/google_company_page.dart';
import 'Company_code/amazon_company_page.dart';
import 'Company_code/apple_company_page.dart';
import 'Company_code/microsoft_company_page.dart';
import 'Company_code/meta_company_page.dart';
import 'Company_code/tesla_company_page.dart';
import 'Company_code/reliance_company_page.dart';
import 'Company_code/tcs_company_page.dart';
import 'Company_code/infosys_company_page.dart';
import 'Company_code/hdfc_bank_page.dart';
import 'Company_code/icici_bank_page.dart';
import 'Company_code/sbi_company_page.dart';
import 'Company_code/wipro_company_page.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({super.key});

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  final List<Map<String, String>> companies = const [
    {
      'name': 'Google',
      'industry': 'Technology',
      'image': 'https://logo.clearbit.com/google.com',
    },
    {
      'name': 'Amazon',
      'industry': 'E-commerce, Cloud',
      'image': 'https://logo.clearbit.com/amazon.com',
    },
    {
      'name': 'Apple Inc.',
      'industry': 'Technology',
      'image': 'https://logo.clearbit.com/apple.com',
    },
    {
      'name': 'Microsoft',
      'industry': 'Technology',
      'image': 'https://logo.clearbit.com/microsoft.com',
    },
    {
      'name': 'Meta Platforms',
      'industry': 'Social Media, Technology',
      'image': 'https://logo.clearbit.com/meta.com',
    },
    {
      'name': 'Tesla',
      'industry': 'Automotive, Energy',
      'image': 'https://logo.clearbit.com/tesla.com',
    },
    {
      'name': 'Reliance Industries',
      'industry': 'Conglomerate',
      'image': 'https://logo.clearbit.com/relianceindustries.com',
    },
    {
      'name': 'Tata Consultancy Services (TCS)',
      'industry': 'IT',
      'image': 'https://logo.clearbit.com/tcs.com',
    },
    {
      'name': 'Infosys',
      'industry': 'IT',
      'image': 'https://logo.clearbit.com/infosys.com',
    },
    {
      'name': 'HDFC Bank',
      'industry': 'Banking',
      'image': 'https://logo.clearbit.com/hdfcbank.com',
    },
    {
      'name': 'ICICI Bank',
      'industry': 'Banking',
      'image': 'https://logo.clearbit.com/icicibank.com',
    },
    {
      'name': 'State Bank of India (SBI)',
      'industry': 'Banking',
      'image': 'https://logo.clearbit.com/onlinesbi.com',
    },
    {
      'name': 'Wipro',
      'industry': 'IT',
      'image': 'https://logo.clearbit.com/wipro.com',
    },
  ];

  List<Map<String, String>> filteredCompanies = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCompanies = companies;
    _searchController.addListener(_filterCompanies);
  }

  void _filterCompanies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCompanies =
          companies.where((company) {
            final name = company['name']!.toLowerCase();
            final industry = company['industry']!.toLowerCase();
            return name.contains(query) || industry.contains(query);
          }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleCompanyTap(String name) {
    name = name.toLowerCase();

    if (name.contains('google')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GoogleCompanyPage()),
      );
    } else if (name.contains('amazon')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AmazonCompanyPage()),
      );
    } else if (name.contains('apple')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AppleCompanyPage()),
      );
    } else if (name.contains('microsoft')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MicrosoftCompanyPage()),
      );
    } else if (name.contains('meta')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MetaCompanyPage()),
      );
    } else if (name.contains('tesla')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TeslaCompanyPage()),
      );
    } else if (name.contains('reliance')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RelianceCompanyPage()),
      );
    } else if (name.contains('tcs')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TCSCompanyPage()),
      );
    } else if (name.contains('infosys')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InfosysCompanyPage()),
      );
    } else if (name.contains('hdfc')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HdfcBankPage()),
      );
    } else if (name.contains('icici')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ICICIBankPage()),
      );
    } else if (name.contains('state bank') || name.contains('sbi')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SBICompanyPage()),
      );
    } else if (name.contains('wipro')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WiproCompanyPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Details for this company are not available yet.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes back button
        title: const Text('Companies'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Companies...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCompanies.length,
              itemBuilder: (context, index) {
                final company = filteredCompanies[index];
                final imageUrl = company['image'];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            imageUrl != null ? NetworkImage(imageUrl) : null,
                        child:
                            imageUrl == null
                                ? const Icon(Icons.business, color: Colors.grey)
                                : null,
                      ),
                      title: Text(company['name']!),
                      subtitle: Text(company['industry']!),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => _handleCompanyTap(company['name']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
