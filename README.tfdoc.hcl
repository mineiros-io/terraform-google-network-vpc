header {
  image = "https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg"
  url   = "https://mineiros.io/?ref=terraform-google-network-vpc"

  badge "build" {
    image = "https://github.com/mineiros-io/terraform-google-network-vpc/workflows/Tests/badge.svg"
    url   = "https://github.com/mineiros-io/terraform-google-network-vpc/actions"
    text  = "Build Status"
  }

  badge "semver" {
    image = "https://img.shields.io/github/v/tag/mineiros-io/terraform-google-network-vpc.svg?label=latest&sort=semver"
    url   = "https://github.com/mineiros-io/terraform-google-network-vpc/releases"
    text  = "GitHub tag (latest SemVer)"
  }

  badge "terraform" {
    image = "https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform"
    url   = "https://github.com/hashicorp/terraform/releases"
    text  = "Terraform Version"
  }

  badge "tf-gcp-provider" {
    image = "https://img.shields.io/badge/google-4-1A73E8.svg?logo=terraform"
    url   = "https://github.com/terraform-providers/terraform-provider-google/releases"
    text  = "Google Provider Version"
  }

  badge "slack" {
    image = "https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack"
    url   = "https://mineiros.io/slack"
    text  = "Join Slack"
  }
}

section {
  title   = "terraform-google-network-vpc"
  toc     = true
  content = <<-END
    A [Terraform](https://www.terraform.io) module to create a [Google Network Vpc](https://cloud.google.com/compute/docs/reference/rest/v1/networks) on [Google Cloud Services (GCP)](https://cloud.google.com/).

    **_This module supports Terraform version 1
    and is compatible with the Terraform Google Provider version 3._**

    This module is part of our Infrastructure as Code (IaC) framework
    that enables our users and customers to easily deploy and manage reusable,
    secure, and production-grade cloud infrastructure.
  END

  section {
    title   = "Module Features"
    content = <<-END
      A [Terraform] base module for creating a `google_compute_network` resources required for building a VPC.
    END
  }

  section {
    title   = "Getting Started"
    content = <<-END
      Most basic usage just setting required arguments:

      ```hcl
      module "terraform-google-network-vpc" {
        source = "github.com/mineiros-io/terraform-google-network-vpc.git?ref=v0.1.0"

        project = "example-project-id"
      }
      ```
    END
  }

  section {
    title   = "Module Argument Reference"
    content = <<-END
      See [variables.tf] and [examples/] for details and use-cases.
    END

    section {
      title = "Top-level Arguments"

      section {
        title = "Module Configuration"

        variable "module_enabled" {
          type        = bool
          default     = true
          description = <<-END
            Specifies whether resources in the module will be created.
          END
        }

        variable "module_depends_on" {
          type           = any
          readme_type    = "list(dependencies)"
          description    = <<-END
            A list of dependencies. Any object can be _assigned_ to this list to define a hidden external dependency.
          END
          readme_example = <<-END
            module_depends_on = [
              google_project.project_id
            ]
          END
        }
      }

      section {
        title = "Main Resource Configuration"

        variable "project" {
          required    = true
          type        = string
          description = <<-END
            The ID of the project in which the resources belong.
          END
        }

        variable "name" {
          type        = string
          description = <<-END
            The name of the VPC. The name will be used to prefix all associacted resources also.
          END
        }

        variable "description" {
          type        = string
          description = <<-END
            An optional description of the VPC. The resource must be recreated to modify this field.
          END
        }

        variable "routing_mode" {
          type        = string
          default     = "REGIONAL"
          description = <<-END
            The network-wide routing mode to use. If set to `REGIONAL`, this network's cloud routers will only advertise routes with subnetworks of this network in the same region as the router. If set to `GLOBAL`, this network's cloud routers will advertise routes with all subnetworks of this network, across regions. Possible values are `REGIONAL` and `GLOBAL`.
          END
        }

        variable "delete_default_routes_on_create" {
          type        = bool
          default     = false
          description = <<-END
            If set to `true`, ensure that all routes within the network specified whose names begin with `default-route` and with a next hop of `default-internet-gateway` are deleted.
          END
        }

        variable "auto_create_subnetworks" {
          type        = bool
          default     = false
          description = <<-END
            When set to true, the network is created in auto subnet mode and it will create a subnet for each region automatically across the `10.128.0.0/9` address range. When set to `false`, the network is created in `custom subnet mode` so the user can explicitly connect subnetwork resources.
          END
        }

        variable "mtu" {
          type        = string
          default     = "1460"
          description = <<-END
            Maximum Transmission Unit in bytes. The minimum value for this field is `1460` and the maximum value is `1500` bytes.
          END
        }
      }
    }
  }

  section {
    title   = "Module Outputs"
    content = <<-END
      The following attributes are exported in the outputs of the module:

      - **`module_enabled`**

        Whether this module is enabled.

      - **`vpc`**

        The outputs of the created VPC.
    END
  }

  section {
    title = "External Documentation"

    section {
      title   = "Google Documentation"
      content = <<-END
        - https://cloud.google.com/compute/docs/reference/rest/v1/networks
      END
    }

    section {
      title   = "Terraform Google Provider Documentation"
      content = <<-END
        - https : //registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
      END
    }
  }

  section {
    title   = "Module Versioning"
    content = <<-END
      This Module follows the principles of [Semantic Versioning (SemVer)].

      Given a version number `MAJOR.MINOR.PATCH`, we increment the:

      1. `MAJOR` version when we make incompatible changes,
      2. `MINOR` version when we add functionality in a backwards compatible manner, and
      3. `PATCH` version when we make backwards compatible bug fixes.
    END

    section {
      title   = "Backwards compatibility in `0.0.z` and `0.y.z` version"
      content = <<-END
        - Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
        - Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)
      END
    }
  }

  section {
    title   = "About Mineiros"
    content = <<-END
      [Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
      that solves development, automation and security challenges in cloud infrastructure.

      Our vision is to massively reduce time and overhead for teams to manage and
      deploy production-grade and secure cloud infrastructure.

      We offer commercial support for all of our modules and encourage you to reach out
      if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
      [Community Slack channel][slack].
    END
  }

  section {
    title   = "Reporting Issues"
    content = <<-END
      We use GitHub [Issues] to track community reported issues and missing features.
    END
  }

  section {
    title   = "Contributing"
    content = <<-END
      Contributions are always encouraged and welcome! For the process of accepting changes, we use
      [Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].
    END
  }

  section {
    title   = "Makefile Targets"
    content = <<-END
      This repository comes with a handy [Makefile].
      Run `make help` to see details on each available target.
    END
  }

  section {
    title   = "License"
    content = <<-END
      [![license][badge-license]][apache20]

      This module is licensed under the Apache License Version 2.0, January 2004.
      Please see [LICENSE] for full details.

      Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]
    END
  }
}

