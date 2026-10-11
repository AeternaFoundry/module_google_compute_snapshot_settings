output "compute_snapshot_settings_id" {
  description = "Map of id values across all compute_snapshot_settings, keyed the same as var.compute_snapshot_settings except keys with no id are omitted"
  value       = { for k, v in google_compute_snapshot_settings.compute_snapshot_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "compute_snapshot_settings_project" {
  description = "Map of project values across all compute_snapshot_settings, keyed the same as var.compute_snapshot_settings except keys with no project are omitted"
  value       = { for k, v in google_compute_snapshot_settings.compute_snapshot_settings : k => v.project if v.project != null && length(v.project) > 0 }
}
output "compute_snapshot_settings_storage_location" {
  description = "Map of storage_location values across all compute_snapshot_settings, keyed the same as var.compute_snapshot_settings except keys with no storage_location are omitted"
  value       = { for k, v in google_compute_snapshot_settings.compute_snapshot_settings : k => one(v.storage_location) if v.storage_location != null && length(v.storage_location) > 0 }
}

