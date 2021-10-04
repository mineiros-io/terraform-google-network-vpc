[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>][homepage]

[![Terraform Version][badge-terraform]][releases-terraform]
[![Google Provider Version][badge-tf-gcp]][releases-google-provider]
[![Join Slack][badge-slack]][slack]

# terraform-google-network-vpc

A [Terraform](https://www.terraform.io) module to create a [Google Network Vpc](https://cloud.google.com/compute/docs/reference/rest/v1/networks) on [Google Cloud Services (GCP)](https://cloud.google.com/).

**_This module supports Terraform version 1
and is compatible with the Terraform Google Provider version 3._**

This module is part of our Infrastructure as Code (IaC) framework
that enables our users and customers to easily deploy and manage reusable,
secure, and production-grade cloud infrastructure.

- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
  - [Top-level Arguments](#top-level-arguments)
    - [Module Configuration](#module-configuration)
    - [Main Resource Configuration](#main-resource-configuration)
    - [Extended Resource Configuration](#extended-resource-configuration)
- [Module Attributes Reference](#module-attributes-reference)
- [External Documentation](#external-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## Module Features

A [Terraform] base module for creating a `google_compute_network` resources required for building a VPC.

## Getting Started

Most basic usage just setting required arguments:

```hcl
module "terraform-google-network-vpc" {
  source = "github.com/mineiros-io/terraform-google-network-vpc.git?ref=v0.1.0"

  project = "example-project-id"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Top-level Arguments

#### Module Configuration

- **`module_enabled`**: _(Optional `bool`)_

  Specifies whether resources in the module will be created.
  Default is `true`.

- **`module_depends_on`**: _(Optional `list(dependencies)`)_

  A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.

  Example:
  ```hcl
  module_depends_on = [
    google_project.project_id
  ]
  ```

#### Main Resource Configuration

- **`project`**: **_(Required `string`)_**

  The ID of the project in which the resources belong.

- **`name`**: _(Optional `string`)_

  The name of the VPC. The name will be used to prefix all associacted resources also.

- **`description`**: _(Optional `string`)_

  An optional description of the VPC. The resource must be recreated to modify this field.

- **`routing_mode`**: _(Optional `string`)_

  The network-wide routing mode to use. If set to `REGIONAL`, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to `GLOBAL`, this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are `REGIONAL` and `GLOBAL`.
  Default is `REGIONAL`.

- **`delete_default_routes_on_create`**: _(Optional `bool`)_

  If set to `true`, ensure that all routes within the network specified whose names begin with `default-route` and with a next hop of `default-internet-gateway` are deleted.
  Default is `false`.

- **`auto_create_subnetworks`**: _(Optional `bool`)_

  When set to true, the network is created in auto subnet mode and it will create a subnet for each region automatically across the `10.128.0.0/9` address range. When set to `false`, the network is created in `custom subnet mode` so the user can explicitly connect subnetwork resources.
  Default is `false`.

- **`mtu`**: _(Optional `string`)_

  Maximum Transmission Unit in bytes. The minimum value for this field is `1460` and the maximum value is `1500` bytes.
  Default is `1460`.

#### Extended Resource Configuration

## Module Attributes Reference

The following attributes are exported in the outputs of the module:

- **`module_enabled`**

  Whether this module is enabled.

- **`vpc`**

  The outputs of the created VPC.

## External Documentation

- Google Documentation:
  - Networks: https://cloud.google.com/compute/docs/reference/rest/v1/networks

- Terraform Google Provider Documentation:
  - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## About Mineiros

[Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
that solves development, automation and security challenges in cloud infrastructure.

Our vision is to massively reduce time and overhead for teams to manage and
deploy production-grade and secure cloud infrastructure.

We offer commercial support for all of our modules and encourage you to reach out
if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
[Community Slack channel][slack].

## Reporting Issues

We use GitHub [Issues] to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].

## Makefile Targets

This repository comes with a handy [Makefile].
Run `make help` to see details on each available target.

## License

[![license][badge-license]][apache20]

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.

Copyright &copy; 2020-2021 [Mineiros GmbH][homepage]


<!-- References -->

[homepage]: https://mineiros.io/?ref=terraform-google-network-vpc
[hello@mineiros.io]: mailto:hello@mineiros.io

<!-- markdown-link-check-disable -->

[badge-build]: https://github.com/mineiros-io/terraform-google-network-vpc/workflows/Tests/badge.svg

<!-- markdown-link-check-enable -->

[badge-semver]: https://img.shields.io/github/v/tag/mineiros-io/terraform-module-template.svg?label=latest&sort=semver
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[badge-terraform]: https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform
[badge-slack]: https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack

<!-- markdown-link-check-disable -->

[build-status]: https://github.com/mineiros-io/terraform-google-network-vpc/actions
[releases-github]: https://github.com/mineiros-io/terraform-google-network-vpc/releases

<!-- markdown-link-check-enable -->

[releases-terraform]: https://github.com/hashicorp/terraform/releases
[badge-tf-gcp]: https://img.shields.io/badge/google-3.x-1A73E8.svg?logo=terraform
[releases-google-provider]: https://github.com/terraform-providers/terraform-provider-google/releases
[apache20]: https://opensource.org/licenses/Apache-2.0
[slack]: https://mineiros.io/slack
[terraform]: https://www.terraform.io
[gcp]: https://cloud.google.com/
[semantic versioning (semver)]: https://semver.org/

<!-- markdown-link-check-disable -->

[variables.tf]: https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/variables.tf
[examples/]: https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/examples
[issues]: https://github.com/mineiros-io/terraform-google-network-vpc/issues
[license]: https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/LICENSE
[makefile]: https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/Makefile
[pull requests]: https://github.com/mineiros-io/terraform-google-network-vpc/pulls
[contribution guidelines]: https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/CONTRIBUTING.md

<!-- markdown-link-check-enable -->
