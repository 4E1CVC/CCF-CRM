

<script>
    {literal}
    $(document).ready(function(){
	    $("ul.clickMenu").each(function(index, node){
	        $(node).sugarActionMenu();
	    });

        if($('.edit-view-pagination').children().length == 0) $('.saveAndContinue').remove();
    });
    {/literal}
</script>
<div class="clear"></div>
<form action="index.php" method="POST" name="{$form_name}" id="{$form_id}" {$enctype}>
<div class="edit-view-pagination-mobile-container">
<div class="edit-view-pagination edit-view-mobile-pagination">
{$PAGINATION}
</div>
</div>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="dcQuickEdit">
<tr>
<td class="buttons">
<input type="hidden" name="module" value="{$module}">
{if isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true"}
<input type="hidden" name="record" value="">
<input type="hidden" name="duplicateSave" value="true">
<input type="hidden" name="duplicateId" value="{$fields.id.value}">
{else}
<input type="hidden" name="record" value="{$fields.id.value}">
{/if}
<input type="hidden" name="isDuplicate" value="false">
<input type="hidden" name="action">
<input type="hidden" name="return_module" value="{$smarty.request.return_module}">
<input type="hidden" name="return_action" value="{$smarty.request.return_action}">
<input type="hidden" name="return_id" value="{$smarty.request.return_id}">
<input type="hidden" name="module_tab"> 
<input type="hidden" name="contact_role">
{if (!empty($smarty.request.return_module) || !empty($smarty.request.relate_to)) && !(isset($smarty.request.isDuplicate) && $smarty.request.isDuplicate eq "true")}
<input type="hidden" name="relate_to" value="{if $smarty.request.return_relationship}{$smarty.request.return_relationship}{elseif $smarty.request.relate_to && empty($smarty.request.from_dcmenu)}{$smarty.request.relate_to}{elseif empty($isDCForm) && empty($smarty.request.from_dcmenu)}{$smarty.request.return_module}{/if}">
<input type="hidden" name="relate_id" value="{$smarty.request.return_id}">
{/if}
<input type="hidden" name="offset" value="{$offset}">
{assign var='place' value="_HEADER"} <!-- to be used for id for buttons with custom code in def files-->
<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('EditView'); {if $isDuplicate}_form.return_id.value=''; {/if}_form.action.value='Save'; if(check_form('EditView'))SUGAR.ajaxUI.submitForm(_form);return false;" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}" id="SAVE">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && empty($fields.id.value)) && empty($smarty.request.return_id)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=ListView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && !empty($smarty.request.return_module)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action={$smarty.request.return_action}&module={$smarty.request.return_module|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module=Prospects'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {/if}
{if $showVCRControl}
<button type="button" id="save_and_continue" class="button saveAndContinue" title="{$app_strings.LBL_SAVE_AND_CONTINUE}" onClick="SUGAR.saveAndContinue(this);">
{$APP.LBL_SAVE_AND_CONTINUE}
</button>
{/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Prospects", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</td>
<td align='right' class="edit-view-pagination-desktop-container">
<div class="edit-view-pagination edit-view-pagination-desktop">
{$PAGINATION}
</div>
</td>
</tr>
</table>
{sugar_include include=$includes}
<div id="EditView_tabs">

<ul class="nav nav-tabs">


<li role="presentation" class="active">
<a id="tab0" data-toggle="tab" class="hidden-xs">
{sugar_translate label='LBL_PROSPECT_INFORMATION' module='Prospects'}
</a>


<!-- Counting Tabs 4-->
<a id="xstab0" href="#" class="visible-xs first-tab-xs dropdown-toggle" data-toggle="dropdown">
{sugar_translate label='LBL_PROSPECT_INFORMATION' module='Prospects'}
</a>
<ul id="first-tab-menu-xs" class="dropdown-menu">
<li role="presentation">
<a id="tab0" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-0');">
{sugar_translate label='LBL_PROSPECT_INFORMATION' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab1" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-1');">
{sugar_translate label='LBL_EDITVIEW_PANEL6' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab2" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-2');">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab3" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-3');">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='Prospects'}
</a>
</li>
<li role="presentation">
<a id="tab4" data-toggle="tab" onclick="changeFirstTab(this, 'tab-content-4');">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='Prospects'}
</a>
</li>
</ul>
</li>








<li role="presentation" class="hidden-xs">
<a id="tab1"  data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL6' module='Prospects'}
</a>
</li>


<li role="presentation" class="hidden-xs">
<a id="tab2"  data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL7' module='Prospects'}
</a>
</li>


<li role="presentation" class="hidden-xs">
<a id="tab3"  data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL9' module='Prospects'}
</a>
</li>


<li role="presentation" class="hidden-xs">
<a id="tab4"  data-toggle="tab">
{sugar_translate label='LBL_EDITVIEW_PANEL10' module='Prospects'}
</a>
</li>


</ul>
<div class="clearfix"></div>
<div class="tab-content">

<div class="tab-pane-NOBOOTSTRAPTOGGLER active fade in" id='tab-content-0'>
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCC_PHOTO">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCC_PHOTO' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="image" field="ccc_photo_c"  >
{counter name="panelFieldCount" print=false}

<script type="text/javascript">
    {literal}
        $( document ).ready(function() {
        $( "form#EditView" )
        .attr( "enctype", "multipart/form-data" )
        .attr( "encoding", "multipart/form-data" );
    });
{/literal}
</script>
<script type="text/javascript" src='include/SugarFields/Fields/Image/SugarFieldFile.js?v=8P9QuPYDFG4_GOEY3MQrtw'></script>
{if !empty($fields.ccc_photo_c.value) }
{assign var=showRemove value=true}
{else}
{assign var=showRemove value=false}
{/if}
{assign var=noChange value=false}
<input type="hidden" name="deleteAttachment" value="0">
<input type="hidden" name="{$fields.ccc_photo_c.name}" id="{$fields.ccc_photo_c.name}" value="{$fields.ccc_photo_c.value}">
<input type="hidden" name="{$fields.ccc_photo_c.name}_record_id" id="{$fields.ccc_photo_c.name}_record_id" value="{$fields.id.value}">
<span id="{$fields.ccc_photo_c.name}_old" style="display:{if !$showRemove}none;{/if}">
<a href="index.php?entryPoint=download&id={$fields.id.value}_{$fields.ccc_photo_c.name}&type={$module}&time={$fields.date_modified.value}" class="tabDetailViewDFLink">{$fields.ccc_photo_c.value}</a>
{if !$noChange}
<input type='button' class='button' id='remove_button' value='{$APP.LBL_REMOVE}' onclick='SUGAR.field.file.deleteAttachment("{$fields.ccc_photo_c.name}","",this);'>
{/if}
</span>
{if !$noChange}
<span id="{$fields.ccc_photo_c.name}_new" style="display:{if $showRemove}none;{/if}">
<input type="hidden" name="{$fields.ccc_photo_c.name}_escaped">
<input id="{$fields.ccc_photo_c.name}_file" name="{$fields.ccc_photo_c.name}_file"
type="file" title='' size="30"
maxlength='255'
>
{else}

{/if}
<script type="text/javascript">
$( "#{$fields.ccc_photo_c.name}_file{literal} " ).change(function() {
        $("#{/literal}{$fields.ccc_photo_c.name}{literal}").val($("#{/literal}{$fields.ccc_photo_c.name}_file{literal}").val());
});{/literal}
        </script>
</span>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_VOLUNTEER">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_VOLUNTEER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_volunteer_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_volunteer_c.value) == "1" || strval($fields.ccf_volunteer_c.value) == "yes" || strval($fields.ccf_volunteer_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_volunteer_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_volunteer_c.name}" 
name="{$fields.ccf_volunteer_c.name}" 
value="1" title='CCF Volunteer for Event ?' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_FIRST_NAME">

{capture name="label" assign="label"}{sugar_translate label='LBL_FIRST_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="first_name"  >
{counter name="panelFieldCount"  print=false}
{html_options name="salutation" id="salutation" options=$fields.salutation.options selected=$fields.salutation.value}&nbsp;<input tabindex="0"  name="first_name"  id="first_name" size="25" maxlength="25" type="text" value="{$fields.first_name.value}">
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_LAST_NAME">

{capture name="label" assign="label"}{sugar_translate label='LBL_LAST_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="last_name"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.last_name.value) <= 0}
{assign var="value" value=$fields.last_name.default_value }
{else}
{assign var="value" value=$fields.last_name.value }
{/if}  
<input type='text' name='{$fields.last_name.name}' 
id='{$fields.last_name.name}' size='30' 
maxlength='100' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_BIRTHDATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_BIRTHDATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="birthdate"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.birthdate.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.birthdate.name}" id="{$fields.birthdate.name}" value="{$date_value}" title=''  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.birthdate.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.birthdate.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.birthdate.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_DEPARTMENT">

{capture name="label" assign="label"}{sugar_translate label='LBL_DEPARTMENT' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="department"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.department.value) <= 0}
{assign var="value" value=$fields.department.default_value }
{else}
{assign var="value" value=$fields.department.value }
{/if}  
<input type='text' name='{$fields.department.name}' 
id='{$fields.department.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_GENDER">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_GENDER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_gender_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_gender_c.name}" 
id="{$fields.ccf_gender_c.name}" 
title=''       
>
{if isset($fields.ccf_gender_c.value) && $fields.ccf_gender_c.value != ''}
{html_options options=$fields.ccf_gender_c.options selected=$fields.ccf_gender_c.value}
{else}
{html_options options=$fields.ccf_gender_c.options selected=$fields.ccf_gender_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_gender_c.options }
{capture name="field_val"}{$fields.ccf_gender_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_gender_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_gender_c.name}" 
id="{$fields.ccf_gender_c.name}" 
title=''          
>
{if isset($fields.ccf_gender_c.value) && $fields.ccf_gender_c.value != ''}
{html_options options=$fields.ccf_gender_c.options selected=$fields.ccf_gender_c.value}
{else}
{html_options options=$fields.ccf_gender_c.options selected=$fields.ccf_gender_c.default}
{/if}
</select>
<input
id="{$fields.ccf_gender_c.name}-input"
name="{$fields.ccf_gender_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_gender_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_gender_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_gender_c.name}-input', '{$fields.ccf_gender_c.name}');sync_{$fields.ccf_gender_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_gender_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_gender_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_gender_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_gender_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_gender_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_gender_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_gender_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_gender_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_gender_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_gender_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_CIVIL_STATUS">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_CIVIL_STATUS' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_civil_status_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_civil_status_c.name}" 
id="{$fields.ccf_civil_status_c.name}" 
title='Provide your CURRENT civil status - whether Married, Single, Widowed or Separated'       
>
{if isset($fields.ccf_civil_status_c.value) && $fields.ccf_civil_status_c.value != ''}
{html_options options=$fields.ccf_civil_status_c.options selected=$fields.ccf_civil_status_c.value}
{else}
{html_options options=$fields.ccf_civil_status_c.options selected=$fields.ccf_civil_status_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_civil_status_c.options }
{capture name="field_val"}{$fields.ccf_civil_status_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_civil_status_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_civil_status_c.name}" 
id="{$fields.ccf_civil_status_c.name}" 
title='Provide your CURRENT civil status - whether Married, Single, Widowed or Separated'          
>
{if isset($fields.ccf_civil_status_c.value) && $fields.ccf_civil_status_c.value != ''}
{html_options options=$fields.ccf_civil_status_c.options selected=$fields.ccf_civil_status_c.value}
{else}
{html_options options=$fields.ccf_civil_status_c.options selected=$fields.ccf_civil_status_c.default}
{/if}
</select>
<input
id="{$fields.ccf_civil_status_c.name}-input"
name="{$fields.ccf_civil_status_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_civil_status_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_civil_status_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_civil_status_c.name}-input', '{$fields.ccf_civil_status_c.name}');sync_{$fields.ccf_civil_status_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_civil_status_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_civil_status_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_civil_status_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_civil_status_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_civil_status_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_civil_status_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_civil_status_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_civil_status_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_civil_status_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_civil_status_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_JOB_PROFESSION">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_JOB_PROFESSION' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_job_profession_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_job_profession_c.value) <= 0}
{assign var="value" value=$fields.ccf_job_profession_c.default_value }
{else}
{assign var="value" value=$fields.ccf_job_profession_c.value }
{/if}  
<input type='text' name='{$fields.ccf_job_profession_c.name}' 
id='{$fields.ccf_job_profession_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_COMPANY">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_COMPANY' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_company_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_company_c.value) <= 0}
{assign var="value" value=$fields.ccf_company_c.default_value }
{else}
{assign var="value" value=$fields.ccf_company_c.value }
{/if}  
<input type='text' name='{$fields.ccf_company_c.name}' 
id='{$fields.ccf_company_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Enter the Name of your Company'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>            </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-1'>
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_LEADER_NAME">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_LEADER_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_dgroup_leader_name_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_dgroup_leader_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_dgroup_leader_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_dgroup_leader_name_c.value }
{/if}  
<input type='text' name='{$fields.ccf_dgroup_leader_name_c.name}' 
id='{$fields.ccf_dgroup_leader_name_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='The Name of your DGroup Leader'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_LEADER_PHONE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_LEADER_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="phone" field="ccf_dgroup_leader_phone_c"  class="phone">
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_dgroup_leader_phone_c.value) <= 0}
{assign var="value" value=$fields.ccf_dgroup_leader_phone_c.default_value }
{else}
{assign var="value" value=$fields.ccf_dgroup_leader_phone_c.value }
{/if}  
<input type='text' name='{$fields.ccf_dgroup_leader_phone_c.name}' id='{$fields.ccf_dgroup_leader_phone_c.name}' size='30' maxlength='255' value='{$value}' title='Enter your DGroup Leader&#039;s Phone' tabindex='0'	  class="phone" >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_TYPE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_dgroup_type_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_dgroup_type_c.name}" 
id="{$fields.ccf_dgroup_type_c.name}" 
title='Select the TYPE of DGroup'       
>
{if isset($fields.ccf_dgroup_type_c.value) && $fields.ccf_dgroup_type_c.value != ''}
{html_options options=$fields.ccf_dgroup_type_c.options selected=$fields.ccf_dgroup_type_c.value}
{else}
{html_options options=$fields.ccf_dgroup_type_c.options selected=$fields.ccf_dgroup_type_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_dgroup_type_c.options }
{capture name="field_val"}{$fields.ccf_dgroup_type_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_dgroup_type_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_dgroup_type_c.name}" 
id="{$fields.ccf_dgroup_type_c.name}" 
title='Select the TYPE of DGroup'          
>
{if isset($fields.ccf_dgroup_type_c.value) && $fields.ccf_dgroup_type_c.value != ''}
{html_options options=$fields.ccf_dgroup_type_c.options selected=$fields.ccf_dgroup_type_c.value}
{else}
{html_options options=$fields.ccf_dgroup_type_c.options selected=$fields.ccf_dgroup_type_c.default}
{/if}
</select>
<input
id="{$fields.ccf_dgroup_type_c.name}-input"
name="{$fields.ccf_dgroup_type_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_dgroup_type_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_dgroup_type_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_dgroup_type_c.name}-input', '{$fields.ccf_dgroup_type_c.name}');sync_{$fields.ccf_dgroup_type_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_type_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_dgroup_type_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_dgroup_type_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_dgroup_type_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_type_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_dgroup_type_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_type_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_dgroup_type_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_dgroup_type_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_type_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_dgroup_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_dgroup_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_dgroup_date_c.name}" id="{$fields.ccf_dgroup_date_c.name}" value="{$date_value}" title=''  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_dgroup_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_dgroup_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_dgroup_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_DAY">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_DAY' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_dgroup_day_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_dgroup_day_c.name}" 
id="{$fields.ccf_dgroup_day_c.name}" 
title='Select the DAY of your D-Group'       
>
{if isset($fields.ccf_dgroup_day_c.value) && $fields.ccf_dgroup_day_c.value != ''}
{html_options options=$fields.ccf_dgroup_day_c.options selected=$fields.ccf_dgroup_day_c.value}
{else}
{html_options options=$fields.ccf_dgroup_day_c.options selected=$fields.ccf_dgroup_day_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_dgroup_day_c.options }
{capture name="field_val"}{$fields.ccf_dgroup_day_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_dgroup_day_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_dgroup_day_c.name}" 
id="{$fields.ccf_dgroup_day_c.name}" 
title='Select the DAY of your D-Group'          
>
{if isset($fields.ccf_dgroup_day_c.value) && $fields.ccf_dgroup_day_c.value != ''}
{html_options options=$fields.ccf_dgroup_day_c.options selected=$fields.ccf_dgroup_day_c.value}
{else}
{html_options options=$fields.ccf_dgroup_day_c.options selected=$fields.ccf_dgroup_day_c.default}
{/if}
</select>
<input
id="{$fields.ccf_dgroup_day_c.name}-input"
name="{$fields.ccf_dgroup_day_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_dgroup_day_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_dgroup_day_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_dgroup_day_c.name}-input', '{$fields.ccf_dgroup_day_c.name}');sync_{$fields.ccf_dgroup_day_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_day_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_dgroup_day_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_dgroup_day_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_dgroup_day_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_day_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_dgroup_day_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_day_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_dgroup_day_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_dgroup_day_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_day_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_TIMES">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_TIMES' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_dgroup_times_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_dgroup_times_c.name}" 
id="{$fields.ccf_dgroup_times_c.name}" 
title='Enter the TIME of your D-Group'       
>
{if isset($fields.ccf_dgroup_times_c.value) && $fields.ccf_dgroup_times_c.value != ''}
{html_options options=$fields.ccf_dgroup_times_c.options selected=$fields.ccf_dgroup_times_c.value}
{else}
{html_options options=$fields.ccf_dgroup_times_c.options selected=$fields.ccf_dgroup_times_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_dgroup_times_c.options }
{capture name="field_val"}{$fields.ccf_dgroup_times_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_dgroup_times_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_dgroup_times_c.name}" 
id="{$fields.ccf_dgroup_times_c.name}" 
title='Enter the TIME of your D-Group'          
>
{if isset($fields.ccf_dgroup_times_c.value) && $fields.ccf_dgroup_times_c.value != ''}
{html_options options=$fields.ccf_dgroup_times_c.options selected=$fields.ccf_dgroup_times_c.value}
{else}
{html_options options=$fields.ccf_dgroup_times_c.options selected=$fields.ccf_dgroup_times_c.default}
{/if}
</select>
<input
id="{$fields.ccf_dgroup_times_c.name}-input"
name="{$fields.ccf_dgroup_times_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_dgroup_times_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_dgroup_times_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_dgroup_times_c.name}-input', '{$fields.ccf_dgroup_times_c.name}');sync_{$fields.ccf_dgroup_times_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_times_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_dgroup_times_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_dgroup_times_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_dgroup_times_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_times_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_dgroup_times_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_times_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_dgroup_times_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_dgroup_times_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_dgroup_times_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_DGROUP_LEADER">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_DGROUP_LEADER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_dgroup_leader_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_dgroup_leader_c.value) == "1" || strval($fields.ccf_dgroup_leader_c.value) == "yes" || strval($fields.ccf_dgroup_leader_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_dgroup_leader_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_dgroup_leader_c.name}" 
name="{$fields.ccf_dgroup_leader_c.name}" 
value="1" title='Do you have your own D-Group ?' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCD_D12_LEADER">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCD_D12_LEADER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccd_d12_leader_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccd_d12_leader_c.value) == "1" || strval($fields.ccd_d12_leader_c.value) == "yes" || strval($fields.ccd_d12_leader_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccd_d12_leader_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccd_d12_leader_c.name}" 
name="{$fields.ccd_d12_leader_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_AREA__PASTOR">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_AREA__PASTOR' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_area__pastor_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_area__pastor_c.value) <= 0}
{assign var="value" value=$fields.ccf_area__pastor_c.default_value }
{else}
{assign var="value" value=$fields.ccf_area__pastor_c.value }
{/if}  
<input type='text' name='{$fields.ccf_area__pastor_c.name}' 
id='{$fields.ccf_area__pastor_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_GLC1_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_GLC1_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_glc1_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_glc1_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_glc1_date_c.name}" id="{$fields.ccf_glc1_date_c.name}" value="{$date_value}" title='Date you completed GLC-1'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_glc1_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_glc1_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_glc1_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_GLC2_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_GLC2_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_glc2_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_glc2_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_glc2_date_c.name}" id="{$fields.ccf_glc2_date_c.name}" value="{$date_value}" title='Enter the Date you completed GLC-2'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_glc2_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_glc2_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_glc2_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_TRUELIFE_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_TRUELIFE_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_truelife_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_truelife_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_truelife_date_c.name}" id="{$fields.ccf_truelife_date_c.name}" value="{$date_value}" title='Date you completed True Life'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_truelife_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_truelife_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_truelife_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_IDC_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IDC_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_idc_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_idc_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_idc_date_c.name}" id="{$fields.ccf_idc_date_c.name}" value="{$date_value}" title='Date you completed IDC'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_idc_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_idc_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_idc_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_COUPLES_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_COUPLES_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_couples_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_couples_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_couples_date_c.name}" id="{$fields.ccf_couples_date_c.name}" value="{$date_value}" title='Date you completed Couple&#039;s Retreat'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_couples_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_couples_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_couples_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>            </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-2'>
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HOST_ORIENTATION">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HOST_ORIENTATION' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_host_orientation_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_host_orientation_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_host_orientation_c.name}" id="{$fields.ccf_host_orientation_c.name}" value="{$date_value}" title='Enter the date of your Orientation'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_host_orientation_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_host_orientation_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_host_orientation_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HOST_SERVICE_DATE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HOST_SERVICE_DATE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="date" field="ccf_host_service_date_c"  >
{counter name="panelFieldCount" print=false}

