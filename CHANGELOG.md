# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog],
and this project adheres to [Semantic Versioning].

## [2.0.0] - 2025-05-29

### Removed
- route53 resources are removed from email_recieving

## [1.0.0] - 2025-05-26

### Added

- data source to obtain dns zone id

### Removed

- IAM User creation
- variable to pass zone_id

## [0.2.1] - 2024-12-15

### Fixed

- variable type of dns_records

## [0.2.0] - 2024-12-15

### Added

- DNS records required for email recieving

## [0.1.0] - 2024-12-14

### Added

- New feature: email sending rules

## [0.0.3] - 2024-11-30

### Fixed

- IAM user access key was missing

## [0.0.2] - 2024-11-30

### Fixed

- variables reference errors

## [0.0.1] - 2024-11-30

- initial release

<!-- Links -->

[keep a changelog]: https://keepachangelog.com/en/1.0.0/
[semantic versioning]: https://semver.org/spec/v2.0.0.html

<!-- Versions -->
<!-- [unreleased]: https://github.com/Author/Repository/compare/v0.0.2...HEAD -->

[0.2.1]: https://gitlab.angrybits.pl/aws-services/terraform-modules/ses/-/compare/0.2.0...0.2.1?from_project_id=63&straight=false
[0.2.0]: https://gitlab.angrybits.pl/aws-services/terraform-modules/ses/-/compare/0.1.0...0.2.0?from_project_id=63&straight=false
[0.1.0]: https://gitlab.angrybits.pl/aws-services/terraform-modules/ses/-/compare/0.0.3...0.1.0?from_project_id=63&straight=false
[0.0.3]: https://gitlab.angrybits.pl/aws-services/terraform-modules/ses/-/compare/0.0.2...0.0.3?from_project_id=63&straight=false
[0.0.2]: https://gitlab.angrybits.pl/aws-services/terraform-modules/ses/-/compare/0.0.1...0.0.2?from_project_id=63&straight=false
[0.0.1]: https://gitlab.angrybits.pl/aws-services/terraform-modules/ses/-/tags/0.0.1
