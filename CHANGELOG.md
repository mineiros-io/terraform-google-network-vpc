# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0]

### Added

- Add optional variable `enable_ula_internal_ipv6`
- Add optional variable `internal_ipv6_range`

### Changed

- BREAKING: Changed minimum provider to `~>4.25`

## [0.1.0]

### Removed

- BREAKING: Remove support for Terraform versions before v1.0
- BREAKING: Remove support for Terraform Google Provider versions before v4.0
- BREAKING: Remove output `module_enabled`

### Changed

- Change variable `project` to optional instead of required

## [0.0.2]

### Added

- Support for provider 4.x

## [0.0.1]

### Added

- Initial Implementation

[unreleased]: https://github.com/mineiros-io/terraform-google-network-vpc/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/mineiros-io/terraform-google-network-vpc/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/mineiros-io/terraform-google-network-vpc/compare/v0.0.2...v0.1.0
[0.0.2]: https://github.com/mineiros-io/terraform-google-network-vpc/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/mineiros-io/terraform-google-network-vpc/releases/tag/v0.0.1
