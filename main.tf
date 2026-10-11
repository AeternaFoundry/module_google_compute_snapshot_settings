resource "google_compute_snapshot_settings" "compute_snapshot_settings" {
  for_each = var.compute_snapshot_settings

  project = each.value.project

  storage_location {
    dynamic "locations" {
      for_each = each.value.storage_location.locations != null ? each.value.storage_location.locations : []
      content {
        location = locations.value.location
        name     = locations.value.name
      }
    }
    policy = each.value.storage_location.policy
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