references {
  ref "homepage" {
    value = "https://mineiros.io/?ref=terraform-google-network-vpc"
  }
  ref "hello@mineiros.io" {
    value = "mailto:hello@mineiros.io"
  }
  ref "badge-build" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/workflows/Tests/badge.svg"
  }
  ref "badge-semver" {
    value = "https://img.shields.io/github/v/tag/mineiros-io/terraform-google-network-vpc.svg?label=latest&sort=semver"
  }
  ref "badge-license" {
    value = "https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg"
  }
  ref "badge-terraform" {
    value = "https://img.shields.io/badge/Terraform-1.x-623CE4.svg?logo=terraform"
  }
  ref "badge-slack" {
    value = "https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack"
  }
  ref "build-status" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/actions"
  }
  ref "releases-github" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/releases"
  }
  ref "releases-terraform" {
    value = "https://github.com/hashicorp/terraform/releases"
  }
  ref "badge-tf-gcp" {
    value = "https://img.shields.io/badge/google-3.x-1A73E8.svg?logo=terraform"
  }
  ref "releases-google-provider" {
    value = "https://github.com/terraform-providers/terraform-provider-google/releases"
  }
  ref "apache20" {
    value = "https://opensource.org/licenses/Apache-2.0"
  }
  ref "slack" {
    value = "https://mineiros.io/slack"
  }
  ref "terraform" {
    value = "https://www.terraform.io"
  }
  ref "gcp" {
    value = "https://cloud.google.com/"
  }
  ref "semantic versioning (semver)" {
    value = "https://semver.org/"
  }
  ref "variables.tf" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/variables.tf"
  }
  ref "examples/" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/examples"
  }
  ref "issues" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/issues"
  }
  ref "license" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/LICENSE"
  }
  ref "makefile" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/Makefile"
  }
  ref "pull requests" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/pulls"
  }
  ref "contribution guidelines" {
    value = "https://github.com/mineiros-io/terraform-google-network-vpc/blob/main/CONTRIBUTING.md"
  }
}
