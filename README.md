# AWS Route53 Basic Zone Records with Office 365

This is just a simple Terraform module which populates a given Route53 zone with
some basic records, including Office 365 records.

## Input Variables

- `zone_id`
    - Required.
    - ID of the Route53 zone.

- `domain_name`
    - Required.
    - Domain name.

- `root_ip`
    - Required.
    - IP to set as the root A record.

- `mx_records`
    - Optional.
    - MX records for the domain.
