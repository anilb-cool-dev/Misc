-- vdianilb 10.24.70.57
-- seapr1db2038

use p0003690vj5p_440
select * from ct_feature_lang where lang_code = 'en'
select * from ct_feature -- EXP/EXP
select clist_key, * from ct_hierarchy where hier_type = 'CONFIG' and prod_code = 'EXP'
select * from ct_column_metadata where meta_key = 987 -- emp.c6
select * from ct_list_lang where list_key = 1 and lang_code = 'en'
select count(1) from ct_list_item_map with(nolock) where list_key = 1
select top 100 * from ct_hierarchy_node_lang with(nolock) where lang_code ='en' and name = 'EMEA - PL'
select * from ct_hierarchy_node where hier_node_key in (1082, 1171, 1526) and hier_key = 6
select * from ct_list_item_lang with(nolock) where lang_code = 'en' and li_key = 1432
select top 1 * from ct_list_item_lang
select top 1 * from ct_location_name

select top 100 *
from CT_REPORT r with(nolock) 
where hier_node_key = 1171 and r.creation_date < '1/1/2015' and aps_key not in ('A_RESU', 'A_NOTF')
-- r.o1 (all filled), o2 (some blank), o3 (some blank)
select top 1 1 
from CT_REPORT r with(nolock) 
where hier_node_key = 1171 and r.creation_date < '1/1/2015' 
and org_unit_3 is null

--re.o1 (some blank), o2 (some blank), o3 (some blank), c1 (some blank), c2 (some blank), c3 (some blank), c4 (some blank)
select top 100 r.*
from CT_REPORT r with(nolock) 
left outer join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
left outer join ct_atn_entry_map m with(nolock) on m.rpe_key = re.rpe_key
where hier_node_key = 1171 and r.creation_date < '1/1/2015' 
and m.rpe_key is null

select count(1)
from ct_report_entry where rpt_key = 200798
select distinct allocation_form_key 
from CT_REPORT r with(nolock) 
where hier_node_key = 1171

select top 1 * from ct_attendee
select top 1 * from ct_atn_entry_map

select top 1 * from ct_credit_card_account


-- Dependencies

-- 460 cash advances that are linked to only 1 report
select distinct ca.ca_key
from CT_REPORT r with(nolock) 
join ct_cash_advance_report_map ca with(nolock) on r.rpt_key = ca.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' 


-- 0 request
select distinct ar.ar_key
from CT_REPORT r with(nolock) 
join ct_report_ar_map ar with(nolock) on r.rpt_key = ar.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' 

-- 0 request
select distinct tr.tr_key
from CT_REPORT r with(nolock) 
join ct_report_travel_request_map tr with(nolock) on r.rpt_key = tr.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' 
 
-- 95976 card_txn
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 82545 records in audit
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_credit_card_transaction_audit a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 0 in car rental
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_cc_trans_car_rental a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 0 in lodging
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_cc_trans_lodging a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 0 in travel
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_cc_trans_travel a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 0 in purchase
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_cc_trans_purchase a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 0 in custom_data
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_credit_card_transaction_custom_data a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- 3 in ct_credit_card_transaction_extn
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_credit_card_transaction_extn a with(nolock) on a.cct_key = re.cct_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL

-- trip segments - trip id = 116373414	seg_id = 81611491876
select distinct m.trip_id, m.segment_id
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
join ct_report_entry_segment_map m with(nolock) on m.rpe_key = re.rpe_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015'

-- ereceipts 0
select distinct re.ereceipt_id
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015'
and re.ereceipt_id is not null

-- 205 me_key
select distinct re.me_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015'
and re.me_key is not null

-- 0 cct_key being deleted is used by a mobile entry but that mobile entry is outside of the reports being deleted
select me_key from ct_mobile_entry where cct_key in
(
select distinct re.cct_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015' and re.cct_key is not NULL
)
except
select distinct re.me_key
from CT_REPORT r with(nolock) 
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015'
and re.me_key is not null



-- Queries