<span class="dateTime">
{assign var=date_value value=$fields.ccf_host_service_date_c.value }
<input class="date_input" autocomplete="off" type="text" name="{$fields.ccf_host_service_date_c.name}" id="{$fields.ccf_host_service_date_c.name}" value="{$date_value}" title='Enter the Date of your first Host Team Service'  tabindex='0'    size="11" maxlength="10" >
<button type="button" id="{$fields.ccf_host_service_date_c.name}_trigger" class="btn btn-danger" onclick="return false;"><span class="suitepicon suitepicon-module-calendar" alt="{$APP.LBL_ENTER_DATE}"></span></button>
</span>
<script type="text/javascript">
Calendar.setup ({ldelim}
inputField : "{$fields.ccf_host_service_date_c.name}",
form : "EditView",
ifFormat : "{$CALENDAR_FORMAT}",
daFormat : "{$CALENDAR_FORMAT}",
button : "{$fields.ccf_host_service_date_c.name}_trigger",
singleClick : true,
dateStr : "{$date_value}",
startWeekday: {$CALENDAR_FDOW|default:'0'},
step : 1,
weekNumbers:false
{rdelim}
);
</script>
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HOST_2017_FELLOWSHIP">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HOST_2017_FELLOWSHIP' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_host_2017_fellowship_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_host_2017_fellowship_c.value) == "1" || strval($fields.ccf_host_2017_fellowship_c.value) == "yes" || strval($fields.ccf_host_2017_fellowship_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_host_2017_fellowship_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_host_2017_fellowship_c.name}" 
name="{$fields.ccf_host_2017_fellowship_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HT_RADICALHOSTING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_RADICALHOSTING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_ht_radicalhosting_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_ht_radicalhosting_c.value) == "1" || strval($fields.ccf_ht_radicalhosting_c.value) == "yes" || strval($fields.ccf_ht_radicalhosting_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_ht_radicalhosting_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_ht_radicalhosting_c.name}" 
name="{$fields.ccf_ht_radicalhosting_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HT_MINDSET">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_MINDSET' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_ht_mindset_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_ht_mindset_c.value) == "1" || strval($fields.ccf_ht_mindset_c.value) == "yes" || strval($fields.ccf_ht_mindset_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_ht_mindset_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_ht_mindset_c.name}" 
name="{$fields.ccf_ht_mindset_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HT_SUPPORT_TL_REFRESHER">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_SUPPORT_TL_REFRESHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_ht_support_tl_refresher_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_ht_support_tl_refresher_c.value) == "1" || strval($fields.ccf_ht_support_tl_refresher_c.value) == "yes" || strval($fields.ccf_ht_support_tl_refresher_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_ht_support_tl_refresher_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_ht_support_tl_refresher_c.name}" 
name="{$fields.ccf_ht_support_tl_refresher_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_LBL_CCF_HT_PM_TL_REFRESHER">

