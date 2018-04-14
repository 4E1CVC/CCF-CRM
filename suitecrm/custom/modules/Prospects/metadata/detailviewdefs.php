<?php
$viewdefs ['Prospects'] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          'SEND_CONFIRM_OPT_IN_EMAIL' => 
          array (
            'customCode' => '<input type="submit" class="button hidden" disabled="disabled" title="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}" onclick="this.form.return_module.value=\'Prospects\'; this.form.return_action.value=\'Prospects\'; this.form.return_id.value=\'{$fields.id.value}\'; this.form.action.value=\'sendConfirmOptInEmail\'; this.form.module.value=\'Prospects\'; this.form.module_tab.value=\'Prospects\';" name="send_confirm_opt_in_email" value="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}"/>',
            'sugar_html' => 
            array (
              'type' => 'submit',
              'value' => '{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}',
              'htmlOptions' => 
              array (
                'class' => 'button hidden',
                'id' => 'send_confirm_opt_in_email',
                'title' => '{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}',
                'onclick' => 'this.form.return_module.value=\'Prospects\'; this.form.return_action.value=\'DetailView\'; this.form.return_id.value=\'{$fields.id.value}\'; this.form.action.value=\'sendConfirmOptInEmail\'; this.form.module.value=\'Prospects\'; this.form.module_tab.value=\'Prospects\';',
                'name' => 'send_confirm_opt_in_email',
                'disabled' => true,
              ),
            ),
          ),
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
          3 => 
          array (
            'customCode' => '<input title="{$MOD.LBL_CONVERT_BUTTON_TITLE}" class="button" onclick="this.form.return_module.value=\'Prospects\'; this.form.return_action.value=\'DetailView\'; this.form.return_id.value=\'{$fields.id.value}\';this.form.module.value=\'Leads\';this.form.action.value=\'EditView\';" type="submit" name="CONVERT_LEAD_BTN" value="{$MOD.LBL_CONVERT_BUTTON_LABEL}"/>',
            'sugar_html' => 
            array (
              'type' => 'submit',
              'value' => '{$MOD.LBL_CONVERT_BUTTON_LABEL}',
              'htmlOptions' => 
              array (
                'class' => 'button',
                'name' => 'CONVERT_LEAD_BTN',
                'id' => 'convert_target_button',
                'title' => '{$MOD.LBL_CONVERT_BUTTON_TITLE}',
                'onclick' => 'this.form.return_module.value=\'Prospects\'; this.form.return_action.value=\'DetailView\'; this.form.return_id.value=\'{$fields.id.value}\';this.form.module.value=\'Leads\';this.form.action.value=\'EditView\';',
              ),
            ),
          ),
          4 => 
          array (
            'customCode' => '<input title="{$APP.LBL_MANAGE_SUBSCRIPTIONS}" class="button" onclick="this.form.return_module.value=\'Prospects\'; this.form.return_action.value=\'DetailView\'; this.form.return_id.value=\'{$fields.id.value}\'; this.form.action.value=\'Subscriptions\'; this.form.module.value=\'Campaigns\';" type="submit" name="Manage Subscriptions" value="{$APP.LBL_MANAGE_SUBSCRIPTIONS}"/>',
            'sugar_html' => 
            array (
              'type' => 'submit',
              'value' => '{$APP.LBL_MANAGE_SUBSCRIPTIONS}',
              'htmlOptions' => 
              array (
                'class' => 'button',
                'id' => 'manage_subscriptions_button',
                'name' => 'Manage Subscriptions',
                'title' => '{$APP.LBL_MANAGE_SUBSCRIPTIONS}',
                'onclick' => 'this.form.return_module.value=\'Prospects\'; this.form.return_action.value=\'DetailView\'; this.form.return_id.value=\'{$fields.id.value}\'; this.form.action.value=\'Subscriptions\'; this.form.module.value=\'Campaigns\';',
              ),
            ),
          ),
        ),
        'hidden' => 
        array (
          0 => '<input type="hidden" name="prospect_id" value="{$fields.id.value}">',
        ),
        'headerTpl' => 'modules/Prospects/tpls/DetailViewHeader.tpl',
      ),
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => true,
      'tabDefs' => 
      array (
        'LBL_PROSPECT_INFORMATION' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL4' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL5' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL3' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL6' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL7' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL9' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL10' => 
        array (
          'newTab' => true,
          'panelDefault' => 'expanded',
        ),
        'LBL_EDITVIEW_PANEL12' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
      'syncDetailEditViews' => true,
    ),
    'panels' => 
    array (
      'lbl_prospect_information' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccc_photo_c',
            'studio' => 'visible',
            'label' => 'LBL_CCC_PHOTO',
          ),
          1 => 
          array (
            'name' => 'ccf_volunteer_c',
            'label' => 'LBL_CCF_VOLUNTEER',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'first_name',
            'comment' => 'First name of the contact',
            'label' => 'LBL_FIRST_NAME',
          ),
          1 => 
          array (
            'name' => 'last_name',
            'comment' => 'Last name of the contact',
            'label' => 'LBL_LAST_NAME',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'birthdate',
            'label' => 'LBL_BIRTHDATE',
          ),
          1 => 'department',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'ccf_gender_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_GENDER',
          ),
          1 => 
          array (
            'name' => 'ccf_civil_status_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_CIVIL_STATUS',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'ccf_job_profession_c',
            'label' => 'LBL_CCF_JOB_PROFESSION',
          ),
          1 => 
          array (
            'name' => 'ccf_company_c',
            'label' => 'LBL_CCF_COMPANY',
          ),
        ),
      ),
      'lbl_editview_panel4' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccf_emer_name_c',
            'label' => 'LBL_CCF_EMER_NAME',
          ),
          1 => 
          array (
            'name' => 'ccf_emer_relation_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_EMER_RELATION',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ccf_emer_phone_c',
            'label' => 'LBL_CCF_EMER_PHONE',
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel5' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccf_blood_type_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_BLOOD_TYPE',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ccf_arthritis_c',
            'label' => 'LBL_CCF_ARTHRITIS',
          ),
          1 => 
          array (
            'name' => 'ccf_rheumatism_c',
            'label' => 'LBL_CCF_RHEUMATISM',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'ccf_heart_issues_c',
            'label' => 'LBL_CCF_HEART_ISSUES',
          ),
          1 => 
          array (
            'name' => 'ccf_high_blood_c',
            'label' => 'LBL_CCF_HIGH_BLOOD',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'ccf_vertigo_c',
            'label' => 'LBL_CCF_VERTIGO',
          ),
          1 => 
          array (
            'name' => 'ccf_scoliosis_c',
            'label' => 'LBL_CCF_SCOLIOSIS',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'ccf_medication_allergies_c',
            'label' => 'LBL_CCF_MEDICATION_ALLERGIES',
          ),
          1 => 
          array (
            'name' => 'ccf_food_allergies_c',
            'label' => 'LBL_CCF_FOOD_ALLERGIES',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'ccf_med_other_c',
            'label' => 'LBL_CCF_MED_OTHER',
          ),
        ),
      ),
      'lbl_editview_panel3' => 
      array (
        0 => 
        array (
          0 => 'phone_mobile',
          1 => 
          array (
            'name' => 'phone_home',
            'comment' => 'Home phone number of the contact',
            'label' => 'LBL_HOME_PHONE',
          ),
        ),
        1 => 
        array (
          0 => 'email1',
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'ccf_im_name_c',
            'label' => 'LBL_CCF_IM_NAME',
          ),
          1 => 
          array (
            'name' => 'ccf_im_type_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_IM_TYPE',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'primary_address_street',
            'label' => 'LBL_PRIMARY_ADDRESS',
            'type' => 'address',
            'displayParams' => 
            array (
              'key' => 'primary',
            ),
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel6' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccf_dgroup_leader_name_c',
            'label' => 'LBL_CCF_DGROUP_LEADER_NAME',
          ),
          1 => 
          array (
            'name' => 'ccf_dgroup_leader_phone_c',
            'label' => 'LBL_CCF_DGROUP_LEADER_PHONE',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ccf_dgroup_type_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_DGROUP_TYPE',
          ),
          1 => 
          array (
            'name' => 'ccf_dgroup_date_c',
            'label' => 'LBL_CCF_DGROUP_DATE',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'ccf_dgroup_day_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_DGROUP_DAY',
          ),
          1 => 
          array (
            'name' => 'ccf_dgroup_times_c',
            'studio' => 'visible',
            'label' => 'LBL_CCF_DGROUP_TIMES',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'ccf_dgroup_leader_c',
            'label' => 'LBL_CCF_DGROUP_LEADER',
          ),
          1 => 
          array (
            'name' => 'ccd_d12_leader_c',
            'label' => 'LBL_CCD_D12_LEADER',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'ccf_area__pastor_c',
            'label' => 'LBL_CCF_AREA__PASTOR',
          ),
          1 => '',
        ),
        5 => 
        array (
          0 => '',
          1 => '',
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'ccf_glc1_date_c',
            'label' => 'LBL_CCF_GLC1_DATE',
          ),
          1 => 
          array (
            'name' => 'ccf_glc2_date_c',
            'label' => 'LBL_CCF_GLC2_DATE',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'ccf_truelife_date_c',
            'label' => 'LBL_CCF_TRUELIFE_DATE',
          ),
          1 => 
          array (
            'name' => 'ccf_idc_date_c',
            'label' => 'LBL_CCF_IDC_DATE',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'ccf_couples_date_c',
            'label' => 'LBL_CCF_COUPLES_DATE',
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel7' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccf_host_orientation_c',
            'label' => 'LBL_CCF_HOST_ORIENTATION',
          ),
          1 => 
          array (
            'name' => 'ccf_host_service_date_c',
            'label' => 'LBL_CCF_HOST_SERVICE_DATE',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ccf_host_2017_fellowship_c',
            'label' => 'LBL_CCF_HOST_2017_FELLOWSHIP',
          ),
          1 => 
          array (
            'name' => 'ccf_ht_radicalhosting_c',
            'label' => 'LBL_CCF_HT_RADICALHOSTING',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'ccf_ht_mindset_c',
            'label' => 'LBL_CCF_HT_MINDSET',
          ),
          1 => 
          array (
            'name' => 'ccf_ht_support_tl_refresher_c',
            'label' => 'LBL_CCF_HT_SUPPORT_TL_REFRESHER',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'lbl_ccf_ht_pm_tl_refresher_c',
            'label' => 'LBL_LBL_CCF_HT_PM_TL_REFRESHER',
          ),
          1 => 
          array (
            'name' => 'ccf_ht_other_training_c',
            'label' => 'LBL_CCF_HT_OTHER_TRAINING',
          ),
        ),
      ),
      'lbl_editview_panel9' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccf_mininv_choir_c',
            'label' => 'LBL_CCF_MININV_CHOIR',
          ),
          1 => 
          array (
            'name' => 'ccf_mininv_exalt_c',
            'label' => 'LBL_CCF_MININV_EXALT',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ccf_mininv_family_c',
            'label' => 'LBL_CCF_MININV_FAMILY',
          ),
          1 => 
          array (
            'name' => 'ccf_mininv_hosting_c',
            'label' => 'LBL_CCF_MININV_HOSTING',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'ccf_mininv_law_c',
            'label' => 'LBL_CCF_MININV_LAW',
          ),
          1 => 
          array (
            'name' => 'ccf_mininv_liveproduction_c',
            'label' => 'LBL_CCF_MININV_LIVEPRODUCTION',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'ccf_mininv_nxtgen_c',
            'label' => 'LBL_CCF_MININV_NXTGEN',
          ),
          1 => 
          array (
            'name' => 'ccf_mininv_sns_c',
            'label' => '',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'ccf_mininv_sports_c',
            'label' => 'LBL_CCF_MININV_SPORTS',
          ),
          1 => 
          array (
            'name' => 'ccf_mininv_parkingshuttle_c',
            'label' => 'LBL_CCF_MININV_PARKINGSHUTTLE',
          ),
        ),
      ),
      'lbl_editview_panel10' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_med_c',
            'label' => 'LBL_CCF_SKILLS_MED',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_fire_c',
            'label' => 'LBL_CCF_SKILLS_FIRE',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_police_c',
            'label' => 'LBL_CCF_SKILLS_POLICE',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_attorney_c',
            'label' => 'LBL_CCF_SKILLS_ATTORNEY',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_audio_c',
            'label' => 'LBL_CCF_SKILLS_AUDIO',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_video_c',
            'label' => 'LBL_CCF_SKILLS_VIDEO',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_photography_c',
            'label' => 'LBL_CCF_SKILLS_PHOTOGRAPHY',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_videoproduction_c',
            'label' => 'LBL_CCF_SKILLS_VIDEOPRODUCTION',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_accounting_c',
            'label' => 'LBL_CCF_SKILLS_ACCOUNTING',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_planning_c',
            'label' => 'LBL_CCF_SKILLS_PLANNING',
          ),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_music_c',
            'label' => 'LBL_CCF_SKILLS_MUSIC',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_singing_c',
            'label' => 'LBL_CCF_SKILLS_SINGING',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_dance_c',
            'label' => 'LBL_CCF_SKILLS_DANCE',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_drama_c',
            'label' => 'LBL_CCF_SKILLS_DRAMA',
          ),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_msoffice_c',
            'label' => 'LBL_CCF_SKILLS_MSOFFICE',
          ),
          1 => 
          array (
            'name' => 'ccf_skills_programming_c',
            'label' => 'LBL_CCF_SKILLS_PROGRAMMING',
          ),
        ),
        8 => 
        array (
          0 => 
          array (
            'name' => 'ccf_skills_training_c',
            'label' => 'LBL_CCF_SKILLS_TRAINING',
          ),
          1 => '',
        ),
        9 => 
        array (
          0 => '',
          1 => '',
        ),
      ),
      'lbl_editview_panel12' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'google_maps_c',
            'label' => 'LBL_GOOGLE_MAPS',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
;
?>