select 
r.report_id report_id,
r.name report_name,
r.purpose report_purpose,
r.creation_date creation_date,
e.first_name first_name,
e.last_name last_name,
e.login_id login_id,
e.emp_id employee_id,
asl.name approval_status,
psl.name paymane_status,
cl.name report_currency,
pl.name expense_policy_name,
r.submit_date submit_date,
ro1.value report_org_unit1,
ro2.value report_org_unit2,
ro3.value report_org_unit3,
re.transaction_type transaction_type,
etl.name expense_type_name,
re.transaction_amount transaction_amount,
recl.name transaction_currency,
re.exchange_rate exchange_rate,
re.posted_amount posted_amount,
re.is_personal is_personal,
re.claimed_amount claimed_amount,
ptl.name payment_type,
re.transaction_date transaction_date,
re.approved_amount approved_amount,
re.description entry_description,
re.vendor_description vendor_description,
vl.value vendor_name,
ln.ctry_code location_country,
ln.name location_name,
--re.receipt_image_id receipt_image,
a.first_name attendee_first_name,
a.last_name attendee_last_name,
m.transaction_amount attendee_transaction_amount,
m.approved_amount attendee_approved_amount,
reo1.value report_entry_org_unit1,
reo2.value report_entry_org_unit2,
reo3.value report_entry_org_unit3,
rec1.value report_entry_custom1,
rec2.value report_entry_custom2,
rec3.value report_entry_custom3,
rec4.value report_entry_custom4,
cca.last_segment
from CT_REPORT r with(nolock) 
join ct_status_lang asl on asl.stat_key = r.aps_key and asl.lang_code = 'en'
join ct_status_lang psl on psl.stat_key = r.pay_key and psl.lang_code = 'en'
join ct_currency_lang cl on cl.crn_key = r.crn_key and cl.lang_code = 'en'
join ct_policy_lang pl on pl.pol_key = r.pol_key and pl.lang_code ='en'
join ct_employee e with(nolock) on e.emp_key = r.emp_key
join ct_report_entry re with(nolock) on re.rpt_key = r.rpt_key
join ct_expense_type_lang etl on etl.lang_code = 'en' and etl.exp_key = re.exp_key
join ct_currency_lang recl on recl.lang_code = 'en' and recl.crn_key = re.crn_key
join ct_payment_type_lang ptl on ptl.lang_code = 'en' and ptl.pat_key = re.pat_key
left outer join ct_atn_entry_map m with(nolock) on m.rpe_key = re.rpe_key
left outer join ct_attendee a with(nolock) on a.atn_key = m.atn_key
left outer join ct_list_item_lang vl with(nolock) on vl.li_key = re.ven_li_key and vl.lang_code = 'en'
left outer join ct_location_name ln with(nolock) on re.ln_key = ln.ln_key
join ct_list_item_lang ro1 with(nolock) on ro1.li_key = r.org_unit_1 and ro1.lang_code = 'en'
left outer join ct_list_item_lang ro2 with(nolock) on ro2.li_key = r.org_unit_2 and ro2.lang_code = 'en'
left outer join ct_list_item_lang ro3 with(nolock) on ro3.li_key = r.org_unit_3 and ro3.lang_code = 'en'
left outer join ct_list_item_lang reo1 with(nolock) on reo1.li_key = re.org_unit_1 and reo1.lang_code = 'en'
left outer join ct_list_item_lang reo2 with(nolock) on reo2.li_key = re.org_unit_2 and reo2.lang_code = 'en'
left outer join ct_list_item_lang reo3 with(nolock) on reo3.li_key = re.org_unit_3 and reo3.lang_code = 'en'
left outer join ct_list_item_lang rec1 with(nolock) on rec1.li_key = re.custom1 and rec1.lang_code = 'en'
left outer join ct_list_item_lang rec2 with(nolock) on rec2.li_key = re.custom2 and rec2.lang_code = 'en'
left outer join ct_list_item_lang rec3 with(nolock) on rec3.li_key = re.custom3 and rec3.lang_code = 'en'
left outer join ct_list_item_lang rec4 with(nolock) on rec4.li_key = re.custom4 and rec4.lang_code = 'en'
left outer join ct_credit_card_transaction cct with(nolock) on cct.cct_key = re.cct_key
left outer join ct_credit_card_account cca with(nolock) on cca.cca_key = cct.cca_key
where r.hier_node_key = 1171 and r.creation_date < '1/1/2015'


select 
r.report_id,
au.audit_date,
au.audit_type,
au.parameters
from ct_report r with(nolock)
left outer join ct_audit au with(nolock) on au.subject_pk_value = cast(r.rpt_key as varchar(10)) and au.subject_pk_meta_key = 1633 
where r.hier_node_key = 1171 and r.rpt_key in (200798) and r.creation_date < '1/1/2015'
order by audit_date desc
select 
r.report_id,
au.audit_date,
au.audit_type,
au.parameters
from ct_report r with(nolock)
join ct_report_entry re with(nolock) on r.rpt_key = re.rpt_key
left outer join ct_audit au with(nolock) on au.subject_pk_value = cast(re.rpe_key as varchar(10)) and au.subject_pk_meta_key = 1702
where r.hier_node_key = 1171 and 
--r.rpt_key in (200798) and 
r.creation_date < '1/1/2015'
order by audit_date desc

select r.report_id, e.first_name, e.last_name, e.login_id, wsi.entry_date date_pending, wsi.action_date date_acted_on
from ct_workflow_step_instance wsi
join ct_workflow_process_instance wpi on wsi.process_instance_key = wpi.process_instance_key
join ct_employee e on e.emp_key = wsi.emp_key
join ct_report r on r.current_workflow = wpi.process_instance_key and wpi.pk_value = r.rpt_key
where role_code != 'SYSTEM' and final_stat_key != 'W_SKIP' and r.hier_node_key = 1171
order by report_id, sequence_order




-- delete
-- purge reports
-- delete from ct_mobile_entry
-- delete from ct_credit_card_transaction
-- delete from ct_cash_advance_entry, ct_cash_advance

delete from ct_mobile_entry where me_key in ()
delete from ct_credit_card_transaction_extn where cct_key in ()
delete from ct_credit_card_transaction_audit where cct_key in ()
delete from ct_credit_card_transaction where cct_key in ()
delete from ct_cash_advance_entry where ca_key in ()
delete from ct_cash_advance_comment where ca_key in ()
delete from ct_cash_advance where ca_key in ()