{capture name="label" assign="label"}{sugar_translate label='LBL_LBL_CCF_HT_PM_TL_REFRESHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="lbl_ccf_ht_pm_tl_refresher_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.lbl_ccf_ht_pm_tl_refresher_c.value) == "1" || strval($fields.lbl_ccf_ht_pm_tl_refresher_c.value) == "yes" || strval($fields.lbl_ccf_ht_pm_tl_refresher_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.lbl_ccf_ht_pm_tl_refresher_c.name}" value="0"> 
<input type="checkbox" id="{$fields.lbl_ccf_ht_pm_tl_refresher_c.name}" 
name="{$fields.lbl_ccf_ht_pm_tl_refresher_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HT_OTHER_TRAINING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HT_OTHER_TRAINING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_ht_other_training_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_ht_other_training_c.value) <= 0}
{assign var="value" value=$fields.ccf_ht_other_training_c.default_value }
{else}
{assign var="value" value=$fields.ccf_ht_other_training_c.value }
{/if}  
<input type='text' name='{$fields.ccf_ht_other_training_c.name}' 
id='{$fields.ccf_ht_other_training_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Enter other training that you have attended'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>            </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-3'>
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_CHOIR">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_CHOIR' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_choir_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_choir_c.value) == "1" || strval($fields.ccf_mininv_choir_c.value) == "yes" || strval($fields.ccf_mininv_choir_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_choir_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_choir_c.name}" 
name="{$fields.ccf_mininv_choir_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_EXALT">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_EXALT' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_exalt_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_exalt_c.value) == "1" || strval($fields.ccf_mininv_exalt_c.value) == "yes" || strval($fields.ccf_mininv_exalt_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_exalt_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_exalt_c.name}" 
name="{$fields.ccf_mininv_exalt_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_FAMILY">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_FAMILY' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_family_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_family_c.value) == "1" || strval($fields.ccf_mininv_family_c.value) == "yes" || strval($fields.ccf_mininv_family_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_family_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_family_c.name}" 
name="{$fields.ccf_mininv_family_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_HOSTING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_HOSTING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_hosting_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_hosting_c.value) == "1" || strval($fields.ccf_mininv_hosting_c.value) == "yes" || strval($fields.ccf_mininv_hosting_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_hosting_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_hosting_c.name}" 
name="{$fields.ccf_mininv_hosting_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_LAW">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_LAW' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_law_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_law_c.value) == "1" || strval($fields.ccf_mininv_law_c.value) == "yes" || strval($fields.ccf_mininv_law_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_law_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_law_c.name}" 
name="{$fields.ccf_mininv_law_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_LIVEPRODUCTION">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_LIVEPRODUCTION' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_liveproduction_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_liveproduction_c.value) == "1" || strval($fields.ccf_mininv_liveproduction_c.value) == "yes" || strval($fields.ccf_mininv_liveproduction_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_liveproduction_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_liveproduction_c.name}" 
name="{$fields.ccf_mininv_liveproduction_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_NXTGEN">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_NXTGEN' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_nxtgen_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_nxtgen_c.value) == "1" || strval($fields.ccf_mininv_nxtgen_c.value) == "yes" || strval($fields.ccf_mininv_nxtgen_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_nxtgen_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_nxtgen_c.name}" 
name="{$fields.ccf_mininv_nxtgen_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="">

{capture name="label" assign="label"}{sugar_translate label='' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_sns_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_sns_c.value) == "1" || strval($fields.ccf_mininv_sns_c.value) == "yes" || strval($fields.ccf_mininv_sns_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_sns_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_sns_c.name}" 
name="{$fields.ccf_mininv_sns_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_SPORTS">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_SPORTS' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_sports_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_sports_c.value) == "1" || strval($fields.ccf_mininv_sports_c.value) == "yes" || strval($fields.ccf_mininv_sports_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_sports_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_sports_c.name}" 
name="{$fields.ccf_mininv_sports_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MININV_PARKINGSHUTTLE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MININV_PARKINGSHUTTLE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_mininv_parkingshuttle_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_mininv_parkingshuttle_c.value) == "1" || strval($fields.ccf_mininv_parkingshuttle_c.value) == "yes" || strval($fields.ccf_mininv_parkingshuttle_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_mininv_parkingshuttle_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_mininv_parkingshuttle_c.name}" 
name="{$fields.ccf_mininv_parkingshuttle_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>            </div>
<div class="tab-pane-NOBOOTSTRAPTOGGLER fade" id='tab-content-4'>
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_MED">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_MED' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_med_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_med_c.value) == "1" || strval($fields.ccf_skills_med_c.value) == "yes" || strval($fields.ccf_skills_med_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_med_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_med_c.name}" 
name="{$fields.ccf_skills_med_c.name}" 
value="1" title='Indicate if you are a Doctor, Nurse or Paramedic' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_FIRE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_FIRE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_fire_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_fire_c.value) == "1" || strval($fields.ccf_skills_fire_c.value) == "yes" || strval($fields.ccf_skills_fire_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_fire_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_fire_c.name}" 
name="{$fields.ccf_skills_fire_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_POLICE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_POLICE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_police_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_police_c.value) == "1" || strval($fields.ccf_skills_police_c.value) == "yes" || strval($fields.ccf_skills_police_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_police_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_police_c.name}" 
name="{$fields.ccf_skills_police_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_ATTORNEY">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_ATTORNEY' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_attorney_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_attorney_c.value) == "1" || strval($fields.ccf_skills_attorney_c.value) == "yes" || strval($fields.ccf_skills_attorney_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_attorney_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_attorney_c.name}" 
name="{$fields.ccf_skills_attorney_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_AUDIO">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_AUDIO' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_audio_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_audio_c.value) == "1" || strval($fields.ccf_skills_audio_c.value) == "yes" || strval($fields.ccf_skills_audio_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_audio_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_audio_c.name}" 
name="{$fields.ccf_skills_audio_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_VIDEO">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_VIDEO' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_video_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_video_c.value) == "1" || strval($fields.ccf_skills_video_c.value) == "yes" || strval($fields.ccf_skills_video_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_video_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_video_c.name}" 
name="{$fields.ccf_skills_video_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_PHOTOGRAPHY">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_PHOTOGRAPHY' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_photography_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_photography_c.value) == "1" || strval($fields.ccf_skills_photography_c.value) == "yes" || strval($fields.ccf_skills_photography_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_photography_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_photography_c.name}" 
name="{$fields.ccf_skills_photography_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_VIDEOPRODUCTION">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_VIDEOPRODUCTION' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_videoproduction_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_videoproduction_c.value) == "1" || strval($fields.ccf_skills_videoproduction_c.value) == "yes" || strval($fields.ccf_skills_videoproduction_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_videoproduction_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_videoproduction_c.name}" 
name="{$fields.ccf_skills_videoproduction_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_ACCOUNTING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_ACCOUNTING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_accounting_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_accounting_c.value) == "1" || strval($fields.ccf_skills_accounting_c.value) == "yes" || strval($fields.ccf_skills_accounting_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_accounting_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_accounting_c.name}" 
name="{$fields.ccf_skills_accounting_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_PLANNING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_PLANNING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_planning_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_planning_c.value) == "1" || strval($fields.ccf_skills_planning_c.value) == "yes" || strval($fields.ccf_skills_planning_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_planning_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_planning_c.name}" 
name="{$fields.ccf_skills_planning_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_MUSIC">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_MUSIC' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_music_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_music_c.value) == "1" || strval($fields.ccf_skills_music_c.value) == "yes" || strval($fields.ccf_skills_music_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_music_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_music_c.name}" 
name="{$fields.ccf_skills_music_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_SINGING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_SINGING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_singing_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_singing_c.value) == "1" || strval($fields.ccf_skills_singing_c.value) == "yes" || strval($fields.ccf_skills_singing_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_singing_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_singing_c.name}" 
name="{$fields.ccf_skills_singing_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_DANCE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_DANCE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_dance_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_dance_c.value) == "1" || strval($fields.ccf_skills_dance_c.value) == "yes" || strval($fields.ccf_skills_dance_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_dance_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_dance_c.name}" 
name="{$fields.ccf_skills_dance_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_DRAMA">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_DRAMA' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_drama_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_drama_c.value) == "1" || strval($fields.ccf_skills_drama_c.value) == "yes" || strval($fields.ccf_skills_drama_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_drama_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_drama_c.name}" 
name="{$fields.ccf_skills_drama_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_MSOFFICE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_MSOFFICE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_msoffice_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_msoffice_c.value) == "1" || strval($fields.ccf_skills_msoffice_c.value) == "yes" || strval($fields.ccf_skills_msoffice_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_msoffice_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_msoffice_c.name}" 
name="{$fields.ccf_skills_msoffice_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_PROGRAMMING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_PROGRAMMING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_programming_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_programming_c.value) == "1" || strval($fields.ccf_skills_programming_c.value) == "yes" || strval($fields.ccf_skills_programming_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_programming_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_programming_c.name}" 
name="{$fields.ccf_skills_programming_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SKILLS_TRAINING">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SKILLS_TRAINING' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_skills_training_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_skills_training_c.value) == "1" || strval($fields.ccf_skills_training_c.value) == "yes" || strval($fields.ccf_skills_training_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_skills_training_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_skills_training_c.name}" 
name="{$fields.ccf_skills_training_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>            </div>
</div>

