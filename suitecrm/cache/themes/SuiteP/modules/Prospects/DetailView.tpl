

{assign var=preForm value="<table width='100%' border='1' cellspacing='0' cellpadding='0'><tr><td><table width='100%'><tr><td>"}
{assign var=displayPreform value=false}
{if isset($bean->lead_id) && !empty($bean->lead_id)}
{assign var=displayPreform value=true}
{assign var=preForm value=$preForm|cat:$MOD.LBL_CONVERTED_LEAD}
{assign var=preForm value=$preForm|cat:"&nbsp;<a href='index.php?module=Leads&action=DetailView&record="}
{assign var=preForm value=$preForm|cat:$bean->lead_id}
{assign var=preForm value=$preForm|cat:"'>"}
{assign var=preForm value=$preForm|cat:$lead->name}
{assign var=preForm value=$preForm|cat:"</a>"}
{/if}
{assign var=preForm value=$preForm|cat:"</td><td>"}
{assign var=preForm value=$preForm|cat:"</td></tr></table></td></tr></table>"}
{if $displayPreform}
{$preForm}
<br>
{/if}

<script language="javascript">
    {literal}
    SUGAR.util.doWhen(function () {
        return $("#contentTable").length == 0;
    }, SUGAR.themes.actionMenu);
    {/literal}
</script>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="">
<tr>
<td class="buttons" align="left" NOWRAP width="80%">
<div class="actionsContainer">
<form action="index.php" method="post" name="DetailView" id="formDetailView">
<input type="hidden" name="module" value="{$module}">
<input type="hidden" name="record" value="{$fields.id.value}">
<input type="hidden" name="return_action">
<input type="hidden" name="return_module">
<input type="hidden" name="return_id">
<input type="hidden" name="module_tab">
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="offset" value="{$offset}">
<input type="hidden" name="action" value="EditView">
<input type="hidden" name="sugar_body_only">
<input type="hidden" name="prospect_id" value="{$fields.id.value}">
{if !$config.enable_action_menu}
<div class="buttons">
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$id}'; _form.action.value='EditView';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} 
{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.isDuplicate.value=true; _form.action.value='EditView'; _form.return_id.value='{$id}';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} 
{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Prospects'; _form.return_action.value='ListView'; _form.action.value='Delete'; if(confirm('{$APP.NTC_DELETE_CONFIRMATION}')) SUGAR.ajaxUI.submitForm(_form); return false;" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}" id="delete_button">{/if} 
<input class="button hidden" id="send_confirm_opt_in_email" title="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}" onclick="var _form = document.getElementById('formDetailView');_form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$fields.id.value}'; _form.action.value='sendConfirmOptInEmail'; _form.module.value='Prospects'; _form.module_tab.value='Prospects';_form.submit();" name="send_confirm_opt_in_email" disabled="1" type="button" value="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}"/>
<input class="button" name="CONVERT_LEAD_BTN" id="convert_target_button" title="{$MOD.LBL_CONVERT_BUTTON_TITLE}" onclick="var _form = document.getElementById('formDetailView');_form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$fields.id.value}';_form.module.value='Leads';_form.action.value='EditView';_form.submit();" type="button" value="{$MOD.LBL_CONVERT_BUTTON_LABEL}"/>
<input class="button" id="manage_subscriptions_button" name="Manage Subscriptions" title="{$APP.LBL_MANAGE_SUBSCRIPTIONS}" onclick="var _form = document.getElementById('formDetailView');_form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$fields.id.value}'; _form.action.value='Subscriptions'; _form.module.value='Campaigns';_form.submit();" type="button" value="{$APP.LBL_MANAGE_SUBSCRIPTIONS}"/>
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Prospects", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>                    {/if}
</form>
</div>
</td>
<td align="right" width="20%" class="buttons">{$ADMIN_EDIT}
</td>
</tr>
</table>
{sugar_include include=$includes}
<div class="detail-view">
<div class="mobile-pagination">{$PAGINATION}</div>

<ul class="nav nav-tabs">


<li role="presentation" class="active">
<a id="tab0" data-toggle="tab" class="hidden-xs">
{sugar_translate label='LBL_PROSPECT_INFORMATION' module='Prospects'}
</a>


<a id="xstab0" href="#" class="visible-xs first-tab-xs dropdown-toggle" data-toggle="dropdown">
{sugar_translate label='LBL_PROSPECT_INFORMATION' module='Prospects'}
</a>
<ul id="first-tab-menu-xs" class="dropdown-menu">
<li role="presentation">
<a id="tab1" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-1');">
{sugar_translate label='LBL_PROSPECT_INFORMATION' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab5" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-5');">
{sugar_translate label='LBL_EDITVIEW_PANEL6' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab6" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-6');">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab7" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-7');">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab8" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-8');">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='Prospects'}
</a>
</li>
</ul>
</li>








<li role="presentation" class="hidden-xs">
<a id="tab1" data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL6' module='Prospects'}
</a>
</li>


<li role="presentation" class="hidden-xs">
<a id="tab2" data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='Prospects'}
</a>
</li>


<li role="presentation" class="hidden-xs">
<a id="tab3" data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='Prospects'}
</a>
</li>


<li role="presentation" class="hidden-xs">
<a id="tab4" data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='Prospects'}
</a>
</li>


