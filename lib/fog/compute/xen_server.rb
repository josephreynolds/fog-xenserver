require 'fog/core'

module Fog
  module Compute
    class XenServer < Fog::Service
      autoload :Models, 'fog/compute/xen_server/models'
      autoload :Real, 'fog/compute/xen_server/real'
      autoload :Mock, 'fog/compute/xen_server/mock'

      requires :xenserver_username
      requires :xenserver_password
      requires :xenserver_url
      recognizes :xenserver_defaults
      recognizes :xenserver_timeout

      model_path 'fog/compute/xen_server/models'
      model :blob
      collection :blobs
      model :bond
      collection :bonds
      model :console
      collection :consoles
      model :crash_dump
      collection :crash_dumps
      model :dr_task
      collection :dr_tasks
      model :gpu_group
      collection :gpu_groups
      model :guest_metrics
      collection :guests_metrics
      model :host
      collection :hosts
      model :host_cpu
      collection :host_cpus
      model :host_crash_dump
      collection :host_crash_dumps
      model :host_metrics
      collection :hosts_metrics
      model :host_patch
      collection :host_patchs
      model :network
      collection :networks
      model :pbd
      collection :pbds
      model :pci
      collection :pcis
      model :pgpu
      collection :pgpus
      model :pif
      collection :pifs
      model :pif_metrics
      collection :pifs_metrics
      model :pool
      collection :pools
      model :pool_patch
      collection :pool_patchs
      model :role
      collection :roles
      model :server
      collection :servers
      model :server_appliance
      collection :server_appliances
      model :server_metrics
      collection :servers_metrics
      model :storage_manager
      collection :storage_managers
      model :storage_repository
      collection :storage_repositories
      model :tunnel
      collection :tunnels
      model :vbd
      collection :vbds
      model :vbd_metrics
      collection :vbds_metrics
      model :vdi
      collection :vdis
      model :vif
      collection :vifs
      model :vif_metrics
      collection :vifs_metrics
      model :vlan
      collection :vlans
      model :vmpp
      collection :vmpps
      model :vtpm
      collection :vtpms

      request_path 'fog/compute/xen_server/requests'
      # host
      request :apply_edition_host
      request :assert_can_evacuate_host
      request :backup_rrds_host
      request :bugreport_upload_host
      request :call_plugin_host
      request :compute_free_memory_host
      request :compute_memory_overhead_host
      request :create_new_blob_host
      request :declare_dead_host
      request :destroy_host
      request :disable_external_auth_host
      request :disable_host
      request :disable_local_storage_caching_host
      request :dmesg_clear_host
      request :dmesg_host
      request :emergency_ha_disable_host
      request :enable_external_auth_host
      request :enable_host
      request :enable_local_storage_caching_host
      request :evacuate_host
      request :forget_data_source_archives_host
      request :get_data_sources_host
      request :get_log_host
      request :get_management_interface_host
      request :get_server_certificate_host
      request :get_server_localtime_host
      request :get_servertime_host
      request :get_system_status_capabilities_host
      request :get_vms_which_prevent_evacuation_host
      request :list_methods_host
      request :local_management_reconfigure_host
      request :management_disable_host
      request :management_reconfigure_host
      request :migrate_receive_host
      request :power_on_host
      request :query_data_source_host
      request :reboot_host
      request :record_data_source_host
      request :refresh_pack_info_host
      request :reset_cpu_features_host
      request :restart_agent_host
      request :send_debug_keys_host
      request :set_cpu_features_host
      request :set_hostname_live_host
      request :set_power_on_mode_host
      request :shutdown_agent_host
      request :shutdown_host
      request :sync_data_host

      # network
      request :create_new_blob_network
      request :set_default_locking_mode_network
      
      # PBD
      request :plug_pbd
      request :set_device_config_pbd
      request :unplug_pbd

      # PIF
      request :db_forget_pif
      request :db_introduce_pif
      request :forget_pif
      request :introduce_pif
      request :plug_pif
      request :reconfigure_ip_pif
      request :reconfigure_ipv6_pif
      request :scan_pif
      request :set_primary_address_type_pif
      
      # pool
      request :apply_edition_pool
      request :certificate_install_pool
      request :certificate_list_pool
      request :certificate_sync_pool
      request :certificate_uninstall_pool
      request :create_new_blob_pool
      request :create_vlan_from_pif_pool
      request :create_vlan_pool
      request :crl_install_pool
      request :crl_list_pool
      request :crl_uninstall_pool
      request :designate_new_master_pool
      request :detect_nonhomogeneous_external_auth_pool
      request :disable_external_auth_pool
      request :disable_ha_pool
      request :disable_local_storage_caching_pool
      request :disable_redo_log_pool
      request :eject_pool
      request :emergency_reset_master_pool
      request :emergency_transition_to_master_pool
      request :enable_external_auth_pool
      request :enable_ha_pool
      request :enable_local_storage_caching_pool
      request :enable_redo_log_pool
      request :get_license_state_pool
      request :ha_compute_hypothetical_max_host_failures_to_tolerate_pool
      request :ha_compute_max_host_failures_to_tolerate_pool
      request :ha_compute_vm_failover_plan_pool
      request :ha_failover_plan_exists_pool
      request :ha_prevent_restarts_for_pool
      request :join_force_pool
      request :join_pool
      request :recover_slaves_pool
      request :send_test_post_pool
      request :set_ha_host_failures_to_tolerate_pool
      request :set_vswitch_controller_pool
      request :sync_database_pool

      # VBD
      request :assert_attachable_vbd
      request :eject_vbd
      request :insert_vbd
      request :plug_vbd
      request :unplug_force_vbd
      request :unplug_vbd

      # VDI
      request :clone_vdi
      request :copy_vdi
      request :db_forget_vdi
      request :db_introduce_vdi
      request :forget_vdi
      request :introduce_vdi
      request :open_database_vdi
      request :pool_migrate_vdi
      request :read_database_pool_uuid_vdi
      request :resize_online_vdi
      request :resize_vdi
      request :set_allow_caching_vdi
      request :set_is_a_snapshot_vdi
      request :set_managed_vdi
      request :set_metadata_of_pool_vdi
      request :set_missing_vdi
      request :set_name_description_vdi
      request :set_name_label_vdi
      request :set_on_boot_vdi
      request :set_physical_utilisation_vdi
      request :set_read_only_vdi
      request :set_sharable_vdi
      request :set_snapshot_of_vdi
      request :set_snapshot_time_vdi
      request :set_virtual_size_vdi
      request :snapshot_vdi
      request :update_vdi

      # VIF
      request :add_ipv4_allowed_vif
      request :add_ipv6_allowed_vif
      request :plug_vif
      request :remove_ipv4_allowed_vif
      request :remove_ipv6_allowed_vif
      request :set_ipv4_allowed_vif
      request :set_ipv6_allowed_vif
      request :set_locking_mode_vif
      request :unplug_vif

      # VM
      request :add_to_vcpus_params_live_server
      request :assert_agile_server
      request :assert_can_be_recovered_server
      request :assert_can_boot_here_server
      request :assert_can_migrate_server
      request :assert_operation_valid_server
      request :checkpoint_server
      request :clean_reboot_server
      request :clean_shutdown_server
      request :clone_server
      request :compute_memory_overhead_server
      request :copy_bios_strings_server
      request :copy_server
      request :create_new_blob_server
      request :create_server
      request :forget_data_source_archives_server
      request :get_allowed_vbd_devices_server
      request :get_allowed_vif_devices_server
      request :get_boot_record_server
      request :get_data_sources_server
      request :get_possible_hosts_server
      request :hard_reboot_server
      request :hard_shutdown_server
      request :import_convert_server
      request :maximise_memory_server
      request :migrate_send_server
      request :pause_server
      request :pool_migrate_server
      request :power_state_reset_server
      request :provision_server
      request :query_data_source_server
      request :query_services_server
      request :record_data_source_server
      request :recover_server
      request :resume_on_server
      request :resume_server
      request :revert_server
      request :send_sysrq_server
      request :send_trigger_server
      request :set_appliance_server
      request :set_ha_restart_priority_server
      request :set_hvm_shadow_multiplier_server
      request :set_memory_dynamic_max_server
      request :set_memory_dynamic_min_server
      request :set_memory_dynamic_range_server
      request :set_memory_limits_server
      request :set_memory_static_max_server
      request :set_memory_static_min_server
      request :set_memory_static_range_server
      request :set_order_server
      request :set_protection_policy_server
      request :set_shadow_multiplier_live_server
      request :set_shutdown_delay_server
      request :set_start_delay_server
      request :set_suspend_vdi_server
      request :set_vcpus_at_startup_server
      request :set_vcpus_max_server
      request :set_vcpus_number_live_server
      request :shutdown_server
      request :snapshot_server
      request :snapshot_with_quiesce_server
      request :start_on_server
      request :start_server
      request :suspend_server
      request :unpause_server
      
      # SR
      request :assert_can_host_ha_statefile_sr
      request :assert_supports_database_replication_sr
      request :create_new_blob_sr
      request :create_sr
      request :destroy_sr
      request :disable_database_replication_sr
      request :enable_database_replication_sr
      request :forget_sr
      request :get_supported_types_sr
      request :introduce_sr
      request :probe_sr
      request :scan_sr
      request :set_name_description_sr
      request :set_name_label_sr
      request :set_physical_size_sr
      request :set_physical_utilisation_sr
      request :set_shared_sr
      request :set_virtual_allocation_sr
      request :update_sr

      # Other
      request :builtin_templates
      request :create_network
      request :create_vlan
      request :create_vif
      request :create_vdi
      request :create_vbd
      request :custom_templates
      request :destroy_record
      request :disable_host
      request :enable_host
      request :get_record
      request :get_records
      request :set_affinity
      request :set_attribute
      request :snapshots
      request :templates

      def self.const_missing(name)
        Models.const_get(name)
      end
    end
  end
end