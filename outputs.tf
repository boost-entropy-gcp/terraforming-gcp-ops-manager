output "service_account_email" {
  value = google_service_account.opsman_service_account.email
}

output "ops_manager_dns" {
  value = google_dns_record_set.ops-manager-dns.name
}

output "optional_ops_manager_dns" {
  value = element(
    concat(google_dns_record_set.optional-ops-manager-dns.*.name, [""]),
    0,
  )
}

output "sys_domain" {
  value = "sys.${var.env_name}.${var.dns_suffix}"
}

output "apps_domain" {
  value = "apps.${var.env_name}.${var.dns_suffix}"
}

output "tcp_domain" {
  value = "tcp.${var.env_name}.${var.dns_suffix}"
}

output "ops_manager_public_ip" {
  value = google_compute_address.ops-manager-ip.address
}

output "optional_ops_manager_public_ip" {
  value = element(
    concat(
      google_compute_address.optional-ops-manager-ip.*.address,
      [""],
    ),
    0,
  )
}

output "env_dns_zone_name_servers" {
  value = google_dns_managed_zone.env_dns_zone.name_servers
}

output "project" {
  value = var.project
}

output "region" {
  value = var.region
}

output "azs" {
  value = var.zones
}

output "vm_tag" {
  value = "${var.env_name}-vms"
}

output "network_name" {
  value = google_compute_network.pcf-network.name
}

output "management_subnet_gateway" {
  value = google_compute_subnetwork.management-subnet.gateway_address
}

output "management_subnet_cidrs" {
  value = [google_compute_subnetwork.management-subnet.ip_cidr_range]
}

output "management_subnet_name" {
  value = google_compute_subnetwork.management-subnet.name
}

output "pas_subnet_gateway" {
  value = google_compute_subnetwork.pas-subnet.gateway_address
}

output "pas_subnet_cidrs" {
  value = [google_compute_subnetwork.pas-subnet.ip_cidr_range]
}

output "pas_subnet_name" {
  value = google_compute_subnetwork.pas-subnet.name
}

output "services_subnet_gateway" {
  value = google_compute_subnetwork.services-subnet.gateway_address
}

output "services_subnet_cidrs" {
  value = [google_compute_subnetwork.services-subnet.ip_cidr_range]
}

output "services_subnet_name" {
  value = google_compute_subnetwork.services-subnet.name
}

output "http_lb_backend_name" {
  value = google_compute_backend_service.http_lb_backend_service.name
}

output "ws_router_pool" {
  value = google_compute_target_pool.cf-ws.name
}

output "ssh_router_pool" {
  value = google_compute_target_pool.cf-ssh.name
}

output "tcp_router_pool" {
  value = google_compute_target_pool.cf-tcp.name
}

output "buildpacks_bucket" {
  value = google_storage_bucket.buildpacks[0].name
}

output "droplets_bucket" {
  value = google_storage_bucket.droplets[0].name
}

output "packages_bucket" {
  value = google_storage_bucket.packages[0].name
}

output "resources_bucket" {
  value = google_storage_bucket.resources[0].name
}

output "director_blobstore_bucket" {
  value = element(concat(google_storage_bucket.director.*.name, [""]), 0)
}

output "ops_manager_ssh_private_key" {
  sensitive = true
  value     = tls_private_key.ops-manager.private_key_pem
}

output "ops_manager_ssh_public_key" {
  sensitive = true
  value     = format("ubuntu:%s", tls_private_key.ops-manager.public_key_openssh)
}

output "cf_ws_address" {
  value = google_compute_address.cf-ws.address
}

output "dns_managed_zone" {
  value = google_dns_managed_zone.env_dns_zone.name
}