{if $config.enable_action_menu and $config.enable_action_menu != false}
<li id="tab-actions" class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown" href="#">ACTIONS<span class="suitepicon suitepicon-action-caret"></span></a>
<ul class="dropdown-menu">
<li>{if $bean->aclAccess("edit")}<input title="{$APP.LBL_EDIT_BUTTON_TITLE}" accessKey="{$APP.LBL_EDIT_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$id}'; _form.action.value='EditView';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Edit" id="edit_button" value="{$APP.LBL_EDIT_BUTTON_LABEL}">{/if} </li>
<li>{if $bean->aclAccess("edit")}<input title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="{$APP.LBL_DUPLICATE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.isDuplicate.value=true; _form.action.value='EditView'; _form.return_id.value='{$id}';SUGAR.ajaxUI.submitForm(_form);" type="button" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON_LABEL}" id="duplicate_button">{/if} </li>
<li>{if $bean->aclAccess("delete")}<input title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" class="button" onclick="var _form = document.getElementById('formDetailView'); _form.return_module.value='Prospects'; _form.return_action.value='ListView'; _form.action.value='Delete'; if(confirm('{$APP.NTC_DELETE_CONFIRMATION}')) SUGAR.ajaxUI.submitForm(_form); return false;" type="submit" name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}" id="delete_button">{/if} </li>
<li><input class="button hidden" id="send_confirm_opt_in_email" title="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}" onclick="var _form = document.getElementById('formDetailView');_form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$fields.id.value}'; _form.action.value='sendConfirmOptInEmail'; _form.module.value='Prospects'; _form.module_tab.value='Prospects';_form.submit();" name="send_confirm_opt_in_email" disabled="1" type="button" value="{$APP.LBL_SEND_CONFIRM_OPT_IN_EMAIL}"/></li>
<li><input class="button" name="CONVERT_LEAD_BTN" id="convert_target_button" title="{$MOD.LBL_CONVERT_BUTTON_TITLE}" onclick="var _form = document.getElementById('formDetailView');_form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$fields.id.value}';_form.module.value='Leads';_form.action.value='EditView';_form.submit();" type="button" value="{$MOD.LBL_CONVERT_BUTTON_LABEL}"/></li>
<li><input class="button" id="manage_subscriptions_button" name="Manage Subscriptions" title="{$APP.LBL_MANAGE_SUBSCRIPTIONS}" onclick="var _form = document.getElementById('formDetailView');_form.return_module.value='Prospects'; _form.return_action.value='DetailView'; _form.return_id.value='{$fields.id.value}'; _form.action.value='Subscriptions'; _form.module.value='Campaigns';_form.submit();" type="button" value="{$APP.LBL_MANAGE_SUBSCRIPTIONS}"/></li>
<li>{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Prospects", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}</li>
</ul>        </li>
<li class="tab-inline-pagination">
{$PAGINATION}
</li>
{/if}
</ul>
<div class="clearfix"></div>

<div class="tab-content">

<div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='tab-content-0'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCC_PHOTO' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="image" field="ccc_photo_c"  >

{if !$fields.ccc_photo_c.hidden}
{counter name="panelFieldCount" print=false}

<span class="sugar_field" id="{$fields.ccc_photo_c.name}">
<img src="index.php?entryPoint=download&id={$fields.id.value}_{$fields.ccc_photo_c.name}{$fields.width.value}&type={$module}" style="max-width: {if !$vardef.width}150{else}200{/if}px;" height="{if !$vardef.height}{else}50{/if}">
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_VOLUNTEER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_volunteer_c"  >

{if !$fields.ccf_volunteer_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_volunteer_c.value) == "1" || strval($fields.ccf_volunteer_c.value) == "yes" || strval($fields.ccf_volunteer_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_volunteer_c.name}" id="{$fields.ccf_volunteer_c.name}" value="$fields.ccf_volunteer_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_FIRST_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="first_name"  >

{if !$fields.first_name.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.first_name.value) <= 0}
{assign var="value" value=$fields.first_name.default_value }
{else}
{assign var="value" value=$fields.first_name.value }
{/if} 
<span class="sugar_field" id="{$fields.first_name.name}">{$fields.first_name.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LAST_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="last_name"  >

{if !$fields.last_name.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.last_name.value) <= 0}
{assign var="value" value=$fields.last_name.default_value }
{else}
{assign var="value" value=$fields.last_name.value }
{/if} 
<span class="sugar_field" id="{$fields.last_name.name}">{$fields.last_name.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_BIRTHDATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="birthdate"  >

{if !$fields.birthdate.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.birthdate.value) <= 0}
{assign var="value" value=$fields.birthdate.default_value }
{else}
{assign var="value" value=$fields.birthdate.value }
{/if}
<span class="sugar_field" id="{$fields.birthdate.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_DEPARTMENT' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="department"  >