<div class="panel-content">
<div>&nbsp;</div>






<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL4' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_0" data-id="LBL_EDITVIEW_PANEL4">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_EMER_NAME">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_emer_name_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_emer_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_emer_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_emer_name_c.value }
{/if}  
<input type='text' name='{$fields.ccf_emer_name_c.name}' 
id='{$fields.ccf_emer_name_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Name of your Emergency Contact'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_EMER_RELATION">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_RELATION' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_emer_relation_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_emer_relation_c.name}" 
id="{$fields.ccf_emer_relation_c.name}" 
title='Relationship to You'       
>
{if isset($fields.ccf_emer_relation_c.value) && $fields.ccf_emer_relation_c.value != ''}
{html_options options=$fields.ccf_emer_relation_c.options selected=$fields.ccf_emer_relation_c.value}
{else}
{html_options options=$fields.ccf_emer_relation_c.options selected=$fields.ccf_emer_relation_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_emer_relation_c.options }
{capture name="field_val"}{$fields.ccf_emer_relation_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_emer_relation_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_emer_relation_c.name}" 
id="{$fields.ccf_emer_relation_c.name}" 
title='Relationship to You'          
>
{if isset($fields.ccf_emer_relation_c.value) && $fields.ccf_emer_relation_c.value != ''}
{html_options options=$fields.ccf_emer_relation_c.options selected=$fields.ccf_emer_relation_c.value}
{else}
{html_options options=$fields.ccf_emer_relation_c.options selected=$fields.ccf_emer_relation_c.default}
{/if}
</select>
<input
id="{$fields.ccf_emer_relation_c.name}-input"
name="{$fields.ccf_emer_relation_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_emer_relation_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_emer_relation_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_emer_relation_c.name}-input', '{$fields.ccf_emer_relation_c.name}');sync_{$fields.ccf_emer_relation_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_emer_relation_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_emer_relation_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_emer_relation_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_emer_relation_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_emer_relation_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_emer_relation_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_emer_relation_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_emer_relation_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_emer_relation_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_emer_relation_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_EMER_PHONE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_EMER_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="phone" field="ccf_emer_phone_c"  class="phone">
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_emer_phone_c.value) <= 0}
{assign var="value" value=$fields.ccf_emer_phone_c.default_value }
{else}
{assign var="value" value=$fields.ccf_emer_phone_c.value }
{/if}  
<input type='text' name='{$fields.ccf_emer_phone_c.name}' id='{$fields.ccf_emer_phone_c.name}' size='30' maxlength='255' value='{$value}' title='' tabindex='0'	  class="phone" >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL5' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_1" data-id="LBL_EDITVIEW_PANEL5">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_BLOOD_TYPE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_BLOOD_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

