import 'package:flutter/material.dart';

class DevOpsPage extends StatelessWidget {
  const DevOpsPage({super.key});

  final List<Map<String, String>> qaList = const [
    {
      'question': 'What is DevOps?',
      'answer':
          'DevOps is a set of practices that combines software development (Dev) and IT operations (Ops) to shorten the development lifecycle and provide continuous delivery with high software quality.',
    },
    {
      'question': 'What are the key principles of DevOps?',
      'answer':
          'Key principles include continuous integration, continuous delivery, automation, collaboration, monitoring, and feedback.',
    },
    {
      'question': 'What is CI/CD?',
      'answer':
          'CI/CD stands for Continuous Integration and Continuous Deployment/Delivery. It automates building, testing, and deploying code changes.',
    },
    {
      'question': 'What is Continuous Integration?',
      'answer':
          'Continuous Integration is the practice of automatically integrating code changes from multiple contributors into a shared repository several times a day.',
    },
    {
      'question': 'What is Continuous Deployment?',
      'answer':
          'Continuous Deployment is the process of automatically deploying every code change that passes testing to production.',
    },
    {
      'question': 'What is Infrastructure as Code (IaC)?',
      'answer':
          'IaC is the practice of managing and provisioning computing infrastructure through machine-readable definition files, rather than manual hardware configuration.',
    },
    {
      'question': 'What tools are used for IaC?',
      'answer':
          'Common IaC tools include Terraform, Ansible, Puppet, and Chef.',
    },
    {
      'question': 'What is the difference between Agile and DevOps?',
      'answer':
          'Agile focuses on iterative development and collaboration, while DevOps extends this to deployment and operations with automation and monitoring.',
    },
    {
      'question': 'What is a DevOps pipeline?',
      'answer':
          'A DevOps pipeline is a set of automated processes that allow developers and operations professionals to work together on software development and deployment.',
    },
    {
      'question': 'What is configuration management?',
      'answer':
          'Configuration management is the process of maintaining computer systems, servers, and software in a desired, consistent state.',
    },
    {
      'question': 'What is version control?',
      'answer':
          'Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later.',
    },
    {
      'question': 'What is Git?',
      'answer':
          'Git is a distributed version control system commonly used for source code management.',
    },
    {
      'question': 'What is a container?',
      'answer':
          'A container is a lightweight, standalone, executable package that includes everything needed to run a piece of software.',
    },
    {
      'question': 'What is Docker?',
      'answer':
          'Docker is a platform used to develop, ship, and run applications inside containers.',
    },
    {
      'question': 'What is Kubernetes?',
      'answer':
          'Kubernetes is an open-source container orchestration system for automating deployment, scaling, and management of containerized applications.',
    },
    {
      'question': 'What are microservices?',
      'answer':
          'Microservices are a software architecture style where an application is composed of small, independent services that communicate over well-defined APIs.',
    },
    {
      'question': 'What is monitoring in DevOps?',
      'answer':
          'Monitoring involves observing the system’s performance and availability, and alerting on anomalies to ensure reliability.',
    },
    {
      'question': 'What is logging in DevOps?',
      'answer':
          'Logging captures information about system events and errors to help with debugging and auditing.',
    },
    {
      'question': 'What is Blue-Green Deployment?',
      'answer':
          'Blue-Green Deployment is a strategy that reduces downtime and risk by running two identical production environments.',
    },
    {
      'question': 'What is a rollback?',
      'answer':
          'A rollback is reverting an application to a previous stable version in case of a failed deployment.',
    },
    {
      'question': 'What is the role of automation in DevOps?',
      'answer':
          'Automation helps reduce manual errors, increases speed, and allows for consistent and repeatable processes in software delivery.',
    },
    {
      'question': 'What is a build tool?',
      'answer':
          'A build tool automates the creation of executable applications from source code, like Maven, Gradle, or Ant.',
    },
    {
      'question': 'What is a release management?',
      'answer':
          'Release management is the process of managing, planning, scheduling, and controlling software builds through different stages and environments.',
    },
    {
      'question': 'What are some DevOps tools?',
      'answer':
          'Popular tools include Jenkins, Git, Docker, Kubernetes, Ansible, Terraform, Prometheus, and ELK Stack.',
    },
    {
      'question': 'What is Jenkins?',
      'answer':
          'Jenkins is an open-source automation server used for building, testing, and deploying code continuously.',
    },
    {
      'question': 'What is Ansible?',
      'answer':
          'Ansible is a configuration management tool that automates software provisioning, configuration management, and application deployment.',
    },
    {
      'question': 'What is Prometheus?',
      'answer':
          'Prometheus is an open-source monitoring system with a dimensional data model and a powerful query language.',
    },
    {
      'question': 'What is ELK Stack?',
      'answer':
          'ELK Stack is a collection of Elasticsearch, Logstash, and Kibana used for searching, analyzing, and visualizing log data in real time.',
    },
    {
      'question': 'What is load balancing?',
      'answer':
          'Load balancing is the process of distributing network traffic across multiple servers to ensure reliability and performance.',
    },
    {
      'question': 'What is fault tolerance?',
      'answer':
          'Fault tolerance is the ability of a system to continue operating properly in the event of the failure of some of its components.',
    },
    {
      'question': 'What is high availability?',
      'answer':
          'High availability refers to systems that are durable and likely to operate continuously without failure for a long time.',
    },
    {
      'question': 'What is canary deployment?',
      'answer':
          'Canary deployment releases a new version to a small subset of users before rolling it out to the entire infrastructure.',
    },
    {
      'question': 'What is a service mesh?',
      'answer':
          'A service mesh is a dedicated infrastructure layer that controls service-to-service communication over a network.',
    },
    {
      'question': 'What is site reliability engineering (SRE)?',
      'answer':
          'SRE is a discipline that incorporates aspects of software engineering and applies them to infrastructure and operations problems.',
    },
    {
      'question': 'What is a runbook?',
      'answer':
          'A runbook is a compilation of routine procedures and operations that system administrators or operators carry out.',
    },
    {
      'question': 'What is an incident response?',
      'answer':
          'Incident response is the process of handling and mitigating the effects of an unexpected service disruption or degradation.',
    },
    {
      'question': 'What is the role of cloud in DevOps?',
      'answer':
          'Cloud platforms provide scalability, availability, and tools that support DevOps practices such as CI/CD and IaC.',
    },
    {
      'question': 'What is artifact repository?',
      'answer':
          'An artifact repository is a storage location for binary artifacts and metadata generated and used in the development process.',
    },
    {
      'question': 'What is DevSecOps?',
      'answer':
          'DevSecOps is the practice of integrating security practices within the DevOps process to ensure security is a shared responsibility.',
    },
    {
      'question': 'What is shift-left testing?',
      'answer':
          'Shift-left testing involves performing testing earlier in the software development lifecycle to find and fix bugs sooner.',
    },
    {
      'question': 'What is immutable infrastructure?',
      'answer':
          'Immutable infrastructure means once a server is deployed, it is never modified, and changes are made by replacing with a new version.',
    },
    {
      'question': 'What are the benefits of DevOps?',
      'answer':
          'Benefits include faster delivery, better collaboration, reduced failure rate, quicker recovery, and improved product quality.',
    },
    {
      'question': 'What is latency in DevOps context?',
      'answer':
          'Latency is the delay before a transfer of data begins following an instruction, which can affect system performance.',
    },
    {
      'question': 'What is scalability in DevOps?',
      'answer':
          'Scalability is the ability of a system to handle increased workload by adding resources.',
    },
    {
      'question': 'What is a playbook in Ansible?',
      'answer':
          'A playbook in Ansible is a YAML file that defines a set of tasks to be executed on remote systems.',
    },
    {
      'question': 'What is horizontal scaling?',
      'answer':
          'Horizontal scaling involves adding more servers to handle increased load, as opposed to vertical scaling which adds more power to existing machines.',
    },
    {
      'question': 'What is vertical scaling?',
      'answer':
          'Vertical scaling means increasing the capacity of a single server or node, like adding more CPU or RAM.',
    },
    {
      'question': 'What is a webhook?',
      'answer':
          'A webhook is a user-defined callback that triggers an action when a specific event occurs, commonly used in CI/CD pipelines.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DevOps Questions')),
      body: ListView.builder(
        itemCount: qaList.length,
        itemBuilder: (context, index) {
          final qa = qaList[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: Text(
                  qa['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      qa['answer'] ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