{if !$fields.department.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.department.value) <= 0}
{assign var="value" value=$fields.department.default_value }
{else}
{assign var="value" value=$fields.department.value }
{/if} 
<span class="sugar_field" id="{$fields.department.name}">{$fields.department.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_GENDER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_gender_c"  >

{if !$fields.ccf_gender_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_gender_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_gender_c.name}" value="{ $fields.ccf_gender_c.options }">
{ $fields.ccf_gender_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_gender_c.name}" value="{ $fields.ccf_gender_c.value }">
{ $fields.ccf_gender_c.options[$fields.ccf_gender_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_CIVIL_STATUS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_civil_status_c"  >

{if !$fields.ccf_civil_status_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_civil_status_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_civil_status_c.name}" value="{ $fields.ccf_civil_status_c.options }">
{ $fields.ccf_civil_status_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_civil_status_c.name}" value="{ $fields.ccf_civil_status_c.value }">
{ $fields.ccf_civil_status_c.options[$fields.ccf_civil_status_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_JOB_PROFESSION' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_job_profession_c"  >

{if !$fields.ccf_job_profession_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_job_profession_c.value) <= 0}
{assign var="value" value=$fields.ccf_job_profession_c.default_value }
{else}
{assign var="value" value=$fields.ccf_job_profession_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_job_profession_c.name}">{$fields.ccf_job_profession_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_COMPANY' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_company_c"  >

{if !$fields.ccf_company_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_company_c.value) <= 0}
{assign var="value" value=$fields.ccf_company_c.default_value }
{else}
{assign var="value" value=$fields.ccf_company_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_company_c.name}">{$fields.ccf_company_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                    </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-4'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_LEADER_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_dgroup_leader_name_c"  >

{if !$fields.ccf_dgroup_leader_name_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_dgroup_leader_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_dgroup_leader_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_dgroup_leader_name_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_dgroup_leader_name_c.name}">{$fields.ccf_dgroup_leader_name_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_LEADER_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="ccf_dgroup_leader_phone_c"  class="phone">

{if !$fields.ccf_dgroup_leader_phone_c.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.ccf_dgroup_leader_phone_c.value)}
{assign var="phone_value" value=$fields.ccf_dgroup_leader_phone_c.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_dgroup_type_c"  >

{if !$fields.ccf_dgroup_type_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_dgroup_type_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_dgroup_type_c.name}" value="{ $fields.ccf_dgroup_type_c.options }">
{ $fields.ccf_dgroup_type_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_dgroup_type_c.name}" value="{ $fields.ccf_dgroup_type_c.value }">
{ $fields.ccf_dgroup_type_c.options[$fields.ccf_dgroup_type_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_dgroup_date_c"  >

{if !$fields.ccf_dgroup_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_dgroup_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_dgroup_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_dgroup_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_dgroup_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_DAY' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_dgroup_day_c"  >

{if !$fields.ccf_dgroup_day_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_dgroup_day_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_dgroup_day_c.name}" value="{ $fields.ccf_dgroup_day_c.options }">
{ $fields.ccf_dgroup_day_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_dgroup_day_c.name}" value="{ $fields.ccf_dgroup_day_c.value }">
{ $fields.ccf_dgroup_day_c.options[$fields.ccf_dgroup_day_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_TIMES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_dgroup_times_c"  >

{if !$fields.ccf_dgroup_times_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_dgroup_times_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_dgroup_times_c.name}" value="{ $fields.ccf_dgroup_times_c.options }">
{ $fields.ccf_dgroup_times_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_dgroup_times_c.name}" value="{ $fields.ccf_dgroup_times_c.value }">
{ $fields.ccf_dgroup_times_c.options[$fields.ccf_dgroup_times_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_LEADER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_dgroup_leader_c"  >

{if !$fields.ccf_dgroup_leader_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_dgroup_leader_c.value) == "1" || strval($fields.ccf_dgroup_leader_c.value) == "yes" || strval($fields.ccf_dgroup_leader_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_dgroup_leader_c.name}" id="{$fields.ccf_dgroup_leader_c.name}" value="$fields.ccf_dgroup_leader_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCD_D12_LEADER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccd_d12_leader_c"  >

{if !$fields.ccd_d12_leader_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccd_d12_leader_c.value) == "1" || strval($fields.ccd_d12_leader_c.value) == "yes" || strval($fields.ccd_d12_leader_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccd_d12_leader_c.name}" id="{$fields.ccd_d12_leader_c.name}" value="$fields.ccd_d12_leader_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_AREA__PASTOR' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_area__pastor_c"  >

{if !$fields.ccf_area__pastor_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_area__pastor_c.value) <= 0}
{assign var="value" value=$fields.ccf_area__pastor_c.default_value }
{else}
{assign var="value" value=$fields.ccf_area__pastor_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_area__pastor_c.name}">{$fields.ccf_area__pastor_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>



<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_GLC1_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_glc1_date_c"  >

{if !$fields.ccf_glc1_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_glc1_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_glc1_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_glc1_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_glc1_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_GLC2_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_glc2_date_c"  >

{if !$fields.ccf_glc2_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_glc2_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_glc2_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_glc2_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_glc2_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_TRUELIFE_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_truelife_date_c"  >

{if !$fields.ccf_truelife_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_truelife_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_truelife_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_truelife_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_truelife_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IDC_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_idc_date_c"  >

{if !$fields.ccf_idc_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_idc_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_idc_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_idc_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_idc_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_COUPLES_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_couples_date_c"  >

{if !$fields.ccf_couples_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_couples_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_couples_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_couples_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_couples_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                    </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-5'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HOST_ORIENTATION' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_host_orientation_c"  >

{if !$fields.ccf_host_orientation_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_host_orientation_c.value) <= 0}
{assign var="value" value=$fields.ccf_host_orientation_c.default_value }
{else}
{assign var="value" value=$fields.ccf_host_orientation_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_host_orientation_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HOST_SERVICE_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="date" field="ccf_host_service_date_c"  >

{if !$fields.ccf_host_service_date_c.hidden}
{counter name="panelFieldCount" print=false}


{if strlen($fields.ccf_host_service_date_c.value) <= 0}
{assign var="value" value=$fields.ccf_host_service_date_c.default_value }
{else}
{assign var="value" value=$fields.ccf_host_service_date_c.value }
{/if}
<span class="sugar_field" id="{$fields.ccf_host_service_date_c.name}">{$value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HOST_2017_FELLOWSHIP' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_host_2017_fellowship_c"  >

{if !$fields.ccf_host_2017_fellowship_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_host_2017_fellowship_c.value) == "1" || strval($fields.ccf_host_2017_fellowship_c.value) == "yes" || strval($fields.ccf_host_2017_fellowship_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_host_2017_fellowship_c.name}" id="{$fields.ccf_host_2017_fellowship_c.name}" value="$fields.ccf_host_2017_fellowship_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_RADICALHOSTING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_ht_radicalhosting_c"  >

{if !$fields.ccf_ht_radicalhosting_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_ht_radicalhosting_c.value) == "1" || strval($fields.ccf_ht_radicalhosting_c.value) == "yes" || strval($fields.ccf_ht_radicalhosting_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_ht_radicalhosting_c.name}" id="{$fields.ccf_ht_radicalhosting_c.name}" value="$fields.ccf_ht_radicalhosting_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_MINDSET' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_ht_mindset_c"  >

{if !$fields.ccf_ht_mindset_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_ht_mindset_c.value) == "1" || strval($fields.ccf_ht_mindset_c.value) == "yes" || strval($fields.ccf_ht_mindset_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_ht_mindset_c.name}" id="{$fields.ccf_ht_mindset_c.name}" value="$fields.ccf_ht_mindset_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_SUPPORT_TL_REFRESHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_ht_support_tl_refresher_c"  >

{if !$fields.ccf_ht_support_tl_refresher_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_ht_support_tl_refresher_c.value) == "1" || strval($fields.ccf_ht_support_tl_refresher_c.value) == "yes" || strval($fields.ccf_ht_support_tl_refresher_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_ht_support_tl_refresher_c.name}" id="{$fields.ccf_ht_support_tl_refresher_c.name}" value="$fields.ccf_ht_support_tl_refresher_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_LBL_CCF_HT_PM_TL_REFRESHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="lbl_ccf_ht_pm_tl_refresher_c"  >

{if !$fields.lbl_ccf_ht_pm_tl_refresher_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.lbl_ccf_ht_pm_tl_refresher_c.value) == "1" || strval($fields.lbl_ccf_ht_pm_tl_refresher_c.value) == "yes" || strval($fields.lbl_ccf_ht_pm_tl_refresher_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.lbl_ccf_ht_pm_tl_refresher_c.name}" id="{$fields.lbl_ccf_ht_pm_tl_refresher_c.name}" value="$fields.lbl_ccf_ht_pm_tl_refresher_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_OTHER_TRAINING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_ht_other_training_c"  >

{if !$fields.ccf_ht_other_training_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_ht_other_training_c.value) <= 0}
{assign var="value" value=$fields.ccf_ht_other_training_c.default_value }
{else}
{assign var="value" value=$fields.ccf_ht_other_training_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_ht_other_training_c.name}">{$fields.ccf_ht_other_training_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                    </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-6'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_CHOIR' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_choir_c"  >

{if !$fields.ccf_mininv_choir_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_choir_c.value) == "1" || strval($fields.ccf_mininv_choir_c.value) == "yes" || strval($fields.ccf_mininv_choir_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_choir_c.name}" id="{$fields.ccf_mininv_choir_c.name}" value="$fields.ccf_mininv_choir_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_EXALT' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_exalt_c"  >

{if !$fields.ccf_mininv_exalt_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_exalt_c.value) == "1" || strval($fields.ccf_mininv_exalt_c.value) == "yes" || strval($fields.ccf_mininv_exalt_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_exalt_c.name}" id="{$fields.ccf_mininv_exalt_c.name}" value="$fields.ccf_mininv_exalt_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_FAMILY' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_family_c"  >

{if !$fields.ccf_mininv_family_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_family_c.value) == "1" || strval($fields.ccf_mininv_family_c.value) == "yes" || strval($fields.ccf_mininv_family_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_family_c.name}" id="{$fields.ccf_mininv_family_c.name}" value="$fields.ccf_mininv_family_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_HOSTING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_hosting_c"  >

{if !$fields.ccf_mininv_hosting_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_hosting_c.value) == "1" || strval($fields.ccf_mininv_hosting_c.value) == "yes" || strval($fields.ccf_mininv_hosting_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_hosting_c.name}" id="{$fields.ccf_mininv_hosting_c.name}" value="$fields.ccf_mininv_hosting_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_LAW' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_law_c"  >

{if !$fields.ccf_mininv_law_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_law_c.value) == "1" || strval($fields.ccf_mininv_law_c.value) == "yes" || strval($fields.ccf_mininv_law_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_law_c.name}" id="{$fields.ccf_mininv_law_c.name}" value="$fields.ccf_mininv_law_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_LIVEPRODUCTION' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_liveproduction_c"  >

{if !$fields.ccf_mininv_liveproduction_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_liveproduction_c.value) == "1" || strval($fields.ccf_mininv_liveproduction_c.value) == "yes" || strval($fields.ccf_mininv_liveproduction_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_liveproduction_c.name}" id="{$fields.ccf_mininv_liveproduction_c.name}" value="$fields.ccf_mininv_liveproduction_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_NXTGEN' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_nxtgen_c"  >

{if !$fields.ccf_mininv_nxtgen_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_nxtgen_c.value) == "1" || strval($fields.ccf_mininv_nxtgen_c.value) == "yes" || strval($fields.ccf_mininv_nxtgen_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_nxtgen_c.name}" id="{$fields.ccf_mininv_nxtgen_c.name}" value="$fields.ccf_mininv_nxtgen_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_sns_c"  >

{if !$fields.ccf_mininv_sns_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_sns_c.value) == "1" || strval($fields.ccf_mininv_sns_c.value) == "yes" || strval($fields.ccf_mininv_sns_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_sns_c.name}" id="{$fields.ccf_mininv_sns_c.name}" value="$fields.ccf_mininv_sns_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_SPORTS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_sports_c"  >

{if !$fields.ccf_mininv_sports_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_sports_c.value) == "1" || strval($fields.ccf_mininv_sports_c.value) == "yes" || strval($fields.ccf_mininv_sports_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_sports_c.name}" id="{$fields.ccf_mininv_sports_c.name}" value="$fields.ccf_mininv_sports_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_PARKINGSHUTTLE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_mininv_parkingshuttle_c"  >

{if !$fields.ccf_mininv_parkingshuttle_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_parkingshuttle_c.value) == "1" || strval($fields.ccf_mininv_parkingshuttle_c.value) == "yes" || strval($fields.ccf_mininv_parkingshuttle_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_mininv_parkingshuttle_c.name}" id="{$fields.ccf_mininv_parkingshuttle_c.name}" value="$fields.ccf_mininv_parkingshuttle_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                    </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-7'>





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_MED' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_med_c"  >

{if !$fields.ccf_skills_med_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_med_c.value) == "1" || strval($fields.ccf_skills_med_c.value) == "yes" || strval($fields.ccf_skills_med_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_med_c.name}" id="{$fields.ccf_skills_med_c.name}" value="$fields.ccf_skills_med_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_FIRE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_fire_c"  >

{if !$fields.ccf_skills_fire_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_fire_c.value) == "1" || strval($fields.ccf_skills_fire_c.value) == "yes" || strval($fields.ccf_skills_fire_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_fire_c.name}" id="{$fields.ccf_skills_fire_c.name}" value="$fields.ccf_skills_fire_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_POLICE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_police_c"  >

{if !$fields.ccf_skills_police_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_police_c.value) == "1" || strval($fields.ccf_skills_police_c.value) == "yes" || strval($fields.ccf_skills_police_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_police_c.name}" id="{$fields.ccf_skills_police_c.name}" value="$fields.ccf_skills_police_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_ATTORNEY' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_attorney_c"  >

{if !$fields.ccf_skills_attorney_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_attorney_c.value) == "1" || strval($fields.ccf_skills_attorney_c.value) == "yes" || strval($fields.ccf_skills_attorney_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_attorney_c.name}" id="{$fields.ccf_skills_attorney_c.name}" value="$fields.ccf_skills_attorney_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_AUDIO' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_audio_c"  >

{if !$fields.ccf_skills_audio_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_audio_c.value) == "1" || strval($fields.ccf_skills_audio_c.value) == "yes" || strval($fields.ccf_skills_audio_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_audio_c.name}" id="{$fields.ccf_skills_audio_c.name}" value="$fields.ccf_skills_audio_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_VIDEO' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_video_c"  >

{if !$fields.ccf_skills_video_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_video_c.value) == "1" || strval($fields.ccf_skills_video_c.value) == "yes" || strval($fields.ccf_skills_video_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_video_c.name}" id="{$fields.ccf_skills_video_c.name}" value="$fields.ccf_skills_video_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_PHOTOGRAPHY' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_photography_c"  >

{if !$fields.ccf_skills_photography_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_photography_c.value) == "1" || strval($fields.ccf_skills_photography_c.value) == "yes" || strval($fields.ccf_skills_photography_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_photography_c.name}" id="{$fields.ccf_skills_photography_c.name}" value="$fields.ccf_skills_photography_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_VIDEOPRODUCTION' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_videoproduction_c"  >

{if !$fields.ccf_skills_videoproduction_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_videoproduction_c.value) == "1" || strval($fields.ccf_skills_videoproduction_c.value) == "yes" || strval($fields.ccf_skills_videoproduction_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_videoproduction_c.name}" id="{$fields.ccf_skills_videoproduction_c.name}" value="$fields.ccf_skills_videoproduction_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_ACCOUNTING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_accounting_c"  >

{if !$fields.ccf_skills_accounting_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_accounting_c.value) == "1" || strval($fields.ccf_skills_accounting_c.value) == "yes" || strval($fields.ccf_skills_accounting_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_accounting_c.name}" id="{$fields.ccf_skills_accounting_c.name}" value="$fields.ccf_skills_accounting_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_PLANNING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_planning_c"  >

{if !$fields.ccf_skills_planning_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_planning_c.value) == "1" || strval($fields.ccf_skills_planning_c.value) == "yes" || strval($fields.ccf_skills_planning_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_planning_c.name}" id="{$fields.ccf_skills_planning_c.name}" value="$fields.ccf_skills_planning_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_MUSIC' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_music_c"  >

{if !$fields.ccf_skills_music_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_music_c.value) == "1" || strval($fields.ccf_skills_music_c.value) == "yes" || strval($fields.ccf_skills_music_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_music_c.name}" id="{$fields.ccf_skills_music_c.name}" value="$fields.ccf_skills_music_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_SINGING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_singing_c"  >

{if !$fields.ccf_skills_singing_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_singing_c.value) == "1" || strval($fields.ccf_skills_singing_c.value) == "yes" || strval($fields.ccf_skills_singing_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_singing_c.name}" id="{$fields.ccf_skills_singing_c.name}" value="$fields.ccf_skills_singing_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_DANCE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_dance_c"  >

{if !$fields.ccf_skills_dance_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_dance_c.value) == "1" || strval($fields.ccf_skills_dance_c.value) == "yes" || strval($fields.ccf_skills_dance_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_dance_c.name}" id="{$fields.ccf_skills_dance_c.name}" value="$fields.ccf_skills_dance_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_DRAMA' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_drama_c"  >

{if !$fields.ccf_skills_drama_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_drama_c.value) == "1" || strval($fields.ccf_skills_drama_c.value) == "yes" || strval($fields.ccf_skills_drama_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_drama_c.name}" id="{$fields.ccf_skills_drama_c.name}" value="$fields.ccf_skills_drama_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_MSOFFICE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_msoffice_c"  >

{if !$fields.ccf_skills_msoffice_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_msoffice_c.value) == "1" || strval($fields.ccf_skills_msoffice_c.value) == "yes" || strval($fields.ccf_skills_msoffice_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_msoffice_c.name}" id="{$fields.ccf_skills_msoffice_c.name}" value="$fields.ccf_skills_msoffice_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_PROGRAMMING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_programming_c"  >

{if !$fields.ccf_skills_programming_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_programming_c.value) == "1" || strval($fields.ccf_skills_programming_c.value) == "yes" || strval($fields.ccf_skills_programming_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_programming_c.name}" id="{$fields.ccf_skills_programming_c.name}" value="$fields.ccf_skills_programming_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_TRAINING' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_skills_training_c"  >

{if !$fields.ccf_skills_training_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_training_c.value) == "1" || strval($fields.ccf_skills_training_c.value) == "yes" || strval($fields.ccf_skills_training_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_skills_training_c.name}" id="{$fields.ccf_skills_training_c.name}" value="$fields.ccf_skills_training_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>



<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                    </div>
</div>

<div class="panel-content">
<div>&nbsp;</div>







{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-0" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL4' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-0"  data-id="LBL_EDITVIEW_PANEL4">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_emer_name_c"  >

{if !$fields.ccf_emer_name_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_emer_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_emer_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_emer_name_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_emer_name_c.name}">{$fields.ccf_emer_name_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_RELATION' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_emer_relation_c"  >

{if !$fields.ccf_emer_relation_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_emer_relation_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_emer_relation_c.name}" value="{ $fields.ccf_emer_relation_c.options }">
{ $fields.ccf_emer_relation_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_emer_relation_c.name}" value="{ $fields.ccf_emer_relation_c.value }">
{ $fields.ccf_emer_relation_c.options[$fields.ccf_emer_relation_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="ccf_emer_phone_c"  class="phone">

{if !$fields.ccf_emer_phone_c.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.ccf_emer_phone_c.value)}
{assign var="phone_value" value=$fields.ccf_emer_phone_c.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-0" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL4' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-0" data-id="LBL_EDITVIEW_PANEL4">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_emer_name_c"  >

{if !$fields.ccf_emer_name_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_emer_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_emer_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_emer_name_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_emer_name_c.name}">{$fields.ccf_emer_name_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_RELATION' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_emer_relation_c"  >

{if !$fields.ccf_emer_relation_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_emer_relation_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_emer_relation_c.name}" value="{ $fields.ccf_emer_relation_c.options }">
{ $fields.ccf_emer_relation_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_emer_relation_c.name}" value="{ $fields.ccf_emer_relation_c.value }">
{ $fields.ccf_emer_relation_c.options[$fields.ccf_emer_relation_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="ccf_emer_phone_c"  class="phone">

{if !$fields.ccf_emer_phone_c.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.ccf_emer_phone_c.value)}
{assign var="phone_value" value=$fields.ccf_emer_phone_c.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-1" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL5' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-1"  data-id="LBL_EDITVIEW_PANEL5">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_BLOOD_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_blood_type_c"  >

{if !$fields.ccf_blood_type_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_blood_type_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_blood_type_c.name}" value="{ $fields.ccf_blood_type_c.options }">
{ $fields.ccf_blood_type_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_blood_type_c.name}" value="{ $fields.ccf_blood_type_c.value }">
{ $fields.ccf_blood_type_c.options[$fields.ccf_blood_type_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_ARTHRITIS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_arthritis_c"  >

{if !$fields.ccf_arthritis_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_arthritis_c.value) == "1" || strval($fields.ccf_arthritis_c.value) == "yes" || strval($fields.ccf_arthritis_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_arthritis_c.name}" id="{$fields.ccf_arthritis_c.name}" value="$fields.ccf_arthritis_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_RHEUMATISM' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_rheumatism_c"  >

{if !$fields.ccf_rheumatism_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_rheumatism_c.value) <= 0}
{assign var="value" value=$fields.ccf_rheumatism_c.default_value }
{else}
{assign var="value" value=$fields.ccf_rheumatism_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_rheumatism_c.name}">{$fields.ccf_rheumatism_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HEART_ISSUES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_heart_issues_c"  >

{if !$fields.ccf_heart_issues_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_heart_issues_c.value) == "1" || strval($fields.ccf_heart_issues_c.value) == "yes" || strval($fields.ccf_heart_issues_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_heart_issues_c.name}" id="{$fields.ccf_heart_issues_c.name}" value="$fields.ccf_heart_issues_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HIGH_BLOOD' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_high_blood_c"  >

{if !$fields.ccf_high_blood_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_high_blood_c.value) == "1" || strval($fields.ccf_high_blood_c.value) == "yes" || strval($fields.ccf_high_blood_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_high_blood_c.name}" id="{$fields.ccf_high_blood_c.name}" value="$fields.ccf_high_blood_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_VERTIGO' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_vertigo_c"  >

{if !$fields.ccf_vertigo_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_vertigo_c.value) == "1" || strval($fields.ccf_vertigo_c.value) == "yes" || strval($fields.ccf_vertigo_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_vertigo_c.name}" id="{$fields.ccf_vertigo_c.name}" value="$fields.ccf_vertigo_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SCOLIOSIS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_scoliosis_c"  >

{if !$fields.ccf_scoliosis_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_scoliosis_c.value) == "1" || strval($fields.ccf_scoliosis_c.value) == "yes" || strval($fields.ccf_scoliosis_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_scoliosis_c.name}" id="{$fields.ccf_scoliosis_c.name}" value="$fields.ccf_scoliosis_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MEDICATION_ALLERGIES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_medication_allergies_c"  >

{if !$fields.ccf_medication_allergies_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_medication_allergies_c.value) <= 0}
{assign var="value" value=$fields.ccf_medication_allergies_c.default_value }
{else}
{assign var="value" value=$fields.ccf_medication_allergies_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_medication_allergies_c.name}">{$fields.ccf_medication_allergies_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_FOOD_ALLERGIES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_food_allergies_c"  >

{if !$fields.ccf_food_allergies_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_food_allergies_c.value) <= 0}
{assign var="value" value=$fields.ccf_food_allergies_c.default_value }
{else}
{assign var="value" value=$fields.ccf_food_allergies_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_food_allergies_c.name}">{$fields.ccf_food_allergies_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MED_OTHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="ccf_med_other_c" colspan='3' >

{if !$fields.ccf_med_other_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_med_other_c.value) <= 0}
{assign var="value" value=$fields.ccf_med_other_c.default_value }
{else}
{assign var="value" value=$fields.ccf_med_other_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_med_other_c.name}">{$fields.ccf_med_other_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-1" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL5' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-1" data-id="LBL_EDITVIEW_PANEL5">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_BLOOD_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_blood_type_c"  >

{if !$fields.ccf_blood_type_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_blood_type_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_blood_type_c.name}" value="{ $fields.ccf_blood_type_c.options }">
{ $fields.ccf_blood_type_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_blood_type_c.name}" value="{ $fields.ccf_blood_type_c.value }">
{ $fields.ccf_blood_type_c.options[$fields.ccf_blood_type_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_ARTHRITIS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_arthritis_c"  >

{if !$fields.ccf_arthritis_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_arthritis_c.value) == "1" || strval($fields.ccf_arthritis_c.value) == "yes" || strval($fields.ccf_arthritis_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_arthritis_c.name}" id="{$fields.ccf_arthritis_c.name}" value="$fields.ccf_arthritis_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_RHEUMATISM' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_rheumatism_c"  >

{if !$fields.ccf_rheumatism_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_rheumatism_c.value) <= 0}
{assign var="value" value=$fields.ccf_rheumatism_c.default_value }
{else}
{assign var="value" value=$fields.ccf_rheumatism_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_rheumatism_c.name}">{$fields.ccf_rheumatism_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HEART_ISSUES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_heart_issues_c"  >

{if !$fields.ccf_heart_issues_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_heart_issues_c.value) == "1" || strval($fields.ccf_heart_issues_c.value) == "yes" || strval($fields.ccf_heart_issues_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_heart_issues_c.name}" id="{$fields.ccf_heart_issues_c.name}" value="$fields.ccf_heart_issues_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HIGH_BLOOD' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_high_blood_c"  >

{if !$fields.ccf_high_blood_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_high_blood_c.value) == "1" || strval($fields.ccf_high_blood_c.value) == "yes" || strval($fields.ccf_high_blood_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_high_blood_c.name}" id="{$fields.ccf_high_blood_c.name}" value="$fields.ccf_high_blood_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_VERTIGO' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_vertigo_c"  >

{if !$fields.ccf_vertigo_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_vertigo_c.value) == "1" || strval($fields.ccf_vertigo_c.value) == "yes" || strval($fields.ccf_vertigo_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_vertigo_c.name}" id="{$fields.ccf_vertigo_c.name}" value="$fields.ccf_vertigo_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SCOLIOSIS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="bool" field="ccf_scoliosis_c"  >

{if !$fields.ccf_scoliosis_c.hidden}
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_scoliosis_c.value) == "1" || strval($fields.ccf_scoliosis_c.value) == "yes" || strval($fields.ccf_scoliosis_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="checkbox" class="checkbox" name="{$fields.ccf_scoliosis_c.name}" id="{$fields.ccf_scoliosis_c.name}" value="$fields.ccf_scoliosis_c.value" disabled="true" {$checked}>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MEDICATION_ALLERGIES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_medication_allergies_c"  >

{if !$fields.ccf_medication_allergies_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_medication_allergies_c.value) <= 0}
{assign var="value" value=$fields.ccf_medication_allergies_c.default_value }
{else}
{assign var="value" value=$fields.ccf_medication_allergies_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_medication_allergies_c.name}">{$fields.ccf_medication_allergies_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_FOOD_ALLERGIES' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_food_allergies_c"  >

{if !$fields.ccf_food_allergies_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_food_allergies_c.value) <= 0}
{assign var="value" value=$fields.ccf_food_allergies_c.default_value }
{else}
{assign var="value" value=$fields.ccf_food_allergies_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_food_allergies_c.name}">{$fields.ccf_food_allergies_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-12 detail-view-row-item">


<div class="col-xs-12 col-sm-2 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MED_OTHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-10 detail-view-field inlineEdit" type="varchar" field="ccf_med_other_c" colspan='3' >

{if !$fields.ccf_med_other_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_med_other_c.value) <= 0}
{assign var="value" value=$fields.ccf_med_other_c.default_value }
{else}
{assign var="value" value=$fields.ccf_med_other_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_med_other_c.name}">{$fields.ccf_med_other_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>
                            </div>
</div>
</div>
{/if}





{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-2" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-2"  data-id="LBL_EDITVIEW_PANEL3">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOBILE_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="phone_mobile"  class="phone">

{if !$fields.phone_mobile.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.phone_mobile.value)}
{assign var="phone_value" value=$fields.phone_mobile.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_HOME_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="phone_home"  class="phone">

{if !$fields.phone_home.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.phone_home.value)}
{assign var="phone_value" value=$fields.phone_home.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="email1"  >

{if !$fields.email1.hidden}
{counter name="panelFieldCount" print=false}
<span id='email1_span'>
{$fields.email1.value}
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IM_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_im_name_c"  >

{if !$fields.ccf_im_name_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_im_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_im_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_im_name_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_im_name_c.name}">{$fields.ccf_im_name_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IM_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_im_type_c"  >

{if !$fields.ccf_im_type_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_im_type_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_im_type_c.name}" value="{ $fields.ccf_im_type_c.options }">
{ $fields.ccf_im_type_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_im_type_c.name}" value="{ $fields.ccf_im_type_c.value }">
{ $fields.ccf_im_type_c.options[$fields.ccf_im_type_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PRIMARY_ADDRESS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="primary_address_street"  >

{if !$fields.primary_address_street.hidden}
{counter name="panelFieldCount" print=false}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%'>
<input type="hidden" class="sugar_field" id="primary_address_street"
value="{$fields.primary_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_city"
value="{$fields.primary_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_state"
value="{$fields.primary_address_state.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_country"
value="{$fields.primary_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_postalcode"
value="{$fields.primary_address_postalcode.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
{$fields.primary_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
<br>
{$fields.primary_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br} {$fields.primary_address_state.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
&nbsp;&nbsp;{$fields.primary_address_postalcode.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
<br>
{$fields.primary_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_primary}
</td>
</tr>
</table>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-2" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-2" data-id="LBL_EDITVIEW_PANEL3">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_MOBILE_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="phone_mobile"  class="phone">

{if !$fields.phone_mobile.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.phone_mobile.value)}
{assign var="phone_value" value=$fields.phone_mobile.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_HOME_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="phone" field="phone_home"  class="phone">

{if !$fields.phone_home.hidden}
{counter name="panelFieldCount" print=false}

{if !empty($fields.phone_home.value)}
{assign var="phone_value" value=$fields.phone_home.value }
{sugar_phone value=$phone_value usa_format="0"}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="email1"  >

{if !$fields.email1.hidden}
{counter name="panelFieldCount" print=false}
<span id='email1_span'>
{$fields.email1.value}
</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IM_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="ccf_im_name_c"  >

{if !$fields.ccf_im_name_c.hidden}
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_im_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_im_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_im_name_c.value }
{/if} 
<span class="sugar_field" id="{$fields.ccf_im_name_c.name}">{$fields.ccf_im_name_c.value}</span>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-2-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IM_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="enum" field="ccf_im_type_c"  >

{if !$fields.ccf_im_type_c.hidden}
{counter name="panelFieldCount" print=false}


{if is_string($fields.ccf_im_type_c.options)}
<input type="hidden" class="sugar_field" id="{$fields.ccf_im_type_c.name}" value="{ $fields.ccf_im_type_c.options }">
{ $fields.ccf_im_type_c.options }
{else}
<input type="hidden" class="sugar_field" id="{$fields.ccf_im_type_c.name}" value="{ $fields.ccf_im_type_c.value }">
{ $fields.ccf_im_type_c.options[$fields.ccf_im_type_c.value]}
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>

</div>


<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_PRIMARY_ADDRESS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="varchar" field="primary_address_street"  >

{if !$fields.primary_address_street.hidden}
{counter name="panelFieldCount" print=false}

<table border='0' cellpadding='0' cellspacing='0' width='100%'>
<tr>
<td width='99%'>
<input type="hidden" class="sugar_field" id="primary_address_street"
value="{$fields.primary_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_city"
value="{$fields.primary_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_state"
value="{$fields.primary_address_state.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_country"
value="{$fields.primary_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
<input type="hidden" class="sugar_field" id="primary_address_postalcode"
value="{$fields.primary_address_postalcode.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}">
{$fields.primary_address_street.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
<br>
{$fields.primary_address_city.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br} {$fields.primary_address_state.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
&nbsp;&nbsp;{$fields.primary_address_postalcode.value|escape:'html_entity_decode'|strip_tags|url2html|nl2br}
<br>
{$fields.primary_address_country.value|escape:'html_entity_decode'|escape:'html'|url2html|nl2br}
</td>
<td class='dataField' width='1%'>
{$custom_code_primary}
</td>
</tr>
</table>
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                            </div>
</div>
</div>
{/if}













{if $config.enable_action_menu and $config.enable_action_menu != false}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-7" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL12' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-7"  data-id="LBL_EDITVIEW_PANEL12">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GOOGLE_MAPS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="iframe" field="google_maps_c"  >

{if !$fields.google_maps_c.hidden}
{counter name="panelFieldCount" print=false}

{capture name=getLink assign=link}{$fields.google_maps_c.value}{/capture}
{sugar_replace_vars subject='https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=[primary_address_street],[primary_address_city],[primary_address_country]&amp;aq=&amp;iwloc=A&amp;output=embed' assign='link'}
{if !empty($link) && $link != "http://" && $link != "https://"}
{capture name=getStart assign=linkStart}{$link|substr:0:7}{/capture}
<input type="hidden" class="sugar_field" id="{$fields.google_maps_c.name}" value="{if ( $linkStart != 'http://' || $linkStart != 'https:/' ) && $link}http://{/if}{$link}">
<iframe src="{if $linkStart != 'http://' && $linkStart != 'https:/' && $link}http://{/if}{$link}" title="{if $linkStart != 'http://' && $linkStart != 'https:/' && $link}http://{/if}{$link}" height="{$fields.google_maps_c.height}" width="100%"/></iframe>
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                                </div>
</div>
</div>
{else}

<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse" href="#top-panel-7" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL12' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="top-panel-7" data-id="LBL_EDITVIEW_PANEL12">
<div class="tab-content">
<!-- TAB CONTENT -->





<div class="row detail-view-row">



<div class="col-xs-12 col-sm-6 detail-view-row-item">


<div class="col-xs-12 col-sm-4 label col-1-label">


{capture name="label" assign="label"}{sugar_translate label='LBL_GOOGLE_MAPS' module='Prospects'}{/capture}
{$label|strip_semicolon}:
</div>


<div class="col-xs-12 col-sm-8 detail-view-field inlineEdit" type="iframe" field="google_maps_c"  >

{if !$fields.google_maps_c.hidden}
{counter name="panelFieldCount" print=false}

{capture name=getLink assign=link}{$fields.google_maps_c.value}{/capture}
{sugar_replace_vars subject='https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=[primary_address_street],[primary_address_city],[primary_address_country]&amp;aq=&amp;iwloc=A&amp;output=embed' assign='link'}
{if !empty($link) && $link != "http://" && $link != "https://"}
{capture name=getStart assign=linkStart}{$link|substr:0:7}{/capture}
<input type="hidden" class="sugar_field" id="{$fields.google_maps_c.name}" value="{if ( $linkStart != 'http://' || $linkStart != 'https:/' ) && $link}http://{/if}{$link}">
<iframe src="{if $linkStart != 'http://' && $linkStart != 'https:/' && $link}http://{/if}{$link}" title="{if $linkStart != 'http://' && $linkStart != 'https:/' && $link}http://{/if}{$link}" height="{$fields.google_maps_c.height}" width="100%"/></iframe>
{/if}
{/if}

<div class="inlineEditIcon col-xs-hidden">
<span class="suitepicon suitepicon-action-edit"></span>
</div>
</div>


</div>




<div class="col-xs-12 col-sm-6 detail-view-row-item">
</div>

<div class="clear"></div>
</div>
                            </div>
</div>
</div>
{/if}
</div>
</div>

</form>
<script>SUGAR.util.doWhen("document.getElementById('form') != null",
        function(){ldelim}SUGAR.util.buildAccessKeyLabels();{rdelim});
</script>            <script type="text/javascript" src="include/InlineEditing/inlineEditing.js"></script>
<script type="text/javascript" src="modules/Favorites/favorites.js"></script>
{literal}
<script type="text/javascript">

                    var selectTabDetailView = function(tab) {
                        $('#content div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').hide();
                        $('#content div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').eq(tab).show().addClass('active').addClass('in');
                    };

                    var selectTabOnError = function(tab) {
                        selectTabDetailView(tab);
                        $('#content ul.nav.nav-tabs > li').removeClass('active');
                        $('#content ul.nav.nav-tabs > li a').css('color', '');

                        $('#content ul.nav.nav-tabs > li').eq(tab).find('a').first().css('color', 'red');
                        $('#content ul.nav.nav-tabs > li').eq(tab).addClass('active');

                    };

                    var selectTabOnErrorInputHandle = function(inputHandle) {
                        var tab = $(inputHandle).closest('.tab-pane-NOBOOTSTRAPTOGGLER').attr('id').match(/^detailpanel_(.*)$/)[1];
                        selectTabOnError(tab);
                    };


                    $(function(){
                        $('#content ul.nav.nav-tabs > li > a[data-toggle="tab"]').click(function(e){
                            if(typeof $(this).parent().find('a').first().attr('id') != 'undefined') {
                                var tab = parseInt($(this).parent().find('a').first().attr('id').match(/^tab(.)*$/)[1]);
                                selectTabDetailView(tab);
                            }
                        });
                    });

                </script>
{/literal}