<span class="required">*</span>
</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_blood_type_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_blood_type_c.name}" 
id="{$fields.ccf_blood_type_c.name}" 
title=''       
>
{if isset($fields.ccf_blood_type_c.value) && $fields.ccf_blood_type_c.value != ''}
{html_options options=$fields.ccf_blood_type_c.options selected=$fields.ccf_blood_type_c.value}
{else}
{html_options options=$fields.ccf_blood_type_c.options selected=$fields.ccf_blood_type_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_blood_type_c.options }
{capture name="field_val"}{$fields.ccf_blood_type_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_blood_type_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_blood_type_c.name}" 
id="{$fields.ccf_blood_type_c.name}" 
title=''          
>
{if isset($fields.ccf_blood_type_c.value) && $fields.ccf_blood_type_c.value != ''}
{html_options options=$fields.ccf_blood_type_c.options selected=$fields.ccf_blood_type_c.value}
{else}
{html_options options=$fields.ccf_blood_type_c.options selected=$fields.ccf_blood_type_c.default}
{/if}
</select>
<input
id="{$fields.ccf_blood_type_c.name}-input"
name="{$fields.ccf_blood_type_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_blood_type_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_blood_type_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_blood_type_c.name}-input', '{$fields.ccf_blood_type_c.name}');sync_{$fields.ccf_blood_type_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_blood_type_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_blood_type_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_blood_type_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_blood_type_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_blood_type_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_blood_type_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_blood_type_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_blood_type_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_blood_type_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_blood_type_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_ARTHRITIS">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_ARTHRITIS' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_arthritis_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_arthritis_c.value) == "1" || strval($fields.ccf_arthritis_c.value) == "yes" || strval($fields.ccf_arthritis_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_arthritis_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_arthritis_c.name}" 
name="{$fields.ccf_arthritis_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_RHEUMATISM">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_RHEUMATISM' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_rheumatism_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_rheumatism_c.value) <= 0}
{assign var="value" value=$fields.ccf_rheumatism_c.default_value }
{else}
{assign var="value" value=$fields.ccf_rheumatism_c.value }
{/if}  
<input type='text' name='{$fields.ccf_rheumatism_c.name}' 
id='{$fields.ccf_rheumatism_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HEART_ISSUES">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HEART_ISSUES' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_heart_issues_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_heart_issues_c.value) == "1" || strval($fields.ccf_heart_issues_c.value) == "yes" || strval($fields.ccf_heart_issues_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_heart_issues_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_heart_issues_c.name}" 
name="{$fields.ccf_heart_issues_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_HIGH_BLOOD">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_HIGH_BLOOD' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_high_blood_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_high_blood_c.value) == "1" || strval($fields.ccf_high_blood_c.value) == "yes" || strval($fields.ccf_high_blood_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_high_blood_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_high_blood_c.name}" 
name="{$fields.ccf_high_blood_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_VERTIGO">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_VERTIGO' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_vertigo_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_vertigo_c.value) == "1" || strval($fields.ccf_vertigo_c.value) == "yes" || strval($fields.ccf_vertigo_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_vertigo_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_vertigo_c.name}" 
name="{$fields.ccf_vertigo_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_SCOLIOSIS">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_SCOLIOSIS' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="bool" field="ccf_scoliosis_c"  >
{counter name="panelFieldCount" print=false}

{if strval($fields.ccf_scoliosis_c.value) == "1" || strval($fields.ccf_scoliosis_c.value) == "yes" || strval($fields.ccf_scoliosis_c.value) == "on"} 
{assign var="checked" value='checked="checked"'}
{else}
{assign var="checked" value=""}
{/if}
<input type="hidden" name="{$fields.ccf_scoliosis_c.name}" value="0"> 
<input type="checkbox" id="{$fields.ccf_scoliosis_c.name}" 
name="{$fields.ccf_scoliosis_c.name}" 
value="1" title='' tabindex="0" {$checked} >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_MEDICATION_ALLERGIES">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MEDICATION_ALLERGIES' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_medication_allergies_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_medication_allergies_c.value) <= 0}
{assign var="value" value=$fields.ccf_medication_allergies_c.default_value }
{else}
{assign var="value" value=$fields.ccf_medication_allergies_c.value }
{/if}  
<input type='text' name='{$fields.ccf_medication_allergies_c.name}' 
id='{$fields.ccf_medication_allergies_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_FOOD_ALLERGIES">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_FOOD_ALLERGIES' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_food_allergies_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_food_allergies_c.value) <= 0}
{assign var="value" value=$fields.ccf_food_allergies_c.default_value }
{else}
{assign var="value" value=$fields.ccf_food_allergies_c.value }
{/if}  
<input type='text' name='{$fields.ccf_food_allergies_c.name}' 
id='{$fields.ccf_food_allergies_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Enter ALL Food allergies that you have'      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-12 edit-view-row-item">


<div class="col-xs-12 col-sm-2 label" data-label="LBL_CCF_MED_OTHER">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_MED_OTHER' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_med_other_c" colspan='3' >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_med_other_c.value) <= 0}
{assign var="value" value=$fields.ccf_med_other_c.default_value }
{else}
{assign var="value" value=$fields.ccf_med_other_c.value }
{/if}  
<input type='text' name='{$fields.ccf_med_other_c.name}' 
id='{$fields.ccf_med_other_c.name}' size='30' 
maxlength='255' 
value='{$value}' title=''      >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>




<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL3' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_2" data-id="LBL_EDITVIEW_PANEL3">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_MOBILE_PHONE">

