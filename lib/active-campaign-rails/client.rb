module Client
  # List for all Active Campaign API and their method
  # For more information visit http://www.activecampaign.com/api/overview.php
  # TODO: Refactor this!
  #       Need best practice to grouping APIs
  def action_calls
    api_list = {
      # Account View
      account_view: { method: 'get' },

      # Automation
      automation_contact_add: { method: 'post' },
      automation_contact_list: { method: 'get' },
      automation_contact_remove: { method: 'post' },
      automation_contact_view: { method: 'get' },
      automation_list: { method: 'get' },

      # Branding
      branding_edit: { method: 'post' },
      branding_view: { method: 'get' },

      # Campaign
      campaign_create: { method: 'post' },
      campaign_delete: { method: 'post' },
      campaign_delete_list: { method: 'post' },
      campaign_list: { method: 'get' },
      campaign_paginator: { method: 'get' },
      campaign_report_bounce_list: { method: 'get' },
      campaign_report_bounce_totals: { method: 'get' },
      campaign_report_forward_list: { method: 'get' },
      campaign_report_forward_totals: { method: 'get' },
      campaign_report_link_list: { method: 'get' },
      campaign_report_link_totals: { method: 'get' },
      campaign_report_open_list: { method: 'get' },
      campaign_report_open_totals: { method: 'get' },
      campaign_report_totals: { method: 'get' },
      campaign_report_unopen_list: { method: 'get' },
      campaign_report_unsubscription_list: { method: 'get' },
      campaign_report_unsubscription_totals: { method: 'get' },
      campaign_send: { method: 'post' },
      campaign_status: { method: 'get' },

      # Contact
      contact_add: { method: 'post' },
      contact_automation_list: { method: 'get' },
      contact_delete: { method: 'post' },
      contact_delete_list: { method: 'post' },
      contact_edit: { method: 'post' },
      contact_list: { method: 'get' },
      contact_note_add: { method: 'post' },
      contact_note_delete: { method: 'post' },
      contact_note_edit: { method: 'post' },
      contact_paginator: { method: 'get' },
      contact_sync: { method: 'post' },
      contact_tag_add: { method: 'post' },
      contact_tag_remove: { method: 'post' },
      contact_view: { method: 'get' },
      contact_view_email: { method: 'get' },
      contact_view_hash: { method: 'get' },

      # Deal
      deal_add: { method: 'post' },
      deal_delete: { method: 'post' },
      deal_edit: { method: 'post' },
      deal_get: { method: 'get' },
      deal_list: { method: 'get' },
      deal_note_add: { method: 'post' },
      deal_note_edit: { method: 'post' },
      deal_pipeline_add: { method: 'post' },
      deal_pipeline_delete: { method: 'post' },
      deal_pipeline_edit: { method: 'post' },
      deal_pipeline_list: { method: 'get' },
      deal_stage_add: { method: 'post' },
      deal_stage_delete: { method: 'post' },
      deal_stage_edit: { method: 'post' },
      deal_stage_list: { method: 'get' },
      deal_task_add: { method: 'post' },
      deal_task_edit: { method: 'post' },
      deal_tasktype_add: { method: 'post' },
      deal_tasktype_delete: { method: 'post' },
      deal_tasktype_edit: { method: 'post' },

      # Form
      form_getforms: { method: 'get' },
      form_html: { method: 'get' },

      # Group
      group_add: { method: 'post' },
      group_delete: { method: 'post' },
      group_delete_list: { method: 'post' },
      group_edit: { method: 'post' },
      group_list: { method: 'get' },
      group_view: { method: 'get' },

      # List
      list_add: { method: 'post' },
      list_delete: { method: 'post' },
      list_delete_list: { method: 'post' },
      list_edit: { method: 'post' },
      list_field_add: { method: 'post' },
      list_field_delete: { method: 'post' },
      list_field_edit: { method: 'post' },
      list_field_view: { method: 'get' },
      list_list: { method: 'get' },
      list_paginator: { method: 'get' },
      list_view: { method: 'get' },

      # Message
      message_add: { method: 'post' },
      message_delete: { method: 'post' },
      message_delete_list: { method: 'post' },
      message_edit: { method: 'post' },
      message_list: { method: 'get' },
      message_template_add: { method: 'post' },
      message_template_delete: { method: 'post' },
      message_template_delete_list: { method: 'post' },
      message_template_edit: { method: 'post' },
      message_template_export: { method: 'get' },
      message_template_import: { method: 'get' },
      message_template_list: { method: 'get' },
      message_template_view: { method: 'get' },
      message_view: { method: 'get' },

      # Organization
      organization_list: { method: 'get' },

      # Settings
      settings_edit: { method: 'post' },

      # Single Sign On
      # singlesignon: { method: 'get' },

      # Site & Event Tracking
      track_event_delete: { method: 'post' },
      track_event_list: { method: 'get' },
      track_event_status_edit: { method: 'post' },
      track_site_list: { method: 'get' },
      track_site_status_edit: { method: 'post' },
      track_site_whitelist_add: { method: 'post' },
      track_site_whitelist_delete: { method: 'post' },
      track_event_add: { method: 'post' },

      # User
      user_add: { method: 'post' },
      user_delete: { method: 'post' },
      user_delete_list: { method: 'post' },
      user_edit: { method: 'post' },
      user_list: { method: 'get' },
      user_me: { method: 'get' },
      user_view: { method: 'get' },
      user_view_email: { method: 'get' },
      user_view_username: { method: 'get' },

      # Webhook
      webhook_add: { method: 'post' },
      webhook_delete: { method: 'post' },
      webhook_edit: { method: 'post' },
      webhook_events: { method: 'get' },
      webhook_list: { method: 'get' },
      webhook_view: { method: 'get' }
    }
  end

end
