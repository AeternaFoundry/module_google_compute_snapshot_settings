variable "compute_snapshot_settings" {
  description = <<EOT
Map of compute_snapshot_settings, attributes below
Required:
    - storage_location (block):
        - locations (optional, block):
            - location (required)
            - name (required)
        - policy (required)
Optional:
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    project = optional(string)
    storage_location = object({
      locations = optional(list(object({
        location = string
        name     = string
      })))
      policy = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