{capture name="label" assign="label"}{sugar_translate label='LBL_MOBILE_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="phone" field="phone_mobile"  class="phone">
{counter name="panelFieldCount" print=false}

{if strlen($fields.phone_mobile.value) <= 0}
{assign var="value" value=$fields.phone_mobile.default_value }
{else}
{assign var="value" value=$fields.phone_mobile.value }
{/if}  
<input type='text' name='{$fields.phone_mobile.name}' id='{$fields.phone_mobile.name}' size='30' maxlength='100' value='{$value}' title='' tabindex='0'	  class="phone" >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_HOME_PHONE">

{capture name="label" assign="label"}{sugar_translate label='LBL_HOME_PHONE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="phone" field="phone_home"  class="phone">
{counter name="panelFieldCount" print=false}

{if strlen($fields.phone_home.value) <= 0}
{assign var="value" value=$fields.phone_home.default_value }
{else}
{assign var="value" value=$fields.phone_home.value }
{/if}  
<input type='text' name='{$fields.phone_home.name}' id='{$fields.phone_home.name}' size='30' maxlength='100' value='{$value}' title='' tabindex='0'	  class="phone" >
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_EMAIL_ADDRESS">

{capture name="label" assign="label"}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="email1"  >
{counter name="panelFieldCount" print=false}
<span id='email1_span'>
{$fields.email1.value}</span>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_IM_NAME">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IM_NAME' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="varchar" field="ccf_im_name_c"  >
{counter name="panelFieldCount" print=false}

{if strlen($fields.ccf_im_name_c.value) <= 0}
{assign var="value" value=$fields.ccf_im_name_c.default_value }
{else}
{assign var="value" value=$fields.ccf_im_name_c.value }
{/if}  
<input type='text' name='{$fields.ccf_im_name_c.name}' 
id='{$fields.ccf_im_name_c.name}' size='30' 
maxlength='255' 
value='{$value}' title='Your Account Name on the IM Platform'      >
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_CCF_IM_TYPE">

{capture name="label" assign="label"}{sugar_translate label='LBL_CCF_IM_TYPE' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="enum" field="ccf_im_type_c"  >
{counter name="panelFieldCount" print=false}

{if !isset($config.enable_autocomplete) || $config.enable_autocomplete==false}
<select name="{$fields.ccf_im_type_c.name}" 
id="{$fields.ccf_im_type_c.name}" 
title='Specify the TYPE of IM that you Use'       
>
{if isset($fields.ccf_im_type_c.value) && $fields.ccf_im_type_c.value != ''}
{html_options options=$fields.ccf_im_type_c.options selected=$fields.ccf_im_type_c.value}
{else}
{html_options options=$fields.ccf_im_type_c.options selected=$fields.ccf_im_type_c.default}
{/if}
</select>
{else}
{assign var="field_options" value=$fields.ccf_im_type_c.options }
{capture name="field_val"}{$fields.ccf_im_type_c.value}{/capture}
{assign var="field_val" value=$smarty.capture.field_val}
{capture name="ac_key"}{$fields.ccf_im_type_c.name}{/capture}
{assign var="ac_key" value=$smarty.capture.ac_key}
<select style='display:none' name="{$fields.ccf_im_type_c.name}" 
id="{$fields.ccf_im_type_c.name}" 
title='Specify the TYPE of IM that you Use'          
>
{if isset($fields.ccf_im_type_c.value) && $fields.ccf_im_type_c.value != ''}
{html_options options=$fields.ccf_im_type_c.options selected=$fields.ccf_im_type_c.value}
{else}
{html_options options=$fields.ccf_im_type_c.options selected=$fields.ccf_im_type_c.default}
{/if}
</select>
<input
id="{$fields.ccf_im_type_c.name}-input"
name="{$fields.ccf_im_type_c.name}-input"
size="30"
value="{$field_val|lookup:$field_options}"
type="text" style="vertical-align: top;">
<span class="id-ff multiple">
<button type="button"><img src="{sugar_getimagepath file="id-ff-down.png"}" id="{$fields.ccf_im_type_c.name}-image"></button><button type="button"
id="btn-clear-{$fields.ccf_im_type_c.name}-input"
title="Clear"
onclick="SUGAR.clearRelateField(this.form, '{$fields.ccf_im_type_c.name}-input', '{$fields.ccf_im_type_c.name}');sync_{$fields.ccf_im_type_c.name}()"><span class="suitepicon suitepicon-action-clear"></span></button>
</span>
{literal}
<script>
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal} = [];
	{/literal}

			{literal}
		(function (){
			var selectElem = document.getElementById("{/literal}{$fields.ccf_im_type_c.name}{literal}");
			
			if (typeof select_defaults =="undefined")
				select_defaults = [];
			
			select_defaults[selectElem.id] = {key:selectElem.value,text:''};

			//get default
			for (i=0;i<selectElem.options.length;i++){
				if (selectElem.options[i].value==selectElem.value)
					select_defaults[selectElem.id].text = selectElem.options[i].innerHTML;
			}

			//SUGAR.AutoComplete.{$ac_key}.ds = 
			//get options array from vardefs
			var options = SUGAR.AutoComplete.getOptionsArray("");

			YUI().use('datasource', 'datasource-jsonschema',function (Y) {
				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds = new Y.DataSource.Function({
				    source: function (request) {
				    	var ret = [];
				    	for (i=0;i<selectElem.options.length;i++)
				    		if (!(selectElem.options[i].value=='' && selectElem.options[i].innerHTML==''))
				    			ret.push({'key':selectElem.options[i].value,'text':selectElem.options[i].innerHTML});
				    	return ret;
				    }
				});
			});
		})();
		{/literal}
	
	{literal}
		YUI().use("autocomplete", "autocomplete-filters", "autocomplete-highlighters", "node","node-event-simulate", function (Y) {
	{/literal}
			
	SUGAR.AutoComplete.{$ac_key}.inputNode = Y.one('#{$fields.ccf_im_type_c.name}-input');
	SUGAR.AutoComplete.{$ac_key}.inputImage = Y.one('#{$fields.ccf_im_type_c.name}-image');
	SUGAR.AutoComplete.{$ac_key}.inputHidden = Y.one('#{$fields.ccf_im_type_c.name}');
	
			{literal}
			function SyncToHidden(selectme){
				var selectElem = document.getElementById("{/literal}{$fields.ccf_im_type_c.name}{literal}");
				var doSimulateChange = false;
				
				if (selectElem.value!=selectme)
					doSimulateChange=true;
				
				selectElem.value=selectme;

				for (i=0;i<selectElem.options.length;i++){
					selectElem.options[i].selected=false;
					if (selectElem.options[i].value==selectme)
						selectElem.options[i].selected=true;
				}

				if (doSimulateChange)
					SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('change');
			}

			//global variable 
			sync_{/literal}{$fields.ccf_im_type_c.name}{literal} = function(){
				SyncToHidden();
			}
			function syncFromHiddenToWidget(){

				var selectElem = document.getElementById("{/literal}{$fields.ccf_im_type_c.name}{literal}");

				//if select no longer on page, kill timer
				if (selectElem==null || selectElem.options == null)
					return;

				var currentvalue = SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value');

				SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.simulate('keyup');

				for (i=0;i<selectElem.options.length;i++){

					if (selectElem.options[i].value==selectElem.value && document.activeElement != document.getElementById('{/literal}{$fields.ccf_im_type_c.name}-input{literal}'))
						SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value',selectElem.options[i].innerHTML);
				}
			}

            YAHOO.util.Event.onAvailable("{/literal}{$fields.ccf_im_type_c.name}{literal}", syncFromHiddenToWidget);
		{/literal}

		SUGAR.AutoComplete.{$ac_key}.minQLen = 0;
		SUGAR.AutoComplete.{$ac_key}.queryDelay = 0;
		SUGAR.AutoComplete.{$ac_key}.numOptions = {$field_options|@count};
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 300) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 200;
			{literal}
		}
		{/literal}
		if(SUGAR.AutoComplete.{$ac_key}.numOptions >= 3000) {literal}{
			{/literal}
			SUGAR.AutoComplete.{$ac_key}.minQLen = 1;
			SUGAR.AutoComplete.{$ac_key}.queryDelay = 500;
			{literal}
		}
		{/literal}
		
	SUGAR.AutoComplete.{$ac_key}.optionsVisible = false;
	
	{literal}
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.plug(Y.Plugin.AutoComplete, {
		activateFirstItem: true,
		{/literal}
		minQueryLength: SUGAR.AutoComplete.{$ac_key}.minQLen,
		queryDelay: SUGAR.AutoComplete.{$ac_key}.queryDelay,
		zIndex: 99999,

				
		{literal}
		source: SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.ds,
		
		resultTextLocator: 'text',
		resultHighlighter: 'phraseMatch',
		resultFilters: 'phraseMatch',
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover = function(ex){
		var hover = YAHOO.util.Dom.getElementsByClassName('dccontent');
		if(hover[0] != null){
			if (ex) {
				var h = '1000px';
				hover[0].style.height = h;
			}
			else{
				hover[0].style.height = '';
			}
		}
	}
		
	if({/literal}SUGAR.AutoComplete.{$ac_key}.minQLen{literal} == 0){
		// expand the dropdown options upon focus
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function () {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.sendRequest('');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = true;
		});
	}

			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('click', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('click');
		});
		
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('dblclick', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('dblclick');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('focus', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('focus');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mouseup', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mouseup');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('mousedown', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('mousedown');
		});

		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.on('blur', function(e) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.simulate('blur');
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible = false;
			var selectElem = document.getElementById("{/literal}{$fields.ccf_im_type_c.name}{literal}");
			//if typed value is a valid option, do nothing
			for (i=0;i<selectElem.options.length;i++)
				if (selectElem.options[i].innerHTML==SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.get('value'))
					return;
			
			//typed value is invalid, so set the text and the hidden to blank
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.set('value', select_defaults[selectElem.id].text);
			SyncToHidden(select_defaults[selectElem.id].key);
		});
	
	// when they click on the arrow image, toggle the visibility of the options
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputImage.ancestor().on('click', function () {
		if (SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.optionsVisible) {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.blur();
		} else {
			SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.focus();
		}
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('query', function () {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputHidden.set('value', '');
	});

	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('visibleChange', function (e) {
		SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.expandHover(e.newVal); // expand
	});

	// when they select an option, set the hidden input with the KEY, to be saved
	SUGAR.AutoComplete.{/literal}{$ac_key}{literal}.inputNode.ac.on('select', function(e) {
		SyncToHidden(e.result.raw.key);
	});
 
});
</script> 
{/literal}
{/if}
</div>

<!-- [/hide] -->
</div>
<div class="clear"></div>
<div class="clear"></div>



<div class="col-xs-12 col-sm-6 edit-view-row-item">



<div class="col-xs-12 col-sm-12 edit-view-field " type="varchar" field="primary_address_street" colspan='2' >
{counter name="panelFieldCount" print=false}

<script type="text/javascript"
        src='{sugar_getjspath file="include/SugarFields/Fields/Address/SugarFieldAddress.js"}'></script>
<fieldset id='PRIMARY_address_fieldset'>
<legend>{sugar_translate label='LBL_PRIMARY_ADDRESS' module=''}</legend>
<table border="0" cellspacing="1" cellpadding="0" class="edit" width="100%">
<tr>
<td valign="top" id="primary_address_street_label" width='25%' scope='row'>
<label for="primary_address_street">{sugar_translate label='LBL_PRIMARY_STREET' module=''}:</label>
{if $fields.primary_address_street.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td width="*">
<textarea id="primary_address_street" name="primary_address_street" title='' maxlength="150"
                          rows="2" cols="30"
                          tabindex="0">{$fields.primary_address_street.value}</textarea>
</td>
</tr>
<tr>
<td id="primary_address_city_label" width='%'
scope='row'>
<label for="primary_address_city">{sugar_translate label='LBL_CITY' module=''}:
{if $fields.primary_address_city.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="primary_address_city" id="primary_address_city" title='{$fields.primary_address_city.help}' size="30"
maxlength='150' value='{$fields.primary_address_city.value}'
tabindex="0">
</td>
</tr>
<tr>
<td id="primary_address_state_label" width='%'
scope='row'>
<label for="primary_address_state">{sugar_translate label='LBL_STATE' module=''}:</label>
{if $fields.primary_address_state.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="primary_address_state" id="primary_address_state" title='{$fields.primary_address_state.help}' size="30"
maxlength='150' value='{$fields.primary_address_state.value}'
tabindex="0">
</td>
</tr>
<tr>
<td id="primary_address_postalcode_label"
width='%' scope='row'>
<label for="primary_address_postalcode">{sugar_translate label='LBL_POSTAL_CODE' module=''}:</label>
{if $fields.primary_address_postalcode.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="primary_address_postalcode" id="primary_address_postalcode" title='{$fields.primary_address_postalcode.help}' size="30"
maxlength='150'                       value='{$fields.primary_address_postalcode.value}' tabindex="0">
</td>
</tr>
<tr>
<td id="primary_address_country_label" width='%'
scope='row'>
<label for="primary_address_country">{sugar_translate label='LBL_COUNTRY' module=''}:</label>
{if $fields.primary_address_country.required || false}
<span class="required">{$APP.LBL_REQUIRED_SYMBOL}</span>
{/if}
</td>
<td>
<input type="text" name="primary_address_country" id="primary_address_country" title='{$fields.primary_address_country.help}' size="30"
maxlength='150' value='{$fields.primary_address_country.value}'
tabindex="0">
</td>
</tr>
<tr>
<td colspan='2' NOWRAP>&nbsp;</td>
</tr>
</table>
</fieldset>
<script type="text/javascript">
  SUGAR.util.doWhen("typeof(SUGAR.AddressField) != 'undefined'", function () {ldelim}
      primary_address = new SUGAR.AddressField("primary_checkbox", '', 'primary');
      {rdelim});
</script>
</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>












<div class="panel panel-default">
<div class="panel-heading ">
<a class="" role="button" data-toggle="collapse-edit" aria-expanded="false">
<div class="col-xs-10 col-sm-11 col-md-11">
{sugar_translate label='LBL_EDITVIEW_PANEL12' module='Prospects'}
</div>
</a>
</div>
<div class="panel-body panel-collapse collapse in panelContainer" id="detailpanel_7" data-id="LBL_EDITVIEW_PANEL12">
<div class="tab-content">
<!-- tab_panel_content.tpl -->
<div class="row edit-view-row">



<div class="col-xs-12 col-sm-6 edit-view-row-item">


<div class="col-xs-12 col-sm-4 label" data-label="LBL_GOOGLE_MAPS">

{capture name="label" assign="label"}{sugar_translate label='LBL_GOOGLE_MAPS' module='Prospects'}{/capture}
{$label|strip_semicolon}:

</div>

<div class="col-xs-12 col-sm-8 edit-view-field " type="iframe" field="google_maps_c"  >
{counter name="panelFieldCount" print=false}

</div>

<!-- [/hide] -->
</div>


<div class="col-xs-12 col-sm-6 edit-view-row-item">
</div>
<div class="clear"></div>
<div class="clear"></div>
</div>                    </div>
</div>
</div>
</div>
</div>

<script language="javascript">
    var _form_id = '{$form_id}';
    {literal}
    SUGAR.util.doWhen(function(){
        _form_id = (_form_id == '') ? 'EditView' : _form_id;
        return document.getElementById(_form_id) != null;
    }, SUGAR.themes.actionMenu);
    {/literal}
</script>
{assign var='place' value="_FOOTER"} <!-- to be used for id for buttons with custom code in def files-->
<div class="buttons">
{if $bean->aclAccess("save")}<input title="{$APP.LBL_SAVE_BUTTON_TITLE}" accessKey="{$APP.LBL_SAVE_BUTTON_KEY}" class="button primary" onclick="var _form = document.getElementById('EditView'); {if $isDuplicate}_form.return_id.value=''; {/if}_form.action.value='Save'; if(check_form('EditView'))SUGAR.ajaxUI.submitForm(_form);return false;" type="submit" name="button" value="{$APP.LBL_SAVE_BUTTON_LABEL}" id="SAVE">{/if} 
{if !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($smarty.request.return_id))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" type="button" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && !empty($fields.id.value))}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=DetailView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && ($smarty.request.return_action == "DetailView" && empty($fields.id.value)) && empty($smarty.request.return_id)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=ListView&module={$smarty.request.return_module|escape:"url"}&record={$fields.id.value}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif !empty($smarty.request.return_action) && !empty($smarty.request.return_module)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action={$smarty.request.return_action}&module={$smarty.request.return_module|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {elseif empty($smarty.request.return_action) || empty($smarty.request.return_id) && !empty($fields.id.value)}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module=Prospects'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {else}<input title="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" class="button" onclick="SUGAR.ajaxUI.loadContent('index.php?action=index&module={$smarty.request.return_module|escape:"url"}&record={$smarty.request.return_id|escape:"url"}'); return false;" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" id="CANCEL"> {/if}
{if $showVCRControl}
<button type="button" id="save_and_continue" class="button saveAndContinue" title="{$app_strings.LBL_SAVE_AND_CONTINUE}" onClick="SUGAR.saveAndContinue(this);">
{$APP.LBL_SAVE_AND_CONTINUE}
</button>
{/if}
{if $bean->aclAccess("detail")}{if !empty($fields.id.value) && $isAuditEnabled}<input id="btn_view_change_log" title="{$APP.LNK_VIEW_CHANGE_LOG}" class="button" onclick='open_popup("Audit", "600", "400", "&record={$fields.id.value}&module_name=Prospects", true, false,  {ldelim} "call_back_function":"set_return","form_name":"EditView","field_to_name_array":[] {rdelim} ); return false;' type="button" value="{$APP.LNK_VIEW_CHANGE_LOG}">{/if}{/if}
</div>
</form>
{$set_focus_block}
<script>SUGAR.util.doWhen("document.getElementById('EditView') != null",
        function(){ldelim}SUGAR.util.buildAccessKeyLabels();{rdelim});
</script>
{sugar_getscript file="cache/include/javascript/sugar_grp_yui_widgets.js"}
<script type="text/javascript">
var EditView_tabs = new YAHOO.widget.TabView("EditView_tabs");
EditView_tabs.selectTab(0);
</script>
<script type="text/javascript">
YAHOO.util.Event.onContentReady("EditView",
    function () {ldelim} initEditView(document.forms.EditView) {rdelim});
//window.setTimeout(, 100);
window.onbeforeunload = function () {ldelim} return onUnloadEditView(); {rdelim};
// bug 55468 -- IE is too aggressive with onUnload event
if ($.browser.msie) {ldelim}
$(document).ready(function() {ldelim}
    $(".collapseLink,.expandLink").click(function (e) {ldelim} e.preventDefault(); {rdelim});
  {rdelim});
{rdelim}
</script>
{literal}
<script type="text/javascript">

    var selectTab = function(tab) {
        $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').hide();
        $('#EditView_tabs div.tab-content div.tab-pane-NOBOOTSTRAPTOGGLER').eq(tab).show().addClass('active').addClass('in');
    };

    var selectTabOnError = function(tab) {
        selectTab(tab);
        $('#EditView_tabs ul.nav.nav-tabs li').removeClass('active');
        $('#EditView_tabs ul.nav.nav-tabs li a').css('color', '');

        $('#EditView_tabs ul.nav.nav-tabs li').eq(tab).find('a').first().css('color', 'red');
        $('#EditView_tabs ul.nav.nav-tabs li').eq(tab).addClass('active');

    };

    var selectTabOnErrorInputHandle = function(inputHandle) {
        var tab = $(inputHandle).closest('.tab-pane-NOBOOTSTRAPTOGGLER').attr('id').match(/^detailpanel_(.*)$/)[1];
        selectTabOnError(tab);
    };


    $(function(){
        $('#EditView_tabs ul.nav.nav-tabs li > a[data-toggle="tab"]').click(function(e){
            if(typeof $(this).parent().find('a').first().attr('id') != 'undefined') {
                var tab = parseInt($(this).parent().find('a').first().attr('id').match(/^tab(.)*$/)[1]);
                selectTab(tab);
            }
        });

        $('a[data-toggle="collapse-edit"]').click(function(e){
            if($(this).hasClass('collapsed')) {
              // Expand panel
                // Change style of .panel-header
                $(this).removeClass('collapsed');
                // Expand .panel-body
                $(this).parents('.panel').find('.panel-body').removeClass('in').addClass('in');
            } else {
              // Collapse panel
                // Change style of .panel-header
                $(this).addClass('collapsed');
                // Collapse .panel-body
                $(this).parents('.panel').find('.panel-body').removeClass('in').removeClass('in');
            }
        });
    });

    </script>
{/literal}{literal}
<script type="text/javascript">
addForm('EditView');addToValidate('EditView', 'name', 'name', false,'{/literal}{sugar_translate label='LBL_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'date_entered_date', 'date', false,'Date Created' );
addToValidate('EditView', 'date_modified_date', 'date', false,'Date Modified' );
addToValidate('EditView', 'modified_user_id', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_MODIFIED' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'modified_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_MODIFIED_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'created_by', 'assigned_user_name', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'created_by_name', 'relate', false,'{/literal}{sugar_translate label='LBL_CREATED' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'description', 'text', false,'{/literal}{sugar_translate label='LBL_DESCRIPTION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'deleted', 'bool', false,'{/literal}{sugar_translate label='LBL_DELETED' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'assigned_user_id', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_ID' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'assigned_user_name', 'relate', false,'{/literal}{sugar_translate label='LBL_ASSIGNED_TO_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'salutation', 'enum', false,'{/literal}{sugar_translate label='LBL_SALUTATION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'first_name', 'varchar', true,'{/literal}{sugar_translate label='LBL_FIRST_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'last_name', 'varchar', true,'{/literal}{sugar_translate label='LBL_LAST_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'full_name', 'fullname', false,'{/literal}{sugar_translate label='LBL_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'title', 'varchar', false,'{/literal}{sugar_translate label='LBL_TITLE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'photo', 'image', false,'{/literal}{sugar_translate label='LBL_PHOTO' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'department', 'varchar', false,'{/literal}{sugar_translate label='LBL_DEPARTMENT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'do_not_call', 'bool', false,'{/literal}{sugar_translate label='LBL_DO_NOT_CALL' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'phone_home', 'phone', false,'{/literal}{sugar_translate label='LBL_HOME_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'email', 'email', false,'{/literal}{sugar_translate label='LBL_ANY_EMAIL' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'phone_mobile', 'phone', false,'{/literal}{sugar_translate label='LBL_MOBILE_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'phone_work', 'phone', false,'{/literal}{sugar_translate label='LBL_OFFICE_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'phone_other', 'phone', false,'{/literal}{sugar_translate label='LBL_OTHER_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'phone_fax', 'phone', false,'{/literal}{sugar_translate label='LBL_FAX_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'email1', 'varchar', false,'{/literal}{sugar_translate label='LBL_EMAIL_ADDRESS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'email2', 'varchar', false,'{/literal}{sugar_translate label='LBL_OTHER_EMAIL_ADDRESS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'invalid_email', 'bool', false,'{/literal}{sugar_translate label='LBL_INVALID_EMAIL' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'email_opt_out', 'bool', false,'{/literal}{sugar_translate label='LBL_EMAIL_OPT_OUT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET_2' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STREET_3' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_CITY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_STATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_POSTALCODE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'primary_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_PRIMARY_ADDRESS_COUNTRY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_street', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_street_2', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET_2' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_street_3', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STREET_3' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_city', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_CITY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_state', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_STATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_postalcode', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_POSTALCODE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'alt_address_country', 'varchar', false,'{/literal}{sugar_translate label='LBL_ALT_ADDRESS_COUNTRY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'assistant', 'varchar', false,'{/literal}{sugar_translate label='LBL_ASSISTANT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'assistant_phone', 'phone', false,'{/literal}{sugar_translate label='LBL_ASSISTANT_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'email_addresses_non_primary', 'email', false,'{/literal}{sugar_translate label='LBL_EMAIL_NON_PRIMARY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'tracker_key', 'int', true,'{/literal}{sugar_translate label='LBL_TRACKER_KEY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'birthdate', 'date', true,'{/literal}{sugar_translate label='LBL_BIRTHDATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'lead_id', 'id', false,'{/literal}{sugar_translate label='LBL_LEAD_ID' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'account_name', 'varchar', false,'{/literal}{sugar_translate label='LBL_ACCOUNT_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'campaign_id', 'id', false,'{/literal}{sugar_translate label='LBL_CAMPAIGN_ID' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'e_invite_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_CONT_INVITE_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'event_status_name', 'enum', false,'{/literal}{sugar_translate label='LBL_LIST_INVITE_STATUS_EVENT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'event_invite_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIST_INVITE_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'e_accept_status_fields', 'relate', false,'{/literal}{sugar_translate label='LBL_CONT_ACCEPT_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'event_accept_status', 'enum', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS_EVENT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'event_status_id', 'varchar', false,'{/literal}{sugar_translate label='LBL_LIST_ACCEPT_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_police_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_POLICE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'lbl_ccf_ht_pm_tl_refresher_c', 'bool', false,'{/literal}{sugar_translate label='LBL_LBL_CCF_HT_PM_TL_REFRESHER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_ht_support_tl_refresher_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_HT_SUPPORT_TL_REFRESHER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_medication_allergies_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_MEDICATION_ALLERGIES' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_attorney_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_ATTORNEY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_food_allergies_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_FOOD_ALLERGIES' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_ht_radicalhosting_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_HT_RADICALHOSTING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'jjwg_maps_geocode_status_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_GEOCODE_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_singing_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_SINGING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_area__pastor_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_AREA__PASTOR' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_job_profession_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_JOB_PROFESSION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_programming_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_PROGRAMMING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_leader_name_c', 'varchar', true,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_LEADER_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_blood_type_c', 'enum', true,'{/literal}{sugar_translate label='LBL_CCF_BLOOD_TYPE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_audio_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_AUDIO' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'jjwg_maps_address_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_ADDRESS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_family_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_FAMILY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_civil_status_c', 'enum', true,'{/literal}{sugar_translate label='LBL_CCF_CIVIL_STATUS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_emer_name_c', 'varchar', true,'{/literal}{sugar_translate label='LBL_CCF_EMER_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_music_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_MUSIC' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_ht_pm_tl_refresher_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_HT_PM_TL_REFRESHER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_video_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_VIDEO' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_company_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_COMPANY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_ht_mindset_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_HT_MINDSET' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_times_c', 'enum', false,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_TIMES' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_planning_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_PLANNING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_fire_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_FIRE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_im_type_c', 'enum', false,'{/literal}{sugar_translate label='LBL_CCF_IM_TYPE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_ht_other_training_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_HT_OTHER_TRAINING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_parkingshuttle_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_PARKINGSHUTTLE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_rheumatism_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_RHEUMATISM' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_day_c', 'enum', false,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_DAY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_host_service_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_HOST_SERVICE_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_truelife_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_TRUELIFE_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_law_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_LAW' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_dance_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_DANCE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_high_blood_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_HIGH_BLOOD' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_med_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_MED' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_accounting_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_ACCOUNTING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_arthritis_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_ARTHRITIS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_glc1_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_GLC1_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_scoliosis_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SCOLIOSIS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_host_orientation_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_HOST_ORIENTATION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_glc2_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_GLC2_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_emer_relation_c', 'enum', true,'{/literal}{sugar_translate label='LBL_CCF_EMER_RELATION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_nxtgen_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_NXTGEN' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_volunteer_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_VOLUNTEER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_msoffice_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_MSOFFICE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_host_2017_fellowship_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_HOST_2017_FELLOWSHIP' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_hosting_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_HOSTING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_exalt_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_EXALT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_sports_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_SPORTS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccc_photo_c', 'image', false,'{/literal}{sugar_translate label='LBL_CCC_PHOTO' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_heart_issues_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_HEART_ISSUES' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_leader_phone_c', 'phone', false,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_LEADER_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_sns_c', 'bool', false,'{/literal}{sugar_translate label='' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_gender_c', 'enum', true,'{/literal}{sugar_translate label='LBL_CCF_GENDER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_training_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_TRAINING' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_drama_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_DRAMA' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_vertigo_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_VERTIGO' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_videoproduction_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_VIDEOPRODUCTION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_liveproduction_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_LIVEPRODUCTION' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_type_c', 'enum', false,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_TYPE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_emer_phone_c', 'phone', true,'{/literal}{sugar_translate label='LBL_CCF_EMER_PHONE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_leader_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_LEADER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_idc_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_IDC_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'jjwg_maps_lat_c', 'float', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_LAT' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_dgroup_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_DGROUP_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_skills_photography_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_SKILLS_PHOTOGRAPHY' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'google_maps_c', 'iframe', false,'{/literal}{sugar_translate label='LBL_GOOGLE_MAPS' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccd_d12_leader_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCD_D12_LEADER' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'jjwg_maps_lng_c', 'float', false,'{/literal}{sugar_translate label='LBL_JJWG_MAPS_LNG' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_mininv_choir_c', 'bool', false,'{/literal}{sugar_translate label='LBL_CCF_MININV_CHOIR' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_im_name_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_IM_NAME' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_couples_date_c', 'date', false,'{/literal}{sugar_translate label='LBL_CCF_COUPLES_DATE' module='Prospects' for_js=true}{literal}' );
addToValidate('EditView', 'ccf_med_other_c', 'varchar', false,'{/literal}{sugar_translate label='LBL_CCF_MED_OTHER' module='Prospects' for_js=true}{literal}' );
addToValidateBinaryDependency('EditView', 'assigned_user_name', 'alpha', false,'{/literal}{sugar_translate label='ERR_SQS_NO_MATCH_FIELD' module='Prospects' for_js=true}{literal}: {/literal}{sugar_translate label='LBL_ASSIGNED_TO' module='Prospects' for_js=true}{literal}', 'assigned_user_id' );
</script>{/literal}
