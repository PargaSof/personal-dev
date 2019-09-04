{ DATABASE test  delimiter | }

grant dba to "maxmast";
grant connect to "public";

{ TABLE "maxmast".al row size = 128 number of columns = 9 index size = 159 }
{ unload file name = al___00100.unl number of rows = 2 }

create table "maxmast".al 
  (
    al_prefitem char(15) not null ,
    al_lineno integer not null ,
    al_restrict char(15) not null ,
    al_rescode char(1) not null ,
    al_exchange float not null ,
    al_aremarks char(56) not null ,
    al_lud date not null ,
    al_lui char(10) not null ,
    al_altitem char(15) not null 
  );
revoke all on "maxmast".al from "public";

create unique index "maxmast".al_itemkey on "maxmast".al (al_prefitem,
    al_altitem,al_restrict);
create unique index "maxmast".al_linekey on "maxmast".al (al_prefitem,
    al_lineno);
create index "maxmast".al_uokey on "maxmast".al (al_altitem,al_prefitem);
    
{ TABLE "maxmast".amana row size = 153 number of columns = 13 index size = 97 }
{ unload file name = amana00101.unl number of rows = 0 }

create table "maxmast".amana 
  (
    amana_account char(10) not null ,
    amana_schedule char(15) not null ,
    amana_item char(15) not null ,
    amana_authcode char(35) not null ,
    amana_notdate date not null ,
    amana_startdate date not null ,
    amana_enddate date not null ,
    amana_reccum float not null ,
    amana_newcum float not null ,
    amana_oldcum float not null ,
    amana_incvar float not null ,
    amana_oldvers char(17) not null ,
    amana_newvers char(17) not null 
  );
revoke all on "maxmast".amana from "public";

create unique index "maxmast".amana_key on "maxmast".amana (amana_account,
    amana_schedule,amana_item,amana_startdate,amana_newvers);
    
{ TABLE "maxmast".amcds row size = 66 number of columns = 7 index size = 72 }
{ unload file name = amcds00102.unl number of rows = 0 }

create table "maxmast".amcds 
  (
    amcds_account char(10) not null ,
    amcds_schedule char(15) not null ,
    amcds_item char(15) not null ,
    amcds_reqdate date not null ,
    amcds_reqqty float not null ,
    amcds_lud date not null ,
    amcds_lui char(10) not null 
  );
revoke all on "maxmast".amcds from "public";

create unique index "maxmast".amcds_key on "maxmast".amcds (amcds_account,
    amcds_schedule,amcds_item,amcds_reqdate);
{ TABLE "maxmast".amcln row size = 210 number of columns = 16 index size = 66 }
{ unload file name = amcln00103.unl number of rows = 0 }

create table "maxmast".amcln 
  (
    amcln_account char(10) not null ,
    amcln_schedule char(15) not null ,
    amcln_item char(15) not null ,
    amcln_version char(17) not null ,
    amcln_authcode char(35) not null ,
    amcln_notdate date not null ,
    amcln_custdelno char(17) not null ,
    amcln_recqty float not null ,
    amcln_lud date not null ,
    amcln_lui char(10) not null ,
    amcln_cust1del char(17) not null ,
    amcln_cust1qdel float not null ,
    amcln_cust2del char(17) not null ,
    amcln_cust2qdel float not null ,
    amcln_cust3del char(17) not null ,
    amcln_cust3qdel float not null 
  );
revoke all on "maxmast".amcln from "public";

create unique index "maxmast".amcln_key on "maxmast".amcln (amcln_account,
    amcln_schedule,amcln_item);
{ TABLE "maxmast".amcum row size = 157 number of columns = 19 index size = 144 }
{ unload file name = amcum00104.unl number of rows = 0 }

create table "maxmast".amcum 
  (
    amcum_account char(10) not null ,
    amcum_schedule char(15) not null ,
    amcum_item char(15) not null ,
    amcum_ondate date not null ,
    amcum_offdate date not null ,
    amcum_rectype char(1) not null ,
    amcum_custdelno char(17) not null ,
    amcum_recqty float not null ,
    amcum_delqty float not null ,
    amcum_bilqty float not null ,
    amcum_cumretqty float not null ,
    amcum_reordqty float not null ,
    amcum_cumreoqty float not null ,
    amcum_suppqty float not null ,
    amcum_adjqty float not null ,
    amcum_reason char(5) not null ,
    amcum_lud date not null ,
    amcum_lui char(10) not null ,
    amcum_openosbal float not null 
  );
revoke all on "maxmast".amcum from "public";

create unique index "maxmast".amcum_key on "maxmast".amcum (amcum_account,
    amcum_schedule,amcum_item,amcum_ondate);
create unique index "maxmast".amcum_offkey on "maxmast".amcum 
    (amcum_account,amcum_schedule,amcum_item,amcum_offdate);
{ TABLE "maxmast".amhst row size = 126 number of columns = 11 index size = 219 }
{ unload file name = amhst00105.unl number of rows = 0 }

create table "maxmast".amhst 
  (
    amhst_account char(10) not null ,
    amhst_schedule char(15) not null ,
    amhst_item char(15) not null ,
    amhst_reqdate date not null ,
    amhst_version char(17) not null ,
    amhst_authcode char(35) not null ,
    amhst_parlinnum integer not null ,
    amhst_linnum integer not null ,
    amhst_qtyord float not null ,
    amhst_lud date not null ,
    amhst_lui char(10) not null 
  );
revoke all on "maxmast".amhst from "public";

create unique index "maxmast".amhst_key on "maxmast".amhst (amhst_account,
    amhst_schedule,amhst_item,amhst_reqdate,amhst_version,amhst_parlinnum,
    amhst_linnum);
create unique index "maxmast".amhst_key1 on "maxmast".amhst (amhst_account,
    amhst_schedule,amhst_item,amhst_version,amhst_reqdate,amhst_parlinnum,
    amhst_linnum);
{ TABLE "maxmast".aphdr row size = 54 number of columns = 3 index size = 10 }
{ unload file name = aphdr00106.unl number of rows = 0 }

create table "maxmast".aphdr 
  (
    aphdr_groupid char(3) not null ,
    aphdr_desc char(50) not null ,
    aphdr_status char(1) not null 
  );
revoke all on "maxmast".aphdr from "public";

create unique index "maxmast".aphdr_groupid on "maxmast".aphdr 
    (aphdr_groupid);
{ TABLE "maxmast".appcodes row size = 39 number of columns = 5 index size = 15 }
{ unload file name = appco00107.unl number of rows = 0 }

create table "maxmast".appcodes 
  (
    apc_language char(4) not null ,
    apc_type char(1) not null ,
    apc_code char(1) not null ,
    apc_shortdesc char(3) not null ,
    apc_longdesc char(30) not null 
  );
revoke all on "maxmast".appcodes from "public";

create unique index "maxmast".apc_key on "maxmast".appcodes (apc_language,
    apc_type,apc_code);
{ TABLE "maxmast".aprun row size = 66 number of columns = 10 index size = 16 }
{ unload file name = aprun00108.unl number of rows = 0 }

create table "maxmast".aprun 
  (
    aprun_groupid char(3) not null ,
    aprun_runno integer not null ,
    aprun_gendate date not null ,
    aprun_gentime char(10) not null ,
    aprun_genuser char(10) not null ,
    aprun_passwd char(10) not null ,
    aprun_arcdate date not null ,
    aprun_arctime char(10) not null ,
    aprun_arcuser char(10) not null ,
    aprun_status char(1) not null 
  );
revoke all on "maxmast".aprun from "public";

create unique index "maxmast".aprun_key on "maxmast".aprun (aprun_groupid,
    aprun_runno);
{ TABLE "maxmast".apsql row size = 525 number of columns = 4 index size = 43 }
{ unload file name = apsql00109.unl number of rows = 0 }

create table "maxmast".apsql 
  (
    apsql_groupid char(3) not null ,
    apsql_runno integer not null ,
    apsql_tabname char(18) not null ,
    apsql_sqltxt char(500) not null 
  );
revoke all on "maxmast".apsql from "public";

create unique index "maxmast".apsql_key on "maxmast".apsql (apsql_groupid,
    apsql_runno,apsql_tabname);
{ TABLE "maxmast".aptab row size = 348 number of columns = 7 index size = 124 }
{ unload file name = aptab00110.unl number of rows = 0 }

create table "maxmast".aptab 
  (
    aptab_groupid char(3) not null ,
    aptab_tabname char(18) not null ,
    aptab_promptseq integer not null ,
    aptab_purgeind char(1) not null ,
    aptab_purgeseq integer not null ,
    aptab_sqltxt char(300) not null ,
    aptab_prefix char(18) not null 
  );
revoke all on "maxmast".aptab from "public";

create unique index "maxmast".aptab_key on "maxmast".aptab (aptab_groupid,
    aptab_tabname);
create unique index "maxmast".aptab_promptkey on "maxmast".aptab 
    (aptab_groupid,aptab_promptseq,aptab_tabname);
create unique index "maxmast".aptab_purgekey on "maxmast".aptab 
    (aptab_groupid,aptab_purgeseq,aptab_tabname);
{ TABLE "maxmast".arcca row size = 110 number of columns = 15 index size = 15 }
{ unload file name = arcca00112.unl number of rows = 0 }

create table "maxmast".arcca 
  (
    arcca_year integer not null ,
    arcca_ind01 float not null ,
    arcca_ind02 float not null ,
    arcca_ind03 float not null ,
    arcca_ind04 float not null ,
    arcca_ind05 float not null ,
    arcca_ind06 float not null ,
    arcca_ind07 float not null ,
    arcca_ind08 float not null ,
    arcca_ind09 float not null ,
    arcca_ind10 float not null ,
    arcca_ind11 float not null ,
    arcca_ind12 float not null ,
    arcca_ind13 float not null ,
    arcca_cicode char(2) not null 
  );
revoke all on "maxmast".arcca from "public";

create unique index "maxmast".arcca_key on "maxmast".arcca (arcca_cicode,
    arcca_year);
{ TABLE "maxmast".arelt row size = 110 number of columns = 15 index size = 15 }
{ unload file name = arelt00113.unl number of rows = 0 }

create table "maxmast".arelt 
  (
    arelt_eltcode char(2) not null ,
    arelt_year integer not null ,
    arelt_cum01 float not null ,
    arelt_cum02 float not null ,
    arelt_cum03 float not null ,
    arelt_cum04 float not null ,
    arelt_cum05 float not null ,
    arelt_cum06 float not null ,
    arelt_cum07 float not null ,
    arelt_cum08 float not null ,
    arelt_cum09 float not null ,
    arelt_cum10 float not null ,
    arelt_cum11 float not null ,
    arelt_cum12 float not null ,
    arelt_cum13 float not null 
  );
revoke all on "maxmast".arelt from "public";

create unique index "maxmast".arelt_key on "maxmast".arelt (arelt_eltcode,
    arelt_year);
{ TABLE "maxmast".arprod row size = 51 number of columns = 5 index size = 28 }
{ unload file name = arpro00118.unl number of rows = 0 }

create table "maxmast".arprod 
  (
    arpr_product char(15) not null ,
    arpr_desc char(30) not null ,
    arpr_group char(4) not null ,
    arpr_type char(1) not null ,
    arpr_plant char(1) not null 
  );
revoke all on "maxmast".arprod from "public";

create unique index "maxmast".arpr_product on "maxmast".arprod 
    (arpr_product);
{ TABLE "maxmast".artable row size = 55 number of columns = 5 index size = 10 }
{ unload file name = artab00119.unl number of rows = 0 }

create table "maxmast".artable 
  (
    artab_type char(1) not null ,
    artab_code char(2) not null ,
    artab_desc char(40) not null ,
    artab_baseyear integer not null ,
    artab_baseind float not null 
  );
revoke all on "maxmast".artable from "public";

create unique index "maxmast".artab_key on "maxmast".artable (artab_type,
    artab_code);
{ TABLE "maxmast".bkcheq row size = 116 number of columns = 13 index size = 99 }
{ unload file name = bkche00121.unl number of rows = 4996 }

create table "maxmast".bkcheq 
  (
    bkc_acctref char(10) not null ,
    bkc_chequeno integer not null ,
    bkc_date date not null ,
    bkc_type char(1) not null ,
    bkc_payee char(10) not null ,
    bkc_value float not null ,
    bkc_source char(1) not null ,
    bkc_voucher char(8) not null ,
    bkc_status char(1) not null ,
    bkc_ndcode char(10) not null ,
    bkc_seq serial not null ,
    bkc_payname char(40) not null ,
    bkc_regno char(15) not null 
  );
revoke all on "maxmast".bkcheq from "public";

create unique index "maxmast".bkc_key on "maxmast".bkcheq (bkc_acctref,
    bkc_chequeno,bkc_seq);
create index "maxmast".bkc_refkey on "maxmast".bkcheq (bkc_source,
    bkc_voucher);
create index "maxmast".bkc_regcheq on "maxmast".bkcheq (bkc_regno,
    bkc_chequeno);
create unique index "maxmast".bkc_seq on "maxmast".bkcheq (bkc_seq);
    
{ TABLE "maxmast".bkpara row size = 79 number of columns = 17 index size = 7 }
{ unload file name = bkpar00123.unl number of rows = 1 }

create table "maxmast".bkpara 
  (
    bkpar_key char(1) not null ,
    bkpar_acctuse char(1) not null ,
    bkpar_archive char(1) not null ,
    bkpar_proof integer not null ,
    bkpar_voucher integer not null ,
    bkpar_intref integer not null ,
    bkpar_intprefix char(4) not null ,
    bkpar_proofreq char(1) not null ,
    bkpar_bacref integer not null ,
    bkpar_revalno integer not null ,
    bkpar_bankmatch char(1) not null ,
    bkpar_exslacct char(10) not null ,
    bkpar_explacct char(10) not null ,
    bkpar_exbkacct char(10) not null ,
    bkpar_bkbatch char(1) not null ,
    bkpar_boeproof integer not null ,
    bkpar_account char(15) not null 
  );
revoke all on "maxmast".bkpara from "public";

create unique index "maxmast".bkpar_key on "maxmast".bkpara (bkpar_key);
    
{ TABLE "maxmast".bkstat row size = 47 number of columns = 8 index size = 27 }
{ unload file name = bksta00127.unl number of rows = 0 }

create table "maxmast".bkstat 
  (
    bks_acctref char(10) not null ,
    bks_page integer not null ,
    bks_openbal float not null ,
    bks_closebal float not null ,
    bks_reconbal float not null ,
    bks_recdate date not null ,
    bks_date date not null ,
    bks_repflag char(1) not null 
  );
revoke all on "maxmast".bkstat from "public";

create unique index "maxmast".bks_key on "maxmast".bkstat (bks_acctref,
    bks_page);
{ TABLE "maxmast".ccmas row size = 546 number of columns = 52 index size = 111 }
{ unload file name = ccmas00128.unl number of rows = 0 }

create table "maxmast".ccmas 
  (
    ccm_wt char(2) not null ,
    ccm_job char(5) not null ,
    ccm_client char(10) not null ,
    ccm_sitename char(30) not null ,
    ccm_addr1 char(30) not null ,
    ccm_addr2 char(30) not null ,
    ccm_addr3 char(30) not null ,
    ccm_addr4 char(30) not null ,
    ccm_sitepost char(10) not null ,
    ccm_sitemgr char(30) not null ,
    ccm_tel char(15) not null ,
    ccm_desc char(50) not null ,
    ccm_value float not null ,
    ccm_final float not null ,
    ccm_ohperc float not null ,
    ccm_compper float not null ,
    ccm_status char(1) not null ,
    ccm_agent char(2) not null ,
    ccm_currency char(4) not null ,
    ccm_astdate date not null ,
    ccm_acstdate date not null ,
    ccm_duedate date not null ,
    ccm_acomdate date not null ,
    ccm_extdays integer not null ,
    ccm_architect char(30) not null ,
    ccm_pqs char(30) not null ,
    ccm_consult char(30) not null ,
    ccm_maincont char(30) not null ,
    ccm_progdate date not null ,
    ccm_valdate date not null ,
    ccm_totcost float not null ,
    ccm_valfreq char(2) not null ,
    ccm_csstatus char(1) not null ,
    ccm_invincl char(1) not null ,
    ccm_appdays integer not null ,
    ccm_certdays integer not null ,
    ccm_vatcode char(1) not null ,
    ccm_combined char(1) not null ,
    ccm_discper float not null ,
    ccm_ret1per float not null ,
    ccm_retlim float not null ,
    ccm_ret2per float not null ,
    ccm_hoohper float not null ,
    ccm_arohper float not null ,
    ccm_merge char(1) not null ,
    ccm_subuse char(1) not null ,
    ccm_usewo char(1) not null ,
    ccm_archive char(1) not null ,
    ccm_repcode char(4) not null ,
    ccm_cssubcode char(4) not null ,
    ccm_cstcode integer not null ,
    ccm_cstcuse char(1) not null 
  );
revoke all on "maxmast".ccmas from "public";

create unique index "maxmast".ccm_ackey on "maxmast".ccmas (ccm_client,
    ccm_currency,ccm_wt,ccm_job);
create index "maxmast".ccm_client on "maxmast".ccmas (ccm_client);
    
create unique index "maxmast".ccm_curkey on "maxmast".ccmas (ccm_currency,
    ccm_wt,ccm_job);
create index "maxmast".ccm_job on "maxmast".ccmas (ccm_job);
create unique index "maxmast".ccm_key on "maxmast".ccmas (ccm_wt,
    ccm_job);
{ TABLE "maxmast".ccost row size = 228 number of columns = 32 index size = 87 }
{ unload file name = ccost00129.unl number of rows = 0 }

create table "maxmast".ccost 
  (
    ccost_wt char(2) not null ,
    ccost_job char(5) not null ,
    ccost_subcode char(4) not null ,
    ccost_tcode integer not null ,
    ccost_maingrp char(1) not null ,
    ccost_lastpost date not null ,
    ccost_totval float not null ,
    ccost_totqty float not null ,
    ccost_totresv float not null ,
    ccost_totover float not null ,
    ccost_bfval float not null ,
    ccost_bfqty float not null ,
    ccost_bfresv float not null ,
    ccost_bfover float not null ,
    ccost_ybfval float not null ,
    ccost_ybfqty float not null ,
    ccost_ybfresv float not null ,
    ccost_ybfover float not null ,
    ccost_poval float not null ,
    ccost_poqty float not null ,
    ccost_preval float not null ,
    ccost_curval float not null ,
    ccost_budval float not null ,
    ccost_budqty float not null ,
    ccost_bfwoffval float not null ,
    ccost_ybfwoffvl float not null ,
    ccost_pval float not null ,
    ccost_pval1 float not null ,
    ccost_pval2 float not null ,
    ccost_pqty float not null ,
    ccost_pqty1 float not null ,
    ccost_pqty2 float not null 
  );
revoke all on "maxmast".ccost from "public";

create unique index "maxmast".ccost_grpkey on "maxmast".ccost 
    (ccost_wt,ccost_job,ccost_subcode,ccost_maingrp,ccost_tcode);
    
create unique index "maxmast".ccost_jobkey on "maxmast".ccost 
    (ccost_wt,ccost_job,ccost_tcode,ccost_subcode);
create unique index "maxmast".ccost_key on "maxmast".ccost (ccost_wt,
    ccost_job,ccost_subcode,ccost_tcode);
{ TABLE "maxmast".ccpara row size = 182 number of columns = 49 index size = 7 }
{ unload file name = ccpar00130.unl number of rows = 0 }

create table "maxmast".ccpara 
  (
    ccpar_key char(1) not null ,
    ccpar_wtuse char(1) not null ,
    ccpar_jobuse char(1) not null ,
    ccpar_uomuse char(1) not null ,
    ccpar_rateuse char(1) not null ,
    ccpar_proof integer not null ,
    ccpar_wtmod integer not null ,
    ccpar_vatind char(1) not null ,
    ccpar_sysuse char(35) not null ,
    ccpar_master char(4) not null ,
    ccpar_year integer not null ,
    ccpar_curper integer not null ,
    ccpar_valind char(1) not null ,
    ccpar_vartcode integer not null ,
    ccpar_usewo char(1) not null ,
    ccpar_balload char(1) not null ,
    ccpar_proofreq char(1) not null ,
    ccpar_pendreq char(1) not null ,
    ccpar_bfwdind char(1) not null ,
    ccpar_wtsubuse char(1) not null ,
    ccpar_hotcode integer not null ,
    ccpar_areatcode integer not null ,
    ccpar_modlen integer not null ,
    ccpar_intref integer not null ,
    ccpar_intprefix char(4) not null ,
    ccpar_unijob char(1) not null ,
    ccpar_jobcreate char(1) not null ,
    ccpar_prog char(4) not null ,
    ccpar_prog1 char(4) not null ,
    ccpar_prog2 char(4) not null ,
    ccpar_prog3 char(4) not null ,
    ccpar_prog4 char(4) not null ,
    ccpar_prog5 char(4) not null ,
    ccpar_prog6 char(4) not null ,
    ccpar_prog7 char(4) not null ,
    ccpar_prog8 char(4) not null ,
    ccpar_prog9 char(4) not null ,
    ccpar_prog10 char(4) not null ,
    ccpar_prog11 char(4) not null ,
    ccpar_prog12 char(4) not null ,
    ccpar_prog13 char(4) not null ,
    ccpar_prog14 char(4) not null ,
    ccpar_prog15 char(4) not null ,
    ccpar_prog16 char(4) not null ,
    ccpar_prog17 char(4) not null ,
    ccpar_prog18 char(4) not null ,
    ccpar_prog19 char(4) not null ,
    ccpar_unallsc char(4) not null ,
    ccpar_proratsc char(4) not null 
  );
revoke all on "maxmast".ccpara from "public";

create unique index "maxmast".ccpar_key on "maxmast".ccpara (ccpar_key);
    
{ TABLE "maxmast".cctcode row size = 120 number of columns = 14 index size = 25 }
{ unload file name = cctco00131.unl number of rows = 0 }

create table "maxmast".cctcode 
  (
    cctc_tcode integer not null ,
    cctc_desc char(30) not null ,
    cctc_maingrp char(1) not null ,
    cctc_overper float not null ,
    cctc_basegl char(15) not null ,
    cctc_baseover char(15) not null ,
    cctc_tcodeover integer not null ,
    cctc_qtyuse char(1) not null ,
    cctc_uom char(6) not null ,
    cctc_basewoff char(15) not null ,
    cctc_basecos char(15) not null ,
    cctc_subcode char(4) not null ,
    cctc_status char(1) not null ,
    cctc_postatble char(1) not null 
  );
revoke all on "maxmast".cctcode from "public";

create unique index "maxmast".cctc_grpkey on "maxmast".cctcode 
    (cctc_maingrp,cctc_tcode);
create unique index "maxmast".cctc_tcode on "maxmast".cctcode 
    (cctc_tcode);
{ TABLE "maxmast".cctran row size = 187 number of columns = 27 index size = 93 }
{ unload file name = cctra00132.unl number of rows = 0 }

create table "maxmast".cctran 
  (
    cct_serial serial not null ,
    cct_wt char(2) not null ,
    cct_job char(5) not null ,
    cct_subcode char(4) not null ,
    cct_tcode integer not null ,
    cct_trandate date not null ,
    cct_ourref char(8) not null ,
    cct_docref char(8) not null ,
    cct_ledger char(1) not null ,
    cct_supplier char(10) not null ,
    cct_glacc char(15) not null ,
    cct_value float not null ,
    cct_qty float not null ,
    cct_unit char(6) not null ,
    cct_rate float not null ,
    cct_memo char(50) not null ,
    cct_proof integer not null ,
    cct_poref char(8) not null ,
    cct_overyn char(1) not null ,
    cct_selwo char(1) not null ,
    cct_batch char(6) not null ,
    cct_glvalue float not null ,
    cct_trantype char(1) not null ,
    cct_period integer not null ,
    cct_year integer not null ,
    cct_revdate date not null ,
    cct_pend char(1) not null 
  );
revoke all on "maxmast".cctran from "public";

create unique index "maxmast".cct_key on "maxmast".cctran (cct_wt,
    cct_job,cct_subcode,cct_tcode,cct_trandate,cct_serial);
create index "maxmast".cct_proofkey on "maxmast".cctran (cct_proof,
    cct_wt,cct_job,cct_subcode,cct_tcode,cct_trandate);
create unique index "maxmast".cct_serial on "maxmast".cctran (cct_serial);
    
{ TABLE "maxmast".ccwt row size = 48 number of columns = 11 index size = 9 }
{ unload file name = ccwt_00133.unl number of rows = 0 }

create table "maxmast".ccwt 
  (
    ccwt_wt char(2) not null ,
    ccwt_desc char(30) not null ,
    ccwt_gluse char(1) not null ,
    ccwt_glmod char(4) not null ,
    ccwt_page char(1) not null ,
    ccwt_archive char(1) not null ,
    ccwt_lablev char(1) not null ,
    ccwt_subuse char(1) not null ,
    ccwt_password char(5) not null ,
    ccwt_geogarea char(1) not null ,
    ccwt_type char(1) not null 
  );
revoke all on "maxmast".ccwt from "public";

create unique index "maxmast".ccwt_wt on "maxmast".ccwt (ccwt_wt);
    
{ TABLE "maxmast".cheader row size = 51 number of columns = 7 index size = 105 }
{ unload file name = chead00134.unl number of rows = 0 }

create table "maxmast".cheader 
  (
    ch_fileid char(9) not null ,
    ch_comptyp char(1) not null ,
    ch_system char(8) not null ,
    ch_prefix char(5) not null ,
    ch_projman char(9) not null ,
    ch_database char(15) not null ,
    ch_timeup integer not null 
  );
revoke all on "maxmast".cheader from "public";

create unique index "maxmast".ch_fileid on "maxmast".cheader (ch_fileid);
    
create index "maxmast".ch_filetype on "maxmast".cheader (ch_comptyp,
    ch_fileid);
create index "maxmast".ch_prefix on "maxmast".cheader (ch_prefix);
    
create unique index "maxmast".ch_syskey on "maxmast".cheader (ch_comptyp,
    ch_system,ch_fileid);
create index "maxmast".ch_system on "maxmast".cheader (ch_system);
    
{ TABLE "maxmast".cobgt row size = 95 number of columns = 9 index size = 88 }
{ unload file name = cobgt00135.unl number of rows = 0 }

create table "maxmast".cobgt 
  (
    cobgt_contract char(15) not null ,
    cobgt_conlin integer not null ,
    cobgt_year integer not null ,
    cobgt_period integer not null ,
    cobgt_cost float not null ,
    cobgt_category char(1) not null ,
    cobgt_comment char(45) not null ,
    cobgt_lud date not null ,
    cobgt_lui char(10) not null 
  );
revoke all on "maxmast".cobgt from "public";

create unique index "maxmast".cobgt_key1 on "maxmast".cobgt (cobgt_contract,
    cobgt_conlin,cobgt_year,cobgt_period,cobgt_category);
create index "maxmast".cobgt_key2 on "maxmast".cobgt (cobgt_contract,
    cobgt_year,cobgt_period);
{ TABLE "maxmast".cocds row size = 108 number of columns = 22 index size = 93 }
{ unload file name = cocds00136.unl number of rows = 0 }

create table "maxmast".cocds 
  (
    cocds_contract char(15) not null ,
    cocds_lin integer not null ,
    cocds_onrev integer not null ,
    cocds_offrev integer not null ,
    cocds_deldate date not null ,
    cocds_delqty float not null ,
    cocds_delpoint char(10) not null ,
    cocds_lud date not null ,
    cocds_lui char(10) not null ,
    cocds_dateauth date not null ,
    cocds_uom char(5) not null ,
    cocds_action char(1) not null ,
    cocds_sopdone char(1) not null ,
    cocds_reqdone char(1) not null ,
    cocds_mpsdone char(1) not null ,
    cocds_olinnum integer not null ,
    cocds_reqno char(10) not null ,
    cocds_planned date not null ,
    cocds_serial serial not null ,
    cocds_duration float not null ,
    cocds_durunit char(1) not null ,
    cocds_status char(1) not null 
  );
revoke all on "maxmast".cocds from "public";

create unique index "maxmast".cocds_key on "maxmast".cocds (cocds_contract,
    cocds_lin,cocds_offrev,cocds_deldate,cocds_serial);
create unique index "maxmast".cocds_key1 on "maxmast".cocds (cocds_contract,
    cocds_olinnum,cocds_serial);
{ TABLE "maxmast".coesc row size = 43 number of columns = 7 index size = 25 }
{ unload file name = coesc00137.unl number of rows = 0 }

create table "maxmast".coesc 
  (
    coesc_table char(5) not null ,
    coesc_year integer not null ,
    coesc_month integer not null ,
    coesc_material float not null ,
    coesc_labour float not null ,
    coesc_lud date not null ,
    coesc_lui char(10) not null 
  );
revoke all on "maxmast".coesc from "public";

create unique index "maxmast".coesc_key on "maxmast".coesc (coesc_table,
    coesc_year,coesc_month);
{ TABLE "maxmast".cohdr row size = 579 number of columns = 79 index size = 148 }
{ unload file name = cohdr00138.unl number of rows = 0 }

create table "maxmast".cohdr 
  (
    cohdr_contract char(15) not null ,
    cohdr_onrev integer not null ,
    cohdr_offrev integer not null ,
    cohdr_stage char(1) not null ,
    cohdr_remarks char(45) not null ,
    cohdr_desc char(45) not null ,
    cohdr_textfile char(25) not null ,
    cohdr_customer char(10) not null ,
    cohdr_sordnum char(8) not null ,
    cohdr_reason char(1) not null ,
    cohdr_enqdate date not null ,
    cohdr_qduedate date not null ,
    cohdr_duedate date not null ,
    cohdr_completed date not null ,
    cohdr_currentrv integer not null ,
    cohdr_acceptrev integer not null ,
    cohdr_imargin float not null ,
    cohdr_rmargin float not null ,
    cohdr_mmargin float not null ,
    cohdr_estcost float not null ,
    cohdr_quotecost float not null ,
    cohdr_projman char(3) not null ,
    cohdr_loadpc float not null ,
    cohdr_lud date not null ,
    cohdr_lui char(10) not null ,
    cohdr_salesoff char(5) not null ,
    cohdr_cndcode char(10) not null ,
    cohdr_firmcont char(15) not null ,
    cohdr_status char(1) not null ,
    cohdr_custref char(10) not null ,
    cohdr_contact char(20) not null ,
    cohdr_origcod char(9) not null ,
    cohdr_ioffmarg float not null ,
    cohdr_roffmarg float not null ,
    cohdr_moffmarg float not null ,
    cohdr_imargtyp char(1) not null ,
    cohdr_rmargtyp char(1) not null ,
    cohdr_mmargtyp char(1) not null ,
    cohdr_procbycrp char(1) not null ,
    cohdr_esctable char(5) not null ,
    cohdr_escanchor date not null ,
    cohdr_esclabpc float not null ,
    cohdr_escmatpc float not null ,
    cohdr_escothpc float not null ,
    cohdr_agent char(10) not null ,
    cohdr_serno char(15) not null ,
    cohdr_autotrpc float not null ,
    cohdr_bidmanage char(3) not null ,
    cohdr_biddecisn char(1) not null ,
    cohdr_biddmaker char(3) not null ,
    cohdr_biddecdte date not null ,
    cohdr_biddecrea char(1) not null ,
    cohdr_quotauthd char(1) not null ,
    cohdr_quotauthr char(3) not null ,
    cohdr_warrper1 integer not null ,
    cohdr_warrper2 integer not null ,
    cohdr_warrstpt char(1) not null ,
    cohdr_payterms char(2) not null ,
    cohdr_docreqd char(1) not null ,
    cohdr_valuecos char(1) not null ,
    cohdr_type char(5) not null ,
    cohdr_authdate date not null ,
    cohdr_exportlic char(15) not null ,
    cohdr_exportexp date not null ,
    cohdr_matperbak integer not null ,
    cohdr_labperbak integer not null ,
    cohdr_warrglacc char(15) not null ,
    cohdr_currency char(4) not null ,
    cohdr_currrate float not null ,
    cohdr_fixedrate char(1) not null ,
    cohdr_freezept char(1) not null ,
    cohdr_inceptpt char(1) not null ,
    cohdr_salesglac char(15) not null ,
    cohdr_advpaygla char(15) not null ,
    cohdr_archiveof char(15) not null ,
    cohdr_tottraded float not null ,
    cohdr_esctodate float not null ,
    cohdr_currstat integer not null ,
    cohdr_twinrate float not null 
  );
revoke all on "maxmast".cohdr from "public";

create index "maxmast".cohdr_contract on "maxmast".cohdr (cohdr_contract);
    
create index "maxmast".cohdr_firmcont on "maxmast".cohdr (cohdr_firmcont);
    
create unique index "maxmast".cohdr_firmkey on "maxmast".cohdr 
    (cohdr_firmcont,cohdr_contract,cohdr_offrev);
create unique index "maxmast".cohdr_key1 on "maxmast".cohdr (cohdr_contract,
    cohdr_offrev);
{ TABLE "maxmast".colin row size = 667 number of columns = 89 index size = 105 }
{ unload file name = colin00139.unl number of rows = 0 }

create table "maxmast".colin 
  (
    colin_contract char(15) not null ,
    colin_lin integer not null ,
    colin_onrev integer not null ,
    colin_offrev integer not null ,
    colin_level integer not null ,
    colin_linetype char(1) not null ,
    colin_special char(1) not null ,
    colin_actnumber char(10) not null ,
    colin_resp char(3) not null ,
    colin_mailsent char(1) not null ,
    colin_instruct char(40) not null ,
    colin_edatareq date not null ,
    colin_edatadone char(1) not null ,
    colin_duedate date not null ,
    colin_promised date not null ,
    colin_estcost float not null ,
    colin_margin float not null ,
    colin_moverride char(1) not null ,
    colin_comm1 char(40) not null ,
    colin_comm2 char(40) not null ,
    colin_textfile char(25) not null ,
    colin_item char(15) not null ,
    colin_itemqty float not null ,
    colin_uom char(5) not null ,
    colin_desc char(25) not null ,
    colin_mpsflag char(1) not null ,
    colin_orderflag char(1) not null ,
    colin_manfac char(5) not null ,
    colin_supplier char(10) not null ,
    colin_price float not null ,
    colin_priceuom char(5) not null ,
    colin_sopflag char(1) not null ,
    colin_sellprice float not null ,
    colin_resid char(15) not null ,
    colin_resqty float not null ,
    colin_workcen char(5) not null ,
    colin_duration float not null ,
    colin_durunit char(1) not null ,
    colin_rate float not null ,
    colin_setres char(1) not null ,
    colin_procres char(1) not null ,
    colin_printable char(1) not null ,
    colin_subtotal char(1) not null ,
    colin_tottext char(45) not null ,
    colin_pagethrow char(1) not null ,
    colin_skiplines integer not null ,
    colin_sopdone char(1) not null ,
    colin_mpsdone char(1) not null ,
    colin_orderdone char(1) not null ,
    colin_orderno char(10) not null ,
    colin_emodser char(10) not null ,
    colin_rtmodser char(10) not null ,
    colin_completed date not null ,
    colin_lud date not null ,
    colin_lui char(10) not null ,
    colin_selluom char(5) not null ,
    colin_reqflag char(1) not null ,
    colin_reqdone char(1) not null ,
    colin_reqno char(10) not null ,
    colin_branch char(4) not null ,
    colin_estuncost float not null ,
    colin_margintyp char(1) not null ,
    colin_itemac char(15) not null ,
    colin_escalate char(1) not null ,
    colin_suppcurr char(4) not null ,
    colin_commperct float not null ,
    colin_costsales char(1) not null ,
    colin_delpoint char(10) not null ,
    colin_suppitem char(15) not null ,
    colin_action char(1) not null ,
    colin_qtyper float not null ,
    colin_fixedqty float not null ,
    colin_scrappc float not null ,
    colin_qtyperuom char(5) not null ,
    colin_docreqd char(1) not null ,
    colin_currency char(4) not null ,
    colin_fixedrate char(1) not null ,
    colin_exportlic char(15) not null ,
    colin_exportexp date not null ,
    colin_status char(1) not null ,
    colin_currrate float not null ,
    colin_invoice char(1) not null ,
    colin_spendind float not null ,
    colin_progind float not null ,
    colin_frptpexr float not null ,
    colin_inptpexr float not null ,
    colin_agent char(10) not null ,
    colin_currstat integer not null ,
    colin_twintrate float not null 
  );
revoke all on "maxmast".colin from "public";

create unique index "maxmast".colin_key1 on "maxmast".colin (colin_contract,
    colin_lin,colin_offrev);
create unique index "maxmast".colin_key2 on "maxmast".colin (colin_offrev,
    colin_linetype,colin_item,colin_contract,colin_lin);
{ TABLE "maxmast".company row size = 253 number of columns = 11 index size = 12 }
{ unload file name = compa00140.unl number of rows = 0 }

create table "maxmast".company 
  (
    comp_coid char(4) not null ,
    comp_name char(45) not null ,
    comp_addr1 char(30) not null ,
    comp_addr2 char(30) not null ,
    comp_addr3 char(30) not null ,
    comp_addr4 char(30) not null ,
    comp_addr5 char(30) not null ,
    comp_postcode char(10) not null ,
    comp_telex char(20) not null ,
    comp_telephone char(20) not null ,
    comp_mdecs integer not null 
  );
revoke all on "maxmast".company from "public";

create unique index "maxmast".comp_coid on "maxmast".company (comp_coid);
    
{ TABLE "maxmast".compkey row size = 27 number of columns = 4 index size = 73 }
{ unload file name = compk00141.unl number of rows = 0 }

create table "maxmast".compkey 
  (
    compk_fileid char(5) not null ,
    compk_keyname char(9) not null ,
    compk_sequence integer not null ,
    compk_fieldname char(9) not null 
  );
revoke all on "maxmast".compkey from "public";

create index "maxmast".compk_colkey on "maxmast".compkey (compk_fileid,
    compk_keyname,compk_fieldname);
create unique index "maxmast".compk_key on "maxmast".compkey (compk_fileid,
    compk_keyname,compk_sequence);
{ TABLE "maxmast".coqtn row size = 131 number of columns = 11 index size = 103 }
{ unload file name = coqtn00142.unl number of rows = 0 }

create table "maxmast".coqtn 
  (
    coqtn_contract char(15) not null ,
    coqtn_revision integer not null ,
    coqtn_quotation char(15) not null ,
    coqtn_title char(45) not null ,
    coqtn_textfile char(25) not null ,
    coqtn_printdate date not null ,
    coqtn_lastvalid date not null ,
    coqtn_status char(1) not null ,
    coqtn_respdate date not null ,
    coqtn_lud date not null ,
    coqtn_lui char(10) not null 
  );
revoke all on "maxmast".coqtn from "public";

create unique index "maxmast".coqtn_datekey on "maxmast".coqtn 
    (coqtn_contract,coqtn_printdate,coqtn_revision);
create unique index "maxmast".coqtn_key1 on "maxmast".coqtn (coqtn_contract,
    coqtn_revision);
create unique index "maxmast".coqtn_quotation on "maxmast".coqtn 
    (coqtn_quotation);
{ TABLE "maxmast".cost_int row size = 31 number of columns = 3 index size = 28 }
{ unload file name = cost_00144.unl number of rows = 19990 }

create table "maxmast".cost_int 
  (
    item char(15),
    lab_cost float,
    mat_cost float
  );
revoke all on "maxmast".cost_int from "public";

create index "maxmast".x_item on "maxmast".cost_int (item);
{ TABLE "maxmast".cotrd row size = 95 number of columns = 11 index size = 46 }
{ unload file name = cotrd00145.unl number of rows = 0 }

create table "maxmast".cotrd 
  (
    cotrd_contract char(15) not null ,
    cotrd_lin integer not null ,
    cotrd_traddate date not null ,
    cotrd_tradline integer not null ,
    cotrd_tradpcent float not null ,
    cotrd_tradval float not null ,
    cotrd_warpcent float not null ,
    cotrd_glacc char(15) not null ,
    cotrd_lud date not null ,
    cotrd_lui char(10) not null ,
    cotrd_linkref char(15) not null 
  );
revoke all on "maxmast".cotrd from "public";

create unique index "maxmast".cotrd_key on "maxmast".cotrd (cotrd_contract,
    cotrd_lin,cotrd_traddate,cotrd_tradline);
{ TABLE "maxmast".cotrn row size = 200 number of columns = 25 index size = 52 }
{ unload file name = cotrn00146.unl number of rows = 0 }

create table "maxmast".cotrn 
  (
    cotrn_trnserial serial not null ,
    cotrn_contract char(15) not null ,
    cotrn_lin integer not null ,
    cotrn_type char(1) not null ,
    cotrn_date date not null ,
    cotrn_orderno char(15) not null ,
    cotrn_item char(15) not null ,
    cotrn_itemqty float not null ,
    cotrn_opno char(5) not null ,
    cotrn_resid char(15) not null ,
    cotrn_resqty float not null ,
    cotrn_costype char(5) not null ,
    cotrn_element char(5) not null ,
    cotrn_settdur float not null ,
    cotrn_settunit char(1) not null ,
    cotrn_procdur float not null ,
    cotrn_procunit char(1) not null ,
    cotrn_cost1 float not null ,
    cotrn_cost2 float not null ,
    cotrn_period integer not null ,
    cotrn_desc char(25) not null ,
    cotrn_orig1 char(15) not null ,
    cotrn_orig2 integer not null ,
    cotrn_lud date not null ,
    cotrn_lui char(10) not null 
  );
revoke all on "maxmast".cotrn from "public";

create unique index "maxmast".cotrn_key1 on "maxmast".cotrn (cotrn_contract,
    cotrn_lin,cotrn_trnserial);
create unique index "maxmast".cotrn_trnserial on "maxmast".cotrn 
    (cotrn_trnserial);
{ TABLE "maxmast".crest row size = 100 number of columns = 11 index size = 201 }
{ unload file name = crest00148.unl number of rows = 0 }

create table "maxmast".crest 
  (
    crest_runid char(15) not null ,
    crest_manfac char(5) not null ,
    crest_workcen char(5) not null ,
    crest_resid char(15) not null ,
    crest_period integer not null ,
    crest_contract char(15) not null ,
    crest_conlin integer not null ,
    crest_item char(15) not null ,
    crest_loadhrs float not null ,
    crest_lud date not null ,
    crest_lui char(10) not null 
  );
revoke all on "maxmast".crest from "public";

create unique index "maxmast".crest_conkey on "maxmast".crest 
    (crest_contract,crest_runid,crest_manfac,crest_workcen,crest_resid,
    crest_period,crest_conlin);
create unique index "maxmast".crest_key1 on "maxmast".crest (crest_runid,
    crest_manfac,crest_workcen,crest_resid,crest_period,crest_contract,
    crest_conlin);
{ TABLE "maxmast".crfrm row size = 77 number of columns = 8 index size = 196 }
{ unload file name = crfrm00149.unl number of rows = 0 }

create table "maxmast".crfrm 
  (
    crfrm_runid char(15) not null ,
    crfrm_manfac char(5) not null ,
    crfrm_aworkcen char(5) not null ,
    crfrm_resid char(15) not null ,
    crfrm_period integer not null ,
    crfrm_orderno char(10) not null ,
    crfrm_loadhrs float not null ,
    crfrm_item char(15) not null 
  );
revoke all on "maxmast".crfrm from "public";

create unique index "maxmast".crfrm_itemkey on "maxmast".crfrm 
    (crfrm_item,crfrm_runid,crfrm_manfac,crfrm_aworkcen,crfrm_resid,
    crfrm_period,crfrm_orderno);
create unique index "maxmast".crfrm_key on "maxmast".crfrm (crfrm_runid,
    crfrm_manfac,crfrm_aworkcen,crfrm_resid,crfrm_period,crfrm_orderno);
    
{ TABLE "maxmast".crmps row size = 86 number of columns = 11 index size = 181 }
{ unload file name = crmps00150.unl number of rows = 0 }

create table "maxmast".crmps 
  (
    crmps_runid char(15) not null ,
    crmps_manfac char(5) not null ,
    crmps_workcen char(5) not null ,
    crmps_resid char(15) not null ,
    crmps_period integer not null ,
    crmps_rqtserial integer not null ,
    crmps_item char(15) not null ,
    crmps_loadhrs float not null ,
    crmps_lud date not null ,
    crmps_lui char(10) not null ,
    crmps_serorig char(1) not null 
  );
revoke all on "maxmast".crmps from "public";

create unique index "maxmast".crmps_itemkey on "maxmast".crmps 
    (crmps_item,crmps_runid,crmps_manfac,crmps_workcen,crmps_resid,
    crmps_period,crmps_serorig,crmps_rqtserial);
create unique index "maxmast".crmps_key1 on "maxmast".crmps (crmps_runid,
    crmps_manfac,crmps_workcen,crmps_resid,crmps_period,crmps_serorig,
    crmps_rqtserial);
{ TABLE "maxmast".crpar row size = 106 number of columns = 29 index size = 28 }
{ unload file name = crpar00151.unl number of rows = 0 }

create table "maxmast".crpar 
  (
    crpar_runid char(15) not null ,
    crpar_today date not null ,
    crpar_sched char(1) not null ,
    crpar_routeflag char(1) not null ,
    crpar_routeid char(5) not null ,
    crpar_released char(1) not null ,
    crpar_firm char(1) not null ,
    crpar_recommend char(1) not null ,
    crpar_lud date not null ,
    crpar_lui char(10) not null ,
    crpar_days1 integer not null ,
    crpar_days2 integer not null ,
    crpar_days3 integer not null ,
    crpar_days4 integer not null ,
    crpar_days5 integer not null ,
    crpar_days6 integer not null ,
    crpar_days7 integer not null ,
    crpar_days8 integer not null ,
    crpar_days9 integer not null ,
    crpar_days10 integer not null ,
    crpar_backgrd char(1) not null ,
    crpar_report char(1) not null ,
    crpar_estimated char(1) not null ,
    crpar_roughcut char(1) not null ,
    crpar_needregen char(1) not null ,
    crpar_mps char(1) not null ,
    crpar_salesord char(1) not null ,
    crpar_basecrp char(15) not null ,
    crpar_crptype char(1) not null 
  );
revoke all on "maxmast".crpar from "public";

create unique index "maxmast".crpar_runid on "maxmast".crpar (crpar_runid);
    
{ TABLE "maxmast".crrec row size = 67 number of columns = 7 index size = 189 }
{ unload file name = crrec00152.unl number of rows = 0 }

create table "maxmast".crrec 
  (
    crrec_runid char(15) not null ,
    crrec_manfac char(5) not null ,
    crrec_aworkcen char(5) not null ,
    crrec_resid char(15) not null ,
    crrec_period integer not null ,
    crrec_loadhrs float not null ,
    crrec_item char(15) not null 
  );
revoke all on "maxmast".crrec from "public";

create unique index "maxmast".crrec_itemkey on "maxmast".crrec 
    (crrec_item,crrec_runid,crrec_manfac,crrec_aworkcen,crrec_resid,
    crrec_period);
create unique index "maxmast".crrec_key on "maxmast".crrec (crrec_runid,
    crrec_manfac,crrec_aworkcen,crrec_resid,crrec_period,crrec_item);
    
{ TABLE "maxmast".crrel row size = 77 number of columns = 8 index size = 196 }
{ unload file name = crrel00153.unl number of rows = 0 }

create table "maxmast".crrel 
  (
    crrel_runid char(15) not null ,
    crrel_manfac char(5) not null ,
    crrel_aworkcen char(5) not null ,
    crrel_resid char(15) not null ,
    crrel_period integer not null ,
    crrel_orderno char(10) not null ,
    crrel_loadhrs float not null ,
    crrel_item char(15) not null 
  );
revoke all on "maxmast".crrel from "public";

create unique index "maxmast".crrel_itemkey on "maxmast".crrel 
    (crrel_item,crrel_runid,crrel_manfac,crrel_aworkcen,crrel_resid,
    crrel_period,crrel_orderno);
create unique index "maxmast".crrel_key on "maxmast".crrel (crrel_runid,
    crrel_manfac,crrel_aworkcen,crrel_resid,crrel_period,crrel_orderno);
    
{ TABLE "maxmast".crsop row size = 93 number of columns = 11 index size = 202 }
{ unload file name = crsop00154.unl number of rows = 0 }

create table "maxmast".crsop 
  (
    crsop_runid char(15) not null ,
    crsop_manfac char(5) not null ,
    crsop_workcen char(5) not null ,
    crsop_resid char(15) not null ,
    crsop_period integer not null ,
    crsop_ordnum char(8) not null ,
    crsop_linnum integer not null ,
    crsop_item char(15) not null ,
    crsop_loadhrs float not null ,
    crsop_lud date not null ,
    crsop_lui char(10) not null 
  );
revoke all on "maxmast".crsop from "public";

create unique index "maxmast".crsop_itemkey on "maxmast".crsop 
    (crsop_item,crsop_runid,crsop_manfac,crsop_workcen,crsop_resid,
    crsop_period,crsop_ordnum,crsop_linnum);
create unique index "maxmast".crsop_key1 on "maxmast".crsop (crsop_runid,
    crsop_manfac,crsop_workcen,crsop_resid,crsop_period,crsop_ordnum,
    crsop_linnum);
{ TABLE "maxmast".crsum row size = 53 number of columns = 7 index size = 73 }
{ unload file name = crsum00155.unl number of rows = 0 }

create table "maxmast".crsum 
  (
    crsum_runid char(15) not null ,
    crsum_manfac char(5) not null ,
    crsum_aworkcen char(5) not null ,
    crsum_resid char(15) not null ,
    crsum_period integer not null ,
    crsum_typ char(1) not null ,
    crsum_loadhrs float not null 
  );
revoke all on "maxmast".crsum from "public";

create unique index "maxmast".crsum_key on "maxmast".crsum (crsum_runid,
    crsum_manfac,crsum_aworkcen,crsum_resid,crsum_period,crsum_typ);
    
{ TABLE "maxmast".crtrc row size = 55 number of columns = 6 index size = 51 }
{ unload file name = crtrc00156.unl number of rows = 0 }

create table "maxmast".crtrc 
  (
    crtrc_runid char(15) not null ,
    crtrc_contract char(15) not null ,
    crtrc_source char(10) not null ,
    crtrc_regen char(1) not null ,
    crtrc_lud date not null ,
    crtrc_lui char(10) not null 
  );
revoke all on "maxmast".crtrc from "public";

create unique index "maxmast".crtrc_key on "maxmast".crtrc (crtrc_runid,
    crtrc_contract);
{ TABLE "maxmast".crtri row size = 55 number of columns = 6 index size = 51 }
{ unload file name = crtri00157.unl number of rows = 0 }

create table "maxmast".crtri 
  (
    crtri_runid char(15) not null ,
    crtri_item char(15) not null ,
    crtri_source char(10) not null ,
    crtri_regen char(1) not null ,
    crtri_lud date not null ,
    crtri_lui char(10) not null 
  );
revoke all on "maxmast".crtri from "public";

create unique index "maxmast".crtri_key on "maxmast".crtri (crtri_runid,
    crtri_item);
{ TABLE "maxmast".cuhst row size = 62 number of columns = 10 index size = 24 }
{ unload file name = cuhst00158.unl number of rows = 0 }

create table "maxmast".cuhst 
  (
    cuhst_year integer not null ,
    cuhst_period integer not null ,
    cuhst_culink integer not null ,
    cuhst_lud date not null ,
    cuhst_lui char(10) not null ,
    cuhst_trancurr char(4) not null ,
    cuhst_eurovalue float not null ,
    cuhst_euroconv float not null ,
    cuhst_valuecurr float not null ,
    cuhst_convcurr float not null 
  );
revoke all on "maxmast".cuhst from "public";

create unique index "maxmast".cuhst_key on "maxmast".cuhst (cuhst_year,
    cuhst_period,cuhst_culink);
{ TABLE "maxmast".curate row size = 16 number of columns = 3 index size = 18 }
{ unload file name = curat00160.unl number of rows = 0 }

create table "maxmast".curate 
  (
    cur_currency char(4) not null ,
    cur_date date not null ,
    cur_rate float not null 
  );
revoke all on "maxmast".curate from "public";

create unique index "maxmast".cur_key on "maxmast".curate (cur_currency,
    cur_date);
{ TABLE "maxmast".cutran row size = 75 number of columns = 13 index size = 79 }
{ unload file name = cutra00161.unl number of rows = 0 }

create table "maxmast".cutran 
  (
    cut_source char(1) not null ,
    cut_ourref char(8) not null ,
    cut_currency char(4) not null ,
    cut_account char(15) not null ,
    cut_wt char(2) not null ,
    cut_job char(5) not null ,
    cut_subcode char(4) not null ,
    cut_tcode integer not null ,
    cut_value float not null ,
    cut_glvalue float not null ,
    cut_date date not null ,
    cut_serial serial not null ,
    cut_voucher char(8) not null 
  );
revoke all on "maxmast".cutran from "public";

create unique index "maxmast".cut_key on "maxmast".cutran (cut_source,
    cut_ourref,cut_serial);
create unique index "maxmast".cut_serial on "maxmast".cutran (cut_serial);
    
create index "maxmast".cut_vouchkey on "maxmast".cutran (cut_source,
    cut_voucher,cut_account);
{ TABLE "maxmast".cutrn row size = 62 number of columns = 10 index size = 24 }
{ unload file name = cutrn00162.unl number of rows = 0 }

create table "maxmast".cutrn 
  (
    cutrn_year integer not null ,
    cutrn_period integer not null ,
    cutrn_culink integer not null ,
    cutrn_lud date not null ,
    cutrn_lui char(10) not null ,
    cutrn_trancurr char(4) not null ,
    cutrn_valuecurr float not null ,
    cutrn_convcurr float not null ,
    cutrn_eurovalue float not null ,
    cutrn_euroconv float not null 
  );
revoke all on "maxmast".cutrn from "public";

create unique index "maxmast".cutrn_key on "maxmast".cutrn (cutrn_year,
    cutrn_period,cutrn_culink);
{ TABLE "maxmast".cymas row size = 52 number of columns = 8 index size = 13 }
{ unload file name = cymas00163.unl number of rows = 9 }

create table "maxmast".cymas 
  (
    cymas_country char(5) not null ,
    cymas_name char(20) not null ,
    cymas_currency char(4) not null ,
    cymas_lang char(4) not null ,
    cymas_eec char(1) not null ,
    cymas_lud date not null ,
    cymas_lui char(10) not null ,
    cymas_origcurr char(4) not null 
  );
revoke all on "maxmast".cymas from "public";

create unique index "maxmast".cymas_country on "maxmast".cymas 
    (cymas_country);
{ TABLE "maxmast".dfqt row size = 61 number of columns = 10 index size = 70 }
{ unload file name = dfqt_00164.unl number of rows = 125859 }

create table "maxmast".dfqt 
  (
    dfqt_rqtserial serial not null ,
    dfqt_item char(15) not null ,
    dfqt_duedate date not null ,
    dfqt_dueqty float not null ,
    dfqt_ordserial integer not null ,
    dfqt_lineno integer not null ,
    dfqt_qfactor float not null ,
    dfqt_eqfactor float not null ,
    dfqt_opno char(5) not null ,
    dfqt_indmps char(1) not null 
  );
revoke all on "maxmast".dfqt from "public";

create unique index "maxmast".dfqt_datekey on "maxmast".dfqt (dfqt_item,
    dfqt_duedate,dfqt_rqtserial);
create index "maxmast".dfqt_ordkey on "maxmast".dfqt (dfqt_ordserial,
    dfqt_lineno);
create index "maxmast".dfqt_rqtserial on "maxmast".dfqt (dfqt_rqtserial);
    
{ TABLE "maxmast".dicla row size = 115 number of columns = 14 index size = 37 }
{ unload file name = dicla00165.unl number of rows = 0 }

create table "maxmast".dicla 
  (
    dicla_fcgrp char(16) not null ,
    dicla_store char(5) not null ,
    dicla_aclass float not null ,
    dicla_bclass float not null ,
    dicla_cclass float not null ,
    dicla_dclass float not null ,
    dicla_eclass float not null ,
    dicla_df1 float not null ,
    dicla_df2 float not null ,
    dicla_df3 float not null ,
    dicla_df4 float not null ,
    dicla_df5 float not null ,
    dicla_lui char(10) not null ,
    dicla_lud date not null 
  );
revoke all on "maxmast".dicla from "public";

create unique index "maxmast".dicla_key on "maxmast".dicla (dicla_fcgrp,
    dicla_store);
{ TABLE "maxmast".difac row size = 371 number of columns = 46 index size = 37 }
{ unload file name = difac00166.unl number of rows = 0 }

create table "maxmast".difac 
  (
    difac_fcgrp char(16) not null ,
    difac_store char(5) not null ,
    difac_slev1 float not null ,
    difac_slev2 float not null ,
    difac_slev3 float not null ,
    difac_slev4 float not null ,
    difac_slev5 float not null ,
    difac_slev6 float not null ,
    difac_slev7 float not null ,
    difac_slev8 float not null ,
    difac_slev9 float not null ,
    difac_slev10 float not null ,
    difac_slev11 float not null ,
    difac_slev12 float not null ,
    difac_slev13 float not null ,
    difac_slev14 float not null ,
    difac_pbfc1 float not null ,
    difac_pbfc2 float not null ,
    difac_pbfc3 float not null ,
    difac_pbfc4 float not null ,
    difac_pbfc5 float not null ,
    difac_pbfc6 float not null ,
    difac_pbfc7 float not null ,
    difac_pbfc8 float not null ,
    difac_pbfc9 float not null ,
    difac_pbfc10 float not null ,
    difac_pbfc11 float not null ,
    difac_pbfc12 float not null ,
    difac_pbfc13 float not null ,
    difac_pbfc14 float not null ,
    difac_bcon1 float not null ,
    difac_bcon2 float not null ,
    difac_bcon3 float not null ,
    difac_bcon4 float not null ,
    difac_bcon5 float not null ,
    difac_bcon6 float not null ,
    difac_bcon7 float not null ,
    difac_bcon8 float not null ,
    difac_bcon9 float not null ,
    difac_bcon10 float not null ,
    difac_bcon11 float not null ,
    difac_bcon12 float not null ,
    difac_bcon13 float not null ,
    difac_bcon14 float not null ,
    difac_lui char(10) not null ,
    difac_lud date not null 
  );
revoke all on "maxmast".difac from "public";

create unique index "maxmast".difac_key on "maxmast".difac (difac_fcgrp,
    difac_store);
{ TABLE "maxmast".difpr row size = 45 number of columns = 8 index size = 25 }
{ unload file name = difpr00167.unl number of rows = 0 }

create table "maxmast".difpr 
  (
    difpr_store char(5) not null ,
    difpr_calnum integer not null ,
    difpr_pernum integer not null ,
    difpr_pername char(10) not null ,
    difpr_stdate date not null ,
    difpr_wrkday integer not null ,
    difpr_lui char(10) not null ,
    difpr_lud date not null 
  );
revoke all on "maxmast".difpr from "public";

create unique index "maxmast".difpr_key on "maxmast".difpr (difpr_store,
    difpr_calnum,difpr_pernum);
{ TABLE "maxmast".difrc row size = 184 number of columns = 25 index size = 37 }
{ unload file name = difrc00168.unl number of rows = 0 }

create table "maxmast".difrc 
  (
    difrc_fcgrp char(16) not null ,
    difrc_store char(5) not null ,
    difrc_fcalpha float not null ,
    difrc_exdmnd integer not null ,
    difrc_dvalpha float not null ,
    difrc_instddev float not null ,
    difrc_tvhzn float not null ,
    difrc_ifcfact float not null ,
    difrc_sslimit float not null ,
    difrc_leadtime float not null ,
    difrc_lowstk float not null ,
    difrc_esoldays integer not null ,
    difrc_slopper integer not null ,
    difrc_lui char(10) not null ,
    difrc_lud date not null ,
    difrc_globetv float not null ,
    difrc_etvinuse char(1) not null ,
    difrc_loweretv float not null ,
    difrc_upperetv float not null ,
    difrc_scentalph float not null ,
    difrc_sindxalph float not null ,
    difrc_sindxllim float not null ,
    difrc_sindxulim float not null ,
    difrc_sflgfact float not null ,
    difrc_slop float not null 
  );
revoke all on "maxmast".difrc from "public";

create unique index "maxmast".difrc_key on "maxmast".difrc (difrc_fcgrp,
    difrc_store);
{ TABLE "maxmast".dilev row size = 427 number of columns = 53 index size = 37 }
{ unload file name = dilev00169.unl number of rows = 0 }

create table "maxmast".dilev 
  (
    dilev_fcgrp char(16) not null ,
    dilev_store char(5) not null ,
    dilev_a7 float not null ,
    dilev_a6 float not null ,
    dilev_a5 float not null ,
    dilev_a4 float not null ,
    dilev_a3 float not null ,
    dilev_a2 float not null ,
    dilev_a1 float not null ,
    dilev_b7 float not null ,
    dilev_b6 float not null ,
    dilev_b5 float not null ,
    dilev_b4 float not null ,
    dilev_b3 float not null ,
    dilev_b2 float not null ,
    dilev_b1 float not null ,
    dilev_c7 float not null ,
    dilev_c6 float not null ,
    dilev_c5 float not null ,
    dilev_c4 float not null ,
    dilev_c3 float not null ,
    dilev_c2 float not null ,
    dilev_c1 float not null ,
    dilev_d7 float not null ,
    dilev_d6 float not null ,
    dilev_d5 float not null ,
    dilev_d4 float not null ,
    dilev_d3 float not null ,
    dilev_d2 float not null ,
    dilev_d1 float not null ,
    dilev_e7 float not null ,
    dilev_e6 float not null ,
    dilev_e5 float not null ,
    dilev_e4 float not null ,
    dilev_e3 float not null ,
    dilev_e2 float not null ,
    dilev_e1 float not null ,
    dilev_f7 float not null ,
    dilev_f6 float not null ,
    dilev_f5 float not null ,
    dilev_f4 float not null ,
    dilev_f3 float not null ,
    dilev_f2 float not null ,
    dilev_f1 float not null ,
    dilev_g7 float not null ,
    dilev_g6 float not null ,
    dilev_g5 float not null ,
    dilev_g4 float not null ,
    dilev_g3 float not null ,
    dilev_g2 float not null ,
    dilev_g1 float not null ,
    dilev_lui char(10) not null ,
    dilev_lud date not null 
  );
revoke all on "maxmast".dilev from "public";

create unique index "maxmast".dilev_key on "maxmast".dilev (dilev_fcgrp,
    dilev_store);
{ TABLE "maxmast".diord row size = 427 number of columns = 53 index size = 37 }
{ unload file name = diord00170.unl number of rows = 0 }

create table "maxmast".diord 
  (
    diord_fcgrp char(16) not null ,
    diord_store char(5) not null ,
    diord_a7 float not null ,
    diord_a6 float not null ,
    diord_a5 float not null ,
    diord_a4 float not null ,
    diord_a3 float not null ,
    diord_a2 float not null ,
    diord_a1 float not null ,
    diord_b7 float not null ,
    diord_b6 float not null ,
    diord_b5 float not null ,
    diord_b4 float not null ,
    diord_b3 float not null ,
    diord_b2 float not null ,
    diord_b1 float not null ,
    diord_c7 float not null ,
    diord_c6 float not null ,
    diord_c5 float not null ,
    diord_c4 float not null ,
    diord_c3 float not null ,
    diord_c2 float not null ,
    diord_c1 float not null ,
    diord_d7 float not null ,
    diord_d6 float not null ,
    diord_d5 float not null ,
    diord_d4 float not null ,
    diord_d3 float not null ,
    diord_d2 float not null ,
    diord_d1 float not null ,
    diord_e7 float not null ,
    diord_e6 float not null ,
    diord_e5 float not null ,
    diord_e4 float not null ,
    diord_e3 float not null ,
    diord_e2 float not null ,
    diord_e1 float not null ,
    diord_f7 float not null ,
    diord_f6 float not null ,
    diord_f5 float not null ,
    diord_f4 float not null ,
    diord_f3 float not null ,
    diord_f2 float not null ,
    diord_f1 float not null ,
    diord_g7 float not null ,
    diord_g6 float not null ,
    diord_g5 float not null ,
    diord_g4 float not null ,
    diord_g3 float not null ,
    diord_g2 float not null ,
    diord_g1 float not null ,
    diord_lui char(10) not null ,
    diord_lud date not null 
  );
revoke all on "maxmast".diord from "public";

create unique index "maxmast".diord_key on "maxmast".diord (diord_fcgrp,
    diord_store);
{ TABLE "maxmast".direp row size = 73 number of columns = 12 index size = 117 }
{ unload file name = direp00171.unl number of rows = 0 }

create table "maxmast".direp 
  (
    direp_program char(4) not null ,
    direp_store char(5) not null ,
    direp_calnum integer not null ,
    direp_pernum integer not null ,
    direp_fcgrp char(16) not null ,
    direp_volval char(1) not null ,
    direp_dmdcls char(1) not null ,
    direp_value float not null ,
    direp_lud date not null ,
    direp_lui char(10) not null ,
    direp_work1 float not null ,
    direp_work2 float not null 
  );
revoke all on "maxmast".direp from "public";

create unique index "maxmast".direp_key on "maxmast".direp (direp_program,
    direp_store,direp_calnum,direp_pernum,direp_fcgrp,direp_volval,
    direp_dmdcls);
create unique index "maxmast".direp_perkey on "maxmast".direp 
    (direp_program,direp_store,direp_pernum,direp_calnum,direp_fcgrp,
    direp_volval,direp_dmdcls);
{ TABLE "maxmast".disch row size = 59 number of columns = 9 index size = 48 }
{ unload file name = disch00172.unl number of rows = 0 }

create table "maxmast".disch 
  (
    disch_item char(15) not null ,
    disch_store char(5) not null ,
    disch_calnum integer not null ,
    disch_pernum integer not null ,
    disch_fsched float not null ,
    disch_ovrsched float not null ,
    disch_useover char(1) not null ,
    disch_lui char(10) not null ,
    disch_lud date not null 
  );
revoke all on "maxmast".disch from "public";

create unique index "maxmast".disch_key on "maxmast".disch (disch_store,
    disch_item,disch_calnum,disch_pernum);
{ TABLE "maxmast".disea row size = 66 number of columns = 9 index size = 42 }
{ unload file name = disea00173.unl number of rows = 0 }

create table "maxmast".disea 
  (
    disea_item char(15) not null ,
    disea_store char(5) not null ,
    disea_pernum integer not null ,
    disea_sindx float not null ,
    disea_sfcst float not null ,
    disea_ofcst float not null ,
    disea_lui char(10) not null ,
    disea_lud date not null ,
    disea_calnum integer not null 
  );
revoke all on "maxmast".disea from "public";

create unique index "maxmast".disea_ident on "maxmast".disea (disea_store,
    disea_item,disea_pernum);
{ TABLE "maxmast".disto row size = 540 number of columns = 79 index size = 36 }
{ unload file name = disto00174.unl number of rows = 0 }

create table "maxmast".disto 
  (
    disto_item char(15) not null ,
    disto_store char(5) not null ,
    disto_fcgrp char(16) not null ,
    disto_reordmeth char(1) not null ,
    disto_leadtime float not null ,
    disto_volval char(1) not null ,
    disto_dmdcls char(1) not null ,
    disto_dmdfrq float not null ,
    disto_obsol char(1) not null ,
    disto_seasnlty char(1) not null ,
    disto_oseasn char(1) not null ,
    disto_created date not null ,
    disto_lastrec date not null ,
    disto_lastiss date not null ,
    disto_esoldate date not null ,
    disto_excptdate date not null ,
    disto_oexcpdate date not null ,
    disto_excptflag char(1) not null ,
    disto_slope float not null ,
    disto_schedctr1 char(1) not null ,
    disto_lui char(10) not null ,
    disto_lud date not null ,
    disto_fcst float not null ,
    disto_ofcst float not null ,
    disto_stddev float not null ,
    disto_ostddev float not null ,
    disto_meandev float not null ,
    disto_omeandev float not null ,
    disto_trdval float not null ,
    disto_otrdval float not null ,
    disto_sdfc float not null ,
    disto_osdfc float not null ,
    disto_plstkrat float not null ,
    disto_avemd float not null ,
    disto_oavemd float not null ,
    disto_issueptd float not null ,
    disto_roll1 float not null ,
    disto_roll2 float not null ,
    disto_roll3 float not null ,
    disto_roll4 float not null ,
    disto_roll5 float not null ,
    disto_roll6 float not null ,
    disto_roll7 float not null ,
    disto_roll8 float not null ,
    disto_roll9 float not null ,
    disto_roll10 float not null ,
    disto_roll11 float not null ,
    disto_roll12 float not null ,
    disto_roll13 float not null ,
    disto_freestk float not null ,
    disto_totfreest float not null ,
    disto_strategic float not null ,
    disto_totstrat float not null ,
    disto_onord float not null ,
    disto_totonord float not null ,
    disto_bkord float not null ,
    disto_totbkord float not null ,
    disto_safetystk float not null ,
    disto_avedmd float not null ,
    disto_oavedmd float not null ,
    disto_curcaldr integer not null ,
    disto_curperiod integer not null ,
    disto_alpha float not null ,
    disto_deviation float not null ,
    disto_odeviatio float not null ,
    disto_etv float not null ,
    disto_etvinuse char(1) not null ,
    disto_sched char(1) not null ,
    disto_ctrlval float not null ,
    disto_octrlval float not null ,
    disto_smeandev float not null ,
    disto_osmeandev float not null ,
    disto_stv float not null ,
    disto_ostv float not null ,
    disto_sstddev float not null ,
    disto_osstddev float not null ,
    disto_sdcvratio float not null ,
    disto_osdcv float not null ,
    disto_seasalpha float not null 
  );
revoke all on "maxmast".disto from "public";

create unique index "maxmast".disto_key on "maxmast".disto (disto_store,
    disto_item);
{ TABLE "maxmast".dorou row size = 50 number of columns = 9 index size = 117 }
{ unload file name = dorou00176.unl number of rows = 0 }

create table "maxmast".dorou 
  (
    dorou_doctype char(1) not null ,
    dorou_document char(10) not null ,
    dorou_ndcode char(10) not null ,
    dorou_seq char(2) not null ,
    dorou_menu char(8) not null ,
    dorou_sequence integer not null ,
    dorou_prime char(1) not null ,
    dorou_lud date not null ,
    dorou_lui char(10) not null 
  );
revoke all on "maxmast".dorou from "public";

create unique index "maxmast".dorou_dockey on "maxmast".dorou 
    (dorou_document,dorou_doctype,dorou_ndcode,dorou_seq,dorou_menu,
    dorou_sequence);
create unique index "maxmast".dorou_menukey on "maxmast".dorou 
    (dorou_menu,dorou_sequence,dorou_document,dorou_doctype,dorou_ndcode,
    dorou_seq);
{ TABLE "maxmast".dtdef row size = 27 number of columns = 7 index size = 33 }
{ unload file name = dtdef00177.unl number of rows = 0 }

create table "maxmast".dtdef 
  (
    dtdef_screen char(9) not null ,
    dtdef_format char(5) not null ,
    dtdef_sequence integer not null ,
    dtdef_insqldef char(1) not null ,
    dtdef_inmx10 char(1) not null ,
    dtdef_resync char(1) not null ,
    dtdef_prefix char(6) not null 
  );
revoke all on "maxmast".dtdef from "public";

create unique index "maxmast".dtdef_key on "maxmast".dtdef (dtdef_screen,
    dtdef_format,dtdef_sequence);
{ TABLE "maxmast".ecbst row size = 54 number of columns = 7 index size = 27 }
{ unload file name = ecbst00178.unl number of rows = 0 }

create table "maxmast".ecbst 
  (
    ecbst_custcode char(10) not null ,
    ecbst_linnum integer not null ,
    ecbst_item char(15) not null ,
    ecbst_quantity float not null ,
    ecbst_price float not null ,
    ecbst_priceuom char(5) not null ,
    ecbst_lud date not null 
  );
revoke all on "maxmast".ecbst from "public";

create unique index "maxmast".ecbst_key on "maxmast".ecbst (ecbst_custcode,
    ecbst_linnum);
{ TABLE "maxmast".ecdes row size = 26 number of columns = 3 index size = 15 }
{ unload file name = ecdes00179.unl number of rows = 0 }

create table "maxmast".ecdes 
  (
    ecdes_level char(1) not null ,
    ecdes_group char(5) not null ,
    ecdes_descext char(20) not null 
  );
revoke all on "maxmast".ecdes from "public";

create unique index "maxmast".ecdes_key on "maxmast".ecdes (ecdes_level,
    ecdes_group);
{ TABLE "maxmast".ecgrp row size = 45 number of columns = 6 index size = 297 }
{ unload file name = ecgrp00180.unl number of rows = 0 }

create table "maxmast".ecgrp 
  (
    ecgrp_pricelist char(10) not null ,
    ecgrp_level1 char(5) not null ,
    ecgrp_level2 char(5) not null ,
    ecgrp_level3 char(5) not null ,
    ecgrp_level4 char(5) not null ,
    ecgrp_item char(15) not null 
  );
revoke all on "maxmast".ecgrp from "public";

create index "maxmast".ecgrp_itemkey on "maxmast".ecgrp (ecgrp_pricelist,
    ecgrp_item);
create unique index "maxmast".ecgrp_key on "maxmast".ecgrp (ecgrp_pricelist,
    ecgrp_level1,ecgrp_level2,ecgrp_level3,ecgrp_level4,ecgrp_item);
    
create index "maxmast".ecgrp_lvl1key on "maxmast".ecgrp (ecgrp_pricelist,
    ecgrp_level1);
create index "maxmast".ecgrp_lvl2key on "maxmast".ecgrp (ecgrp_pricelist,
    ecgrp_level1,ecgrp_level2);
create index "maxmast".ecgrp_lvl3key on "maxmast".ecgrp (ecgrp_pricelist,
    ecgrp_level1,ecgrp_level2,ecgrp_level3);
create index "maxmast".ecgrp_lvl4key on "maxmast".ecgrp (ecgrp_pricelist,
    ecgrp_level1,ecgrp_level2,ecgrp_level3,ecgrp_level4);
create index "maxmast".ecgrp_pricelist on "maxmast".ecgrp (ecgrp_pricelist);
    
{ TABLE "maxmast".edida row size = 56 number of columns = 12 index size = 60 }
{ unload file name = edida00181.unl number of rows = 0 }

create table "maxmast".edida 
  (
    edida_ordnum char(8) not null ,
    edida_linnum integer not null ,
    edida_delnoteno char(8) not null ,
    edida_trigdate date not null ,
    edida_trigtime integer not null ,
    edida_procdate date not null ,
    edida_proctime integer not null ,
    edida_serial serial not null ,
    edida_faxdespad char(1) not null ,
    edida_edidespad char(1) not null ,
    edida_lud date not null ,
    edida_lui char(10) not null 
  );
revoke all on "maxmast".edida from "public";

create index "maxmast".edida_delnoteno on "maxmast".edida (edida_delnoteno);
    
create unique index "maxmast".edida_mainkey on "maxmast".edida 
    (edida_delnoteno,edida_ordnum,edida_linnum,edida_serial);
    
{ TABLE "maxmast".edipo row size = 55 number of columns = 13 index size = 39 }
{ unload file name = edipo00182.unl number of rows = 0 }

create table "maxmast".edipo 
  (
    edipo_ordline integer not null ,
    edipo_release integer not null ,
    edipo_trigtype char(1) not null ,
    edipo_trigdate date not null ,
    edipo_trigtime integer not null ,
    edipo_procdate date not null ,
    edipo_proctime integer not null ,
    edipo_faxpo char(1) not null ,
    edipo_edipo char(1) not null ,
    edipo_orderno char(10) not null ,
    edipo_lud date not null ,
    edipo_lui char(10) not null ,
    edipo_serial serial not null 
  );
revoke all on "maxmast".edipo from "public";

create unique index "maxmast".edipo_key on "maxmast".edipo (edipo_orderno,
    edipo_ordline,edipo_release,edipo_serial);
{ TABLE "maxmast".emod row size = 123 number of columns = 15 index size = 55 }
{ unload file name = emod_00183.unl number of rows = 0 }

create table "maxmast".emod 
  (
    emod_modser char(10) not null ,
    emod_paritem char(15) not null ,
    emod_effective date not null ,
    emod_drawno char(20) not null ,
    emod_modstatus char(2) not null ,
    emod_statchd date not null ,
    emod_issuno char(3) not null ,
    emod_issudat date not null ,
    emod_designer char(3) not null ,
    emod_reasoncod char(2) not null ,
    emod_severity char(2) not null ,
    emod_lud date not null ,
    emod_lui char(10) not null ,
    emod_shortdesc char(30) not null ,
    emod_textref char(10) not null 
  );
revoke all on "maxmast".emod from "public";

create unique index "maxmast".emod_itemdate on "maxmast".emod 
    (emod_paritem,emod_effective);
create unique index "maxmast".emod_modser on "maxmast".emod (emod_modser);
    
{ TABLE "maxmast".errlog row size = 209 number of columns = 8 index size = 24 }
{ unload file name = errlo00184.unl number of rows = 0 }

create table "maxmast".errlog 
  (
    el_serial serial not null ,
    el_mess char(9) not null ,
    el_company char(4) not null ,
    el_user char(10) not null ,
    el_term char(10) not null ,
    el_time integer not null ,
    el_text char(160) not null ,
    el_program char(8) not null 
  );
revoke all on "maxmast".errlog from "public";

create unique index "maxmast".el_serial on "maxmast".errlog (el_serial);
    
create index "maxmast".el_time on "maxmast".errlog (el_time);
{ TABLE "maxmast".ffield row size = 33 number of columns = 6 index size = 66 }
{ unload file name = ffiel00185.unl number of rows = 0 }

create table "maxmast".ffield 
  (
    ff_fileid char(5) not null ,
    ff_sequence integer not null ,
    ff_fieldname char(9) not null ,
    ff_keystat char(1) not null ,
    ff_object char(9) not null ,
    ff_owner char(5) not null 
  );
revoke all on "maxmast".ffield from "public";

create index "maxmast".ff_fieldname on "maxmast".ffield (ff_fieldname);
    
create unique index "maxmast".ff_key on "maxmast".ffield (ff_fileid,
    ff_sequence);
create index "maxmast".ff_uniqey on "maxmast".ffield (ff_fileid,
    ff_fieldname);
{ TABLE "maxmast".glavc row size = 41 number of columns = 4 index size = 79 }
{ unload file name = glavc00188.unl number of rows = 0 }

create table "maxmast".glavc 
  (
    glavc_id char(5) not null ,
    glavc_desc char(20) not null ,
    glavc_mask char(15) not null ,
    glavc_validate char(1) not null 
  );
revoke all on "maxmast".glavc from "public";

create unique index "maxmast".glavc_id on "maxmast".glavc (glavc_id);
    
create unique index "maxmast".glavc_mask on "maxmast".glavc (glavc_mask);
    
create index "maxmast".glavc_maskval on "maxmast".glavc (glavc_mask,
    glavc_validate);
create index "maxmast".glavc_validate on "maxmast".glavc (glavc_validate);
    
{ TABLE "maxmast".glavn row size = 120 number of columns = 17 index size = 49 }
{ unload file name = glavn00189.unl number of rows = 0 }

create table "maxmast".glavn 
  (
    glavn_id char(5) not null ,
    glavn_code char(15) not null ,
    glavn_actype char(1) not null ,
    glavn_desc char(30) not null ,
    glavn_password char(5) not null ,
    glavn_sumflg char(1) not null ,
    glavn_control char(1) not null ,
    glavn_postflag char(1) not null ,
    glavn_history char(1) not null ,
    glavn_retain char(15) not null ,
    glavn_consolid char(15) not null ,
    glavn_class1 char(5) not null ,
    glavn_class2 char(5) not null ,
    glavn_class3 char(5) not null ,
    glavn_class4 char(5) not null ,
    glavn_class5 char(5) not null ,
    glavn_summclass char(5) not null 
  );
revoke all on "maxmast".glavn from "public";

create index "maxmast".glavn_id on "maxmast".glavn (glavn_id);
    
create unique index "maxmast".glavn_idcode on "maxmast".glavn 
    (glavn_id,glavn_code);
{ TABLE "maxmast".glbdg row size = 60 number of columns = 7 index size = 126 }
{ unload file name = glbdg00191.unl number of rows = 0 }

create table "maxmast".glbdg 
  (
    glbdg_year integer not null ,
    glbdg_account char(15) not null ,
    glbdg_budcode char(15) not null ,
    glbdg_period integer not null ,
    glbdg_budget float not null ,
    glbdg_lud date not null ,
    glbdg_lui char(10) not null 
  );
revoke all on "maxmast".glbdg from "public";

create unique index "maxmast".glbdg_key on "maxmast".glbdg (glbdg_budcode,
    glbdg_account,glbdg_year,glbdg_period);
create unique index "maxmast".glbdg_key1 on "maxmast".glbdg (glbdg_year,
    glbdg_budcode,glbdg_account,glbdg_period);
{ TABLE "maxmast".glbran row size = 14 number of columns = 2 index size = 27 }
{ unload file name = glbra00192.unl number of rows = 0 }

create table "maxmast".glbran 
  (
    glbr_userid char(10) not null ,
    glbr_branchcde char(4) not null 
  );
revoke all on "maxmast".glbran from "public";

create unique index "maxmast".glbr_key on "maxmast".glbran (glbr_userid,
    glbr_branchcde);
{ TABLE "maxmast".glbudg row size = 59 number of columns = 8 index size = 19 }
{ unload file name = glbud00193.unl number of rows = 0 }

create table "maxmast".glbudg 
  (
    glb_period integer not null ,
    glb_desc char(20) not null ,
    glb_spread char(5) not null ,
    glb_budspread float not null ,
    glb_lud date not null ,
    glb_lui char(10) not null ,
    glb_budcode integer not null ,
    glb_percent smallfloat not null 
  );
revoke all on "maxmast".glbudg from "public";

create unique index "maxmast".glb_key on "maxmast".glbudg (glb_spread,
    glb_period);
{ TABLE "maxmast".glbun row size = 59 number of columns = 4 index size = 28 }
{ unload file name = glbun00194.unl number of rows = 1 }

create table "maxmast".glbun 
  (
    glbun_budcode char(15) not null ,
    glbun_budname char(30) not null ,
    glbun_lud date not null ,
    glbun_lui char(10) not null 
  );
revoke all on "maxmast".glbun from "public";

create unique index "maxmast".glbun_budcode on "maxmast".glbun 
    (glbun_budcode);
{ TABLE "maxmast".glpers row size = 36 number of columns = 5 index size = 30 }
{ unload file name = glper00198.unl number of rows = 348 }

create table "maxmast".glpers 
  (
    glper_year integer not null ,
    glper_period integer not null ,
    glper_desc char(20) not null ,
    glper_perend date not null ,
    glper_weeks integer not null 
  );
revoke all on "maxmast".glpers from "public";

create unique index "maxmast".glper_key on "maxmast".glpers (glper_year,
    glper_period);
create index "maxmast".glper_perend on "maxmast".glpers (glper_perend);
    
{ TABLE "maxmast".glrac row size = 25 number of columns = 5 index size = 36 }
{ unload file name = glrac00199.unl number of rows = 2 }

create table "maxmast".glrac 
  (
    glrac_repid char(8) not null ,
    glrac_lineno float not null ,
    glrac_colnum integer not null ,
    glrac_sequence integer not null ,
    glrac_status char(1) not null 
  );
revoke all on "maxmast".glrac from "public";

create unique index "maxmast".glrac_key on "maxmast".glrac (glrac_repid,
    glrac_lineno,glrac_colnum);
{ TABLE "maxmast".glrad row size = 96 number of columns = 7 index size = 30 }
{ unload file name = glrad00200.unl number of rows = 2 }

create table "maxmast".glrad 
  (
    glrad_repid char(8) not null ,
    glrad_lineno float not null ,
    glrad_fromacc char(15) not null ,
    glrad_toacc char(15) not null ,
    glrad_printall char(1) not null ,
    glrad_reverse char(1) not null ,
    glrad_desc char(48) not null 
  );
revoke all on "maxmast".glrad from "public";

create unique index "maxmast".glrad_key on "maxmast".glrad (glrad_repid,
    glrad_lineno);
{ TABLE "maxmast".glrco row size = 92 number of columns = 21 index size = 72 }
{ unload file name = glrco00201.unl number of rows = 2 }

create table "maxmast".glrco 
  (
    glrco_repid char(8) not null ,
    glrco_colnum integer not null ,
    glrco_coltype char(1) not null ,
    glrco_printpos integer not null ,
    glrco_fieldsize integer not null ,
    glrco_nodecs integer not null ,
    glrco_valtype char(2) not null ,
    glrco_startper integer not null ,
    glrco_endper integer not null ,
    glrco_startyr integer not null ,
    glrco_endyr integer not null ,
    glrco_startcol integer not null ,
    glrco_endcol integer not null ,
    glrco_constant float not null ,
    glrco_rstarper integer not null ,
    glrco_rendper integer not null ,
    glrco_rstaryr integer not null ,
    glrco_rendyr integer not null ,
    glrco_nozero char(1) not null ,
    glrco_pnavalue char(1) not null ,
    glrco_budcode char(15) not null 
  );
revoke all on "maxmast".glrco from "public";

create index "maxmast".glrco_endkey on "maxmast".glrco (glrco_repid,
    glrco_endcol);
create unique index "maxmast".glrco_key on "maxmast".glrco (glrco_repid,
    glrco_colnum);
create index "maxmast".glrco_stakey on "maxmast".glrco (glrco_repid,
    glrco_startcol);
{ TABLE "maxmast".glrde row size = 59 number of columns = 8 index size = 18 }
{ unload file name = glrde00202.unl number of rows = 2 }

create table "maxmast".glrde 
  (
    glrde_repid char(8) not null ,
    glrde_repname char(32) not null ,
    glrde_printst char(5) not null ,
    glrde_printaccs char(1) not null ,
    glrde_printdesc char(1) not null ,
    glrde_printpos integer not null ,
    glrde_nocols integer not null ,
    glrde_desclen integer not null 
  );
revoke all on "maxmast".glrde from "public";

create unique index "maxmast".glrde_repid on "maxmast".glrde (glrde_repid);
    
{ TABLE "maxmast".glrhc row size = 180 number of columns = 6 index size = 30 }
{ unload file name = glrhc00203.unl number of rows = 0 }

create table "maxmast".glrhc 
  (
    glrhc_repid char(8) not null ,
    glrhc_lineno float not null ,
    glrhc_headno integer not null ,
    glrhc_narr1 char(70) not null ,
    glrhc_narr2 char(70) not null ,
    glrhc_narr3 char(20) not null 
  );
revoke all on "maxmast".glrhc from "public";

create unique index "maxmast".glrhc_key on "maxmast".glrhc (glrhc_repid,
    glrhc_lineno);
{ TABLE "maxmast".glrli row size = 25 number of columns = 8 index size = 30 }
{ unload file name = glrli00204.unl number of rows = 6 }

create table "maxmast".glrli 
  (
    glrli_repid char(8) not null ,
    glrli_lineno float not null ,
    glrli_linetype char(1) not null ,
    glrli_linefeed integer not null ,
    glrli_noprint char(1) not null ,
    glrli_swil char(1) not null ,
    glrli_swic char(1) not null ,
    glrli_swir char(1) not null 
  );
revoke all on "maxmast".glrli from "public";

create unique index "maxmast".glrli_key on "maxmast".glrli (glrli_repid,
    glrli_lineno);
{ TABLE "maxmast".glrto row size = 67 number of columns = 6 index size = 30 }
{ unload file name = glrto00205.unl number of rows = 2 }

create table "maxmast".glrto 
  (
    glrto_repid char(8) not null ,
    glrto_lineno float not null ,
    glrto_totaltype char(1) not null ,
    glrto_highlight char(1) not null ,
    glrto_desc char(48) not null ,
    glrto_zeroise char(1) not null 
  );
revoke all on "maxmast".glrto from "public";

create unique index "maxmast".glrto_key on "maxmast".glrto (glrto_repid,
    glrto_lineno);
{ TABLE "maxmast".glstat row size = 347 number of columns = 44 index size = 40 }
{ unload file name = glsta00207.unl number of rows = 1632 }

create table "maxmast".glstat 
  (
    gls_account char(15) not null ,
    gls_year integer not null ,
    gls_seq integer not null ,
    gls_openbal float not null ,
    gls_p1cred float not null ,
    gls_p1deb float not null ,
    gls_p1bud float not null ,
    gls_p2cred float not null ,
    gls_p2deb float not null ,
    gls_p2bud float not null ,
    gls_p3cred float not null ,
    gls_p3deb float not null ,
    gls_p3bud float not null ,
    gls_p4cred float not null ,
    gls_p4deb float not null ,
    gls_p4bud float not null ,
    gls_p5cred float not null ,
    gls_p5deb float not null ,
    gls_p5bud float not null ,
    gls_p6cred float not null ,
    gls_p6deb float not null ,
    gls_p6bud float not null ,
    gls_p7cred float not null ,
    gls_p7deb float not null ,
    gls_p7bud float not null ,
    gls_p8cred float not null ,
    gls_p8deb float not null ,
    gls_p8bud float not null ,
    gls_p9cred float not null ,
    gls_p9deb float not null ,
    gls_p9bud float not null ,
    gls_p10cred float not null ,
    gls_p10deb float not null ,
    gls_p10bud float not null ,
    gls_p11cred float not null ,
    gls_p11deb float not null ,
    gls_p11bud float not null ,
    gls_p12cred float not null ,
    gls_p12deb float not null ,
    gls_p12bud float not null ,
    gls_p13cred float not null ,
    gls_p13deb float not null ,
    gls_p13bud float not null ,
    gls_basecurr char(4) not null 
  );
revoke all on "maxmast".glstat from "public";

create unique index "maxmast".gls_key on "maxmast".glstat (gls_account,
    gls_year,gls_seq);
{ TABLE "maxmast".graph row size = 60 number of columns = 8 index size = 33 }
{ unload file name = graph00209.unl number of rows = 0 }

create table "maxmast".graph 
  (
    graph_graphname char(10) not null ,
    graph_bucket integer not null ,
    graph_val1 float not null ,
    graph_val2 float not null ,
    graph_val3 float not null ,
    graph_val4 float not null ,
    graph_serial serial not null ,
    graph_label char(10) not null 
  );
revoke all on "maxmast".graph from "public";

create index "maxmast".graph_graphname on "maxmast".graph (graph_graphname);
    
create unique index "maxmast".graph_serial on "maxmast".graph 
    (graph_serial);
{ TABLE "maxmast".imacc row size = 103 number of columns = 13 index size = 43 }
{ unload file name = imacc00210.unl number of rows = 13576 }

create table "maxmast".imacc 
  (
    imacc_item char(15) not null ,
    imacc_store char(5) not null ,
    imacc_account char(5) not null ,
    imacc_balance float not null ,
    imacc_lud date not null ,
    imacc_lui char(10) not null ,
    imacc_issueper float not null ,
    imacc_recper float not null ,
    imacc_issueytd float not null ,
    imacc_recytd float not null ,
    imacc_ppopen float not null ,
    imacc_pyopen float not null ,
    imacc_osallqty float not null 
  );
revoke all on "maxmast".imacc from "public";

create unique index "maxmast".imacc_key on "maxmast".imacc (imacc_item,
    imacc_store,imacc_account);
{ TABLE "maxmast".imcat row size = 54 number of columns = 5 index size = 13 }
{ unload file name = imcat00212.unl number of rows = 1 }

create table "maxmast".imcat 
  (
    imcat_category char(5) not null ,
    imcat_catname char(30) not null ,
    imcat_type char(5) not null ,
    imcat_lud date not null ,
    imcat_lui char(10) not null 
  );
revoke all on "maxmast".imcat from "public";

create unique index "maxmast".imcat_category on "maxmast".imcat 
    (imcat_category);
{ TABLE "maxmast".imcen row size = 53 number of columns = 9 index size = 43 }
{ unload file name = imcen00213.unl number of rows = 0 }

create table "maxmast".imcen 
  (
    imcen_salesoff char(5) not null ,
    imcen_workcen char(5) not null ,
    imcen_item char(15) not null ,
    imcen_load float not null ,
    imcen_allocflag char(1) not null ,
    imcen_offset integer not null ,
    imcen_timeunit char(1) not null ,
    imcen_lud date not null ,
    imcen_lui char(10) not null 
  );
revoke all on "maxmast".imcen from "public";

create unique index "maxmast".imcen_key on "maxmast".imcen (imcen_salesoff,
    imcen_workcen,imcen_item);
{ TABLE "maxmast".imcsr row size = 81 number of columns = 4 index size = 43 }
{ unload file name = imcsr00215.unl number of rows = 1 }

create table "maxmast".imcsr 
  (
    imcsr_item char(15) not null ,
    imcsr_costype char(5) not null ,
    imcsr_element char(5) not null ,
    imcsr_remark char(56) not null 
  );
revoke all on "maxmast".imcsr from "public";

create unique index "maxmast".imcsr_key on "maxmast".imcsr (imcsr_item,
    imcsr_costype,imcsr_element);
{ TABLE "maxmast".imcst row size = 67 number of columns = 16 index size = 43 }
{ unload file name = imcst00216.unl number of rows = 2327415 }

create table "maxmast".imcst 
  (
    imcst_item char(15) not null ,
    imcst_costype char(5) not null ,
    imcst_element char(5) not null ,
    imcst_tcost float not null ,
    imcst_manent char(1) not null ,
    imcst_lcost float not null ,
    imcst_roll char(1) not null ,
    imcst_tcalc char(1) not null ,
    imcst_lcalc char(1) not null ,
    imcst_lud date not null ,
    imcst_lui char(10) not null ,
    imcst_lrd date not null ,
    imcst_miss1 char(1) not null ,
    imcst_miss2 char(1) not null ,
    imcst_miss3 char(1) not null ,
    imcst_miss4 char(1) not null 
  );
revoke all on "maxmast".imcst from "public";

create unique index "maxmast".imcst_key on "maxmast".imcst (imcst_item,
    imcst_costype,imcst_element);
{ TABLE "maxmast".imctp row size = 75 number of columns = 14 index size = 36 }
{ unload file name = imctp00217.unl number of rows = 367041 }

create table "maxmast".imctp 
  (
    imctp_item char(15) not null ,
    imctp_costype char(5) not null ,
    imctp_roll char(1) not null ,
    imctp_manfac char(5) not null ,
    imctp_routeid char(5) not null ,
    imctp_batchqty float not null ,
    imctp_scrappc float not null ,
    imctp_lud date not null ,
    imctp_lui char(10) not null ,
    imctp_lrd date not null ,
    imctp_precision integer not null ,
    imctp_missa char(1) not null ,
    imctp_missb char(1) not null ,
    imctp_date date not null 
  );
revoke all on "maxmast".imctp from "public";

create unique index "maxmast".imctp_key on "maxmast".imctp (imctp_item,
    imctp_costype);
{ TABLE "maxmast".imctr row size = 76 number of columns = 3 index size = 36 }
{ unload file name = imctr00218.unl number of rows = 3 }

create table "maxmast".imctr 
  (
    imctr_item char(15) not null ,
    imctr_costype char(5) not null ,
    imctr_remark char(56) not null 
  );
revoke all on "maxmast".imctr from "public";

create unique index "maxmast".imctr_key on "maxmast".imctr (imctr_item,
    imctr_costype);
{ TABLE "maxmast".imdes row size = 60 number of columns = 4 index size = 34 }
{ unload file name = imdes00219.unl number of rows = 2 }

create table "maxmast".imdes 
  (
    imdes_item char(15) not null ,
    imdes_lang char(4) not null ,
    imdes_desckey char(8) not null ,
    imdes_descext char(33) not null 
  );
revoke all on "maxmast".imdes from "public";

create unique index "maxmast".imdes_key on "maxmast".imdes (imdes_item,
    imdes_lang);
{ TABLE "maxmast".imsu row size = 107 number of columns = 15 index size = 79 }
{ unload file name = imsu_00224.unl number of rows = 0 }

create table "maxmast".imsu 
  (
    imsu_item char(15) not null ,
    imsu_serno char(15) not null ,
    imsu_sernoend char(15) not null ,
    imsu_balance float not null ,
    imsu_ldateiss date not null ,
    imsu_ltimeiss integer not null ,
    imsu_ldaterec date not null ,
    imsu_ltimerec integer not null ,
    imsu_livesuse integer not null ,
    imsu_issuse integer not null ,
    imsu_usage float not null ,
    imsu_lud date not null ,
    imsu_lui char(10) not null ,
    imsu_entrydate date not null ,
    imsu_entrytime integer not null 
  );
revoke all on "maxmast".imsu from "public";

create unique index "maxmast".imsu_key on "maxmast".imsu (imsu_item,
    imsu_serno);
create index "maxmast".imsu_serno on "maxmast".imsu (imsu_serno);
    
{ TABLE "maxmast".imsur row size = 86 number of columns = 3 index size = 51 }
{ unload file name = imsur00227.unl number of rows = 0 }

create table "maxmast".imsur 
  (
    imsur_item char(15) not null ,
    imsur_serno char(15) not null ,
    imsur_remarks char(56) not null 
  );
revoke all on "maxmast".imsur from "public";

create unique index "maxmast".imsur_key on "maxmast".imsur (imsur_item,
    imsur_serno);
{ TABLE "maxmast".imtyp row size = 49 number of columns = 4 index size = 13 }
{ unload file name = imtyp00228.unl number of rows = 1 }

create table "maxmast".imtyp 
  (
    imtyp_type char(5) not null ,
    imtyp_typename char(30) not null ,
    imtyp_lud date not null ,
    imtyp_lui char(10) not null 
  );
revoke all on "maxmast".imtyp from "public";

create unique index "maxmast".imtyp_type on "maxmast".imtyp (imtyp_type);
    
{ TABLE "maxmast".imuom row size = 48 number of columns = 5 index size = 43 }
{ unload file name = imuom00229.unl number of rows = 1 }

create table "maxmast".imuom 
  (
    imuom_item char(15) not null ,
    imuom_fromuom char(5) not null ,
    imuom_touom char(5) not null ,
    imuom_convert float not null ,
    imuom_desc char(15) not null 
  );
revoke all on "maxmast".imuom from "public";

create unique index "maxmast".imuom_key on "maxmast".imuom (imuom_item,
    imuom_fromuom,imuom_touom);
{ TABLE "maxmast".irsuh row size = 423 number of columns = 42 index size = 183 }
{ unload file name = irsuh00230.unl number of rows = 0 }

create table "maxmast".irsuh 
  (
    irsuh_item char(15) not null ,
    irsuh_serial char(15) not null ,
    irsuh_orderno char(10) not null ,
    irsuh_modin char(6) not null ,
    irsuh_modout char(6) not null ,
    irsuh_prf char(8) not null ,
    irsuh_ppn char(6) not null ,
    irsuh_sro char(8) not null ,
    irsuh_doa char(1) not null ,
    irsuh_smu char(10) not null ,
    irsuh_indate date not null ,
    irsuh_outdate date not null ,
    irsuh_nff char(1) not null ,
    irsuh_uro char(1) not null ,
    irsuh_account char(10) not null ,
    irsuh_delpoint char(10) not null ,
    irsuh_advnote char(10) not null ,
    irsuh_costed char(1) not null ,
    irsuh_lud date not null ,
    irsuh_lui char(10) not null ,
    irsuh_sequence integer not null ,
    irsuh_fltrm1 char(40) not null ,
    irsuh_fltrm2 char(40) not null ,
    irsuh_reprm1 char(40) not null ,
    irsuh_reprm2 char(40) not null ,
    irsuh_resp1 char(15) not null ,
    irsuh_resp2 char(15) not null ,
    irsuh_resp3 char(15) not null ,
    irsuh_resp4 char(15) not null ,
    irsuh_locn1 char(6) not null ,
    irsuh_locn2 char(6) not null ,
    irsuh_locn3 char(6) not null ,
    irsuh_locn4 char(6) not null ,
    irsuh_test1 char(1) not null ,
    irsuh_test2 char(1) not null ,
    irsuh_test3 char(1) not null ,
    irsuh_test4 char(1) not null ,
    irsuh_fault char(3) not null ,
    irsuh_fconf char(1) not null ,
    irsuh_hostunit char(12) not null ,
    irsuh_srn char(10) not null ,
    irsuh_coo char(5) not null 
  );
revoke all on "maxmast".irsuh from "public";

create index "maxmast".irsuh_advnote on "maxmast".irsuh (irsuh_advnote);
    
create index "maxmast".irsuh_item on "maxmast".irsuh (irsuh_item);
    
create index "maxmast".irsuh_key1 on "maxmast".irsuh (irsuh_prf,
    irsuh_ppn);
create index "maxmast".irsuh_key2 on "maxmast".irsuh (irsuh_sro,
    irsuh_sequence);
create unique index "maxmast".irsuh_orderno on "maxmast".irsuh 
    (irsuh_orderno);
create index "maxmast".irsuh_ppn on "maxmast".irsuh (irsuh_ppn);
    
create index "maxmast".irsuh_prf on "maxmast".irsuh (irsuh_prf);
    
create index "maxmast".irsuh_serial on "maxmast".irsuh (irsuh_serial);
    
{ TABLE "maxmast".items row size = 39 number of columns = 6 index size = 120 }
{ unload file name = items00231.unl number of rows = 0 }

create table "maxmast".items 
  (
    sp_item char(9) not null ,
    sp_cust char(8) not null ,
    sp_type integer not null ,
    sp_sequence integer not null ,
    sp_comp char(9) not null ,
    sp_flags char(5) not null 
  );
revoke all on "maxmast".items from "public";

create index "maxmast".sp_comp on "maxmast".items (sp_comp);
create unique index "maxmast".sp_compkey on "maxmast".items (sp_cust,
    sp_item,sp_type,sp_comp,sp_sequence);
create unique index "maxmast".sp_key on "maxmast".items (sp_cust,
    sp_item,sp_type,sp_sequence);
{ TABLE "maxmast".lgmas row size = 38 number of columns = 4 index size = 12 }
{ unload file name = lgmas00232.unl number of rows = 2 }

create table "maxmast".lgmas 
  (
    lgmas_lang char(4) not null ,
    lgmas_name char(20) not null ,
    lgmas_lud date not null ,
    lgmas_lui char(10) not null 
  );
revoke all on "maxmast".lgmas from "public";

create unique index "maxmast".lgmas_lang on "maxmast".lgmas (lgmas_lang);
    
{ TABLE "maxmast".mabal row size = 51 number of columns = 7 index size = 81 }
{ unload file name = mabal00233.unl number of rows = 32309 }

create table "maxmast".mabal 
  (
    mabal_account char(15) not null ,
    mabal_year integer not null ,
    mabal_period integer not null ,
    mabal_credit float not null ,
    mabal_debit float not null ,
    mabal_budget float not null ,
    mabal_basecurr char(4) not null 
  );
revoke all on "maxmast".mabal from "public";

create unique index "maxmast".mabal_key on "maxmast".mabal (mabal_account,
    mabal_year,mabal_period);
create unique index "maxmast".mabal_yearkey on "maxmast".mabal 
    (mabal_year,mabal_account,mabal_period);
{ TABLE "maxmast".mabat row size = 98 number of columns = 13 index size = 78 }
{ unload file name = mabat00234.unl number of rows = 0 }

create table "maxmast".mabat 
  (
    mabat_batch char(6) not null ,
    mabat_system char(2) not null ,
    mabat_desc char(30) not null ,
    mabat_date date not null ,
    mabat_status char(1) not null ,
    mabat_prevstat char(1) not null ,
    mabat_battot float not null ,
    mabat_enttot float not null ,
    mabat_program char(4) not null ,
    mabat_inproc char(10) not null ,
    mabat_lud date not null ,
    mabat_lui char(10) not null ,
    mabat_owner char(10) not null 
  );
revoke all on "maxmast".mabat from "public";

create unique index "maxmast".mabat_batch on "maxmast".mabat (mabat_batch);
    
create unique index "maxmast".mabat_key1 on "maxmast".mabat (mabat_owner,
    mabat_system,mabat_program,mabat_batch);
create unique index "maxmast".mabat_key2 on "maxmast".mabat (mabat_system,
    mabat_program,mabat_batch);
{ TABLE "maxmast".macom row size = 60 number of columns = 2 index size = 12 }
{ unload file name = macom00235.unl number of rows = 3091061 }

create table "maxmast".macom 
  (
    macom_remcode integer not null ,
    macom_remark char(56) not null 
  );
revoke all on "maxmast".macom from "public";

create unique index "maxmast".macom_remcode on "maxmast".macom 
    (macom_remcode);
{ TABLE "maxmast".maopn row size = 27 number of columns = 3 index size = 34 }
{ unload file name = maopn00236.unl number of rows = 7449 }

create table "maxmast".maopn 
  (
    maopn_account char(15) not null ,
    maopn_year integer not null ,
    maopn_openbal float not null 
  );
revoke all on "maxmast".maopn from "public";

create unique index "maxmast".maopn_key on "maxmast".maopn (maopn_account,
    maopn_year);
{ TABLE "maxmast".maxlog row size = 66 number of columns = 11 index size = 24 }
{ unload file name = maxlo00237.unl number of rows = 0 }

create table "maxmast".maxlog 
  (
    lg_user char(10) not null ,
    lg_coid char(4) not null ,
    lg_jobno integer not null ,
    lg_term char(10) not null ,
    lg_date date not null ,
    lg_timeon integer not null ,
    lg_timeoff integer not null ,
    lg_system char(8) not null ,
    lg_program char(8) not null ,
    lg_jtype char(1) not null ,
    lg_pointer char(9) not null 
  );
revoke all on "maxmast".maxlog from "public";

create index "maxmast".lg_date on "maxmast".maxlog (lg_date);
create unique index "maxmast".lg_jobno on "maxmast".maxlog (lg_jobno);
    
{ TABLE "maxmast".menuln row size = 273 number of columns = 28 index size = 222 }
{ unload file name = menul00238.unl number of rows = 0 }

create table "maxmast".menuln 
  (
    mn_menu char(8) not null ,
    mn_sequence integer not null ,
    mn_itemid char(8) not null ,
    mn_direct char(8) not null ,
    mn_itemtyp char(1) not null ,
    mn_pointer char(9) not null ,
    mn_backg char(1) not null ,
    mn_priority char(1) not null ,
    mn_secgrp char(1) not null ,
    mn_seclev char(1) not null ,
    mn_passwd char(10) not null ,
    mn_printid char(8) not null ,
    mn_printyp char(5) not null ,
    mn_printst char(5) not null ,
    mn_ncopies integer not null ,
    mn_dsave integer not null ,
    mn_screenmsk char(9) not null ,
    mn_termid char(8) not null ,
    mn_termtyp char(5) not null ,
    mn_printmsk char(9) not null ,
    mn_printban char(9) not null ,
    mn_attrlist char(10) not null ,
    mn_mnemonic char(2) not null ,
    mn_argyn char(1) not null ,
    mn_arglist char(120) not null ,
    mn_lud date not null ,
    mn_lui char(10) not null ,
    mn_alias char(8) not null 
  );
revoke all on "maxmast".menuln from "public";

create unique index "maxmast".mn_aliaskey on "maxmast".menuln 
    (mn_alias,mn_menu,mn_sequence);
create unique index "maxmast".mn_bypkey on "maxmast".menuln (mn_itemid,
    mn_menu,mn_sequence);
create unique index "maxmast".mn_key on "maxmast".menuln (mn_menu,
    mn_sequence);
create unique index "maxmast".mn_pointkey on "maxmast".menuln 
    (mn_pointer,mn_menu,mn_sequence);
create unique index "maxmast".mn_point2key on "maxmast".menuln 
    (mn_pointer,mn_itemid,mn_menu,mn_sequence);
create index "maxmast".mn_printmsk on "maxmast".menuln (mn_printmsk);
    
create index "maxmast".mn_screenmsk on "maxmast".menuln (mn_screenmsk);
    
{ TABLE "maxmast".mfac row size = 157 number of columns = 22 index size = 13 }
{ unload file name = mfac_00239.unl number of rows = 1 }

create table "maxmast".mfac 
  (
    mfac_manfac char(5) not null ,
    mfac_lastrun date not null ,
    mfac_basedate date not null ,
    mfac_horizon date not null ,
    mfac_daysfor integer not null ,
    mfac_delstore char(5) not null ,
    mfac_delacct char(5) not null ,
    mfac_scrapstor char(5) not null ,
    mfac_scrapacct char(5) not null ,
    mfac_facname char(25) not null ,
    mfac_qtime float not null ,
    mfac_qunit char(1) not null ,
    mfac_gdsearly integer not null ,
    mfac_gdslate integer not null ,
    mfac_gdsover float not null ,
    mfac_gdsunder float not null ,
    mfac_pending integer not null ,
    mfac_daysrel integer not null ,
    mfac_opscrap char(1) not null ,
    mfac_hourcal char(5) not null ,
    mfac_entrydate date not null ,
    mfac_manemail char(40) not null 
  );
revoke all on "maxmast".mfac from "public";

create unique index "maxmast".mfac_manfac on "maxmast".mfac (mfac_manfac);
    
{ TABLE "maxmast".mfcst row size = 40 number of columns = 9 index size = 43 }
{ unload file name = mfcst00240.unl number of rows = 0 }

create table "maxmast".mfcst 
  (
    mfcst_trnserial integer not null ,
    mfcst_sequence integer not null ,
    mfcst_lineno integer not null ,
    mfcst_element char(5) not null ,
    mfcst_formula char(1) not null ,
    mfcst_rate float not null ,
    mfcst_timeunit char(1) not null ,
    mfcst_acost float not null ,
    mfcst_costype char(5) not null 
  );
revoke all on "maxmast".mfcst from "public";

create unique index "maxmast".mfcst_key1 on "maxmast".mfcst (mfcst_trnserial,
    mfcst_sequence,mfcst_lineno);
create index "maxmast".mfcst_key2 on "maxmast".mfcst (mfcst_trnserial,
    mfcst_element);
{ TABLE "maxmast".mfhrs row size = 21 number of columns = 5 index size = 31 }
{ unload file name = mfhrs00241.unl number of rows = 24 }

create table "maxmast".mfhrs 
  (
    mfhrs_hourcal char(5) not null ,
    mfhrs_startdate date not null ,
    mfhrs_day integer not null ,
    mfhrs_starttime integer not null ,
    mfhrs_duration integer not null 
  );
revoke all on "maxmast".mfhrs from "public";

create unique index "maxmast".mfhrs_key on "maxmast".mfhrs (mfhrs_hourcal,
    mfhrs_startdate,mfhrs_day,mfhrs_starttime);
{ TABLE "maxmast".mfop row size = 360 number of columns = 60 index size = 123 }
{ unload file name = mfop_00242.unl number of rows = 534503 }

create table "maxmast".mfop 
  (
    mfop_orderno char(10) not null ,
    mfop_opno char(5) not null ,
    mfop_shortdesc char(15) not null ,
    mfop_manfac char(5) not null ,
    mfop_workcen char(5) not null ,
    mfop_settime float not null ,
    mfop_setunit char(1) not null ,
    mfop_proctime float not null ,
    mfop_procunit char(1) not null ,
    mfop_qtime float not null ,
    mfop_qunit char(1) not null ,
    mfop_qoverride char(1) not null ,
    mfop_classcode char(5) not null ,
    mfop_stage char(1) not null ,
    mfop_textref char(10) not null ,
    mfop_remarks char(56) not null ,
    mfop_lud date not null ,
    mfop_lui char(10) not null ,
    mfop_preop char(5) not null ,
    mfop_nxtop char(5) not null ,
    mfop_pdatestrt date not null ,
    mfop_ptimestrt integer not null ,
    mfop_pdatefin date not null ,
    mfop_ptimefin integer not null ,
    mfop_sdatestrt date not null ,
    mfop_stimestrt integer not null ,
    mfop_sdatefin date not null ,
    mfop_stimefin integer not null ,
    mfop_adatestrt date not null ,
    mfop_atimestrt integer not null ,
    mfop_adatefin date not null ,
    mfop_atimefin integer not null ,
    mfop_aworkcen char(5) not null ,
    mfop_asettime float not null ,
    mfop_asetunit char(1) not null ,
    mfop_abproctim float not null ,
    mfop_abprcunit char(1) not null ,
    mfop_tbq float not null ,
    mfop_pbq float not null ,
    mfop_mbq float not null ,
    mfop_sbq float not null ,
    mfop_scrappc float not null ,
    mfop_qtygood float not null ,
    mfop_qtyscrap float not null ,
    mfop_planqty float not null ,
    mfop_startqty float not null ,
    mfop_schedqty float not null ,
    mfop_status char(1) not null ,
    mfop_setmiss char(1) not null ,
    mfop_backflush char(1) not null ,
    mfop_abckflush char(1) not null ,
    mfop_currency char(1) not null ,
    mfop_seq1 integer not null ,
    mfop_seq2 integer not null ,
    mfop_seq3 integer not null ,
    mfop_seq1a char(5) not null ,
    mfop_seq4 integer not null ,
    mfop_elaptime float not null ,
    mfop_elapunit char(1) not null ,
    mfop_despno char(10) not null 
  );
revoke all on "maxmast".mfop from "public";

create index "maxmast".mfop_despno on "maxmast".mfop (mfop_despno);
    
create unique index "maxmast".mfop_key on "maxmast".mfop (mfop_orderno,
    mfop_opno);
create index "maxmast".mfop_rtcenkey on "maxmast".mfop (mfop_manfac,
    mfop_aworkcen);
create index "maxmast".mfop_workkey on "maxmast".mfop (mfop_manfac,
    mfop_aworkcen,mfop_seq1,mfop_seq1a,mfop_seq2,mfop_seq3,mfop_seq4);
    
{ TABLE "maxmast".mfres row size = 84 number of columns = 17 index size = 138 }
{ unload file name = mfres00244.unl number of rows = 0 }

create table "maxmast".mfres 
  (
    mfres_orderno char(10) not null ,
    mfres_opno char(5) not null ,
    mfres_resid char(15) not null ,
    mfres_resqty float not null ,
    mfres_setres char(1) not null ,
    mfres_procres char(1) not null ,
    mfres_lud date not null ,
    mfres_lui char(10) not null ,
    mfres_backflush char(1) not null ,
    mfres_abckflush char(1) not null ,
    mfres_aresqty float not null ,
    mfres_asetres char(1) not null ,
    mfres_aprocres char(1) not null ,
    mfres_planned char(1) not null ,
    mfres_asettime float not null ,
    mfres_abproctim float not null ,
    mfres_moses char(1) not null 
  );
revoke all on "maxmast".mfres from "public";

create unique index "maxmast".mfres_key on "maxmast".mfres (mfres_orderno,
    mfres_opno,mfres_resid);
create index "maxmast".mfres_moskey on "maxmast".mfres (mfres_orderno,
    mfres_opno,mfres_moses);
create index "maxmast".mfres_opkey on "maxmast".mfres (mfres_orderno,
    mfres_opno);
create index "maxmast".mfres_resid on "maxmast".mfres (mfres_resid);
    
{ TABLE "maxmast".mftrn row size = 322 number of columns = 41 index size = 142 }
{ unload file name = mftrn00245.unl number of rows = 0 }

create table "maxmast".mftrn 
  (
    mftrn_serial serial not null ,
    mftrn_manfac char(5) not null ,
    mftrn_resid char(15) not null ,
    mftrn_resinst char(15) not null ,
    mftrn_resqty float not null ,
    mftrn_contract char(15) not null ,
    mftrn_orderno char(10) not null ,
    mftrn_opno char(5) not null ,
    mftrn_aworkcen char(5) not null ,
    mftrn_date date not null ,
    mftrn_time integer not null ,
    mftrn_asettinc float not null ,
    mftrn_asetunit char(1) not null ,
    mftrn_aprocinc float not null ,
    mftrn_aprocunit char(1) not null ,
    mftrn_goodinc float not null ,
    mftrn_scrapinc float not null ,
    mftrn_reason char(3) not null ,
    mftrn_serno char(15) not null ,
    mftrn_qualtext char(10) not null ,
    mftrn_char1user char(10) not null ,
    mftrn_char2user char(10) not null ,
    mftrn_char3user char(10) not null ,
    mftrn_char4user char(10) not null ,
    mftrn_remarks char(45) not null ,
    mftrn_option char(5) not null ,
    mftrn_booktype char(1) not null ,
    mftrn_opcurr char(1) not null ,
    mftrn_opstatus char(1) not null ,
    mftrn_opstage char(1) not null ,
    mftrn_origin integer not null ,
    mftrn_lud date not null ,
    mftrn_lui char(10) not null ,
    mftrn_npcode char(3) not null ,
    mftrn_conlin integer not null ,
    mftrn_asettcost float not null ,
    mftrn_aproccost float not null ,
    mftrn_cposted char(1) not null ,
    mftrn_glrefrom char(15) not null ,
    mftrn_glrefto char(15) not null ,
    mftrn_sequence integer not null 
  );
revoke all on "maxmast".mftrn from "public";

create index "maxmast".mftrn_key on "maxmast".mftrn (mftrn_manfac,
    mftrn_date,mftrn_time,mftrn_resinst,mftrn_contract,mftrn_orderno);
    
create unique index "maxmast".mftrn_key1 on "maxmast".mftrn (mftrn_orderno,
    mftrn_serial);
create unique index "maxmast".mftrn_key2 on "maxmast".mftrn (mftrn_origin,
    mftrn_sequence);
create unique index "maxmast".mftrn_serial on "maxmast".mftrn 
    (mftrn_serial);
{ TABLE "maxmast".mftro row size = 31 number of columns = 9 index size = 21 }
{ unload file name = mftro00246.unl number of rows = 234 }

create table "maxmast".mftro 
  (
    mftro_orderno char(10) not null ,
    mftro_tplanqty char(1) not null ,
    mftro_tstartqty char(1) not null ,
    mftro_tpdates char(1) not null ,
    mftro_tlspro char(1) not null ,
    mftro_trigdate date not null ,
    mftro_source char(8) not null ,
    mftro_trigtime integer not null ,
    mftro_tbflush char(1) not null 
  );
revoke all on "maxmast".mftro from "public";

create unique index "maxmast".mftro_orderno on "maxmast".mftro 
    (mftro_orderno);
{ TABLE "maxmast".mmalp row size = 222 number of columns = 22 index size = 519 }
{ unload file name = mmalp00248.unl number of rows = 6525 }

create table "maxmast".mmalp 
  (
    mmalp_item char(15) not null ,
    mmalp_type char(1) not null ,
    mmalp_manfac char(5) not null ,
    mmalp_initials char(3) not null ,
    mmalp_date date not null ,
    mmalp_llc integer not null ,
    mmalp_makebuy char(1) not null ,
    mmalp_supplier char(10) not null ,
    mmalp_branch char(4) not null ,
    mmalp_orderno char(10) not null ,
    mmalp_ordline integer not null ,
    mmalp_release integer not null ,
    mmalp_ordserial integer not null ,
    mmalp_reqno char(10) not null ,
    mmalp_serial serial not null ,
    mmalp_supitdate date not null ,
    mmalp_supseq char(60) not null ,
    mmalp_tick char(1) not null ,
    mmalp_itemseq char(60) not null ,
    mmalp_revdate date not null ,
    mmalp_revqty float not null ,
    mmalp_recomm char(2) not null 
  );
revoke all on "maxmast".mmalp from "public";

create unique index "maxmast".mmalp_itemtype on "maxmast".mmalp 
    (mmalp_item,mmalp_type,mmalp_orderno,mmalp_ordline,mmalp_release,
    mmalp_reqno,mmalp_ordserial);
create unique index "maxmast".mmalp_supkey on "maxmast".mmalp 
    (mmalp_initials,mmalp_manfac,mmalp_supplier,mmalp_branch,
    mmalp_supseq,mmalp_date,mmalp_serial);
create unique index "maxmast".mmalp_serial on "maxmast".mmalp 
    (mmalp_serial);
create unique index "maxmast".mmalp_itemkey on "maxmast".mmalp 
    (mmalp_initials,mmalp_manfac,mmalp_item,mmalp_itemseq,mmalp_date,
    mmalp_serial);
create unique index "maxmast".mmalp_itsupkey on "maxmast".mmalp 
    (mmalp_initials,mmalp_manfac,mmalp_item,mmalp_supplier,mmalp_branch,
    mmalp_serial);
create unique index "maxmast".mmalp_typekey on "maxmast".mmalp 
    (mmalp_type,mmalp_item,mmalp_orderno,mmalp_ordline,mmalp_release,
    mmalp_reqno,mmalp_ordserial);
{ TABLE "maxmast".mmals row size = 87 number of columns = 7 index size = 207 }
{ unload file name = mmals00249.unl number of rows = 54 }

create table "maxmast".mmals 
  (
    mmals_initials char(3) not null ,
    mmals_manfac char(5) not null ,
    mmals_supplier char(10) not null ,
    mmals_branch char(4) not null ,
    mmals_supdate date not null ,
    mmals_progress char(1) not null ,
    mmals_sequence char(60) not null 
  );
revoke all on "maxmast".mmals from "public";

create unique index "maxmast".mmals_key on "maxmast".mmals (mmals_initials,
    mmals_manfac,mmals_supplier,mmals_branch);
create unique index "maxmast".mmals_listkey on "maxmast".mmals 
    (mmals_initials,mmals_manfac,mmals_sequence,mmals_supplier,
    mmals_branch);
create unique index "maxmast".mmals_supkey on "maxmast".mmals 
    (mmals_supplier,mmals_branch,mmals_initials,mmals_manfac);
    
{ TABLE "maxmast".mmcal row size = 48 number of columns = 17 index size = 19 }
{ unload file name = mmcal00251.unl number of rows = 13 }

create table "maxmast".mmcal 
  (
    mmcal_manfac char(5) not null ,
    mmcal_sequence integer not null ,
    mmcal_workdays integer not null ,
    mmcal_sun char(1) not null ,
    mmcal_mon char(1) not null ,
    mmcal_tue char(1) not null ,
    mmcal_wed char(1) not null ,
    mmcal_thu char(1) not null ,
    mmcal_fri char(1) not null ,
    mmcal_sat char(1) not null ,
    mmcal_tableleng integer not null ,
    mmcal_s0 date not null ,
    mmcal_d0 integer not null ,
    mmcal_s1 date not null ,
    mmcal_d1 integer not null ,
    mmcal_s2 date not null ,
    mmcal_d2 integer not null 
  );
revoke all on "maxmast".mmcal from "public";

create unique index "maxmast".mmcal_key on "maxmast".mmcal (mmcal_manfac,
    mmcal_sequence);
{ TABLE "maxmast".mmctp row size = 90 number of columns = 18 index size = 13 }
{ unload file name = mmctp00253.unl number of rows = 29 }

create table "maxmast".mmctp 
  (
    mmctp_costype char(5) not null ,
    mmctp_desc char(15) not null ,
    mmctp_frozen char(1) not null ,
    mmctp_fromcost char(5) not null ,
    mmctp_date date not null ,
    mmctp_wasteflag char(1) not null ,
    mmctp_autoimctp char(1) not null ,
    mmctp_costroute char(5) not null ,
    mmctp_dest char(1) not null ,
    mmctp_file char(20) not null ,
    mmctp_level integer not null ,
    mmctp_report integer not null ,
    mmctp_precision integer not null ,
    mmctp_lud date not null ,
    mmctp_lui char(10) not null ,
    mmctp_term char(1) not null ,
    mmctp_regen char(1) not null ,
    mmctp_origdate date not null 
  );
revoke all on "maxmast".mmctp from "public";

create unique index "maxmast".mmctp_costype on "maxmast".mmctp 
    (mmctp_costype);
{ TABLE "maxmast".mmff row size = 120 number of columns = 13 index size = 27 }
{ unload file name = mmff_00254.unl number of rows = 0 }

create table "maxmast".mmff 
  (
    mmff_manfac char(5) not null ,
    mmff_costype char(5) not null ,
    mmff_lineno integer not null ,
    mmff_element char(5) not null ,
    mmff_formula char(1) not null ,
    mmff_rate float not null ,
    mmff_timeunit char(1) not null ,
    mmff_percent float not null ,
    mmff_source char(5) not null ,
    mmff_cost float not null ,
    mmff_lud date not null ,
    mmff_lui char(10) not null ,
    mmff_remarks char(56) not null 
  );
revoke all on "maxmast".mmff from "public";

create unique index "maxmast".mmff_key on "maxmast".mmff (mmff_manfac,
    mmff_costype,mmff_lineno);
{ TABLE "maxmast".mmfi row size = 130 number of columns = 13 index size = 42 }
{ unload file name = mmfi_00255.unl number of rows = 0 }

create table "maxmast".mmfi 
  (
    mmfi_item char(15) not null ,
    mmfi_costype char(5) not null ,
    mmfi_lineno integer not null ,
    mmfi_element char(5) not null ,
    mmfi_formula char(1) not null ,
    mmfi_rate float not null ,
    mmfi_timeunit char(1) not null ,
    mmfi_percent float not null ,
    mmfi_source char(5) not null ,
    mmfi_cost float not null ,
    mmfi_lud date not null ,
    mmfi_lui char(10) not null ,
    mmfi_remarks char(56) not null 
  );
revoke all on "maxmast".mmfi from "public";

create unique index "maxmast".mmfi_key on "maxmast".mmfi (mmfi_item,
    mmfi_costype,mmfi_lineno);
{ TABLE "maxmast".mmfr row size = 130 number of columns = 13 index size = 42 }
{ unload file name = mmfr_00256.unl number of rows = 0 }

create table "maxmast".mmfr 
  (
    mmfr_resid char(15) not null ,
    mmfr_costype char(5) not null ,
    mmfr_lineno integer not null ,
    mmfr_element char(5) not null ,
    mmfr_formula char(1) not null ,
    mmfr_rate float not null ,
    mmfr_timeunit char(1) not null ,
    mmfr_percent float not null ,
    mmfr_source char(5) not null ,
    mmfr_cost float not null ,
    mmfr_lud date not null ,
    mmfr_lui char(10) not null ,
    mmfr_remarks char(56) not null 
  );
revoke all on "maxmast".mmfr from "public";

create unique index "maxmast".mmfr_key on "maxmast".mmfr (mmfr_resid,
    mmfr_costype,mmfr_lineno);
{ TABLE "maxmast".mmfw row size = 125 number of columns = 14 index size = 34 }
{ unload file name = mmfw_00257.unl number of rows = 1442 }

create table "maxmast".mmfw 
  (
    mmfw_manfac char(5) not null ,
    mmfw_workcen char(5) not null ,
    mmfw_costype char(5) not null ,
    mmfw_lineno integer not null ,
    mmfw_element char(5) not null ,
    mmfw_formula char(1) not null ,
    mmfw_rate float not null ,
    mmfw_timeunit char(1) not null ,
    mmfw_percent float not null ,
    mmfw_source char(5) not null ,
    mmfw_cost float not null ,
    mmfw_lud date not null ,
    mmfw_lui char(10) not null ,
    mmfw_remarks char(56) not null 
  );
revoke all on "maxmast".mmfw from "public";

create unique index "maxmast".mmfw_key on "maxmast".mmfw (mmfw_manfac,
    mmfw_workcen,mmfw_costype,mmfw_lineno);
{ TABLE "maxmast".mmins row size = 104 number of columns = 8 index size = 28 }
{ unload file name = mmins00258.unl number of rows = 0 }

create table "maxmast".mmins 
  (
    mmins_resinst char(15) not null ,
    mmins_name char(30) not null ,
    mmins_pin char(10) not null ,
    mmins_dept char(10) not null ,
    mmins_resid char(15) not null ,
    mmins_lud date not null ,
    mmins_lui char(10) not null ,
    mmins_char1user char(10) not null 
  );
revoke all on "maxmast".mmins from "public";

create unique index "maxmast".mmins_resinst on "maxmast".mmins 
    (mmins_resinst);
{ TABLE "maxmast".mmpro row size = 41 number of columns = 6 index size = 55 }
{ unload file name = mmpro00259.unl number of rows = 0 }

create table "maxmast".mmpro 
  (
    mmpro_resid char(15) not null ,
    mmpro_datefrom date not null ,
    mmpro_timefrom integer not null ,
    mmpro_qtyavail float not null ,
    mmpro_manfac char(5) not null ,
    mmpro_workcen char(5) not null 
  );
revoke all on "maxmast".mmpro from "public";

create unique index "maxmast".mmpro_key on "maxmast".mmpro (mmpro_manfac,
    mmpro_workcen,mmpro_resid,mmpro_datefrom,mmpro_timefrom);
    
{ TABLE "maxmast".mmres row size = 110 number of columns = 10 index size = 58 }
{ unload file name = mmres00260.unl number of rows = 0 }

create table "maxmast".mmres 
  (
    mmres_resid char(15) not null ,
    mmres_name char(25) not null ,
    mmres_resclass char(1) not null ,
    mmres_scheck char(1) not null ,
    mmres_lcheck char(1) not null ,
    mmres_remarks char(56) not null ,
    mmres_backflush char(1) not null ,
    mmres_crp char(1) not null ,
    mmres_entrydate date not null ,
    mmres_user1 char(5) not null 
  );
revoke all on "maxmast".mmres from "public";

create unique index "maxmast".mmres_resid on "maxmast".mmres (mmres_resid);
    
create unique index "maxmast".mmres_typekey on "maxmast".mmres 
    (mmres_resclass,mmres_resid);
{ TABLE "maxmast".mmser row size = 21 number of columns = 2 index size = 15 }
{ unload file name = mmser00261.unl number of rows = 35 }

create table "maxmast".mmser 
  (
    mmser_sergroup char(6) not null ,
    mmser_serlast char(15) not null 
  );
revoke all on "maxmast".mmser from "public";

create unique index "maxmast".mmser_sergroup on "maxmast".mmser 
    (mmser_sergroup);
{ TABLE "maxmast".mmtrc row size = 35 number of columns = 5 index size = 75 }
{ unload file name = mmtrc00263.unl number of rows = 5858 }

create table "maxmast".mmtrc 
  (
    mmtrc_item char(15) not null ,
    mmtrc_trigdate date not null ,
    mmtrc_illc integer not null ,
    mmtrc_lud date not null ,
    mmtrc_source char(8) not null 
  );
revoke all on "maxmast".mmtrc from "public";

create unique index "maxmast".mmtrc_cltkey on "maxmast".mmtrc 
    (mmtrc_illc,mmtrc_item,mmtrc_trigdate);
create unique index "maxmast".mmtrc_trgkey on "maxmast".mmtrc 
    (mmtrc_item,mmtrc_trigdate);
{ TABLE "maxmast".mmtrl row size = 27 number of columns = 4 index size = 63 }
{ unload file name = mmtrl00264.unl number of rows = 0 }

create table "maxmast".mmtrl 
  (
    mmtrl_item char(15) not null ,
    mmtrl_trigdate date not null ,
    mmtrl_trigtime integer not null ,
    mmtrl_llc integer not null 
  );
revoke all on "maxmast".mmtrl from "public";

create unique index "maxmast".mmtrl_item on "maxmast".mmtrl (mmtrl_item);
    
create unique index "maxmast".mmtrl_llcitem on "maxmast".mmtrl 
    (mmtrl_llc,mmtrl_item);
{ TABLE "maxmast".mmtrm row size = 44 number of columns = 8 index size = 66 }
{ unload file name = mmtrm00265.unl number of rows = 80 }

create table "maxmast".mmtrm 
  (
    mmtrm_paritem char(15) not null ,
    mmtrm_llc integer not null ,
    mmtrm_trigtype char(1) not null ,
    mmtrm_trigdate date not null ,
    mmtrm_trigtime integer not null ,
    mmtrm_lineno integer not null ,
    mmtrm_source char(8) not null ,
    mmtrm_serial serial not null 
  );
revoke all on "maxmast".mmtrm from "public";

create unique index "maxmast".mmtrm_key on "maxmast".mmtrm (mmtrm_paritem,
    mmtrm_trigtype,mmtrm_lineno);
create index "maxmast".mmtrm_llckey on "maxmast".mmtrm (mmtrm_llc,
    mmtrm_serial);
create unique index "maxmast".mmtrm_serial on "maxmast".mmtrm 
    (mmtrm_serial);
{ TABLE "maxmast".mmtro row size = 33 number of columns = 4 index size = 43 }
{ unload file name = mmtro00266.unl number of rows = 0 }

create table "maxmast".mmtro 
  (
    mmtro_item char(15) not null ,
    mmtro_costype char(5) not null ,
    mmtro_element char(5) not null ,
    mmtro_uplift float not null 
  );
revoke all on "maxmast".mmtro from "public";

create unique index "maxmast".mmtro_key on "maxmast".mmtro (mmtro_item,
    mmtro_costype,mmtro_element);
{ TABLE "maxmast".mmtrs row size = 43 number of columns = 7 index size = 93 }
{ unload file name = mmtrs00267.unl number of rows = 423719 }

create table "maxmast".mmtrs 
  (
    mmtrs_item char(15) not null ,
    mmtrs_trigdate date not null ,
    mmtrs_trigtype char(1) not null ,
    mmtrs_illc integer not null ,
    mmtrs_costype char(5) not null ,
    mmtrs_source char(10) not null ,
    mmtrs_lud date not null 
  );
revoke all on "maxmast".mmtrs from "public";

create unique index "maxmast".mmtrs_illckey on "maxmast".mmtrs 
    (mmtrs_costype,mmtrs_illc,mmtrs_item,mmtrs_trigtype,mmtrs_trigdate);
    
create unique index "maxmast".mmtrs_key on "maxmast".mmtrs (mmtrs_costype,
    mmtrs_item,mmtrs_trigtype,mmtrs_trigdate);
{ TABLE "maxmast".mmuid row size = 107 number of columns = 5 index size = 10 }
{ unload file name = mmuid00268.unl number of rows = 25 }

create table "maxmast".mmuid 
  (
    mmuid_initials char(3) not null ,
    mmuid_userid char(10) not null ,
    mmuid_lud date not null ,
    mmuid_lui char(10) not null ,
    mmuid_email char(80) not null 
  );
revoke all on "maxmast".mmuid from "public";

create unique index "maxmast".mmuid_initials on "maxmast".mmuid 
    (mmuid_initials);
{ TABLE "maxmast".mmuom row size = 33 number of columns = 4 index size = 34 }
{ unload file name = mmuom00269.unl number of rows = 9 }

create table "maxmast".mmuom 
  (
    mmuom_fromuom char(5) not null ,
    mmuom_touom char(5) not null ,
    mmuom_convert float not null ,
    mmuom_desc char(15) not null 
  );
revoke all on "maxmast".mmuom from "public";

create index "maxmast".mmuom_fromuom on "maxmast".mmuom (mmuom_fromuom);
    
create unique index "maxmast".mmuom_key on "maxmast".mmuom (mmuom_fromuom,
    mmuom_touom);
{ TABLE "maxmast".mr1for row size = 41 number of columns = 6 index size = 112 }
{ unload file name = mr1fo00271.unl number of rows = 0 }

create table "maxmast".mr1for 
  (
    mr1fo_rqtserial integer not null ,
    mr1fo_item char(15) not null ,
    mr1fo_ordserial integer not null ,
    mr1fo_orderno char(10) not null ,
    mr1fo_ordline integer not null ,
    mr1fo_release integer not null 
  );
revoke all on "maxmast".mr1for from "public";

create index "maxmast".mr1fo_orderno on "maxmast".mr1for (mr1fo_orderno);
    
create unique index "maxmast".mr1fo_ordkey on "maxmast".mr1for 
    (mr1fo_item,mr1fo_rqtserial);
create index "maxmast".mr1fo_ordserial on "maxmast".mr1for (mr1fo_ordserial);
    
create index "maxmast".mr1fo_purkey on "maxmast".mr1for (mr1fo_orderno,
    mr1fo_ordline,mr1fo_release);
create unique index "maxmast".mr1fo_rqtserial on "maxmast".mr1for 
    (mr1fo_rqtserial);
{ TABLE "maxmast".mrcpt row size = 113 number of columns = 17 index size = 255 }
{ unload file name = mrcpt00272.unl number of rows = 329459 }

create table "maxmast".mrcpt 
  (
    mrcpt_item char(15) not null ,
    mrcpt_duedate date not null ,
    mrcpt_dueqty float not null ,
    mrcpt_issqty float not null ,
    mrcpt_orderno char(10) not null ,
    mrcpt_lineno integer not null ,
    mrcpt_rqtserial integer not null ,
    mrcpt_qfactor float not null ,
    mrcpt_opno char(5) not null ,
    mrcpt_lud date not null ,
    mrcpt_lui char(10) not null ,
    mrcpt_abckflush char(1) not null ,
    mrcpt_cmpparent char(15) not null ,
    mrcpt_ordline integer not null ,
    mrcpt_release integer not null ,
    mrcpt_indmps char(1) not null ,
    mrcpt_osallqty float not null 
  );
revoke all on "maxmast".mrcpt from "public";

create index "maxmast".mrcpt_datekey on "maxmast".mrcpt (mrcpt_item,
    mrcpt_duedate);
create unique index "maxmast".mrcpt_duekey on "maxmast".mrcpt 
    (mrcpt_item,mrcpt_duedate,mrcpt_rqtserial);
create unique index "maxmast".mrcpt_opkey on "maxmast".mrcpt (mrcpt_orderno,
    mrcpt_opno,mrcpt_ordline,mrcpt_release,mrcpt_lineno);
create index "maxmast".mrcpt_orderno on "maxmast".mrcpt (mrcpt_orderno);
    
create unique index "maxmast".mrcpt_orditem on "maxmast".mrcpt 
    (mrcpt_orderno,mrcpt_ordline,mrcpt_release,mrcpt_item,mrcpt_lineno);
    
create unique index "maxmast".mrcpt_ordkey on "maxmast".mrcpt 
    (mrcpt_orderno,mrcpt_ordline,mrcpt_release,mrcpt_lineno);
    
create unique index "maxmast".mrcpt_rqtserial on "maxmast".mrcpt 
    (mrcpt_rqtserial);
{ TABLE "maxmast".mrord row size = 35 number of columns = 5 index size = 52 }
{ unload file name = mrord00273.unl number of rows = 12559 }

create table "maxmast".mrord 
  (
    mrord_ordserial serial not null ,
    mrord_item char(15) not null ,
    mrord_duedate date not null ,
    mrord_dueqty float not null ,
    mrord_startdate date not null 
  );
revoke all on "maxmast".mrord from "public";

create unique index "maxmast".mrord_datekey on "maxmast".mrord 
    (mrord_item,mrord_duedate,mrord_ordserial);
create unique index "maxmast".mrord_ordserial on "maxmast".mrord 
    (mrord_ordserial);
{ TABLE "maxmast".mrqt row size = 61 number of columns = 10 index size = 70 }
{ unload file name = mrqt_00274.unl number of rows = 554991 }

create table "maxmast".mrqt 
  (
    mrqt_rqtserial serial not null ,
    mrqt_item char(15) not null ,
    mrqt_duedate date not null ,
    mrqt_dueqty float not null ,
    mrqt_ordserial integer not null ,
    mrqt_lineno integer not null ,
    mrqt_qfactor float not null ,
    mrqt_eqfactor float not null ,
    mrqt_opno char(5) not null ,
    mrqt_indmps char(1) not null 
  );
revoke all on "maxmast".mrqt from "public";

create unique index "maxmast".mrqt_datekey on "maxmast".mrqt (mrqt_item,
    mrqt_duedate,mrqt_rqtserial);
create index "maxmast".mrqt_ordkey on "maxmast".mrqt (mrqt_ordserial,
    mrqt_lineno);
create unique index "maxmast".mrqt_rqtserial on "maxmast".mrqt 
    (mrqt_rqtserial);
{ TABLE "maxmast".msagf row size = 42 number of columns = 6 index size = 34 }
{ unload file name = msagf00275.unl number of rows = 0 }

create table "maxmast".msagf 
  (
    msagf_item char(15) not null ,
    msagf_duedate date not null ,
    msagf_origin char(1) not null ,
    msagf_lud date not null ,
    msagf_lui char(10) not null ,
    msagf_dueqty float not null 
  );
revoke all on "maxmast".msagf from "public";

create unique index "maxmast".msagf_key on "maxmast".msagf (msagf_item,
    msagf_duedate);
{ TABLE "maxmast".mserl row size = 13 number of columns = 2 index size = 19 }
{ unload file name = mserl00276.unl number of rows = 0 }

create table "maxmast".mserl 
  (
    mserl_tabname char(9) not null ,
    mserl_serial integer not null 
  );
revoke all on "maxmast".mserl from "public";

create unique index "maxmast".mserl_tabname on "maxmast".mserl 
    (mserl_tabname);
{ TABLE "maxmast".msfst row size = 52 number of columns = 5 index size = 79 }
{ unload file name = msfst00277.unl number of rows = 0 }

create table "maxmast".msfst 
  (
    msfst_parentid char(15) not null ,
    msfst_item char(15) not null ,
    msfst_uomfact float not null ,
    msfst_lud date not null ,
    msfst_lui char(10) not null 
  );
revoke all on "maxmast".msfst from "public";

create unique index "maxmast".msfst_famkey on "maxmast".msfst 
    (msfst_parentid,msfst_item);
create unique index "maxmast".msfst_item on "maxmast".msfst (msfst_item);
    
{ TABLE "maxmast".msrqt row size = 201 number of columns = 21 index size = 333 }
{ unload file name = msrqt00278.unl number of rows = 191326 }

create table "maxmast".msrqt 
  (
    msrqt_item char(15) not null ,
    msrqt_duedate date not null ,
    msrqt_rqtserial integer not null ,
    msrqt_source char(5) not null ,
    msrqt_sourcref char(15) not null ,
    msrqt_firmord char(1) not null ,
    msrqt_delstore char(5) not null ,
    msrqt_delacct char(5) not null ,
    msrqt_dueqty float not null ,
    msrqt_issqty float not null ,
    msrqt_sremarks char(56) not null ,
    msrqt_lud date not null ,
    msrqt_lui char(10) not null ,
    msrqt_contract char(15) not null ,
    msrqt_conlin integer not null ,
    msrqt_parentid char(15) not null ,
    msrqt_ordnum char(8) not null ,
    msrqt_parlinnum integer not null ,
    msrqt_linnum integer not null ,
    msrqt_pegged char(1) not null ,
    msrqt_customer char(10) not null 
  );
revoke all on "maxmast".msrqt from "public";

create unique index "maxmast".msrqt_custkey on "maxmast".msrqt 
    (msrqt_customer,msrqt_sourcref,msrqt_item,msrqt_duedate,msrqt_rqtserial);
    
create unique index "maxmast".msrqt_datekey on "maxmast".msrqt 
    (msrqt_item,msrqt_duedate,msrqt_rqtserial);
create unique index "maxmast".msrqt_delkey on "maxmast".msrqt 
    (msrqt_item,msrqt_delstore,msrqt_delacct,msrqt_duedate,msrqt_rqtserial);
    
create unique index "maxmast".msrqt_ordkey on "maxmast".msrqt 
    (msrqt_ordnum,msrqt_parlinnum,msrqt_linnum,msrqt_rqtserial);
    
create unique index "maxmast".msrqt_parkey on "maxmast".msrqt 
    (msrqt_parentid,msrqt_duedate,msrqt_rqtserial);
create unique index "maxmast".msrqt_refkey on "maxmast".msrqt 
    (msrqt_source,msrqt_sourcref,msrqt_item,msrqt_duedate,msrqt_rqtserial);
    
create unique index "maxmast".msrqt_rqtserial on "maxmast".msrqt 
    (msrqt_rqtserial);
{ TABLE "maxmast".mswhd row size = 100 number of columns = 5 index size = 28 }
{ unload file name = mswhd00279.unl number of rows = 0 }

create table "maxmast".mswhd 
  (
    mswhd_wifid char(15) not null ,
    mswhd_basecrp char(15) not null ,
    mswhd_remarks char(56) not null ,
    mswhd_lud date not null ,
    mswhd_lui char(10) not null 
  );
revoke all on "maxmast".mswhd from "public";

create unique index "maxmast".mswhd_wifid on "maxmast".mswhd (mswhd_wifid);
    
{ TABLE "maxmast".mswif row size = 159 number of columns = 15 index size = 115 }
{ unload file name = mswif00280.unl number of rows = 0 }

create table "maxmast".mswif 
  (
    mswif_wifid char(15) not null ,
    mswif_item char(15) not null ,
    mswif_duedate date not null ,
    mswif_source char(5) not null ,
    mswif_sourcref char(15) not null ,
    mswif_rqtserial integer not null ,
    mswif_adjqty float not null ,
    mswif_adjdueqty float not null ,
    mswif_lud date not null ,
    mswif_lui char(10) not null ,
    mswif_firmord char(1) not null ,
    mswif_delstore char(5) not null ,
    mswif_delacct char(5) not null ,
    mswif_sremarks char(56) not null ,
    mswif_wifserial serial not null 
  );
revoke all on "maxmast".mswif from "public";

create index "maxmast".mswif_rqt_wifid on "maxmast".mswif (mswif_rqtserial,
    mswif_wifid);
create unique index "maxmast".mswif_wifkey on "maxmast".mswif 
    (mswif_wifid,mswif_item,mswif_duedate,mswif_rqtserial,mswif_wifserial);
    
create unique index "maxmast".mswif_wifserial on "maxmast".mswif 
    (mswif_wifserial);
{ TABLE "maxmast".mswih row size = 44 number of columns = 4 index size = 102 }
{ unload file name = mswih00281.unl number of rows = 0 }

create table "maxmast".mswih 
  (
    mswih_wifid char(15) not null ,
    mswih_item char(15) not null ,
    mswih_lud date not null ,
    mswih_lui char(10) not null 
  );
revoke all on "maxmast".mswih from "public";

create unique index "maxmast".mswih_itemwif on "maxmast".mswih 
    (mswih_item,mswih_wifid);
create unique index "maxmast".mswih_wifitem on "maxmast".mswih 
    (mswih_wifid,mswih_item);
{ TABLE "maxmast".nphdr row size = 124 number of columns = 5 index size = 168 }
{ unload file name = nphdr00285.unl number of rows = 14461 }

create table "maxmast".nphdr 
  (
    nphdr_key char(100) not null ,
    nphdr_serial integer not null ,
    nphdr_access integer not null ,
    nphdr_modify integer not null ,
    nphdr_user char(12) not null 
  );
revoke all on "maxmast".nphdr from "public";

create unique index "maxmast".nphdr_key on "maxmast".nphdr (nphdr_key);
    
create unique index "maxmast".nphdr_serial on "maxmast".nphdr 
    (nphdr_serial);
{ TABLE "maxmast".nptxt row size = 48 number of columns = 3 index size = 18 }
{ unload file name = nptxt00286.unl number of rows = 60460 }

create table "maxmast".nptxt 
  (
    nptxt_serial integer not null ,
    nptxt_seq integer not null ,
    nptxt_text char(40) not null 
  );
revoke all on "maxmast".nptxt from "public";

create unique index "maxmast".nptxt_key on "maxmast".nptxt (nptxt_serial,
    nptxt_seq);
{ TABLE "maxmast".nvabc row size = 245 number of columns = 37 index size = 7 }
{ unload file name = nvabc00287.unl number of rows = 1 }

create table "maxmast".nvabc 
  (
    nvabc_qmethod char(1) not null ,
    nvabc_physical char(1) not null ,
    nvabc_cmethod char(1) not null ,
    nvabc_std char(1) not null ,
    nvabc_split char(1) not null ,
    nvabc_daysback float not null ,
    nvabc_daysfwd float not null ,
    nvabc_update char(1) not null ,
    nvabc_replevel char(1) not null ,
    nvabc_classa float not null ,
    nvabc_classb float not null ,
    nvabc_classc float not null ,
    nvabc_classd float not null ,
    nvabc_classe float not null ,
    nvabc_classf float not null ,
    nvabc_classg float not null ,
    nvabc_classh float not null ,
    nvabc_classi float not null ,
    nvabc_classj float not null ,
    nvabc_classk float not null ,
    nvabc_classl float not null ,
    nvabc_classm float not null ,
    nvabc_classn float not null ,
    nvabc_classo float not null ,
    nvabc_classp float not null ,
    nvabc_classq float not null ,
    nvabc_classr float not null ,
    nvabc_classs float not null ,
    nvabc_classt float not null ,
    nvabc_classu float not null ,
    nvabc_classv float not null ,
    nvabc_classw float not null ,
    nvabc_classx float not null ,
    nvabc_classy float not null ,
    nvabc_classz float not null ,
    nvabc_lui char(10) not null ,
    nvabc_lud date not null 
  );
revoke all on "maxmast".nvabc from "public";

create unique index "maxmast".nvabc_qmethod on "maxmast".nvabc 
    (nvabc_qmethod);
{ TABLE "maxmast".nvacc row size = 56 number of columns = 12 index size = 13 }
{ unload file name = nvacc00288.unl number of rows = 34 }

create table "maxmast".nvacc 
  (
    nvacc_account char(5) not null ,
    nvacc_mrpacc char(1) not null ,
    nvacc_ooacc char(1) not null ,
    nvacc_nowhere char(1) not null ,
    nvacc_status char(1) not null ,
    nvacc_acname char(15) not null ,
    nvacc_lud date not null ,
    nvacc_lui char(10) not null ,
    nvacc_nlacct char(15) not null ,
    nvacc_gfsfree char(1) not null ,
    nvacc_bins char(1) not null ,
    nvacc_serials char(1) not null 
  );
revoke all on "maxmast".nvacc from "public";

create unique index "maxmast".nvacc_account on "maxmast".nvacc 
    (nvacc_account);
{ TABLE "maxmast".nvall row size = 117 number of columns = 14 index size = 348 }
{ unload file name = nvall00289.unl number of rows = 0 }

create table "maxmast".nvall 
  (
    nvall_item char(15) not null ,
    nvall_store char(5) not null ,
    nvall_account char(5) not null ,
    nvall_bin char(15) not null ,
    nvall_serno char(15) not null ,
    nvall_orderno char(10) not null ,
    nvall_ordline integer not null ,
    nvall_release integer not null ,
    nvall_linerel char(10) not null ,
    nvall_lineno integer not null ,
    nvall_allqty float not null ,
    nvall_issqty float not null ,
    nvall_lud date not null ,
    nvall_lui char(10) not null 
  );
revoke all on "maxmast".nvall from "public";

create unique index "maxmast".nvall_cmpordkey on "maxmast".nvall 
    (nvall_item,nvall_orderno,nvall_linerel,nvall_lineno,nvall_store,
    nvall_account,nvall_bin,nvall_serno);
create unique index "maxmast".nvall_cmpstkkey on "maxmast".nvall 
    (nvall_item,nvall_store,nvall_account,nvall_bin,nvall_serno,
    nvall_orderno,nvall_linerel,nvall_lineno);
create unique index "maxmast".nvall_ordkey on "maxmast".nvall 
    (nvall_orderno,nvall_ordline,nvall_release,nvall_lineno,nvall_store,
    nvall_account,nvall_bin,nvall_serno);
{ TABLE "maxmast".nvcls row size = 81 number of columns = 9 index size = 15 }
{ unload file name = nvcls00291.unl number of rows = 3 }

create table "maxmast".nvcls 
  (
    nvcls_store char(5) not null ,
    nvcls_class char(1) not null ,
    nvcls_days integer not null ,
    nvcls_totitems integer not null ,
    nvcls_maxcounts integer not null ,
    nvcls_counts integer not null ,
    nvcls_remarks char(45) not null ,
    nvcls_lud date not null ,
    nvcls_lui char(10) not null 
  );
revoke all on "maxmast".nvcls from "public";

create unique index "maxmast".nvcls_key on "maxmast".nvcls (nvcls_store,
    nvcls_class);
{ TABLE "maxmast".nvtra row size = 62 number of columns = 7 index size = 52 }
{ unload file name = nvtra00293.unl number of rows = 0 }

create table "maxmast".nvtra 
  (
    nvtra_current char(15) not null ,
    nvtra_sequence integer not null ,
    nvtra_glrefrom char(15) not null ,
    nvtra_glrefto char(15) not null ,
    nvtra_type char(1) not null ,
    nvtra_serial serial not null ,
    nvtra_cost float not null 
  );
revoke all on "maxmast".nvtra from "public";

create unique index "maxmast".nvtra_key on "maxmast".nvtra (nvtra_current,
    nvtra_sequence,nvtra_serial);
create unique index "maxmast".nvtra_serial on "maxmast".nvtra 
    (nvtra_serial);
{ TABLE "maxmast".nvtrm row size = 64 number of columns = 3 index size = 34 }
{ unload file name = nvtrm00294.unl number of rows = 244108 }

create table "maxmast".nvtrm 
  (
    nvtrm_current char(15) not null ,
    nvtrm_remarks char(45) not null ,
    nvtrm_sequence integer not null 
  );
revoke all on "maxmast".nvtrm from "public";

create unique index "maxmast".nvtrm_key on "maxmast".nvtrm (nvtrm_current,
    nvtrm_sequence);
{ TABLE "maxmast".nvtrs row size = 93 number of columns = 12 index size = 135 }
{ unload file name = nvtrs00296.unl number of rows = 4436 }

create table "maxmast".nvtrs 
  (
    nvtrs_store char(5) not null ,
    nvtrs_scontrolr char(3) not null ,
    nvtrs_checked char(1) not null ,
    nvtrs_trigdate date not null ,
    nvtrs_itemseq char(15) not null ,
    nvtrs_pickseq integer not null ,
    nvtrs_bin char(15) not null ,
    nvtrs_item char(15) not null ,
    nvtrs_countdate date not null ,
    nvtrs_counttime integer not null ,
    nvtrs_reference char(15) not null ,
    nvtrs_source char(8) not null 
  );
revoke all on "maxmast".nvtrs from "public";

create unique index "maxmast".nvtrs_key on "maxmast".nvtrs (nvtrs_store,
    nvtrs_item);
create unique index "maxmast".nvtrs_listkey on "maxmast".nvtrs 
    (nvtrs_store,nvtrs_scontrolr,nvtrs_checked,nvtrs_trigdate,
    nvtrs_itemseq,nvtrs_pickseq,nvtrs_bin,nvtrs_item);
{ TABLE "maxmast".nvxac row size = 37 number of columns = 8 index size = 72 }
{ unload file name = nvxac00297.unl number of rows = 188 }

create table "maxmast".nvxac 
  (
    nvxac_facc char(5) not null ,
    nvxac_fstore char(5) not null ,
    nvxac_toacc char(5) not null ,
    nvxac_tostore char(5) not null ,
    nvxac_analyse char(2) not null ,
    nvxac_lud date not null ,
    nvxac_lui char(10) not null ,
    nvxac_history char(1) not null 
  );
revoke all on "maxmast".nvxac from "public";

create unique index "maxmast".nvxac_key on "maxmast".nvxac (nvxac_facc,
    nvxac_fstore,nvxac_toacc,nvxac_tostore);
create unique index "maxmast".nvxac_key2 on "maxmast".nvxac (nvxac_fstore,
    nvxac_facc,nvxac_tostore,nvxac_toacc);
{ TABLE "maxmast".object row size = 120 number of columns = 19 index size = 85 }
{ unload file name = objec00299.unl number of rows = 0 }

create table "maxmast".object 
  (
    obj_object char(9) not null ,
    obj_owner char(5) not null ,
    obj_intype char(1) not null ,
    obj_extype char(1) not null ,
    obj_inwidth integer not null ,
    obj_exwidth integer not null ,
    obj_negflg char(1) not null ,
    obj_decplace integer not null ,
    obj_valtype char(1) not null ,
    obj_valtab char(9) not null ,
    obj_dscmsg char(9) not null ,
    obj_hlpmsg char(9) not null ,
    obj_legend char(9) not null ,
    obj_alphabet char(9) not null ,
    obj_defdat char(9) not null ,
    obj_rkcode char(9) not null ,
    obj_npkey char(9) not null ,
    obj_grkey char(9) not null ,
    obj_popupkey char(9) not null 
  );
revoke all on "maxmast".object from "public";

create index "maxmast".obj_grkey on "maxmast".object (obj_grkey);
    
create unique index "maxmast".obj_key on "maxmast".object (obj_object,
    obj_owner);
create index "maxmast".obj_legend on "maxmast".object (obj_legend);
    
create index "maxmast".obj_valtab on "maxmast".object (obj_valtab);
    
{ TABLE "maxmast".oeall row size = 110 number of columns = 17 index size = 157 }
{ unload file name = oeall00300.unl number of rows = 0 }

create table "maxmast".oeall 
  (
    oeall_item char(15) not null ,
    oeall_ltype integer not null ,
    oeall_cuspri char(1) not null ,
    oeall_datereq date not null ,
    oeall_ordnum char(8) not null ,
    oeall_accman char(10) not null ,
    oeall_salesman char(10) not null ,
    oeall_qtyord float not null ,
    oeall_qtyos float not null ,
    oeall_linnum integer not null ,
    oeall_lud date not null ,
    oeall_lui char(10) not null ,
    oeall_pickdate date not null ,
    oeall_despdate date not null ,
    oeall_store char(5) not null ,
    oeall_bompset char(1) not null ,
    oeall_orderno char(10) not null 
  );
revoke all on "maxmast".oeall from "public";

create unique index "maxmast".oeall_key on "maxmast".oeall (oeall_ltype,
    oeall_item,oeall_cuspri,oeall_pickdate,oeall_despdate,oeall_datereq,
    oeall_ordnum,oeall_linnum);
create unique index "maxmast".oeall_key1 on "maxmast".oeall (oeall_ordnum,
    oeall_linnum);
create index "maxmast".oeall_key2 on "maxmast".oeall (oeall_item,
    oeall_store,oeall_ltype,oeall_cuspri,oeall_pickdate,oeall_despdate,
    oeall_datereq);
{ TABLE "maxmast".oeatr row size = 62 number of columns = 15 index size = 30 }
{ unload file name = oeatr00301.unl number of rows = 1669 }

create table "maxmast".oeatr 
  (
    oeatr_ordnum char(8) not null ,
    oeatr_trigdate date not null ,
    oeatr_trigtime integer not null ,
    oeatr_source char(8) not null ,
    oeatr_serial serial not null ,
    oeatr_reprint char(1) not null ,
    oeatr_lud date not null ,
    oeatr_lui char(10) not null ,
    oeatr_hcoack char(1) not null ,
    oeatr_faxoack char(1) not null ,
    oeatr_edioack char(1) not null ,
    oeatr_hcdate date not null ,
    oeatr_hctime integer not null ,
    oeatr_edidate date not null ,
    oeatr_editime integer not null 
  );
revoke all on "maxmast".oeatr from "public";

create index "maxmast".oeatr_ordnum on "maxmast".oeatr (oeatr_ordnum);
    
create unique index "maxmast".oeatr_serial on "maxmast".oeatr 
    (oeatr_serial);
{ TABLE "maxmast".oeccm row size = 136 number of columns = 14 index size = 49 }
{ unload file name = oeccm00302.unl number of rows = 0 }

create table "maxmast".oeccm 
  (
    oeccm_account char(10) not null ,
    oeccm_ponum char(15) not null ,
    oeccm_linnum integer not null ,
    oeccm_linkfrm integer not null ,
    oeccm_comm1 char(40) not null ,
    oeccm_comm2 char(40) not null ,
    oeccm_lud date not null ,
    oeccm_lui char(10) not null ,
    oeccm_updflag integer not null ,
    oeccm_ordack char(1) not null ,
    oeccm_picklist char(1) not null ,
    oeccm_despnote char(1) not null ,
    oeccm_invoice char(1) not null ,
    oeccm_userfld char(1) not null 
  );
revoke all on "maxmast".oeccm from "public";

create unique index "maxmast".oeccm_key on "maxmast".oeccm (oeccm_account,
    oeccm_ponum,oeccm_linnum);
{ TABLE "maxmast".oecds row size = 72 number of columns = 12 index size = 178 }
{ unload file name = oecds00303.unl number of rows = 0 }

create table "maxmast".oecds 
  (
    oecds_account char(10) not null ,
    oecds_ponum char(15) not null ,
    oecds_linnum integer not null ,
    oecds_reqdate date not null ,
    oecds_despdate date not null ,
    oecds_pickdate date not null ,
    oecds_qtyord float not null ,
    oecds_status char(1) not null ,
    oecds_lud date not null ,
    oecds_lui char(10) not null ,
    oecds_parlinnum integer not null ,
    oecds_updflag integer not null 
  );
revoke all on "maxmast".oecds from "public";

create unique index "maxmast".oecds_key on "maxmast".oecds (oecds_account,
    oecds_ponum,oecds_parlinnum,oecds_linnum);
create unique index "maxmast".oecds_pickkey on "maxmast".oecds 
    (oecds_account,oecds_ponum,oecds_parlinnum,oecds_pickdate,
    oecds_linnum);
create unique index "maxmast".oecds_reqkey on "maxmast".oecds 
    (oecds_account,oecds_ponum,oecds_parlinnum,oecds_reqdate,
    oecds_linnum);
{ TABLE "maxmast".oecia row size = 127 number of columns = 15 index size = 255 }
{ unload file name = oecia00305.unl number of rows = 0 }

create table "maxmast".oecia 
  (
    oecia_salesoff char(5) not null ,
    oecia_ordnum char(8) not null ,
    oecia_linnum integer not null ,
    oecia_item char(15) not null ,
    oecia_serno char(15) not null ,
    oecia_quantity float not null ,
    oecia_ponum char(15) not null ,
    oecia_account char(10) not null ,
    oecia_storecode char(10) not null ,
    oecia_store char(5) not null ,
    oecia_despdate date not null ,
    oecia_salesman char(10) not null ,
    oecia_lud date not null ,
    oecia_lui char(10) not null ,
    oecia_serial serial not null 
  );
revoke all on "maxmast".oecia from "public";

create index "maxmast".oecia_key on "maxmast".oecia (oecia_salesoff,
    oecia_ordnum,oecia_linnum);
create index "maxmast".oecia_key2 on "maxmast".oecia (oecia_item,
    oecia_serno);
create index "maxmast".oecia_key3 on "maxmast".oecia (oecia_store,
    oecia_item);
create index "maxmast".oecia_key4 on "maxmast".oecia (oecia_account,
    oecia_storecode);
create index "maxmast".oecia_ordnum on "maxmast".oecia (oecia_ordnum);
    
create index "maxmast".oecia_ponum on "maxmast".oecia (oecia_ponum);
    
create index "maxmast".oecia_salesman on "maxmast".oecia (oecia_salesman);
    
create unique index "maxmast".oecia_serial on "maxmast".oecia 
    (oecia_serial);
create index "maxmast".oecia_storecode on "maxmast".oecia (oecia_storecode);
    
{ TABLE "maxmast".oecit row size = 123 number of columns = 7 index size = 118 }
{ unload file name = oecit00306.unl number of rows = 0 }

create table "maxmast".oecit 
  (
    oecit_account char(10) not null ,
    oecit_custitem char(36) not null ,
    oecit_item char(15) not null ,
    oecit_custdesc char(33) not null ,
    oecit_lud date not null ,
    oecit_lui char(10) not null ,
    oecit_prodgroup char(15) not null 
  );
revoke all on "maxmast".oecit from "public";

create unique index "maxmast".oecit_key on "maxmast".oecit (oecit_account,
    oecit_custitem);
create index "maxmast".oecit_key1 on "maxmast".oecit (oecit_account,
    oecit_item);
{ TABLE "maxmast".oeclk row size = 49 number of columns = 8 index size = 49 }
{ unload file name = oeclk00307.unl number of rows = 0 }

create table "maxmast".oeclk 
  (
    oeclk_account char(10) not null ,
    oeclk_ponum char(15) not null ,
    oeclk_linnum integer not null ,
    oeclk_linecode char(1) not null ,
    oeclk_lud date not null ,
    oeclk_lui char(10) not null ,
    oeclk_updflag integer not null ,
    oeclk_deltype char(1) not null 
  );
revoke all on "maxmast".oeclk from "public";

create unique index "maxmast".oeclk_key on "maxmast".oeclk (oeclk_account,
    oeclk_ponum,oeclk_linnum);
{ TABLE "maxmast".oecmt row size = 116 number of columns = 13 index size = 24 }
{ unload file name = oecmt00310.unl number of rows = 0 }

create table "maxmast".oecmt 
  (
    oecmt_ordnum char(8) not null ,
    oecmt_linnum integer not null ,
    oecmt_linkfrm integer not null ,
    oecmt_lud date not null ,
    oecmt_lui char(10) not null ,
    oecmt_comm1 char(40) not null ,
    oecmt_comm2 char(40) not null ,
    oecmt_linestat char(1) not null ,
    oecmt_ordack char(1) not null ,
    oecmt_picklist char(1) not null ,
    oecmt_despnote char(1) not null ,
    oecmt_invoice char(1) not null ,
    oecmt_userfld char(1) not null 
  );
revoke all on "maxmast".oecmt from "public";

create unique index "maxmast".oecmt_key on "maxmast".oecmt (oecmt_ordnum,
    oecmt_linnum);
{ TABLE "maxmast".oecpc row size = 54 number of columns = 5 index size = 21 }
{ unload file name = oecpc00311.unl number of rows = 0 }

create table "maxmast".oecpc 
  (
    oecpc_salesoff char(5) not null ,
    oecpc_acctprcat char(5) not null ,
    oecpc_desc char(30) not null ,
    oecpc_lud date not null ,
    oecpc_lui char(10) not null 
  );
revoke all on "maxmast".oecpc from "public";

create unique index "maxmast".oecpc_key on "maxmast".oecpc (oecpc_salesoff,
    oecpc_acctprcat);
{ TABLE "maxmast".oedsc row size = 40 number of columns = 6 index size = 9 }
{ unload file name = oedsc00315.unl number of rows = 0 }

create table "maxmast".oedsc 
  (
    oedsc_discode char(2) not null ,
    oedsc_drate1 float not null ,
    oedsc_drate2 float not null ,
    oedsc_drate3 float not null ,
    oedsc_lud date not null ,
    oedsc_lui char(10) not null 
  );
revoke all on "maxmast".oedsc from "public";

create unique index "maxmast".oedsc_discode on "maxmast".oedsc 
    (oedsc_discode);
{ TABLE "maxmast".oehst row size = 842 number of columns = 91 index size = 166 }
{ unload file name = oehst00317.unl number of rows = 318557 }

create table "maxmast".oehst 
  (
    oehst_serial serial not null ,
    oehst_accman char(10) not null ,
    oehst_account char(10) not null ,
    oehst_anacode char(20) not null ,
    oehst_areaname char(20) not null ,
    oehst_average float not null ,
    oehst_branch char(2) not null ,
    oehst_category char(5) not null ,
    oehst_catname char(30) not null ,
    oehst_cgross float not null ,
    oehst_class1 char(5) not null ,
    oehst_class2 char(5) not null ,
    oehst_class3 char(5) not null ,
    oehst_cldisc float not null ,
    oehst_codisc float not null ,
    oehst_contract char(15) not null ,
    oehst_contype char(1) not null ,
    oehst_cost float not null ,
    oehst_country char(5) not null ,
    oehst_cprice float not null ,
    oehst_ctax float not null ,
    oehst_currcode char(4) not null ,
    oehst_cusreqdte date not null ,
    oehst_custcntry char(5) not null ,
    oehst_custitem char(36) not null ,
    oehst_custype char(1) not null ,
    oehst_deladdcod char(10) not null ,
    oehst_deldate date not null ,
    oehst_delnoteno char(8) not null ,
    oehst_descext char(33) not null ,
    oehst_despdate date not null ,
    oehst_despdellt integer not null ,
    oehst_entdate date not null ,
    oehst_geog char(5) not null ,
    oehst_gross float not null ,
    oehst_grpname char(30) not null ,
    oehst_imclass1 char(2) not null ,
    oehst_imclass2 char(2) not null ,
    oehst_imclass3 char(2) not null ,
    oehst_imclass4 char(2) not null ,
    oehst_imclass5 char(2) not null ,
    oehst_invaddcod char(10) not null ,
    oehst_invaddr1 char(30) not null ,
    oehst_invname char(40) not null ,
    oehst_invdate date not null ,
    oehst_invnum char(10) not null ,
    oehst_item char(15) not null ,
    oehst_itemac char(15) not null ,
    oehst_itemprcat char(5) not null ,
    oehst_ldisc float not null ,
    oehst_linetype char(1) not null ,
    oehst_linnum integer not null ,
    oehst_lud date not null ,
    oehst_lui char(10) not null ,
    oehst_net float not null ,
    oehst_odisc float not null ,
    oehst_oeclass1 char(5) not null ,
    oehst_oeclass2 char(5) not null ,
    oehst_oinvqty float not null ,
    oehst_orddate date not null ,
    oehst_orderno char(10) not null ,
    oehst_ordnum char(8) not null ,
    oehst_ordtype char(1) not null ,
    oehst_orduom char(5) not null ,
    oehst_period integer not null ,
    oehst_ponum char(30) not null ,
    oehst_price float not null ,
    oehst_pricelist char(10) not null ,
    oehst_priceuom char(5) not null ,
    oehst_primerate float not null ,
    oehst_prodgroup char(6) not null ,
    oehst_qtyord float not null ,
    oehst_region char(5) not null ,
    oehst_reqdate date not null ,
    oehst_revcost float not null ,
    oehst_rgnname char(30) not null ,
    oehst_salesman char(10) not null ,
    oehst_sales2man char(10) not null ,
    oehst_salesoff char(5) not null ,
    oehst_sinvqty float not null ,
    oehst_stancost float not null ,
    oehst_stockuom char(5) not null ,
    oehst_store char(5) not null ,
    oehst_tax float not null ,
    oehst_territory char(5) not null ,
    oehst_terrname char(30) not null ,
    oehst_trantype char(1) not null ,
    oehst_type char(5) not null ,
    oehst_typename char(30) not null ,
    oehst_year integer not null ,
    oehst_source char(1) not null 
  );
revoke all on "maxmast".oehst from "public";

create unique index "maxmast".oehst_key on "maxmast".oehst (oehst_account,
    oehst_ordnum,oehst_linnum,oehst_serial);
create unique index "maxmast".oehst_key1 on "maxmast".oehst (oehst_account,
    oehst_item,oehst_orddate,oehst_ordnum,oehst_linnum,oehst_serial);
    
create unique index "maxmast".oehst_key2 on "maxmast".oehst (oehst_orddate,
    oehst_ordnum,oehst_linnum,oehst_serial);
create unique index "maxmast".oehst_serial on "maxmast".oehst 
    (oehst_serial);
{ TABLE "maxmast".oeipc row size = 54 number of columns = 5 index size = 21 }
{ unload file name = oeipc00319.unl number of rows = 0 }

create table "maxmast".oeipc 
  (
    oeipc_salesoff char(5) not null ,
    oeipc_itemprcat char(5) not null ,
    oeipc_desc char(30) not null ,
    oeipc_lud date not null ,
    oeipc_lui char(10) not null 
  );
revoke all on "maxmast".oeipc from "public";

create unique index "maxmast".oeipc_key on "maxmast".oeipc (oeipc_salesoff,
    oeipc_itemprcat);
{ TABLE "maxmast".oensi row size = 146 number of columns = 13 index size = 24 }
{ unload file name = oensi00325.unl number of rows = 219994 }

create table "maxmast".oensi 
  (
    oensi_item char(15) not null ,
    oensi_descext char(33) not null ,
    oensi_decimals integer not null ,
    oensi_suppcode char(10) not null ,
    oensi_lud date not null ,
    oensi_lui char(10) not null ,
    oensi_ordnum char(8) not null ,
    oensi_linnum integer not null ,
    oensi_linestat char(1) not null ,
    oensi_cost float not null ,
    oensi_cdescext char(33) not null ,
    oensi_weight float not null ,
    oensi_commodity char(8) not null 
  );
revoke all on "maxmast".oensi from "public";

create unique index "maxmast".oensi_key on "maxmast".oensi (oensi_ordnum,
    oensi_linnum);
{ TABLE "maxmast".oepak row size = 100 number of columns = 12 index size = 18 }
{ unload file name = oepak00326.unl number of rows = 0 }

create table "maxmast".oepak 
  (
    oepak_type char(8) not null ,
    oepak_descrip char(20) not null ,
    oepak_length float not null ,
    oepak_width float not null ,
    oepak_height float not null ,
    oepak_volume float not null ,
    oepak_gross float not null ,
    oepak_tare float not null ,
    oepak_sergroup char(6) not null ,
    oepak_lud date not null ,
    oepak_lui char(10) not null ,
    oepak_items integer not null 
  );
revoke all on "maxmast".oepak from "public";

create unique index "maxmast".oepak_type on "maxmast".oepak (oepak_type);
    
{ TABLE "maxmast".oepck row size = 116 number of columns = 16 index size = 117 }
{ unload file name = oepck00328.unl number of rows = 0 }

create table "maxmast".oepck 
  (
    oepck_ordnum char(8) not null ,
    oepck_linnum integer not null ,
    oepck_link integer not null ,
    oepck_pickno integer not null ,
    oepck_pickdate date not null ,
    oepck_store char(5) not null ,
    oepck_delroute char(10) not null ,
    oepck_account char(10) not null ,
    oepck_salesoff char(5) not null ,
    oepck_binloc char(15) not null ,
    oepck_item char(15) not null ,
    oepck_pickqty float not null ,
    oepck_carton char(6) not null ,
    oepck_serial serial not null ,
    oepck_lud date not null ,
    oepck_lui char(10) not null 
  );
revoke all on "maxmast".oepck from "public";

create unique index "maxmast".oepck_key on "maxmast".oepck (oepck_pickno,
    oepck_serial);
create index "maxmast".oepck_key2 on "maxmast".oepck (oepck_item,
    oepck_ordnum);
create unique index "maxmast".oepck_key3 on "maxmast".oepck (oepck_ordnum,
    oepck_item,oepck_serial);
create unique index "maxmast".oepck_serial on "maxmast".oepck 
    (oepck_serial);
{ TABLE "maxmast".oeplst row size = 86 number of columns = 12 index size = 51 }
{ unload file name = oepls00331.unl number of rows = 47565 }

create table "maxmast".oeplst 
  (
    oepl_salesoff char(5) not null ,
    oepl_pricelist char(10) not null ,
    oepl_item char(15) not null ,
    oepl_pcheff date not null ,
    oepl_pchgpv char(1) not null ,
    oepl_pchgam float not null ,
    oepl_priceuom char(5) not null ,
    oepl_comcd char(1) not null ,
    oepl_itemac char(15) not null ,
    oepl_lud date not null ,
    oepl_lui char(10) not null ,
    oepl_price float not null 
  );
revoke all on "maxmast".oeplst from "public";

create unique index "maxmast".oepl_key on "maxmast".oeplst (oepl_salesoff,
    oepl_pricelist,oepl_item);
{ TABLE "maxmast".oeqbd row size = 227 number of columns = 25 index size = 136 }
{ unload file name = oeqbd00332.unl number of rows = 0 }

create table "maxmast".oeqbd 
  (
    oeqbd_salesoff char(5) not null ,
    oeqbd_pricelist char(10) not null ,
    oeqbd_account char(10) not null ,
    oeqbd_acctprcat char(5) not null ,
    oeqbd_item char(15) not null ,
    oeqbd_itemprcat char(5) not null ,
    oeqbd_ondate date not null ,
    oeqbd_offdate date not null ,
    oeqbd_qbtype char(1) not null ,
    oeqbd_price float not null ,
    oeqbd_priceuom char(5) not null ,
    oeqbd_discode char(2) not null ,
    oeqbd_drate1 float not null ,
    oeqbd_drate2 float not null ,
    oeqbd_drate3 float not null ,
    oeqbd_qbvalue float not null ,
    oeqbd_comcd char(1) not null ,
    oeqbd_itemac char(15) not null ,
    oeqbd_discntac char(15) not null ,
    oeqbd_lud date not null ,
    oeqbd_lui char(10) not null ,
    oeqbd_onqtybrk float not null ,
    oeqbd_offqtybrk float not null ,
    oeqbd_karea1 char(15) not null ,
    oeqbd_karea2 char(45) not null 
  );
revoke all on "maxmast".oeqbd from "public";

create unique index "maxmast".oeqbd_key on "maxmast".oeqbd (oeqbd_salesoff,
    oeqbd_pricelist,oeqbd_karea1,oeqbd_karea2,oeqbd_ondate,oeqbd_offqtybrk);
    
{ TABLE "maxmast".oeqnh row size = 163 number of columns = 17 index size = 24 }
{ unload file name = oeqnh00333.unl number of rows = 0 }

create table "maxmast".oeqnh 
  (
    oeqnh_ordnum char(8) not null ,
    oeqnh_linnum integer not null ,
    oeqnh_linecode char(2) not null ,
    oeqnh_item char(15) not null ,
    oeqnh_qtyord float not null ,
    oeqnh_price float not null ,
    oeqnh_value float not null ,
    oeqnh_status char(1) not null ,
    oeqnh_desc char(40) not null ,
    oeqnh_account char(10) not null ,
    oeqnh_expirydte date not null ,
    oeqnh_reason char(1) not null ,
    oeqnh_contract char(15) not null ,
    oeqnh_telephone char(20) not null ,
    oeqnh_sopordnum char(10) not null ,
    oeqnh_soplinnum integer not null ,
    oeqnh_chgetype char(5) not null 
  );
revoke all on "maxmast".oeqnh from "public";

create unique index "maxmast".oeqnh_key on "maxmast".oeqnh (oeqnh_ordnum,
    oeqnh_linnum);
{ TABLE "maxmast".oeref row size = 41 number of columns = 5 index size = 16 }
{ unload file name = oeref00334.unl number of rows = 10 }

create table "maxmast".oeref 
  (
    oeref_rtype char(2) not null ,
    oeref_rcode char(5) not null ,
    oeref_rtext char(20) not null ,
    oeref_lud date not null ,
    oeref_lui char(10) not null 
  );
revoke all on "maxmast".oeref from "public";

create unique index "maxmast".oeref_key on "maxmast".oeref (oeref_rtype,
    oeref_rcode);
{ TABLE "maxmast".oescm row size = 97 number of columns = 5 index size = 10 }
{ unload file name = oescm00335.unl number of rows = 0 }

create table "maxmast".oescm 
  (
    oescm_comcode char(3) not null ,
    oescm_lud date not null ,
    oescm_lui char(10) not null ,
    oescm_comm1 char(40) not null ,
    oescm_comm2 char(40) not null 
  );
revoke all on "maxmast".oescm from "public";

create unique index "maxmast".oescm_comcode on "maxmast".oescm 
    (oescm_comcode);
{ TABLE "maxmast".oeslm row size = 96 number of columns = 12 index size = 21 }
{ unload file name = oeslm00337.unl number of rows = 1 }

create table "maxmast".oeslm 
  (
    oeslm_salesoff char(5) not null ,
    oeslm_salesman char(10) not null ,
    oeslm_nadmas char(10) not null ,
    oeslm_terrman char(10) not null ,
    oeslm_teritory char(10) not null ,
    oeslm_geog char(5) not null ,
    oeslm_salestot float not null ,
    oeslm_salescom float not null ,
    oeslm_ysalestot float not null ,
    oeslm_ycomsales float not null ,
    oeslm_lud date not null ,
    oeslm_lui char(10) not null 
  );
revoke all on "maxmast".oeslm from "public";

create unique index "maxmast".oeslm_salesman on "maxmast".oeslm 
    (oeslm_salesman);
{ TABLE "maxmast".oespd row size = 173 number of columns = 17 index size = 124 }
{ unload file name = oespd00338.unl number of rows = 0 }

create table "maxmast".oespd 
  (
    oespd_salesoff char(5) not null ,
    oespd_pricelist char(10) not null ,
    oespd_account char(10) not null ,
    oespd_acctprcat char(5) not null ,
    oespd_item char(15) not null ,
    oespd_itemprcat char(5) not null ,
    oespd_ondate date not null ,
    oespd_offdate date not null ,
    oespd_discode char(2) not null ,
    oespd_drate1 float not null ,
    oespd_drate3 float not null ,
    oespd_discntac char(15) not null ,
    oespd_lud date not null ,
    oespd_lui char(10) not null ,
    oespd_drate2 float not null ,
    oespd_karea1 char(15) not null ,
    oespd_karea2 char(45) not null 
  );
revoke all on "maxmast".oespd from "public";

create unique index "maxmast".oespd_key on "maxmast".oespd (oespd_salesoff,
    oespd_pricelist,oespd_karea1,oespd_karea2,oespd_ondate);
{ TABLE "maxmast".oespp row size = 111 number of columns = 14 index size = 79 }
{ unload file name = oespp00339.unl number of rows = 0 }

create table "maxmast".oespp 
  (
    oespp_salesoff char(5) not null ,
    oespp_pricelist char(10) not null ,
    oespp_account char(10) not null ,
    oespp_acctprcat char(5) not null ,
    oespp_item char(15) not null ,
    oespp_ondate date not null ,
    oespp_offdate date not null ,
    oespp_price float not null ,
    oespp_priceuom char(5) not null ,
    oespp_comcd char(1) not null ,
    oespp_itemac char(15) not null ,
    oespp_lud date not null ,
    oespp_lui char(10) not null ,
    oespp_karea1 char(15) not null 
  );
revoke all on "maxmast".oespp from "public";

create unique index "maxmast".oespp_key on "maxmast".oespp (oespp_salesoff,
    oespp_pricelist,oespp_karea1,oespp_item,oespp_ondate);
{ TABLE "maxmast".oespr row size = 150 number of columns = 39 index size = 58 }
{ unload file name = oespr00340.unl number of rows = 0 }

create table "maxmast".oespr 
  (
    oespr_item char(15) not null ,
    oespr_promcode char(2) not null ,
    oespr_prcblock char(1) not null ,
    oespr_pcheff date not null ,
    oespr_pchgpv char(1) not null ,
    oespr_pchgam float not null ,
    oespr_price0 float not null ,
    oespr_basis0 char(1) not null ,
    oespr_price1 float not null ,
    oespr_comcd1 char(1) not null ,
    oespr_basis1 char(1) not null ,
    oespr_price2 float not null ,
    oespr_comcd2 char(1) not null ,
    oespr_basis2 char(1) not null ,
    oespr_price3 float not null ,
    oespr_comcd3 char(1) not null ,
    oespr_basis3 char(1) not null ,
    oespr_price4 float not null ,
    oespr_comcd4 char(1) not null ,
    oespr_basis4 char(1) not null ,
    oespr_price5 float not null ,
    oespr_comcd5 char(1) not null ,
    oespr_basis5 char(1) not null ,
    oespr_price6 float not null ,
    oespr_comcd6 char(1) not null ,
    oespr_basis6 char(1) not null ,
    oespr_price7 float not null ,
    oespr_comcd7 char(1) not null ,
    oespr_basis7 char(1) not null ,
    oespr_price8 float not null ,
    oespr_comcd8 char(1) not null ,
    oespr_basis8 char(1) not null ,
    oespr_price9 float not null ,
    oespr_comcd9 char(1) not null ,
    oespr_basis9 char(1) not null ,
    oespr_lui char(10) not null ,
    oespr_lud date not null ,
    oespr_comcd0 char(1) not null ,
    oespr_salesoff char(5) not null 
  );
revoke all on "maxmast".oespr from "public";

create unique index "maxmast".oespr_key on "maxmast".oespr (oespr_salesoff,
    oespr_item,oespr_promcode,oespr_prcblock);
create index "maxmast".oespr_key1 on "maxmast".oespr (oespr_salesoff,
    oespr_promcode,oespr_prcblock);
{ TABLE "maxmast".oesrn row size = 142 number of columns = 18 index size = 204 }
{ unload file name = oesrn00341.unl number of rows = 0 }

create table "maxmast".oesrn 
  (
    oesrn_ordnum char(8) not null ,
    oesrn_linnum integer not null ,
    oesrn_mprserial integer not null ,
    oesrn_item char(15) not null ,
    oesrn_serno char(15) not null ,
    oesrn_sernoend char(15) not null ,
    oesrn_tracecode char(1) not null ,
    oesrn_quantity float not null ,
    oesrn_lud date not null ,
    oesrn_lui char(10) not null ,
    oesrn_serial serial not null ,
    oesrn_archive char(1) not null ,
    oesrn_bin char(15) not null ,
    oesrn_compline integer not null ,
    oesrn_user1 float not null ,
    oesrn_user2 float not null ,
    oesrn_user3 float not null ,
    oesrn_user4 char(10) not null 
  );
revoke all on "maxmast".oesrn from "public";

create unique index "maxmast".oesrn_key on "maxmast".oesrn (oesrn_serno,
    oesrn_serial);
create unique index "maxmast".oesrn_key1 on "maxmast".oesrn (oesrn_ordnum,
    oesrn_linnum,oesrn_mprserial,oesrn_serial);
create unique index "maxmast".oesrn_key2 on "maxmast".oesrn (oesrn_item,
    oesrn_serno,oesrn_serial);
create unique index "maxmast".oesrn_key3 on "maxmast".oesrn (oesrn_ordnum,
    oesrn_linnum,oesrn_mprserial,oesrn_compline,oesrn_serno,oesrn_serial);
    
create unique index "maxmast".oesrn_serial on "maxmast".oesrn 
    (oesrn_serial);
{ TABLE "maxmast".omac row size = 31 number of columns = 4 index size = 0 }
{ unload file name = omac_00343.unl number of rows = 1364 }

create table "maxmast".omac 
  (
    item char(15),
    stk char(4),
    wip char(4),
    cost float
  );
revoke all on "maxmast".omac from "public";

{ TABLE "maxmast".paper row size = 27 number of columns = 8 index size = 13 }
{ unload file name = paper00345.unl number of rows = 0 }

create table "maxmast".paper 
  (
    ps_printst char(5) not null ,
    ps_pagelen integer not null ,
    ps_printlen integer not null ,
    ps_linelen integer not null ,
    ps_test char(1) not null ,
    ps_topmargin integer not null ,
    ps_botmargin integer not null ,
    ps_matchtype char(1) not null 
  );
revoke all on "maxmast".paper from "public";

create unique index "maxmast".ps_printst on "maxmast".paper (ps_printst);
    
{ TABLE "maxmast".pfield row size = 69 number of columns = 18 index size = 39 }
{ unload file name = pfiel00346.unl number of rows = 0 }

create table "maxmast".pfield 
  (
    pf_lang char(4) not null ,
    pf_report char(9) not null ,
    pf_stream char(5) not null ,
    pf_seq integer not null ,
    pf_field char(9) not null ,
    pf_hpos integer not null ,
    pf_vpos integer not null ,
    pf_prtsize integer not null ,
    pf_mode char(1) not null ,
    pf_negflg char(1) not null ,
    pf_minus char(1) not null ,
    pf_decimals char(1) not null ,
    pf_roundir char(1) not null ,
    pf_zero char(1) not null ,
    pf_valid char(9) not null ,
    pf_justify char(1) not null ,
    pf_dateform char(1) not null ,
    pf_npkey char(9) not null 
  );
revoke all on "maxmast".pfield from "public";

create unique index "maxmast".pf_key on "maxmast".pfield (pf_lang,
    pf_report,pf_stream,pf_seq);
{ TABLE "maxmast".plosb row size = 46 number of columns = 6 index size = 27 }
{ unload file name = plosb00352.unl number of rows = 171 }

create table "maxmast".plosb 
  (
    plosb_supplier char(10) not null ,
    plosb_currency char(4) not null ,
    plosb_balance float not null ,
    plosb_baseval float not null ,
    plosb_euroval float not null ,
    plosb_cumturn float not null 
  );
revoke all on "maxmast".plosb from "public";

create unique index "maxmast".plosb_key on "maxmast".plosb (plosb_supplier,
    plosb_currency);
{ TABLE "maxmast".plpen row size = 37 number of columns = 4 index size = 21 }
{ unload file name = plpen00354.unl number of rows = 0 }

create table "maxmast".plpen 
  (
    plpen_supplier char(10) not null ,
    plpen_rate float not null ,
    plpen_account char(15) not null ,
    plpen_lpendate integer not null 
  );
revoke all on "maxmast".plpen from "public";

create unique index "maxmast".plpen_supplier on "maxmast".plpen 
    (plpen_supplier);
{ TABLE "maxmast".pltx2 row size = 47 number of columns = 8 index size = 46 }
{ unload file name = pltx200360.unl number of rows = 0 }

create table "maxmast".pltx2 
  (
    pltx2_supplier char(10) not null ,
    pltx2_trandate date not null ,
    pltx2_ourref char(8) not null ,
    pltx2_type char(1) not null ,
    pltx2_seq integer not null ,
    pltx2_branch char(4) not null ,
    pltx2_value float not null ,
    pltx2_discount float not null 
  );
revoke all on "maxmast".pltx2 from "public";

create unique index "maxmast".pltx2_key1 on "maxmast".pltx2 (pltx2_supplier,
    pltx2_trandate,pltx2_ourref,pltx2_type,pltx2_seq);
{ TABLE "maxmast".pmask row size = 40 number of columns = 13 index size = 54 }
{ unload file name = pmask00361.unl number of rows = 0 }

create table "maxmast".pmask 
  (
    pm_report char(9) not null ,
    pm_stream char(5) not null ,
    pm_type char(1) not null ,
    pm_lines integer not null ,
    pm_hpos integer not null ,
    pm_text char(1) not null ,
    pm_print char(1) not null ,
    pm_cols integer not null ,
    pm_sense char(1) not null ,
    pm_repeats integer not null ,
    pm_squash char(1) not null ,
    pm_leave integer not null ,
    pm_newpage char(1) not null 
  );
revoke all on "maxmast".pmask from "public";

create unique index "maxmast".pm_key on "maxmast".pmask (pm_report,
    pm_stream);
create index "maxmast".pm_key2 on "maxmast".pmask (pm_stream,pm_report);
    
{ TABLE "maxmast".prdata row size = 48 number of columns = 10 index size = 75 }
{ unload file name = prdat00362.unl number of rows = 0 }

create table "maxmast".prdata 
  (
    px_stream char(5) not null ,
    px_field char(9) not null ,
    px_type char(1) not null ,
    px_strtype char(1) not null ,
    px_strsize integer not null ,
    px_disp integer not null ,
    px_pointer char(9) not null ,
    px_userflag char(1) not null ,
    px_object char(9) not null ,
    px_owner char(5) not null 
  );
revoke all on "maxmast".prdata from "public";

create index "maxmast".px_field on "maxmast".prdata (px_field);
    
create unique index "maxmast".px_key on "maxmast".prdata (px_stream,
    px_field);
create unique index "maxmast".px_userkey on "maxmast".prdata (px_stream,
    px_userflag,px_field);
{ TABLE "maxmast".printdev row size = 113 number of columns = 11 index size = 39 
              }
{ unload file name = print00364.unl number of rows = 0 }

create table "maxmast".printdev 
  (
    pd_printid char(8) not null ,
    pd_printyp char(5) not null ,
    pd_printst char(5) not null ,
    pd_route char(40) not null ,
    pd_status char(1) not null ,
    pd_wait char(1) not null ,
    pd_type char(1) not null ,
    pd_lockfile char(40) not null ,
    pd_formlen integer not null ,
    pd_jobno integer not null ,
    pd_pid integer not null 
  );
revoke all on "maxmast".printdev from "public";

create unique index "maxmast".pd_printid on "maxmast".printdev 
    (pd_printid);
create index "maxmast".pd_printyp on "maxmast".printdev (pd_printyp);
    
create index "maxmast".pd_status on "maxmast".printdev (pd_status);
    
{ TABLE "maxmast".printque row size = 156 number of columns = 25 index size = 112 
              }
{ unload file name = print00365.unl number of rows = 0 }

create table "maxmast".printque 
  (
    pq_serial integer not null ,
    pq_printmsk char(9) not null ,
    pq_printid char(8) not null ,
    pq_printyp char(5) not null ,
    pq_printst char(5) not null ,
    pq_ncopies integer not null ,
    pq_dsave integer not null ,
    pq_userid char(10) not null ,
    pq_lang char(4) not null ,
    pq_termid char(8) not null ,
    pq_progid char(8) not null ,
    pq_priority char(1) not null ,
    pq_start integer not null ,
    pq_end integer not null ,
    pq_pstatus char(1) not null ,
    pq_spoint char(10) not null ,
    pq_xpoint char(10) not null ,
    pq_current char(10) not null ,
    pq_username char(30) not null ,
    pq_coid char(4) not null ,
    pq_dateseq char(1) not null ,
    pq_datedel char(1) not null ,
    pq_minus char(1) not null ,
    pq_punc char(1) not null ,
    pq_banner char(9) not null 
  );
revoke all on "maxmast".printque from "public";

create unique index "maxmast".pq_key on "maxmast".printque (pq_pstatus,
    pq_serial);
create unique index "maxmast".pq_key2 on "maxmast".printque (pq_progid,
    pq_pstatus,pq_serial);
create unique index "maxmast".pq_key3 on "maxmast".printque (pq_printid,
    pq_pstatus,pq_serial);
create unique index "maxmast".pq_key4 on "maxmast".printque (pq_userid,
    pq_pstatus,pq_serial);
create index "maxmast".pq_pstatus on "maxmast".printque (pq_pstatus);
    
create unique index "maxmast".pq_serial on "maxmast".printque 
    (pq_serial);
{ TABLE "maxmast".pst row size = 194 number of columns = 19 index size = 166 }
{ unload file name = pst__00369.unl number of rows = 19398 }

create table "maxmast".pst 
  (
    pst_paritem char(15) not null ,
    pst_lineno integer not null ,
    pst_ondate date not null ,
    pst_detitem char(15) not null ,
    pst_offdate date not null ,
    pst_noff float not null ,
    pst_noffuom char(5) not null ,
    pst_intromod char(10) not null ,
    pst_termod char(10) not null ,
    pst_eremarks char(63) not null ,
    pst_lud date not null ,
    pst_lui char(10) not null ,
    pst_wastepc float not null ,
    pst_ppf float not null ,
    pst_advance integer not null ,
    pst_opno char(5) not null ,
    pst_indmps char(1) not null ,
    pst_procsoppf char(1) not null ,
    pst_orgitem char(15) not null 
  );
revoke all on "maxmast".pst from "public";

create unique index "maxmast".pst_main_key on "maxmast".pst (pst_paritem,
    pst_lineno,pst_ondate);
create unique index "maxmast".pst_orgkey on "maxmast".pst (pst_orgitem,
    pst_paritem,pst_lineno,pst_ondate);
create unique index "maxmast".pst_uokey on "maxmast".pst (pst_detitem,
    pst_paritem,pst_lineno,pst_ondate);
{ TABLE "maxmast".pstrl row size = 35 number of columns = 5 index size = 40 }
{ unload file name = pstrl00370.unl number of rows = 0 }

create table "maxmast".pstrl 
  (
    pstrl_paritem char(15) not null ,
    pstrl_lineno integer not null ,
    pstrl_ondate date not null ,
    pstrl_source char(8) not null ,
    pstrl_lud date not null 
  );
revoke all on "maxmast".pstrl from "public";

create unique index "maxmast".pstrl_key on "maxmast".pstrl (pstrl_paritem,
    pstrl_lineno,pstrl_ondate);
{ TABLE "maxmast".puldel row size = 306 number of columns = 37 index size = 90 }
{ unload file name = pulde00372.unl number of rows = 3049 }

create table "maxmast".puldel 
  (
    puld_orderno char(10) not null ,
    puld_ordline integer not null ,
    puld_item char(15) not null ,
    puld_supplier char(10) not null ,
    puld_branch char(4) not null ,
    puld_stocked char(1) not null ,
    puld_desckey char(8) not null ,
    puld_descext char(33) not null ,
    puld_price float not null ,
    puld_deluom char(5) not null ,
    puld_scrappc float not null ,
    puld_terms char(10) not null ,
    puld_completed char(1) not null ,
    puld_lastprice float not null ,
    puld_lastpaid date not null ,
    puld_lud date not null ,
    puld_lui char(10) not null ,
    puld_linecost float not null ,
    puld_priceuom char(5) not null ,
    puld_decimals integer not null ,
    puld_status char(1) not null ,
    puld_insppc float not null ,
    puld_blanket char(1) not null ,
    puld_suptime integer not null ,
    puld_partno char(20) not null ,
    puld_puaccount char(15) not null ,
    puld_sdesckey char(8) not null ,
    puld_sdescext char(33) not null ,
    puld_valuelim float not null ,
    puld_qtylim float not null ,
    puld_datelim date not null ,
    puld_country char(5) not null ,
    puld_commodity char(8) not null ,
    puld_weight float not null ,
    puld_termcode char(10) not null ,
    puld_type char(1) not null ,
    puld_sequence serial not null 
  );
revoke all on "maxmast".puldel from "public";

create index "maxmast".puld_desckey on "maxmast".puldel (puld_desckey);
    
create unique index "maxmast".puld_key on "maxmast".puldel (puld_orderno,
    puld_ordline,puld_sequence);
create index "maxmast".puld_orderno on "maxmast".puldel (puld_orderno);
    
create index "maxmast".puld_sdesckey on "maxmast".puldel (puld_sdesckey);
    
{ TABLE "maxmast".puold row size = 91 number of columns = 14 index size = 33 }
{ unload file name = puold00374.unl number of rows = 63 }

create table "maxmast".puold 
  (
    puold_orderno char(10) not null ,
    puold_ordline integer not null ,
    puold_release integer not null ,
    puold_deldate date not null ,
    puold_delqty float not null ,
    puold_duedate date not null ,
    puold_qtyscrap float not null ,
    puold_lud date not null ,
    puold_lui char(10) not null ,
    puold_qtygood float not null ,
    puold_qtyreturn float not null ,
    puold_qtyinsp float not null ,
    puold_completed char(1) not null ,
    puold_remarks char(10) not null 
  );
revoke all on "maxmast".puold from "public";

create unique index "maxmast".puold_key on "maxmast".puold (puold_orderno,
    puold_ordline,puold_release);
{ TABLE "maxmast".puord row size = 295 number of columns = 43 index size = 91 }
{ unload file name = puord00375.unl number of rows = 13471 }

create table "maxmast".puord 
  (
    puord_orderno char(10) not null ,
    puord_supplier char(10) not null ,
    puord_branch char(4) not null ,
    puord_supref char(15) not null ,
    puord_ndcode char(10) not null ,
    puord_currency char(4) not null ,
    puord_stdterms char(10) not null ,
    puord_terms char(10) not null ,
    puord_pustore char(5) not null ,
    puord_puaccount char(5) not null ,
    puord_puscrapst char(5) not null ,
    puord_puscacct char(5) not null ,
    puord_printdate date not null ,
    puord_ackdate date not null ,
    puord_manfac char(5) not null ,
    puord_buyer char(3) not null ,
    puord_completed char(1) not null ,
    puord_stage char(2) not null ,
    puord_scndcode char(10) not null ,
    puord_remarks char(56) not null ,
    puord_lud date not null ,
    puord_lui char(10) not null ,
    puord_buyername char(20) not null ,
    puord_reprint char(1) not null ,
    puord_ordtype char(1) not null ,
    puord_status char(1) not null ,
    puord_cost float not null ,
    puord_issuedate date not null ,
    puord_dndcode char(10) not null ,
    puord_amendno integer not null ,
    puord_reqn char(1) not null ,
    puord_termcode char(10) not null ,
    puord_hcpo char(1) not null ,
    puord_faxpo char(1) not null ,
    puord_edipo char(1) not null ,
    puord_edidate date not null ,
    puord_editime integer not null ,
    puord_workcen char(5) not null ,
    puord_qtylim float not null ,
    puord_qlimuom char(5) not null ,
    puord_wkcenrate float not null ,
    puord_wkcenunit char(5) not null ,
    puord_amendflg char(1) not null 
  );
revoke all on "maxmast".puord from "public";

create unique index "maxmast".puord_orderno on "maxmast".puord 
    (puord_orderno);
create unique index "maxmast".puord_supkey on "maxmast".puord 
    (puord_supplier,puord_branch,puord_orderno);
create index "maxmast".puord_supref on "maxmast".puord (puord_supref);
    
{ TABLE "maxmast".pupdi row size = 98 number of columns = 13 index size = 99 }
{ unload file name = pupdi00376.unl number of rows = 0 }

create table "maxmast".pupdi 
  (
    pupdi_supplier char(10) not null ,
    pupdi_branch char(4) not null ,
    pupdi_delnote char(15) not null ,
    pupdi_item char(15) not null ,
    pupdi_orderno char(10) not null ,
    pupdi_ordline integer not null ,
    pupdi_release integer not null ,
    pupdi_procdate date not null ,
    pupdi_despdate date not null ,
    pupdi_despqty float not null ,
    pupdi_rcvdate date not null ,
    pupdi_qtygood float not null ,
    pupdi_qtyreturn float not null 
  );
revoke all on "maxmast".pupdi from "public";

create unique index "maxmast".pupdi_key on "maxmast".pupdi (pupdi_supplier,
    pupdi_branch,pupdi_delnote,pupdi_item,pupdi_orderno,pupdi_ordline,
    pupdi_release);
{ TABLE "maxmast".purem row size = 74 number of columns = 4 index size = 60 }
{ unload file name = purem00378.unl number of rows = 11 }

create table "maxmast".purem 
  (
    purem_orderno char(10) not null ,
    purem_ordline integer not null ,
    purem_sequence integer not null ,
    purem_remarks char(56) not null 
  );
revoke all on "maxmast".purem from "public";

create unique index "maxmast".purem_key on "maxmast".purem (purem_orderno,
    purem_ordline,purem_sequence);
create index "maxmast".purem_linekey on "maxmast".purem (purem_orderno,
    purem_ordline);
{ TABLE "maxmast".ref row size = 97 number of columns = 7 index size = 76 }
{ unload file name = ref__00380.unl number of rows = 0 }

create table "maxmast".ref 
  (
    ref_lang char(4) not null ,
    ref_prefix char(1) not null ,
    ref_code char(9) not null ,
    ref_seq char(1) not null ,
    ref_severe char(1) not null ,
    ref_text char(80) not null ,
    ref_cont char(1) not null 
  );
revoke all on "maxmast".ref from "public";

create index "maxmast".ref_code on "maxmast".ref (ref_code);
create unique index "maxmast".ref_key on "maxmast".ref (ref_lang,
    ref_prefix,ref_code,ref_seq);
create unique index "maxmast".ref_key2 on "maxmast".ref (ref_lang,
    ref_code,ref_prefix,ref_seq);
{ TABLE "maxmast".reflog row size = 42 number of columns = 7 index size = 22 }
{ unload file name = reflo00381.unl number of rows = 143 }

create table "maxmast".reflog 
  (
    rfl_reftype char(1) not null ,
    rfl_reference char(10) not null ,
    rfl_userid char(10) not null ,
    rfl_progid char(8) not null ,
    rfl_termid char(8) not null ,
    rfl_source char(1) not null ,
    rfl_logdate date not null 
  );
revoke all on "maxmast".reflog from "public";

create unique index "maxmast".rfl_key on "maxmast".reflog (rfl_reftype,
    rfl_reference);
{ TABLE "maxmast".respln1 row size = 51 number of columns = 7 index size = 28 }
{ unload file name = respl00382.unl number of rows = 1948 }

create table "maxmast".respln1 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer
  );
revoke all on "maxmast".respln1 from "public";

create index "maxmast".ix649_1 on "maxmast".respln1 (rp_item);
    
{ TABLE "maxmast".respln2 row size = 51 number of columns = 7 index size = 28 }
{ unload file name = respl00383.unl number of rows = 4151 }

create table "maxmast".respln2 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer
  );
revoke all on "maxmast".respln2 from "public";

create index "maxmast".ix639_1 on "maxmast".respln2 (rp_item);
    
{ TABLE "maxmast".respln3 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00384.unl number of rows = 12476 }

create table "maxmast".respln3 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln3 from "public";

create index "maxmast".ix641_1 on "maxmast".respln3 (rp_item);
    
{ TABLE "maxmast".respln4 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00385.unl number of rows = 12494 }

create table "maxmast".respln4 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln4 from "public";

create index "maxmast".ix642_1 on "maxmast".respln4 (rp_item);
    
{ TABLE "maxmast".respln5 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00386.unl number of rows = 1752 }

create table "maxmast".respln5 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln5 from "public";

create index "maxmast".ix643_1 on "maxmast".respln5 (rp_item);
    
{ TABLE "maxmast".respln6 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00387.unl number of rows = 1199 }

create table "maxmast".respln6 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln6 from "public";

create index "maxmast".ix644_1 on "maxmast".respln6 (rp_item);
    
{ TABLE "maxmast".respln7 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00388.unl number of rows = 78 }

create table "maxmast".respln7 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln7 from "public";

create index "maxmast".ix645_1 on "maxmast".respln7 (rp_item);
    
{ TABLE "maxmast".respln8 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00389.unl number of rows = 0 }

create table "maxmast".respln8 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln8 from "public";

create index "maxmast".ix646_1 on "maxmast".respln8 (rp_item);
    
{ TABLE "maxmast".respln9 row size = 52 number of columns = 8 index size = 28 }
{ unload file name = respl00390.unl number of rows = 0 }

create table "maxmast".respln9 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln9 from "public";

create index "maxmast".ix647_1 on "maxmast".respln9 (rp_item);
    
{ TABLE "maxmast".respln row size = 52 number of columns = 8 index size = 70 }
{ unload file name = respl00392.unl number of rows = 34098 }

create table "maxmast".respln 
  (
    rp_item char(15) not null ,
    rp_duedate date,
    rp_dueqty integer,
    rp_type integer,
    rp_wordno char(10),
    rp_acc char(10),
    rp_leadtime integer,
    rp_makebuy char(1)
  );
revoke all on "maxmast".respln from "public";

create index "maxmast".ix636_1 on "maxmast".respln (rp_item);
create index "maxmast".ix636_5 on "maxmast".respln (rp_wordno);
    
create index "maxmast".ix637_6 on "maxmast".respln (rp_acc);
{ TABLE "maxmast".rthed row size = 147 number of columns = 16 index size = 72 }
{ unload file name = rthed00395.unl number of rows = 14777 }

create table "maxmast".rthed 
  (
    rthed_item char(15) not null ,
    rthed_manfac char(5) not null ,
    rthed_routeid char(5) not null ,
    rthed_lud date not null ,
    rthed_lui char(10) not null ,
    rthed_status char(1) not null ,
    rthed_improver float not null ,
    rthed_timesused integer not null ,
    rthed_resp char(3) not null ,
    rthed_remarks char(56) not null ,
    rthed_supplier char(10) not null ,
    rthed_branch char(4) not null ,
    rthed_opscrap char(1) not null ,
    rthed_serialop char(5) not null ,
    rthed_tbq float not null ,
    rthed_sbq float not null 
  );
revoke all on "maxmast".rthed from "public";

create index "maxmast".rthed_item on "maxmast".rthed (rthed_item);
    
create unique index "maxmast".rthed_key on "maxmast".rthed (rthed_item,
    rthed_manfac,rthed_routeid);
{ TABLE "maxmast".rtmod row size = 96 number of columns = 10 index size = 70 }
{ unload file name = rtmod00396.unl number of rows = 0 }

create table "maxmast".rtmod 
  (
    rtmod_modser char(10) not null ,
    rtmod_item char(15) not null ,
    rtmod_manfac char(5) not null ,
    rtmod_routeid char(5) not null ,
    rtmod_effective date not null ,
    rtmod_shortdesc char(30) not null ,
    rtmod_textref char(10) not null ,
    rtmod_prod char(3) not null ,
    rtmod_lud date not null ,
    rtmod_lui char(10) not null 
  );
revoke all on "maxmast".rtmod from "public";

create unique index "maxmast".rtmod_datekey on "maxmast".rtmod 
    (rtmod_item,rtmod_manfac,rtmod_routeid,rtmod_effective);
create unique index "maxmast".rtmod_modser on "maxmast".rtmod 
    (rtmod_modser);
{ TABLE "maxmast".rtop row size = 242 number of columns = 31 index size = 100 }
{ unload file name = rtop_00397.unl number of rows = 43587 }

create table "maxmast".rtop 
  (
    rtop_item char(15) not null ,
    rtop_manfac char(5) not null ,
    rtop_routeid char(5) not null ,
    rtop_opno char(5) not null ,
    rtop_ondate date not null ,
    rtop_intromod char(10) not null ,
    rtop_offdate date not null ,
    rtop_termod char(10) not null ,
    rtop_shortdesc char(15) not null ,
    rtop_workcen char(5) not null ,
    rtop_settime float not null ,
    rtop_setunit char(1) not null ,
    rtop_proctime float not null ,
    rtop_procunit char(1) not null ,
    rtop_qtime float not null ,
    rtop_qunit char(1) not null ,
    rtop_qoverride char(1) not null ,
    rtop_classcode char(5) not null ,
    rtop_textref char(10) not null ,
    rtop_remarks char(56) not null ,
    rtop_lud date not null ,
    rtop_lui char(10) not null ,
    rtop_tbq float not null ,
    rtop_pbq float not null ,
    rtop_mbq float not null ,
    rtop_sbq float not null ,
    rtop_scrappc float not null ,
    rtop_setmiss char(1) not null ,
    rtop_backflush char(1) not null ,
    rtop_elaptime float not null ,
    rtop_elapunit char(1) not null 
  );
revoke all on "maxmast".rtop from "public";

create index "maxmast".rtop_hedkey on "maxmast".rtop (rtop_item,
    rtop_manfac,rtop_routeid);
create unique index "maxmast".rtop_key on "maxmast".rtop (rtop_item,
    rtop_manfac,rtop_routeid,rtop_opno,rtop_ondate);
{ TABLE "maxmast".rtres row size = 85 number of columns = 14 index size = 136 }
{ unload file name = rtres00398.unl number of rows = 0 }

create table "maxmast".rtres 
  (
    rtres_item char(15) not null ,
    rtres_manfac char(5) not null ,
    rtres_routeid char(5) not null ,
    rtres_opno char(5) not null ,
    rtres_ondate date not null ,
    rtres_resid char(15) not null ,
    rtres_intromod char(10) not null ,
    rtres_offdate date not null ,
    rtres_termod char(10) not null ,
    rtres_resqty float not null ,
    rtres_setres char(1) not null ,
    rtres_procres char(1) not null ,
    rtres_backflush char(1) not null ,
    rtres_moses char(1) not null 
  );
revoke all on "maxmast".rtres from "public";

create unique index "maxmast".rtres_key on "maxmast".rtres (rtres_item,
    rtres_manfac,rtres_routeid,rtres_opno,rtres_ondate,rtres_resid);
    
create index "maxmast".rtres_opkey on "maxmast".rtres (rtres_item,
    rtres_manfac,rtres_routeid,rtres_opno,rtres_ondate);
{ TABLE "maxmast".sakey row size = 131 number of columns = 32 index size = 7 }
{ unload file name = sakey00399.unl number of rows = 0 }

create table "maxmast".sakey 
  (
    sakey_key char(1) not null ,
    sakey_accseq integer not null ,
    sakey_accdsp integer not null ,
    sakey_geogseq integer not null ,
    sakey_geogdsp integer not null ,
    sakey_slmseq integer not null ,
    sakey_slmdsp integer not null ,
    sakey_itemseq integer not null ,
    sakey_itemdsp integer not null ,
    sakey_kywrdseq integer not null ,
    sakey_kywrddsp integer not null ,
    sakey_pgseq integer not null ,
    sakey_pgdsp integer not null ,
    sakey_soseq integer not null ,
    sakey_sodsp integer not null ,
    sakey_prcdseq integer not null ,
    sakey_prcddsp integer not null ,
    sakey_promseq integer not null ,
    sakey_promdsp integer not null ,
    sakey_cls1seq integer not null ,
    sakey_cls1dsp integer not null ,
    sakey_cls2seq integer not null ,
    sakey_cls2dsp integer not null ,
    sakey_cls3seq integer not null ,
    sakey_cls3dsp integer not null ,
    sakey_cls4seq integer not null ,
    sakey_cls4dsp integer not null ,
    sakey_cls5seq integer not null ,
    sakey_cls5dsp integer not null ,
    sakey_lud date not null ,
    sakey_lui char(10) not null ,
    sakey_sapers integer not null 
  );
revoke all on "maxmast".sakey from "public";

create unique index "maxmast".sakey_key on "maxmast".sakey (sakey_key);
    
{ TABLE "maxmast".satrn row size = 692 number of columns = 74 index size = 183 }
{ unload file name = satrn00400.unl number of rows = 0 }

create table "maxmast".satrn 
  (
    satrn_sakey char(114) not null ,
    satrn_saseq integer not null ,
    satrn_qty1 float not null ,
    satrn_qty2 float not null ,
    satrn_qty3 float not null ,
    satrn_qty4 float not null ,
    satrn_qty5 float not null ,
    satrn_qty6 float not null ,
    satrn_qty7 float not null ,
    satrn_qty8 float not null ,
    satrn_qty9 float not null ,
    satrn_qty10 float not null ,
    satrn_qty11 float not null ,
    satrn_qty12 float not null ,
    satrn_qty13 float not null ,
    satrn_qty14 float not null ,
    satrn_val1 float not null ,
    satrn_val2 float not null ,
    satrn_val3 float not null ,
    satrn_val4 float not null ,
    satrn_val5 float not null ,
    satrn_val6 float not null ,
    satrn_val7 float not null ,
    satrn_val8 float not null ,
    satrn_val9 float not null ,
    satrn_val10 float not null ,
    satrn_val11 float not null ,
    satrn_val12 float not null ,
    satrn_val13 float not null ,
    satrn_val14 float not null ,
    satrn_cost1 float not null ,
    satrn_cost2 float not null ,
    satrn_cost3 float not null ,
    satrn_cost4 float not null ,
    satrn_cost5 float not null ,
    satrn_cost6 float not null ,
    satrn_cost7 float not null ,
    satrn_cost8 float not null ,
    satrn_cost9 float not null ,
    satrn_cost10 float not null ,
    satrn_cost11 float not null ,
    satrn_cost12 float not null ,
    satrn_cost13 float not null ,
    satrn_cost14 float not null ,
    satrn_disc1 float not null ,
    satrn_disc2 float not null ,
    satrn_disc3 float not null ,
    satrn_disc4 float not null ,
    satrn_disc5 float not null ,
    satrn_disc6 float not null ,
    satrn_disc7 float not null ,
    satrn_disc8 float not null ,
    satrn_disc9 float not null ,
    satrn_disc10 float not null ,
    satrn_disc11 float not null ,
    satrn_disc12 float not null ,
    satrn_disc13 float not null ,
    satrn_disc14 float not null ,
    satrn_tax1 float not null ,
    satrn_tax2 float not null ,
    satrn_tax3 float not null ,
    satrn_tax4 float not null ,
    satrn_tax5 float not null ,
    satrn_tax6 float not null ,
    satrn_tax7 float not null ,
    satrn_tax8 float not null ,
    satrn_tax9 float not null ,
    satrn_tax10 float not null ,
    satrn_tax11 float not null ,
    satrn_tax12 float not null ,
    satrn_tax13 float not null ,
    satrn_tax14 float not null ,
    satrn_lud date not null ,
    satrn_lui char(10) not null 
  );
revoke all on "maxmast".satrn from "public";

create unique index "maxmast".satrn_key on "maxmast".satrn (satrn_sakey,
    satrn_saseq);
{ TABLE "maxmast".saytd row size = 183 number of columns = 13 index size = 139 }
{ unload file name = saytd00401.unl number of rows = 0 }

create table "maxmast".saytd 
  (
    saytd_sakey char(89) not null ,
    saytd_qtyty float not null ,
    saytd_valty float not null ,
    saytd_costty float not null ,
    saytd_discty float not null ,
    saytd_taxty float not null ,
    saytd_qtyly float not null ,
    saytd_vally float not null ,
    saytd_costly float not null ,
    saytd_discly float not null ,
    saytd_taxly float not null ,
    saytd_lud date not null ,
    saytd_lui char(10) not null 
  );
revoke all on "maxmast".saytd from "public";

create unique index "maxmast".saytd_sakey on "maxmast".saytd (saytd_sakey);
    
{ TABLE "maxmast".sfdata row size = 90 number of columns = 19 index size = 46 }
{ unload file name = sfdat00402.unl number of rows = 0 }

create table "maxmast".sfdata 
  (
    sfd_format char(5) not null ,
    sfd_sequence integer not null ,
    sfd_field char(9) not null ,
    sfd_object char(9) not null ,
    sfd_owner char(5) not null ,
    sfd_prmode char(1) not null ,
    sfd_stmode integer not null ,
    sfd_lgmode integer not null ,
    sfd_lgtype char(1) not null ,
    sfd_skip char(1) not null ,
    sfd_blzero char(1) not null ,
    sfd_dbvinv char(1) not null ,
    sfd_dbval char(9) not null ,
    sfd_dbsel char(9) not null ,
    sfd_defdok char(1) not null ,
    sfd_rkeyok char(1) not null ,
    sfd_decfld char(9) not null ,
    sfd_mandatory char(1) not null ,
    sfd_fkey char(15) not null 
  );
revoke all on "maxmast".sfdata from "public";

create unique index "maxmast".sfd_fldkey on "maxmast".sfdata (sfd_format,
    sfd_field);
create unique index "maxmast".sfd_key on "maxmast".sfdata (sfd_format,
    sfd_sequence);
{ TABLE "maxmast".sffield row size = 207 number of columns = 39 index size = 217 
              }
{ unload file name = sffie00403.unl number of rows = 0 }

create table "maxmast".sffield 
  (
    sff_lang char(4) not null ,
    sff_screen char(9) not null ,
    sff_format char(5) not null ,
    sff_sequence integer not null ,
    sff_field char(9) not null ,
    sff_object char(9) not null ,
    sff_owner char(5) not null ,
    sff_extype char(1) not null ,
    sff_exwidth integer not null ,
    sff_negflg char(1) not null ,
    sff_decplace integer not null ,
    sff_dateform char(1) not null ,
    sff_valtype char(1) not null ,
    sff_valtab char(9) not null ,
    sff_hlpmsg char(9) not null ,
    sff_legend char(9) not null ,
    sff_alphabet char(9) not null ,
    sff_defdat char(9) not null ,
    sff_rkcode char(9) not null ,
    sff_fldrow integer not null ,
    sff_fldcol integer not null ,
    sff_prmode char(1) not null ,
    sff_stmode integer not null ,
    sff_lgmode integer not null ,
    sff_lgtype char(1) not null ,
    sff_skip char(1) not null ,
    sff_blzero char(1) not null ,
    sff_dbvinv char(1) not null ,
    sff_dbval char(9) not null ,
    sff_dbsel char(9) not null ,
    sff_dbtab char(9) not null ,
    sff_dbcol char(9) not null ,
    sff_npkey char(9) not null ,
    sff_npchg char(1) not null ,
    sff_grkey char(9) not null ,
    sff_objval char(1) not null ,
    sff_defact char(1) not null ,
    sff_popupkey char(9) not null ,
    sff_flsql char(9) not null 
  );
revoke all on "maxmast".sffield from "public";

create unique index "maxmast".sff_filkey on "maxmast".sffield 
    (sff_screen,sff_format,sff_lang,sff_field);
create unique index "maxmast".sff_fldkey on "maxmast".sffield 
    (sff_format,sff_field,sff_screen,sff_lang);
create unique index "maxmast".sff_key on "maxmast".sffield (sff_lang,
    sff_screen,sff_format,sff_sequence);
create index "maxmast".sff_legend on "maxmast".sffield (sff_legend);
    
create unique index "maxmast".sff_scrnkey on "maxmast".sffield 
    (sff_screen,sff_format,sff_field,sff_lang);
create index "maxmast".sff_valtab on "maxmast".sffield (sff_valtab);
    
{ TABLE "maxmast".sfmask row size = 75 number of columns = 19 index size = 54 }
{ unload file name = sfmas00404.unl number of rows = 0 }

create table "maxmast".sfmask 
  (
    sfm_screen char(9) not null ,
    sfm_format char(5) not null ,
    sfm_parent char(5) not null ,
    sfm_fmtgrp integer not null ,
    sfm_type char(1) not null ,
    sfm_winorg char(1) not null ,
    sfm_winstyle char(1) not null ,
    sfm_wintitle char(9) not null ,
    sfm_winfoot char(9) not null ,
    sfm_wintlin integer not null ,
    sfm_winflin integer not null ,
    sfm_orgrow integer not null ,
    sfm_orgcol integer not null ,
    sfm_depth integer not null ,
    sfm_width integer not null ,
    sfm_clear char(1) not null ,
    sfm_rsense char(1) not null ,
    sfm_repeat integer not null ,
    sfm_confirm char(1) not null 
  );
revoke all on "maxmast".sfmask from "public";

create unique index "maxmast".sfm_fmtkey on "maxmast".sfmask (sfm_format,
    sfm_screen);
create unique index "maxmast".sfm_key on "maxmast".sfmask (sfm_screen,
    sfm_format);
{ TABLE "maxmast".sfparam row size = 66 number of columns = 18 index size = 13 }
{ unload file name = sfpar00405.unl number of rows = 0 }

create table "maxmast".sfparam 
  (
    sfp_format char(5) not null ,
    sfp_parent char(5) not null ,
    sfp_fmtgrp integer not null ,
    sfp_type char(1) not null ,
    sfp_winorg char(1) not null ,
    sfp_winstyle char(1) not null ,
    sfp_wintitle char(9) not null ,
    sfp_winfoot char(9) not null ,
    sfp_wintlin integer not null ,
    sfp_winflin integer not null ,
    sfp_orgrow integer not null ,
    sfp_orgcol integer not null ,
    sfp_depth integer not null ,
    sfp_width integer not null ,
    sfp_clear char(1) not null ,
    sfp_rsense char(1) not null ,
    sfp_repeat integer not null ,
    sfp_confirm char(1) not null 
  );
revoke all on "maxmast".sfparam from "public";

create unique index "maxmast".sfp_format on "maxmast".sfparam 
    (sfp_format);
{ TABLE "maxmast".siare row size = 70 number of columns = 6 index size = 28 }
{ unload file name = siare00406.unl number of rows = 0 }

create table "maxmast".siare 
  (
    siare_resid char(15) not null ,
    siare_name char(25) not null ,
    siare_resqty float not null ,
    siare_hrcost float not null ,
    siare_lui char(10) not null ,
    siare_lud date not null 
  );
revoke all on "maxmast".siare from "public";

create unique index "maxmast".siare_resid on "maxmast".siare (siare_resid);
    
{ TABLE "maxmast".siarp row size = 61 number of columns = 7 index size = 81 }
{ unload file name = siarp00407.unl number of rows = 0 }

create table "maxmast".siarp 
  (
    siarp_resid char(15) not null ,
    siarp_startweek char(8) not null ,
    siarp_endweek char(8) not null ,
    siarp_resqty float not null ,
    siarp_hrcost float not null ,
    siarp_lui char(10) not null ,
    siarp_lud date not null 
  );
revoke all on "maxmast".siarp from "public";

create unique index "maxmast".siarp_key on "maxmast".siarp (siarp_resid,
    siarp_startweek);
create index "maxmast".siarp_key1 on "maxmast".siarp (siarp_resid,
    siarp_endweek);
{ TABLE "maxmast".sical row size = 39 number of columns = 9 index size = 25 }
{ unload file name = sical00408.unl number of rows = 0 }

create table "maxmast".sical 
  (
    sical_caltype char(1) not null ,
    sical_year integer not null ,
    sical_period integer not null ,
    sical_week integer not null ,
    sical_workdays integer not null ,
    sical_overtime integer not null ,
    sical_lui char(10) not null ,
    sical_lud date not null ,
    sical_offld integer not null 
  );
revoke all on "maxmast".sical from "public";

create unique index "maxmast".sical_key on "maxmast".sical (sical_caltype,
    sical_year,sical_period,sical_week);
{ TABLE "maxmast".sicr1 row size = 46 number of columns = 6 index size = 18 }
{ unload file name = sicr100409.unl number of rows = 0 }

create table "maxmast".sicr1 
  (
    sicr1_dueweek char(8) not null ,
    sicr1_hrscomp float not null ,
    sicr1_stancost float not null ,
    sicr1_price float not null ,
    sicr1_lui char(10) not null ,
    sicr1_lud date not null 
  );
revoke all on "maxmast".sicr1 from "public";

create unique index "maxmast".sicr1_dueweek on "maxmast".sicr1 
    (sicr1_dueweek);
{ TABLE "maxmast".sicr2 row size = 94 number of columns = 12 index size = 18 }
{ unload file name = sicr200410.unl number of rows = 0 }

create table "maxmast".sicr2 
  (
    sicr2_issueweek char(8) not null ,
    sicr2_matcost float not null ,
    sicr2_concost float not null ,
    sicr2_bofcost float not null ,
    sicr2_jobhrs float not null ,
    sicr2_inphrs float not null ,
    sicr2_lui char(10) not null ,
    sicr2_lud date not null ,
    sicr2_directwg float not null ,
    sicr2_ovhdscost float not null ,
    sicr2_mchhrcost float not null ,
    sicr2_addhrcost float not null 
  );
revoke all on "maxmast".sicr2 from "public";

create unique index "maxmast".sicr2_issueweek on "maxmast".sicr2 
    (sicr2_issueweek);
{ TABLE "maxmast".sicr3 row size = 62 number of columns = 8 index size = 18 }
{ unload file name = sicr300411.unl number of rows = 0 }

create table "maxmast".sicr3 
  (
    sicr3_dueweek char(8) not null ,
    sicr3_totalcost float not null ,
    sicr3_price float not null ,
    sicr3_jobhrs float not null ,
    sicr3_stancost float not null ,
    sicr3_lui char(10) not null ,
    sicr3_lud date not null ,
    sicr3_cashflow float not null 
  );
revoke all on "maxmast".sicr3 from "public";

create unique index "maxmast".sicr3_dueweek on "maxmast".sicr3 
    (sicr3_dueweek);
{ TABLE "maxmast".sicr4 row size = 32 number of columns = 4 index size = 18 }
{ unload file name = sicr400412.unl number of rows = 0 }

create table "maxmast".sicr4 
  (
    sicr4_dueweek char(8) not null ,
    sicr4_hrscomp float not null ,
    sicr4_stancost float not null ,
    sicr4_price float not null 
  );
revoke all on "maxmast".sicr4 from "public";

create unique index "maxmast".sicr4_dueweek on "maxmast".sicr4 
    (sicr4_dueweek);
{ TABLE "maxmast".sicr5 row size = 80 number of columns = 10 index size = 18 }
{ unload file name = sicr500413.unl number of rows = 0 }

create table "maxmast".sicr5 
  (
    sicr5_issueweek char(8) not null ,
    sicr5_matcost float not null ,
    sicr5_concost float not null ,
    sicr5_bofcost float not null ,
    sicr5_jobhrs float not null ,
    sicr5_inphrs float not null ,
    sicr5_directwg float not null ,
    sicr5_ovhdscost float not null ,
    sicr5_mchhrcost float not null ,
    sicr5_addhrcost float not null 
  );
revoke all on "maxmast".sicr5 from "public";

create unique index "maxmast".sicr5_issueweek on "maxmast".sicr5 
    (sicr5_issueweek);
{ TABLE "maxmast".sicr6 row size = 48 number of columns = 6 index size = 18 }
{ unload file name = sicr600414.unl number of rows = 0 }

create table "maxmast".sicr6 
  (
    sicr6_dueweek char(8) not null ,
    sicr6_totalcost float not null ,
    sicr6_price float not null ,
    sicr6_jobhrs float not null ,
    sicr6_stancost float not null ,
    sicr6_cashflow float not null 
  );
revoke all on "maxmast".sicr6 from "public";

create unique index "maxmast".sicr6_dueweek on "maxmast".sicr6 
    (sicr6_dueweek);
{ TABLE "maxmast".siday row size = 8 number of columns = 2 index size = 12 }
{ unload file name = siday00415.unl number of rows = 0 }

create table "maxmast".siday 
  (
    siday_year integer not null ,
    siday_firstday date not null 
  );
revoke all on "maxmast".siday from "public";

create unique index "maxmast".siday_year on "maxmast".siday (siday_year);
    
{ TABLE "maxmast".siim1 row size = 94 number of columns = 12 index size = 18 }
{ unload file name = siim100416.unl number of rows = 0 }

create table "maxmast".siim1 
  (
    siim1_dueweek char(8) not null ,
    siim1_stancost float not null ,
    siim1_hoursout float not null ,
    siim1_wipvalue float not null ,
    siim1_lui char(10) not null ,
    siim1_lud date not null ,
    siim1_fpsvalue float not null ,
    siim1_fgsvalue float not null ,
    siim1_sstancost float not null ,
    siim1_sfpsvalue float not null ,
    siim1_sfgsvalue float not null ,
    siim1_swipvalue float not null 
  );
revoke all on "maxmast".siim1 from "public";

create unique index "maxmast".siim1_dueweek on "maxmast".siim1 
    (siim1_dueweek);
{ TABLE "maxmast".silot row size = 22 number of columns = 4 index size = 19 }
{ unload file name = silot00417.unl number of rows = 0 }

create table "maxmast".silot 
  (
    silot_lotnumber integer not null ,
    silot_priresid char(5) not null ,
    silot_resnumb float not null ,
    silot_opno char(5) not null 
  );
revoke all on "maxmast".silot from "public";

create unique index "maxmast".silot_key on "maxmast".silot (silot_lotnumber,
    silot_opno);
{ TABLE "maxmast".simas row size = 265 number of columns = 30 index size = 66 }
{ unload file name = simas00418.unl number of rows = 0 }

create table "maxmast".simas 
  (
    simas_item char(40) not null ,
    simas_descext char(33) not null ,
    simas_llc integer not null ,
    simas_eleadtime float not null ,
    simas_cleadtime float not null ,
    simas_ebatchqty float not null ,
    simas_cbatchqty float not null ,
    simas_aircode char(3) not null ,
    simas_prodgroup char(6) not null ,
    simas_prodtyp char(3) not null ,
    simas_matcost float not null ,
    simas_bofcost float not null ,
    simas_concost float not null ,
    simas_stancost float not null ,
    simas_price float not null ,
    simas_desckey char(8) not null ,
    simas_lui char(10) not null ,
    simas_lud date not null ,
    simas_setup char(5) not null ,
    simas_numstores float not null ,
    simas_numdays float not null ,
    simas_mnumstore float not null ,
    simas_mnumdays float not null ,
    simas_sfpsbal float not null ,
    simas_efpsbal float not null ,
    simas_sdelbal float not null ,
    simas_edelbal float not null ,
    simas_mpsbal float not null ,
    simas_tbq integer not null ,
    simas_cebatchsz char(1) not null 
  );
revoke all on "maxmast".simas from "public";

create unique index "maxmast".simas_item on "maxmast".simas (simas_item);
    
{ TABLE "maxmast".simre row size = 117 number of columns = 11 index size = 51 }
{ unload file name = simre00419.unl number of rows = 0 }

create table "maxmast".simre 
  (
    simre_resid char(15) not null ,
    simre_residdet char(15) not null ,
    simre_name char(25) not null ,
    simre_resqty float not null ,
    simre_shifts float not null ,
    simre_overtime float not null ,
    simre_hourrate float not null ,
    simre_overrate float not null ,
    simre_lui char(10) not null ,
    simre_lud date not null ,
    simre_labreq float not null 
  );
revoke all on "maxmast".simre from "public";

create unique index "maxmast".simre_key on "maxmast".simre (simre_resid,
    simre_residdet);
{ TABLE "maxmast".simrp row size = 85 number of columns = 10 index size = 81 }
{ unload file name = simrp00420.unl number of rows = 0 }

create table "maxmast".simrp 
  (
    simrp_resid char(15) not null ,
    simrp_startweek char(8) not null ,
    simrp_endweek char(8) not null ,
    simrp_resqty float not null ,
    simrp_shifts float not null ,
    simrp_overtime float not null ,
    simrp_hourrate float not null ,
    simrp_overrate float not null ,
    simrp_lui char(10) not null ,
    simrp_lud date not null 
  );
revoke all on "maxmast".simrp from "public";

create unique index "maxmast".simrp_key on "maxmast".simrp (simrp_resid,
    simrp_startweek);
create index "maxmast".simrp_key1 on "maxmast".simrp (simrp_resid,
    simrp_endweek);
{ TABLE "maxmast".sinst row size = 111 number of columns = 6 index size = 298 }
{ unload file name = sinst00421.unl number of rows = 0 }

create table "maxmast".sinst 
  (
    sinst_paritem char(40) not null ,
    sinst_detitem char(40) not null ,
    sinst_noff float not null ,
    sinst_lui char(10) not null ,
    sinst_lud date not null ,
    sinst_startdate char(9) not null 
  );
revoke all on "maxmast".sinst from "public";

create unique index "maxmast".sinst_key1 on "maxmast".sinst (sinst_paritem,
    sinst_startdate,sinst_detitem);
create unique index "maxmast".sinst_key2 on "maxmast".sinst (sinst_detitem,
    sinst_startdate,sinst_paritem);
create index "maxmast".sinst_startdate on "maxmast".sinst (sinst_startdate);
    
{ TABLE "maxmast".sinwk row size = 35 number of columns = 11 index size = 24 }
{ unload file name = sinwk00422.unl number of rows = 0 }

create table "maxmast".sinwk 
  (
    sinwk_year integer not null ,
    sinwk_period integer not null ,
    sinwk_week integer not null ,
    sinwk_monday char(1) not null ,
    sinwk_tuesday char(1) not null ,
    sinwk_wednesday char(1) not null ,
    sinwk_thursday char(1) not null ,
    sinwk_friday char(1) not null ,
    sinwk_lui char(10) not null ,
    sinwk_lud date not null ,
    sinwk_workdays integer not null 
  );
revoke all on "maxmast".sinwk from "public";

create unique index "maxmast".sinwk_key on "maxmast".sinwk (sinwk_year,
    sinwk_period,sinwk_week);
{ TABLE "maxmast".siopa row size = 92 number of columns = 8 index size = 241 }
{ unload file name = siopa00423.unl number of rows = 0 }

create table "maxmast".siopa 
  (
    siopa_item char(40) not null ,
    siopa_opno char(5) not null ,
    siopa_resid char(15) not null ,
    siopa_resqty float not null ,
    siopa_restype char(1) not null ,
    siopa_lui char(10) not null ,
    siopa_lud date not null ,
    siopa_startdate char(9) not null 
  );
revoke all on "maxmast".siopa from "public";

create unique index "maxmast".siopa_key1 on "maxmast".siopa (siopa_item,
    siopa_startdate,siopa_opno,siopa_resid,siopa_restype);
create unique index "maxmast".siopa_key2 on "maxmast".siopa (siopa_resid,
    siopa_restype,siopa_item,siopa_startdate,siopa_opno);
create index "maxmast".siopa_startdate on "maxmast".siopa (siopa_startdate);
    
{ TABLE "maxmast".siop row size = 90 number of columns = 7 index size = 102 }
{ unload file name = siop_00424.unl number of rows = 0 }

create table "maxmast".siop 
  (
    siop_item char(40) not null ,
    siop_opno char(5) not null ,
    siop_resid char(15) not null ,
    siop_settime float not null ,
    siop_proctime float not null ,
    siop_lui char(10) not null ,
    siop_lud date not null 
  );
revoke all on "maxmast".siop from "public";

create unique index "maxmast".siop_key on "maxmast".siop (siop_item,
    siop_opno);
create index "maxmast".siop_resid on "maxmast".siop (siop_resid);
    
{ TABLE "maxmast".siopn row size = 99 number of columns = 8 index size = 222 }
{ unload file name = siopn00425.unl number of rows = 0 }

create table "maxmast".siopn 
  (
    siopn_item char(40) not null ,
    siopn_startdate char(9) not null ,
    siopn_opno char(5) not null ,
    siopn_resid char(15) not null ,
    siopn_settime float not null ,
    siopn_proctime float not null ,
    siopn_lui char(10) not null ,
    siopn_lud date not null 
  );
revoke all on "maxmast".siopn from "public";

create unique index "maxmast".siopn_key on "maxmast".siopn (siopn_item,
    siopn_startdate,siopn_opno);
create unique index "maxmast".siopn_key1 on "maxmast".siopn (siopn_item,
    siopn_opno,siopn_startdate);
create index "maxmast".siopn_resid on "maxmast".siopn (siopn_resid);
    
create index "maxmast".siopn_startdate on "maxmast".siopn (siopn_startdate);
    
{ TABLE "maxmast".siopp row size = 103 number of columns = 9 index size = 112 }
{ unload file name = siopp00426.unl number of rows = 0 }

create table "maxmast".siopp 
  (
    siopp_item char(40) not null ,
    siopp_opno char(5) not null ,
    siopp_resid char(15) not null ,
    siopp_settime float not null ,
    siopp_proctime float not null ,
    siopp_lud date not null ,
    siopp_lui char(10) not null ,
    siopp_sequence integer not null ,
    siopp_startdate char(9) not null 
  );
revoke all on "maxmast".siopp from "public";

create unique index "maxmast".siopp_key on "maxmast".siopp (siopp_item,
    siopp_startdate,siopp_opno,siopp_sequence);
create index "maxmast".siopp_startdate on "maxmast".siopp (siopp_startdate);
    
{ TABLE "maxmast".siopw row size = 239 number of columns = 29 index size = 424 }
{ unload file name = siopw00427.unl number of rows = 0 }

create table "maxmast".siopw 
  (
    siopw_resid char(15) not null ,
    siopw_residlab char(15) not null ,
    siopw_workweek char(8) not null ,
    siopw_workdate date not null ,
    siopw_worktime float not null ,
    siopw_item char(40) not null ,
    siopw_dueweek char(9) not null ,
    siopw_duedate date not null ,
    siopw_dueqty float not null ,
    siopw_opno char(5) not null ,
    siopw_proctime float not null ,
    siopw_settime float not null ,
    siopw_serial serial not null ,
    siopw_lui char(10) not null ,
    siopw_lud date not null ,
    siopw_loadtype char(1) not null ,
    siopw_daysout float not null ,
    siopw_sloadweek char(9) not null ,
    siopw_sloadtime integer not null ,
    siopw_uloadweek char(9) not null ,
    siopw_uloadtime integer not null ,
    siopw_resnumb float not null ,
    siopw_addres char(1) not null ,
    siopw_shfthrs float not null ,
    siopw_overtime float not null ,
    siopw_shifts float not null ,
    siopw_routeweek char(9) not null ,
    siopw_jobnumber integer not null ,
    siopw_qbatches float not null 
  );
revoke all on "maxmast".siopw from "public";

create unique index "maxmast".siopw_key on "maxmast".siopw (siopw_loadtype,
    siopw_workweek,siopw_resid,siopw_worktime,siopw_resnumb,siopw_serial);
    
create unique index "maxmast".siopw_key1 on "maxmast".siopw (siopw_resid,
    siopw_workweek,siopw_loadtype,siopw_resnumb,siopw_sloadweek,
    siopw_sloadtime,siopw_serial);
create unique index "maxmast".siopw_key2 on "maxmast".siopw (siopw_residlab,
    siopw_workweek,siopw_loadtype,siopw_resid,siopw_resnumb,siopw_sloadweek,
    siopw_sloadtime,siopw_serial);
create index "maxmast".siopw_key3 on "maxmast".siopw (siopw_resid,
    siopw_resnumb,siopw_uloadweek,siopw_uloadtime);
create index "maxmast".siopw_key4 on "maxmast".siopw (siopw_jobnumber,
    siopw_item,siopw_dueweek,siopw_opno,siopw_serial);
create unique index "maxmast".siopw_serial on "maxmast".siopw 
    (siopw_serial);
{ TABLE "maxmast".siord row size = 171 number of columns = 21 index size = 183 }
{ unload file name = siord00428.unl number of rows = 0 }

create table "maxmast".siord 
  (
    siord_item char(40) not null ,
    siord_duedate date not null ,
    siord_issuedate date not null ,
    siord_compdate date not null ,
    siord_dueqty float not null ,
    siord_status char(1) not null ,
    siord_numlaunch float not null ,
    siord_numstores float not null ,
    siord_dueweek char(9) not null ,
    siord_issueweek char(9) not null ,
    siord_compweek char(9) not null ,
    siord_serial serial not null ,
    siord_lui char(10) not null ,
    siord_lud date not null ,
    siord_llc integer not null ,
    siord_startweek char(9) not null ,
    siord_startdate date not null ,
    siord_ordqty float not null ,
    siord_mpsqty float not null ,
    siord_orddel float not null ,
    siord_mpsdel float not null 
  );
revoke all on "maxmast".siord from "public";

create index "maxmast".siord_key on "maxmast".siord (siord_item,
    siord_dueweek);
create index "maxmast".siord_key1 on "maxmast".siord (siord_llc,
    siord_item,siord_dueweek,siord_serial);
create unique index "maxmast".siord_serial on "maxmast".siord 
    (siord_serial);
{ TABLE "maxmast".sipar row size = 373 number of columns = 64 index size = 7 }
{ unload file name = sipar00429.unl number of rows = 0 }

create table "maxmast".sipar 
  (
    sipar_key char(1) not null ,
    sipar_title char(50) not null ,
    sipar_ordercalc char(1) not null ,
    sipar_ofromweek char(9) not null ,
    sipar_ofromdate date not null ,
    sipar_otoweek char(9) not null ,
    sipar_otodate date not null ,
    sipar_loadprof char(1) not null ,
    sipar_pfromweek char(9) not null ,
    sipar_pfromdate date not null ,
    sipar_ptoweek char(9) not null ,
    sipar_ptodate date not null ,
    sipar_runsimu char(1) not null ,
    sipar_sfromweek char(9) not null ,
    sipar_sfromdate date not null ,
    sipar_stoweek char(9) not null ,
    sipar_stodate date not null ,
    sipar_priority char(1) not null ,
    sipar_offldcost float not null ,
    sipar_celeadtim char(1) not null ,
    sipar_operqueue float not null ,
    sipar_hoursday float not null ,
    sipar_cebatchsz char(1) not null ,
    sipar_ovhdscost float not null ,
    sipar_shft1hrs float not null ,
    sipar_shft2hrs float not null ,
    sipar_shft3hrs float not null ,
    sipar_wk1hours float not null ,
    sipar_wk2hours float not null ,
    sipar_wk3hours float not null ,
    sipar_lui char(10) not null ,
    sipar_lud date not null ,
    sipar_tol1 float not null ,
    sipar_tol2 float not null ,
    sipar_wfromweek char(9) not null ,
    sipar_wfromdate date not null ,
    sipar_wtoweek char(9) not null ,
    sipar_wtodate date not null ,
    sipar_worktlist char(1) not null ,
    sipar_afromweek char(9) not null ,
    sipar_atoweek char(9) not null ,
    sipar_afromdate date not null ,
    sipar_atodate date not null ,
    sipar_analpre char(1) not null ,
    sipar_analmre char(1) not null ,
    sipar_analare char(1) not null ,
    sipar_totalmen char(1) not null ,
    sipar_hrcost float not null ,
    sipar_invcost float not null ,
    sipar_reducedpr char(1) not null ,
    sipar_reddays integer not null ,
    sipar_price integer not null ,
    sipar_matcost integer not null ,
    sipar_concost integer not null ,
    sipar_bofcost integer not null ,
    sipar_jobhrs integer not null ,
    sipar_directwg integer not null ,
    sipar_mchhrcost integer not null ,
    sipar_addhrcost integer not null ,
    sipar_povhdscos integer not null ,
    sipar_scashflow float not null ,
    sipar_ssetup char(1) not null ,
    sipar_ssetnum integer not null ,
    sipar_itembatch char(1) not null 
  );
revoke all on "maxmast".sipar from "public";

create unique index "maxmast".sipar_key on "maxmast".sipar (sipar_key);
    
{ TABLE "maxmast".sipre row size = 157 number of columns = 16 index size = 51 }
{ unload file name = sipre00430.unl number of rows = 0 }

create table "maxmast".sipre 
  (
    sipre_resid char(15) not null ,
    sipre_residdet char(15) not null ,
    sipre_name char(25) not null ,
    sipre_resqty float not null ,
    sipre_residlab char(15) not null ,
    sipre_macheff float not null ,
    sipre_macheater float not null ,
    sipre_machoffld float not null ,
    sipre_machjobfc float not null ,
    sipre_batchqty float not null ,
    sipre_lui char(10) not null ,
    sipre_lud date not null ,
    sipre_simudisp char(1) not null ,
    sipre_labreq float not null ,
    sipre_hrcost float not null ,
    sipre_mbatches float not null 
  );
revoke all on "maxmast".sipre from "public";

create unique index "maxmast".sipre_key on "maxmast".sipre (sipre_resid,
    sipre_residdet);
{ TABLE "maxmast".siprp row size = 117 number of columns = 14 index size = 81 }
{ unload file name = siprp00431.unl number of rows = 0 }

create table "maxmast".siprp 
  (
    siprp_resid char(15) not null ,
    siprp_startweek char(8) not null ,
    siprp_endweek char(8) not null ,
    siprp_resqty float not null ,
    siprp_macheff float not null ,
    siprp_macheater float not null ,
    siprp_machoffld float not null ,
    siprp_machjobfc float not null ,
    siprp_batchqty float not null ,
    siprp_labreq float not null ,
    siprp_hrcost float not null ,
    siprp_lui char(10) not null ,
    siprp_lud date not null ,
    siprp_mbatches float not null 
  );
revoke all on "maxmast".siprp from "public";

create unique index "maxmast".siprp_key on "maxmast".siprp (siprp_resid,
    siprp_startweek);
create index "maxmast".siprp_key1 on "maxmast".siprp (siprp_resid,
    siprp_endweek);
{ TABLE "maxmast".sipst row size = 102 number of columns = 5 index size = 252 }
{ unload file name = sipst00432.unl number of rows = 0 }

create table "maxmast".sipst 
  (
    sipst_paritem char(40) not null ,
    sipst_detitem char(40) not null ,
    sipst_noff float not null ,
    sipst_lui char(10) not null ,
    sipst_lud date not null 
  );
revoke all on "maxmast".sipst from "public";

create unique index "maxmast".sipst_key1 on "maxmast".sipst (sipst_paritem,
    sipst_detitem);
create unique index "maxmast".sipst_key2 on "maxmast".sipst (sipst_detitem,
    sipst_paritem);
{ TABLE "maxmast".siref row size = 41 number of columns = 5 index size = 16 }
{ unload file name = siref00433.unl number of rows = 0 }

create table "maxmast".siref 
  (
    siref_rtype char(2) not null ,
    siref_rcode char(5) not null ,
    siref_rtext char(20) not null ,
    siref_lui char(10) not null ,
    siref_lud date not null 
  );
revoke all on "maxmast".siref from "public";

create unique index "maxmast".siref_key on "maxmast".siref (siref_rtype,
    siref_rcode);
{ TABLE "maxmast".sirm1 row size = 141 number of columns = 17 index size = 40 }
{ unload file name = sirm100434.unl number of rows = 0 }

create table "maxmast".sirm1 
  (
    sirm1_resid char(15) not null ,
    sirm1_dueweek char(8) not null ,
    sirm1_proctime float not null ,
    sirm1_settime float not null ,
    sirm1_qbatches float not null ,
    sirm1_qhours float not null ,
    sirm1_machoffld float not null ,
    sirm1_lui char(10) not null ,
    sirm1_lud date not null ,
    sirm1_wkhours float not null ,
    sirm1_resqty float not null ,
    sirm1_overtime float not null ,
    sirm1_shifts float not null ,
    sirm1_macheff float not null ,
    sirm1_macheater float not null ,
    sirm1_hrcost float not null ,
    sirm1_stanhours float not null 
  );
revoke all on "maxmast".sirm1 from "public";

create unique index "maxmast".sirm1_key on "maxmast".sirm1 (sirm1_resid,
    sirm1_dueweek);
{ TABLE "maxmast".sirm2 row size = 109 number of columns = 13 index size = 40 }
{ unload file name = sirm200435.unl number of rows = 0 }

create table "maxmast".sirm2 
  (
    sirm2_resid char(15) not null ,
    sirm2_dueweek char(8) not null ,
    sirm2_hoursbook float not null ,
    sirm2_lui char(10) not null ,
    sirm2_lud date not null ,
    sirm2_resqty float not null ,
    sirm2_shifts float not null ,
    sirm2_overtime float not null ,
    sirm2_wkhours float not null ,
    sirm2_hourrate float not null ,
    sirm2_overrate float not null ,
    sirm2_macheff float not null ,
    sirm2_wk1hours float not null 
  );
revoke all on "maxmast".sirm2 from "public";

create unique index "maxmast".sirm2_key on "maxmast".sirm2 (sirm2_resid,
    sirm2_dueweek);
{ TABLE "maxmast".sirm3 row size = 93 number of columns = 11 index size = 40 }
{ unload file name = sirm300436.unl number of rows = 0 }

create table "maxmast".sirm3 
  (
    sirm3_resid char(15) not null ,
    sirm3_dueweek char(8) not null ,
    sirm3_hoursbook float not null ,
    sirm3_stanhours float not null ,
    sirm3_resqty float not null ,
    sirm3_hrcost float not null ,
    sirm3_wk1hours float not null ,
    sirm3_wk2hours float not null ,
    sirm3_wk3hours float not null ,
    sirm3_lud date not null ,
    sirm3_lui char(10) not null 
  );
revoke all on "maxmast".sirm3 from "public";

create unique index "maxmast".sirm3_key on "maxmast".sirm3 (sirm3_resid,
    sirm3_dueweek);
{ TABLE "maxmast".sirp1 row size = 160 number of columns = 19 index size = 259 }
{ unload file name = sirp100437.unl number of rows = 0 }

create table "maxmast".sirp1 
  (
    sirp1_resid char(15) not null ,
    sirp1_dueweek char(8) not null ,
    sirp1_currload float not null ,
    sirp1_futload float not null ,
    sirp1_arrload float not null ,
    sirp1_lui char(10) not null ,
    sirp1_lud date not null ,
    sirp1_resqty float not null ,
    sirp1_wkhours float not null ,
    sirp1_shifts float not null ,
    sirp1_macheater float not null ,
    sirp1_tol1 float not null ,
    sirp1_tol2 float not null ,
    sirp1_macheff float not null ,
    sirp1_overtime float not null ,
    sirp1_residlab char(15) not null ,
    sirp1_labresqty float not null ,
    sirp1_labreq float not null ,
    sirp1_serial serial not null 
  );
revoke all on "maxmast".sirp1 from "public";

create index "maxmast".sirp1_key on "maxmast".sirp1 (sirp1_resid,
    sirp1_dueweek);
create index "maxmast".sirp1_key1 on "maxmast".sirp1 (sirp1_residlab,
    sirp1_dueweek,sirp1_resid);
create index "maxmast".sirp1_key2 on "maxmast".sirp1 (sirp1_dueweek,
    sirp1_resid);
create index "maxmast".sirp1_key3 on "maxmast".sirp1 (sirp1_dueweek,
    sirp1_residlab,sirp1_resid);
create index "maxmast".sirp1_key4 on "maxmast".sirp1 (sirp1_dueweek,
    sirp1_residlab);
create unique index "maxmast".sirp1_serial on "maxmast".sirp1 
    (sirp1_serial);
{ TABLE "maxmast".sirp2 row size = 126 number of columns = 16 index size = 126 }
{ unload file name = sirp200438.unl number of rows = 0 }

create table "maxmast".sirp2 
  (
    sirp2_resid char(15) not null ,
    sirp2_restype char(1) not null ,
    sirp2_dueweek char(8) not null ,
    sirp2_currload float not null ,
    sirp2_futload float not null ,
    sirp2_arrload float not null ,
    sirp2_resqty float not null ,
    sirp2_facload float not null ,
    sirp2_shifts float not null ,
    sirp2_lui char(10) not null ,
    sirp2_lud date not null ,
    sirp2_tol1 float not null ,
    sirp2_tol2 float not null ,
    sirp2_arrfload float not null ,
    sirp2_currfload float not null ,
    sirp2_futfload float not null 
  );
revoke all on "maxmast".sirp2 from "public";

create unique index "maxmast".sirp2_key on "maxmast".sirp2 (sirp2_resid,
    sirp2_restype,sirp2_dueweek);
create index "maxmast".sirp2_key1 on "maxmast".sirp2 (sirp2_restype,
    sirp2_resid,sirp2_dueweek);
create index "maxmast".sirp2_key2 on "maxmast".sirp2 (sirp2_dueweek,
    sirp2_restype,sirp2_resid);
{ TABLE "maxmast".sirp3 row size = 186 number of columns = 22 index size = 394 }
{ unload file name = sirp300439.unl number of rows = 0 }

create table "maxmast".sirp3 
  (
    sirp3_workweek char(8) not null ,
    sirp3_resid char(15) not null ,
    sirp3_restype char(1) not null ,
    sirp3_item char(40) not null ,
    sirp3_startweek char(9) not null ,
    sirp3_finweek char(9) not null ,
    sirp3_dueweek char(9) not null ,
    sirp3_opno char(5) not null ,
    sirp3_dueqty float not null ,
    sirp3_proctime float not null ,
    sirp3_settime float not null ,
    sirp3_batchqty float not null ,
    sirp3_serial serial not null ,
    sirp3_lui char(10) not null ,
    sirp3_lud date not null ,
    sirp3_resqty float not null ,
    sirp3_addreq char(1) not null ,
    sirp3_jobnumber integer not null ,
    sirp3_loadtype char(1) not null ,
    sirp3_priresid char(15) not null ,
    sirp3_macheff float not null ,
    sirp3_aircode char(3) not null 
  );
revoke all on "maxmast".sirp3 from "public";

create index "maxmast".sirp3_key on "maxmast".sirp3 (sirp3_workweek,
    sirp3_resid,sirp3_restype,sirp3_startweek,sirp3_item,sirp3_opno);
    
create unique index "maxmast".sirp3_key1 on "maxmast".sirp3 (sirp3_workweek,
    sirp3_resid,sirp3_restype,sirp3_item,sirp3_dueweek,sirp3_opno,
    sirp3_serial);
create index "maxmast".sirp3_key2 on "maxmast".sirp3 (sirp3_resid,
    sirp3_restype,sirp3_workweek,sirp3_loadtype,sirp3_item,sirp3_dueweek,
    sirp3_opno,sirp3_serial);
create unique index "maxmast".sirp3_serial on "maxmast".sirp3 
    (sirp3_serial);
{ TABLE "maxmast".sirp4 row size = 110 number of columns = 14 index size = 18 }
{ unload file name = sirp400440.unl number of rows = 0 }

create table "maxmast".sirp4 
  (
    sirp4_dueweek char(8) not null ,
    sirp4_currload float not null ,
    sirp4_futload float not null ,
    sirp4_arrload float not null ,
    sirp4_facload float not null ,
    sirp4_tol1 float not null ,
    sirp4_tol2 float not null ,
    sirp4_capavail float not null ,
    sirp4_resqty float not null ,
    sirp4_lui char(10) not null ,
    sirp4_lud date not null ,
    sirp4_arrfload float not null ,
    sirp4_currfload float not null ,
    sirp4_futfload float not null 
  );
revoke all on "maxmast".sirp4 from "public";

create unique index "maxmast".sirp4_dueweek on "maxmast".sirp4 
    (sirp4_dueweek);
{ TABLE "maxmast".sirqt row size = 117 number of columns = 13 index size = 285 }
{ unload file name = sirqt00441.unl number of rows = 0 }

create table "maxmast".sirqt 
  (
    sirqt_item char(40) not null ,
    sirqt_dueqty float not null ,
    sirqt_duedate date not null ,
    sirqt_deldate date not null ,
    sirqt_status char(1) not null ,
    sirqt_sourceref char(15) not null ,
    sirqt_dueweek char(9) not null ,
    sirqt_delweek char(9) not null ,
    sirqt_issqty float not null ,
    sirqt_lui char(10) not null ,
    sirqt_lud date not null ,
    sirqt_fixed char(1) not null ,
    sirqt_serial serial not null 
  );
revoke all on "maxmast".sirqt from "public";

create index "maxmast".sirqt_delweek on "maxmast".sirqt (sirqt_delweek);
    
create unique index "maxmast".sirqt_key on "maxmast".sirqt (sirqt_item,
    sirqt_dueweek,sirqt_serial);
create index "maxmast".sirqt_key1 on "maxmast".sirqt (sirqt_item,
    sirqt_delweek);
create index "maxmast".sirqt_key2 on "maxmast".sirqt (sirqt_delweek,
    sirqt_status);
create index "maxmast".sirqt_key3 on "maxmast".sirqt (sirqt_item,
    sirqt_dueweek);
{ TABLE "maxmast".sirun row size = 21 number of columns = 4 index size = 16 }
{ unload file name = sirun00442.unl number of rows = 0 }

create table "maxmast".sirun 
  (
    sirun_rtype char(2) not null ,
    sirun_rcode char(5) not null ,
    sirun_lui char(10) not null ,
    sirun_lud date not null 
  );
revoke all on "maxmast".sirun from "public";

create unique index "maxmast".sirun_key on "maxmast".sirun (sirun_rtype,
    sirun_rcode);
{ TABLE "maxmast".sismt row size = 47 number of columns = 6 index size = 43 }
{ unload file name = sismt00443.unl number of rows = 0 }

create table "maxmast".sismt 
  (
    sismt_fromsetup char(5) not null ,
    sismt_tosetup char(5) not null ,
    sismt_percent float not null ,
    sismt_lud date not null ,
    sismt_lui char(10) not null ,
    sismt_resid char(15) not null 
  );
revoke all on "maxmast".sismt from "public";

create unique index "maxmast".sismt_key on "maxmast".sismt (sismt_resid,
    sismt_fromsetup,sismt_tosetup);
{ TABLE "maxmast".sisqt row size = 117 number of columns = 13 index size = 285 }
{ unload file name = sisqt00444.unl number of rows = 0 }

create table "maxmast".sisqt 
  (
    sisqt_item char(40) not null ,
    sisqt_dueqty float not null ,
    sisqt_duedate date not null ,
    sisqt_deldate date not null ,
    sisqt_status char(1) not null ,
    sisqt_sourceref char(15) not null ,
    sisqt_dueweek char(9) not null ,
    sisqt_delweek char(9) not null ,
    sisqt_issqty float not null ,
    sisqt_lui char(10) not null ,
    sisqt_lud date not null ,
    sisqt_fixed char(1) not null ,
    sisqt_serial serial not null 
  );
revoke all on "maxmast".sisqt from "public";

create index "maxmast".sisqt_delweek on "maxmast".sisqt (sisqt_delweek);
    
create unique index "maxmast".sisqt_key on "maxmast".sisqt (sisqt_item,
    sisqt_dueweek,sisqt_serial);
create index "maxmast".sisqt_key1 on "maxmast".sisqt (sisqt_item,
    sisqt_delweek);
create index "maxmast".sisqt_key2 on "maxmast".sisqt (sisqt_delweek,
    sisqt_status);
create index "maxmast".sisqt_key3 on "maxmast".sisqt (sisqt_item,
    sisqt_dueweek);
{ TABLE "maxmast".sitmp row size = 56 number of columns = 3 index size = 66 }
{ unload file name = sitmp00445.unl number of rows = 0 }

create table "maxmast".sitmp 
  (
    sitmp_item char(40) not null ,
    sitmp_sfpsbal float not null ,
    sitmp_sdelbal float not null 
  );
revoke all on "maxmast".sitmp from "public";

create unique index "maxmast".sitmp_item on "maxmast".sitmp (sitmp_item);
    
{ TABLE "maxmast".siwip row size = 229 number of columns = 33 index size = 216 }
{ unload file name = siwip00446.unl number of rows = 0 }

create table "maxmast".siwip 
  (
    siwip_item char(40) not null ,
    siwip_opno char(5) not null ,
    siwip_dueqty float not null ,
    siwip_duedate date not null ,
    siwip_startdate date not null ,
    siwip_resid char(15) not null ,
    siwip_dueweek char(9) not null ,
    siwip_startweek char(9) not null ,
    siwip_opsremain float not null ,
    siwip_totalops float not null ,
    siwip_hrsrmop float not null ,
    siwip_hrsrmtot float not null ,
    siwip_totalhrs float not null ,
    siwip_recstat char(1) not null ,
    siwip_lui char(10) not null ,
    siwip_lud date not null ,
    siwip_serial serial not null ,
    siwip_prind float not null ,
    siwip_finind char(1) not null ,
    siwip_offind char(1) not null ,
    siwip_settime float not null ,
    siwip_proctime float not null ,
    siwip_loadop char(1) not null ,
    siwip_reduced char(1) not null ,
    siwip_issueweek char(9) not null ,
    siwip_issuedate date not null ,
    siwip_routeweek char(9) not null ,
    siwip_routedate date not null ,
    siwip_jobnumber integer not null ,
    siwip_priresid char(5) not null ,
    siwip_engine char(1) not null ,
    siwip_resnumb float not null ,
    siwip_lotnumber integer not null 
  );
revoke all on "maxmast".siwip from "public";

create unique index "maxmast".siwip_delkey on "maxmast".siwip 
    (siwip_item,siwip_serial);
create index "maxmast".siwip_jobnumber on "maxmast".siwip (siwip_jobnumber);
    
create index "maxmast".siwip_key on "maxmast".siwip (siwip_item,
    siwip_dueweek);
create index "maxmast".siwip_key1 on "maxmast".siwip (siwip_resid,
    siwip_prind);
create unique index "maxmast".siwip_serial on "maxmast".siwip 
    (siwip_serial);
{ TABLE "maxmast".sjord row size = 441 number of columns = 50 index size = 169 }
{ unload file name = sjord00447.unl number of rows = 33728 }

create table "maxmast".sjord 
  (
    sjord_orderno char(10) not null ,
    sjord_duedate integer not null ,
    sjord_dueqty float not null ,
    sjord_revdue integer not null ,
    sjord_qtyscrap float not null ,
    sjord_qtyrcvd float not null ,
    sjord_item char(15) not null ,
    sjord_revqty float not null ,
    sjord_completed char(1) not null ,
    sjord_remarks char(66) not null ,
    sjord_manfac char(5) not null ,
    sjord_scrappc float not null ,
    sjord_lud integer not null ,
    sjord_lui char(10) not null ,
    sjord_delstore char(5) not null ,
    sjord_delacct char(5) not null ,
    sjord_scrstore char(5) not null ,
    sjord_scracct char(5) not null ,
    sjord_released char(1) not null ,
    sjord_stage char(1) not null ,
    sjord_reldate integer not null ,
    sjord_startdate integer not null ,
    sjord_priority char(5) not null ,
    sjord_printdate integer not null ,
    sjord_reprint char(1) not null ,
    sjord_amendno integer not null ,
    sjord_drawno char(20) not null ,
    sjord_drawiss char(3) not null ,
    sjord_routeid char(5) not null ,
    sjord_modser char(10) not null ,
    sjord_premarks char(56) not null ,
    sjord_rtplanned char(1) not null ,
    sjord_splitfrom char(10) not null ,
    sjord_lastop char(5) not null ,
    sjord_opscrap char(1) not null ,
    sjord_monord float not null ,
    sjord_serialop char(5) not null ,
    sjord_contract char(15) not null ,
    sjord_conlin integer not null ,
    sjord_wipscrap float not null ,
    sjord_lspro integer not null ,
    sjord_glrefrom char(15) not null ,
    sjord_glrefto char(15) not null ,
    sjord_glvarfrom char(15) not null ,
    sjord_glvarto char(15) not null ,
    sjord_duetime integer not null ,
    sjord_negdue integer not null ,
    sjord_ordnum char(8) not null ,
    sjord_linnum integer not null ,
    sjord_pcontrlr char(3) not null 
  );
revoke all on "maxmast".sjord from "public";

create unique index "maxmast".sjord_date_key on "maxmast".sjord 
    (sjord_item,sjord_duedate,sjord_orderno);
create unique index "maxmast".sjord_lastdate on "maxmast".sjord 
    (sjord_item,sjord_negdue,sjord_orderno);
create unique index "maxmast".sjord_orderno on "maxmast".sjord 
    (sjord_orderno);
create unique index "maxmast".sjord_revkey on "maxmast".sjord 
    (sjord_item,sjord_revdue,sjord_orderno);
{ TABLE "maxmast".slaget row size = 215 number of columns = 16 index size = 7 }
{ unload file name = slage00448.unl number of rows = 1 }

create table "maxmast".slaget 
  (
    sla_agecode char(1) not null ,
    sla_acdescr char(40) not null ,
    sla_chasedays integer not null ,
    sla_od1 integer not null ,
    sla_od2 integer not null ,
    sla_od3 integer not null ,
    sla_od4 integer not null ,
    sla_futdesc char(20) not null ,
    sla_curdesc char(20) not null ,
    sla_expdesc char(20) not null ,
    sla_od1desc char(20) not null ,
    sla_od2desc char(20) not null ,
    sla_od3desc char(20) not null ,
    sla_od4desc char(20) not null ,
    sla_lui char(10) not null ,
    sla_lud date not null 
  );
revoke all on "maxmast".slaget from "public";

create unique index "maxmast".sla_agecode on "maxmast".slaget 
    (sla_agecode);
{ TABLE "maxmast".slarea row size = 44 number of columns = 5 index size = 13 }
{ unload file name = slare00450.unl number of rows = 13 }

create table "maxmast".slarea 
  (
    slg_geogarea char(5) not null ,
    slg_areaname char(20) not null ,
    slg_lui char(10) not null ,
    slg_lud date not null ,
    slg_territory char(5) not null 
  );
revoke all on "maxmast".slarea from "public";

create unique index "maxmast".slg_geogarea on "maxmast".slarea 
    (slg_geogarea);
{ TABLE "maxmast".slbctl row size = 79 number of columns = 13 index size = 12 }
{ unload file name = slbct00451.unl number of rows = 101 }

create table "maxmast".slbctl 
  (
    sll_batchno integer not null ,
    sll_items integer not null ,
    sll_btotal float not null ,
    sll_bdate date not null ,
    sll_userid char(10) not null ,
    sll_bcomplete char(1) not null ,
    sll_breport char(1) not null ,
    sll_intref char(8) not null ,
    sll_dtotal float not null ,
    sll_lud date not null ,
    sll_custcode char(10) not null ,
    sll_btype char(2) not null ,
    sll_batchref char(15) not null 
  );
revoke all on "maxmast".slbctl from "public";

create unique index "maxmast".sll_batchno on "maxmast".slbctl 
    (sll_batchno);
{ TABLE "maxmast".slcmsg row size = 288 number of columns = 12 index size = 12 }
{ unload file name = slcms00452.unl number of rows = 0 }

create table "maxmast".slcmsg 
  (
    sle_symsg char(30) not null ,
    sle_snmsg char(30) not null ,
    sle_lymsg char(30) not null ,
    sle_lnmsg char(30) not null ,
    sle_t0msg char(30) not null ,
    sle_t1msg char(30) not null ,
    sle_t2msg char(30) not null ,
    sle_t3msg char(30) not null ,
    sle_t4msg char(30) not null ,
    sle_lui char(10) not null ,
    sle_lud date not null ,
    sle_lang char(4) not null 
  );
revoke all on "maxmast".slcmsg from "public";

create unique index "maxmast".sle_lang on "maxmast".slcmsg (sle_lang);
    
{ TABLE "maxmast".slctyp row size = 38 number of columns = 5 index size = 10 }
{ unload file name = slcty00453.unl number of rows = 4 }

create table "maxmast".slctyp 
  (
    slk_custtype char(3) not null ,
    slk_ctdescr char(20) not null ,
    slk_agecode char(1) not null ,
    slk_lui char(10) not null ,
    slk_lud date not null 
  );
revoke all on "maxmast".slctyp from "public";

create unique index "maxmast".slk_custtype on "maxmast".slctyp 
    (slk_custtype);
{ TABLE "maxmast".sllet row size = 44 number of columns = 7 index size = 27 }
{ unload file name = sllet00457.unl number of rows = 0 }

create table "maxmast".sllet 
  (
    sllet_custcode char(10) not null ,
    sllet_severity char(4) not null ,
    sllet_days integer not null ,
    sllet_report char(9) not null ,
    sllet_stat char(5) not null ,
    sllet_prntr char(8) not null ,
    sllet_copys integer not null 
  );
revoke all on "maxmast".sllet from "public";

create unique index "maxmast".sllet_key on "maxmast".sllet (sllet_custcode,
    sllet_severity);
{ TABLE "maxmast".sllhst row size = 45 number of columns = 6 index size = 70 }
{ unload file name = sllhs00458.unl number of rows = 0 }

create table "maxmast".sllhst 
  (
    slhst_tranno float not null ,
    slhst_letterdt date not null ,
    slhst_lettref char(15) not null ,
    slhst_severity char(4) not null ,
    slhst_lui char(10) not null ,
    slhst_lud date not null 
  );
revoke all on "maxmast".sllhst from "public";

create unique index "maxmast".slhst_key on "maxmast".sllhst (slhst_tranno,
    slhst_severity);
create index "maxmast".slhst_lettref on "maxmast".sllhst (slhst_lettref);
    
create index "maxmast".slhst_tranno on "maxmast".sllhst (slhst_tranno);
    
{ TABLE "maxmast".sllink row size = 142 number of columns = 10 index size = 9 }
{ unload file name = sllin00459.unl number of rows = 13 }

create table "maxmast".sllink 
  (
    sln_branch char(2) not null ,
    sln_brdescr char(20) not null ,
    sln_bankcac char(15) not null ,
    sln_dgivcac char(15) not null ,
    sln_merchcac char(15) not null ,
    sln_adjcac char(15) not null ,
    sln_odiscacc char(15) not null ,
    sln_ldiscacc char(15) not null ,
    sln_delkacct char(15) not null ,
    sln_taxcac char(15) not null 
  );
revoke all on "maxmast".sllink from "public";

create unique index "maxmast".sln_branch on "maxmast".sllink (sln_branch);
    
{ TABLE "maxmast".slosb row size = 70 number of columns = 9 index size = 27 }
{ unload file name = slosb00461.unl number of rows = 16 }

create table "maxmast".slosb 
  (
    slosb_custcode char(10) not null ,
    slosb_currency char(4) not null ,
    slosb_currnboe float not null ,
    slosb_currboe float not null ,
    slosb_basenboe float not null ,
    slosb_baseboe float not null ,
    slosb_disputed float not null ,
    slosb_euronboe float not null ,
    slosb_euroboe float not null 
  );
revoke all on "maxmast".slosb from "public";

create unique index "maxmast".slosb_key on "maxmast".slosb (slosb_custcode,
    slosb_currency);
{ TABLE "maxmast".slpil row size = 127 number of columns = 19 index size = 109 }
{ unload file name = slpil00462.unl number of rows = 0 }

create table "maxmast".slpil 
  (
    slpil_custcode char(10) not null ,
    slpil_link char(8) not null ,
    slpil_tranno float not null ,
    slpil_intref char(8) not null ,
    slpil_penref char(15) not null ,
    slpil_transdate date not null ,
    slpil_lud date not null ,
    slpil_lui char(10) not null ,
    slpil_penvalue float not null ,
    slpil_pentax float not null ,
    slpil_invnum char(8) not null ,
    slpil_serial serial not null ,
    slpil_cutoffdte date not null ,
    slpil_osamount float not null ,
    slpil_duedate date not null ,
    slpil_startdate date not null ,
    slpil_enddate date not null ,
    slpil_extraday integer not null ,
    slpil_linnum integer not null 
  );
revoke all on "maxmast".slpil from "public";

create unique index "maxmast".slpil_key1 on "maxmast".slpil (slpil_penref,
    slpil_serial);
create unique index "maxmast".slpil_key2 on "maxmast".slpil (slpil_custcode,
    slpil_link,slpil_serial);
create unique index "maxmast".slpil_key3 on "maxmast".slpil (slpil_invnum,
    slpil_serial);
create unique index "maxmast".slpil_serial on "maxmast".slpil 
    (slpil_serial);
{ TABLE "maxmast".slrgn row size = 49 number of columns = 4 index size = 13 }
{ unload file name = slrgn00463.unl number of rows = 1 }

create table "maxmast".slrgn 
  (
    slrgn_region char(5) not null ,
    slrgn_rgnname char(30) not null ,
    slrgn_lud date not null ,
    slrgn_lui char(10) not null 
  );
revoke all on "maxmast".slrgn from "public";

create unique index "maxmast".slrgn_region on "maxmast".slrgn 
    (slrgn_region);
{ TABLE "maxmast".slslsp row size = 148 number of columns = 17 index size = 21 }
{ unload file name = slsls00464.unl number of rows = 2 }

create table "maxmast".slslsp 
  (
    slr_slsperson char(10) not null ,
    slr_slspname char(20) not null ,
    slr_aprdvalue float not null ,
    slr_aprdcost float not null ,
    slr_aytdval float not null ,
    slr_aytdcost float not null ,
    slr_bprdvalue float not null ,
    slr_bprdcost float not null ,
    slr_bytdvalue float not null ,
    slr_bytdcost float not null ,
    slr_lui char(10) not null ,
    slr_lud date not null ,
    slr_ndcode char(10) not null ,
    slr_terrman char(10) not null ,
    slr_territory char(10) not null ,
    slr_geog char(5) not null ,
    slr_salesoff char(5) not null 
  );
revoke all on "maxmast".slslsp from "public";

create unique index "maxmast".slr_slsperson on "maxmast".slslsp 
    (slr_slsperson);
{ TABLE "maxmast".slter row size = 54 number of columns = 5 index size = 13 }
{ unload file name = slter00466.unl number of rows = 1 }

create table "maxmast".slter 
  (
    slter_territory char(5) not null ,
    slter_terrname char(30) not null ,
    slter_region char(5) not null ,
    slter_lud date not null ,
    slter_lui char(10) not null 
  );
revoke all on "maxmast".slter from "public";

create unique index "maxmast".slter_territory on "maxmast".slter 
    (slter_territory);
{ TABLE "maxmast".sltx1 row size = 18 number of columns = 2 index size = 33 }
{ unload file name = sltx100469.unl number of rows = 0 }

create table "maxmast".sltx1 
  (
    sltx1_custcode char(10) not null ,
    sltx1_link char(8) not null 
  );
revoke all on "maxmast".sltx1 from "public";

create unique index "maxmast".sltx1_tkey1 on "maxmast".sltx1 (sltx1_custcode,
    sltx1_link);
{ TABLE "maxmast".sltx2 row size = 41 number of columns = 8 index size = 184 }
{ unload file name = sltx200470.unl number of rows = 0 }

create table "maxmast".sltx2 
  (
    sltx2_proofno integer not null ,
    sltx2_futyn char(1) not null ,
    sltx2_tranno float not null ,
    sltx2_flag integer not null ,
    sltx2_currcode char(4) not null ,
    sltx2_custcode char(10) not null ,
    sltx2_batch char(6) not null ,
    sltx2_batchno integer not null 
  );
revoke all on "maxmast".sltx2 from "public";

create index "maxmast".sltx2_key1 on "maxmast".sltx2 (sltx2_flag,
    sltx2_proofno,sltx2_currcode,sltx2_futyn,sltx2_batch,sltx2_custcode,
    sltx2_tranno);
create unique index "maxmast".sltx2_key2 on "maxmast".sltx2 (sltx2_flag,
    sltx2_proofno,sltx2_batch,sltx2_currcode,sltx2_futyn,sltx2_custcode,
    sltx2_tranno);
create unique index "maxmast".sltx2_key3 on "maxmast".sltx2 (sltx2_flag,
    sltx2_proofno,sltx2_custcode,sltx2_currcode,sltx2_futyn,sltx2_batch,
    sltx2_tranno);
{ TABLE "maxmast".slview row size = 60 number of columns = 9 index size = 33 }
{ unload file name = slvie00471.unl number of rows = 0 }

create table "maxmast".slview 
  (
    slv_intref char(10) not null ,
    slv_lineno integer not null ,
    slv_sublno integer not null ,
    slv_fileid integer not null ,
    slv_keytype char(1) not null ,
    slv_tranno float not null ,
    slv_accode char(15) not null ,
    slv_lui char(10) not null ,
    slv_lud date not null 
  );
revoke all on "maxmast".slview from "public";

create unique index "maxmast".slv_key on "maxmast".slview (slv_intref,
    slv_lineno,slv_sublno);
{ TABLE "maxmast".terminal row size = 44 number of columns = 7 index size = 21 }
{ unload file name = termi00472.unl number of rows = 0 }

create table "maxmast".terminal 
  (
    term_term char(10) not null ,
    term_printid char(8) not null ,
    term_attrlist char(10) not null ,
    term_user char(10) not null ,
    term_coid char(4) not null ,
    term_inuse char(1) not null ,
    term_attached char(1) not null 
  );
revoke all on "maxmast".terminal from "public";

create unique index "maxmast".term_term on "maxmast".terminal 
    (term_term);
{ TABLE "maxmast".tranmask row size = 20 number of columns = 5 index size = 34 }
{ unload file name = tranm00473.unl number of rows = 0 }

create table "maxmast".tranmask 
  (
    tmask_lang char(4) not null ,
    tmask_type char(1) not null ,
    tmask_format char(5) not null ,
    tmask_mask char(9) not null ,
    tmask_processed char(1) not null 
  );
revoke all on "maxmast".tranmask from "public";

create unique index "maxmast".tmask_key on "maxmast".tranmask 
    (tmask_lang,tmask_type,tmask_format,tmask_mask);
{ TABLE "maxmast".translate row size = 19 number of columns = 6 index size = 28 }
{ unload file name = trans00474.unl number of rows = 0 }

create table "maxmast".translate 
  (
    tran_lang char(4) not null ,
    tran_type char(1) not null ,
    tran_code char(9) not null ,
    tran_action char(3) not null ,
    tran_prefix char(1) not null ,
    tran_processed char(1) not null 
  );
revoke all on "maxmast".translate from "public";

create unique index "maxmast".tran_key1 on "maxmast".translate 
    (tran_lang,tran_type,tran_prefix,tran_code);
{ TABLE "maxmast".tredi row size = 177 number of columns = 11 index size = 12 }
{ unload file name = tredi00475.unl number of rows = 0 }

create table "maxmast".tredi 
  (
    tredi_serial serial not null ,
    tredi_editype char(6) not null ,
    tredi_account char(17) not null ,
    tredi_item char(35) not null ,
    tredi_maxitem char(35) not null ,
    tredi_schedule char(17) not null ,
    tredi_shipref char(17) not null ,
    tredi_delnoteno char(17) not null ,
    tredi_trandate date not null ,
    tredi_quantity float not null ,
    tredi_docno char(17) not null 
  );
revoke all on "maxmast".tredi from "public";

create unique index "maxmast".tredi_serial on "maxmast".tredi 
    (tredi_serial);
{ TABLE "maxmast".txihi row size = 452 number of columns = 25 index size = 12 }
{ unload file name = txihi00476.unl number of rows = 1 }

create table "maxmast".txihi 
  (
    txihi_arrivals char(1) not null ,
    txihi_dispatch char(1) not null ,
    txihi_month integer not null ,
    txihi_year integer not null ,
    txihi_tvatreg char(9) not null ,
    txihi_tbranch char(3) not null ,
    txihi_tname char(40) not null ,
    txihi_taddr1 char(30) not null ,
    txihi_taddr2 char(30) not null ,
    txihi_taddr3 char(30) not null ,
    txihi_taddr4 char(30) not null ,
    txihi_taddr5 char(30) not null ,
    txihi_tpostcd char(10) not null ,
    txihi_avatreg char(9) not null ,
    txihi_abranch char(3) not null ,
    txihi_aname char(40) not null ,
    txihi_aaddr1 char(30) not null ,
    txihi_aaddr2 char(30) not null ,
    txihi_aaddr3 char(30) not null ,
    txihi_aaddr4 char(30) not null ,
    txihi_aaddr5 char(30) not null ,
    txihi_apostcd char(10) not null ,
    txihi_serial serial not null ,
    txihi_lud date not null ,
    txihi_lui char(10) not null 
  );
revoke all on "maxmast".txihi from "public";

create unique index "maxmast".txihi_serial on "maxmast".txihi 
    (txihi_serial);
{ TABLE "maxmast".txiid row size = 98 number of columns = 17 index size = 55 }
{ unload file name = txiid00477.unl number of rows = 19 }

create table "maxmast".txiid 
  (
    txiid_ordnum char(15) not null ,
    txiid_ordlin integer not null ,
    txiid_commodity char(8) not null ,
    txiid_value integer not null ,
    txiid_delterms char(3) not null ,
    txiid_nature char(2) not null ,
    txiid_mass integer not null ,
    txiid_suppunits integer not null ,
    txiid_country char(5) not null ,
    txiid_transport char(1) not null ,
    txiid_origin char(2) not null ,
    txiid_consign integer not null ,
    txiid_traderref char(14) not null ,
    txiid_lud date not null ,
    txiid_lui char(10) not null ,
    txiid_release integer not null ,
    txiid_account char(10) not null 
  );
revoke all on "maxmast".txiid from "public";

create unique index "maxmast".txiid_key on "maxmast".txiid (txiid_ordnum,
    txiid_ordlin,txiid_release,txiid_account);
{ TABLE "maxmast".txiii row size = 127 number of columns = 25 index size = 91 }
{ unload file name = txiii00478.unl number of rows = 33 }

create table "maxmast".txiii 
  (
    txiii_flow char(1) not null ,
    txiii_refdate date not null ,
    txiii_commodity char(8) not null ,
    txiii_value integer not null ,
    txiii_delterms char(3) not null ,
    txiii_nature char(2) not null ,
    txiii_mass integer not null ,
    txiii_suppunits integer not null ,
    txiii_country char(5) not null ,
    txiii_transport char(1) not null ,
    txiii_origin char(2) not null ,
    txiii_consign integer not null ,
    txiii_traderref char(14) not null ,
    txiii_ordnum char(10) not null ,
    txiii_intref char(8) not null ,
    txiii_serial serial not null ,
    txiii_lud date not null ,
    txiii_lui char(10) not null ,
    txiii_branch char(3) not null ,
    txiii_suppdecpr char(1) not null ,
    txiii_ordlin integer not null ,
    txiii_release integer not null ,
    txiii_month integer not null ,
    txiii_year integer not null ,
    txiii_vatlink char(15) not null 
  );
revoke all on "maxmast".txiii from "public";

create unique index "maxmast".txiii_key2 on "maxmast".txiii (txiii_flow,
    txiii_branch,txiii_refdate,txiii_serial);
create unique index "maxmast".txiii_serial on "maxmast".txiii 
    (txiii_serial);
create index "maxmast".txiii_traderref on "maxmast".txiii (txiii_traderref);
    
create index "maxmast".txiii_vatlink on "maxmast".txiii (txiii_vatlink);
    
{ TABLE "maxmast".txpers row size = 32 number of columns = 4 index size = 30 }
{ unload file name = txper00480.unl number of rows = 105 }

create table "maxmast".txpers 
  (
    txper_year integer not null ,
    txper_period integer not null ,
    txper_desc char(20) not null ,
    txper_perend date not null 
  );
revoke all on "maxmast".txpers from "public";

create unique index "maxmast".txper_key on "maxmast".txpers (txper_year,
    txper_period);
create index "maxmast".txper_perend on "maxmast".txpers (txper_perend);
    
{ TABLE "maxmast".users row size = 116 number of columns = 14 index size = 63 }
{ unload file name = users00483.unl number of rows = 0 }

create table "maxmast".users 
  (
    us_user char(10) not null ,
    us_coid char(4) not null ,
    us_name char(30) not null ,
    us_lang char(4) not null ,
    us_secgrp char(26) not null ,
    us_home char(8) not null ,
    us_bypass char(8) not null ,
    us_punc char(1) not null ,
    us_seq char(1) not null ,
    us_deli char(1) not null ,
    us_timeout char(1) not null ,
    us_minus char(1) not null ,
    us_fill char(1) not null ,
    us_loginid char(20) not null 
  );
revoke all on "maxmast".users from "public";

create unique index "maxmast".us_key on "maxmast".users (us_user,
    us_coid);
create index "maxmast".us_loginid on "maxmast".users (us_loginid);
    
{ TABLE "maxmast".uz_stdxrte row size = 12 number of columns = 2 index size = 12 
              }
{ unload file name = uz_st00484.unl number of rows = 7 }

create table "maxmast".uz_stdxrte 
  (
    curr_code char(4) not null ,
    x_rate float not null 
  );
revoke all on "maxmast".uz_stdxrte from "public";

create unique index "maxmast".ix627_1 on "maxmast".uz_stdxrte 
    (curr_code);
{ TABLE "maxmast".v_rcpt_in3 row size = 84 number of columns = 8 index size = 0 }
{ unload file name = v_rcp00485.unl number of rows = 0 }

create table "maxmast".v_rcpt_in3 
  (
    v_wo3 char(15),
    v_qty_r3 decimal(16),
    v_item_id3 char(15),
    v_lab_ucst3 decimal(16),
    v_mat_ucst3 decimal(16),
    v_lab_cost3 decimal(16),
    v_mat_cost3 decimal(16),
    v_date3 date
  );
revoke all on "maxmast".v_rcpt_in3 from "public";

{ TABLE "maxmast".aradds row size = 140 number of columns = 20 index size = 46 }
{ unload file name = aradd00486.unl number of rows = 0 }

create table "maxmast".aradds 
  (
    aradd_asset char(15) not null ,
    aradd_date date not null ,
    aradd_seq serial not null ,
    aradd_type char(1) not null ,
    aradd_value float not null ,
    aradd_profit float not null ,
    aradd_account char(10) not null ,
    aradd_year integer not null ,
    aradd_period integer not null ,
    aradd_report char(1) not null ,
    aradd_qty float not null ,
    aradd_ccadcum float not null ,
    aradd_ccadty float not null ,
    aradd_ccavbf float not null ,
    aradd_ccadbl float not null ,
    aradd_ccarep float not null ,
    aradd_ccawdv float not null ,
    aradd_linkref char(15) not null ,
    aradd_valdep float not null ,
    aradd_chcode char(2) not null 
  );
revoke all on "maxmast".aradds from "public";

create unique index "maxmast".aradd_seq on "maxmast".aradds (aradd_seq);
    
create unique index "maxmast".aradd_key on "maxmast".aradds (aradd_asset,
    aradd_seq);
{ TABLE "maxmast".arbat row size = 148 number of columns = 23 index size = 28 }
{ unload file name = arbat00487.unl number of rows = 0 }

create table "maxmast".arbat 
  (
    arbat_asset char(15) not null ,
    arbat_town char(20) not null ,
    arbat_street char(20) not null ,
    arbat_strtno char(7) not null ,
    arbat_cadastre char(10) not null ,
    arbat_plot char(8) not null ,
    arbat_bdclass char(10) not null ,
    arbat_permanent char(1) not null ,
    arbat_noofcrane integer not null ,
    arbat_cranarea integer not null ,
    arbat_facade integer not null ,
    arbat_cbarea integer not null ,
    arbat_bdvol integer not null ,
    arbat_rooftype char(1) not null ,
    arbat_roofarea integer not null ,
    arbat_flsharea integer not null ,
    arbat_glssarea integer not null ,
    arbat_floorup integer not null ,
    arbat_floordow integer not null ,
    arbat_height integer not null ,
    arbat_depth integer not null ,
    arbat_length integer not null ,
    arbat_width integer not null 
  );
revoke all on "maxmast".arbat from "public";

create unique index "maxmast".arbat_asset on "maxmast".arbat (arbat_asset);
    
{ TABLE "maxmast".arctd row size = 318 number of columns = 21 index size = 136 }
{ unload file name = arctd00488.unl number of rows = 0 }

create table "maxmast".arctd 
  (
    arctd_asset char(15) not null ,
    arctd_respon char(3) not null ,
    arctd_group2 char(9) not null ,
    arctd_producer char(20) not null ,
    arctd_country char(5) not null ,
    arctd_yofmanuf integer not null ,
    arctd_yofget integer not null ,
    arctd_powerin float not null ,
    arctd_desc1 char(70) not null ,
    arctd_desc2 char(70) not null ,
    arctd_pmcost float not null ,
    arctd_brcost float not null ,
    arctd_attr1 char(1) not null ,
    arctd_attr2 char(4) not null ,
    arctd_attr3 char(15) not null ,
    arctd_group char(4) not null ,
    arctd_location char(6) not null ,
    arctd_desc char(40) not null ,
    arctd_product char(15) not null ,
    arctd_buildtech char(1) not null ,
    arctd_adjpurch float not null 
  );
revoke all on "maxmast".arctd from "public";

create unique index "maxmast".arctd_asset on "maxmast".arctd (arctd_asset);
    
create unique index "maxmast".arctd_respkey on "maxmast".arctd 
    (arctd_respon,arctd_group,arctd_asset);
create unique index "maxmast".arctd_grkey on "maxmast".arctd (arctd_group,
    arctd_asset);
create unique index "maxmast".arctd_user2key on "maxmast".arctd 
    (arctd_attr2,arctd_asset);
{ TABLE "maxmast".arcyc row size = 24 number of columns = 6 index size = 12 }
{ unload file name = arcyc00489.unl number of rows = 0 }

create table "maxmast".arcyc 
  (
    arcyc_cycle integer not null ,
    arcyc_inter1 integer not null ,
    arcyc_inter2 integer not null ,
    arcyc_inter3 integer not null ,
    arcyc_inter4 integer not null ,
    arcyc_inter5 integer not null 
  );
revoke all on "maxmast".arcyc from "public";

create unique index "maxmast".arcyc_cycle on "maxmast".arcyc (arcyc_cycle);
    
{ TABLE "maxmast".argroup row size = 285 number of columns = 32 index size = 12 }
{ unload file name = argro00490.unl number of rows = 7 }

create table "maxmast".argroup 
  (
    argrp_group char(4) not null ,
    argrp_desc char(30) not null ,
    argrp_method char(1) not null ,
    argrp_term integer not null ,
    argrp_qtyuse char(1) not null ,
    argrp_type char(1) not null ,
    argrp_capcode char(1) not null ,
    argrp_glasset char(15) not null ,
    argrp_gladds char(15) not null ,
    argrp_gldisp char(15) not null ,
    argrp_gltran char(15) not null ,
    argrp_gldeb char(15) not null ,
    argrp_glcr char(15) not null ,
    argrp_glprof char(15) not null ,
    argrp_depcent float not null ,
    argrp_plant char(1) not null ,
    argrp_planttcd integer not null ,
    argrp_glrevplnt char(15) not null ,
    argrp_glrevtran char(15) not null ,
    argrp_movehist char(1) not null ,
    argrp_dep2cent float not null ,
    argrp_drtcode integer not null ,
    argrp_eltcode char(2) not null ,
    argrp_cicode char(2) not null ,
    argrp_glccaresv char(15) not null ,
    argrp_glccabl char(15) not null ,
    argrp_glcumdep char(15) not null ,
    argrp_sgroup char(1) not null ,
    argrp_glccadisp char(15) not null ,
    argrp_glddep char(15) not null ,
    argrp_txdtyp char(1) not null ,
    argrp_txdgrp char(1) not null 
  );
revoke all on "maxmast".argroup from "public";

create unique index "maxmast".argrp_group on "maxmast".argroup 
    (argrp_group);
{ TABLE "maxmast".arloc row size = 51 number of columns = 3 index size = 15 }
{ unload file name = arloc00491.unl number of rows = 1 }

create table "maxmast".arloc 
  (
    arloc_location char(6) not null ,
    arloc_desc char(30) not null ,
    arloc_modifier char(15) not null 
  );
revoke all on "maxmast".arloc from "public";

create unique index "maxmast".arloc_location on "maxmast".arloc 
    (arloc_location);
{ TABLE "maxmast".armas row size = 380 number of columns = 55 index size = 195 }
{ unload file name = armas00492.unl number of rows = 285 }

create table "maxmast".armas 
  (
    arm_attcode char(15) not null ,
    arm_desc char(40) not null ,
    arm_group char(4) not null ,
    arm_product char(15) not null ,
    arm_location char(6) not null ,
    arm_type char(1) not null ,
    arm_method char(1) not null ,
    arm_term integer not null ,
    arm_depcent float not null ,
    arm_residual float not null ,
    arm_qty float not null ,
    arm_plant char(1) not null ,
    arm_dispdate date not null ,
    arm_capcode char(1) not null ,
    arm_supplier char(10) not null ,
    arm_purdate date not null ,
    arm_puryear integer not null ,
    arm_purper integer not null ,
    arm_purprice float not null ,
    arm_bfvalue float not null ,
    arm_tydepn float not null ,
    arm_tyadds float not null ,
    arm_tydisp float not null ,
    arm_tddepn float not null ,
    arm_pldisp float not null ,
    arm_wdv float not null ,
    arm_bfallow float not null ,
    arm_tdallow float not null ,
    arm_asset char(15) not null ,
    arm_adjpurch float not null ,
    arm_wtdrdepn char(2) not null ,
    arm_jobdrdepn char(5) not null ,
    arm_scdrdepn char(4) not null ,
    arm_transfers float not null ,
    arm_eltcode char(2) not null ,
    arm_cicode char(2) not null ,
    arm_ccabase float not null ,
    arm_ccawdv float not null ,
    arm_ccavbf float not null ,
    arm_ccadty float not null ,
    arm_ccadbl float not null ,
    arm_ccarep float not null ,
    arm_uom char(7) not null ,
    arm_ccadcum float not null ,
    arm_dep2cent float not null ,
    arm_chcode char(2) not null ,
    arm_tranpp float not null ,
    arm_txdtyp char(1) not null ,
    arm_txdgrp char(1) not null ,
    arm_txdepn float not null ,
    arm_txtydp float not null ,
    arm_txyeim integer not null ,
    arm_txpurch float not null ,
    arm_txdstdt date not null ,
    arm_txpused char(1) not null 
  );
revoke all on "maxmast".armas from "public";

create index "maxmast".arm_attcode on "maxmast".armas (arm_attcode);
    
create unique index "maxmast".arm_asset on "maxmast".armas (arm_asset);
    
create unique index "maxmast".arm_lockey on "maxmast".armas (arm_location,
    arm_group,arm_asset);
create unique index "maxmast".arm_grpkey on "maxmast".armas (arm_group,
    arm_location,arm_asset);
create unique index "maxmast".arm_prodkey on "maxmast".armas (arm_product,
    arm_asset);
{ TABLE "maxmast".arres row size = 135 number of columns = 13 index size = 28 }
{ unload file name = arres00494.unl number of rows = 0 }

create table "maxmast".arres 
  (
    arres_resid char(15) not null ,
    arres_par11 char(10) not null ,
    arres_par12 char(10) not null ,
    arres_par21 char(10) not null ,
    arres_par22 char(10) not null ,
    arres_par31 char(10) not null ,
    arres_par32 char(10) not null ,
    arres_par41 char(10) not null ,
    arres_par42 char(10) not null ,
    arres_par51 char(10) not null ,
    arres_par52 char(10) not null ,
    arres_par61 char(10) not null ,
    arres_par62 char(10) not null 
  );
revoke all on "maxmast".arres from "public";

create unique index "maxmast".arres_resid on "maxmast".arres (arres_resid);
    
{ TABLE "maxmast".artat row size = 216 number of columns = 17 index size = 28 }
{ unload file name = artat00495.unl number of rows = 0 }

create table "maxmast".artat 
  (
    artat_asset char(15) not null ,
    artat_resid char(15) not null ,
    artat_typ char(20) not null ,
    artat_prodno char(20) not null ,
    artat_trancode char(1) not null ,
    artat_licplate char(7) not null ,
    artat_weight float not null ,
    artat_cycle integer not null ,
    artat_yofmaint integer not null ,
    artat_pofmaint integer not null ,
    artat_tdesc1 char(70) not null ,
    artat_tpar1 float not null ,
    artat_tpar2 float not null ,
    artat_tpar3 float not null ,
    artat_tpar4 float not null ,
    artat_tpar5 float not null ,
    artat_tpar6 float not null 
  );
revoke all on "maxmast".artat from "public";

create unique index "maxmast".artat_asset on "maxmast".artat (artat_asset);
    
{ TABLE "maxmast".artbf row size = 28 number of columns = 5 index size = 69 }
{ unload file name = artbf00496.unl number of rows = 0 }

create table "maxmast".artbf 
  (
    artbf_asset char(15) not null ,
    artbf_floorno integer not null ,
    artbf_aisle integer not null ,
    artbf_floorcat char(1) not null ,
    artbf_floorm2 integer not null 
  );
revoke all on "maxmast".artbf from "public";

create index "maxmast".artbf_asset on "maxmast".artbf (artbf_asset);
    
create unique index "maxmast".artbf_key1 on "maxmast".artbf (artbf_asset,
    artbf_floorno,artbf_aisle);
{ TABLE "maxmast".artta row size = 60 number of columns = 5 index size = 72 }
{ unload file name = artta00497.unl number of rows = 0 }

create table "maxmast".artta 
  (
    artta_asset char(15) not null ,
    artta_accid char(10) not null ,
    artta_technol char(3) not null ,
    artta_desc char(28) not null ,
    artta_yeofprod integer not null 
  );
revoke all on "maxmast".artta from "public";

create index "maxmast".artta_asset on "maxmast".artta (artta_asset);
    
create unique index "maxmast".artta_key1 on "maxmast".artta (artta_asset,
    artta_accid);
{ TABLE "maxmast".artxd row size = 37 number of columns = 7 index size = 7 }
{ unload file name = artxd00498.unl number of rows = 0 }

create table "maxmast".artxd 
  (
    artxd_txdgrp char(1) not null ,
    artxd_perc1 float not null ,
    artxd_perc2 float not null ,
    artxd_perc3 float not null ,
    artxd_coef1 integer not null ,
    artxd_coef2 integer not null ,
    artxd_coef3 integer not null 
  );
revoke all on "maxmast".artxd from "public";

create unique index "maxmast".artxd_txdgrp on "maxmast".artxd 
    (artxd_txdgrp);
{ TABLE "maxmast".asbbd row size = 89 number of columns = 15 index size = 127 }
{ unload file name = asbbd00499.unl number of rows = 0 }

create table "maxmast".asbbd 
  (
    asbbd_bbop char(15) not null ,
    asbbd_line integer not null ,
    asbbd_type char(1) not null ,
    asbbd_cnstraint char(15) not null ,
    asbbd_predays integer not null ,
    asbbd_postdays integer not null ,
    asbbd_fixload float not null ,
    asbbd_fqtyuom char(5) not null ,
    asbbd_ftimeunit char(1) not null ,
    asbbd_varload float not null ,
    asbbd_vqtyuom char(5) not null ,
    asbbd_vtimeunit char(1) not null ,
    asbbd_lud date not null ,
    asbbd_lui char(10) not null ,
    asbbd_negline integer not null 
  );
revoke all on "maxmast".asbbd from "public";

create unique index "maxmast".asbbd_key on "maxmast".asbbd (asbbd_bbop,
    asbbd_line);
create unique index "maxmast".asbbd_negkey on "maxmast".asbbd 
    (asbbd_bbop,asbbd_negline);
create unique index "maxmast".asbbd_cnstrkey on "maxmast".asbbd 
    (asbbd_type,asbbd_cnstraint,asbbd_bbop,asbbd_line);
{ TABLE "maxmast".asbbh row size = 86 number of columns = 5 index size = 28 }
{ unload file name = asbbh00500.unl number of rows = 0 }

create table "maxmast".asbbh 
  (
    asbbh_bbop char(15) not null ,
    asbbh_remarks char(56) not null ,
    asbbh_lud date not null ,
    asbbh_lui char(10) not null ,
    asbbh_inuse char(1) not null 
  );
revoke all on "maxmast".asbbh from "public";

create unique index "maxmast".asbbh_bbop on "maxmast".asbbh (asbbh_bbop);
    
{ TABLE "maxmast".ascap row size = 41 number of columns = 5 index size = 34 }
{ unload file name = ascap00501.unl number of rows = 0 }

create table "maxmast".ascap 
  (
    ascap_cnstraint char(15) not null ,
    ascap_date date not null ,
    ascap_capacity float not null ,
    ascap_lud date not null ,
    ascap_lui char(10) not null 
  );
revoke all on "maxmast".ascap from "public";

create unique index "maxmast".ascap_key on "maxmast".ascap (ascap_cnstraint,
    ascap_date);
{ TABLE "maxmast".ascon row size = 159 number of columns = 15 index size = 28 }
{ unload file name = ascon00502.unl number of rows = 0 }

create table "maxmast".ascon 
  (
    ascon_cnstraint char(15) not null ,
    ascon_manfac char(5) not null ,
    ascon_timeunit char(1) not null ,
    ascon_sun float not null ,
    ascon_mon float not null ,
    ascon_tue float not null ,
    ascon_wed float not null ,
    ascon_thu float not null ,
    ascon_fri float not null ,
    ascon_sat float not null ,
    ascon_loadpc float not null ,
    ascon_lud date not null ,
    ascon_lui char(10) not null ,
    ascon_remarks char(56) not null ,
    ascon_horizon integer not null 
  );
revoke all on "maxmast".ascon from "public";

create unique index "maxmast".ascon_cnstraint on "maxmast".ascon 
    (ascon_cnstraint);
{ TABLE "maxmast".aslod row size = 65 number of columns = 9 index size = 208 }
{ unload file name = aslod00503.unl number of rows = 0 }

create table "maxmast".aslod 
  (
    aslod_cnstraint char(15) not null ,
    aslod_date date not null ,
    aslod_rqtserial integer not null ,
    aslod_bbop char(15) not null ,
    aslod_line integer not null ,
    aslod_load float not null ,
    aslod_lud date not null ,
    aslod_lui char(10) not null ,
    aslod_timeunit char(1) not null 
  );
revoke all on "maxmast".aslod from "public";

create unique index "maxmast".aslod_key on "maxmast".aslod (aslod_bbop,
    aslod_line,aslod_date,aslod_rqtserial);
create unique index "maxmast".aslod_cnstrkey on "maxmast".aslod 
    (aslod_cnstraint,aslod_date,aslod_bbop,aslod_line,aslod_rqtserial);
    
create unique index "maxmast".aslod_rqtkey on "maxmast".aslod 
    (aslod_rqtserial,aslod_bbop,aslod_line,aslod_date);
create unique index "maxmast".aslod_bbopkey on "maxmast".aslod 
    (aslod_bbop,aslod_rqtserial,aslod_line,aslod_date);
{ TABLE "maxmast".asrqt row size = 72 number of columns = 9 index size = 208 }
{ unload file name = asrqt00504.unl number of rows = 0 }

create table "maxmast".asrqt 
  (
    asrqt_item char(15) not null ,
    asrqt_date date not null ,
    asrqt_rqtserial integer not null ,
    asrqt_bbop char(15) not null ,
    asrqt_line integer not null ,
    asrqt_dueqty float not null ,
    asrqt_lud date not null ,
    asrqt_lui char(10) not null ,
    asrqt_qtyos float not null 
  );
revoke all on "maxmast".asrqt from "public";

create unique index "maxmast".asrqt_key on "maxmast".asrqt (asrqt_bbop,
    asrqt_line,asrqt_date,asrqt_rqtserial);
create unique index "maxmast".asrqt_rqtkey on "maxmast".asrqt 
    (asrqt_rqtserial,asrqt_bbop,asrqt_line,asrqt_date);
create unique index "maxmast".asrqt_itemkey on "maxmast".asrqt 
    (asrqt_item,asrqt_date,asrqt_bbop,asrqt_line,asrqt_rqtserial);
    
create unique index "maxmast".asrqt_bbopkey on "maxmast".asrqt 
    (asrqt_bbop,asrqt_rqtserial,asrqt_line,asrqt_date);
{ TABLE "maxmast".assdr row size = 53 number of columns = 7 index size = 69 }
{ unload file name = assdr00505.unl number of rows = 0 }

create table "maxmast".assdr 
  (
    assdr_item char(15) not null ,
    assdr_date date not null ,
    assdr_lud date not null ,
    assdr_lui char(10) not null ,
    assdr_balance float not null ,
    assdr_qtyavail float not null ,
    assdr_negdate integer not null 
  );
revoke all on "maxmast".assdr from "public";

create unique index "maxmast".assdr_key on "maxmast".assdr (assdr_item,
    assdr_date);
create unique index "maxmast".assdr_negkey on "maxmast".assdr 
    (assdr_item,assdr_negdate);
{ TABLE "maxmast".bkacct row size = 360 number of columns = 33 index size = 49 }
{ unload file name = bkacc00506.unl number of rows = 1 }

create table "maxmast".bkacct 
  (
    bka_acctref char(10) not null ,
    bka_currency char(4) not null ,
    bka_banksort char(8) not null ,
    bka_acctno char(35) not null ,
    bka_balance float not null ,
    bka_stbalance float not null ,
    bka_stdate date not null ,
    bka_lastpage integer not null ,
    bka_reconbal float not null ,
    bka_recdate date not null ,
    bka_glaccount char(15) not null ,
    bka_cntrycode char(11) not null ,
    bka_acctname char(40) not null ,
    bka_userno char(6) not null ,
    bka_accttype char(1) not null ,
    bka_bacdev char(40) not null ,
    bka_password char(9) not null ,
    bka_limit float not null ,
    bka_giro char(1) not null ,
    bka_bkrevvar char(15) not null ,
    bka_revdate date not null ,
    bka_revtodate date not null ,
    bka_currrate float not null ,
    bka_brevalbal float not null ,
    bka_frevalbal float not null ,
    bka_suspacct char(15) not null ,
    bka_suspname char(30) not null ,
    bka_bkprforma char(15) not null ,
    bka_waiver char(1) not null ,
    bka_acintclk char(6) not null ,
    bka_orderclk char(6) not null ,
    bka_bkre2var char(15) not null ,
    bka_conmethod char(1) not null 
  );
revoke all on "maxmast".bkacct from "public";

create unique index "maxmast".bka_acctref on "maxmast".bkacct 
    (bka_acctref);
create unique index "maxmast".bka_glaccount on "maxmast".bkacct 
    (bka_glaccount);
{ TABLE "maxmast".bkarc row size = 308 number of columns = 29 index size = 45 }
{ unload file name = bkarc00507.unl number of rows = 0 }

create table "maxmast".bkarc 
  (
    bkarc_account char(30) not null ,
    bkarc_banksort char(8) not null ,
    bkarc_constant char(10) not null ,
    bkarc_extref char(30) not null ,
    bkarc_amount float not null ,
    bkarc_currency char(4) not null ,
    bkarc_subacct char(16) not null ,
    bkarc_comment char(30) not null ,
    bkarc_status char(1) not null ,
    bkarc_page integer not null ,
    bkarc_unalvl float not null ,
    bkarc_unalref char(8) not null ,
    bkarc_origacct char(30) not null ,
    bkarc_origsort char(8) not null ,
    bkarc_origcons char(10) not null ,
    bkarc_origref char(30) not null ,
    bkarc_origcurr char(4) not null ,
    bkarc_lud date not null ,
    bkarc_lui char(10) not null ,
    bkarc_acctref char(10) not null ,
    bkarc_paydate date not null ,
    bkarc_dbcr char(1) not null ,
    bkarc_origaref char(10) not null ,
    bkarc_origamnt float not null ,
    bkarc_origcval float not null ,
    bkarc_currvalue float not null ,
    bkarc_manual char(1) not null ,
    bkarc_btchmtch char(1) not null ,
    bkarc_serial serial not null 
  );
revoke all on "maxmast".bkarc from "public";

create unique index "maxmast".bkarc_key1 on "maxmast".bkarc (bkarc_acctref,
    bkarc_page,bkarc_serial);
create unique index "maxmast".bkarc_serial on "maxmast".bkarc 
    (bkarc_serial);
{ TABLE "maxmast".bkcva row size = 41 number of columns = 7 index size = 33 }
{ unload file name = bkcva00508.unl number of rows = 0 }

create table "maxmast".bkcva 
  (
    bkcva_acctref char(10) not null ,
    bkcva_currrate float not null ,
    bkcva_password integer not null ,
    bkcva_revdate date not null ,
    bkcva_lud date not null ,
    bkcva_lui char(10) not null ,
    bkcva_conmethod char(1) not null 
  );
revoke all on "maxmast".bkcva from "public";

create unique index "maxmast".bkcva_key on "maxmast".bkcva (bkcva_acctref,
    bkcva_currrate);
{ TABLE "maxmast".bkexh row size = 48 number of columns = 6 index size = 12 }
{ unload file name = bkexh00509.unl number of rows = 0 }

create table "maxmast".bkexh 
  (
    bkexh_currency char(4) not null ,
    bkexh_exslacct char(10) not null ,
    bkexh_explacct char(10) not null ,
    bkexh_exbkacct char(10) not null ,
    bkexh_lud date not null ,
    bkexh_lui char(10) not null 
  );
revoke all on "maxmast".bkexh from "public";

create unique index "maxmast".bkexh_currency on "maxmast".bkexh 
    (bkexh_currency);
{ TABLE "maxmast".bkfrm row size = 38 number of columns = 7 index size = 24 }
{ unload file name = bkfrm00510.unl number of rows = 0 }

create table "maxmast".bkfrm 
  (
    bkfrm_acctref char(10) not null ,
    bkfrm_domfor char(1) not null ,
    bkfrm_paydeb char(1) not null ,
    bkfrm_report char(9) not null ,
    bkfrm_printst char(5) not null ,
    bkfrm_printid char(8) not null ,
    bkfrm_btchsize integer not null 
  );
revoke all on "maxmast".bkfrm from "public";

create unique index "maxmast".bkfrm_key on "maxmast".bkfrm (bkfrm_acctref,
    bkfrm_domfor,bkfrm_paydeb);
{ TABLE "maxmast".bkint row size = 308 number of columns = 29 index size = 45 }
{ unload file name = bkint00511.unl number of rows = 0 }

create table "maxmast".bkint 
  (
    bkint_account char(30) not null ,
    bkint_banksort char(8) not null ,
    bkint_constant char(10) not null ,
    bkint_extref char(30) not null ,
    bkint_amount float not null ,
    bkint_currency char(4) not null ,
    bkint_subacct char(16) not null ,
    bkint_comment char(30) not null ,
    bkint_status char(1) not null ,
    bkint_page integer not null ,
    bkint_unalval float not null ,
    bkint_unalref char(8) not null ,
    bkint_origacct char(30) not null ,
    bkint_origsort char(8) not null ,
    bkint_origcons char(10) not null ,
    bkint_origref char(30) not null ,
    bkint_origcurr char(4) not null ,
    bkint_lud date not null ,
    bkint_lui char(10) not null ,
    bkint_serial serial not null ,
    bkint_acctref char(10) not null ,
    bkint_paydate date not null ,
    bkint_dbcr char(1) not null ,
    bkint_origaref char(10) not null ,
    bkint_origamnt float not null ,
    bkint_origcval float not null ,
    bkint_currvalue float not null ,
    bkint_manual char(1) not null ,
    bkint_btchmtch char(1) not null 
  );
revoke all on "maxmast".bkint from "public";

create unique index "maxmast".bkint_serial on "maxmast".bkint 
    (bkint_serial);
create unique index "maxmast".bkint_key1 on "maxmast".bkint (bkint_acctref,
    bkint_page,bkint_serial);
{ TABLE "maxmast".bkpayee row size = 309 number of columns = 27 index size = 64 }
{ unload file name = bkpay00512.unl number of rows = 213 }

create table "maxmast".bkpayee 
  (
    bkp_type char(1) not null ,
    bkp_code char(10) not null ,
    bkp_banksort char(8) not null ,
    bkp_acctno char(35) not null ,
    bkp_acctname char(40) not null ,
    bkp_payeeref char(35) not null ,
    bkp_paymethod char(1) not null ,
    bkp_altmethod char(3) not null ,
    bkp_currency char(4) not null ,
    bkp_sysused char(10) not null ,
    bkp_ndcode char(10) not null ,
    bkp_cntrycode char(11) not null ,
    bkp_acctref char(10) not null ,
    bkp_accttype char(1) not null ,
    bkp_docs char(1) not null ,
    bkp_rollno char(12) not null ,
    bkp_boeprov char(15) not null ,
    bkp_cccomm char(15) not null ,
    bkp_ccacct char(15) not null ,
    bkp_ccprov char(15) not null ,
    bkp_ccrate float not null ,
    bkp_taxreg char(15) not null ,
    bkp_supplier char(10) not null ,
    bkp_memo char(10) not null ,
    bkp_charges char(1) not null ,
    bkp_suffix char(3) not null ,
    bkp_constant char(10) not null 
  );
revoke all on "maxmast".bkpayee from "public";

create unique index "maxmast".bkp_code on "maxmast".bkpayee (bkp_code);
    
create unique index "maxmast".bkp_key on "maxmast".bkpayee (bkp_type,
    bkp_code);
create index "maxmast".bkp_ndcode on "maxmast".bkpayee (bkp_ndcode);
    
{ TABLE "maxmast".bkpaymnt row size = 327 number of columns = 43 index size = 718 
              }
{ unload file name = bkpay00513.unl number of rows = 24318 }

create table "maxmast".bkpaymnt 
  (
    bkpm_source char(1) not null ,
    bkpm_voucher char(8) not null ,
    bkpm_code char(10) not null ,
    bkpm_trandate date not null ,
    bkpm_status char(1) not null ,
    bkpm_currency char(4) not null ,
    bkpm_value float not null ,
    bkpm_batch char(6) not null ,
    bkpm_proof integer not null ,
    bkpm_memo char(20) not null ,
    bkpm_multicurr char(1) not null ,
    bkpm_trantype char(1) not null ,
    bkpm_userid char(4) not null ,
    bkpm_currvalue float not null ,
    bkpm_type char(1) not null ,
    bkpm_chequeno integer not null ,
    bkpm_acctref char(10) not null ,
    bkpm_discvalue float not null ,
    bkpm_ndcode char(10) not null ,
    bkpm_payname char(40) not null ,
    bkpm_batchref char(15) not null ,
    bkpm_revdate date not null ,
    bkpm_revalno integer not null ,
    bkpm_year integer not null ,
    bkpm_period integer not null ,
    bkpm_prooflist char(1) not null ,
    bkpm_linkref char(15) not null ,
    bkpm_banklink char(15) not null ,
    bkpm_batchprt char(1) not null ,
    bkpm_boeproof integer not null ,
    bkpm_ccauth char(10) not null ,
    bkpm_origcurr char(4) not null ,
    bkpm_origval float not null ,
    bkpm_origdisc float not null ,
    bkpm_withhold float not null ,
    bkpm_constant char(10) not null ,
    bkpm_paydate date not null ,
    bkpm_charges char(1) not null ,
    bkpm_acintref char(8) not null ,
    bkpm_orddate date not null ,
    bkpm_page integer not null ,
    bkpm_extref char(30) not null ,
    bkpm_docref char(8) not null 
  );
revoke all on "maxmast".bkpaymnt from "public";

create unique index "maxmast".bkpm_paykey on "maxmast".bkpaymnt 
    (bkpm_type,bkpm_code,bkpm_trandate,bkpm_status,bkpm_voucher);
    
create index "maxmast".bkpm_chequeno on "maxmast".bkpaymnt (bkpm_chequeno);
    
create unique index "maxmast".bkpm_acctkey on "maxmast".bkpaymnt 
    (bkpm_acctref,bkpm_trandate,bkpm_voucher);
create unique index "maxmast".bkpm_key on "maxmast".bkpaymnt (bkpm_source,
    bkpm_voucher,bkpm_trantype);
create unique index "maxmast".bkpm_revalkey on "maxmast".bkpaymnt 
    (bkpm_acctref,bkpm_voucher,bkpm_trandate);
create index "maxmast".bkpm_banklink on "maxmast".bkpaymnt (bkpm_banklink);
    
create unique index "maxmast".bkpm_key1 on "maxmast".bkpaymnt 
    (bkpm_extref,bkpm_trandate,bkpm_voucher);
create unique index "maxmast".bkpm_payeenq on "maxmast".bkpaymnt 
    (bkpm_code,bkpm_trandate,bkpm_voucher);
create index "maxmast".bkpm_key2 on "maxmast".bkpaymnt (bkpm_batch,
    bkpm_acctref,bkpm_voucher);
create index "maxmast".bkpm_statkey on "maxmast".bkpaymnt (bkpm_status,
    bkpm_voucher);
create unique index "maxmast".bkpm_proofkey on "maxmast".bkpaymnt 
    (bkpm_acctref,bkpm_source,bkpm_currency,bkpm_trandate,bkpm_voucher);
    
create unique index "maxmast".bkpm_key3 on "maxmast".bkpaymnt 
    (bkpm_source,bkpm_acctref,bkpm_code,bkpm_trandate,bkpm_voucher);
    
create unique index "maxmast".bkpm_key4 on "maxmast".bkpaymnt 
    (bkpm_boeproof,bkpm_code,bkpm_trandate,bkpm_voucher);
create unique index "maxmast".bkpm_key5 on "maxmast".bkpaymnt 
    (bkpm_batchref,bkpm_acctref,bkpm_voucher);
create index "maxmast".bkpm_dockey on "maxmast".bkpaymnt (bkpm_acctref,
    bkpm_extref);
create unique index "maxmast".bkpm_acintkey on "maxmast".bkpaymnt 
    (bkpm_acctref,bkpm_trandate,bkpm_acintref,bkpm_voucher);
create unique index "maxmast".bkpm_proffkey on "maxmast".bkpaymnt 
    (bkpm_acctref,bkpm_prooflist,bkpm_source,bkpm_currency,bkpm_trandate,
    bkpm_voucher);
{ TABLE "maxmast".bkrec row size = 262 number of columns = 29 index size = 454 }
{ unload file name = bkrec00514.unl number of rows = 13 }

create table "maxmast".bkrec 
  (
    bkr_source char(1) not null ,
    bkr_voucher char(8) not null ,
    bkr_code char(10) not null ,
    bkr_trandate date not null ,
    bkr_status char(1) not null ,
    bkr_currency char(4) not null ,
    bkr_value float not null ,
    bkr_batch char(6) not null ,
    bkr_proof integer not null ,
    bkr_chequeno integer not null ,
    bkr_memo char(20) not null ,
    bkr_trantype char(1) not null ,
    bkr_userid char(4) not null ,
    bkr_type char(1) not null ,
    bkr_multicurr char(1) not null ,
    bkr_currvalue float not null ,
    bkr_acctref char(10) not null ,
    bkr_page integer not null ,
    bkr_ndcode char(10) not null ,
    bkr_payname char(40) not null ,
    bkr_batchref char(15) not null ,
    bkr_linkref char(15) not null ,
    bkr_banklink char(15) not null ,
    bkr_ccauth char(10) not null ,
    bkr_origcurr char(4) not null ,
    bkr_origval float not null ,
    bkr_origdisc float not null ,
    bkr_extref char(30) not null ,
    bkr_docref char(8) not null 
  );
revoke all on "maxmast".bkrec from "public";

create unique index "maxmast".bkr_key on "maxmast".bkrec (bkr_source,
    bkr_voucher,bkr_trantype);
create index "maxmast".bkr_acctkey on "maxmast".bkrec (bkr_acctref,
    bkr_trandate);
create unique index "maxmast".bkr_pagekey on "maxmast".bkrec (bkr_acctref,
    bkr_page,bkr_trandate,bkr_voucher,bkr_trantype);
create index "maxmast".bkr_chqkey on "maxmast".bkrec (bkr_acctref,
    bkr_chequeno);
create unique index "maxmast".bkr_paykey on "maxmast".bkrec (bkr_type,
    bkr_code,bkr_trandate,bkr_status,bkr_voucher);
create unique index "maxmast".bkr_acctenq on "maxmast".bkrec (bkr_acctref,
    bkr_trandate,bkr_voucher);
create unique index "maxmast".bkr_payeenq on "maxmast".bkrec (bkr_code,
    bkr_trandate,bkr_voucher);
create unique index "maxmast".bkr_key1 on "maxmast".bkrec (bkr_extref,
    bkr_trandate,bkr_voucher);
create unique index "maxmast".bkr_key2 on "maxmast".bkrec (bkr_batch,
    bkr_acctref,bkr_voucher);
create unique index "maxmast".bkr_proofkey on "maxmast".bkrec 
    (bkr_acctref,bkr_source,bkr_currency,bkr_trandate,bkr_voucher);
    
create index "maxmast".bkr_key3 on "maxmast".bkrec (bkr_batchref,
    bkr_acctref,bkr_voucher);
{ TABLE "maxmast".bksus row size = 217 number of columns = 30 index size = 198 }
{ unload file name = bksus00515.unl number of rows = 0 }

create table "maxmast".bksus 
  (
    bksus_source char(1) not null ,
    bksus_voucher char(8) not null ,
    bksus_code char(10) not null ,
    bksus_trandate date not null ,
    bksus_status char(1) not null ,
    bksus_currency char(4) not null ,
    bksus_value float not null ,
    bksus_batch char(6) not null ,
    bksus_docref char(8) not null ,
    bksus_proof integer not null ,
    bksus_memo char(20) not null ,
    bksus_multicurr char(1) not null ,
    bksus_trantype char(1) not null ,
    bksus_userid char(4) not null ,
    bksus_currvalue float not null ,
    bksus_type char(1) not null ,
    bksus_chequeno integer not null ,
    bksus_acctref char(10) not null ,
    bksus_discvalue float not null ,
    bksus_ndcode char(10) not null ,
    bksus_payname char(40) not null ,
    bksus_batchref char(15) not null ,
    bksus_revdate date not null ,
    bksus_revalno integer not null ,
    bksus_year integer not null ,
    bksus_period integer not null ,
    bksus_prooflist char(1) not null ,
    bksus_prepno char(10) not null ,
    bksus_constant char(10) not null ,
    bksus_paydate date not null 
  );
revoke all on "maxmast".bksus from "public";

create unique index "maxmast".bksus_paykey on "maxmast".bksus 
    (bksus_type,bksus_code,bksus_trandate,bksus_status,bksus_voucher);
    
create unique index "maxmast".bksus_acctkey on "maxmast".bksus 
    (bksus_acctref,bksus_trandate,bksus_voucher);
create unique index "maxmast".bksus_key on "maxmast".bksus (bksus_source,
    bksus_voucher,bksus_trantype);
create unique index "maxmast".bksus_revalkey on "maxmast".bksus 
    (bksus_acctref,bksus_voucher,bksus_trandate);
create unique index "maxmast".bksus_proofkey on "maxmast".bksus 
    (bksus_proof,bksus_voucher);
create index "maxmast".bksus_dockey on "maxmast".bksus (bksus_acctref,
    bksus_docref);
{ TABLE "maxmast".bksym row size = 47 number of columns = 7 index size = 21 }
{ unload file name = bksym00516.unl number of rows = 2 }

create table "maxmast".bksym 
  (
    bksym_constant char(10) not null ,
    bksym_desc char(20) not null ,
    bksym_ledger char(1) not null ,
    bksym_lud date not null ,
    bksym_lui char(10) not null ,
    bksym_trantype char(1) not null ,
    bksym_match char(1) not null 
  );
revoke all on "maxmast".bksym from "public";

create unique index "maxmast".bksym_constant on "maxmast".bksym 
    (bksym_constant);
{ TABLE "maxmast".bksyr row size = 69 number of columns = 5 index size = 66 }
{ unload file name = bksyr00517.unl number of rows = 0 }

create table "maxmast".bksyr 
  (
    bksyr_constant char(10) not null ,
    bksyr_extref char(30) not null ,
    bksyr_account char(15) not null ,
    bksyr_lud date not null ,
    bksyr_lui char(10) not null 
  );
revoke all on "maxmast".bksyr from "public";

create unique index "maxmast".bksyr_key on "maxmast".bksyr (bksyr_constant,
    bksyr_extref);
{ TABLE "maxmast".clbal row size = 63 number of columns = 8 index size = 258 }
{ unload file name = clbal00518.unl number of rows = 0 }

create table "maxmast".clbal 
  (
    clbal_dimno char(1) not null ,
    clbal_dimval char(15) not null ,
    clbal_account char(15) not null ,
    clbal_year integer not null ,
    clbal_period integer not null ,
    clbal_credit float not null ,
    clbal_debit float not null ,
    clbal_budget float not null 
  );
revoke all on "maxmast".clbal from "public";

create unique index "maxmast".clbal_key on "maxmast".clbal (clbal_dimno,
    clbal_account,clbal_dimval,clbal_year,clbal_period);
create unique index "maxmast".clbal_yearkey on "maxmast".clbal 
    (clbal_dimno,clbal_dimval,clbal_year,clbal_account,clbal_period);
    
create unique index "maxmast".clbal_dimkey on "maxmast".clbal 
    (clbal_dimno,clbal_dimval,clbal_account,clbal_year,clbal_period);
    
create unique index "maxmast".clbal_acckey on "maxmast".clbal 
    (clbal_account,clbal_year,clbal_period,clbal_dimno,clbal_dimval);
    
{ TABLE "maxmast".clcat row size = 153 number of columns = 18 index size = 28 }
{ unload file name = clcat00519.unl number of rows = 0 }

create table "maxmast".clcat 
  (
    clcat_item char(15) not null ,
    clcat_desckey char(8) not null ,
    clcat_descext char(33) not null ,
    clcat_manfac char(5) not null ,
    clcat_pcontrlr char(3) not null ,
    clcat_supplier char(10) not null ,
    clcat_branch char(4) not null ,
    clcat_price float not null ,
    clcat_uom char(5) not null ,
    clcat_balance float not null ,
    clcat_minstock float not null ,
    clcat_orderqty float not null ,
    clcat_clctype char(5) not null ,
    clcat_decimals integer not null ,
    clcat_store char(5) not null ,
    clcat_targetstk float not null ,
    clcat_glaccount char(15) not null ,
    clcat_stockauto char(1) not null 
  );
revoke all on "maxmast".clcat from "public";

create unique index "maxmast".clcat_item on "maxmast".clcat (clcat_item);
    
{ TABLE "maxmast".clcbg row size = 49 number of columns = 8 index size = 69 }
{ unload file name = clcbg00520.unl number of rows = 0 }

create table "maxmast".clcbg 
  (
    clcbg_costcen char(6) not null ,
    clcbg_year integer not null ,
    clcbg_period integer not null ,
    clcbg_clctype char(5) not null ,
    clcbg_budget float not null ,
    clcbg_costperc float not null ,
    clcbg_lud date not null ,
    clcbg_lui char(10) not null 
  );
revoke all on "maxmast".clcbg from "public";

create unique index "maxmast".clcbg_key on "maxmast".clcbg (clcbg_costcen,
    clcbg_clctype,clcbg_year,clcbg_period);
create unique index "maxmast".clcbg_key1 on "maxmast".clcbg (clcbg_year,
    clcbg_costcen,clcbg_clctype,clcbg_period);
{ TABLE "maxmast".clcen row size = 115 number of columns = 16 index size = 37 }
{ unload file name = clcen00521.unl number of rows = 0 }

create table "maxmast".clcen 
  (
    clcen_costcen char(6) not null ,
    clcen_shortdesc char(30) not null ,
    clcen_manfac char(5) not null ,
    clcen_coef1 char(5) not null ,
    clcen_coef2 char(5) not null ,
    clcen_coef3 char(5) not null ,
    clcen_coef4 char(5) not null ,
    clcen_coef5 char(4) not null ,
    clcen_perc1 float not null ,
    clcen_perc2 float not null ,
    clcen_perc3 float not null ,
    clcen_perc4 float not null ,
    clcen_perc5 float not null ,
    clcen_type char(1) not null ,
    clcen_resp char(3) not null ,
    clcen_parccen char(6) not null 
  );
revoke all on "maxmast".clcen from "public";

create unique index "maxmast".clcen_costcen on "maxmast".clcen 
    (clcen_costcen);
create unique index "maxmast".clcen_key1 on "maxmast".clcen (clcen_manfac,
    clcen_costcen);
{ TABLE "maxmast".clctp row size = 51 number of columns = 7 index size = 13 }
{ unload file name = clctp00522.unl number of rows = 0 }

create table "maxmast".clctp 
  (
    clctp_costype char(5) not null ,
    clctp_parctype char(5) not null ,
    clctp_desc char(25) not null ,
    clctp_prtorder integer not null ,
    clctp_prtortp char(10) not null ,
    clctp_type char(1) not null ,
    clctp_pardet char(1) not null 
  );
revoke all on "maxmast".clctp from "public";

create unique index "maxmast".clctp_costype on "maxmast".clctp 
    (clctp_costype);
{ TABLE "maxmast".clhst row size = 71 number of columns = 11 index size = 57 }
{ unload file name = clhst00523.unl number of rows = 0 }

create table "maxmast".clhst 
  (
    clhst_costcen char(6) not null ,
    clhst_costord char(15) not null ,
    clhst_clctype char(5) not null ,
    clhst_year integer not null ,
    clhst_period integer not null ,
    clhst_cost float not null ,
    clhst_budget float not null ,
    clhst_lud date not null ,
    clhst_lui char(10) not null ,
    clhst_frozen char(1) not null ,
    clhst_origcc char(6) not null 
  );
revoke all on "maxmast".clhst from "public";

create unique index "maxmast".clhst_key on "maxmast".clhst (clhst_costcen,
    clhst_costord,clhst_clctype,clhst_year,clhst_period);
{ TABLE "maxmast".cllnk row size = 17 number of columns = 4 index size = 51 }
{ unload file name = cllnk00524.unl number of rows = 0 }

create table "maxmast".cllnk 
  (
    cllnk_costcen char(6) not null ,
    cllnk_store char(5) not null ,
    cllnk_account char(5) not null ,
    cllnk_masttype char(1) not null 
  );
revoke all on "maxmast".cllnk from "public";

create unique index "maxmast".cllnk_key on "maxmast".cllnk (cllnk_costcen,
    cllnk_store,cllnk_account);
create index "maxmast".cllnk_key1 on "maxmast".cllnk (cllnk_store,
    cllnk_account);
{ TABLE "maxmast".clobg row size = 55 number of columns = 7 index size = 96 }
{ unload file name = clobg00525.unl number of rows = 0 }

create table "maxmast".clobg 
  (
    clobg_costord char(15) not null ,
    clobg_year integer not null ,
    clobg_period integer not null ,
    clobg_clctype char(5) not null ,
    clobg_budget float not null ,
    clobg_lud date not null ,
    clobg_lui char(15) not null 
  );
revoke all on "maxmast".clobg from "public";

create unique index "maxmast".clobg_key on "maxmast".clobg (clobg_costord,
    clobg_clctype,clobg_year,clobg_period);
create unique index "maxmast".clobg_key1 on "maxmast".clobg (clobg_year,
    clobg_costord,clobg_clctype,clobg_period);
{ TABLE "maxmast".clopn row size = 51 number of columns = 6 index size = 117 }
{ unload file name = clopn00526.unl number of rows = 0 }

create table "maxmast".clopn 
  (
    clopn_dimno char(1) not null ,
    clopn_dimval char(15) not null ,
    clopn_account char(15) not null ,
    clopn_year integer not null ,
    clopn_cropnbal float not null ,
    clopn_dbopnbal float not null 
  );
revoke all on "maxmast".clopn from "public";

create unique index "maxmast".clopn_key on "maxmast".clopn (clopn_dimno,
    clopn_account,clopn_dimval,clopn_year);
create unique index "maxmast".clopn_dimkey on "maxmast".clopn 
    (clopn_dimno,clopn_dimval,clopn_account,clopn_year);
{ TABLE "maxmast".clord row size = 153 number of columns = 12 index size = 99 }
{ unload file name = clord00527.unl number of rows = 0 }

create table "maxmast".clord 
  (
    clord_costord char(15) not null ,
    clord_status char(1) not null ,
    clord_desc char(45) not null ,
    clord_remarks char(45) not null ,
    clord_duedate date not null ,
    clord_findate date not null ,
    clord_lud date not null ,
    clord_lui char(10) not null ,
    clord_projman char(3) not null ,
    clord_costcen char(6) not null ,
    clord_type char(1) not null ,
    clord_parcord char(15) not null 
  );
revoke all on "maxmast".clord from "public";

create unique index "maxmast".clord_costord on "maxmast".clord 
    (clord_costord);
create unique index "maxmast".clord_key on "maxmast".clord (clord_costcen,
    clord_costord);
create unique index "maxmast".clord_key1 on "maxmast".clord (clord_projman,
    clord_costord);
{ TABLE "maxmast".cospm row size = 181 number of columns = 24 index size = 75 }
{ unload file name = cospm00528.unl number of rows = 0 }

create table "maxmast".cospm 
  (
    cospm_contract char(15) not null ,
    cospm_paylin integer not null ,
    cospm_paytype char(1) not null ,
    cospm_conlin integer not null ,
    cospm_desc char(45) not null ,
    cospm_percent float not null ,
    cospm_value float not null ,
    cospm_termscode char(2) not null ,
    cospm_invdate date not null ,
    cospm_retdays integer not null ,
    cospm_lud date not null ,
    cospm_lui char(10) not null ,
    cospm_adate date not null ,
    cospm_ordnum char(8) not null ,
    cospm_totvalue float not null ,
    cospm_discount float not null ,
    cospm_taxval float not null ,
    cospm_crdrflag char(1) not null ,
    cospm_paymntcat char(1) not null ,
    cospm_glaccount char(15) not null ,
    cospm_onrev integer not null ,
    cospm_offrev integer not null ,
    cospm_itaxstat char(10) not null ,
    cospm_taxcode char(1) not null 
  );
revoke all on "maxmast".cospm from "public";

create index "maxmast".cospm_key1 on "maxmast".cospm (cospm_contract,
    cospm_paylin);
create unique index "maxmast".cospm_key on "maxmast".cospm (cospm_contract,
    cospm_paylin,cospm_offrev);
{ TABLE "maxmast".crate row size = 41 number of columns = 9 index size = 19 }
{ unload file name = crate00529.unl number of rows = 0 }

create table "maxmast".crate 
  (
    crate_currency char(4) not null ,
    crate_type char(1) not null ,
    crate_effdate date not null ,
    crate_rate float not null ,
    crate_lui char(10) not null ,
    crate_lud date not null ,
    crate_conmethod char(1) not null ,
    crate_trunmeth char(1) not null ,
    crate_trunfac float not null 
  );
revoke all on "maxmast".crate from "public";

create unique index "maxmast".crate_key on "maxmast".crate (crate_currency,
    crate_type,crate_effdate);
{ TABLE "maxmast".cumas row size = 289 number of columns = 26 index size = 12 }
{ unload file name = cumas00530.unl number of rows = 10 }

create table "maxmast".cumas 
  (
    cum_currency char(4) not null ,
    cum_desc char(20) not null ,
    cum_shdesc char(3) not null ,
    cum_rate float not null ,
    cum_plcontrol char(15) not null ,
    cum_slcontrol char(15) not null ,
    cum_plrevvar char(15) not null ,
    cum_slrevvar char(15) not null ,
    cum_slcurvar char(15) not null ,
    cum_plcurvar char(15) not null ,
    cum_bkcurvar char(15) not null ,
    cum_effctrl char(1) not null ,
    cum_slpfcntrl char(15) not null ,
    cum_inemu char(1) not null ,
    cum_boeprov char(15) not null ,
    cum_decdesc char(20) not null ,
    cum_decplaces integer not null ,
    cum_conmethod char(1) not null ,
    cum_trunmeth char(1) not null ,
    cum_trunfac float not null ,
    cum_pertolce float not null ,
    cum_plcu2var char(15) not null ,
    cum_slcu2var char(15) not null ,
    cum_bkcu2var char(15) not null ,
    cum_plre2var char(15) not null ,
    cum_slre2var char(15) not null 
  );
revoke all on "maxmast".cumas from "public";

create unique index "maxmast".cum_currency on "maxmast".cumas 
    (cum_currency);
{ TABLE "maxmast".cusbk row size = 54 number of columns = 3 index size = 18 }
{ unload file name = cusbk00531.unl number of rows = 0 }

create table "maxmast".cusbk 
  (
    cbk_bankid char(8) not null ,
    cbk_bankdesc char(40) not null ,
    cbk_sortcode char(6) not null 
  );
revoke all on "maxmast".cusbk from "public";

create unique index "maxmast".cbk_bankid on "maxmast".cusbk (cbk_bankid);
    
{ TABLE "maxmast".dndpt row size = 124 number of columns = 10 index size = 13 }
{ unload file name = dndpt00532.unl number of rows = 0 }

create table "maxmast".dndpt 
  (
    dndpt_dept char(5) not null ,
    dndpt_deptname char(30) not null ,
    dndpt_group char(5) not null ,
    dndpt_levelno integer not null ,
    dndpt_manager char(30) not null ,
    dndpt_mgrinits char(3) not null ,
    dndpt_accname char(30) not null ,
    dndpt_accinits char(3) not null ,
    dndpt_lud date not null ,
    dndpt_lui char(10) not null 
  );
revoke all on "maxmast".dndpt from "public";

create unique index "maxmast".dndpt_dept on "maxmast".dndpt (dndpt_dept);
    
{ TABLE "maxmast".dnfnc row size = 86 number of columns = 7 index size = 13 }
{ unload file name = dnfnc00533.unl number of rows = 0 }

create table "maxmast".dnfnc 
  (
    dnfnc_function char(5) not null ,
    dnfnc_funcname char(30) not null ,
    dnfnc_levelno integer not null ,
    dnfnc_manager char(30) not null ,
    dnfnc_inits char(3) not null ,
    dnfnc_lud date not null ,
    dnfnc_lui char(10) not null 
  );
revoke all on "maxmast".dnfnc from "public";

create unique index "maxmast".dnfnc_function on "maxmast".dnfnc 
    (dnfnc_function);
{ TABLE "maxmast".dnprs row size = 457 number of columns = 16 index size = 13 }
{ unload file name = dnprs00534.unl number of rows = 0 }

create table "maxmast".dnprs 
  (
    dnprs_stream char(5) not null ,
    dnprs_strname char(30) not null ,
    dnprs_manager char(30) not null ,
    dnprs_inits char(3) not null ,
    dnprs_class1 char(10) not null ,
    dnprs_cdesc1 char(65) not null ,
    dnprs_class2 char(10) not null ,
    dnprs_cdesc2 char(65) not null ,
    dnprs_class3 char(10) not null ,
    dnprs_cdesc3 char(65) not null ,
    dnprs_class4 char(10) not null ,
    dnprs_cdesc4 char(65) not null ,
    dnprs_class5 char(10) not null ,
    dnprs_cdesc5 char(65) not null ,
    dnprs_lud date not null ,
    dnprs_lui char(10) not null 
  );
revoke all on "maxmast".dnprs from "public";

create unique index "maxmast".dnprs_stream on "maxmast".dnprs 
    (dnprs_stream);
{ TABLE "maxmast".dnrpg row size = 101 number of columns = 10 index size = 13 }
{ unload file name = dnrpg00535.unl number of rows = 0 }

create table "maxmast".dnrpg 
  (
    dnrpg_group char(5) not null ,
    dnrpg_groupname char(30) not null ,
    dnrpg_parent char(5) not null ,
    dnrpg_levelno integer not null ,
    dnrpg_function char(5) not null ,
    dnrpg_manager char(30) not null ,
    dnrpg_mgrinits char(3) not null ,
    dnrpg_manfac char(5) not null ,
    dnrpg_lud date not null ,
    dnrpg_lui char(10) not null 
  );
revoke all on "maxmast".dnrpg from "public";

create unique index "maxmast".dnrpg_group on "maxmast".dnrpg (dnrpg_group);
    
{ TABLE "maxmast".dorec row size = 82 number of columns = 10 index size = 132 }
{ unload file name = dorec00536.unl number of rows = 0 }

create table "maxmast".dorec 
  (
    dorec_ndcode char(10) not null ,
    dorec_menu char(8) not null ,
    dorec_sequence integer not null ,
    dorec_doctype char(1) not null ,
    dorec_prime char(1) not null ,
    dorec_custreqd char(1) not null ,
    dorec_lud date not null ,
    dorec_lui char(10) not null ,
    dorec_seq char(3) not null ,
    dorec_subject char(40) not null 
  );
revoke all on "maxmast".dorec from "public";

create unique index "maxmast".dorec_recipkey on "maxmast".dorec 
    (dorec_ndcode,dorec_seq,dorec_menu,dorec_sequence);
create unique index "maxmast".dorec_menukey on "maxmast".dorec 
    (dorec_menu,dorec_sequence,dorec_ndcode,dorec_seq);
create unique index "maxmast".dorec_dockey on "maxmast".dorec 
    (dorec_doctype,dorec_ndcode,dorec_seq,dorec_menu,dorec_sequence);
    
{ TABLE "maxmast".glapc row size = 118 number of columns = 36 index size = 7 }
{ unload file name = glapc00537.unl number of rows = 1 }

create table "maxmast".glapc 
  (
    glapc_key char(1) not null ,
    glapc_method char(1) not null ,
    glapc_paccount char(15) not null ,
    glapc_maccount char(15) not null ,
    glapc_raccount char(15) not null ,
    glapc_baccount char(15) not null ,
    glapc_stkacct char(1) not null ,
    glapc_contract char(1) not null ,
    glapc_prodgroup char(1) not null ,
    glapc_class1 char(1) not null ,
    glapc_class2 char(1) not null ,
    glapc_class3 char(1) not null ,
    glapc_class4 char(1) not null ,
    glapc_class5 char(1) not null ,
    glapc_item char(1) not null ,
    glapc_lud date not null ,
    glapc_lui char(10) not null ,
    glapc_resmeth char(1) not null ,
    glapc_store char(1) not null ,
    glapc_macctcons char(1) not null ,
    glapc_racctcons char(1) not null ,
    glapc_pacctcons char(1) not null ,
    glapc_bacctcons char(1) not null ,
    glapc_facility char(1) not null ,
    glapc_workcen char(1) not null ,
    glapc_rcontract char(1) not null ,
    glapc_rprdgroup char(1) not null ,
    glapc_r2class char(1) not null ,
    glapc_r1class char(1) not null ,
    glapc_r3class char(1) not null ,
    glapc_r4class char(1) not null ,
    glapc_r5class char(1) not null ,
    glapc_ritem char(1) not null ,
    glapc_costsplit char(1) not null ,
    glapc_grn char(1) not null ,
    glapc_ocaccount char(15) not null 
  );
revoke all on "maxmast".glapc from "public";

create unique index "maxmast".glapc_key on "maxmast".glapc (glapc_key);
    
{ TABLE "maxmast".glapt row size = 351 number of columns = 24 index size = 91 }
{ unload file name = glapt00538.unl number of rows = 431 }

create table "maxmast".glapt 
  (
    glapt_stkacct char(5) not null ,
    glapt_contract char(15) not null ,
    glapt_prodgroup char(6) not null ,
    glapt_classes char(10) not null ,
    glapt_item char(15) not null ,
    glapt_account char(15) not null ,
    glapt_remarks char(45) not null ,
    glapt_lud date not null ,
    glapt_lui char(10) not null ,
    glapt_store char(5) not null ,
    glapt_ident char(1) not null ,
    glapt_consnvtrn char(20) not null ,
    glapt_consgrn char(20) not null ,
    glapt_consword char(20) not null ,
    glapt_consmftrn char(20) not null ,
    glapt_mataccnt char(15) not null ,
    glapt_labaccnt char(15) not null ,
    glapt_oh1accnt char(15) not null ,
    glapt_oh2accnt char(15) not null ,
    glapt_subaccnt char(15) not null ,
    glapt_stockinv char(15) not null ,
    glapt_stockvar char(15) not null ,
    glapt_consrqmas char(20) not null ,
    glapt_oncaccnt char(15) not null 
  );
revoke all on "maxmast".glapt from "public";

create unique index "maxmast".glapt_key on "maxmast".glapt (glapt_ident,
    glapt_store,glapt_stkacct,glapt_contract,glapt_prodgroup,
    glapt_classes,glapt_item);
{ TABLE "maxmast".glbatch row size = 291 number of columns = 31 index size = 142 
              }
{ unload file name = glbat00539.unl number of rows = 0 }

create table "maxmast".glbatch 
  (
    glbat_unikey serial not null ,
    glbat_account char(15) not null ,
    glbat_year integer not null ,
    glbat_period integer not null ,
    glbat_trandate date not null ,
    glbat_trantype char(1) not null ,
    glbat_docref char(10) not null ,
    glbat_value float not null ,
    glbat_batch char(6) not null ,
    glbat_ledger char(1) not null ,
    glbat_ledacct char(10) not null ,
    glbat_contract char(15) not null ,
    glbat_comment char(56) not null ,
    glbat_proof integer not null ,
    glbat_fproof integer not null ,
    glbat_mendflg char(1) not null ,
    glbat_userid char(10) not null ,
    glbat_extdocref char(30) not null ,
    glbat_linkref char(15) not null ,
    glbat_linktype char(3) not null ,
    glbat_batchprt char(1) not null ,
    glbat_origacct char(15) not null ,
    glbat_basecurr char(4) not null ,
    glbat_costcen char(6) not null ,
    glbat_costord char(15) not null ,
    glbat_clctype char(5) not null ,
    glbat_clusr1 char(5) not null ,
    glbat_clusr2 char(15) not null ,
    glbat_dbcr char(1) not null ,
    glbat_exportser char(15) not null ,
    glbat_remcode integer not null 
  );
revoke all on "maxmast".glbatch from "public";

create unique index "maxmast".glbat_unikey on "maxmast".glbatch 
    (glbat_unikey);
create index "maxmast".glbat_key on "maxmast".glbatch (glbat_trandate,
    glbat_period);
create unique index "maxmast".glbat_batkey on "maxmast".glbatch 
    (glbat_batch,glbat_docref,glbat_unikey);
create index "maxmast".glbat_linkref on "maxmast".glbatch (glbat_linkref);
    
create unique index "maxmast".glbat_datkey on "maxmast".glbatch 
    (glbat_year,glbat_period,glbat_batch,glbat_docref,glbat_unikey);
    
{ TABLE "maxmast".glhist row size = 295 number of columns = 32 index size = 391 }
{ unload file name = glhis00540.unl number of rows = 5422559 }

create table "maxmast".glhist 
  (
    glh_unikey integer not null ,
    glh_account char(15) not null ,
    glh_year integer not null ,
    glh_period integer not null ,
    glh_trandate date not null ,
    glh_trantype char(1) not null ,
    glh_docref char(10) not null ,
    glh_value float not null ,
    glh_batch char(6) not null ,
    glh_ledger char(1) not null ,
    glh_ledacct char(10) not null ,
    glh_contract char(15) not null ,
    glh_comment char(56) not null ,
    glh_proof integer not null ,
    glh_fproof integer not null ,
    glh_mendflg char(1) not null ,
    glh_userid char(10) not null ,
    glh_extdocref char(30) not null ,
    glh_linkref char(15) not null ,
    glh_linktype char(3) not null ,
    glh_batchprt char(1) not null ,
    glh_origacct char(15) not null ,
    glh_basecurr char(4) not null ,
    glh_postdate date not null ,
    glh_costcen char(6) not null ,
    glh_costord char(15) not null ,
    glh_clctype char(5) not null ,
    glh_clusr1 char(5) not null ,
    glh_clusr2 char(15) not null ,
    glh_dbcr char(1) not null ,
    glh_exportser char(15) not null ,
    glh_remcode integer not null 
  );
revoke all on "maxmast".glhist from "public";

create unique index "maxmast".glh_unikey on "maxmast".glhist (glh_unikey);
    
create unique index "maxmast".glh_key on "maxmast".glhist (glh_account,
    glh_year,glh_period,glh_trandate,glh_unikey);
create index "maxmast".glh_linkref on "maxmast".glhist (glh_linkref);
    
create unique index "maxmast".glh_key1 on "maxmast".glhist (glh_docref,
    glh_trandate,glh_unikey);
create unique index "maxmast".glh_key3 on "maxmast".glhist (glh_proof,
    glh_year,glh_period,glh_unikey);
create unique index "maxmast".glh_key5 on "maxmast".glhist (glh_batch,
    glh_account,glh_trandate,glh_unikey);
create unique index "maxmast".glh_key6 on "maxmast".glhist (glh_account,
    glh_year,glh_period,glh_postdate,glh_unikey);
create unique index "maxmast".glh_key7 on "maxmast".glhist (glh_account,
    glh_postdate,glh_year,glh_period,glh_unikey);
create index "maxmast".glh_ledkey on "maxmast".glhist (glh_ledger,
    glh_ledacct,glh_year,glh_period);
create unique index "maxmast".glh_yperkey on "maxmast".glhist 
    (glh_year,glh_period,glh_account,glh_unikey);
{ TABLE "maxmast".glmas row size = 148 number of columns = 23 index size = 174 }
{ unload file name = glmas00541.unl number of rows = 539 }

create table "maxmast".glmas 
  (
    glm_account char(15) not null ,
    glm_actype char(1) not null ,
    glm_desc char(30) not null ,
    glm_dateopen date not null ,
    glm_password char(5) not null ,
    glm_sumflg char(1) not null ,
    glm_control char(1) not null ,
    glm_postflag char(1) not null ,
    glm_retain char(15) not null ,
    glm_history char(1) not null ,
    glm_class1 char(5) not null ,
    glm_class2 char(5) not null ,
    glm_class3 char(5) not null ,
    glm_class4 char(5) not null ,
    glm_class5 char(5) not null ,
    glm_consolid char(15) not null ,
    glm_summclass char(5) not null ,
    glm_dept char(5) not null ,
    glm_stream char(5) not null ,
    glm_clelem char(5) not null ,
    glm_clnotal char(5) not null ,
    glm_clctype char(5) not null ,
    glm_level integer not null 
  );
revoke all on "maxmast".glmas from "public";

create unique index "maxmast".glm_account on "maxmast".glmas (glm_account);
    
create index "maxmast".glm_consolid on "maxmast".glmas (glm_consolid);
    
create unique index "maxmast".glm_con_acct on "maxmast".glmas 
    (glm_consolid,glm_account);
create unique index "maxmast".glm_summacct on "maxmast".glmas 
    (glm_summclass,glm_account);
create unique index "maxmast".glm_typekey on "maxmast".glmas (glm_actype,
    glm_account);
{ TABLE "maxmast".glpara row size = 303 number of columns = 68 index size = 7 }
{ unload file name = glpar00542.unl number of rows = 1 }

create table "maxmast".glpara 
  (
    glpar_key char(1) not null ,
    glpar_retain char(15) not null ,
    glpar_maxper integer not null ,
    glpar_year integer not null ,
    glpar_curper integer not null ,
    glpar_consolid char(4) not null ,
    glpar_history char(1) not null ,
    glpar_pllist char(10) not null ,
    glpar_bslist char(10) not null ,
    glpar_listbat char(1) not null ,
    glpar_summary char(1) not null ,
    glpar_pend char(1) not null ,
    glpar_currency char(4) not null ,
    glpar_plnumber integer not null ,
    glpar_master char(4) not null ,
    glpar_multicurr char(1) not null ,
    glpar_proofreq char(1) not null ,
    glpar_pendreq char(1) not null ,
    glpar_weeks integer not null ,
    glpar_intercoac char(15) not null ,
    glpar_histyear integer not null ,
    glpar_histper integer not null ,
    glpar_jsuspense char(15) not null ,
    glpar_glbatch char(1) not null ,
    glpar_elements char(1) not null ,
    glpar_stlist char(10) not null ,
    glpar_ssuspense char(15) not null ,
    glpar_erlist char(1) not null ,
    glpar_esuspense char(15) not null ,
    glpar_glyears integer not null ,
    glpar_eurocurr char(4) not null ,
    glpar_culink integer not null ,
    glpar_custart integer not null ,
    glpar_twincurr char(4) not null ,
    glpar_convdate date not null ,
    glpar_convyear integer not null ,
    glpar_convper integer not null ,
    glpar_country char(5) not null ,
    glpar_dbcr char(1) not null ,
    glpar_glreverse char(1) not null ,
    glpar_exportser char(6) not null ,
    glpar_reportid char(15) not null ,
    glpar_exportsum char(1) not null ,
    glpar_comproof char(1) not null ,
    glpar_acctlen integer not null ,
    glpar_accttot char(1) not null ,
    glpar_branchcde char(4) not null ,
    glpar_desc char(20) not null ,
    glpar_intprefix char(4) not null ,
    glpar_intref integer not null ,
    glpar_maxlev integer not null ,
    glpar_newpage char(1) not null ,
    glpar_p1len integer not null ,
    glpar_p1type char(1) not null ,
    glpar_p2len integer not null ,
    glpar_p2type char(1) not null ,
    glpar_p3len integer not null ,
    glpar_p3type char(1) not null ,
    glpar_p4len integer not null ,
    glpar_p4type char(1) not null ,
    glpar_p5len integer not null ,
    glpar_p5type char(1) not null ,
    glpar_p6len integer not null ,
    glpar_p6type char(1) not null ,
    glpar_p7len integer not null ,
    glpar_p7type char(1) not null ,
    glpar_seclevel integer not null ,
    glpar_seclong integer not null 
  );
revoke all on "maxmast".glpara from "public";

create unique index "maxmast".glpar_key on "maxmast".glpara (glpar_key);
    
{ TABLE "maxmast".glstan row size = 157 number of columns = 17 index size = 25 }
{ unload file name = glsta00543.unl number of rows = 0 }

create table "maxmast".glstan 
  (
    glj_rectype char(1) not null ,
    glj_docref char(8) not null ,
    glj_seq integer not null ,
    glj_account char(15) not null ,
    glj_trandate date not null ,
    glj_trantype char(1) not null ,
    glj_value float not null ,
    glj_comment char(56) not null ,
    glj_percent float not null ,
    glj_postcnt integer not null ,
    glj_freq char(1) not null ,
    glj_costcen char(6) not null ,
    glj_costord char(15) not null ,
    glj_clctype char(5) not null ,
    glj_clusr1 char(5) not null ,
    glj_clusr2 char(15) not null ,
    glj_dbcr char(1) not null 
  );
revoke all on "maxmast".glstan from "public";

create unique index "maxmast".glj_key on "maxmast".glstan (glj_rectype,
    glj_docref,glj_seq);
{ TABLE "maxmast".gltran row size = 295 number of columns = 32 index size = 696 }
{ unload file name = gltra00544.unl number of rows = 21072 }

create table "maxmast".gltran 
  (
    glt_unikey integer not null ,
    glt_account char(15) not null ,
    glt_year integer not null ,
    glt_period integer not null ,
    glt_trandate date not null ,
    glt_trantype char(1) not null ,
    glt_docref char(10) not null ,
    glt_value float not null ,
    glt_batch char(6) not null ,
    glt_ledger char(1) not null ,
    glt_ledacct char(10) not null ,
    glt_contract char(15) not null ,
    glt_comment char(56) not null ,
    glt_proof integer not null ,
    glt_fproof integer not null ,
    glt_mendflg char(1) not null ,
    glt_userid char(10) not null ,
    glt_extdocref char(30) not null ,
    glt_linkref char(15) not null ,
    glt_linktype char(3) not null ,
    glt_batchprt char(1) not null ,
    glt_origacct char(15) not null ,
    glt_basecurr char(4) not null ,
    glt_postdate date not null ,
    glt_costcen char(6) not null ,
    glt_costord char(15) not null ,
    glt_clctype char(5) not null ,
    glt_clusr1 char(5) not null ,
    glt_clusr2 char(15) not null ,
    glt_dbcr char(1) not null ,
    glt_exportser char(15) not null ,
    glt_remcode integer not null 
  );
revoke all on "maxmast".gltran from "public";

create unique index "maxmast".glt_unikey on "maxmast".gltran (glt_unikey);
    
create unique index "maxmast".glt_key on "maxmast".gltran (glt_account,
    glt_year,glt_period,glt_proof,glt_fproof,glt_trandate,glt_unikey);
    
create index "maxmast".glt_batkey on "maxmast".gltran (glt_ledger,
    glt_batch,glt_docref,glt_unikey);
create index "maxmast".glt_linkref on "maxmast".gltran (glt_linkref);
    
create unique index "maxmast".glt_key1 on "maxmast".gltran (glt_docref,
    glt_trandate,glt_unikey);
create unique index "maxmast".glt_key2 on "maxmast".gltran (glt_account,
    glt_year,glt_period,glt_trandate,glt_unikey);
create unique index "maxmast".glt_key3 on "maxmast".gltran (glt_proof,
    glt_year,glt_period,glt_unikey);
create unique index "maxmast".glt_key4 on "maxmast".gltran (glt_fproof,
    glt_year,glt_period,glt_unikey);
create unique index "maxmast".glt_key5 on "maxmast".gltran (glt_batch,
    glt_account,glt_trandate,glt_unikey);
create unique index "maxmast".glt_linkkey on "maxmast".gltran 
    (glt_linkref,glt_linktype,glt_unikey);
create unique index "maxmast".glt_key6 on "maxmast".gltran (glt_account,
    glt_year,glt_period,glt_postdate,glt_unikey);
create unique index "maxmast".glt_key7 on "maxmast".gltran (glt_account,
    glt_postdate,glt_year,glt_period,glt_unikey);
create index "maxmast".glt_ledkey on "maxmast".gltran (glt_ledger,
    glt_ledacct,glt_year,glt_period);
create unique index "maxmast".glt_yperkey on "maxmast".gltran 
    (glt_year,glt_period,glt_account,glt_unikey);
create unique index "maxmast".glt_exportkey on "maxmast".gltran 
    (glt_exportser,glt_year,glt_period,glt_batch,glt_unikey);
    
create unique index "maxmast".glt_keyexport on "maxmast".gltran 
    (glt_year,glt_period,glt_batch,glt_exportser,glt_account,
    glt_unikey);
{ TABLE "maxmast".glyer row size = 56 number of columns = 6 index size = 12 }
{ unload file name = glyer00545.unl number of rows = 0 }

create table "maxmast".glyer 
  (
    glyer_year integer not null ,
    glyer_periods integer not null ,
    glyer_weeks integer not null ,
    glyer_desc char(30) not null ,
    glyer_lud date not null ,
    glyer_lui char(10) not null 
  );
revoke all on "maxmast".glyer from "public";

create unique index "maxmast".glyer_year on "maxmast".glyer (glyer_year);
    
{ TABLE "maxmast".imcpr row size = 91 number of columns = 13 index size = 171 }
{ unload file name = imcpr00547.unl number of rows = 7301 }

create table "maxmast".imcpr 
  (
    imcpr_item char(15) not null ,
    imcpr_supplier char(10) not null ,
    imcpr_branch char(4) not null ,
    imcpr_currency char(4) not null ,
    imcpr_price float not null ,
    imcpr_lastprice float not null ,
    imcpr_lastpaid date not null ,
    imcpr_manfac char(5) not null ,
    imcpr_routeid char(5) not null ,
    imcpr_opno char(5) not null ,
    imcpr_workcen char(5) not null ,
    imcpr_lastqty float not null ,
    imcpr_itaxstat char(10) not null 
  );
revoke all on "maxmast".imcpr from "public";

create unique index "maxmast".imcpr_key on "maxmast".imcpr (imcpr_item,
    imcpr_manfac,imcpr_routeid,imcpr_opno,imcpr_workcen,imcpr_supplier,
    imcpr_branch,imcpr_currency);
create unique index "maxmast".imcpr_key1 on "maxmast".imcpr (imcpr_supplier,
    imcpr_item,imcpr_manfac,imcpr_routeid,imcpr_opno,imcpr_workcen,
    imcpr_branch,imcpr_currency);
{ TABLE "maxmast".imfac row size = 243 number of columns = 36 index size = 64 }
{ unload file name = imfac00548.unl number of rows = 18159 }

create table "maxmast".imfac 
  (
    imfac_item char(15) not null ,
    imfac_manfac char(5) not null ,
    imfac_leadtime integer not null ,
    imfac_batchrule char(1) not null ,
    imfac_batchqty float not null ,
    imfac_scrappc float not null ,
    imfac_prefproc char(5) not null ,
    imfac_fremarks char(56) not null ,
    imfac_lud date not null ,
    imfac_lui char(10) not null ,
    imfac_pcontrlr char(3) not null ,
    imfac_batchper integer not null ,
    imfac_exfiltr float not null ,
    imfac_shfiltr float not null ,
    imfac_delstore char(5) not null ,
    imfac_delacct char(5) not null ,
    imfac_scrstore char(5) not null ,
    imfac_scracct char(5) not null ,
    imfac_urgefiltr integer not null ,
    imfac_slipfiltr integer not null ,
    imfac_planroute char(5) not null ,
    imfac_gdsover float not null ,
    imfac_gdsunder float not null ,
    imfac_gdsearly integer not null ,
    imfac_gdslate integer not null ,
    imfac_pending integer not null ,
    imfac_techflag char(1) not null ,
    imfac_costroute char(5) not null ,
    imfac_opscrap char(1) not null ,
    imfac_flushtime char(1) not null ,
    imfac_store char(5) not null ,
    imfac_account char(5) not null ,
    imfac_minordqty float not null ,
    imfac_incordqty float not null ,
    imfac_autorel char(1) not null ,
    imfac_prcfact float not null 
  );
revoke all on "maxmast".imfac from "public";

create index "maxmast".imfac_item on "maxmast".imfac (imfac_item);
    
create unique index "maxmast".imfac_key on "maxmast".imfac (imfac_item,
    imfac_manfac);
{ TABLE "maxmast".imgrp row size = 100 number of columns = 8 index size = 15 }
{ unload file name = imgrp00549.unl number of rows = 23 }

create table "maxmast".imgrp 
  (
    imgrp_prodgroup char(6) not null ,
    imgrp_grpname char(30) not null ,
    imgrp_category char(5) not null ,
    imgrp_lud date not null ,
    imgrp_lui char(10) not null ,
    imgrp_cosglacc char(15) not null ,
    imgrp_stkglacc char(15) not null ,
    imgrp_glsrev char(15) not null 
  );
revoke all on "maxmast".imgrp from "public";

create unique index "maxmast".imgrp_prodgroup on "maxmast".imgrp 
    (imgrp_prodgroup);
{ TABLE "maxmast".imprc row size = 119 number of columns = 16 index size = 103 }
{ unload file name = imprc00550.unl number of rows = 319 }

create table "maxmast".imprc 
  (
    imprc_item char(15) not null ,
    imprc_supplier char(10) not null ,
    imprc_branch char(4) not null ,
    imprc_ondate date not null ,
    imprc_quantity float not null ,
    imprc_price float not null ,
    imprc_offdate date not null ,
    imprc_offqtybrk float not null ,
    imprc_lud date not null ,
    imprc_lui char(10) not null ,
    imprc_currency char(4) not null ,
    imprc_subcon char(20) not null ,
    imprc_manfac char(5) not null ,
    imprc_routeid char(5) not null ,
    imprc_opno char(5) not null ,
    imprc_workcen char(5) not null 
  );
revoke all on "maxmast".imprc from "public";

create unique index "maxmast".imprc_key on "maxmast".imprc (imprc_item,
    imprc_subcon,imprc_supplier,imprc_branch,imprc_currency,imprc_ondate,
    imprc_offqtybrk);
{ TABLE "maxmast".impty row size = 57 number of columns = 8 index size = 94 }
{ unload file name = impty00551.unl number of rows = 0 }

create table "maxmast".impty 
  (
    impty_item char(15) not null ,
    impty_packtype char(10) not null ,
    impty_quantity float not null ,
    impty_store char(5) not null ,
    impty_lui char(10) not null ,
    impty_lud date not null ,
    impty_pickseq integer not null ,
    impty_package char(1) not null 
  );
revoke all on "maxmast".impty from "public";

create unique index "maxmast".impty_key on "maxmast".impty (impty_store,
    impty_item,impty_packtype);
create unique index "maxmast".impty_key1 on "maxmast".impty (impty_store,
    impty_item,impty_pickseq,impty_package);
{ TABLE "maxmast".imsul row size = 134 number of columns = 17 index size = 358 }
{ unload file name = imsul00553.unl number of rows = 0 }

create table "maxmast".imsul 
  (
    imsul_item char(15) not null ,
    imsul_serno char(15) not null ,
    imsul_sernoend char(15) not null ,
    imsul_store char(5) not null ,
    imsul_account char(5) not null ,
    imsul_bin char(15) not null ,
    imsul_balance float not null ,
    imsul_fdaterec date not null ,
    imsul_ftimerec integer not null ,
    imsul_ldaterec date not null ,
    imsul_ltimerec integer not null ,
    imsul_lud date not null ,
    imsul_lui char(10) not null ,
    imsul_osallqty float not null ,
    imsul_scser char(10) not null ,
    imsul_user1 integer not null ,
    imsul_user2 smallfloat not null 
  );
revoke all on "maxmast".imsul from "public";

create unique index "maxmast".imsul_binkey on "maxmast".imsul 
    (imsul_store,imsul_bin,imsul_item,imsul_account,imsul_serno);
    
create unique index "maxmast".imsul_key on "maxmast".imsul (imsul_item,
    imsul_store,imsul_account,imsul_bin,imsul_serno);
create index "maxmast".imsul_key1 on "maxmast".imsul (imsul_scser,
    imsul_store,imsul_account,imsul_item,imsul_bin);
create unique index "maxmast".imsul_recdatkey on "maxmast".imsul 
    (imsul_store,imsul_item,imsul_account,imsul_fdaterec,imsul_ftimerec,
    imsul_bin,imsul_serno);
{ TABLE "maxmast".kiact row size = 41 number of columns = 8 index size = 52 }
{ unload file name = kiact00555.unl number of rows = 0 }

create table "maxmast".kiact 
  (
    kiact_name char(10) not null ,
    kiact_user char(3) not null ,
    kiact_forwardto char(3) not null ,
    kiact_menu char(8) not null ,
    kiact_sequence integer not null ,
    kiact_itemid char(8) not null ,
    kiact_mode char(1) not null ,
    kiact_button integer not null 
  );
revoke all on "maxmast".kiact from "public";

create index "maxmast".kiact_name on "maxmast".kiact (kiact_name);
    
create unique index "maxmast".kiact_key on "maxmast".kiact (kiact_name,
    kiact_user,kiact_button);
{ TABLE "maxmast".kialt row size = 1207 number of columns = 35 index size = 67 }
{ unload file name = kialt00556.unl number of rows = 0 }

create table "maxmast".kialt 
  (
    kialt_name char(10) not null ,
    kialt_date date not null ,
    kialt_time integer not null ,
    kialt_sent char(1) not null ,
    kialt_plug1 char(80) not null ,
    kialt_plug2 char(80) not null ,
    kialt_plug3 char(80) not null ,
    kialt_plug4 char(80) not null ,
    kialt_plug0 char(60) not null ,
    kialt_plug5 char(60) not null ,
    kialt_plug6 char(60) not null ,
    kialt_plug7 char(60) not null ,
    kialt_plug8 char(60) not null ,
    kialt_plug9 char(60) not null ,
    kialt_plug10 char(60) not null ,
    kialt_plug11 char(60) not null ,
    kialt_plug12 char(60) not null ,
    kialt_butkey1 char(20) not null ,
    kialt_butkey2 char(20) not null ,
    kialt_butkey3 char(20) not null ,
    kialt_creatdate date not null ,
    kialt_creattime integer not null ,
    kialt_item char(40) not null ,
    kialt_desc char(33) not null ,
    kialt_cust char(10) not null ,
    kialt_so char(10) not null ,
    kialt_solin integer not null ,
    kialt_supp char(10) not null ,
    kialt_po char(10) not null ,
    kialt_polin integer not null ,
    kialt_porel integer not null ,
    kialt_wo char(10) not null ,
    kialt_woop char(5) not null ,
    kialt_f1 char(60) not null ,
    kialt_f2 char(60) not null 
  );
revoke all on "maxmast".kialt from "public";

create unique index "maxmast".kialt_key on "maxmast".kialt (kialt_name,
    kialt_date,kialt_time);
create unique index "maxmast".kialt_sentkey on "maxmast".kialt 
    (kialt_sent,kialt_date,kialt_time,kialt_name);
{ TABLE "maxmast".kictl row size = 68 number of columns = 7 index size = 34 }
{ unload file name = kictl00557.unl number of rows = 0 }

create table "maxmast".kictl 
  (
    kictl_comp char(5) not null ,
    kictl_sleepmin integer not null ,
    kictl_lastrun date not null ,
    kictl_userproc char(40) not null ,
    kictl_name char(10) not null ,
    kictl_proctype char(1) not null ,
    kictl_lasttime integer not null 
  );
revoke all on "maxmast".kictl from "public";

create index "maxmast".kictl_comp on "maxmast".kictl (kictl_comp);
    
create unique index "maxmast".kictl_name on "maxmast".kictl (kictl_name);
    
{ TABLE "maxmast".kifor row size = 93 number of columns = 9 index size = 87 }
{ unload file name = kifor00558.unl number of rows = 0 }

create table "maxmast".kifor 
  (
    kifor_name char(10) not null ,
    kifor_category char(40) not null ,
    kifor_startdate date not null ,
    kifor_period char(1) not null ,
    kifor_value float not null ,
    kifor_upper float not null ,
    kifor_lower float not null ,
    kifor_lud date not null ,
    kifor_lui char(10) not null 
  );
revoke all on "maxmast".kifor from "public";

create unique index "maxmast".kifor_key on "maxmast".kifor (kifor_name,
    kifor_category,kifor_startdate);
{ TABLE "maxmast".kihdr row size = 85 number of columns = 8 index size = 43 }
{ unload file name = kihdr00559.unl number of rows = 0 }

create table "maxmast".kihdr 
  (
    kihdr_name char(10) not null ,
    kihdr_owner char(10) not null ,
    kihdr_lud date not null ,
    kihdr_lui char(10) not null ,
    kihdr_upalert char(10) not null ,
    kihdr_loalert char(10) not null ,
    kihdr_descrip char(30) not null ,
    kihdr_type char(1) not null 
  );
revoke all on "maxmast".kihdr from "public";

create unique index "maxmast".kihdr_name on "maxmast".kihdr (kihdr_name);
    
create unique index "maxmast".kihdr_typekey on "maxmast".kihdr 
    (kihdr_type,kihdr_name);
{ TABLE "maxmast".kihst row size = 66 number of columns = 5 index size = 93 }
{ unload file name = kihst00560.unl number of rows = 0 }

create table "maxmast".kihst 
  (
    kihst_name char(10) not null ,
    kihst_category char(40) not null ,
    kihst_date date not null ,
    kihst_time integer not null ,
    kihst_value float not null 
  );
revoke all on "maxmast".kihst from "public";

create unique index "maxmast".kihst_key on "maxmast".kihst (kihst_name,
    kihst_category,kihst_date,kihst_time);
{ TABLE "maxmast".kiint row size = 45 number of columns = 10 index size = 70 }
{ unload file name = kiint00561.unl number of rows = 0 }

create table "maxmast".kiint 
  (
    kiint_actioned char(1) not null ,
    kiint_date date not null ,
    kiint_time integer not null ,
    kiint_name char(10) not null ,
    kiint_user char(3) not null ,
    kiint_lud date not null ,
    kiint_lui char(10) not null ,
    kiint_reported char(1) not null ,
    kiint_negdate integer not null ,
    kiint_negtime integer not null 
  );
revoke all on "maxmast".kiint from "public";

create unique index "maxmast".kiint_key on "maxmast".kiint (kiint_negdate,
    kiint_negtime,kiint_name);
create unique index "maxmast".kiint_userkey on "maxmast".kiint 
    (kiint_user,kiint_negdate,kiint_negtime,kiint_name);
{ TABLE "maxmast".kirou row size = 41 number of columns = 8 index size = 37 }
{ unload file name = kirou00562.unl number of rows = 0 }

create table "maxmast".kirou 
  (
    kirou_name char(10) not null ,
    kirou_user char(3) not null ,
    kirou_text char(9) not null ,
    kirou_severity char(1) not null ,
    kirou_type char(1) not null ,
    kirou_lud date not null ,
    kirou_lui char(10) not null ,
    kirou_escalate char(3) not null 
  );
revoke all on "maxmast".kirou from "public";

create index "maxmast".kirou_user on "maxmast".kirou (kirou_user);
    
create unique index "maxmast".kirou_key on "maxmast".kirou (kirou_name,
    kirou_user,kirou_type);
{ TABLE "maxmast".kitxt row size = 93 number of columns = 3 index size = 45 }
{ unload file name = kitxt00563.unl number of rows = 0 }

create table "maxmast".kitxt 
  (
    kitxt_text char(9) not null ,
    kitxt_line integer not null ,
    kitxt_body char(80) not null 
  );
revoke all on "maxmast".kitxt from "public";

create index "maxmast".kitxt_text on "maxmast".kitxt (kitxt_text);
    
create unique index "maxmast".kitxt_key on "maxmast".kitxt (kitxt_text,
    kitxt_line);
{ TABLE "maxmast".kiusr row size = 77 number of columns = 17 index size = 36 }
{ unload file name = kiusr00564.unl number of rows = 0 }

create table "maxmast".kiusr 
  (
    kiusr_name char(10) not null ,
    kiusr_user char(10) not null ,
    kiusr_type char(1) not null ,
    kiusr_refresh integer not null ,
    kiusr_message char(1) not null ,
    kiusr_status char(1) not null ,
    kiusr_audio char(1) not null ,
    kiusr_colour integer not null ,
    kiusr_max float not null ,
    kiusr_min float not null ,
    kiusr_decimals integer not null ,
    kiusr_hours float not null ,
    kiusr_forecast char(1) not null ,
    kiusr_lud date not null ,
    kiusr_lui char(10) not null ,
    kiusr_showdate char(1) not null ,
    kiusr_ontop char(1) not null 
  );
revoke all on "maxmast".kiusr from "public";

create unique index "maxmast".kiusr_key on "maxmast".kiusr (kiusr_name,
    kiusr_user);
{ TABLE "maxmast".kival row size = 66 number of columns = 5 index size = 93 }
{ unload file name = kival00565.unl number of rows = 0 }

create table "maxmast".kival 
  (
    kival_name char(10) not null ,
    kival_category char(40) not null ,
    kival_date date not null ,
    kival_time integer not null ,
    kival_value float not null 
  );
revoke all on "maxmast".kival from "public";

create unique index "maxmast".kival_key on "maxmast".kival (kival_name,
    kival_category,kival_date,kival_time);
{ TABLE "maxmast".masdt row size = 126 number of columns = 9 index size = 202 }
{ unload file name = masdt00566.unl number of rows = 0 }

create table "maxmast".masdt 
  (
    masdt_reportid char(15) not null ,
    masdt_repseq integer not null ,
    masdt_repacc char(40) not null ,
    masdt_level integer not null ,
    masdt_actualac char(15) not null ,
    masdt_desc char(30) not null ,
    masdt_lud date not null ,
    masdt_lui char(10) not null ,
    masdt_repacclen integer not null 
  );
revoke all on "maxmast".masdt from "public";

create index "maxmast".masdt_actualac on "maxmast".masdt (masdt_actualac);
    
create unique index "maxmast".masdt_repidseq on "maxmast".masdt 
    (masdt_reportid,masdt_repseq);
create index "maxmast".masdt_acckey on "maxmast".masdt (masdt_reportid,
    masdt_actualac);
create index "maxmast".masdt_rpackey on "maxmast".masdt (masdt_reportid,
    masdt_repacc);
{ TABLE "maxmast".mashr row size = 168 number of columns = 13 index size = 28 }
{ unload file name = mashr00567.unl number of rows = 0 }

create table "maxmast".mashr 
  (
    mashr_reportid char(15) not null ,
    mashr_desc char(60) not null ,
    mashr_summclass char(5) not null ,
    mashr_actypes char(31) not null ,
    mashr_report char(9) not null ,
    mashr_to char(8) not null ,
    mashr_via char(5) not null ,
    mashr_integrity char(1) not null ,
    mashr_lud date not null ,
    mashr_lui char(10) not null ,
    mashr_budcode char(15) not null ,
    mashr_repacclen integer not null ,
    mashr_grandtot char(1) not null 
  );
revoke all on "maxmast".mashr from "public";

create unique index "maxmast".mashr_reportid on "maxmast".mashr 
    (mashr_reportid);
{ TABLE "maxmast".mfhst row size = 34 number of columns = 7 index size = 54 }
{ unload file name = mfhst00568.unl number of rows = 935597 }

create table "maxmast".mfhst 
  (
    mfhst_orderno char(10) not null ,
    mfhst_date date not null ,
    mfhst_time char(6) not null ,
    mfhst_completed char(1) not null ,
    mfhst_dueqty float not null ,
    mfhst_type char(1) not null ,
    mfhst_serial serial not null 
  );
revoke all on "maxmast".mfhst from "public";

create unique index "maxmast".mfhst_key on "maxmast".mfhst (mfhst_orderno,
    mfhst_date,mfhst_time,mfhst_serial);
create unique index "maxmast".mfhst_serial on "maxmast".mfhst 
    (mfhst_serial);
{ TABLE "maxmast".mford row size = 445 number of columns = 51 index size = 208 }
{ unload file name = mford00569.unl number of rows = 115614 }

create table "maxmast".mford 
  (
    mford_orderno char(10) not null ,
    mford_duedate date not null ,
    mford_dueqty float not null ,
    mford_revdue date not null ,
    mford_qtyscrap float not null ,
    mford_qtyrcvd float not null ,
    mford_item char(15) not null ,
    mford_revqty float not null ,
    mford_completed char(1) not null ,
    mford_remarks char(66) not null ,
    mford_manfac char(5) not null ,
    mford_scrappc float not null ,
    mford_lud date not null ,
    mford_lui char(10) not null ,
    mford_delstore char(5) not null ,
    mford_delacct char(5) not null ,
    mford_scrstore char(5) not null ,
    mford_scracct char(5) not null ,
    mford_released char(1) not null ,
    mford_stage char(1) not null ,
    mford_reldate date not null ,
    mford_startdate date not null ,
    mford_priority char(5) not null ,
    mford_printdate date not null ,
    mford_reprint char(1) not null ,
    mford_amendno integer not null ,
    mford_drawno char(20) not null ,
    mford_drawiss char(3) not null ,
    mford_routeid char(5) not null ,
    mford_modser char(10) not null ,
    mford_premarks char(56) not null ,
    mford_rtplanned char(1) not null ,
    mford_splitfrom char(10) not null ,
    mford_lastop char(5) not null ,
    mford_opscrap char(1) not null ,
    mford_monord float not null ,
    mford_serialop char(5) not null ,
    mford_contract char(15) not null ,
    mford_conlin integer not null ,
    mford_wipscrap float not null ,
    mford_lspro integer not null ,
    mford_glrefrom char(15) not null ,
    mford_glrefto char(15) not null ,
    mford_glvarfrom char(15) not null ,
    mford_glvarto char(15) not null ,
    mford_duetime integer not null ,
    mford_negdue integer not null ,
    mford_ordnum char(8) not null ,
    mford_linnum integer not null ,
    mford_pcontrlr char(3) not null ,
    mford_actualdte date not null 
  );
revoke all on "maxmast".mford from "public";

create unique index "maxmast".mford_orderno on "maxmast".mford 
    (mford_orderno);
create unique index "maxmast".mford_date_key on "maxmast".mford 
    (mford_item,mford_duedate,mford_orderno);
create unique index "maxmast".mford_revkey on "maxmast".mford 
    (mford_item,mford_revdue,mford_orderno);
create unique index "maxmast".mford_lastdate on "maxmast".mford 
    (mford_item,mford_negdue,mford_orderno);
create unique index "maxmast".mford_oeordlin on "maxmast".mford 
    (mford_ordnum,mford_linnum,mford_orderno);
{ TABLE "maxmast".mmali row size = 88 number of columns = 6 index size = 211 }
{ unload file name = mmali00570.unl number of rows = 2137 }

create table "maxmast".mmali 
  (
    mmali_initials char(3) not null ,
    mmali_manfac char(5) not null ,
    mmali_itemdate date not null ,
    mmali_item char(15) not null ,
    mmali_sequence char(60) not null ,
    mmali_progress char(1) not null 
  );
revoke all on "maxmast".mmali from "public";

create unique index "maxmast".mmali_key on "maxmast".mmali (mmali_initials,
    mmali_manfac,mmali_item);
create unique index "maxmast".mmali_listkey on "maxmast".mmali 
    (mmali_initials,mmali_manfac,mmali_sequence,mmali_item);
create unique index "maxmast".mmali_itemkey on "maxmast".mmali 
    (mmali_item,mmali_initials,mmali_manfac);
{ TABLE "maxmast".mmaut row size = 81 number of columns = 5 index size = 22 }
{ unload file name = mmaut00571.unl number of rows = 1 }

create table "maxmast".mmaut 
  (
    mmaut_userid char(10) not null ,
    mmaut_type char(1) not null ,
    mmaut_value float not null ,
    mmaut_dept char(6) not null ,
    mmaut_remarks char(56) not null 
  );
revoke all on "maxmast".mmaut from "public";

create unique index "maxmast".mmaut_key on "maxmast".mmaut (mmaut_userid,
    mmaut_type);
{ TABLE "maxmast".mmcst row size = 61 number of columns = 13 index size = 21 }
{ unload file name = mmcst00572.unl number of rows = 1550 }

create table "maxmast".mmcst 
  (
    mmcst_costype char(5) not null ,
    mmcst_element char(5) not null ,
    mmcst_desc char(15) not null ,
    mmcst_class char(1) not null ,
    mmcst_makeman char(1) not null ,
    mmcst_buyman char(1) not null ,
    mmcst_makemiss char(1) not null ,
    mmcst_buymiss char(1) not null ,
    mmcst_tcalc char(1) not null ,
    mmcst_lcalc char(1) not null ,
    mmcst_lud date not null ,
    mmcst_lui char(10) not null ,
    mmcst_account char(15) not null 
  );
revoke all on "maxmast".mmcst from "public";

create unique index "maxmast".mmcst_key on "maxmast".mmcst (mmcst_costype,
    mmcst_element);
{ TABLE "maxmast".mmsys row size = 498 number of columns = 66 index size = 7 }
{ unload file name = mmsys00573.unl number of rows = 1 }

create table "maxmast".mmsys 
  (
    mmsys_effclass char(1) not null ,
    mmsys_key char(1) not null ,
    mmsys_monlevel integer not null ,
    mmsys_medium integer not null ,
    mmsys_file char(20) not null ,
    mmsys_exfile char(20) not null ,
    mmsys_extramlt integer not null ,
    mmsys_safety float not null ,
    mmsys_mrintervl integer not null ,
    mmsys_oldinterv integer not null ,
    mmsys_oldsafety float not null ,
    mmsys_cltlevel integer not null ,
    mmsys_cltdest integer not null ,
    mmsys_cltfile char(20) not null ,
    mmsys_pur char(1) not null ,
    mmsys_pledger char(1) not null ,
    mmsys_route char(1) not null ,
    mmsys_sop char(1) not null ,
    mmsys_costing char(1) not null ,
    mmsys_cost char(5) not null ,
    mmsys_stancost char(5) not null ,
    mmsys_shoprel char(1) not null ,
    mmsys_opregen char(1) not null ,
    mmsys_shopctl char(1) not null ,
    mmsys_scheduler char(1) not null ,
    mmsys_gllink char(1) not null ,
    mmsys_invmatch char(1) not null ,
    mmsys_conctl char(1) not null ,
    mmsys_crpestrun char(15) not null ,
    mmsys_concats char(1) not null ,
    mmsys_wipcost char(5) not null ,
    mmsys_schedman char(1) not null ,
    mmsys_intmoses char(1) not null ,
    mmsys_sopmps char(1) not null ,
    mmsys_daysmop integer not null ,
    mmsys_monthsmop integer not null ,
    mmsys_daysext integer not null ,
    mmsys_assachofo char(1) not null ,
    mmsys_ilseqa char(19) not null ,
    mmsys_ilseqb char(19) not null ,
    mmsys_ilseqc char(19) not null ,
    mmsys_ilseqd char(19) not null ,
    mmsys_slseqa char(19) not null ,
    mmsys_slseqb char(19) not null ,
    mmsys_slseqc char(19) not null ,
    mmsys_slseqd char(19) not null ,
    mmsys_itmsqa char(19) not null ,
    mmsys_itmsqb char(19) not null ,
    mmsys_itmsqc char(19) not null ,
    mmsys_itmsqd char(19) not null ,
    mmsys_supsqa char(19) not null ,
    mmsys_supsqb char(19) not null ,
    mmsys_supsqc char(19) not null ,
    mmsys_supsqd char(19) not null ,
    mmsys_regalptrg char(1) not null ,
    mmsys_basedate date not null ,
    mmsys_edifax char(1) not null ,
    mmsys_puhist char(1) not null ,
    mmsys_crm char(1) not null ,
    mmsys_wms char(1) not null ,
    mmsys_aps char(1) not null ,
    mmsys_atpstdays integer not null ,
    mmsys_cntrlg char(1) not null ,
    mmsys_ctypeauto char(5) not null ,
    mmsys_celemmat char(5) not null ,
    mmsys_nextcom integer not null 
  );
revoke all on "maxmast".mmsys from "public";

create unique index "maxmast".mmsys_key on "maxmast".mmsys (mmsys_key);
    
{ TABLE "maxmast".mmtsk row size = 35 number of columns = 5 index size = 36 }
{ unload file name = mmtsk00574.unl number of rows = 0 }

create table "maxmast".mmtsk 
  (
    mmtsk_userid char(10) not null ,
    mmtsk_task char(10) not null ,
    mmtsk_priority char(1) not null ,
    mmtsk_lud date not null ,
    mmtsk_lui char(10) not null 
  );
revoke all on "maxmast".mmtsk from "public";

create unique index "maxmast".mmtsk_key1 on "maxmast".mmtsk (mmtsk_userid,
    mmtsk_task);
{ TABLE "maxmast".mmtty row size = 55 number of columns = 5 index size = 21 }
{ unload file name = mmtty00575.unl number of rows = 0 }

create table "maxmast".mmtty 
  (
    mmtty_task char(10) not null ,
    mmtty_desc char(30) not null ,
    mmtty_lud date not null ,
    mmtty_lui char(10) not null ,
    mmtty_priority char(1) not null 
  );
revoke all on "maxmast".mmtty from "public";

create unique index "maxmast".mmtty_task on "maxmast".mmtty (mmtty_task);
    
{ TABLE "maxmast".mmusr row size = 88 number of columns = 13 index size = 21 }
{ unload file name = mmusr00576.unl number of rows = 55 }

create table "maxmast".mmusr 
  (
    mmusr_userid char(10) not null ,
    mmusr_store char(5) not null ,
    mmusr_acct char(5) not null ,
    mmusr_manfac char(5) not null ,
    mmusr_iplanner char(3) not null ,
    mmusr_name char(20) not null ,
    mmusr_mmdf char(4) not null ,
    mmusr_workcen char(5) not null ,
    mmusr_runid char(15) not null ,
    mmusr_reqauth char(10) not null ,
    mmusr_type char(1) not null ,
    mmusr_altfresh integer not null ,
    mmusr_altcount char(1) not null 
  );
revoke all on "maxmast".mmusr from "public";

create unique index "maxmast".mmusr_userid on "maxmast".mmusr 
    (mmusr_userid);
{ TABLE "maxmast".ndcon row size = 241 number of columns = 17 index size = 27 }
{ unload file name = ndcon00577.unl number of rows = 378 }

create table "maxmast".ndcon 
  (
    ndc_ndcode char(10) not null ,
    ndc_seq integer not null ,
    ndc_title char(6) not null ,
    ndc_initial char(6) not null ,
    ndc_forename char(15) not null ,
    ndc_surname char(20) not null ,
    ndc_salut char(10) not null ,
    ndc_letters char(15) not null ,
    ndc_telephone char(20) not null ,
    ndc_comment char(20) not null ,
    ndc_email char(40) not null ,
    ndc_telex char(20) not null ,
    ndc_homephone char(20) not null ,
    ndc_mobphone char(20) not null ,
    ndc_lud date not null ,
    ndc_lui char(10) not null ,
    ndc_maxonly char(1) not null 
  );
revoke all on "maxmast".ndcon from "public";

create unique index "maxmast".ndc_key on "maxmast".ndcon (ndc_ndcode,
    ndc_seq);
{ TABLE "maxmast".ndmas row size = 659 number of columns = 21 index size = 63 }
{ unload file name = ndmas00578.unl number of rows = 983 }

create table "maxmast".ndmas 
  (
    ndm_ndcode char(10) not null ,
    ndm_alphcode char(10) not null ,
    ndm_name char(60) not null ,
    ndm_addr1 char(60) not null ,
    ndm_addr2 char(60) not null ,
    ndm_addr3 char(60) not null ,
    ndm_addr4 char(60) not null ,
    ndm_addr5 char(60) not null ,
    ndm_postcode char(10) not null ,
    ndm_telephone char(20) not null ,
    ndm_telex char(20) not null ,
    ndm_lastdate date not null ,
    ndm_addtype char(10) not null ,
    ndm_email char(40) not null ,
    ndm_homephone char(20) not null ,
    ndm_mobphone char(20) not null ,
    ndm_lud date not null ,
    ndm_lui char(10) not null ,
    ndm_maxonly char(1) not null ,
    ndm_nameext char(60) not null ,
    ndm_addr6 char(60) not null 
  );
revoke all on "maxmast".ndmas from "public";

create unique index "maxmast".ndm_ndcode on "maxmast".ndmas (ndm_ndcode);
    
create index "maxmast".ndm_alphcode on "maxmast".ndmas (ndm_alphcode);
    
create index "maxmast".ndm_postcode on "maxmast".ndmas (ndm_postcode);
    
{ TABLE "maxmast".nvbin row size = 130 number of columns = 26 index size = 198 }
{ unload file name = nvbin00579.unl number of rows = 0 }

create table "maxmast".nvbin 
  (
    nvbin_store char(5) not null ,
    nvbin_bin char(15) not null ,
    nvbin_pickseq integer not null ,
    nvbin_st1type char(5) not null ,
    nvbin_st2type char(5) not null ,
    nvbin_st3type char(5) not null ,
    nvbin_st4type char(5) not null ,
    nvbin_st5type char(5) not null ,
    nvbin_manyitems char(1) not null ,
    nvbin_binfull char(1) not null ,
    nvbin_zone char(5) not null ,
    nvbin_subzone char(5) not null ,
    nvbin_aisle char(5) not null ,
    nvbin_bay char(5) not null ,
    nvbin_beam char(5) not null ,
    nvbin_status char(1) not null ,
    nvbin_closedid char(1) not null ,
    nvbin_sequence integer not null ,
    nvbin_width float not null ,
    nvbin_scser char(10) not null ,
    nvbin_wmstype char(1) not null ,
    nvbin_fixvarwid char(1) not null ,
    nvbin_lastpichk date not null ,
    nvbin_user1 float not null ,
    nvbin_user2 float not null ,
    nvbin_user3 float not null 
  );
revoke all on "maxmast".nvbin from "public";

create index "maxmast".nvbin_bin on "maxmast".nvbin (nvbin_bin);
    
create unique index "maxmast".nvbin_key on "maxmast".nvbin (nvbin_store,
    nvbin_bin);
create index "maxmast".nvbin_scser on "maxmast".nvbin (nvbin_scser);
    
create unique index "maxmast".nvbin_wmskey on "maxmast".nvbin 
    (nvbin_store,nvbin_zone,nvbin_subzone,nvbin_aisle,nvbin_bay,
    nvbin_beam,nvbin_bin);
create unique index "maxmast".nvbin_key2 on "maxmast".nvbin (nvbin_store,
    nvbin_wmstype,nvbin_status,nvbin_bin);
{ TABLE "maxmast".nvsto row size = 217 number of columns = 38 index size = 13 }
{ unload file name = nvsto00580.unl number of rows = 1 }

create table "maxmast".nvsto 
  (
    nvsto_store char(5) not null ,
    nvsto_stname char(25) not null ,
    nvsto_branch char(2) not null ,
    nvsto_autostore char(1) not null ,
    nvsto_ndcode char(10) not null ,
    nvsto_picrule char(1) not null ,
    nvsto_stkdate date not null ,
    nvsto_incmrpfre char(1) not null ,
    nvsto_incgfs char(1) not null ,
    nvsto_incmps char(1) not null ,
    nvsto_avewkgday integer not null ,
    nvsto_curcaldr integer not null ,
    nvsto_curperiod integer not null ,
    nvsto_dimscost char(1) not null ,
    nvsto_seasnflg char(1) not null ,
    nvsto_lastprog char(4) not null ,
    nvsto_lastcal integer not null ,
    nvsto_lastper integer not null ,
    nvsto_numperiod integer not null ,
    nvsto_wtaxstat char(10) not null ,
    nvsto_zones char(1) not null ,
    nvsto_subzones char(1) not null ,
    nvsto_status char(1) not null ,
    nvsto_closedid char(10) not null ,
    nvsto_receiptac char(5) not null ,
    nvsto_weightuom char(5) not null ,
    nvsto_dimensuom char(5) not null ,
    nvsto_reclocatn char(15) not null ,
    nvsto_pending char(15) not null ,
    nvsto_sinbin char(15) not null ,
    nvsto_halfbinht float not null ,
    nvsto_gfsac char(5) not null ,
    nvsto_htsafmarg float not null ,
    nvsto_wdsafmarg float not null ,
    nvsto_paklocatn char(15) not null ,
    nvsto_wms char(1) not null ,
    nvsto_pidays integer not null ,
    nvsto_pibins integer not null 
  );
revoke all on "maxmast".nvsto from "public";

create unique index "maxmast".nvsto_store on "maxmast".nvsto (nvsto_store);
    
{ TABLE "maxmast".oechd row size = 227 number of columns = 32 index size = 43 }
{ unload file name = oechd00582.unl number of rows = 0 }

create table "maxmast".oechd 
  (
    oechd_account char(10) not null ,
    oechd_ponum char(15) not null ,
    oechd_contype char(1) not null ,
    oechd_delroute char(10) not null ,
    oechd_termscode char(2) not null ,
    oechd_salesman char(10) not null ,
    oechd_specinst char(20) not null ,
    oechd_delinst char(20) not null ,
    oechd_delmetcod char(5) not null ,
    oechd_delmedesc char(20) not null ,
    oechd_scondate date not null ,
    oechd_econdate date not null ,
    oechd_rcondate date not null ,
    oechd_lud date not null ,
    oechd_lui char(10) not null ,
    oechd_updflag integer not null ,
    oechd_salesoff char(5) not null ,
    oechd_store char(5) not null ,
    oechd_otycod char(5) not null ,
    oechd_otydesc char(20) not null ,
    oechd_storecode char(10) not null ,
    oechd_aviexp char(1) not null ,
    oechd_invmeth char(1) not null ,
    oechd_consdays integer not null ,
    oechd_constore char(5) not null ,
    oechd_deltype char(1) not null ,
    oechd_statflags char(10) not null ,
    oechd_reconf char(1) not null ,
    oechd_procret char(1) not null ,
    oechd_currency char(4) not null ,
    oechd_ctaxstat char(10) not null ,
    oechd_taxempt char(1) not null 
  );
revoke all on "maxmast".oechd from "public";

create unique index "maxmast".oechd_key on "maxmast".oechd (oechd_account,
    oechd_ponum);
{ TABLE "maxmast".oecln row size = 623 number of columns = 92 index size = 265 }
{ unload file name = oecln00583.unl number of rows = 0 }

create table "maxmast".oecln 
  (
    oecln_account char(10) not null ,
    oecln_ponum char(15) not null ,
    oecln_linnum integer not null ,
    oecln_item char(15) not null ,
    oecln_store char(5) not null ,
    oecln_orduom char(5) not null ,
    oecln_qtyord float not null ,
    oecln_price float not null ,
    oecln_qtyos float not null ,
    oecln_leadtime integer not null ,
    oecln_lud date not null ,
    oecln_lui char(10) not null ,
    oecln_updflag integer not null ,
    oecln_status char(1) not null ,
    oecln_priceuom char(5) not null ,
    oecln_itemac char(15) not null ,
    oecln_discntac char(15) not null ,
    oecln_pricelist char(10) not null ,
    oecln_comcd char(1) not null ,
    oecln_priceprom char(1) not null ,
    oecln_stdprice float not null ,
    oecln_stdpruom char(5) not null ,
    oecln_stdprcurr char(4) not null ,
    oecln_pricemeth char(1) not null ,
    oecln_spactused char(1) not null ,
    oecln_spapcused char(1) not null ,
    oecln_spondate date not null ,
    oecln_sdactused char(1) not null ,
    oecln_sdapcused char(1) not null ,
    oecln_sditmused char(1) not null ,
    oecln_sdipcused char(1) not null ,
    oecln_sdondate date not null ,
    oecln_qbactused char(1) not null ,
    oecln_qbapcused char(1) not null ,
    oecln_qbitmused char(1) not null ,
    oecln_qbipcused char(1) not null ,
    oecln_qbondate date not null ,
    oecln_qbonqty float not null ,
    oecln_qboffqty float not null ,
    oecln_qbtype char(1) not null ,
    oecln_qbvalue float not null ,
    oecln_qbd1rate float not null ,
    oecln_qbd2rate float not null ,
    oecln_qbd3rate float not null ,
    oecln_actdiscnt char(2) not null ,
    oecln_drate1 float not null ,
    oecln_drate2 float not null ,
    oecln_drate3 float not null ,
    oecln_todelpt char(10) not null ,
    oecln_fromdelpt char(10) not null ,
    oecln_bompset char(1) not null ,
    oecln_country char(5) not null ,
    oecln_capcom integer not null ,
    oecln_matcom integer not null ,
    oecln_aviexp char(1) not null ,
    oecln_invmeth char(1) not null ,
    oecln_consdays integer not null ,
    oecln_constore char(5) not null ,
    oecln_issqty float not null ,
    oecln_delqty float not null ,
    oecln_version char(17) not null ,
    oecln_authcode char(35) not null ,
    oecln_notdate date not null ,
    oecln_custdelno char(17) not null ,
    oecln_recqty float not null ,
    oecln_cust1del char(17) not null ,
    oecln_cust1qdel float not null ,
    oecln_cust2del char(17) not null ,
    oecln_cust2qdel float not null ,
    oecln_cust3del char(17) not null ,
    oecln_cust3qdel float not null ,
    oecln_prv1price float not null ,
    oecln_aut1price char(8) not null ,
    oecln_priceaut char(8) not null ,
    oecln_prv2price float not null ,
    oecln_aut2price char(8) not null ,
    oecln_statflags char(10) not null ,
    oecln_nextoecds integer not null ,
    oecln_bilqty float not null ,
    oecln_payref char(1) not null ,
    oecln_reconf char(1) not null ,
    oecln_despprice char(1) not null ,
    oecln_cumretqty float not null ,
    oecln_reordqty float not null ,
    oecln_cumreoqty float not null ,
    oecln_procret char(1) not null ,
    oecln_custdespn char(1) not null ,
    oecln_custitem char(36) not null ,
    oecln_glbmpsupd char(1) not null ,
    oecln_schrecdte date not null ,
    oecln_itaxstat char(10) not null ,
    oecln_taxcode char(1) not null 
  );
revoke all on "maxmast".oecln from "public";

create unique index "maxmast".oecln_key on "maxmast".oecln (oecln_account,
    oecln_ponum,oecln_linnum);
create unique index "maxmast".oecln_itemkey on "maxmast".oecln 
    (oecln_item,oecln_account,oecln_ponum,oecln_linnum);
create unique index "maxmast".oecln_ponkey on "maxmast".oecln 
    (oecln_ponum,oecln_item,oecln_account,oecln_linnum);
create unique index "maxmast".oecln_acckey on "maxmast".oecln 
    (oecln_account,oecln_ponum,oecln_item,oecln_linnum);
{ TABLE "maxmast".oecms row size = 145 number of columns = 18 index size = 49 }
{ unload file name = oecms00584.unl number of rows = 0 }

create table "maxmast".oecms 
  (
    oecms_account char(10) not null ,
    oecms_ponum char(15) not null ,
    oecms_linnum integer not null ,
    oecms_desc char(30) not null ,
    oecms_dmscdscfl char(1) not null ,
    oecms_prodgroup char(6) not null ,
    oecms_chgetype char(5) not null ,
    oecms_cost float not null ,
    oecms_value float not null ,
    oecms_lud date not null ,
    oecms_lui char(10) not null ,
    oecms_updflag integer not null ,
    oecms_status char(1) not null ,
    oecms_miscac char(15) not null ,
    oecms_country char(5) not null ,
    oecms_commodity char(8) not null ,
    oecms_itaxstat char(10) not null ,
    oecms_taxcode char(1) not null 
  );
revoke all on "maxmast".oecms from "public";

create unique index "maxmast".oecms_key on "maxmast".oecms (oecms_account,
    oecms_ponum,oecms_linnum);
{ TABLE "maxmast".oecpt row size = 103 number of columns = 18 index size = 88 }
{ unload file name = oecpt00585.unl number of rows = 805432 }

create table "maxmast".oecpt 
  (
    oecpt_ordnum char(8) not null ,
    oecpt_linnum integer not null ,
    oecpt_compline integer not null ,
    oecpt_item char(15) not null ,
    oecpt_quantity float not null ,
    oecpt_cost float not null ,
    oecpt_qfactor float not null ,
    oecpt_opno char(5) not null ,
    oecpt_advance integer not null ,
    oecpt_lud date not null ,
    oecpt_lui char(10) not null ,
    oecpt_indmps char(1) not null ,
    oecpt_pickdate date not null ,
    oecpt_buildthro char(1) not null ,
    oecpt_prevpdate date not null ,
    oecpt_selection char(1) not null ,
    oecpt_orderno char(10) not null ,
    oecpt_ordline integer not null 
  );
revoke all on "maxmast".oecpt from "public";

create unique index "maxmast".oecpt_key on "maxmast".oecpt (oecpt_ordnum,
    oecpt_linnum,oecpt_compline);
create unique index "maxmast".oecpt_key1 on "maxmast".oecpt (oecpt_item,
    oecpt_pickdate,oecpt_ordnum,oecpt_linnum,oecpt_compline);
    
{ TABLE "maxmast".oecus row size = 414 number of columns = 87 index size = 21 }
{ unload file name = oecus00586.unl number of rows = 108 }

create table "maxmast".oecus 
  (
    oecus_account char(10) not null ,
    oecus_reqack char(1) not null ,
    oecus_reqdn char(1) not null ,
    oecus_ownparts char(1) not null ,
    oecus_forcepo char(1) not null ,
    oecus_reqoh char(1) not null ,
    oecus_altinv char(1) not null ,
    oecus_invdisc char(2) not null ,
    oecus_lindisc char(2) not null ,
    oecus_priority char(1) not null ,
    oecus_nordytd integer not null ,
    oecus_ordlimit integer not null ,
    oecus_valaloc float not null ,
    oecus_valunaloc float not null ,
    oecus_accman char(10) not null ,
    oecus_anacode char(20) not null ,
    oecus_unalchk char(1) not null ,
    oecus_salesman char(10) not null ,
    oecus_primedel char(10) not null ,
    oecus_lud date not null ,
    oecus_lui char(10) not null ,
    oecus_statdflt char(10) not null ,
    oecus_compflag char(1) not null ,
    oecus_salesoff char(5) not null ,
    oecus_acctprcat char(5) not null ,
    oecus_pricelist char(10) not null ,
    oecus_promlist char(10) not null ,
    oecus_qbbest char(1) not null ,
    oecus_pricepty char(3) not null ,
    oecus_prlistovr char(1) not null ,
    oecus_specdisc char(1) not null ,
    oecus_stdpronly char(1) not null ,
    oecus_stkalloc char(1) not null ,
    oecus_class1 char(5) not null ,
    oecus_class2 char(5) not null ,
    oecus_class3 char(5) not null ,
    oecus_consdesp char(1) not null ,
    oecus_consinv char(1) not null ,
    oecus_custype char(1) not null ,
    oecus_numdnotes integer not null ,
    oecus_qbdiscok char(1) not null ,
    oecus_delterms char(3) not null ,
    oecus_transport char(1) not null ,
    oecus_aviexp char(1) not null ,
    oecus_invmeth char(1) not null ,
    oecus_consdays integer not null ,
    oecus_constore char(5) not null ,
    oecus_deltype char(1) not null ,
    oecus_payref char(1) not null ,
    oecus_proformas char(1) not null ,
    oecus_pfexpdays integer not null ,
    oecus_pfdeposit float not null ,
    oecus_pfcashrec float not null ,
    oecus_pfcashos float not null ,
    oecus_reconf char(1) not null ,
    oecus_procret char(1) not null ,
    oecus_expiryday integer not null ,
    oecus_custdespn char(1) not null ,
    oecus_miscval float not null ,
    oecus_misccrchk char(1) not null ,
    oecus_edicode char(20) not null ,
    oecus_ouredi char(17) not null ,
    oecus_hcinvoice char(1) not null ,
    oecus_faxinvoic char(1) not null ,
    oecus_ediinvoic char(1) not null ,
    oecus_hcdespadv char(1) not null ,
    oecus_faxdespad char(1) not null ,
    oecus_edidespad char(1) not null ,
    oecus_hcoack char(1) not null ,
    oecus_faxoack char(1) not null ,
    oecus_edioack char(1) not null ,
    oecus_schrecdte date not null ,
    oecus_twinreqd char(1) not null ,
    oecus_ecpasswd char(20) not null ,
    oecus_ecplist char(10) not null ,
    oecus_hcquote char(1) not null ,
    oecus_ourcode char(20) not null ,
    oecus_fullcrchk char(1) not null ,
    oecus_servinv char(1) not null ,
    oecus_certdelpt char(10) not null ,
    oecus_certcomb char(8) not null ,
    oecus_certify char(1) not null ,
    oecus_engineer char(10) not null ,
    oecus_proforma char(1) not null ,
    oecus_user1 char(12) not null ,
    oecus_user2 char(12) not null ,
    oecus_user3 char(12) not null 
  );
revoke all on "maxmast".oecus from "public";

create unique index "maxmast".oecus_account on "maxmast".oecus 
    (oecus_account);
{ TABLE "maxmast".oedpt row size = 188 number of columns = 22 index size = 57 }
{ unload file name = oedpt00587.unl number of rows = 253 }

create table "maxmast".oedpt 
  (
    oedpt_account char(10) not null ,
    oedpt_storecode char(10) not null ,
    oedpt_nadcode char(10) not null ,
    oedpt_delroute char(10) not null ,
    oedpt_delmetcod char(5) not null ,
    oedpt_delinst char(20) not null ,
    oedpt_specinst char(20) not null ,
    oedpt_whnorm char(5) not null ,
    oedpt_anacode char(20) not null ,
    oedpt_geog char(5) not null ,
    oedpt_salesman char(10) not null ,
    oedpt_lastdel integer not null ,
    oedpt_lud date not null ,
    oedpt_lui char(10) not null ,
    oedpt_despdellt integer not null ,
    oedpt_tempperm char(1) not null ,
    oedpt_ordnum char(8) not null ,
    oedpt_country char(5) not null ,
    oedpt_vatnumber char(15) not null ,
    oedpt_despqtys char(1) not null ,
    oedpt_ctaxstat char(10) not null ,
    oedpt_taxempt char(1) not null 
  );
revoke all on "maxmast".oedpt from "public";

create index "maxmast".oedpt_nadcode on "maxmast".oedpt (oedpt_nadcode);
    
create unique index "maxmast".oedpt_key on "maxmast".oedpt (oedpt_account,
    oedpt_storecode);
{ TABLE "maxmast".oeim row size = 213 number of columns = 41 index size = 64 }
{ unload file name = oeim_00589.unl number of rows = 6103 }

create table "maxmast".oeim 
  (
    oeim_salesoff char(5) not null ,
    oeim_item char(15) not null ,
    oeim_packsize char(10) not null ,
    oeim_bompset char(1) not null ,
    oeim_comcode char(3) not null ,
    oeim_pricupd char(1) not null ,
    oeim_rrp float not null ,
    oeim_nextrrp float not null ,
    oeim_datnrrp date not null ,
    oeim_minordqty float not null ,
    oeim_maxordqty float not null ,
    oeim_weight float not null ,
    oeim_allocacc char(5) not null ,
    oeim_rtnacc char(5) not null ,
    oeim_toraconv char(1) not null ,
    oeim_hold char(1) not null ,
    oeim_trincst float not null ,
    oeim_lud date not null ,
    oeim_lui char(10) not null ,
    oeim_price float not null ,
    oeim_comcd char(1) not null ,
    oeim_seldec integer not null ,
    oeim_dirdel char(1) not null ,
    oeim_sernoarch char(1) not null ,
    oeim_gfsacc char(5) not null ,
    oeim_bomkitchg char(1) not null ,
    oeim_bomcomprc char(1) not null ,
    oeim_itemprcat char(5) not null ,
    oeim_fixedpric char(1) not null ,
    oeim_itemac char(15) not null ,
    oeim_priceuom char(5) not null ,
    oeim_normsuom char(5) not null ,
    oeim_exactmult char(1) not null ,
    oeim_class1 char(5) not null ,
    oeim_class2 char(5) not null ,
    oeim_sergroup char(6) not null ,
    oeim_packtype char(8) not null ,
    oeim_ecsale char(1) not null ,
    oeim_itaxstat char(10) not null ,
    oeim_ictaxstat char(10) not null ,
    oeim_taxcode char(1) not null 
  );
revoke all on "maxmast".oeim from "public";

create index "maxmast".oeim_item on "maxmast".oeim (oeim_item);
    
create unique index "maxmast".oeim_key on "maxmast".oeim (oeim_salesoff,
    oeim_item);
{ TABLE "maxmast".oelin row size = 115 number of columns = 20 index size = 96 }
{ unload file name = oelin00590.unl number of rows = 246804 }

create table "maxmast".oelin 
  (
    oelin_ordnum char(8) not null ,
    oelin_linnum integer not null ,
    oelin_linecode char(2) not null ,
    oelin_lud date not null ,
    oelin_lui char(10) not null ,
    oelin_clinnum integer not null ,
    oelin_dlinnum integer not null ,
    oelin_contract char(15) not null ,
    oelin_contype char(1) not null ,
    oelin_doclintxt char(25) not null ,
    oelin_socreate char(1) not null ,
    oelin_status char(1) not null ,
    oelin_reason char(5) not null ,
    oelin_expirydte date not null ,
    oelin_copyquote char(1) not null ,
    oelin_groupline integer not null ,
    oelin_sortline integer not null ,
    oelin_printsort integer not null ,
    oelin_orderno char(10) not null ,
    oelin_ordline integer not null 
  );
revoke all on "maxmast".oelin from "public";

create unique index "maxmast".oelin_key on "maxmast".oelin (oelin_ordnum,
    oelin_linnum);
create unique index "maxmast".oelin_key1 on "maxmast".oelin (oelin_ordnum,
    oelin_groupline,oelin_sortline,oelin_linnum);
create unique index "maxmast".oelin_key2 on "maxmast".oelin (oelin_ordnum,
    oelin_printsort,oelin_sortline,oelin_linnum);
{ TABLE "maxmast".oemcr row size = 79 number of columns = 8 index size = 13 }
{ unload file name = oemcr00591.unl number of rows = 3 }

create table "maxmast".oemcr 
  (
    oemcr_rcode char(5) not null ,
    oemcr_rtext char(30) not null ,
    oemcr_miscac char(15) not null ,
    oemcr_lud date not null ,
    oemcr_lui char(10) not null ,
    oemcr_prodclass char(6) not null ,
    oemcr_commodity char(8) not null ,
    oemcr_carriage char(1) not null 
  );
revoke all on "maxmast".oemcr from "public";

create unique index "maxmast".oemcr_rcode on "maxmast".oemcr (oemcr_rcode);
    
{ TABLE "maxmast".oempr row size = 287 number of columns = 41 index size = 865 }
{ unload file name = oempr00593.unl number of rows = 246268 }

create table "maxmast".oempr 
  (
    oempr_ordnum char(8) not null ,
    oempr_linnum integer not null ,
    oempr_status char(10) not null ,
    oempr_item char(15) not null ,
    oempr_store char(5) not null ,
    oempr_binloc char(15) not null ,
    oempr_pickqty float not null ,
    oempr_fndqty float not null ,
    oempr_stkqty float not null ,
    oempr_account char(10) not null ,
    oempr_custpri char(1) not null ,
    oempr_delroute char(10) not null ,
    oempr_delnoteno char(8) not null ,
    oempr_invnoteno char(8) not null ,
    oempr_pickdate date not null ,
    oempr_despdate date not null ,
    oempr_deldate date not null ,
    oempr_invdate date not null ,
    oempr_lud date not null ,
    oempr_lui char(10) not null ,
    oempr_progflag integer not null ,
    oempr_statflg char(1) not null ,
    oempr_serial serial not null ,
    oempr_piknoteno integer not null ,
    oempr_piknoseq integer not null ,
    oempr_custdelno char(17) not null ,
    oempr_schedule char(15) not null ,
    oempr_edidate date not null ,
    oempr_editime integer not null ,
    oempr_shipment char(17) not null ,
    oempr_smbatch char(8) not null ,
    oempr_consign char(10) not null ,
    oempr_wavepikno integer not null ,
    oempr_dateneg integer not null ,
    oempr_taxincl char(1) not null ,
    oempr_actinvdte date not null ,
    oempr_actinvtim char(6) not null ,
    oempr_user1 float not null ,
    oempr_user2 float not null ,
    oempr_user3 float not null ,
    oempr_user4 integer not null 
  );
revoke all on "maxmast".oempr from "public";

create unique index "maxmast".oempr_key1 on "maxmast".oempr (oempr_ordnum,
    oempr_linnum,oempr_progflag,oempr_serial);
create unique index "maxmast".oempr_serial on "maxmast".oempr 
    (oempr_serial);
create unique index "maxmast".oempr_key2 on "maxmast".oempr (oempr_progflag,
    oempr_ordnum,oempr_linnum,oempr_serial);
create unique index "maxmast".oempr_key3 on "maxmast".oempr (oempr_delnoteno,
    oempr_ordnum,oempr_linnum,oempr_serial);
create unique index "maxmast".oempr_key4 on "maxmast".oempr (oempr_piknoteno,
    oempr_piknoseq,oempr_serial);
create unique index "maxmast".oempr_schedkey on "maxmast".oempr 
    (oempr_account,oempr_schedule,oempr_item,oempr_despdate,oempr_serial);
    
create index "maxmast".oempr_key8 on "maxmast".oempr (oempr_ordnum,
    oempr_linnum,oempr_progflag,oempr_invnoteno);
create unique index "maxmast".oempr_key10 on "maxmast".oempr (oempr_item,
    oempr_pickdate,oempr_serial);
create unique index "maxmast".oempr_key12 on "maxmast".oempr (oempr_shipment,
    oempr_ordnum,oempr_linnum,oempr_serial);
create unique index "maxmast".oempr_key13 on "maxmast".oempr (oempr_ordnum,
    oempr_shipment,oempr_linnum,oempr_serial);
create unique index "maxmast".oempr_conskey1 on "maxmast".oempr 
    (oempr_store,oempr_progflag,oempr_account,oempr_ordnum,oempr_linnum,
    oempr_serial);
create unique index "maxmast".oempr_conskey2 on "maxmast".oempr 
    (oempr_store,oempr_progflag,oempr_ordnum,oempr_linnum,oempr_serial);
    
create unique index "maxmast".oempr_conskey3 on "maxmast".oempr 
    (oempr_consign,oempr_account,oempr_statflg,oempr_progflag,
    oempr_ordnum,oempr_linnum,oempr_serial);
create unique index "maxmast".oempr_conskey4 on "maxmast".oempr 
    (oempr_store,oempr_progflag,oempr_pickdate,oempr_ordnum,oempr_linnum,
    oempr_serial);
create unique index "maxmast".oempr_conskey5 on "maxmast".oempr 
    (oempr_consign,oempr_ordnum,oempr_linnum,oempr_serial);
create unique index "maxmast".oempr_conskey6 on "maxmast".oempr 
    (oempr_consign,oempr_delnoteno,oempr_ordnum,oempr_linnum,
    oempr_serial);
create unique index "maxmast".oempr_latestkey on "maxmast".oempr 
    (oempr_item,oempr_dateneg,oempr_serial);
create unique index "maxmast".oempr_taxkey on "maxmast".oempr 
    (oempr_taxincl,oempr_progflag,oempr_ordnum,oempr_linnum,oempr_serial);
    
create unique index "maxmast".oempr_invdatkey on "maxmast".oempr 
    (oempr_ordnum,oempr_linnum,oempr_actinvdte,oempr_actinvtim,
    oempr_serial);
{ TABLE "maxmast".oemsc row size = 163 number of columns = 24 index size = 24 }
{ unload file name = oemsc00594.unl number of rows = 1233 }

create table "maxmast".oemsc 
  (
    oemsc_ordnum char(8) not null ,
    oemsc_linnum integer not null ,
    oemsc_desc char(30) not null ,
    oemsc_value float not null ,
    oemsc_dmscdscfl char(1) not null ,
    oemsc_cost float not null ,
    oemsc_lud date not null ,
    oemsc_lui char(10) not null ,
    oemsc_prodgroup char(6) not null ,
    oemsc_linestat char(1) not null ,
    oemsc_chgetype char(5) not null ,
    oemsc_miscac char(15) not null ,
    oemsc_country char(5) not null ,
    oemsc_commodity char(8) not null ,
    oemsc_escalate char(1) not null ,
    oemsc_esccharge char(1) not null ,
    oemsc_escvalue float not null ,
    oemsc_esccost float not null ,
    oemsc_escline integer not null ,
    oemsc_netvalue float not null ,
    oemsc_itaxstat char(10) not null ,
    oemsc_origdoc char(8) not null ,
    oemsc_taxincl char(1) not null ,
    oemsc_taxcode char(1) not null 
  );
revoke all on "maxmast".oemsc from "public";

create unique index "maxmast".oemsc_key on "maxmast".oemsc (oemsc_ordnum,
    oemsc_linnum);
{ TABLE "maxmast".oepar row size = 401 number of columns = 119 index size = 7 }
{ unload file name = oepar00595.unl number of rows = 1 }

create table "maxmast".oepar 
  (
    oepar_reqac char(1) not null ,
    oepar_reqpick char(1) not null ,
    oepar_reqdel char(1) not null ,
    oepar_nextdel char(8) not null ,
    oepar_delment char(1) not null ,
    oepar_pkdesplt integer not null ,
    oepar_despreqlt integer not null ,
    oepar_allocpri char(6) not null ,
    oepar_cuspri char(6) not null ,
    oepar_stkalloc char(1) not null ,
    oepar_nextord char(8) not null ,
    oepar_nextcr char(8) not null ,
    oepar_nextdb char(8) not null ,
    oepar_nextinv char(8) not null ,
    oepar_nextreg integer not null ,
    oepar_nextpal char(8) not null ,
    oepar_pcontrec char(1) not null ,
    oepar_reqoh char(1) not null ,
    oepar_ohisp char(1) not null ,
    oepar_ohispn integer not null ,
    oepar_ordcons char(1) not null ,
    oepar_whouses char(1) not null ,
    oepar_whentry char(1) not null ,
    oepar_pchgnot char(1) not null ,
    oepar_prablog char(1) not null ,
    oepar_prcvar char(1) not null ,
    oepar_pricrev char(1) not null ,
    oepar_podopt char(1) not null ,
    oepar_nextpod char(8) not null ,
    oepar_qtybrk char(1) not null ,
    oepar_minval float not null ,
    oepar_credtol float not null ,
    oepar_ordelim char(1) not null ,
    oepar_orderrl char(1) not null ,
    oepar_ordsent char(1) not null ,
    oepar_ordtent char(1) not null ,
    oepar_notepad char(1) not null ,
    oepar_conopt char(1) not null ,
    oepar_nextcon char(8) not null ,
    oepar_btraopt char(1) not null ,
    oepar_gfsacc char(5) not null ,
    oepar_rtnsacc char(5) not null ,
    oepar_ooacc char(5) not null ,
    oepar_nextpick integer not null ,
    oepar_stflags char(10) not null ,
    oepar_lud date not null ,
    oepar_lui char(10) not null ,
    oepar_dspacc char(5) not null ,
    oepar_delacc char(5) not null ,
    oepar_pricovr char(1) not null ,
    oepar_pvarovr float not null ,
    oepar_pgcarr char(6) not null ,
    oepar_pgmin char(6) not null ,
    oepar_pginst char(6) not null ,
    oepar_pgother char(6) not null ,
    oepar_pgnonst char(6) not null ,
    oepar_locnstk char(15) not null ,
    oepar_entpklt integer not null ,
    oepar_sdiscinc char(1) not null ,
    oepar_stk01acct char(5) not null ,
    oepar_stk02acct char(5) not null ,
    oepar_stk03acct char(5) not null ,
    oepar_stk04acct char(5) not null ,
    oepar_stk05acct char(5) not null ,
    oepar_stk06acct char(5) not null ,
    oepar_stk09acct char(5) not null ,
    oepar_stk10acct char(5) not null ,
    oepar_prgflgopt char(10) not null ,
    oepar_pcordstk char(1) not null ,
    oepar_shortfall char(5) not null ,
    oepar_entseq char(1) not null ,
    oepar_additems char(1) not null ,
    oepar_eurtax char(1) not null ,
    oepar_qbaccount char(1) not null ,
    oepar_qbacctpc char(1) not null ,
    oepar_qbitem char(1) not null ,
    oepar_qbitmpc char(1) not null ,
    oepar_qbdatchk char(1) not null ,
    oepar_qbbest char(1) not null ,
    oepar_specprice char(1) not null ,
    oepar_spaccount char(1) not null ,
    oepar_spacctpc char(1) not null ,
    oepar_specdisc char(1) not null ,
    oepar_sdaccount char(1) not null ,
    oepar_sdacctpc char(1) not null ,
    oepar_sditem char(1) not null ,
    oepar_sditmpc char(1) not null ,
    oepar_spdatchk char(1) not null ,
    oepar_sddatchk char(1) not null ,
    oepar_pricemeth char(1) not null ,
    oepar_prlistovr char(1) not null ,
    oepar_adsppfnd char(1) not null ,
    oepar_qtyoverpc float not null ,
    oepar_multdelpt char(1) not null ,
    oepar_commorddf char(1) not null ,
    oepar_commpckdf char(1) not null ,
    oepar_commdspdf char(1) not null ,
    oepar_comminvdf char(1) not null ,
    oepar_commusrdf char(1) not null ,
    oepar_nxtusrdoc char(8) not null ,
    oepar_conmglip char(1) not null ,
    oepar_conlglip char(1) not null ,
    oepar_conoglip char(1) not null ,
    oepar_concglip char(1) not null ,
    oepar_contglip char(1) not null ,
    oepar_consacc char(5) not null ,
    oepar_batchctrl char(1) not null ,
    oepar_manualinv char(1) not null ,
    oepar_proformas char(1) not null ,
    oepar_pfexpdays integer not null ,
    oepar_pfdeposit float not null ,
    oepar_expiryday integer not null ,
    oepar_despqtys char(1) not null ,
    oepar_taxrates char(1) not null ,
    oepar_itaxstat char(10) not null ,
    oepar_ictaxstat char(10) not null ,
    oepar_mprogflag integer not null ,
    oepar_taxincl char(1) not null ,
    oepar_vatcode char(1) not null 
  );
revoke all on "maxmast".oepar from "public";

create unique index "maxmast".oepar_reqac on "maxmast".oepar (oepar_reqac);
    
{ TABLE "maxmast".oephdr row size = 101 number of columns = 11 index size = 91 }
{ unload file name = oephd00596.unl number of rows = 402 }

create table "maxmast".oephdr 
  (
    oeph_salesoff char(5) not null ,
    oeph_pricelist char(10) not null ,
    oeph_desc char(30) not null ,
    oeph_ondate date not null ,
    oeph_offdate date not null ,
    oeph_currency char(4) not null ,
    oeph_lud date not null ,
    oeph_lui char(10) not null ,
    oeph_ttaxstat char(10) not null ,
    oeph_wtaxstat char(10) not null ,
    oeph_dtaxstat char(10) not null 
  );
revoke all on "maxmast".oephdr from "public";

create unique index "maxmast".oeph_key on "maxmast".oephdr (oeph_salesoff,
    oeph_pricelist);
create index "maxmast".oeph_ttaxstat on "maxmast".oephdr (oeph_ttaxstat);
    
create index "maxmast".oeph_wtaxstat on "maxmast".oephdr (oeph_wtaxstat);
    
create index "maxmast".oeph_dtaxstat on "maxmast".oephdr (oeph_dtaxstat);
    
{ TABLE "maxmast".oepkg row size = 354 number of columns = 40 index size = 1173 }
{ unload file name = oepkg00597.unl number of rows = 0 }

create table "maxmast".oepkg 
  (
    oepkg_pack1 char(10) not null ,
    oepkg_type1 char(8) not null ,
    oepkg_descrip1 char(20) not null ,
    oepkg_pack2 char(10) not null ,
    oepkg_type2 char(8) not null ,
    oepkg_descrip2 char(20) not null ,
    oepkg_length float not null ,
    oepkg_width float not null ,
    oepkg_height float not null ,
    oepkg_volume float not null ,
    oepkg_gross float not null ,
    oepkg_tare float not null ,
    oepkg_net float not null ,
    oepkg_item char(15) not null ,
    oepkg_descext char(33) not null ,
    oepkg_qty float not null ,
    oepkg_shipment char(17) not null ,
    oepkg_commodity char(8) not null ,
    oepkg_quoteno char(8) not null ,
    oepkg_quoteline integer not null ,
    oepkg_ordnum char(8) not null ,
    oepkg_linnum integer not null ,
    oepkg_piknoteno integer not null ,
    oepkg_delnoteno char(8) not null ,
    oepkg_despdate date not null ,
    oepkg_desptime integer not null ,
    oepkg_despmeth char(5) not null ,
    oepkg_carndc char(10) not null ,
    oepkg_vehicle char(10) not null ,
    oepkg_ndcode char(10) not null ,
    oepkg_lud date not null ,
    oepkg_lui char(10) not null ,
    oepkg_serial serial not null ,
    oepkg_account char(10) not null ,
    oepkg_storecode char(10) not null ,
    oepkg_oempr integer not null ,
    oepkg_waitprint char(1) not null ,
    oepkg_packqty float not null ,
    oepkg_consign char(10) not null ,
    oepkg_statouter char(1) not null 
  );
revoke all on "maxmast".oepkg from "public";

create index "maxmast".oepkg_pack1 on "maxmast".oepkg (oepkg_pack1);
    
create index "maxmast".oepkg_pack2 on "maxmast".oepkg (oepkg_pack2);
    
create unique index "maxmast".oepkg_key1 on "maxmast".oepkg (oepkg_shipment,
    oepkg_ordnum,oepkg_linnum,oepkg_type2,oepkg_pack2,oepkg_serial);
    
create index "maxmast".oepkg_key2 on "maxmast".oepkg (oepkg_ordnum,
    oepkg_linnum);
create unique index "maxmast".oepkg_key4 on "maxmast".oepkg (oepkg_pack2,
    oepkg_pack1,oepkg_item,oepkg_serial);
create index "maxmast".oepkg_key3 on "maxmast".oepkg (oepkg_ordnum,
    oepkg_linnum,oepkg_oempr,oepkg_type1,oepkg_pack1);
create index "maxmast".oepkg_key5 on "maxmast".oepkg (oepkg_ordnum,
    oepkg_linnum,oepkg_oempr,oepkg_type2,oepkg_pack2);
create unique index "maxmast".oepkg_key6 on "maxmast".oepkg (oepkg_type1,
    oepkg_pack1,oepkg_serial);
create unique index "maxmast".oepkg_key7 on "maxmast".oepkg (oepkg_type2,
    oepkg_pack2,oepkg_serial);
create unique index "maxmast".oepkg_key8 on "maxmast".oepkg (oepkg_ordnum,
    oepkg_pack2,oepkg_serial);
create unique index "maxmast".oepkg_key9 on "maxmast".oepkg (oepkg_waitprint,
    oepkg_storecode,oepkg_pack2,oepkg_pack1,oepkg_item,oepkg_serial);
    
create unique index "maxmast".oepkg_key10 on "maxmast".oepkg (oepkg_delnoteno,
    oepkg_ordnum,oepkg_linnum,oepkg_pack2,oepkg_serial);
create unique index "maxmast".oepkg_key11 on "maxmast".oepkg (oepkg_type1,
    oepkg_pack1,oepkg_ordnum,oepkg_serial);
create unique index "maxmast".oepkg_key12 on "maxmast".oepkg (oepkg_ordnum,
    oepkg_linnum,oepkg_oempr,oepkg_serial);
create unique index "maxmast".oepkg_shipkey on "maxmast".oepkg 
    (oepkg_shipment,oepkg_type1,oepkg_pack1,oepkg_serial);
create unique index "maxmast".oepkg_custkey on "maxmast".oepkg 
    (oepkg_account,oepkg_type1,oepkg_pack1,oepkg_serial);
create unique index "maxmast".oepkg_orderkey on "maxmast".oepkg 
    (oepkg_ordnum,oepkg_type1,oepkg_pack1,oepkg_serial);
create unique index "maxmast".oepkg_pickkey on "maxmast".oepkg 
    (oepkg_piknoteno,oepkg_type1,oepkg_pack1,oepkg_serial);
create unique index "maxmast".oepkg_despkey on "maxmast".oepkg 
    (oepkg_delnoteno,oepkg_type1,oepkg_pack1,oepkg_serial);
create unique index "maxmast".oepkg_weightkey on "maxmast".oepkg 
    (oepkg_shipment,oepkg_type2,oepkg_pack2,oepkg_serial);
create unique index "maxmast".oepkg_conskey1 on "maxmast".oepkg 
    (oepkg_consign,oepkg_account,oepkg_pack1,oepkg_type1,oepkg_ordnum,
    oepkg_linnum,oepkg_serial);
create unique index "maxmast".oepkg_conskey2 on "maxmast".oepkg 
    (oepkg_consign,oepkg_pack2,oepkg_type2,oepkg_pack1,oepkg_ordnum,
    oepkg_linnum,oepkg_serial);
{ TABLE "maxmast".oeshp row size = 1451 number of columns = 105 index size = 100 
              }
{ unload file name = oeshp00598.unl number of rows = 1 }

create table "maxmast".oeshp 
  (
    oeshp_shipment char(17) not null ,
    oeshp_mark1 char(17) not null ,
    oeshp_mark2 char(17) not null ,
    oeshp_mark3 char(17) not null ,
    oeshp_mark4 char(17) not null ,
    oeshp_mark5 char(17) not null ,
    oeshp_mark6 char(17) not null ,
    oeshp_mark7 char(17) not null ,
    oeshp_mark8 char(17) not null ,
    oeshp_mark9 char(17) not null ,
    oeshp_mark10 char(17) not null ,
    oeshp_nopacks integer not null ,
    oeshp_packtype char(17) not null ,
    oeshp_goodesc1 char(35) not null ,
    oeshp_goodesc2 char(35) not null ,
    oeshp_goodesc3 char(35) not null ,
    oeshp_goodesc4 char(35) not null ,
    oeshp_goodesc5 char(35) not null ,
    oeshp_invdec1 char(10) not null ,
    oeshp_invdec2 char(10) not null ,
    oeshp_invtext1 char(35) not null ,
    oeshp_invtext2 char(35) not null ,
    oeshp_invtext3 char(35) not null ,
    oeshp_invtext4 char(35) not null ,
    oeshp_invtext5 char(35) not null ,
    oeshp_invtext6 char(35) not null ,
    oeshp_invtext7 char(35) not null ,
    oeshp_invtext8 char(35) not null ,
    oeshp_invtext9 char(35) not null ,
    oeshp_invtext10 char(35) not null ,
    oeshp_payterms char(10) not null ,
    oeshp_delterms char(10) not null ,
    oeshp_salterms char(10) not null ,
    oeshp_forndc char(10) not null ,
    oeshp_carndc char(10) not null ,
    oeshp_uktran1 char(35) not null ,
    oeshp_uktran2 char(35) not null ,
    oeshp_uktran3 char(35) not null ,
    oeshp_uktran4 char(35) not null ,
    oeshp_uktran5 char(35) not null ,
    oeshp_coorigin char(5) not null ,
    oeshp_codest char(5) not null ,
    oeshp_vehicle char(17) not null ,
    oeshp_portload char(5) not null ,
    oeshp_portdisc char(5) not null ,
    oeshp_portdeli char(5) not null ,
    oeshp_issplace char(14) not null ,
    oeshp_issdate date not null ,
    oeshp_isstime float not null ,
    oeshp_lud date not null ,
    oeshp_lui char(10) not null ,
    oeshp_conind char(1) not null ,
    oeshp_container char(13) not null ,
    oeshp_contype char(20) not null ,
    oeshp_contare float not null ,
    oeshp_congross float not null ,
    oeshp_seal char(17) not null ,
    oeshp_regvehi char(10) not null ,
    oeshp_regtrai char(10) not null ,
    oeshp_refbuyer char(20) not null ,
    oeshp_refseller char(20) not null ,
    oeshp_refother char(20) not null ,
    oeshp_despmeth char(5) not null ,
    oeshp_comm1 char(9) not null ,
    oeshp_comm2 char(9) not null ,
    oeshp_c1gross float not null ,
    oeshp_c2gross float not null ,
    oeshp_c1net float not null ,
    oeshp_c2net float not null ,
    oeshp_c1volume float not null ,
    oeshp_c2volume float not null ,
    oeshp_signature char(26) not null ,
    oeshp_shipgross float not null ,
    oeshp_shipweigh float not null ,
    oeshp_shipvol float not null ,
    oeshp_ecsicode char(10) not null ,
    oeshp_certship char(1) not null ,
    oeshp_waybill char(1) not null ,
    oeshp_lading char(1) not null ,
    oeshp_ladingorg integer not null ,
    oeshp_ladingcop integer not null ,
    oeshp_certorg char(1) not null ,
    oeshp_fobserve char(1) not null ,
    oeshp_ukcust char(1) not null ,
    oeshp_tform char(1) not null ,
    oeshp_ukcarrpor char(1) not null ,
    oeshp_ukcarrdep char(1) not null ,
    oeshp_ukport char(1) not null ,
    oeshp_fretoloc char(10) not null ,
    oeshp_destport char(1) not null ,
    oeshp_descardep char(1) not null ,
    oeshp_descardel char(1) not null ,
    oeshp_oceanfloc char(10) not null ,
    oeshp_route char(35) not null ,
    oeshp_forward char(1) not null ,
    oeshp_fretochar char(1) not null ,
    oeshp_custcode char(10) not null ,
    oeshp_exported char(1) not null ,
    oeshp_packing char(1) not null ,
    oeshp_invoice char(1) not null ,
    oeshp_c1fob float not null ,
    oeshp_c2fob float not null ,
    oeshp_type char(1) not null ,
    oeshp_duedate date not null ,
    oeshp_status char(1) not null 
  );
revoke all on "maxmast".oeshp from "public";

create unique index "maxmast".oeshp_shipment on "maxmast".oeshp 
    (oeshp_shipment);
create index "maxmast".oeshp_custcode on "maxmast".oeshp (oeshp_custcode);
    
create unique index "maxmast".oeshp_typekey on "maxmast".oeshp 
    (oeshp_type,oeshp_custcode,oeshp_shipment);
{ TABLE "maxmast".oetrn row size = 1135 number of columns = 130 index size = 1084 
              }
{ unload file name = oetrn00599.unl number of rows = 256502 }

create table "maxmast".oetrn 
  (
    oetrn_ordnum char(8) not null ,
    oetrn_linnum integer not null ,
    oetrn_invnum char(8) not null ,
    oetrn_account char(10) not null ,
    oetrn_item char(15) not null ,
    oetrn_store char(5) not null ,
    oetrn_ordtype char(1) not null ,
    oetrn_deladdcod char(10) not null ,
    oetrn_ponum char(15) not null ,
    oetrn_otycod char(5) not null ,
    oetrn_origcod char(5) not null ,
    oetrn_termscode char(2) not null ,
    oetrn_salesman char(10) not null ,
    oetrn_sales2man char(10) not null ,
    oetrn_sm2percen float not null ,
    oetrn_invdate date not null ,
    oetrn_entdate date not null ,
    oetrn_orddate date not null ,
    oetrn_salesoff char(5) not null ,
    oetrn_invdcod char(2) not null ,
    oetrn_taxcode char(10) not null ,
    oetrn_lindcod char(2) not null ,
    oetrn_prodgroup char(6) not null ,
    oetrn_oinvqty float not null ,
    oetrn_sinvqty float not null ,
    oetrn_orduom char(5) not null ,
    oetrn_lud date not null ,
    oetrn_lui char(10) not null ,
    oetrn_serial serial not null ,
    oetrn_priceuom char(5) not null ,
    oetrn_gross float not null ,
    oetrn_ldisc float not null ,
    oetrn_odisc float not null ,
    oetrn_tax float not null ,
    oetrn_net float not null ,
    oetrn_updflag char(1) not null ,
    oetrn_linetype char(1) not null ,
    oetrn_cost float not null ,
    oetrn_price float not null ,
    oetrn_invreg integer not null ,
    oetrn_regprtflg char(1) not null ,
    oetrn_geog char(5) not null ,
    oetrn_pricelist char(10) not null ,
    oetrn_promlist char(10) not null ,
    oetrn_taxrate float not null ,
    oetrn_delnoteno char(8) not null ,
    oetrn_trantype char(1) not null ,
    oetrn_branch char(2) not null ,
    oetrn_discntac char(15) not null ,
    oetrn_itemac char(15) not null ,
    oetrn_crdbind char(1) not null ,
    oetrn_settdisc float not null ,
    oetrn_currcode char(4) not null ,
    oetrn_cgross float not null ,
    oetrn_cnet float not null ,
    oetrn_cldisc float not null ,
    oetrn_codisc float not null ,
    oetrn_csettdisc float not null ,
    oetrn_ctax float not null ,
    oetrn_ccost float not null ,
    oetrn_cprice float not null ,
    oetrn_primerate float not null ,
    oetrn_batch char(6) not null ,
    oetrn_custcode char(10) not null ,
    oetrn_glmposted char(1) not null ,
    oetrn_gllposted char(1) not null ,
    oetrn_gloposted char(1) not null ,
    oetrn_gltposted char(1) not null ,
    oetrn_glcposted char(1) not null ,
    oetrn_intref char(8) not null ,
    oetrn_extref char(30) not null ,
    oetrn_mcurrbr char(6) not null ,
    oetrn_lcurrbr char(6) not null ,
    oetrn_ocurrbr char(6) not null ,
    oetrn_tcurrbr char(6) not null ,
    oetrn_ccurrbr char(6) not null ,
    oetrn_mactinvno char(18) not null ,
    oetrn_lactinvno char(18) not null ,
    oetrn_oactinvno char(18) not null ,
    oetrn_tactinvno char(18) not null ,
    oetrn_cactinvno char(18) not null ,
    oetrn_mitmdisac char(60) not null ,
    oetrn_glref1 char(15) not null ,
    oetrn_glref2 char(15) not null ,
    oetrn_glref3 char(15) not null ,
    oetrn_glref4 char(15) not null ,
    oetrn_glref5 char(15) not null ,
    oetrn_deldate date not null ,
    oetrn_pfcashrec float not null ,
    oetrn_hcinvoice char(1) not null ,
    oetrn_faxinvoic char(1) not null ,
    oetrn_ediinvoic char(1) not null ,
    oetrn_edinvdate date not null ,
    oetrn_edinvtime integer not null ,
    oetrn_shipment char(17) not null ,
    oetrn_mprserial integer not null ,
    oetrn_boepayee char(10) not null ,
    oetrn_ccauth char(10) not null ,
    oetrn_originv char(8) not null ,
    oetrn_origlin integer not null ,
    oetrn_cosglacc char(15) not null ,
    oetrn_stkglacc char(15) not null ,
    oetrn_txlinklin integer not null ,
    oetrn_taxable float not null ,
    oetrn_ctaxable float not null ,
    oetrn_hide char(1) not null ,
    oetrn_source char(1) not null ,
    oetrn_itemid char(40) not null ,
    oetrn_slinetype char(2) not null ,
    oetrn_grosglval float not null ,
    oetrn_ldisglval float not null ,
    oetrn_odisglval float not null ,
    oetrn_taxglval float not null ,
    oetrn_nettglval float not null ,
    oetrn_groupline integer not null ,
    oetrn_smbatch char(8) not null ,
    oetrn_odisglacc char(15) not null ,
    oetrn_ldiscntac char(15) not null ,
    oetrn_consign char(10) not null ,
    oetrn_conmethod char(1) not null ,
    oetrn_trunmeth char(1) not null ,
    oetrn_trunfac float not null ,
    oetrn_ncgflg char(1) not null ,
    oetrn_gldate date not null ,
    oetrn_susptax char(1) not null ,
    oetrn_taxdate date not null ,
    oetrn_citmdisac char(30) not null ,
    oetrn_litmdisac char(30) not null ,
    oetrn_oitmdisac char(30) not null ,
    oetrn_titmdisac char(30) not null 
  );
revoke all on "maxmast".oetrn from "public";

create unique index "maxmast".oetrn_serial on "maxmast".oetrn 
    (oetrn_serial);
create unique index "maxmast".oetrn_key1 on "maxmast".oetrn (oetrn_ordnum,
    oetrn_linnum,oetrn_serial);
create unique index "maxmast".oetrn_key2 on "maxmast".oetrn (oetrn_invreg,
    oetrn_invnum,oetrn_serial);
create unique index "maxmast".oetrn_key3 on "maxmast".oetrn (oetrn_glmposted,
    oetrn_invreg,oetrn_mcurrbr,oetrn_mactinvno,oetrn_mitmdisac,
    oetrn_serial);
create unique index "maxmast".oetrn_key4 on "maxmast".oetrn (oetrn_gllposted,
    oetrn_invreg,oetrn_lcurrbr,oetrn_lactinvno,oetrn_mitmdisac,
    oetrn_serial);
create unique index "maxmast".oetrn_key5 on "maxmast".oetrn (oetrn_gloposted,
    oetrn_invreg,oetrn_ocurrbr,oetrn_oactinvno,oetrn_mitmdisac,
    oetrn_serial);
create unique index "maxmast".oetrn_key6 on "maxmast".oetrn (oetrn_gltposted,
    oetrn_invreg,oetrn_tcurrbr,oetrn_tactinvno,oetrn_mitmdisac,
    oetrn_serial);
create unique index "maxmast".oetrn_key7 on "maxmast".oetrn (oetrn_glcposted,
    oetrn_invreg,oetrn_ccurrbr,oetrn_cactinvno,oetrn_mitmdisac,
    oetrn_serial);
create unique index "maxmast".oetrn_key9 on "maxmast".oetrn (oetrn_batch,
    oetrn_invnum,oetrn_ordnum,oetrn_linnum,oetrn_serial);
create index "maxmast".oetrn_key8 on "maxmast".oetrn (oetrn_ordnum,
    oetrn_linnum,oetrn_invnum);
create index "maxmast".oetrn_key10 on "maxmast".oetrn (oetrn_salesman,
    oetrn_entdate);
create index "maxmast".oetrn_key11 on "maxmast".oetrn (oetrn_sales2man,
    oetrn_entdate);
create unique index "maxmast".oetrn_key12 on "maxmast".oetrn (oetrn_regprtflg,
    oetrn_batch,oetrn_serial);
create unique index "maxmast".oetrn_key13 on "maxmast".oetrn (oetrn_invnum,
    oetrn_ordnum,oetrn_linnum,oetrn_serial);
create unique index "maxmast".oetrn_key14 on "maxmast".oetrn (oetrn_invnum,
    oetrn_ordnum,oetrn_txlinklin,oetrn_serial);
create unique index "maxmast".oetrn_key15 on "maxmast".oetrn (oetrn_salesoff,
    oetrn_ordnum,oetrn_linnum,oetrn_serial);
{ TABLE "maxmast".outrg row size = 447 number of columns = 18 index size = 12 }
{ unload file name = outrg00600.unl number of rows = 0 }

create table "maxmast".outrg 
  (
    outrg_trigtype char(1) not null ,
    outrg_userid char(10) not null ,
    outrg_progid char(10) not null ,
    outrg_key char(15) not null ,
    outrg_seq integer not null ,
    outrg_database char(4) not null ,
    outrg_message char(300) not null ,
    outrg_link char(20) not null ,
    outrg_trigdate date not null ,
    outrg_trigtime integer not null ,
    outrg_serkey serial not null ,
    outrg_custcode char(10) not null ,
    outrg_supplier char(10) not null ,
    outrg_messageid char(9) not null ,
    outrg_lud date not null ,
    outrg_lut integer not null ,
    outrg_linkid integer not null ,
    outrg_category char(30) not null 
  );
revoke all on "maxmast".outrg from "public";

create unique index "maxmast".outrg_serkey on "maxmast".outrg 
    (outrg_serkey);
{ TABLE "maxmast".pdchq row size = 65 number of columns = 3 index size = 21 }
{ unload file name = pdchq00601.unl number of rows = 0 }

create table "maxmast".pdchq 
  (
    pdc_pdcgroup char(10) not null ,
    pdc_pdcdesc char(40) not null ,
    pdc_acctcode char(15) not null 
  );
revoke all on "maxmast".pdchq from "public";

create unique index "maxmast".pdc_pdcgroup on "maxmast".pdchq 
    (pdc_pdcgroup);
{ TABLE "maxmast".phlin row size = 212 number of columns = 30 index size = 66 }
{ unload file name = phlin00602.unl number of rows = 0 }

create table "maxmast".phlin 
  (
    phlin_orderno char(10) not null ,
    phlin_ordline integer not null ,
    phlin_onrev integer not null ,
    phlin_offrev integer not null ,
    phlin_completed char(1) not null ,
    phlin_status char(1) not null ,
    phlin_blanket char(1) not null ,
    phlin_valuelim float not null ,
    phlin_qtylim float not null ,
    phlin_deluom char(5) not null ,
    phlin_datelim date not null ,
    phlin_linecost float not null ,
    phlin_price float not null ,
    phlin_priceuom char(5) not null ,
    phlin_puaccount char(15) not null ,
    phlin_termcode char(10) not null ,
    phlin_lud date not null ,
    phlin_lui char(10) not null ,
    phlin_item char(15) not null ,
    phlin_stocked char(1) not null ,
    phlin_desckey char(8) not null ,
    phlin_descext char(33) not null ,
    phlin_manfac char(5) not null ,
    phlin_routeid char(5) not null ,
    phlin_opno char(5) not null ,
    phlin_workcen char(5) not null ,
    phlin_drawno char(20) not null ,
    phlin_drawiss char(3) not null ,
    phlin_issnochng char(1) not null ,
    phlin_prcechng char(1) not null 
  );
revoke all on "maxmast".phlin from "public";

create unique index "maxmast".phlin_onkey on "maxmast".phlin (phlin_orderno,
    phlin_ordline,phlin_onrev);
create unique index "maxmast".phlin_offkey on "maxmast".phlin 
    (phlin_orderno,phlin_ordline,phlin_offrev);
{ TABLE "maxmast".phord row size = 148 number of columns = 23 index size = 54 }
{ unload file name = phord00603.unl number of rows = 0 }

create table "maxmast".phord 
  (
    phord_orderno char(10) not null ,
    phord_onrev integer not null ,
    phord_offrev integer not null ,
    phord_printdate date not null ,
    phord_amendflg char(1) not null ,
    phord_cost float not null ,
    phord_status char(1) not null ,
    phord_stage char(1) not null ,
    phord_completed char(1) not null ,
    phord_workcen char(5) not null ,
    phord_wkcenrate float not null ,
    phord_wkcenunit char(5) not null ,
    phord_qtylim float not null ,
    phord_qlimuom char(5) not null ,
    phord_ndcode char(10) not null ,
    phord_dndcode char(10) not null ,
    phord_scndcode char(10) not null ,
    phord_termcode char(10) not null ,
    phord_terms char(10) not null ,
    phord_lud date not null ,
    phord_lui char(10) not null ,
    phord_supref char(15) not null ,
    phord_ackdate date not null 
  );
revoke all on "maxmast".phord from "public";

create unique index "maxmast".phord_onkey on "maxmast".phord (phord_orderno,
    phord_onrev);
create unique index "maxmast".phord_offkey on "maxmast".phord 
    (phord_orderno,phord_offrev);
{ TABLE "maxmast".phrel row size = 67 number of columns = 14 index size = 78 }
{ unload file name = phrel00604.unl number of rows = 0 }

create table "maxmast".phrel 
  (
    phrel_orderno char(10) not null ,
    phrel_ordline integer not null ,
    phrel_release integer not null ,
    phrel_onrev integer not null ,
    phrel_offrev integer not null ,
    phrel_completed char(1) not null ,
    phrel_duedate date not null ,
    phrel_dueqty float not null ,
    phrel_deldate date not null ,
    phrel_delqty float not null ,
    phrel_lud date not null ,
    phrel_lui char(10) not null ,
    phrel_duedtchng char(1) not null ,
    phrel_qtychng char(1) not null 
  );
revoke all on "maxmast".phrel from "public";

create unique index "maxmast".phrel_onkey on "maxmast".phrel (phrel_orderno,
    phrel_ordline,phrel_release,phrel_onrev);
create unique index "maxmast".phrel_offkey on "maxmast".phrel 
    (phrel_orderno,phrel_ordline,phrel_release,phrel_offrev);
    
{ TABLE "maxmast".plarch row size = 452 number of columns = 63 index size = 522 }
{ unload file name = plarc00605.unl number of rows = 61645 }

create table "maxmast".plarch 
  (
    pla_seq serial not null ,
    pla_supplier char(10) not null ,
    pla_trandate date not null ,
    pla_ourref char(8) not null ,
    pla_type char(1) not null ,
    pla_status char(1) not null ,
    pla_extref char(30) not null ,
    pla_batch char(6) not null ,
    pla_source char(1) not null ,
    pla_value float not null ,
    pla_discvalue float not null ,
    pla_payvalue float not null ,
    pla_taxvalue float not null ,
    pla_terms char(10) not null ,
    pla_duedate date not null ,
    pla_proof integer not null ,
    pla_fproof integer not null ,
    pla_pendflg char(1) not null ,
    pla_userid char(4) not null ,
    pla_period integer not null ,
    pla_contract char(7) not null ,
    pla_year integer not null ,
    pla_coid char(4) not null ,
    pla_xref char(8) not null ,
    pla_currrate float not null ,
    pla_currency char(4) not null ,
    pla_linkref char(15) not null ,
    pla_cclink char(15) not null ,
    pla_currref char(10) not null ,
    pla_authid char(10) not null ,
    pla_invoicpen char(1) not null ,
    pla_peninvdat date not null ,
    pla_conrate char(1) not null ,
    pla_revalno integer not null ,
    pla_revdate date not null ,
    pla_authdate date not null ,
    pla_twinrate float not null ,
    pla_currstat integer not null ,
    pla_boepayee char(10) not null ,
    pla_origcurr char(4) not null ,
    pla_origval float not null ,
    pla_origdisc float not null ,
    pla_paydate date not null ,
    pla_basecurr char(4) not null ,
    pla_origbase float not null ,
    pla_discbase float not null ,
    pla_currvar float not null ,
    pla_postdate date not null ,
    pla_conmethod char(1) not null ,
    pla_trunmeth char(1) not null ,
    pla_trunfac float not null ,
    pla_constant char(10) not null ,
    pla_paymethod char(1) not null ,
    pla_revcurr float not null ,
    pla_payee char(10) not null ,
    pla_gldate date not null ,
    pla_comment char(56) not null ,
    pla_docref char(8) not null ,
    pla_remcode integer not null ,
    pla_twindisc float not null ,
    pla_twinpay float not null ,
    pla_twintax float not null ,
    pla_twinval float not null 
  );
revoke all on "maxmast".plarch from "public";

create unique index "maxmast".pla_seq on "maxmast".plarch (pla_seq);
    
create index "maxmast".pla_suppkey on "maxmast".plarch (pla_supplier,
    pla_trandate,pla_type,pla_ourref);
create unique index "maxmast".pla_mainkey on "maxmast".plarch 
    (pla_ourref,pla_seq);
create unique index "maxmast".pla_key1 on "maxmast".plarch (pla_supplier,
    pla_trandate,pla_extref,pla_seq,pla_ourref);
create unique index "maxmast".pla_key8 on "maxmast".plarch (pla_supplier,
    pla_ourref,pla_trandate,pla_seq);
create unique index "maxmast".pla_batkey on "maxmast".plarch (pla_batch,
    pla_supplier,pla_trandate,pla_ourref,pla_seq);
create unique index "maxmast".pla_tkey9 on "maxmast".plarch (pla_batch,
    pla_currency,pla_supplier,pla_trandate,pla_seq);
create unique index "maxmast".pla_extkey on "maxmast".plarch (pla_extref,
    pla_supplier,pla_seq);
create index "maxmast".pla_cclink on "maxmast".plarch (pla_cclink);
    
create index "maxmast".pla_xtranext on "maxmast".plarch (pla_xref,
    pla_trandate,pla_extref);
create unique index "maxmast".pla_yspkey on "maxmast".plarch (pla_year,
    pla_supplier,pla_period,pla_seq);
{ TABLE "maxmast".plcum row size = 109 number of columns = 10 index size = 27 }
{ unload file name = plcum00606.unl number of rows = 0 }

create table "maxmast".plcum 
  (
    plcum_type char(1) not null ,
    plcum_currency char(4) not null ,
    plcum_plcontrol char(15) not null ,
    plcum_plrevvar char(15) not null ,
    plcum_plcurvar char(15) not null ,
    plcum_plpfcntrl char(15) not null ,
    plcum_plcu2var char(15) not null ,
    plcum_plre2var char(15) not null ,
    plcum_lui char(10) not null ,
    plcum_lud date not null 
  );
revoke all on "maxmast".plcum from "public";

create unique index "maxmast".plcum_key on "maxmast".plcum (plcum_type,
    plcum_currency);
create unique index "maxmast".plcum_key2 on "maxmast".plcum (plcum_currency,
    plcum_type);
{ TABLE "maxmast".plcva row size = 35 number of columns = 7 index size = 24 }
{ unload file name = plcva00607.unl number of rows = 0 }

create table "maxmast".plcva 
  (
    plcva_currency char(4) not null ,
    plcva_currrate float not null ,
    plcva_password integer not null ,
    plcva_revdate date not null ,
    plcva_lud date not null ,
    plcva_lui char(10) not null ,
    plcva_conmethod char(1) not null 
  );
revoke all on "maxmast".plcva from "public";

create unique index "maxmast".plcva_key on "maxmast".plcva (plcva_currency,
    plcva_currrate);
{ TABLE "maxmast".plopn row size = 34 number of columns = 5 index size = 33 }
{ unload file name = plopn00608.unl number of rows = 528 }

create table "maxmast".plopn 
  (
    plopn_supplier char(10) not null ,
    plopn_year integer not null ,
    plopn_currency char(4) not null ,
    plopn_opcurbal float not null ,
    plopn_opbasbal float not null 
  );
revoke all on "maxmast".plopn from "public";

create unique index "maxmast".plopn_key on "maxmast".plopn (plopn_supplier,
    plopn_year,plopn_currency);
{ TABLE "maxmast".plpara row size = 191 number of columns = 39 index size = 7 }
{ unload file name = plpar00609.unl number of rows = 1 }

create table "maxmast".plpara 
  (
    plpar_key char(1) not null ,
    plpar_master char(4) not null ,
    plpar_year integer not null ,
    plpar_curper integer not null ,
    plpar_proof integer not null ,
    plpar_listbat char(1) not null ,
    plpar_suppuse char(1) not null ,
    plpar_periodend char(1) not null ,
    plpar_authorind char(1) not null ,
    plpar_costedvat char(1) not null ,
    plpar_archive char(1) not null ,
    plpar_discount char(15) not null ,
    plpar_purch char(15) not null ,
    plpar_remit char(1) not null ,
    plpar_costused char(1) not null ,
    plpar_payeetype char(1) not null ,
    plpar_intref integer not null ,
    plpar_intprefix char(4) not null ,
    plpar_authanal char(1) not null ,
    plpar_proofreq char(1) not null ,
    plpar_settcost char(1) not null ,
    plpar_setttcode integer not null ,
    plpar_settsusp char(15) not null ,
    plpar_scrnprnt char(1) not null ,
    plpar_pendreq char(1) not null ,
    plpar_revalno integer not null ,
    plpar_payref integer not null ,
    plpar_payprefix char(4) not null ,
    plpar_plbatch char(1) not null ,
    plpar_gldtupd char(1) not null ,
    plpar_automatch char(1) not null ,
    plpar_caccount char(15) not null ,
    plpar_codemod integer not null ,
    plpar_invregmat char(15) not null ,
    plpar_maxcarr float not null ,
    plpar_pvarmax float not null ,
    plpar_pvarperc float not null ,
    plpar_saccount char(15) not null ,
    plpar_uaccount char(15) not null 
  );
revoke all on "maxmast".plpara from "public";

create unique index "maxmast".plpar_key on "maxmast".plpara (plpar_key);
    
{ TABLE "maxmast".plstat row size = 70 number of columns = 10 index size = 117 }
{ unload file name = plsta00610.unl number of rows = 97739 }

create table "maxmast".plstat 
  (
    pls_supplier char(10) not null ,
    pls_year integer not null ,
    pls_period integer not null ,
    pls_totpurch float not null ,
    pls_bfdpurch float not null ,
    pls_currency char(4) not null ,
    pls_totcurdb float not null ,
    pls_totcurcr float not null ,
    pls_totbasdb float not null ,
    pls_totbascr float not null 
  );
revoke all on "maxmast".plstat from "public";

create unique index "maxmast".pls_key on "maxmast".plstat (pls_supplier,
    pls_year,pls_period,pls_currency);
create unique index "maxmast".pls_sckey on "maxmast".plstat (pls_supplier,
    pls_currency,pls_year,pls_period);
create unique index "maxmast".pls_cskey on "maxmast".plstat (pls_currency,
    pls_supplier,pls_year,pls_period);
{ TABLE "maxmast".plsupp row size = 239 number of columns = 40 index size = 136 }
{ unload file name = plsup00611.unl number of rows = 551 }

create table "maxmast".plsupp 
  (
    plsup_supplier char(10) not null ,
    plsup_branch char(4) not null ,
    plsup_anaid char(10) not null ,
    plsup_ndcode char(10) not null ,
    plsup_payee char(10) not null ,
    plsup_currency char(4) not null ,
    plsup_limit float not null ,
    plsup_balance float not null ,
    plsup_type char(1) not null ,
    plsup_remit char(1) not null ,
    plsup_termcode char(10) not null ,
    plsup_glaccount char(15) not null ,
    plsup_ocind char(1) not null ,
    plsup_dateopen date not null ,
    plsup_lastpurch date not null ,
    plsup_lastpay date not null ,
    plsup_cumturn float not null ,
    plsup_cexrate float not null ,
    plsup_country char(5) not null ,
    plsup_accountco char(15) not null ,
    plsup_percrate float not null ,
    plsup_status char(1) not null ,
    plsup_paymethod char(1) not null ,
    plsup_class1 char(5) not null ,
    plsup_class2 char(5) not null ,
    plsup_class3 char(5) not null ,
    plsup_control char(3) not null ,
    plsup_priority integer not null ,
    plsup_credwith char(1) not null ,
    plsup_language char(5) not null ,
    plsup_acctref char(10) not null ,
    plsup_twinreqd char(1) not null ,
    plsup_cashflow char(1) not null ,
    plsup_twincurr char(4) not null ,
    plsup_taxreg char(15) not null ,
    plsup_staxstat char(10) not null ,
    plsup_dittxstat char(10) not null ,
    plsup_conspmt char(1) not null ,
    plsup_twinbal float not null ,
    plsup_vatcode char(1) not null 
  );
revoke all on "maxmast".plsupp from "public";

create index "maxmast".plsup_ndcode on "maxmast".plsupp (plsup_ndcode);
    
create unique index "maxmast".plsup_key on "maxmast".plsupp (plsup_supplier,
    plsup_branch);
create index "maxmast".plsup_currkey on "maxmast".plsupp (plsup_currency,
    plsup_supplier);
create unique index "maxmast".plsup_ckey on "maxmast".plsupp (plsup_currency,
    plsup_supplier,plsup_branch);
create index "maxmast".plsup_allockey on "maxmast".plsupp (plsup_credwith,
    plsup_priority,plsup_supplier);
{ TABLE "maxmast".plterm row size = 115 number of columns = 20 index size = 21 }
{ unload file name = plter00612.unl number of rows = 1 }

create table "maxmast".plterm 
  (
    pltc_code char(10) not null ,
    pltc_desc char(30) not null ,
    pltc_month1 integer not null ,
    pltc_percent1 float not null ,
    pltc_month2 integer not null ,
    pltc_per2cent float not null ,
    pltc_month3 integer not null ,
    pltc_per3cent float not null ,
    pltc_type1 char(1) not null ,
    pltc_type2 char(1) not null ,
    pltc_type3 char(1) not null ,
    pltc_adddays1 integer not null ,
    pltc_dueday1 integer not null ,
    pltc_adddays2 integer not null ,
    pltc_dueday2 integer not null ,
    pltc_adddays3 integer not null ,
    pltc_dueday3 integer not null ,
    pltc_days1 integer not null ,
    pltc_days2 integer not null ,
    pltc_days3 integer not null 
  );
revoke all on "maxmast".plterm from "public";

create unique index "maxmast".pltc_code on "maxmast".plterm (pltc_code);
    
{ TABLE "maxmast".pltran row size = 467 number of columns = 65 index size = 615 }
{ unload file name = pltra00613.unl number of rows = 83 }

create table "maxmast".pltran 
  (
    plt_supplier char(10) not null ,
    plt_trandate date not null ,
    plt_ourref char(8) not null ,
    plt_type char(1) not null ,
    plt_status char(1) not null ,
    plt_extref char(30) not null ,
    plt_batch char(6) not null ,
    plt_source char(1) not null ,
    plt_value float not null ,
    plt_discvalue float not null ,
    plt_payvalue float not null ,
    plt_taxvalue float not null ,
    plt_terms char(10) not null ,
    plt_duedate date not null ,
    plt_proof integer not null ,
    plt_fproof integer not null ,
    plt_pendflg char(1) not null ,
    plt_userid char(10) not null ,
    plt_seq serial not null ,
    plt_period integer not null ,
    plt_year integer not null ,
    plt_authdate date not null ,
    plt_coid char(4) not null ,
    plt_xref char(8) not null ,
    plt_contract char(7) not null ,
    plt_currency char(4) not null ,
    plt_currrate float not null ,
    plt_baseval float not null ,
    plt_revdate date not null ,
    plt_revalno integer not null ,
    plt_conrate char(1) not null ,
    plt_linkref char(15) not null ,
    plt_peninvdat date not null ,
    plt_invoicpen char(1) not null ,
    plt_batchprt char(1) not null ,
    plt_authid char(10) not null ,
    plt_currref char(10) not null ,
    plt_cclink char(15) not null ,
    plt_twinrate float not null ,
    plt_currstat integer not null ,
    plt_payee char(10) not null ,
    plt_origcurr char(4) not null ,
    plt_origval float not null ,
    plt_origdisc float not null ,
    plt_paydate date not null ,
    plt_basecurr char(4) not null ,
    plt_origbase float not null ,
    plt_discbase float not null ,
    plt_currvar float not null ,
    plt_postdate date not null ,
    plt_conmethod char(1) not null ,
    plt_trunmeth char(1) not null ,
    plt_trunfac float not null ,
    plt_constant char(10) not null ,
    plt_paymethod char(1) not null ,
    plt_revcurr float not null ,
    plt_gldate date not null ,
    plt_comment char(56) not null ,
    plt_boepayee char(10) not null ,
    plt_docref char(8) not null ,
    plt_remcode integer not null ,
    plt_twindisc float not null ,
    plt_twinpay float not null ,
    plt_twintax float not null ,
    plt_twinval float not null 
  );
revoke all on "maxmast".pltran from "public";

create index "maxmast".plt_batkey on "maxmast".pltran (plt_batch,
    plt_supplier,plt_trandate,plt_ourref);
create unique index "maxmast".plt_seq on "maxmast".pltran (plt_seq);
    
create unique index "maxmast".plt_mainkey on "maxmast".pltran 
    (plt_ourref,plt_seq);
create unique index "maxmast".plt_suppkey on "maxmast".pltran 
    (plt_supplier,plt_trandate,plt_ourref,plt_type,plt_seq);
create unique index "maxmast".plt_ckey on "maxmast".pltran (plt_currency,
    plt_supplier,plt_trandate,plt_ourref,plt_type,plt_seq);
create unique index "maxmast".plt_tkey9 on "maxmast".pltran (plt_batch,
    plt_currency,plt_supplier,plt_trandate,plt_seq);
create unique index "maxmast".plt_extkey on "maxmast".pltran (plt_extref,
    plt_supplier,plt_seq);
create unique index "maxmast".plt_tkey8 on "maxmast".pltran (plt_supplier,
    plt_ourref,plt_trandate,plt_seq);
create index "maxmast".plt_xtranext on "maxmast".pltran (plt_xref,
    plt_trandate,plt_extref);
create unique index "maxmast".plt_allockey on "maxmast".pltran 
    (plt_supplier,plt_duedate,plt_seq);
create index "maxmast".plt_cclink on "maxmast".pltran (plt_cclink);
    
create unique index "maxmast".plt_skey on "maxmast".pltran (plt_supplier,
    plt_currency,plt_trandate,plt_ourref,plt_type,plt_seq);
create unique index "maxmast".plt_sypckey on "maxmast".pltran 
    (plt_supplier,plt_year,plt_period,plt_currency,plt_seq);
create unique index "maxmast".plt_yspkey on "maxmast".pltran (plt_year,
    plt_supplier,plt_period,plt_seq);
{ TABLE "maxmast".pltrig row size = 157 number of columns = 27 index size = 427 }
{ unload file name = pltri00614.unl number of rows = 10245 }

create table "maxmast".pltrig 
  (
    pltri_supplier char(10) not null ,
    pltri_trandate date not null ,
    pltri_ourref char(8) not null ,
    pltri_extref char(30) not null ,
    pltri_type char(1) not null ,
    pltri_status char(1) not null ,
    pltri_duedate date not null ,
    pltri_discvalue float not null ,
    pltri_payvalue float not null ,
    pltri_credwith char(1) not null ,
    pltri_priority integer not null ,
    pltri_seq integer not null ,
    pltri_batch char(6) not null ,
    pltri_acctref char(10) not null ,
    pltri_transtat char(1) not null ,
    pltri_control char(3) not null ,
    pltri_baseval float not null ,
    pltri_paydate date not null ,
    pltri_headflag char(1) not null ,
    pltri_autototal char(1) not null ,
    pltri_glaccount char(15) not null ,
    pltri_glvalue float not null ,
    pltri_paymethod char(1) not null ,
    pltri_currency char(4) not null ,
    pltri_bkdocreq char(1) not null ,
    pltri_remit char(1) not null ,
    pltri_payee char(10) not null 
  );
revoke all on "maxmast".pltrig from "public";

create index "maxmast".pltri_ourref on "maxmast".pltrig (pltri_ourref);
    
create unique index "maxmast".pltri_allockey on "maxmast".pltrig 
    (pltri_batch,pltri_credwith,pltri_priority,pltri_supplier,
    pltri_duedate,pltri_ourref,pltri_seq);
create unique index "maxmast".pltri_suppkey on "maxmast".pltrig 
    (pltri_batch,pltri_supplier,pltri_currency,pltri_trandate,
    pltri_ourref,pltri_type,pltri_seq);
create index "maxmast".pltri_batch on "maxmast".pltrig (pltri_batch);
    
create unique index "maxmast".pltri_paykey on "maxmast".pltrig 
    (pltri_supplier,pltri_batch,pltri_currency,pltri_payee,pltri_ourref,
    pltri_seq);
create unique index "maxmast".pltri_cvkey on "maxmast".pltrig 
    (pltri_batch,pltri_supplier,pltri_type,pltri_status,pltri_currency,
    pltri_ourref,pltri_seq);
create unique index "maxmast".pltri_key1 on "maxmast".pltrig (pltri_batch,
    pltri_supplier,pltri_currency,pltri_payee,pltri_paymethod,
    pltri_trandate,pltri_ourref,pltri_seq);
create unique index "maxmast".pltri_key2 on "maxmast".pltrig (pltri_batch,
    pltri_currency,pltri_supplier,pltri_payee,pltri_ourref,pltri_seq);
    
{ TABLE "maxmast".prall row size = 145 number of columns = 18 index size = 118 }
{ unload file name = prall00615.unl number of rows = 0 }

create table "maxmast".prall 
  (
    prall_ourref char(8) not null ,
    prall_line integer not null ,
    prall_grn char(10) not null ,
    prall_element char(5) not null ,
    prall_allocval float not null ,
    prall_item char(15) not null ,
    prall_grndate date not null ,
    prall_shipment char(17) not null ,
    prall_gllink char(15) not null ,
    prall_saved char(1) not null ,
    prall_lud date not null ,
    prall_lui char(10) not null ,
    prall_serial serial not null ,
    prall_scrnalloc float not null ,
    prall_invvalbas float not null ,
    prall_purvalbas float not null ,
    prall_mrvbase float not null ,
    prall_mrcbase float not null 
  );
revoke all on "maxmast".prall from "public";

create unique index "maxmast".prall_invkey on "maxmast".prall 
    (prall_ourref,prall_line,prall_serial);
create unique index "maxmast".prall_grnkey on "maxmast".prall 
    (prall_grn,prall_element,prall_serial);
create unique index "maxmast".prall_glkey on "maxmast".prall (prall_gllink,
    prall_saved,prall_ourref,prall_line,prall_serial);
{ TABLE "maxmast".prhed row size = 474 number of columns = 48 index size = 303 }
{ unload file name = prhed00616.unl number of rows = 18416 }

create table "maxmast".prhed 
  (
    prhed_ourref char(8) not null ,
    prhed_supplier char(10) not null ,
    prhed_trandate date not null ,
    prhed_type char(1) not null ,
    prhed_pstatus char(1) not null ,
    prhed_printflag char(1) not null ,
    prhed_extref char(30) not null ,
    prhed_batch char(6) not null ,
    prhed_auth char(1) not null ,
    prhed_value float not null ,
    prhed_discvalue float not null ,
    prhed_disc float not null ,
    prhed_taxvalue float not null ,
    prhed_terms char(10) not null ,
    prhed_duedate date not null ,
    prhed_lud date not null ,
    prhed_lui char(10) not null ,
    prhed_authdate date not null ,
    prhed_ref1 char(15) not null ,
    prhed_ref2 char(15) not null ,
    prhed_ref3 char(15) not null ,
    prhed_text1 char(56) not null ,
    prhed_text2 char(56) not null ,
    prhed_country char(5) not null ,
    prhed_batchprt char(1) not null ,
    prhed_authid char(10) not null ,
    prhed_currency char(4) not null ,
    prhed_currrate float not null ,
    prhed_currref char(10) not null ,
    prhed_postbatch char(6) not null ,
    prhed_twinrate float not null ,
    prhed_currstat integer not null ,
    prhed_payee char(10) not null ,
    prhed_basecurr char(4) not null ,
    prhed_esource char(40) not null ,
    prhed_conmethod char(1) not null ,
    prhed_trunmeth char(1) not null ,
    prhed_trunfac float not null ,
    prhed_constant char(10) not null ,
    prhed_paymethod char(1) not null ,
    prhed_taxdate date not null ,
    prhed_gldate date not null ,
    prhed_dittxstat char(10) not null ,
    prhed_taxincl char(1) not null ,
    prhed_boepayee char(10) not null ,
    prhed_docref char(8) not null ,
    prhed_user1 char(15) not null ,
    prhed_user2 float not null 
  );
revoke all on "maxmast".prhed from "public";

create unique index "maxmast".prhed_ourref on "maxmast".prhed 
    (prhed_ourref);
create index "maxmast".prhed_dockey on "maxmast".prhed (prhed_supplier,
    prhed_extref);
create unique index "maxmast".prhed_key1 on "maxmast".prhed (prhed_supplier,
    prhed_trandate,prhed_extref,prhed_ourref);
create unique index "maxmast".prhed_key2 on "maxmast".prhed (prhed_batch,
    prhed_trandate,prhed_ourref);
create unique index "maxmast".prhed_extkey on "maxmast".prhed 
    (prhed_extref,prhed_supplier,prhed_ourref);
create unique index "maxmast".prhed_key3 on "maxmast".prhed (prhed_trandate,
    prhed_ourref);
{ TABLE "maxmast".prlin row size = 366 number of columns = 32 index size = 153 }
{ unload file name = prlin00617.unl number of rows = 92091 }

create table "maxmast".prlin 
  (
    prlin_ourref char(8) not null ,
    prlin_line integer not null ,
    prlin_type char(1) not null ,
    prlin_transdate date not null ,
    prlin_account char(15) not null ,
    prlin_grn char(10) not null ,
    prlin_value float not null ,
    prlin_lud date not null ,
    prlin_lui char(10) not null ,
    prlin_ref1 char(15) not null ,
    prlin_ref2 char(15) not null ,
    prlin_ref3 char(15) not null ,
    prlin_text1 char(56) not null ,
    prlin_text2 char(56) not null ,
    prlin_orderno char(10) not null ,
    prlin_delnote char(15) not null ,
    prlin_auth char(1) not null ,
    prlin_retstock char(1) not null ,
    prlin_startdate date not null ,
    prlin_enddate date not null ,
    prlin_costcen char(6) not null ,
    prlin_costord char(15) not null ,
    prlin_clctype char(5) not null ,
    prlin_clusr1 char(5) not null ,
    prlin_clusr2 char(15) not null ,
    prlin_iaccount char(15) not null ,
    prlin_element char(5) not null ,
    prlin_tallocval float not null ,
    prlin_inproc char(10) not null ,
    prlin_itaxstat char(10) not null ,
    prlin_gross float not null ,
    prlin_invvalbas float not null 
  );
revoke all on "maxmast".prlin from "public";

create index "maxmast".prlin_grn on "maxmast".prlin (prlin_grn);
    
create unique index "maxmast".prlin_primekey on "maxmast".prlin 
    (prlin_ourref,prlin_line);
create unique index "maxmast".prlin_grnkey on "maxmast".prlin 
    (prlin_grn,prlin_ourref,prlin_line);
create unique index "maxmast".prlin_ordkey on "maxmast".prlin 
    (prlin_ourref,prlin_orderno,prlin_line);
create index "maxmast".prlin_delkey on "maxmast".prlin (prlin_delnote,
    prlin_type);
{ TABLE "maxmast".prpara row size = 136 number of columns = 17 index size = 7 }
{ unload file name = prpar00618.unl number of rows = 1 }

create table "maxmast".prpara 
  (
    prpar_key char(1) not null ,
    prpar_automatch char(1) not null ,
    prpar_pvarperc float not null ,
    prpar_pvarmax float not null ,
    prpar_saccount char(15) not null ,
    prpar_uaccount char(15) not null ,
    prpar_caccount char(15) not null ,
    prpar_aaccount char(15) not null ,
    prpar_paccount char(15) not null ,
    prpar_maxcarr float not null ,
    prpar_invregmat char(15) not null ,
    prpar_conscc char(1) not null ,
    prpar_constax char(1) not null ,
    prpar_prbatch char(1) not null ,
    prpar_susptax char(1) not null ,
    prpar_postunmt char(1) not null ,
    prpar_iaccount char(15) not null 
  );
revoke all on "maxmast".prpara from "public";

create unique index "maxmast".prpar_key on "maxmast".prpara (prpar_key);
    
{ TABLE "maxmast".pucst row size = 85 number of columns = 12 index size = 172 }
{ unload file name = pucst00620.unl number of rows = 0 }

create table "maxmast".pucst 
  (
    pucst_grn char(10) not null ,
    pucst_element char(5) not null ,
    pucst_item char(15) not null ,
    pucst_costvalue float not null ,
    pucst_reconflg char(1) not null ,
    pucst_gllink char(15) not null ,
    pucst_lud date not null ,
    pucst_lui char(10) not null ,
    pucst_tick char(1) not null ,
    pucst_tallocval float not null ,
    pucst_neggrndat integer not null ,
    pucst_neggrntim integer not null 
  );
revoke all on "maxmast".pucst from "public";

create unique index "maxmast".pucst_key on "maxmast".pucst (pucst_grn,
    pucst_element);
create unique index "maxmast".pucst_revkey on "maxmast".pucst 
    (pucst_element,pucst_grn);
create unique index "maxmast".pucst_glkey on "maxmast".pucst (pucst_gllink,
    pucst_reconflg,pucst_grn,pucst_element);
create unique index "maxmast".pucst_negkey on "maxmast".pucst 
    (pucst_item,pucst_element,pucst_neggrndat,pucst_neggrntim,
    pucst_grn);
{ TABLE "maxmast".pugrn row size = 451 number of columns = 46 index size = 333 }
{ unload file name = pugrn00621.unl number of rows = 71783 }

create table "maxmast".pugrn 
  (
    pugrn_grn char(10) not null ,
    pugrn_orderno char(10) not null ,
    pugrn_ordline integer not null ,
    pugrn_release integer not null ,
    pugrn_delnote char(15) not null ,
    pugrn_grndate date not null ,
    pugrn_grntime char(6) not null ,
    pugrn_qtyinsp float not null ,
    pugrn_qtyrcvd float not null ,
    pugrn_qtyscrap float not null ,
    pugrn_remarks char(56) not null ,
    pugrn_lud date not null ,
    pugrn_lui char(10) not null ,
    pugrn_status char(1) not null ,
    pugrn_qtyreturn float not null ,
    pugrn_qtygood float not null ,
    pugrn_pricepaid float not null ,
    pugrn_retacct char(5) not null ,
    pugrn_grstore char(5) not null ,
    pugrn_gracct char(5) not null ,
    pugrn_stkgood float not null ,
    pugrn_stkreturn float not null ,
    pugrn_sremarks char(45) not null ,
    pugrn_cposted char(1) not null ,
    pugrn_contract char(15) not null ,
    pugrn_conlin integer not null ,
    pugrn_glrefrom char(15) not null ,
    pugrn_glrefto char(15) not null ,
    pugrn_glrefvar char(15) not null ,
    pugrn_qtysentbk float not null ,
    pugrn_qtyrework float not null ,
    pugrn_planner char(10) not null ,
    pugrn_soordnum char(8) not null ,
    pugrn_solinnum integer not null ,
    pugrn_volume float not null ,
    pugrn_weight float not null ,
    pugrn_matvalue float not null ,
    pugrn_shipment char(17) not null ,
    pugrn_toncstval float not null ,
    pugrn_item char(15) not null ,
    pugrn_neggrndat integer not null ,
    pugrn_neggrntim integer not null ,
    pugrn_purvalbas float not null ,
    pugrn_mgvbase float not null ,
    pugrn_mgcbase float not null ,
    pugrn_matchdate date not null 
  );
revoke all on "maxmast".pugrn from "public";

create unique index "maxmast".pugrn_grn on "maxmast".pugrn (pugrn_grn);
    
create unique index "maxmast".pugrn_ordkey on "maxmast".pugrn 
    (pugrn_orderno,pugrn_ordline,pugrn_release,pugrn_grn);
create index "maxmast".pugrn_linekey on "maxmast".pugrn (pugrn_orderno,
    pugrn_ordline);
create index "maxmast".pugrn_relkey on "maxmast".pugrn (pugrn_orderno,
    pugrn_ordline,pugrn_release);
create index "maxmast".pugrn_delkey on "maxmast".pugrn (pugrn_delnote,
    pugrn_grn);
create unique index "maxmast".pugrn_shipkey on "maxmast".pugrn 
    (pugrn_shipment,pugrn_grn);
create unique index "maxmast".pugrn_negkey on "maxmast".pugrn 
    (pugrn_item,pugrn_neggrndat,pugrn_neggrntim,pugrn_grn);
create unique index "maxmast".pugrn_itmdatkey on "maxmast".pugrn 
    (pugrn_item,pugrn_grndate,pugrn_grntime,pugrn_grn);
{ TABLE "maxmast".pulin row size = 401 number of columns = 50 index size = 415 }
{ unload file name = pulin00622.unl number of rows = 58783 }

create table "maxmast".pulin 
  (
    pulin_orderno char(10) not null ,
    pulin_ordline integer not null ,
    pulin_item char(15) not null ,
    pulin_supplier char(10) not null ,
    pulin_branch char(4) not null ,
    pulin_stocked char(1) not null ,
    pulin_desckey char(8) not null ,
    pulin_descext char(33) not null ,
    pulin_price float not null ,
    pulin_deluom char(5) not null ,
    pulin_scrappc float not null ,
    pulin_terms char(10) not null ,
    pulin_completed char(1) not null ,
    pulin_lastprice float not null ,
    pulin_lastpaid date not null ,
    pulin_lud date not null ,
    pulin_lui char(10) not null ,
    pulin_linecost float not null ,
    pulin_priceuom char(5) not null ,
    pulin_decimals integer not null ,
    pulin_status char(1) not null ,
    pulin_insppc float not null ,
    pulin_blanket char(1) not null ,
    pulin_suptime integer not null ,
    pulin_partno char(20) not null ,
    pulin_puaccount char(15) not null ,
    pulin_contract char(15) not null ,
    pulin_sdesckey char(8) not null ,
    pulin_sdescext char(33) not null ,
    pulin_valuelim float not null ,
    pulin_qtylim float not null ,
    pulin_datelim date not null ,
    pulin_country char(5) not null ,
    pulin_commodity char(8) not null ,
    pulin_weight float not null ,
    pulin_termcode char(10) not null ,
    pulin_type char(1) not null ,
    pulin_manfac char(5) not null ,
    pulin_routeid char(5) not null ,
    pulin_opno char(5) not null ,
    pulin_workcen char(5) not null ,
    pulin_drawno char(20) not null ,
    pulin_drawiss char(3) not null ,
    pulin_amendflg char(1) not null ,
    pulin_prodgrpcd char(6) not null ,
    pulin_soordnum char(8) not null ,
    pulin_solinnum integer not null ,
    pulin_socomplin integer not null ,
    pulin_lastqty float not null ,
    pulin_itaxstat char(10) not null 
  );
revoke all on "maxmast".pulin from "public";

create index "maxmast".pulin_orderno on "maxmast".pulin (pulin_orderno);
    
create unique index "maxmast".pulin_key on "maxmast".pulin (pulin_orderno,
    pulin_ordline);
create unique index "maxmast".pulin_itemkey on "maxmast".pulin 
    (pulin_item,pulin_supplier,pulin_branch,pulin_orderno,pulin_ordline);
    
create index "maxmast".pulin_desckey on "maxmast".pulin (pulin_desckey);
    
create index "maxmast".pulin_suppkey on "maxmast".pulin (pulin_supplier,
    pulin_branch,pulin_orderno,pulin_ordline);
create index "maxmast".pulin_sdesckey on "maxmast".pulin (pulin_sdesckey);
    
create unique index "maxmast".pulin_opkey on "maxmast".pulin (pulin_item,
    pulin_manfac,pulin_routeid,pulin_opno,pulin_supplier,pulin_branch,
    pulin_orderno,pulin_ordline);
create unique index "maxmast".pulin_supitkey on "maxmast".pulin 
    (pulin_supplier,pulin_item,pulin_branch,pulin_orderno,pulin_ordline);
    
create unique index "maxmast".pulin_orditkey on "maxmast".pulin 
    (pulin_orderno,pulin_item,pulin_ordline);
{ TABLE "maxmast".purel row size = 269 number of columns = 37 index size = 360 }
{ unload file name = purel00623.unl number of rows = 59254 }

create table "maxmast".purel 
  (
    purel_orderno char(10) not null ,
    purel_ordline integer not null ,
    purel_release integer not null ,
    purel_deldate date not null ,
    purel_delqty float not null ,
    purel_duedate date not null ,
    purel_dueqty float not null ,
    purel_revdate date not null ,
    purel_revqty float not null ,
    purel_qtyrcvd float not null ,
    purel_qtyscrap float not null ,
    purel_lud date not null ,
    purel_lui char(10) not null ,
    purel_qtygood float not null ,
    purel_qtyreturn float not null ,
    purel_qtyinsp float not null ,
    purel_completed char(1) not null ,
    purel_remarks char(10) not null ,
    purel_item char(15) not null ,
    purel_supplier char(10) not null ,
    purel_branch char(4) not null ,
    purel_stkreturn float not null ,
    purel_contract char(15) not null ,
    purel_conlin integer not null ,
    purel_mrpdate date not null ,
    purel_mrpqty float not null ,
    purel_satisfies char(10) not null ,
    purel_reqn char(1) not null ,
    purel_orddate date not null ,
    purel_edidate date not null ,
    purel_editime integer not null ,
    purel_worderno char(10) not null ,
    purel_amendflg char(1) not null ,
    purel_qtysentbk float not null ,
    purel_qtyrework float not null ,
    purel_shipment char(17) not null ,
    purel_user1 char(15) not null 
  );
revoke all on "maxmast".purel from "public";

create unique index "maxmast".purel_datekey on "maxmast".purel 
    (purel_item,purel_duedate,purel_orderno,purel_ordline,purel_release);
    
create index "maxmast".purel_lincomp on "maxmast".purel (purel_orderno,
    purel_ordline);
create unique index "maxmast".purel_imskey on "maxmast".purel 
    (purel_item,purel_supplier,purel_branch,purel_deldate,purel_orderno,
    purel_ordline,purel_release);
create unique index "maxmast".purel_key on "maxmast".purel (purel_orderno,
    purel_ordline,purel_release);
create unique index "maxmast".purel_revkey on "maxmast".purel 
    (purel_item,purel_revdate,purel_orderno,purel_ordline,purel_release);
    
create index "maxmast".purel_worderno on "maxmast".purel (purel_worderno);
    
create unique index "maxmast".purel_shipkey on "maxmast".purel 
    (purel_shipment,purel_supplier,purel_orderno,purel_ordline,
    purel_release);
{ TABLE "maxmast".pusup row size = 349 number of columns = 38 index size = 27 }
{ unload file name = pusup00624.unl number of rows = 427 }

create table "maxmast".pusup 
  (
    pusup_supplier char(10) not null ,
    pusup_branch char(4) not null ,
    pusup_ndcode char(10) not null ,
    pusup_currency char(4) not null ,
    pusup_contact char(15) not null ,
    pusup_status char(1) not null ,
    pusup_stage char(2) not null ,
    pusup_terms char(10) not null ,
    pusup_pustore char(5) not null ,
    pusup_puaccount char(5) not null ,
    pusup_puscrapst char(5) not null ,
    pusup_puscacct char(5) not null ,
    pusup_remarks char(56) not null ,
    pusup_lud date not null ,
    pusup_lui char(10) not null ,
    pusup_account char(10) not null ,
    pusup_lang char(4) not null ,
    pusup_delterms char(3) not null ,
    pusup_transport char(1) not null ,
    pusup_country char(5) not null ,
    pusup_edicode char(20) not null ,
    pusup_ouredi char(17) not null ,
    pusup_hcpo char(1) not null ,
    pusup_faxpo char(1) not null ,
    pusup_edipo char(1) not null ,
    pusup_ourcode char(20) not null ,
    pusup_engemail char(30) not null ,
    pusup_engmobile char(20) not null ,
    pusup_engpager char(20) not null ,
    pusup_engregion char(5) not null ,
    pusup_engisdn char(20) not null ,
    pusup_engtitle char(10) not null ,
    pusup_engvehicl char(10) not null ,
    pusup_engskills char(1) not null ,
    pusup_engdiary char(1) not null ,
    pusup_engnotepd char(1) not null ,
    pusup_engsupp char(1) not null ,
    pusup_taxincl char(1) not null 
  );
revoke all on "maxmast".pusup from "public";

create unique index "maxmast".pusup_key on "maxmast".pusup (pusup_supplier,
    pusup_branch);
{ TABLE "maxmast".rqmas row size = 569 number of columns = 57 index size = 357 }
{ unload file name = rqmas00625.unl number of rows = 0 }

create table "maxmast".rqmas 
  (
    rqmas_reqno char(10) not null ,
    rqmas_item char(15) not null ,
    rqmas_stocked char(1) not null ,
    rqmas_sysgen char(1) not null ,
    rqmas_reordmeth char(1) not null ,
    rqmas_manfac char(5) not null ,
    rqmas_makebuy char(1) not null ,
    rqmas_dndcode char(10) not null ,
    rqmas_pcontrlr char(3) not null ,
    rqmas_rqtserial integer not null ,
    rqmas_orderno char(10) not null ,
    rqmas_ordline integer not null ,
    rqmas_release integer not null ,
    rqmas_supstore char(5) not null ,
    rqmas_tostore char(5) not null ,
    rqmas_toaccount char(5) not null ,
    rqmas_contract char(15) not null ,
    rqmas_conlin integer not null ,
    rqmas_requisite char(10) not null ,
    rqmas_authid char(10) not null ,
    rqmas_authdate date not null ,
    rqmas_rejectid char(10) not null ,
    rqmas_rejdate date not null ,
    rqmas_cancdate date not null ,
    rqmas_compdate date not null ,
    rqmas_partno char(40) not null ,
    rqmas_descext char(33) not null ,
    rqmas_desckey char(8) not null ,
    rqmas_supplier char(10) not null ,
    rqmas_branch char(4) not null ,
    rqmas_raisedate date not null ,
    rqmas_duedate date not null ,
    rqmas_issqty float not null ,
    rqmas_uom char(5) not null ,
    rqmas_price float not null ,
    rqmas_remarks char(56) not null ,
    rqmas_acomment char(30) not null ,
    rqmas_bcomment char(30) not null ,
    rqmas_ccomment char(30) not null ,
    rqmas_reason char(1) not null ,
    rqmas_glaccount char(15) not null ,
    rqmas_status char(1) not null ,
    rqmas_lud date not null ,
    rqmas_lui char(10) not null ,
    rqmas_seqno integer not null ,
    rqmas_reprint char(1) not null ,
    rqmas_printdate date not null ,
    rqmas_linecost float not null ,
    rqmas_decimals integer not null ,
    rqmas_emailer char(40) not null ,
    rqmas_dueqty float not null ,
    rqmas_currency char(4) not null ,
    rqmas_rqtype char(1) not null ,
    rqmas_clctype char(5) not null ,
    rqmas_glrefrom char(15) not null ,
    rqmas_glrefto char(15) not null ,
    rqmas_itaxstat char(10) not null 
  );
revoke all on "maxmast".rqmas from "public";

create unique index "maxmast".rqmas_reqno on "maxmast".rqmas (rqmas_reqno);
    
create index "maxmast".rqmas_rqtserial on "maxmast".rqmas (rqmas_rqtserial);
    
create unique index "maxmast".rqmas_key1 on "maxmast".rqmas (rqmas_orderno,
    rqmas_ordline,rqmas_release,rqmas_reqno);
create unique index "maxmast".rqmas_itmdatky on "maxmast".rqmas 
    (rqmas_item,rqmas_duedate,rqmas_reqno);
create unique index "maxmast".rqmas_key2 on "maxmast".rqmas (rqmas_status,
    rqmas_requisite,rqmas_duedate,rqmas_reqno);
create unique index "maxmast".rqmas_key3 on "maxmast".rqmas (rqmas_status,
    rqmas_duedate,rqmas_reqno);
create unique index "maxmast".rqmas_key4 on "maxmast".rqmas (rqmas_requisite,
    rqmas_duedate,rqmas_reqno);
create unique index "maxmast".rqmas_key5 on "maxmast".rqmas (rqmas_duedate,
    rqmas_reqno);
create unique index "maxmast".rqmas_key6 on "maxmast".rqmas (rqmas_status,
    rqmas_authid,rqmas_duedate,rqmas_reqno);
create unique index "maxmast".rqmas_key7 on "maxmast".rqmas (rqmas_authid,
    rqmas_duedate,rqmas_reqno);
{ TABLE "maxmast".rtcen row size = 130 number of columns = 20 index size = 21 }
{ unload file name = rtcen00626.unl number of rows = 74 }

create table "maxmast".rtcen 
  (
    rtcen_manfac char(5) not null ,
    rtcen_workcen char(5) not null ,
    rtcen_name char(25) not null ,
    rtcen_shortdesc char(15) not null ,
    rtcen_resid char(15) not null ,
    rtcen_resqty float not null ,
    rtcen_procunit char(1) not null ,
    rtcen_qtime float not null ,
    rtcen_qunit char(1) not null ,
    rtcen_qoverride char(1) not null ,
    rtcen_lud date not null ,
    rtcen_lui char(10) not null ,
    rtcen_supplier char(10) not null ,
    rtcen_branch char(4) not null ,
    rtcen_hourcal char(5) not null ,
    rtcen_crp char(1) not null ,
    rtcen_entrydate date not null ,
    rtcen_subcon char(1) not null ,
    rtcen_useetm char(1) not null ,
    rtcen_costcen char(6) not null 
  );
revoke all on "maxmast".rtcen from "public";

create unique index "maxmast".rtcen_key on "maxmast".rtcen (rtcen_manfac,
    rtcen_workcen);
{ TABLE "maxmast".slarc row size = 512 number of columns = 71 index size = 525 }
{ unload file name = slarc00627.unl number of rows = 35610 }

create table "maxmast".slarc 
  (
    slarc_tranno float not null ,
    slarc_batchno integer not null ,
    slarc_itemno integer not null ,
    slarc_custcode char(10) not null ,
    slarc_trtype char(1) not null ,
    slarc_intref char(8) not null ,
    slarc_extref char(30) not null ,
    slarc_link char(8) not null ,
    slarc_comment char(56) not null ,
    slarc_sourcecd char(1) not null ,
    slarc_amount float not null ,
    slarc_crdbind char(1) not null ,
    slarc_discamt float not null ,
    slarc_discgiv float not null ,
    slarc_osamount float not null ,
    slarc_futpaid float not null ,
    slarc_termscode char(2) not null ,
    slarc_currcode char(4) not null ,
    slarc_currrate float not null ,
    slarc_transdate date not null ,
    slarc_trstatus char(1) not null ,
    slarc_prlistno integer not null ,
    slarc_frlistno integer not null ,
    slarc_stmntdt date not null ,
    slarc_userid char(10) not null ,
    slarc_lud date not null ,
    slarc_taxamount float not null ,
    slarc_prtflag char(1) not null ,
    slarc_baseval float not null ,
    slarc_revdate date not null ,
    slarc_revalno integer not null ,
    slarc_year integer not null ,
    slarc_period integer not null ,
    slarc_contract char(1) not null ,
    slarc_batchref char(15) not null ,
    slarc_acctref char(10) not null ,
    slarc_voucher char(8) not null ,
    slarc_country char(5) not null ,
    slarc_salesoff char(5) not null ,
    slarc_invmeth char(1) not null ,
    slarc_linkref char(15) not null ,
    slarc_batch char(6) not null ,
    slarc_duedate date not null ,
    slarc_duedtechg char(1) not null ,
    slarc_pendate date not null ,
    slarc_penref char(15) not null ,
    slarc_severity char(4) not null ,
    slarc_follodate date not null ,
    slarc_follorun char(15) not null ,
    slarc_batchprt char(1) not null ,
    slarc_pfpayref char(8) not null ,
    slarc_twinval float not null ,
    slarc_ostwinval float not null ,
    slarc_twinrate float not null ,
    slarc_currstat integer not null ,
    slarc_invcust char(10) not null ,
    slarc_origcust char(10) not null ,
    slarc_delkgiv float not null ,
    slarc_taxadj float not null ,
    slarc_basecurr char(4) not null ,
    slarc_originv char(8) not null ,
    slarc_origbase float not null ,
    slarc_discbase float not null ,
    slarc_currvar float not null ,
    slarc_postdate date not null ,
    slarc_conmethod char(1) not null ,
    slarc_trunmeth char(1) not null ,
    slarc_trunfac float not null ,
    slarc_revcurr float not null ,
    slarc_gldate date not null ,
    slarc_followrun char(15) not null 
  );
revoke all on "maxmast".slarc from "public";

create unique index "maxmast".slarc_tranno on "maxmast".slarc 
    (slarc_tranno);
create index "maxmast".slarc_tkey4 on "maxmast".slarc (slarc_custcode,
    slarc_link,slarc_intref);
create unique index "maxmast".slarc_tkey7 on "maxmast".slarc (slarc_custcode,
    slarc_link,slarc_transdate,slarc_tranno);
create unique index "maxmast".slarc_tkey5 on "maxmast".slarc (slarc_custcode,
    slarc_transdate,slarc_tranno);
create unique index "maxmast".slarc_tkey8 on "maxmast".slarc (slarc_custcode,
    slarc_intref,slarc_transdate,slarc_tranno);
create unique index "maxmast".slarc_tkey9 on "maxmast".slarc (slarc_batch,
    slarc_currcode,slarc_custcode,slarc_transdate,slarc_tranno);
    
create unique index "maxmast".slarc_intkey on "maxmast".slarc 
    (slarc_intref,slarc_link,slarc_tranno);
create unique index "maxmast".slarc_extkey on "maxmast".slarc 
    (slarc_extref,slarc_tranno);
create unique index "maxmast".slarc_pridockey on "maxmast".slarc 
    (slarc_custcode,slarc_transdate,slarc_link,slarc_intref);
    
create unique index "maxmast".slarc_childkey on "maxmast".slarc 
    (slarc_custcode,slarc_origcust,slarc_transdate,slarc_link,
    slarc_intref);
create unique index "maxmast".slarc_ycpkey on "maxmast".slarc 
    (slarc_year,slarc_custcode,slarc_period,slarc_tranno);
{ TABLE "maxmast".slcum row size = 110 number of columns = 10 index size = 30 }
{ unload file name = slcum00628.unl number of rows = 5 }

create table "maxmast".slcum 
  (
    slcum_branch char(2) not null ,
    slcum_currency char(4) not null ,
    slcum_slcontrol char(15) not null ,
    slcum_slrevvar char(15) not null ,
    slcum_lui char(10) not null ,
    slcum_lud date not null ,
    slcum_slcurvar char(15) not null ,
    slcum_slpfcntrl char(15) not null ,
    slcum_slcu2var char(15) not null ,
    slcum_slre2var char(15) not null 
  );
revoke all on "maxmast".slcum from "public";

create unique index "maxmast".slcum_key on "maxmast".slcum (slcum_branch,
    slcum_currency);
create unique index "maxmast".slcum_key1 on "maxmast".slcum (slcum_currency,
    slcum_branch);
{ TABLE "maxmast".slcust row size = 289 number of columns = 52 index size = 169 }
{ unload file name = slcus00629.unl number of rows = 113 }

create table "maxmast".slcust 
  (
    slm_custcode char(10) not null ,
    slm_invacode char(10) not null ,
    slm_stmacode char(10) not null ,
    slm_consflg char(1) not null ,
    slm_ptflag char(1) not null ,
    slm_nadcode char(10) not null ,
    slm_shortname char(10) not null ,
    slm_postcode char(10) not null ,
    slm_currcode char(4) not null ,
    slm_branch char(2) not null ,
    slm_cexrate float not null ,
    slm_crchkmeth char(1) not null ,
    slm_crchkbal float not null ,
    slm_crlimit float not null ,
    slm_credstop char(1) not null ,
    slm_credlflg char(1) not null ,
    slm_credtflg integer not null ,
    slm_payhist char(1) not null ,
    slm_invlimit float not null ,
    slm_slsperson char(10) not null ,
    slm_geogarea char(5) not null ,
    slm_custtype char(3) not null ,
    slm_termscode char(2) not null ,
    slm_agecode char(1) not null ,
    slm_stmntreqd char(1) not null ,
    slm_minstmval float not null ,
    slm_summreqd char(1) not null ,
    slm_opendt date not null ,
    slm_lsaledt date not null ,
    slm_lpaydt date not null ,
    slm_lupdate date not null ,
    slm_updid char(10) not null ,
    slm_lang char(4) not null ,
    slm_custvat char(15) not null ,
    slm_nocrednts integer not null ,
    slm_noinvpnts integer not null ,
    slm_country char(5) not null ,
    slm_penrate float not null ,
    slm_pentaxcd char(1) not null ,
    slm_penacct char(15) not null ,
    slm_pendays integer not null ,
    slm_inproc char(10) not null ,
    slm_ostwinval float not null ,
    slm_twinreqd char(1) not null ,
    slm_boebal float not null ,
    slm_boepayee char(10) not null ,
    slm_twincurr char(4) not null ,
    slm_ctaxstat char(10) not null ,
    slm_dittxstat char(10) not null ,
    slm_conmethod char(1) not null ,
    slm_taxstatus char(1) not null ,
    slm_vatcode char(1) not null 
  );
revoke all on "maxmast".slcust from "public";

create unique index "maxmast".slm_custcode on "maxmast".slcust 
    (slm_custcode);
create index "maxmast".slm_nadcode on "maxmast".slcust (slm_nadcode);
    
create index "maxmast".slm_shortname on "maxmast".slcust (slm_shortname);
    
create index "maxmast".slm_postcode on "maxmast".slcust (slm_postcode);
    
create unique index "maxmast".slm_curragec on "maxmast".slcust 
    (slm_currcode,slm_agecode,slm_custcode);
create unique index "maxmast".slm_currbrch on "maxmast".slcust 
    (slm_currcode,slm_branch,slm_custcode);
create unique index "maxmast".slm_langkey on "maxmast".slcust 
    (slm_lang,slm_custcode);
{ TABLE "maxmast".slcva row size = 35 number of columns = 7 index size = 24 }
{ unload file name = slcva00630.unl number of rows = 0 }

create table "maxmast".slcva 
  (
    slcva_currency char(4) not null ,
    slcva_currrate float not null ,
    slcva_password integer not null ,
    slcva_revdate date not null ,
    slcva_lud date not null ,
    slcva_lui char(10) not null ,
    slcva_conmethod char(1) not null 
  );
revoke all on "maxmast".slcva from "public";

create unique index "maxmast".slcva_key on "maxmast".slcva (slcva_currency,
    slcva_currrate);
{ TABLE "maxmast".slopn row size = 34 number of columns = 5 index size = 33 }
{ unload file name = slopn00631.unl number of rows = 250 }

create table "maxmast".slopn 
  (
    slopn_custcode char(10) not null ,
    slopn_year integer not null ,
    slopn_currency char(4) not null ,
    slopn_opcurbal float not null ,
    slopn_opbasbal float not null 
  );
revoke all on "maxmast".slopn from "public";

create unique index "maxmast".slopn_key on "maxmast".slopn (slopn_custcode,
    slopn_year,slopn_currency);
{ TABLE "maxmast".sloptn row size = 121 number of columns = 37 index size = 7 }
{ unload file name = slopt00632.unl number of rows = 1 }

create table "maxmast".sloptn 
  (
    slo_cctype char(1) not null ,
    slo_cclen integer not null ,
    slo_slarch char(1) not null ,
    slo_slprbatch char(1) not null ,
    slo_sareqd char(1) not null ,
    slo_analdisp char(1) not null ,
    slo_dlineent char(1) not null ,
    slo_crchkfreq char(1) not null ,
    slo_crchkmeth char(1) not null ,
    slo_payhist char(1) not null ,
    slo_invlimit float not null ,
    slo_dispinv char(1) not null ,
    slo_slbatch char(1) not null ,
    slo_summreqd char(1) not null ,
    slo_slcyear integer not null ,
    slo_slcperd integer not null ,
    slo_slprno integer not null ,
    slo_sltrno float not null ,
    slo_slbtno integer not null ,
    slo_lui char(10) not null ,
    slo_lud date not null ,
    slo_prgprt char(1) not null ,
    slo_openbalac char(15) not null ,
    slo_wrtoffac char(15) not null ,
    slo_revalno integer not null ,
    slo_slbkint char(1) not null ,
    slo_prefix char(4) not null ,
    slo_voucher integer not null ,
    slo_intprefix char(4) not null ,
    slo_intref integer not null ,
    slo_sa60run char(1) not null ,
    slo_sdiscinc char(1) not null ,
    slo_unalloc char(1) not null ,
    slo_pdccrdchk char(1) not null ,
    slo_susptax char(1) not null ,
    slo_revtaxdt char(1) not null ,
    slo_gldtupd char(1) not null 
  );
revoke all on "maxmast".sloptn from "public";

create unique index "maxmast".slo_cctype on "maxmast".sloptn (slo_cctype);
    
{ TABLE "maxmast".slrnd row size = 23 number of columns = 4 index size = 27 }
{ unload file name = slrnd00633.unl number of rows = 0 }

create table "maxmast".slrnd 
  (
    slrnd_custcode char(10) not null ,
    slrnd_currency char(4) not null ,
    slrnd_trunmeth char(1) not null ,
    slrnd_trunfac float not null 
  );
revoke all on "maxmast".slrnd from "public";

create unique index "maxmast".slrnd_key on "maxmast".slrnd (slrnd_custcode,
    slrnd_currency);
{ TABLE "maxmast".slstat row size = 100 number of columns = 14 index size = 72 }
{ unload file name = slsta00634.unl number of rows = 4188 }

create table "maxmast".slstat 
  (
    sls_custcode char(10) not null ,
    sls_year integer not null ,
    sls_period integer not null ,
    sls_currcode char(4) not null ,
    sls_salestot float not null ,
    sls_recpttot float not null ,
    sls_lui char(10) not null ,
    sls_lud date not null ,
    sls_openbal float not null ,
    sls_adjtot float not null ,
    sls_totcurdb float not null ,
    sls_totcurcr float not null ,
    sls_totbasdb float not null ,
    sls_totbascr float not null 
  );
revoke all on "maxmast".slstat from "public";

create index "maxmast".sls_skey on "maxmast".slstat (sls_custcode,
    sls_year,sls_period);
create unique index "maxmast".sls_ckey on "maxmast".slstat (sls_custcode,
    sls_year,sls_period,sls_currcode);
{ TABLE "maxmast".slterm row size = 174 number of columns = 28 index size = 9 }
{ unload file name = slter00635.unl number of rows = 5 }

create table "maxmast".slterm 
  (
    sld_termscode char(2) not null ,
    sld_tcdesc char(40) not null ,
    sld_baseflg char(1) not null ,
    sld_dueday integer not null ,
    sld_duemon integer not null ,
    sld_month1 integer not null ,
    sld_drate1 float not null ,
    sld_damt1 float not null ,
    sld_month2 integer not null ,
    sld_drate2 float not null ,
    sld_damt2 float not null ,
    sld_month3 integer not null ,
    sld_drate3 float not null ,
    sld_damt3 float not null ,
    sld_lui char(10) not null ,
    sld_lud date not null ,
    sld_delkperc float not null ,
    sld_delkvatin char(1) not null ,
    sld_adddays integer not null ,
    sld_adddays1 integer not null ,
    sld_dueday1 integer not null ,
    sld_adddays2 integer not null ,
    sld_dueday2 integer not null ,
    sld_adddays3 integer not null ,
    sld_dueday3 integer not null ,
    sld_day1 integer not null ,
    sld_day2 integer not null ,
    sld_day3 integer not null 
  );
revoke all on "maxmast".slterm from "public";

create unique index "maxmast".sld_termscode on "maxmast".slterm 
    (sld_termscode);
{ TABLE "maxmast".sltran row size = 592 number of columns = 80 index size = 765 }
{ unload file name = sltra00636.unl number of rows = 89 }

create table "maxmast".sltran 
  (
    slt_tranno float not null ,
    slt_batchno integer not null ,
    slt_itemno integer not null ,
    slt_custcode char(10) not null ,
    slt_trtype char(1) not null ,
    slt_intref char(8) not null ,
    slt_extref char(30) not null ,
    slt_link char(8) not null ,
    slt_comment char(56) not null ,
    slt_sourcecd char(1) not null ,
    slt_amount float not null ,
    slt_crdbind char(1) not null ,
    slt_discamt float not null ,
    slt_discgiv float not null ,
    slt_osamount float not null ,
    slt_futpaid float not null ,
    slt_termscode char(2) not null ,
    slt_currcode char(4) not null ,
    slt_currrate float not null ,
    slt_transdate date not null ,
    slt_trstatus char(1) not null ,
    slt_prlistno integer not null ,
    slt_frlistno integer not null ,
    slt_stmntdt date not null ,
    slt_userid char(10) not null ,
    slt_lud date not null ,
    slt_taxamount float not null ,
    slt_prtflag char(1) not null ,
    slt_baseval float not null ,
    slt_revdate date not null ,
    slt_revalno integer not null ,
    slt_year integer not null ,
    slt_period integer not null ,
    slt_contract char(1) not null ,
    slt_batchref char(15) not null ,
    slt_acctref char(10) not null ,
    slt_voucher char(8) not null ,
    slt_country char(5) not null ,
    slt_salesoff char(5) not null ,
    slt_invmeth char(1) not null ,
    slt_linkref char(15) not null ,
    slt_batch char(6) not null ,
    slt_duedate date not null ,
    slt_duedtechg char(1) not null ,
    slt_pendate date not null ,
    slt_penref char(15) not null ,
    slt_severity char(4) not null ,
    slt_follodate date not null ,
    slt_follorun char(15) not null ,
    slt_batchprt char(1) not null ,
    slt_pfpayref char(8) not null ,
    slt_twinval float not null ,
    slt_ostwinval float not null ,
    slt_twinrate float not null ,
    slt_currstat integer not null ,
    slt_invcust char(10) not null ,
    slt_origcust char(10) not null ,
    slt_delkgiv float not null ,
    slt_taxadj float not null ,
    slt_boepayee char(10) not null ,
    slt_ccauth char(10) not null ,
    slt_basecurr char(4) not null ,
    slt_originv char(8) not null ,
    slt_pdcgroup char(10) not null ,
    slt_bankid char(8) not null ,
    slt_origbase float not null ,
    slt_discbase float not null ,
    slt_currvar float not null ,
    slt_postdate date not null ,
    slt_conmethod char(1) not null ,
    slt_trunmeth char(1) not null ,
    slt_trunfac float not null ,
    slt_revcurr float not null ,
    slt_gldate date not null ,
    slt_user1 char(15) not null ,
    slt_user2 date not null ,
    slt_user3 char(15) not null ,
    slt_user4 char(4) not null ,
    slt_user5 date not null ,
    slt_user6 char(15) not null 
  );
revoke all on "maxmast".sltran from "public";

create unique index "maxmast".slt_tranno on "maxmast".sltran (slt_tranno);
    
create index "maxmast".slt_intref on "maxmast".sltran (slt_intref);
    
create index "maxmast".slt_extref on "maxmast".sltran (slt_extref);
    
create unique index "maxmast".slt_tkey4 on "maxmast".sltran (slt_custcode,
    slt_link,slt_intref);
create unique index "maxmast".slt_tkey5 on "maxmast".sltran (slt_custcode,
    slt_transdate,slt_tranno);
create unique index "maxmast".slt_tkey6 on "maxmast".sltran (slt_currcode,
    slt_custcode,slt_intref,slt_link);
create index "maxmast".slt_voucher on "maxmast".sltran (slt_voucher);
    
create unique index "maxmast".slt_tkey7 on "maxmast".sltran (slt_custcode,
    slt_link,slt_transdate,slt_tranno);
create unique index "maxmast".slt_tkey8 on "maxmast".sltran (slt_custcode,
    slt_intref,slt_transdate,slt_tranno);
create unique index "maxmast".slt_tkey9 on "maxmast".sltran (slt_batch,
    slt_currcode,slt_custcode,slt_transdate,slt_tranno);
create unique index "maxmast".slt_pridockey on "maxmast".sltran 
    (slt_custcode,slt_transdate,slt_link,slt_intref);
create unique index "maxmast".slt_childkey on "maxmast".sltran 
    (slt_custcode,slt_origcust,slt_transdate,slt_link,slt_intref);
    
create unique index "maxmast".slt_tkey10 on "maxmast".sltran (slt_custcode,
    slt_currcode,slt_link,slt_intref);
create unique index "maxmast".slt_pdckey on "maxmast".sltran (slt_trtype,
    slt_trstatus,slt_pdcgroup,slt_currcode,slt_bankid,slt_duedate,
    slt_extref,slt_tranno);
create unique index "maxmast".slt_cypckey on "maxmast".sltran 
    (slt_custcode,slt_year,slt_period,slt_currcode,slt_tranno);
    
create unique index "maxmast".slt_ycpkey on "maxmast".sltran (slt_year,
    slt_custcode,slt_period,slt_tranno);
{ TABLE "maxmast".smact row size = 23 number of columns = 2 index size = 10 }
{ unload file name = smact00637.unl number of rows = 0 }

create table "maxmast".smact 
  (
    smact_action char(3) not null ,
    smact_actdesc char(20) not null 
  );
revoke all on "maxmast".smact from "public";

create unique index "maxmast".smact_action on "maxmast".smact 
    (smact_action);
{ TABLE "maxmast".smchd row size = 199 number of columns = 35 index size = 57 }
{ unload file name = smchd00638.unl number of rows = 0 }

create table "maxmast".smchd 
  (
    smchd_contract char(10) not null ,
    smchd_account char(10) not null ,
    smchd_type char(1) not null ,
    smchd_status char(1) not null ,
    smchd_statusdat date not null ,
    smchd_startdate date not null ,
    smchd_renew integer not null ,
    smchd_renewdate date not null ,
    smchd_invinterv integer not null ,
    smchd_inveach integer not null ,
    smchd_invlabour char(1) not null ,
    smchd_invmatl char(1) not null ,
    smchd_invsubs char(1) not null ,
    smchd_invtravel char(1) not null ,
    smchd_exprev float not null ,
    smchd_profitctl integer not null ,
    smchd_exptravel float not null ,
    smchd_explabour float not null ,
    smchd_expmatl float not null ,
    smchd_expsubsis float not null ,
    smchd_prevproft float not null ,
    smchd_cumrev float not null ,
    smchd_suspensac char(15) not null ,
    smchd_wipacc char(15) not null ,
    smchd_acctinits char(3) not null ,
    smchd_cminits char(3) not null ,
    smchd_lud date not null ,
    smchd_lui char(10) not null ,
    smchd_invcall float not null ,
    smchd_calltime integer not null ,
    smchd_callunit char(1) not null ,
    smchd_nonstokpc integer not null ,
    smchd_actcost float not null ,
    smchd_acthrs float not null ,
    smchd_servchcod char(6) not null 
  );
revoke all on "maxmast".smchd from "public";

create unique index "maxmast".smchd_contract on "maxmast".smchd 
    (smchd_contract);
create unique index "maxmast".smchd_key on "maxmast".smchd (smchd_account,
    smchd_contract);
{ TABLE "maxmast".smcln row size = 350 number of columns = 33 index size = 310 }
{ unload file name = smcln00639.unl number of rows = 0 }

create table "maxmast".smcln 
  (
    smcln_contract char(10) not null ,
    smcln_lineno integer not null ,
    smcln_startdate date not null ,
    smcln_status char(1) not null ,
    smcln_unitno char(40) not null ,
    smcln_wbs char(15) not null ,
    smcln_floor char(1) not null ,
    smcln_payment float not null ,
    smcln_lastinv date not null ,
    smcln_enddate date not null ,
    smcln_serinter integer not null ,
    smcln_remarks char(65) not null ,
    smcln_actlabour float not null ,
    smcln_actmaterl float not null ,
    smcln_actsubsis float not null ,
    smcln_acttravel float not null ,
    smcln_lud date not null ,
    smcln_lui char(10) not null ,
    smcln_warperiod integer not null ,
    smcln_warsupp char(10) not null ,
    smcln_warbranch char(4) not null ,
    smcln_actcost float not null ,
    smcln_acthrs float not null ,
    smcln_source char(5) not null ,
    smcln_srceid1 char(40) not null ,
    smcln_srceid2 char(40) not null ,
    smcln_leadtime integer not null ,
    smcln_ltunits char(1) not null ,
    smcln_levtdate date not null ,
    smcln_group char(1) not null ,
    smcln_fixtime integer not null ,
    smcln_ftunits char(1) not null ,
    smcln_delpt char(10) not null 
  );
revoke all on "maxmast".smcln from "public";

create unique index "maxmast".smcln_key on "maxmast".smcln (smcln_contract,
    smcln_lineno);
create unique index "maxmast".smcln_custkey on "maxmast".smcln 
    (smcln_contract,smcln_unitno,smcln_wbs);
create unique index "maxmast".smcln_servkey on "maxmast".smcln 
    (smcln_contract,smcln_unitno,smcln_serinter,smcln_lineno);
    
create unique index "maxmast".smcln_unitkey on "maxmast".smcln 
    (smcln_unitno,smcln_contract,smcln_lineno);
{ TABLE "maxmast".smcnc row size = 86 number of columns = 7 index size = 18 }
{ unload file name = smcnc00640.unl number of rows = 0 }

create table "maxmast".smcnc 
  (
    smcnc_prefix char(15) not null ,
    smcnc_suffix char(15) not null ,
    smcnc_desc char(40) not null ,
    smcnc_certcomb char(8) not null ,
    smcnc_clockreg char(6) not null ,
    smcnc_status char(1) not null ,
    smcnc_suppress char(1) not null 
  );
revoke all on "maxmast".smcnc from "public";

create unique index "maxmast".smcnc_certcomb on "maxmast".smcnc 
    (smcnc_certcomb);
{ TABLE "maxmast".smcpt row size = 476 number of columns = 48 index size = 75 }
{ unload file name = smcpt00641.unl number of rows = 0 }

create table "maxmast".smcpt 
  (
    smcpt_ordnum char(8) not null ,
    smcpt_linnum integer not null ,
    smcpt_compline integer not null ,
    smcpt_item char(15) not null ,
    smcpt_quantity float not null ,
    smcpt_cost float not null ,
    smcpt_lud date not null ,
    smcpt_lui char(10) not null ,
    smcpt_price float not null ,
    smcpt_linetype char(1) not null ,
    smcpt_ndisp char(1) not null ,
    smcpt_nhide char(1) not null ,
    smcpt_ncert char(1) not null ,
    smcpt_nb2b char(1) not null ,
    smcpt_prodgroup char(6) not null ,
    smcpt_supplier char(10) not null ,
    smcpt_chargcode char(5) not null ,
    smcpt_desc1 char(50) not null ,
    smcpt_desc2 char(50) not null ,
    smcpt_pickqty float not null ,
    smcpt_picknote char(10) not null ,
    smcpt_pickdate date not null ,
    smcpt_stage char(2) not null ,
    smcpt_laststage char(2) not null ,
    smcpt_batchno char(8) not null ,
    smcpt_store char(5) not null ,
    smcpt_despdate date not null ,
    smcpt_orderno char(10) not null ,
    smcpt_ordline integer not null ,
    smcpt_prevprice float not null ,
    smcpt_allocqty float not null ,
    smcpt_location char(10) not null ,
    smcpt_locdet char(30) not null ,
    smcpt_tempid char(15) not null ,
    smcpt_tempiss char(6) not null ,
    smcpt_certcomb char(8) not null ,
    smcpt_maker char(10) not null ,
    smcpt_suppto char(10) not null ,
    smcpt_usedby char(10) not null ,
    smcpt_certdelpt char(10) not null ,
    smcpt_prefix char(15) not null ,
    smcpt_certnum char(8) not null ,
    smcpt_suffix char(15) not null ,
    smcpt_certtype char(1) not null ,
    smcpt_test char(1) not null ,
    smcpt_uniqueid integer not null ,
    smcpt_desc3 char(50) not null ,
    smcpt_spitemtyp char(5) not null 
  );
revoke all on "maxmast".smcpt from "public";

create unique index "maxmast".smcpt_key on "maxmast".smcpt (smcpt_ordnum,
    smcpt_linnum,smcpt_compline);
create unique index "maxmast".smcpt_key3 on "maxmast".smcpt (smcpt_picknote,
    smcpt_ordnum,smcpt_linnum,smcpt_compline);
{ TABLE "maxmast".smcrt row size = 302 number of columns = 33 index size = 462 }
{ unload file name = smcrt00642.unl number of rows = 0 }

create table "maxmast".smcrt 
  (
    smcrt_certcomb char(8) not null ,
    smcrt_account char(10) not null ,
    smcrt_rangeref char(8) not null ,
    smcrt_prefix char(15) not null ,
    smcrt_suffix char(15) not null ,
    smcrt_uniqueid integer not null ,
    smcrt_status char(1) not null ,
    smcrt_created date not null ,
    smcrt_replaced date not null ,
    smcrt_replacert integer not null ,
    smcrt_supplier char(10) not null ,
    smcrt_maker char(10) not null ,
    smcrt_mprserial integer not null ,
    smcrt_certdelpt char(10) not null ,
    smcrt_locpt char(10) not null ,
    smcrt_certnum char(8) not null ,
    smcrt_lud date not null ,
    smcrt_lui char(10) not null ,
    smcrt_lut char(5) not null ,
    smcrt_supplyto char(10) not null ,
    smcrt_usedby char(10) not null ,
    smcrt_search char(38) not null ,
    smcrt_curtest char(8) not null ,
    smcrt_locdet char(30) not null ,
    smcrt_contract char(10) not null ,
    smcrt_line integer not null ,
    smcrt_certtype char(1) not null ,
    smcrt_ordnum char(8) not null ,
    smcrt_linnum integer not null ,
    smcrt_wbs char(15) not null ,
    smcrt_curinsp integer not null ,
    smcrt_certsort char(8) not null ,
    smcrt_charid char(8) not null 
  );
revoke all on "maxmast".smcrt from "public";

create index "maxmast".smcrt_rangeref on "maxmast".smcrt (smcrt_rangeref);
    
create unique index "maxmast".smcrt_uniqueid on "maxmast".smcrt 
    (smcrt_uniqueid);
create unique index "maxmast".smcrt_key1 on "maxmast".smcrt (smcrt_account,
    smcrt_prefix,smcrt_suffix,smcrt_certnum);
create index "maxmast".smcrt_key2 on "maxmast".smcrt (smcrt_rangeref,
    smcrt_uniqueid);
create index "maxmast".smcrt_search on "maxmast".smcrt (smcrt_search);
    
create unique index "maxmast".smcrt_key3 on "maxmast".smcrt (smcrt_search,
    smcrt_uniqueid);
create unique index "maxmast".smcrt_key4 on "maxmast".smcrt (smcrt_curtest,
    smcrt_uniqueid);
create unique index "maxmast".smcrt_key5 on "maxmast".smcrt (smcrt_account,
    smcrt_search,smcrt_uniqueid);
create unique index "maxmast".smcrt_key6 on "maxmast".smcrt (smcrt_account,
    smcrt_locpt,smcrt_uniqueid);
create unique index "maxmast".smcrt_key7 on "maxmast".smcrt (smcrt_ordnum,
    smcrt_linnum,smcrt_uniqueid);
create index "maxmast".smcrt_charid on "maxmast".smcrt (smcrt_charid);
    
{ TABLE "maxmast".smcst row size = 322 number of columns = 23 index size = 487 }
{ unload file name = smcst00643.unl number of rows = 0 }

create table "maxmast".smcst 
  (
    smcst_transnum char(15) not null ,
    smcst_ordnum char(8) not null ,
    smcst_linnum integer not null ,
    smcst_compline integer not null ,
    smcst_aqty float not null ,
    smcst_engineer char(10) not null ,
    smcst_datework date not null ,
    smcst_lud date not null ,
    smcst_lui char(10) not null ,
    smcst_uom char(5) not null ,
    smcst_unitcost float not null ,
    smcst_contract char(10) not null ,
    smcst_lineno integer not null ,
    smcst_itemid char(40) not null ,
    smcst_customer char(10) not null ,
    smcst_desc1 char(50) not null ,
    smcst_desc2 char(50) not null ,
    smcst_desc3 char(50) not null ,
    smcst_linetype char(2) not null ,
    smcst_spitemtyp char(5) not null ,
    smcst_extcost float not null ,
    smcst_store char(5) not null ,
    smcst_arolprice float not null 
  );
revoke all on "maxmast".smcst from "public";

create unique index "maxmast".smcst_transnum on "maxmast".smcst 
    (smcst_transnum);
create unique index "maxmast".smcst_key on "maxmast".smcst (smcst_ordnum,
    smcst_linnum,smcst_compline,smcst_transnum);
create unique index "maxmast".smcst_key1 on "maxmast".smcst (smcst_itemid,
    smcst_datework,smcst_transnum);
create unique index "maxmast".smcst_key2 on "maxmast".smcst (smcst_customer,
    smcst_datework,smcst_transnum);
create unique index "maxmast".smcst_key3 on "maxmast".smcst (smcst_contract,
    smcst_datework,smcst_transnum);
create unique index "maxmast".smcst_key4 on "maxmast".smcst (smcst_contract,
    smcst_lineno,smcst_datework,smcst_transnum);
create unique index "maxmast".smcst_key5 on "maxmast".smcst (smcst_ordnum,
    smcst_datework,smcst_transnum);
create unique index "maxmast".smcst_key6 on "maxmast".smcst (smcst_ordnum,
    smcst_linnum,smcst_datework,smcst_transnum);
create unique index "maxmast".smcst_key7 on "maxmast".smcst (smcst_ordnum,
    smcst_linnum,smcst_compline,smcst_datework,smcst_transnum);
    
{ TABLE "maxmast".smdis row size = 60 number of columns = 2 index size = 132 }
{ unload file name = smdis00644.unl number of rows = 0 }

create table "maxmast".smdis 
  (
    smdis_distlist char(20) not null ,
    smdis_personnel char(40) not null 
  );
revoke all on "maxmast".smdis from "public";

create index "maxmast".smdis_distlist on "maxmast".smdis (smdis_distlist);
    
create unique index "maxmast".smdis_key on "maxmast".smdis (smdis_distlist,
    smdis_personnel);
{ TABLE "maxmast".smedy row size = 76 number of columns = 10 index size = 108 }
{ unload file name = smedy00645.unl number of rows = 0 }

create table "maxmast".smedy 
  (
    smedy_engineer char(10) not null ,
    smedy_sdate date not null ,
    smedy_edate date not null ,
    smedy_hours integer not null ,
    smedy_status char(1) not null ,
    smedy_ordnum char(8) not null ,
    smedy_serial serial not null ,
    smedy_comment char(20) not null ,
    smedy_engtype char(1) not null ,
    smedy_skill char(20) not null 
  );
revoke all on "maxmast".smedy from "public";

create index "maxmast".smedy_engineer on "maxmast".smedy (smedy_engineer);
    
create unique index "maxmast".smedy_serial on "maxmast".smedy 
    (smedy_serial);
create unique index "maxmast".smedy_key1 on "maxmast".smedy (smedy_ordnum,
    smedy_engineer,smedy_sdate,smedy_serial);
create unique index "maxmast".smedy_key2 on "maxmast".smedy (smedy_ordnum,
    smedy_sdate,smedy_serial);
{ TABLE "maxmast".smesk row size = 74 number of columns = 4 index size = 72 }
{ unload file name = smesk00646.unl number of rows = 0 }

create table "maxmast".smesk 
  (
    smesk_engineer char(10) not null ,
    smesk_skill char(20) not null ,
    smesk_level integer not null ,
    smesk_remarks char(40) not null 
  );
revoke all on "maxmast".smesk from "public";

create index "maxmast".smesk_engineer on "maxmast".smesk (smesk_engineer);
    
create unique index "maxmast".smesk_key on "maxmast".smesk (smesk_engineer,
    smesk_skill);
{ TABLE "maxmast".smety row size = 44 number of columns = 3 index size = 10 }
{ unload file name = smety00647.unl number of rows = 0 }

create table "maxmast".smety 
  (
    smety_evtype char(3) not null ,
    smety_evdesc char(40) not null ,
    smety_servord char(1) not null 
  );
revoke all on "maxmast".smety from "public";

create unique index "maxmast".smety_evtype on "maxmast".smety 
    (smety_evtype);
{ TABLE "maxmast".smfir row size = 237 number of columns = 13 index size = 297 }
{ unload file name = smfir00648.unl number of rows = 0 }

create table "maxmast".smfir 
  (
    smfir_ordnum char(8) not null ,
    smfir_linnum integer not null ,
    smfir_inspdate date not null ,
    smfir_uniqueid integer not null ,
    smfir_engineer char(10) not null ,
    smfir_result integer not null ,
    smfir_quote char(1) not null ,
    smfir_desc1 char(50) not null ,
    smfir_desc2 char(50) not null ,
    smfir_desc3 char(50) not null ,
    smfir_lud date not null ,
    smfir_lui char(10) not null ,
    smfir_search char(38) not null 
  );
revoke all on "maxmast".smfir from "public";

create unique index "maxmast".smfir_key on "maxmast".smfir (smfir_ordnum,
    smfir_linnum,smfir_uniqueid);
create index "maxmast".smfir_search on "maxmast".smfir (smfir_search);
    
create unique index "maxmast".smfir_searchkey on "maxmast".smfir 
    (smfir_ordnum,smfir_linnum,smfir_search,smfir_uniqueid);
create unique index "maxmast".smfir_key1 on "maxmast".smfir (smfir_search,
    smfir_uniqueid,smfir_ordnum,smfir_linnum);
create unique index "maxmast".smfir_key2 on "maxmast".smfir (smfir_uniqueid,
    smfir_ordnum,smfir_linnum);
{ TABLE "maxmast".smhdr row size = 494 number of columns = 45 index size = 81 }
{ unload file name = smhdr00649.unl number of rows = 0 }

create table "maxmast".smhdr 
  (
    smhdr_ordnum char(8) not null ,
    smhdr_ordsts char(1) not null ,
    smhdr_source char(1) not null ,
    smhdr_customer char(10) not null ,
    smhdr_delpt char(10) not null ,
    smhdr_ndcseq integer not null ,
    smhdr_ponum char(40) not null ,
    smhdr_esthrs float not null ,
    smhdr_acthrs float not null ,
    smhdr_lud date not null ,
    smhdr_lui char(10) not null ,
    smhdr_event char(8) not null ,
    smhdr_quote char(8) not null ,
    smhdr_duedate date not null ,
    smhdr_plandate date not null ,
    smhdr_compdate date not null ,
    smhdr_desc1 char(50) not null ,
    smhdr_desc2 char(50) not null ,
    smhdr_desc3 char(50) not null ,
    smhdr_contact char(30) not null ,
    smhdr_recdate date not null ,
    smhdr_entdate date not null ,
    smhdr_estvalue float not null ,
    smhdr_actvalue float not null ,
    smhdr_telephone char(20) not null ,
    smhdr_evtype char(3) not null ,
    smhdr_stage char(2) not null ,
    smhdr_action char(3) not null ,
    smhdr_priority char(1) not null ,
    smhdr_pulreport char(1) not null ,
    smhdr_ourref char(40) not null ,
    smhdr_eventdate date not null ,
    smhdr_store char(5) not null ,
    smhdr_ordtype char(1) not null ,
    smhdr_disccode char(2) not null ,
    smhdr_drate1 float not null ,
    smhdr_drate2 float not null ,
    smhdr_drate3 float not null ,
    smhdr_rollhrs float not null ,
    smhdr_rollcost float not null ,
    smhdr_planner char(10) not null ,
    smhdr_rollvalue float not null ,
    smhdr_actcost float not null ,
    smhdr_otycod char(5) not null ,
    smhdr_origcod char(5) not null 
  );
revoke all on "maxmast".smhdr from "public";

create unique index "maxmast".smhdr_ordnum on "maxmast".smhdr 
    (smhdr_ordnum);
create unique index "maxmast".smhdr_key1 on "maxmast".smhdr (smhdr_customer,
    smhdr_ordnum);
create unique index "maxmast".smhdr_key2 on "maxmast".smhdr (smhdr_event,
    smhdr_ordnum);
{ TABLE "maxmast".smilh row size = 91 number of columns = 11 index size = 51 }
{ unload file name = smilh00650.unl number of rows = 0 }

create table "maxmast".smilh 
  (
    smilh_batchno char(8) not null ,
    smilh_datcreate date not null ,
    smilh_owner char(10) not null ,
    smilh_status char(1) not null ,
    smilh_lud date not null ,
    smilh_lui char(10) not null ,
    smilh_doctype char(1) not null ,
    smilh_salesoff char(5) not null ,
    smilh_delroute char(10) not null ,
    smilh_desc char(30) not null ,
    smilh_batchvalu float not null 
  );
revoke all on "maxmast".smilh from "public";

create unique index "maxmast".smilh_batchno on "maxmast".smilh 
    (smilh_batchno);
create unique index "maxmast".smilh_key1 on "maxmast".smilh (smilh_owner,
    smilh_batchno);
{ TABLE "maxmast".smilp row size = 389 number of columns = 39 index size = 126 }
{ unload file name = smilp00651.unl number of rows = 0 }

create table "maxmast".smilp 
  (
    smilp_ordnum char(8) not null ,
    smilp_batchno char(8) not null ,
    smilp_linnum integer not null ,
    smilp_serial serial not null ,
    smilp_source char(1) not null ,
    smilp_linetype char(2) not null ,
    smilp_prodgrp char(6) not null ,
    smilp_account char(15) not null ,
    smilp_sellprice float not null ,
    smilp_cost float not null ,
    smilp_fpmark char(1) not null ,
    smilp_lud date not null ,
    smilp_lui char(10) not null ,
    smilp_invoice char(1) not null ,
    smilp_hide char(1) not null ,
    smilp_linevalue float not null ,
    smilp_quantity float not null ,
    smilp_structure char(1) not null ,
    smilp_mprserial integer not null ,
    smilp_decimals integer not null ,
    smilp_itemid char(40) not null ,
    smilp_compline integer not null ,
    smilp_groupline integer not null ,
    smilp_stage char(2) not null ,
    smilp_desc1 char(50) not null ,
    smilp_desc2 char(50) not null ,
    smilp_desc3 char(50) not null ,
    smilp_inoutjob char(1) not null ,
    smilp_linecost float not null ,
    smilp_aqty float not null ,
    smilp_arolprice float not null ,
    smilp_alineval float not null ,
    smilp_iqty float not null ,
    smilp_iselprice float not null ,
    smilp_ilineval float not null ,
    smilp_disccode char(2) not null ,
    smilp_drate1 float not null ,
    smilp_drate2 float not null ,
    smilp_drate3 float not null 
  );
revoke all on "maxmast".smilp from "public";

create unique index "maxmast".smilp_serial on "maxmast".smilp 
    (smilp_serial);
create unique index "maxmast".smilp_key on "maxmast".smilp (smilp_batchno,
    smilp_ordnum,smilp_linnum,smilp_compline,smilp_mprserial);
    
create index "maxmast".smilp_mprserial on "maxmast".smilp (smilp_mprserial);
    
create unique index "maxmast".smilp_key1 on "maxmast".smilp (smilp_batchno,
    smilp_ordnum,smilp_groupline,smilp_linnum,smilp_compline,
    smilp_mprserial);
{ TABLE "maxmast".smilt row size = 180 number of columns = 24 index size = 30 }
{ unload file name = smilt00652.unl number of rows = 0 }

create table "maxmast".smilt 
  (
    smilt_batchno char(8) not null ,
    smilt_customer char(10) not null ,
    smilt_source char(1) not null ,
    smilt_ordnum char(8) not null ,
    smilt_totinval float not null ,
    smilt_owner char(10) not null ,
    smilt_lud date not null ,
    smilt_lui char(10) not null ,
    smilt_status char(1) not null ,
    smilt_planval float not null ,
    smilt_actval float not null ,
    smilt_totincst float not null ,
    smilt_tottaxval float not null ,
    smilt_totplncst float not null ,
    smilt_totplnhrs float not null ,
    smilt_totmatval float not null ,
    smilt_totmatcst float not null ,
    smilt_tothrsval float not null ,
    smilt_tothrscst float not null ,
    smilt_totspival float not null ,
    smilt_totspicst float not null ,
    smilt_totactcst float not null ,
    smilt_totacthrs float not null ,
    smilt_totdisval float not null 
  );
revoke all on "maxmast".smilt from "public";

create unique index "maxmast".smilt_key on "maxmast".smilt (smilt_batchno,
    smilt_ordnum);
{ TABLE "maxmast".smlin row size = 908 number of columns = 99 index size = 312 }
{ unload file name = smlin00653.unl number of rows = 0 }

create table "maxmast".smlin 
  (
    smlin_ordnum char(8) not null ,
    smlin_linnum integer not null ,
    smlin_linetype char(2) not null ,
    smlin_itemser char(40) not null ,
    smlin_prodgrp char(6) not null ,
    smlin_structure char(1) not null ,
    smlin_account char(15) not null ,
    smlin_qty float not null ,
    smlin_uom char(5) not null ,
    smlin_sellprice float not null ,
    smlin_cost float not null ,
    smlin_fpmark char(1) not null ,
    smlin_lud date not null ,
    smlin_lui char(10) not null ,
    smlin_itemkey serial not null ,
    smlin_eventnum char(8) not null ,
    smlin_eventlin integer not null ,
    smlin_quote char(8) not null ,
    smlin_quotelin integer not null ,
    smlin_itemid char(40) not null ,
    smlin_prefix char(15) not null ,
    smlin_certnum char(8) not null ,
    smlin_suffix char(15) not null ,
    smlin_wbs char(15) not null ,
    smlin_desc1 char(50) not null ,
    smlin_desc2 char(50) not null ,
    smlin_desc3 char(50) not null ,
    smlin_priceuom char(5) not null ,
    smlin_disccode char(2) not null ,
    smlin_drate1 float not null ,
    smlin_drate2 float not null ,
    smlin_drate3 float not null ,
    smlin_location char(10) not null ,
    smlin_duedate date not null ,
    smlin_esthrs float not null ,
    smlin_insphoriz date not null ,
    smlin_insrepprt char(1) not null ,
    smlin_pulrepprt char(1) not null ,
    smlin_uniqueid integer not null ,
    smlin_chargcode char(5) not null ,
    smlin_uomfact float not null ,
    smlin_lastline integer not null ,
    smlin_workunit char(5) not null ,
    smlin_inoutjob char(1) not null ,
    smlin_groupline integer not null ,
    smlin_rollprice float not null ,
    smlin_pickqty float not null ,
    smlin_picknote char(10) not null ,
    smlin_piknoseq integer not null ,
    smlin_pickdate date not null ,
    smlin_orderno char(10) not null ,
    smlin_stage char(2) not null ,
    smlin_delnoteno char(10) not null ,
    smlin_laststage char(2) not null ,
    smlin_workld float not null ,
    smlin_certify char(1) not null ,
    smlin_repsreq char(1) not null ,
    smlin_rinput integer not null ,
    smlin_rprinted integer not null ,
    smlin_certprint char(1) not null ,
    smlin_ordline integer not null ,
    smlin_batchno char(8) not null ,
    smlin_invnote char(8) not null ,
    smlin_delpt char(10) not null ,
    smlin_certdelpt char(10) not null ,
    smlin_suppto char(10) not null ,
    smlin_certcomb char(8) not null ,
    smlin_tempid char(15) not null ,
    smlin_supplier char(10) not null ,
    smlin_maker char(10) not null ,
    smlin_locdet char(30) not null ,
    smlin_usedby char(10) not null ,
    smlin_tempiss char(6) not null ,
    smlin_test char(1) not null ,
    smlin_certtype char(1) not null ,
    smlin_batchnum char(15) not null ,
    smlin_store char(5) not null ,
    smlin_despdate date not null ,
    smlin_customer char(10) not null ,
    smlin_rollhrs float not null ,
    smlin_allocqty float not null ,
    smlin_rollcost float not null ,
    smlin_contract char(10) not null ,
    smlin_lineno integer not null ,
    smlin_groupsort integer not null ,
    smlin_arollcost float not null ,
    smlin_arollhrs float not null ,
    smlin_arolprice float not null ,
    smlin_aselprice float not null ,
    smlin_actcost float not null ,
    smlin_acthrs float not null ,
    smlin_compcost float not null ,
    smlin_pricemeth char(1) not null ,
    smlin_bompset char(1) not null ,
    smlin_printsort integer not null ,
    smlin_nhide char(1) not null ,
    smlin_mainchar char(40) not null ,
    smlin_secchar char(20) not null ,
    smlin_itaxstat char(10) not null 
  );
revoke all on "maxmast".smlin from "public";

create unique index "maxmast".smlin_key on "maxmast".smlin (smlin_ordnum,
    smlin_linnum);
create unique index "maxmast".smlin_key2 on "maxmast".smlin (smlin_ordnum,
    smlin_lastline,smlin_linnum);
create unique index "maxmast".smlin_key3 on "maxmast".smlin (smlin_picknote,
    smlin_ordnum,smlin_linnum);
create unique index "maxmast".smlin_key4 on "maxmast".smlin (smlin_stage,
    smlin_ordnum,smlin_linnum);
create unique index "maxmast".smlin_key6 on "maxmast".smlin (smlin_delnoteno,
    smlin_ordnum,smlin_linnum);
create unique index "maxmast".smlin_key7 on "maxmast".smlin (smlin_eventnum,
    smlin_eventlin,smlin_ordnum,smlin_linnum);
create unique index "maxmast".smlin_key8 on "maxmast".smlin (smlin_customer,
    smlin_ordnum,smlin_linnum);
create unique index "maxmast".smlin_key9 on "maxmast".smlin (smlin_ordnum,
    smlin_groupline,smlin_groupsort,smlin_linnum);
create unique index "maxmast".smlin_key10 on "maxmast".smlin (smlin_ordnum,
    smlin_printsort,smlin_groupsort,smlin_linnum);
{ TABLE "maxmast".smlpr row size = 189 number of columns = 19 index size = 78 }
{ unload file name = smlpr00654.unl number of rows = 0 }

create table "maxmast".smlpr 
  (
    smlpr_ordnum char(8) not null ,
    smlpr_linnum integer not null ,
    smlpr_progflag integer not null ,
    smlpr_itemser char(40) not null ,
    smlpr_prodgrp char(5) not null ,
    smlpr_structure char(1) not null ,
    smlpr_account char(15) not null ,
    smlpr_qty float not null ,
    smlpr_uom char(5) not null ,
    smlpr_sellprice float not null ,
    smlpr_cost float not null ,
    smlpr_fpmark char(1) not null ,
    smlpr_lud date not null ,
    smlpr_lui char(10) not null ,
    smlpr_itemkey serial not null ,
    smlpr_delnoteno char(8) not null ,
    smlpr_invnote char(8) not null ,
    smlpr_batchno char(8) not null ,
    smlpr_itemid char(40) not null 
  );
revoke all on "maxmast".smlpr from "public";

create unique index "maxmast".smlpr_key on "maxmast".smlpr (smlpr_ordnum,
    smlpr_linnum,smlpr_itemkey);
create unique index "maxmast".smlpr_itemkey on "maxmast".smlpr 
    (smlpr_itemkey);
create unique index "maxmast".smlpr_key2 on "maxmast".smlpr (smlpr_progflag,
    smlpr_ordnum,smlpr_linnum,smlpr_itemkey);
{ TABLE "maxmast".smpst row size = 258 number of columns = 21 index size = 57 }
{ unload file name = smpst00655.unl number of rows = 0 }

create table "maxmast".smpst 
  (
    smpst_paritem char(15) not null ,
    smpst_lineno integer not null ,
    smpst_detitem char(15) not null ,
    smpst_noff float not null ,
    smpst_noffuom char(5) not null ,
    smpst_lud date not null ,
    smpst_lui char(10) not null ,
    smpst_price float not null ,
    smpst_priceuom char(5) not null ,
    smpst_cost float not null ,
    smpst_ndisp char(1) not null ,
    smpst_nhide char(1) not null ,
    smpst_ncert char(1) not null ,
    smpst_nb2b char(1) not null ,
    smpst_chargcode char(5) not null ,
    smpst_desc1 char(50) not null ,
    smpst_desc2 char(50) not null ,
    smpst_linetype char(1) not null ,
    smpst_prodgroup char(6) not null ,
    smpst_supplier char(10) not null ,
    smpst_desc3 char(50) not null 
  );
revoke all on "maxmast".smpst from "public";

create unique index "maxmast".smpst_key on "maxmast".smpst (smpst_paritem,
    smpst_lineno,smpst_detitem);
{ TABLE "maxmast".smrch row size = 247 number of columns = 14 index size = 69 }
{ unload file name = smrch00656.unl number of rows = 0 }

create table "maxmast".smrch 
  (
    smrch_reptype char(30) not null ,
    smrch_reportno integer not null ,
    smrch_sectseq integer not null ,
    smrch_chkseq integer not null ,
    smrch_prefix char(5) not null ,
    smrch_title char(40) not null ,
    smrch_subtitle1 char(40) not null ,
    smrch_subtitle2 char(40) not null ,
    smrch_lud date not null ,
    smrch_lui char(10) not null ,
    smrch_field char(60) not null ,
    smrch_valcode integer not null ,
    smrch_quote char(1) not null ,
    smrch_notepad char(1) not null 
  );
revoke all on "maxmast".smrch from "public";

create unique index "maxmast".smrch_key1 on "maxmast".smrch (smrch_reptype,
    smrch_reportno,smrch_sectseq,smrch_chkseq);
{ TABLE "maxmast".smrde row size = 165 number of columns = 12 index size = 75 }
{ unload file name = smrde00657.unl number of rows = 0 }

create table "maxmast".smrde 
  (
    smrde_reptype char(30) not null ,
    smrde_reportno integer not null ,
    smrde_sectseq integer not null ,
    smrde_chkseq integer not null ,
    smrde_detseq integer not null ,
    smrde_prefix char(30) not null ,
    smrde_ftype char(1) not null ,
    smrde_flength integer not null ,
    smrde_suffix char(10) not null ,
    smrde_lud date not null ,
    smrde_lui char(10) not null ,
    smrde_field char(60) not null 
  );
revoke all on "maxmast".smrde from "public";

create unique index "maxmast".smrde_key1 on "maxmast".smrde (smrde_reptype,
    smrde_reportno,smrde_sectseq,smrde_chkseq,smrde_detseq);
{ TABLE "maxmast".smres row size = 134 number of columns = 11 index size = 48 }
{ unload file name = smres00658.unl number of rows = 0 }

create table "maxmast".smres 
  (
    smres_testid char(8) not null ,
    smres_seqnum integer not null ,
    smres_status integer not null ,
    smres_resultref char(40) not null ,
    smres_result char(40) not null ,
    smres_fail char(1) not null ,
    smres_inspector char(15) not null ,
    smres_testdate date not null ,
    smres_lud date not null ,
    smres_lui char(10) not null ,
    smres_numres integer not null 
  );
revoke all on "maxmast".smres from "public";

create index "maxmast".smres_testid on "maxmast".smres (smres_testid);
    
create unique index "maxmast".smres_key1 on "maxmast".smres (smres_testid,
    smres_seqnum,smres_status);
{ TABLE "maxmast".smrhd row size = 157 number of columns = 9 index size = 63 }
{ unload file name = smrhd00659.unl number of rows = 0 }

create table "maxmast".smrhd 
  (
    smrhd_reptype char(30) not null ,
    smrhd_reportno integer not null ,
    smrhd_label char(40) not null ,
    smrhd_field char(60) not null ,
    smrhd_ftype char(1) not null ,
    smrhd_flength integer not null ,
    smrhd_headseq integer not null ,
    smrhd_lud date not null ,
    smrhd_lui char(10) not null 
  );
revoke all on "maxmast".smrhd from "public";

create unique index "maxmast".smrhd_key1 on "maxmast".smrhd (smrhd_reptype,
    smrhd_reportno,smrhd_headseq);
{ TABLE "maxmast".smrse row size = 177 number of columns = 9 index size = 63 }
{ unload file name = smrse00660.unl number of rows = 0 }

create table "maxmast".smrse 
  (
    smrse_reptype char(30) not null ,
    smrse_reportno integer not null ,
    smrse_sectseq integer not null ,
    smrse_secpref char(5) not null ,
    smrse_title char(40) not null ,
    smrse_subtitle1 char(40) not null ,
    smrse_subtitle2 char(40) not null ,
    smrse_lud date not null ,
    smrse_lui char(10) not null 
  );
revoke all on "maxmast".smrse from "public";

create unique index "maxmast".smrse_key1 on "maxmast".smrse (smrse_reptype,
    smrse_reportno,smrse_sectseq);
{ TABLE "maxmast".smrta row size = 92 number of columns = 6 index size = 63 }
{ unload file name = smrta00661.unl number of rows = 0 }

create table "maxmast".smrta 
  (
    smrta_reptype char(30) not null ,
    smrta_reportno integer not null ,
    smrta_valcode integer not null ,
    smrta_userview char(40) not null ,
    smrta_lud date not null ,
    smrta_lui char(10) not null 
  );
revoke all on "maxmast".smrta from "public";

create unique index "maxmast".smrta_key1 on "maxmast".smrta (smrta_reptype,
    smrta_reportno,smrta_valcode);
{ TABLE "maxmast".smrtx row size = 232 number of columns = 8 index size = 63 }
{ unload file name = smrtx00662.unl number of rows = 0 }

create table "maxmast".smrtx 
  (
    smrtx_reptype char(30) not null ,
    smrtx_reportno integer not null ,
    smrtx_txtseq integer not null ,
    smrtx_text1 char(60) not null ,
    smrtx_text2 char(60) not null ,
    smrtx_text3 char(60) not null ,
    smrtx_lud date not null ,
    smrtx_lui char(10) not null 
  );
revoke all on "maxmast".smrtx from "public";

create unique index "maxmast".smrtx_key1 on "maxmast".smrtx (smrtx_reptype,
    smrtx_reportno,smrtx_txtseq);
{ TABLE "maxmast".smrty row size = 382 number of columns = 19 index size = 144 }
{ unload file name = smrty00663.unl number of rows = 0 }

create table "maxmast".smrty 
  (
    smrty_reptype char(30) not null ,
    smrty_reportno integer not null ,
    smrty_location char(10) not null ,
    smrty_title1 char(60) not null ,
    smrty_title2 char(60) not null ,
    smrty_title3 char(60) not null ,
    smrty_lud date not null ,
    smrty_lui char(10) not null ,
    smrty_engineer char(10) not null ,
    smrty_inspected date not null ,
    smrty_ordnum char(8) not null ,
    smrty_linnum integer not null ,
    smrty_workld float not null ,
    smrty_workunit char(5) not null ,
    smrty_contact char(35) not null ,
    smrty_telephone char(20) not null ,
    smrty_delpt char(10) not null ,
    smrty_swltext char(30) not null ,
    smrty_engineer2 char(10) not null 
  );
revoke all on "maxmast".smrty from "public";

create index "maxmast".smrty_reportno on "maxmast".smrty (smrty_reportno);
    
create unique index "maxmast".smrty_key1 on "maxmast".smrty (smrty_reptype,
    smrty_reportno);
create index "maxmast".smrty_key2 on "maxmast".smrty (smrty_ordnum,
    smrty_linnum,smrty_reptype,smrty_reportno);
{ TABLE "maxmast".smseh row size = 248 number of columns = 13 index size = 87 }
{ unload file name = smseh00664.unl number of rows = 0 }

create table "maxmast".smseh 
  (
    smseh_eventnum char(8) not null ,
    smseh_account char(10) not null ,
    smseh_delpt char(10) not null ,
    smseh_ponum char(40) not null ,
    smseh_caller char(40) not null ,
    smseh_calltel char(40) not null ,
    smseh_summary char(40) not null ,
    smseh_keyword char(20) not null ,
    smseh_distlist char(20) not null ,
    smseh_evstatus char(1) not null ,
    smseh_territory char(5) not null ,
    smseh_lud date not null ,
    smseh_lui char(10) not null 
  );
revoke all on "maxmast".smseh from "public";

create unique index "maxmast".smseh_eventnum on "maxmast".smseh 
    (smseh_eventnum);
create index "maxmast".smseh_keyword on "maxmast".smseh (smseh_keyword);
    
create unique index "maxmast".smseh_key1 on "maxmast".smseh (smseh_account,
    smseh_eventnum);
{ TABLE "maxmast".smsel row size = 425 number of columns = 31 index size = 75 }
{ unload file name = smsel00665.unl number of rows = 0 }

create table "maxmast".smsel 
  (
    smsel_eventnum char(8) not null ,
    smsel_linnum integer not null ,
    smsel_evdate date not null ,
    smsel_evtime char(5) not null ,
    smsel_evtype char(3) not null ,
    smsel_itemid char(40) not null ,
    smsel_itemser char(40) not null ,
    smsel_servnum char(15) not null ,
    smsel_delnote char(40) not null ,
    smsel_itemkey integer not null ,
    smsel_category char(2) not null ,
    smsel_engineer char(40) not null ,
    smsel_priority char(1) not null ,
    smsel_status char(1) not null ,
    smsel_stage char(3) not null ,
    smsel_stagedate date not null ,
    smsel_action char(3) not null ,
    smsel_esttime float not null ,
    smsel_estcost float not null ,
    smsel_remark char(80) not null ,
    smsel_lud date not null ,
    smsel_lui char(10) not null ,
    smsel_cui char(10) not null ,
    smsel_sysdate date not null ,
    smsel_systime char(5) not null ,
    smsel_searchkey char(40) not null ,
    smsel_wbs char(15) not null ,
    smsel_contract char(10) not null ,
    smsel_lineno integer not null ,
    smsel_actdate date not null ,
    smsel_servchcod char(6) not null 
  );
revoke all on "maxmast".smsel from "public";

create unique index "maxmast".smsel_key on "maxmast".smsel (smsel_eventnum,
    smsel_linnum);
create unique index "maxmast".smsel_clevent on "maxmast".smsel 
    (smsel_contract,smsel_lineno,smsel_actdate,smsel_eventnum,
    smsel_linnum);
{ TABLE "maxmast".smsrn row size = 103 number of columns = 12 index size = 48 }
{ unload file name = smsrn00666.unl number of rows = 0 }

create table "maxmast".smsrn 
  (
    smsrn_ordnum char(8) not null ,
    smsrn_linnum integer not null ,
    smsrn_compline integer not null ,
    smsrn_item char(15) not null ,
    smsrn_serno char(15) not null ,
    smsrn_sernoend char(15) not null ,
    smsrn_tracecode char(1) not null ,
    smsrn_quantity float not null ,
    smsrn_lud date not null ,
    smsrn_lui char(10) not null ,
    smsrn_serial serial not null ,
    smsrn_bin char(15) not null 
  );
revoke all on "maxmast".smsrn from "public";

create unique index "maxmast".smsrn_serial on "maxmast".smsrn 
    (smsrn_serial);
create unique index "maxmast".smsrn_key on "maxmast".smsrn (smsrn_ordnum,
    smsrn_linnum,smsrn_compline,smsrn_serial);
{ TABLE "maxmast".smsst row size = 165 number of columns = 14 index size = 535 }
{ unload file name = smsst00667.unl number of rows = 0 }

create table "maxmast".smsst 
  (
    smsst_parent char(40) not null ,
    smsst_component char(40) not null ,
    smsst_type char(1) not null ,
    smsst_quantity float not null ,
    smsst_serno char(15) not null ,
    smsst_ondate date not null ,
    smsst_offdate date not null ,
    smsst_fitem char(15) not null ,
    smsst_historyid integer not null ,
    smsst_reason char(12) not null ,
    smsst_desondate integer not null ,
    smsst_serial serial not null ,
    smsst_lui char(10) not null ,
    smsst_lud date not null 
  );
revoke all on "maxmast".smsst from "public";

create index "maxmast".smsst_parent on "maxmast".smsst (smsst_parent);
    
create unique index "maxmast".smsst_key1 on "maxmast".smsst (smsst_historyid,
    smsst_desondate,smsst_parent,smsst_component,smsst_serno);
    
create unique index "maxmast".smsst_key on "maxmast".smsst (smsst_parent,
    smsst_component,smsst_serno,smsst_ondate);
create unique index "maxmast".smsst_key2 on "maxmast".smsst (smsst_serno,
    smsst_parent,smsst_component,smsst_ondate);
{ TABLE "maxmast".smstg row size = 23 number of columns = 2 index size = 10 }
{ unload file name = smstg00668.unl number of rows = 0 }

create table "maxmast".smstg 
  (
    smstg_stage char(3) not null ,
    smstg_stagedes char(20) not null 
  );
revoke all on "maxmast".smstg from "public";

create unique index "maxmast".smstg_stage on "maxmast".smstg (smstg_stage);
    
{ TABLE "maxmast".smsun row size = 668 number of columns = 37 index size = 384 }
{ unload file name = smsun00669.unl number of rows = 0 }

create table "maxmast".smsun 
  (
    smsun_suid char(40) not null ,
    smsun_customer char(10) not null ,
    smsun_delpt char(10) not null ,
    smsun_desc1 char(50) not null ,
    smsun_desc2 char(50) not null ,
    smsun_sid char(15) not null ,
    smsun_item char(15) not null ,
    smsun_ctel char(20) not null ,
    smsun_contact char(20) not null ,
    smsun_ponum char(40) not null ,
    smsun_cusdesc char(50) not null ,
    smsun_lasteng char(10) not null ,
    smsun_madeby char(40) not null ,
    smsun_madedate date not null ,
    smsun_workld float not null ,
    smsun_workunit char(5) not null ,
    smsun_prodgrpcd char(6) not null ,
    smsun_glsrev char(15) not null ,
    smsun_glcos char(15) not null ,
    smsun_glstock char(15) not null ,
    smsun_lud date not null ,
    smsun_lui char(10) not null ,
    smsun_certdate date not null ,
    smsun_lasttest char(8) not null ,
    smsun_testdate date not null ,
    smsun_insp date not null ,
    smsun_report char(8) not null ,
    smsun_cost float not null ,
    smsun_price float not null ,
    smsun_serialnum char(40) not null ,
    smsun_prefix char(15) not null ,
    smsun_suffix char(15) not null ,
    smsun_certnum char(8) not null ,
    smsun_uniqueid integer not null ,
    smsun_swltext char(30) not null ,
    smsun_mainchar char(40) not null ,
    smsun_secchar char(20) not null 
  );
revoke all on "maxmast".smsun from "public";

create unique index "maxmast".smsun_suid on "maxmast".smsun (smsun_suid);
    
create unique index "maxmast".smsun_key on "maxmast".smsun (smsun_suid,
    smsun_customer,smsun_delpt);
create unique index "maxmast".smsun_custkey on "maxmast".smsun 
    (smsun_customer,smsun_suid,smsun_delpt);
create unique index "maxmast".smsun_key2 on "maxmast".smsun (smsun_serialnum,
    smsun_suid);
{ TABLE "maxmast".smtdt row size = 418 number of columns = 30 index size = 121 }
{ unload file name = smtdt00670.unl number of rows = 0 }

create table "maxmast".smtdt 
  (
    smtdt_testid char(8) not null ,
    smtdt_tempid char(15) not null ,
    smtdt_issueno char(6) not null ,
    smtdt_seqnum integer not null ,
    smtdt_testref char(40) not null ,
    smtdt_element char(15) not null ,
    smtdt_eletext char(40) not null ,
    smtdt_uom char(5) not null ,
    smtdt_target char(20) not null ,
    smtdt_pluspc float not null ,
    smtdt_minuspc float not null ,
    smtdt_plusval float not null ,
    smtdt_minusval float not null ,
    smtdt_reinspect integer not null ,
    smtdt_retest integer not null ,
    smtdt_lud date not null ,
    smtdt_lui char(10) not null ,
    smtdt_reports char(5) not null ,
    smtdt_reptext char(80) not null ,
    smtdt_textmask char(80) not null ,
    smtdt_feedback char(1) not null ,
    smtdt_repwidth integer not null ,
    smtdt_tbmdate date not null ,
    smtdt_tbmtime char(8) not null ,
    smtdt_pluswarn float not null ,
    smtdt_minuswarn float not null ,
    smtdt_format char(1) not null ,
    smtdt_charwidth integer not null ,
    smtdt_occurnce integer not null ,
    smtdt_reqdocc integer not null 
  );
revoke all on "maxmast".smtdt from "public";

create index "maxmast".smtdt_testid on "maxmast".smtdt (smtdt_testid);
    
create unique index "maxmast".smtdt_key1 on "maxmast".smtdt (smtdt_testid,
    smtdt_seqnum);
create unique index "maxmast".smtdt_key2 on "maxmast".smtdt (smtdt_tempid,
    smtdt_issueno,smtdt_testid,smtdt_seqnum);
create unique index "maxmast".smtdt_key3 on "maxmast".smtdt (smtdt_seqnum,
    smtdt_testid);
{ TABLE "maxmast".smthd row size = 454 number of columns = 33 index size = 708 }
{ unload file name = smthd00671.unl number of rows = 0 }

create table "maxmast".smthd 
  (
    smthd_testid char(8) not null ,
    smthd_tempid char(15) not null ,
    smthd_issueno char(6) not null ,
    smthd_batchqty integer not null ,
    smthd_testqty integer not null ,
    smthd_passed integer not null ,
    smthd_failed integer not null ,
    smthd_entity char(40) not null ,
    smthd_reftype char(5) not null ,
    smthd_compdate date not null ,
    smthd_inspector char(15) not null ,
    smthd_certprt integer not null ,
    smthd_lud date not null ,
    smthd_lui char(10) not null ,
    smthd_fromser char(40) not null ,
    smthd_toser char(40) not null ,
    smthd_trefpt1 char(40) not null ,
    smthd_trefpt2 char(40) not null ,
    smthd_orefpt1 char(40) not null ,
    smthd_orefpt2 char(40) not null ,
    smthd_oreftype char(5) not null ,
    smthd_feedback char(1) not null ,
    smthd_repref char(8) not null ,
    smthd_repprt char(1) not null ,
    smthd_batchno char(15) not null ,
    smthd_rangeref char(8) not null ,
    smthd_certuniq integer not null ,
    smthd_passfail char(1) not null ,
    smthd_tbmdate date not null ,
    smthd_linetype char(2) not null ,
    smthd_tbmtime char(8) not null ,
    smthd_trefpt3 char(15) not null ,
    smthd_orefpt3 char(15) not null 
  );
revoke all on "maxmast".smthd from "public";

create unique index "maxmast".smthd_testid on "maxmast".smthd 
    (smthd_testid);
create unique index "maxmast".smthd_key1 on "maxmast".smthd (smthd_tempid,
    smthd_issueno,smthd_testid);
create unique index "maxmast".smthd_key3 on "maxmast".smthd (smthd_reftype,
    smthd_trefpt1,smthd_trefpt2,smthd_trefpt3,smthd_testid);
create unique index "maxmast".smthd_key4 on "maxmast".smthd (smthd_oreftype,
    smthd_orefpt1,smthd_orefpt2,smthd_orefpt3,smthd_testid);
create unique index "maxmast".smthd_key5 on "maxmast".smthd (smthd_rangeref,
    smthd_testid);
create unique index "maxmast".smthd_key2 on "maxmast".smthd (smthd_certuniq,
    smthd_testid);
create unique index "maxmast".smthd_key6 on "maxmast".smthd (smthd_inspector,
    smthd_testid);
create unique index "maxmast".smthd_key7 on "maxmast".smthd (smthd_repref,
    smthd_testid);
create unique index "maxmast".smthd_key8 on "maxmast".smthd (smthd_repref,
    smthd_reftype,smthd_trefpt1,smthd_trefpt2,smthd_trefpt3,smthd_testid);
    
{ TABLE "maxmast".smwbl row size = 95 number of columns = 8 index size = 729 }
{ unload file name = smwbl00672.unl number of rows = 0 }

create table "maxmast".smwbl 
  (
    smwbl_wbs char(15) not null ,
    smwbl_source char(2) not null ,
    smwbl_entityid char(40) not null ,
    smwbl_uniqueid integer not null ,
    smwbl_account char(10) not null ,
    smwbl_storecode char(10) not null ,
    smwbl_lud date not null ,
    smwbl_lui char(10) not null 
  );
revoke all on "maxmast".smwbl from "public";

create unique index "maxmast".smwbl_key on "maxmast".smwbl (smwbl_wbs,
    smwbl_source,smwbl_entityid,smwbl_uniqueid,smwbl_account,
    smwbl_storecode);
create unique index "maxmast".smwbl_key2 on "maxmast".smwbl (smwbl_source,
    smwbl_entityid,smwbl_uniqueid,smwbl_wbs,smwbl_account,smwbl_storecode);
    
create unique index "maxmast".smwbl_classkey on "maxmast".smwbl 
    (smwbl_source,smwbl_entityid,smwbl_uniqueid,smwbl_account,
    smwbl_storecode,smwbl_wbs);
create unique index "maxmast".smwbl_key3 on "maxmast".smwbl (smwbl_source,
    smwbl_wbs,smwbl_entityid,smwbl_uniqueid,smwbl_account,smwbl_storecode);
    
create index "maxmast".smwbl_wbskey on "maxmast".smwbl (smwbl_source,
    smwbl_wbs,smwbl_entityid);
create unique index "maxmast".smwbl_key4 on "maxmast".smwbl (smwbl_uniqueid,
    smwbl_account,smwbl_storecode,smwbl_wbs,smwbl_source,smwbl_entityid);
    
{ TABLE "maxmast".smwbs row size = 217 number of columns = 15 index size = 543 }
{ unload file name = smwbs00673.unl number of rows = 0 }

create table "maxmast".smwbs 
  (
    smwbs_wbs char(15) not null ,
    smwbs_source char(2) not null ,
    smwbs_location char(10) not null ,
    smwbs_customer char(10) not null ,
    smwbs_itemid char(40) not null ,
    smwbs_item char(15) not null ,
    smwbs_lud date not null ,
    smwbs_lui char(10) not null ,
    smwbs_desc1 char(50) not null ,
    smwbs_uniqueid integer not null ,
    smwbs_class char(10) not null ,
    smwbs_inoutjob char(1) not null ,
    smwbs_reptype char(30) not null ,
    smwbs_defprice float not null ,
    smwbs_defcost float not null 
  );
revoke all on "maxmast".smwbs from "public";

create unique index "maxmast".smwbs_wbs on "maxmast".smwbs (smwbs_wbs);
    
create unique index "maxmast".smwbs_key1 on "maxmast".smwbs (smwbs_customer,
    smwbs_location,smwbs_itemid,smwbs_wbs);
create unique index "maxmast".smwbs_key2 on "maxmast".smwbs (smwbs_item,
    smwbs_wbs);
create unique index "maxmast".smwbs_key3 on "maxmast".smwbs (smwbs_uniqueid,
    smwbs_wbs);
create unique index "maxmast".smwbs_wbskey on "maxmast".smwbs 
    (smwbs_customer,smwbs_wbs,smwbs_source);
create unique index "maxmast".smwbs_key4 on "maxmast".smwbs (smwbs_uniqueid,
    smwbs_customer,smwbs_location,smwbs_wbs);
create unique index "maxmast".smwbs_key5 on "maxmast".smwbs (smwbs_item,
    smwbs_customer,smwbs_location,smwbs_wbs);
create unique index "maxmast".smwbs_key6 on "maxmast".smwbs (smwbs_itemid,
    smwbs_customer,smwbs_location,smwbs_wbs);
{ TABLE "maxmast".txlink row size = 98 number of columns = 8 index size = 231 }
{ unload file name = txlin00674.unl number of rows = 7 }

create table "maxmast".txlink 
  (
    txlnk_ttaxstat char(10) not null ,
    txlnk_itaxstat char(10) not null ,
    txlnk_wtaxstat char(10) not null ,
    txlnk_dtaxstat char(10) not null ,
    txlnk_taxlevel integer not null ,
    txlnk_ratecode char(10) not null ,
    txlnk_cumlevel integer not null ,
    txlnk_keyarea char(40) not null 
  );
revoke all on "maxmast".txlink from "public";

create unique index "maxmast".txlnk_key on "maxmast".txlink (txlnk_ttaxstat,
    txlnk_itaxstat,txlnk_wtaxstat,txlnk_dtaxstat,txlnk_taxlevel);
    
create unique index "maxmast".txlnk_keyarea1 on "maxmast".txlink 
    (txlnk_keyarea,txlnk_taxlevel);
create unique index "maxmast".txlnk_ratekey on "maxmast".txlink 
    (txlnk_ratecode,txlnk_keyarea,txlnk_taxlevel);
{ TABLE "maxmast".txpara row size = 303 number of columns = 38 index size = 7 }
{ unload file name = txpar00675.unl number of rows = 1 }

create table "maxmast".txpara 
  (
    txpar_key char(1) not null ,
    txpar_master char(4) not null ,
    txpar_maxper integer not null ,
    txpar_year integer not null ,
    txpar_curper integer not null ,
    txpar_proof integer not null ,
    txpar_sltaxacct char(15) not null ,
    txpar_pltaxacct char(15) not null ,
    txpar_summary char(1) not null ,
    txpar_outsrce char(26) not null ,
    txpar_insrce char(26) not null ,
    txpar_retno integer not null ,
    txpar_txregno char(15) not null ,
    txpar_proofreq char(1) not null ,
    txpar_control char(1) not null ,
    txpar_suspense char(15) not null ,
    txpar_acqiglacc char(15) not null ,
    txpar_acqoglacc char(15) not null ,
    txpar_cfivglacc char(15) not null ,
    txpar_cfovglacc char(15) not null ,
    txpar_withrate char(10) not null ,
    txpar_withmin float not null ,
    txpar_sdiscinc char(1) not null ,
    txpar_balind char(1) not null ,
    txpar_advuse char(1) not null ,
    txpar_adtaxmin float not null ,
    txpar_advinacc char(15) not null ,
    txpar_advoutac char(15) not null ,
    txpar_chktaxdt char(1) not null ,
    txpar_codcode char(5) not null ,
    txpar_custtype char(3) not null ,
    txpar_dlycreds char(1) not null ,
    txpar_dlyexprt char(1) not null ,
    txpar_dlyinput char(1) not null ,
    txpar_isusglacc char(15) not null ,
    txpar_osusglacc char(15) not null ,
    txpar_doptax char(1) not null ,
    txpar_acqstdtax char(1) not null 
  );
revoke all on "maxmast".txpara from "public";

create unique index "maxmast".txpar_key on "maxmast".txpara (txpar_key);
    
{ TABLE "maxmast".txrate row size = 187 number of columns = 18 index size = 27 }
{ unload file name = txrat00676.unl number of rows = 10 }

create table "maxmast".txrate 
  (
    txr_taxcode char(10) not null ,
    txr_enddate date not null ,
    txr_taxrate float not null ,
    txr_desc char(30) not null ,
    txr_vatiglacc char(15) not null ,
    txr_vatoglacc char(15) not null ,
    txr_pradjind char(1) not null ,
    txr_inoutind char(1) not null ,
    txr_taxregrq char(1) not null ,
    txr_comtaxrq char(1) not null ,
    txr_manualdis char(1) not null ,
    txr_advinacc char(15) not null ,
    txr_advoutac char(15) not null ,
    txr_acqcode char(10) not null ,
    txr_acqiglacc char(15) not null ,
    txr_acqoglacc char(15) not null ,
    txr_osusglacc char(15) not null ,
    txr_isusglacc char(15) not null 
  );
revoke all on "maxmast".txrate from "public";

create unique index "maxmast".txr_key on "maxmast".txrate (txr_taxcode,
    txr_enddate);
{ TABLE "maxmast".txstat row size = 67 number of columns = 3 index size = 22 }
{ unload file name = txsta00677.unl number of rows = 9 }

create table "maxmast".txstat 
  (
    txsta_type char(1) not null ,
    txsta_status char(10) not null ,
    txsta_descript char(56) not null 
  );
revoke all on "maxmast".txstat from "public";

create unique index "maxmast".txsta_key on "maxmast".txstat (txsta_type,
    txsta_status);
{ TABLE "maxmast".txtran row size = 250 number of columns = 40 index size = 492 }
{ unload file name = txtra00678.unl number of rows = 65575 }

create table "maxmast".txtran 
  (
    txt_source char(1) not null ,
    txt_trantype char(1) not null ,
    txt_ourref char(8) not null ,
    txt_taxcode char(10) not null ,
    txt_trandate date not null ,
    txt_goodsval float not null ,
    txt_taxvalue float not null ,
    txt_proof integer not null ,
    txt_fproof integer not null ,
    txt_taxreturn char(1) not null ,
    txt_batch char(6) not null ,
    txt_summflag char(1) not null ,
    txt_account char(10) not null ,
    txt_seq serial not null ,
    txt_coid char(4) not null ,
    txt_year integer not null ,
    txt_period integer not null ,
    txt_country char(5) not null ,
    txt_saleslist char(1) not null ,
    txt_vatnumber char(15) not null ,
    txt_ssdlink char(15) not null ,
    txt_basecurr char(4) not null ,
    txt_currval float not null ,
    txt_cutaxval float not null ,
    txt_currrate float not null ,
    txt_conmethod char(1) not null ,
    txt_trunmeth char(1) not null ,
    txt_trunfac float not null ,
    txt_twinrate float not null ,
    txt_currency char(4) not null ,
    txt_glyear integer not null ,
    txt_glper integer not null ,
    txt_revglyear integer not null ,
    txt_revglper integer not null ,
    txt_advtax char(1) not null ,
    txt_payref char(15) not null ,
    txt_extref char(30) not null ,
    txt_linkref char(15) not null ,
    txt_suspended char(1) not null ,
    txt_remcode integer not null 
  );
revoke all on "maxmast".txtran from "public";

create unique index "maxmast".txt_seq on "maxmast".txtran (txt_seq);
    
create unique index "maxmast".txt_key on "maxmast".txtran (txt_taxcode,
    txt_source,txt_country,txt_account,txt_trantype,txt_ourref,
    txt_seq);
create index "maxmast".txt_srckey on "maxmast".txtran (txt_source,
    txt_taxcode,txt_ourref,txt_seq);
create unique index "maxmast".txt_key1 on "maxmast".txtran (txt_account,
    txt_ourref,txt_seq);
create index "maxmast".txt_csckey on "maxmast".txtran (txt_country,
    txt_source,txt_taxcode,txt_account,txt_ourref,txt_seq);
create unique index "maxmast".txt_key2 on "maxmast".txtran (txt_saleslist,
    txt_country,txt_vatnumber,txt_seq);
create unique index "maxmast".txt_key3 on "maxmast".txtran (txt_advtax,
    txt_glyear,txt_glper,txt_seq);
create unique index "maxmast".txt_key4 on "maxmast".txtran (txt_advtax,
    txt_revglyear,txt_revglper,txt_seq);
create unique index "maxmast".txt_key5 on "maxmast".txtran (txt_account,
    txt_ourref,txt_advtax,txt_taxcode,txt_source,txt_trantype,
    txt_seq);
create unique index "maxmast".txt_key6 on "maxmast".txtran (txt_payref,
    txt_seq);
create unique index "maxmast".txt_key7 on "maxmast".txtran (txt_source,
    txt_taxcode,txt_year,txt_period,txt_seq);
create unique index "maxmast".txt_keycz on "maxmast".txtran (txt_taxcode,
    txt_trandate,txt_ourref,txt_seq);
{ TABLE "maxmast".whais row size = 75 number of columns = 9 index size = 72 }
{ unload file name = whais00679.unl number of rows = 0 }

create table "maxmast".whais 
  (
    whais_store char(5) not null ,
    whais_zone char(5) not null ,
    whais_subzone char(5) not null ,
    whais_aisle char(5) not null ,
    whais_status char(1) not null ,
    whais_closedid char(10) not null ,
    whais_lui char(10) not null ,
    whais_lud date not null ,
    whais_aisledesc char(30) not null 
  );
revoke all on "maxmast".whais from "public";

create unique index "maxmast".whais_key on "maxmast".whais (whais_store,
    whais_zone,whais_subzone,whais_aisle);
create unique index "maxmast".whais_valkey on "maxmast".whais 
    (whais_store,whais_aisle,whais_zone,whais_subzone);
{ TABLE "maxmast".whbay row size = 104 number of columns = 13 index size = 43 }
{ unload file name = whbay00680.unl number of rows = 0 }

create table "maxmast".whbay 
  (
    whbay_store char(5) not null ,
    whbay_zone char(5) not null ,
    whbay_subzone char(5) not null ,
    whbay_aisle char(5) not null ,
    whbay_bay char(5) not null ,
    whbay_status char(1) not null ,
    whbay_closedid char(10) not null ,
    whbay_weight float not null ,
    whbay_depth float not null ,
    whbay_width float not null ,
    whbay_lui char(10) not null ,
    whbay_lud date not null ,
    whbay_baydesc char(30) not null 
  );
revoke all on "maxmast".whbay from "public";

create unique index "maxmast".whbay_key on "maxmast".whbay (whbay_store,
    whbay_zone,whbay_subzone,whbay_aisle,whbay_bay);
{ TABLE "maxmast".whbem row size = 115 number of columns = 16 index size = 102 }
{ unload file name = whbem00681.unl number of rows = 0 }

create table "maxmast".whbem 
  (
    whbem_store char(5) not null ,
    whbem_zone char(5) not null ,
    whbem_subzone char(5) not null ,
    whbem_aisle char(5) not null ,
    whbem_bay char(5) not null ,
    whbem_beam char(5) not null ,
    whbem_status char(1) not null ,
    whbem_closedid char(10) not null ,
    whbem_altitude float not null ,
    whbem_height float not null ,
    whbem_weight float not null ,
    whbem_baywtcalc char(1) not null ,
    whbem_type char(5) not null ,
    whbem_lui char(10) not null ,
    whbem_lud date not null ,
    whbem_beamdesc char(30) not null 
  );
revoke all on "maxmast".whbem from "public";

create unique index "maxmast".whbem_key on "maxmast".whbem (whbem_store,
    whbem_zone,whbem_subzone,whbem_aisle,whbem_bay,whbem_beam);
    
create unique index "maxmast".whbem_valkey on "maxmast".whbem 
    (whbem_store,whbem_beam,whbem_zone,whbem_subzone,whbem_aisle,
    whbem_bay);
{ TABLE "maxmast".whbty row size = 73 number of columns = 7 index size = 13 }
{ unload file name = whbty00682.unl number of rows = 0 }

create table "maxmast".whbty 
  (
    whbty_type char(5) not null ,
    whbty_techdesc char(30) not null ,
    whbty_weight float not null ,
    whbty_length float not null ,
    whbty_width float not null ,
    whbty_lui char(10) not null ,
    whbty_lud date not null 
  );
revoke all on "maxmast".whbty from "public";

create unique index "maxmast".whbty_type on "maxmast".whbty (whbty_type);
    
{ TABLE "maxmast".whpak row size = 101 number of columns = 11 index size = 27 }
{ unload file name = whpak00683.unl number of rows = 0 }

create table "maxmast".whpak 
  (
    whpak_childser char(10) not null ,
    whpak_item char(15) not null ,
    whpak_quantity float not null ,
    whpak_uom char(5) not null ,
    whpak_lui char(10) not null ,
    whpak_lud date not null ,
    whpak_scser char(10) not null ,
    whpak_linnum integer not null ,
    whpak_packtype char(10) not null ,
    whpak_storecont char(10) not null ,
    whpak_number char(15) not null 
  );
revoke all on "maxmast".whpak from "public";

create unique index "maxmast".whpak_key on "maxmast".whpak (whpak_scser,
    whpak_linnum);
{ TABLE "maxmast".whpru row size = 26 number of columns = 6 index size = 19 }
{ unload file name = whpru00684.unl number of rows = 0 }

create table "maxmast".whpru 
  (
    whpru_rule char(2) not null ,
    whpru_sequence integer not null ,
    whpru_required char(1) not null ,
    whpru_lud date not null ,
    whpru_lui char(10) not null ,
    whpru_store char(5) not null 
  );
revoke all on "maxmast".whpru from "public";

create unique index "maxmast".whpru_key1 on "maxmast".whpru (whpru_store,
    whpru_sequence);
{ TABLE "maxmast".whpst row size = 46 number of columns = 7 index size = 36 }
{ unload file name = whpst00685.unl number of rows = 0 }

create table "maxmast".whpst 
  (
    whpst_lui char(10) not null ,
    whpst_lud date not null ,
    whpst_parentsc char(10) not null ,
    whpst_childsc char(10) not null ,
    whpst_numlayers integer not null ,
    whpst_qtyperlay integer not null ,
    whpst_quantity integer not null 
  );
revoke all on "maxmast".whpst from "public";

create unique index "maxmast".whpst_key on "maxmast".whpst (whpst_parentsc,
    whpst_childsc);
{ TABLE "maxmast".whpty row size = 94 number of columns = 11 index size = 21 }
{ unload file name = whpty00686.unl number of rows = 0 }

create table "maxmast".whpty 
  (
    whpty_height float not null ,
    whpty_width float not null ,
    whpty_depth float not null ,
    whpty_weight float not null ,
    whpty_lui char(10) not null ,
    whpty_lud date not null ,
    whpty_storecont char(10) not null ,
    whpty_scdesc char(30) not null ,
    whpty_sergroup char(6) not null ,
    whpty_type char(1) not null ,
    whpty_heighttyp char(1) not null 
  );
revoke all on "maxmast".whpty from "public";

create unique index "maxmast".whpty_storecont on "maxmast".whpty 
    (whpty_storecont);
{ TABLE "maxmast".whrea row size = 101 number of columns = 8 index size = 21 }
{ unload file name = whrea00687.unl number of rows = 0 }

create table "maxmast".whrea 
  (
    whrea_reason char(10) not null ,
    whrea_shortdesc char(20) not null ,
    whrea_longdesc char(40) not null ,
    whrea_closebin char(1) not null ,
    whrea_returnloc char(15) not null ,
    whrea_lud date not null ,
    whrea_lui char(10) not null ,
    whrea_reastype char(1) not null 
  );
revoke all on "maxmast".whrea from "public";

create unique index "maxmast".whrea_reason on "maxmast".whrea 
    (whrea_reason);
{ TABLE "maxmast".whret row size = 51 number of columns = 6 index size = 27 }
{ unload file name = whret00688.unl number of rows = 0 }

create table "maxmast".whret 
  (
    whret_returnnum char(10) not null ,
    whret_linnum integer not null ,
    whret_item char(15) not null ,
    whret_quantity float not null ,
    whret_lud date not null ,
    whret_lui char(10) not null 
  );
revoke all on "maxmast".whret from "public";

create unique index "maxmast".whret_key on "maxmast".whret (whret_returnnum,
    whret_linnum);
{ TABLE "maxmast".whsal row size = 226 number of columns = 32 index size = 859 }
{ unload file name = whsal00689.unl number of rows = 0 }

create table "maxmast".whsal 
  (
    whsal_store char(5) not null ,
    whsal_salnumber char(10) not null ,
    whsal_linnum integer not null ,
    whsal_actdate date not null ,
    whsal_acttime char(5) not null ,
    whsal_priority char(1) not null ,
    whsal_type char(10) not null ,
    whsal_error char(1) not null ,
    whsal_fromloc char(15) not null ,
    whsal_toloc char(15) not null ,
    whsal_soordnum char(8) not null ,
    whsal_solinnum integer not null ,
    whsal_item char(15) not null ,
    whsal_storecont char(10) not null ,
    whsal_quantity float not null ,
    whsal_uom char(5) not null ,
    whsal_storekeep char(10) not null ,
    whsal_status char(1) not null ,
    whsal_reportno char(10) not null ,
    whsal_labelno char(10) not null ,
    whsal_reason char(10) not null ,
    whsal_piknoteno integer not null ,
    whsal_walkseq integer not null ,
    whsal_qtyaction float not null ,
    whsal_lui char(10) not null ,
    whsal_lud date not null ,
    whsal_scser char(10) not null ,
    whsal_van char(6) not null ,
    whsal_mivdtser integer not null ,
    whsal_sctype char(1) not null ,
    whsal_consign char(10) not null ,
    whsal_nooflabel integer not null 
  );
revoke all on "maxmast".whsal from "public";

create unique index "maxmast".whsal_primekey on "maxmast".whsal 
    (whsal_store,whsal_salnumber,whsal_linnum);
create unique index "maxmast".whsal_datekey on "maxmast".whsal 
    (whsal_store,whsal_type,whsal_actdate,whsal_acttime,whsal_salnumber,
    whsal_linnum);
create index "maxmast".whsal_reportkey on "maxmast".whsal (whsal_reportno,
    whsal_store,whsal_type,whsal_actdate,whsal_acttime);
create unique index "maxmast".whsal_labelkey on "maxmast".whsal 
    (whsal_labelno,whsal_walkseq,whsal_store,whsal_fromloc,whsal_salnumber,
    whsal_linnum);
create index "maxmast".whsal_strankey on "maxmast".whsal (whsal_store,
    whsal_status,whsal_storekeep,whsal_priority,whsal_actdate,
    whsal_acttime,whsal_salnumber,whsal_linnum);
create index "maxmast".whsal_flocserky on "maxmast".whsal (whsal_store,
    whsal_fromloc,whsal_scser,whsal_type,whsal_status);
create unique index "maxmast".whsal_stoserkey on "maxmast".whsal 
    (whsal_store,whsal_scser,whsal_salnumber,whsal_linnum);
create unique index "maxmast".whsal_typekey on "maxmast".whsal 
    (whsal_store,whsal_type,whsal_item,whsal_toloc,whsal_salnumber,
    whsal_linnum);
create unique index "maxmast".whsal_itemkey on "maxmast".whsal 
    (whsal_store,whsal_item,whsal_status,whsal_actdate,whsal_acttime,
    whsal_salnumber,whsal_linnum);
create unique index "maxmast".whsal_confkey on "maxmast".whsal 
    (whsal_soordnum,whsal_solinnum,whsal_fromloc,whsal_store,
    whsal_salnumber,whsal_linnum);
create unique index "maxmast".whsal_conskey on "maxmast".whsal 
    (whsal_consign,whsal_item,whsal_salnumber,whsal_linnum);
create unique index "maxmast".whsal_tolockey on "maxmast".whsal 
    (whsal_store,whsal_toloc,whsal_type,whsal_status,whsal_salnumber,
    whsal_linnum);
create unique index "maxmast".whsal_labprtkey on "maxmast".whsal 
    (whsal_store,whsal_consign,whsal_labelno,whsal_salnumber,
    whsal_linnum);
{ TABLE "maxmast".whszn row size = 70 number of columns = 8 index size = 57 }
{ unload file name = whszn00690.unl number of rows = 0 }

create table "maxmast".whszn 
  (
    whszn_store char(5) not null ,
    whszn_zone char(5) not null ,
    whszn_subzone char(5) not null ,
    whszn_status char(1) not null ,
    whszn_closedid char(10) not null ,
    whszn_lui char(10) not null ,
    whszn_lud date not null ,
    whszn_szdesc char(30) not null 
  );
revoke all on "maxmast".whszn from "public";

create unique index "maxmast".whszn_key on "maxmast".whszn (whszn_store,
    whszn_zone,whszn_subzone);
create unique index "maxmast".whszn_valkey on "maxmast".whszn 
    (whszn_store,whszn_subzone,whszn_zone);
{ TABLE "maxmast".whzon row size = 66 number of columns = 8 index size = 21 }
{ unload file name = whzon00691.unl number of rows = 0 }

create table "maxmast".whzon 
  (
    whzon_store char(5) not null ,
    whzon_zone char(5) not null ,
    whzon_status char(1) not null ,
    whzon_closedid char(10) not null ,
    whzon_lui char(10) not null ,
    whzon_lud date not null ,
    whzon_zonedesc char(30) not null ,
    whzon_zonetype char(1) not null 
  );
revoke all on "maxmast".whzon from "public";

create unique index "maxmast".whzon_key on "maxmast".whzon (whzon_store,
    whzon_zone);
{ TABLE "maxmast".prtax row size = 49 number of columns = 7 index size = 33 }
{ unload file name = prtax00693.unl number of rows = 18405 }

create table "maxmast".prtax 
  (
    prtax_ourref char(8) not null ,
    prtax_taxcode char(10) not null ,
    prtax_goodsval float not null ,
    prtax_taxval float not null ,
    prtax_acqtaxcod char(10) not null ,
    prtax_comtaxrq char(1) not null ,
    prtax_line integer not null 
  );
revoke all on "maxmast".prtax from "public";

create unique index "maxmast".prtax_taxkey on "maxmast".prtax 
    (prtax_ourref,prtax_taxcode);
{ TABLE "maxmast".imsto row size = 374 number of columns = 43 index size = 217 }
{ unload file name = imsto00694.unl number of rows = 18153 }

create table "maxmast".imsto 
  (
    imsto_item char(15) not null ,
    imsto_store char(5) not null ,
    imsto_targetstk float not null ,
    imsto_minstock float not null ,
    imsto_orderqty float not null ,
    imsto_sremarks char(56) not null ,
    imsto_lud date not null ,
    imsto_lui char(10) not null ,
    imsto_balance float not null ,
    imsto_orderper integer not null ,
    imsto_scontrolr char(3) not null ,
    imsto_soplock char(10) not null ,
    imsto_sopalloc float not null ,
    imsto_bin1 char(15) not null ,
    imsto_bin2 char(15) not null ,
    imsto_picrule char(1) not null ,
    imsto_pictime float not null ,
    imsto_picunit char(1) not null ,
    imsto_average float not null ,
    imsto_sopcommit float not null ,
    imsto_sopgfs float not null ,
    imsto_class char(1) not null ,
    imsto_lstdate date not null ,
    imsto_reordmeth char(1) not null ,
    imsto_supstore char(5) not null ,
    imsto_replrule char(1) not null ,
    imsto_account char(15) not null ,
    imsto_manfac char(5) not null ,
    imsto_pfslocatn char(15) not null ,
    imsto_pfaceloc char(15) not null ,
    imsto_capacity float not null ,
    imsto_reservloc char(15) not null ,
    imsto_fifotol integer not null ,
    imsto_fifomatch char(1) not null ,
    imsto_recpaktyp char(10) not null ,
    imsto_pfaceloc2 char(15) not null ,
    imsto_capacity2 float not null ,
    imsto_replnlvl float not null ,
    imsto_replnlvl2 float not null ,
    imsto_blkpaktyp char(10) not null ,
    imsto_shrinkwrp char(1) not null ,
    imsto_zone char(5) not null ,
    imsto_maxrepqty float not null 
  );
revoke all on "maxmast".imsto from "public";

create index "maxmast".imsto_item on "maxmast".imsto (imsto_item);
    
create unique index "maxmast".imsto_key on "maxmast".imsto (imsto_item,
    imsto_store);
create unique index "maxmast".imsto_storekey on "maxmast".imsto 
    (imsto_store,imsto_item);
create unique index "maxmast".imsto_pfacekey on "maxmast".imsto 
    (imsto_store,imsto_pfaceloc,imsto_item);
create unique index "maxmast".imsto_pface2key on "maxmast".imsto 
    (imsto_store,imsto_pfaceloc2,imsto_item);
{ TABLE "maxmast".cust_tmp row size = 15 number of columns = 2 index size = 0 }
{ unload file name = cust_00695.unl number of rows = 53 }

create table "maxmast".cust_tmp 
  (
    ct_custcode char(10),
    ct_country char(5)
  );
revoke all on "maxmast".cust_tmp from "public";

{ TABLE "maxmast".sysmenus row size = 78 number of columns = 2 index size = 33 }
{ unload file name = sysme00703.unl number of rows = 0 }

create table "maxmast".sysmenus 
  (
    menuname char(18),
    title char(60)
  );
revoke all on "maxmast".sysmenus from "public";

create unique index "maxmast".sysmenidx on "maxmast".sysmenus 
    (menuname);
{ TABLE "maxmast".sysmenuitems row size = 143 number of columns = 5 index size = 
              39 }
{ unload file name = sysme00704.unl number of rows = 0 }

create table "maxmast".sysmenuitems 
  (
    imenuname char(18),
    itemnum integer,
    mtext char(60),
    mtype char(1),
    progname char(60)
  );
revoke all on "maxmast".sysmenuitems from "public";

create unique index "maxmast".meniidx on "maxmast".sysmenuitems 
    (imenuname,itemnum);
{ TABLE "maxmast".arpara row size = 53 number of columns = 20 index size = 7 }
{ unload file name = arpar00707.unl number of rows = 1 }

create table "maxmast".arpara 
  (
    arpar_key char(1) not null ,
    arpar_locuse char(1) not null ,
    arpar_grpuse char(1) not null ,
    arpar_produse char(1) not null ,
    arpar_depnyr1 char(1) not null ,
    arpar_depnly char(1) not null ,
    arpar_suspense char(15) not null ,
    arpar_postlev char(1) not null ,
    arpar_pluse char(1) not null ,
    arpar_csuse char(1) not null ,
    arpar_plantuse char(1) not null ,
    arpar_ccaused char(1) not null ,
    arpar_ccagl char(1) not null ,
    arpar_lastyear integer not null ,
    arpar_serlast char(8) not null ,
    arpar_arhdel char(1) not null ,
    arpar_modstart integer not null ,
    arpar_modlength integer not null ,
    arpar_deprnd char(1) not null ,
    arpar_modlev integer not null 
  );
revoke all on "maxmast".arpara from "public";

create unique index "maxmast".arpar_key on "maxmast".arpara (arpar_key);
    
{ TABLE "maxmast".nwmtlbcst row size = 47 number of columns = 5 index size = 28 }
{ unload file name = nwmtl00708.unl number of rows = 18167 }

create table "maxmast".nwmtlbcst 
  (
    nwmlc_item char(15) not null ,
    nwmlc_matcost money(12,5),
    nwmlc_labcost money(12,5),
    nwmlc_vamatcost money(12,5),
    nwmlc_valabcost money(12,5)
  );
revoke all on "maxmast".nwmtlbcst from "public";

create unique index "maxmast".ix379_1 on "maxmast".nwmtlbcst (nwmlc_item);
    
{ TABLE "maxmast".mtlbcst row size = 39 number of columns = 5 index size = 0 }
{ unload file name = mtlbc00710.unl number of rows = 18167 }

create table "maxmast".mtlbcst 
  (
    mlc_item char(15) not null ,
    mlc_matcost money(9,5),
    mlc_labcost money(9,5),
    mlc_vamatcost money(9,5),
    mlc_valabcost money(9,5)
  );
revoke all on "maxmast".mtlbcst from "public";

{ TABLE "maxmast".imsup row size = 522 number of columns = 34 index size = 283 }
{ unload file name = imsup00723.unl number of rows = 7147 }

create table "maxmast".imsup 
  (
    imsup_item char(15) not null ,
    imsup_supplier char(10) not null ,
    imsup_branch char(4) not null ,
    imsup_prefcode char(3) not null ,
    imsup_suptime integer not null ,
    imsup_buyer char(3) not null ,
    imsup_scrappc float not null ,
    imsup_status char(1) not null ,
    imsup_stage char(2) not null ,
    imsup_deluom char(5) not null ,
    imsup_blanket char(1) not null ,
    imsup_partno char(20) not null ,
    imsup_contact char(15) not null ,
    imsup_terms char(10) not null ,
    imsup_split float not null ,
    imsup_actdate date not null ,
    imsup_remarks char(56) not null ,
    imsup_lud date not null ,
    imsup_lui char(10) not null ,
    imsup_priceuom char(5) not null ,
    imsup_insppc float not null ,
    imsup_decimals integer not null ,
    imsup_manfac char(5) not null ,
    imsup_routeid char(5) not null ,
    imsup_opno char(5) not null ,
    imsup_workcen char(5) not null ,
    imsup_notifdays integer not null ,
    imsup_btchprice float not null ,
    imsup_maker char(10) not null ,
    imsup_uremarks1 char(56) not null ,
    imsup_uremarks2 char(56) not null ,
    imsup_uremarks3 char(56) not null ,
    imsup_uremarks4 char(56) not null ,
    imsup_uremarks5 char(56) not null 
  );
revoke all on "maxmast".imsup from "public";

create unique index "maxmast".imsup_itemkey on "maxmast".imsup 
    (imsup_item,imsup_manfac,imsup_routeid,imsup_opno,imsup_workcen,
    imsup_supplier,imsup_branch);
create unique index "maxmast".imsup_prefkey on "maxmast".imsup 
    (imsup_item,imsup_manfac,imsup_routeid,imsup_opno,imsup_workcen,
    imsup_prefcode);
create unique index "maxmast".imsup_supkey on "maxmast".imsup 
    (imsup_supplier,imsup_branch,imsup_item,imsup_manfac,imsup_routeid,
    imsup_opno,imsup_workcen);
create index "maxmast".imsup_brankey on "maxmast".imsup (imsup_supplier,
    imsup_branch);
create index "maxmast".imsup_wkcenkey on "maxmast".imsup (imsup_workcen,
    imsup_supplier,imsup_branch);
{ TABLE "maxmast".oemer row size = 700 number of columns = 114 index size = 297 }
{ unload file name = oemer00726.unl number of rows = 246045 }

create table "maxmast".oemer 
  (
    oemer_ordnum char(8) not null ,
    oemer_linnum integer not null ,
    oemer_ltype char(1) not null ,
    oemer_linestat char(1) not null ,
    oemer_linsource char(1) not null ,
    oemer_mntflag char(1) not null ,
    oemer_ncgflg char(1) not null ,
    oemer_olinedate date not null ,
    oemer_reqdate date not null ,
    oemer_pickdate date not null ,
    oemer_item char(15) not null ,
    oemer_store char(5) not null ,
    oemer_binloc char(15) not null ,
    oemer_prodgroup char(6) not null ,
    oemer_qtyord float not null ,
    oemer_qtyos float not null ,
    oemer_totqtyinv float not null ,
    oemer_orduom char(5) not null ,
    oemer_uomfact float not null ,
    oemer_price float not null ,
    oemer_actdiscnt char(2) not null ,
    oemer_drate1 float not null ,
    oemer_drate2 float not null ,
    oemer_drate3 float not null ,
    oemer_priceuom char(5) not null ,
    oemer_normalupr float not null ,
    oemer_batchno char(10) not null ,
    oemer_directdel char(1) not null ,
    oemer_lud date not null ,
    oemer_lui char(10) not null ,
    oemer_qtyalloc float not null ,
    oemer_compflag char(1) not null ,
    oemer_despdate date not null ,
    oemer_discode char(2) not null ,
    oemer_status char(10) not null ,
    oemer_origord float not null ,
    oemer_orderno char(10) not null ,
    oemer_prtflag char(1) not null ,
    oemer_bompset char(1) not null ,
    oemer_itemac char(15) not null ,
    oemer_discntac char(15) not null ,
    oemer_pricelist char(10) not null ,
    oemer_comcd char(1) not null ,
    oemer_priceprom char(1) not null ,
    oemer_stdprice float not null ,
    oemer_stdpruom char(5) not null ,
    oemer_stdprcurr char(4) not null ,
    oemer_pricemeth char(1) not null ,
    oemer_spactused char(1) not null ,
    oemer_spapcused char(1) not null ,
    oemer_spondate date not null ,
    oemer_sdactused char(1) not null ,
    oemer_sdapcused char(1) not null ,
    oemer_sditmused char(1) not null ,
    oemer_sdipcused char(1) not null ,
    oemer_sdondate date not null ,
    oemer_qbactused char(1) not null ,
    oemer_qbapcused char(1) not null ,
    oemer_qbitmused char(1) not null ,
    oemer_qbipcused char(1) not null ,
    oemer_qbondate date not null ,
    oemer_qbonqty float not null ,
    oemer_qboffqty float not null ,
    oemer_qbtype char(1) not null ,
    oemer_qbvalue float not null ,
    oemer_qbd2rate float not null ,
    oemer_qbd1rate float not null ,
    oemer_qbd3rate float not null ,
    oemer_todelpt char(10) not null ,
    oemer_fromdelpt char(10) not null ,
    oemer_qtyovrdel float not null ,
    oemer_qtyunddel float not null ,
    oemer_consdesp char(1) not null ,
    oemer_consinv char(1) not null ,
    oemer_country char(5) not null ,
    oemer_invmeth char(1) not null ,
    oemer_payref char(1) not null ,
    oemer_atpreqd char(1) not null ,
    oemer_cusreqdte date not null ,
    oemer_custitem char(36) not null ,
    oemer_escalate char(1) not null ,
    oemer_esccharge char(1) not null ,
    oemer_invnum char(8) not null ,
    oemer_invlinnum integer not null ,
    oemer_netvalue float not null ,
    oemer_netprice float not null ,
    oemer_itaxstat char(10) not null ,
    oemer_rollupcst float not null ,
    oemer_fixprice char(1) not null ,
    oemer_rollupprc float not null ,
    oemer_prefix char(15) not null ,
    oemer_certnum char(8) not null ,
    oemer_suffix char(15) not null ,
    oemer_needserv char(1) not null ,
    oemer_certify char(1) not null ,
    oemer_location char(10) not null ,
    oemer_locdet char(30) not null ,
    oemer_tempid char(15) not null ,
    oemer_supplier char(10) not null ,
    oemer_maker char(10) not null ,
    oemer_suppto char(10) not null ,
    oemer_usedby char(10) not null ,
    oemer_certdelpt char(10) not null ,
    oemer_certcomb char(8) not null ,
    oemer_certtype char(1) not null ,
    oemer_test char(1) not null ,
    oemer_dateneg integer not null ,
    oemer_origdoc char(8) not null ,
    oemer_taxincl char(1) not null ,
    oemer_taxcode char(1) not null ,
    oemer_user1 char(2) not null ,
    oemer_user2 char(5) not null ,
    oemer_user3 char(1) not null ,
    oemer_user4 char(25) not null 
  );
revoke all on "maxmast".oemer from "public";

create unique index "maxmast".oemer_key on "maxmast".oemer (oemer_ordnum,
    oemer_linnum);
create unique index "maxmast".oemer_datekey on "maxmast".oemer 
    (oemer_item,oemer_pickdate,oemer_ordnum,oemer_linnum);
create unique index "maxmast".oemer_delkey on "maxmast".oemer 
    (oemer_item,oemer_todelpt,oemer_store,oemer_reqdate,oemer_linestat,
    oemer_ordnum,oemer_linnum);
create unique index "maxmast".oemer_pickkey on "maxmast".oemer 
    (oemer_pickdate,oemer_item,oemer_ordnum,oemer_linnum);
create unique index "maxmast".oemer_latestkey on "maxmast".oemer 
    (oemer_item,oemer_dateneg,oemer_ordnum,oemer_linnum);
create unique index "maxmast".oemer_wokey on "maxmast".oemer (oemer_orderno,
    oemer_ordnum,oemer_linnum);
{ TABLE "maxmast".oehdr row size = 960 number of columns = 98 index size = 388 }
{ unload file name = oehdr00727.unl number of rows = 14921 }

create table "maxmast".oehdr 
  (
    oehdr_ordnum char(8) not null ,
    oehdr_ordtype char(1) not null ,
    oehdr_ordsts char(1) not null ,
    oehdr_account char(10) not null ,
    oehdr_storecode char(10) not null ,
    oehdr_ponum char(15) not null ,
    oehdr_delroute char(10) not null ,
    oehdr_delinst char(20) not null ,
    oehdr_specinst char(20) not null ,
    oehdr_delmetcod char(5) not null ,
    oehdr_delmedesc char(20) not null ,
    oehdr_otycod char(5) not null ,
    oehdr_otydesc char(20) not null ,
    oehdr_origcod char(5) not null ,
    oehdr_origdesc char(20) not null ,
    oehdr_termscode char(2) not null ,
    oehdr_creditaut char(10) not null ,
    oehdr_salesman char(10) not null ,
    oehdr_sales2man char(10) not null ,
    oehdr_sm2percen float not null ,
    oehdr_invoiceno char(8) not null ,
    oehdr_invdate date not null ,
    oehdr_podno char(6) not null ,
    oehdr_entdate date not null ,
    oehdr_drate1 float not null ,
    oehdr_drate2 float not null ,
    oehdr_drate3 float not null ,
    oehdr_lud date not null ,
    oehdr_lui char(10) not null ,
    oehdr_ordval float not null ,
    oehdr_compflag char(1) not null ,
    oehdr_store char(5) not null ,
    oehdr_salesoff char(5) not null ,
    oehdr_invdisc char(2) not null ,
    oehdr_docdate date not null ,
    oehdr_geog char(5) not null ,
    oehdr_inproc char(10) not null ,
    oehdr_doctext char(1) not null ,
    oehdr_pricelist char(10) not null ,
    oehdr_promlist char(10) not null ,
    oehdr_suppcrchk char(1) not null ,
    oehdr_stflags char(10) not null ,
    oehdr_nett float not null ,
    oehdr_tax float not null ,
    oehdr_profit float not null ,
    oehdr_consdesp char(1) not null ,
    oehdr_consinv char(1) not null ,
    oehdr_allocval float not null ,
    oehdr_contact char(20) not null ,
    oehdr_mcontract char(15) not null ,
    oehdr_dochdrtxt char(25) not null ,
    oehdr_proforma char(1) not null ,
    oehdr_pfprinted char(1) not null ,
    oehdr_pfcashrec float not null ,
    oehdr_pfexpiry date not null ,
    oehdr_pfdpstval float not null ,
    oehdr_version integer not null ,
    oehdr_telephone char(20) not null ,
    oehdr_telex char(20) not null ,
    oehdr_expirydte date not null ,
    oehdr_quoteprnt char(1) not null ,
    oehdr_time integer not null ,
    oehdr_approved char(10) not null ,
    oehdr_sendto char(10) not null ,
    oehdr_miscval float not null ,
    oehdr_hcinvoice char(1) not null ,
    oehdr_faxinvoic char(1) not null ,
    oehdr_ediinvoic char(1) not null ,
    oehdr_hcdespadv char(1) not null ,
    oehdr_faxdespad char(1) not null ,
    oehdr_edidespad char(1) not null ,
    oehdr_hcoack char(1) not null ,
    oehdr_faxoack char(1) not null ,
    oehdr_edioack char(1) not null ,
    oehdr_ackdate date not null ,
    oehdr_acktime integer not null ,
    oehdr_shipment char(17) not null ,
    oehdr_partseq integer not null ,
    oehdr_boepayee char(10) not null ,
    oehdr_ccauth char(10) not null ,
    oehdr_currcode char(4) not null ,
    oehdr_printreqd char(1) not null ,
    oehdr_eccomment char(70) not null ,
    oehdr_ecemail char(40) not null ,
    oehdr_hcquote char(1) not null ,
    oehdr_esource char(40) not null ,
    oehdr_consign char(1) not null ,
    oehdr_ctaxstat char(10) not null ,
    oehdr_dateneg integer not null ,
    oehdr_taxdate date not null ,
    oehdr_taxempt char(1) not null ,
    oehdr_user1 char(8) not null ,
    oehdr_user2 date not null ,
    oehdr_uspec1 char(35) 
        default ' ' not null ,
    oehdr_uspec2 char(35) 
        default ' ' not null ,
    oehdr_uspec3 char(35) 
        default ' ' not null ,
    oehdr_uspec4 char(35) 
        default ' ' not null ,
    oehdr_uspec5 char(35) 
        default ' ' not null 
  );
revoke all on "maxmast".oehdr from "public";

create unique index "maxmast".oehdr_ordnum on "maxmast".oehdr 
    (oehdr_ordnum);
create index "maxmast".oehdr_ponum on "maxmast".oehdr (oehdr_ponum);
    
create unique index "maxmast".oehdr_key1 on "maxmast".oehdr (oehdr_account,
    oehdr_ordtype,oehdr_docdate,oehdr_ordnum);
create index "maxmast".oehdr_key2 on "maxmast".oehdr (oehdr_salesman,
    oehdr_entdate);
create index "maxmast".oehdr_key3 on "maxmast".oehdr (oehdr_sales2man,
    oehdr_entdate);
create unique index "maxmast".oehdr_key4 on "maxmast".oehdr (oehdr_ordtype,
    oehdr_account,oehdr_ordnum);
create unique index "maxmast".oehdr_key5 on "maxmast".oehdr (oehdr_shipment,
    oehdr_ordnum);
create unique index "maxmast".oehdr_key6 on "maxmast".oehdr (oehdr_mcontract,
    oehdr_ordnum);
create unique index "maxmast".oehdr_key7 on "maxmast".oehdr (oehdr_account,
    oehdr_ordtype,oehdr_proforma,oehdr_docdate,oehdr_ordnum);
    
create unique index "maxmast".oehdr_printkey on "maxmast".oehdr 
    (oehdr_printreqd,oehdr_ordnum);
create unique index "maxmast".oehdr_latestkey on "maxmast".oehdr 
    (oehdr_account,oehdr_ordtype,oehdr_proforma,oehdr_dateneg,
    oehdr_ordnum);
create unique index "maxmast".oehdr_offkey on "maxmast".oehdr 
    (oehdr_salesoff,oehdr_ordnum);
{ TABLE "maxmast".uoe02a row size = 255 number of columns = 13 index size = 87 }
{ unload file name = uoe0200728.unl number of rows = 180624 }

create table "maxmast".uoe02a 
  (
    uoe02a_runid char(14) not null ,
    uoe02a_account char(10) not null ,
    uoe02a_ponum char(15) not null ,
    uoe02a_item char(15) not null ,
    uoe02a_qtyord float not null ,
    uoe02a_deldate date not null ,
    uoe02a_storecode char(10) not null ,
    uoe02a_uspec1 char(35) 
        default ' ' not null ,
    uoe02a_uspec2 char(35) 
        default ' ' not null ,
    uoe02a_uspec3 char(35) 
        default ' ' not null ,
    uoe02a_uspec4 char(35) 
        default ' ' not null ,
    uoe02a_uspec5 char(35) 
        default ' ' not null ,
    uoe02a_status integer not null 
  );
revoke all on "maxmast".uoe02a from "public";

create index "maxmast".uoe02a_key1 on "maxmast".uoe02a (uoe02a_runid,
    uoe02a_account,uoe02a_ponum,uoe02a_item);
{ TABLE "maxmast".packdtl row size = 45 number of columns = 6 index size = 58 }
{ unload file name = packd00729.unl number of rows = 579 }

create table "maxmast".packdtl 
  (
    packnote integer not null ,
    ordnum char(8),
    item char(15) not null ,
    carton integer not null ,
    quantity integer,
    prefix char(10) 
        default ' ' not null 
  );
revoke all on "maxmast".packdtl from "public";

create index "maxmast".ix373_1 on "maxmast".packdtl (packnote);
    
create index "maxmast".ix373_2 on "maxmast".packdtl (ordnum);
create index "maxmast".ix373_3 on "maxmast".packdtl (item);
{ TABLE "maxmast".oldsoinfo row size = 92 number of columns = 11 index size = 0 }
{ unload file name = oldso00737.unl number of rows = 42064 }

create table "maxmast".oldsoinfo 
  (
    invnum char(8) not null ,
    itemno char(15) not null ,
    qty float not null ,
    nobrushes float not null ,
    net float not null ,
    matcost float not null ,
    labcost float not null ,
    profit float not null ,
    currency char(5) not null ,
    currate float not null ,
    currvalue float not null 
  );
revoke all on "maxmast".oldsoinfo from "public";

{ TABLE "maxmast".nvtrn row size = 363 number of columns = 43 index size = 456 }
{ unload file name = nvtrn00739.unl number of rows = 2427680 }

create table "maxmast".nvtrn 
  (
    nvtrn_fromstore char(5) not null ,
    nvtrn_fromacct char(5) not null ,
    nvtrn_tostore char(5) not null ,
    nvtrn_toacct char(5) not null ,
    nvtrn_item char(15) not null ,
    nvtrn_date date not null ,
    nvtrn_time char(6) not null ,
    nvtrn_itemqty float not null ,
    nvtrn_osqty float not null ,
    nvtrn_uom char(5) not null ,
    nvtrn_itemuom char(5) not null ,
    nvtrn_qty float not null ,
    nvtrn_origin char(15) not null ,
    nvtrn_previous char(15) not null ,
    nvtrn_current char(15) not null ,
    nvtrn_trancode char(2) not null ,
    nvtrn_completed char(1) not null ,
    nvtrn_analyse char(2) not null ,
    nvtrn_lud date not null ,
    nvtrn_lui char(10) not null ,
    nvtrn_sequence integer not null ,
    nvtrn_nextseq integer not null ,
    nvtrn_cost float not null ,
    nvtrn_frombin char(15) not null ,
    nvtrn_tobin char(15) not null ,
    nvtrn_serno char(15) not null ,
    nvtrn_sernoend char(15) not null ,
    nvtrn_actual float not null ,
    nvtrn_paritem char(15) not null ,
    nvtrn_linnum integer not null ,
    nvtrn_contract char(15) not null ,
    nvtrn_conlin integer not null ,
    nvtrn_cposted char(1) not null ,
    nvtrn_glrefrom char(15) not null ,
    nvtrn_glrefto char(15) not null ,
    nvtrn_containrs integer not null ,
    nvtrn_dateneg integer not null ,
    nvtrn_timeneg integer not null ,
    nvtrn_scser char(10) not null ,
    nvtrn_pickno char(10) not null ,
    nvtrn_toncstval float not null ,
    nvtrn_worder char(12),
    nvtrn_uzopid char(15) not null 
  );
revoke all on "maxmast".nvtrn from "public";

create index "maxmast".nvtrn_item on "maxmast".nvtrn (nvtrn_item);
    
create index "maxmast".nvtrn_origin on "maxmast".nvtrn (nvtrn_origin);
    
create unique index "maxmast".nvtrn_datekey on "maxmast".nvtrn 
    (nvtrn_item,nvtrn_date,nvtrn_time,nvtrn_current,nvtrn_sequence);
    
create unique index "maxmast".nvtrn_key on "maxmast".nvtrn (nvtrn_current,
    nvtrn_sequence);
create index "maxmast".nvtrn_origkey on "maxmast".nvtrn (nvtrn_origin,
    nvtrn_date,nvtrn_time,nvtrn_sequence);
create unique index "maxmast".nvtrn_latest on "maxmast".nvtrn 
    (nvtrn_item,nvtrn_dateneg,nvtrn_timeneg,nvtrn_current,nvtrn_sequence);
    
create unique index "maxmast".nvtrn_glrefkey on "maxmast".nvtrn 
    (nvtrn_glrefrom,nvtrn_glrefto,nvtrn_current,nvtrn_sequence);
    
create unique index "maxmast".nvtrn_key1 on "maxmast".nvtrn (nvtrn_item,
    nvtrn_serno,nvtrn_date,nvtrn_time,nvtrn_current,nvtrn_sequence);
    
{ TABLE "maxmast".imast row size = 834 number of columns = 124 index size = 184 }
{ unload file name = imast00740.unl number of rows = 18167 }

create table "maxmast".imast 
  (
    imast_item char(15) not null ,
    imast_desckey char(8) not null ,
    imast_stockuom char(5) not null ,
    imast_prodgroup char(6) not null ,
    imast_compclass char(1) not null ,
    imast_sparecod char(1) not null ,
    imast_typecode char(1) not null ,
    imast_class1 char(2) not null ,
    imast_class2 char(2) not null ,
    imast_class3 char(2) not null ,
    imast_class4 char(2) not null ,
    imast_class5 char(2) not null ,
    imast_drawno char(20) not null ,
    imast_drawiss char(3) not null ,
    imast_tracecode char(1) not null ,
    imast_decimals integer not null ,
    imast_effclass char(1) not null ,
    imast_manfac char(5) not null ,
    imast_ordrule char(1) not null ,
    imast_commcode char(1) not null ,
    imast_composlt integer not null ,
    imast_manufclt integer not null ,
    imast_monthcap float not null ,
    imast_primestor char(5) not null ,
    imast_abcclass char(1) not null ,
    imast_maxordqty float not null ,
    imast_safety float not null ,
    imast_iremarks char(56) not null ,
    imast_iplanner char(3) not null ,
    imast_valclass char(1) not null ,
    imast_stancost float not null ,
    imast_llc integer not null ,
    imast_archdate date not null ,
    imast_entrydate date not null ,
    imast_surplusdt date not null ,
    imast_lud date not null ,
    imast_lui char(10) not null ,
    imast_descext char(33) not null ,
    imast_freestock float not null ,
    imast_shfiltr float not null ,
    imast_exfiltr float not null ,
    imast_scrappc float not null ,
    imast_slipfiltr integer not null ,
    imast_urgefiltr integer not null ,
    imast_batchper integer not null ,
    imast_leadtime integer not null ,
    imast_batchrule char(1) not null ,
    imast_makebuy char(1) not null ,
    imast_depend char(1) not null ,
    imast_buildthro char(1) not null ,
    imast_monord float not null ,
    imast_ponord float not null ,
    imast_sic char(15) not null ,
    imast_primeacct char(5) not null ,
    imast_altind char(1) not null ,
    imast_commit float not null ,
    imast_pcontrlr char(3) not null ,
    imast_bufitem char(1) not null ,
    imast_lastmrp date not null ,
    imast_balance float not null ,
    imast_orderno char(10) not null ,
    imast_ordline integer not null ,
    imast_gdsearly integer not null ,
    imast_gdslate integer not null ,
    imast_techref char(10) not null ,
    imast_techflag char(1) not null ,
    imast_storelife integer not null ,
    imast_gremarks char(56) not null ,
    imast_pending integer not null ,
    imast_bonord float not null ,
    imast_gdsover float not null ,
    imast_gdsunder float not null ,
    imast_costroute char(5) not null ,
    imast_puaccount char(15) not null ,
    imast_sopcommit float not null ,
    imast_sopgfs float not null ,
    imast_sopalloc float not null ,
    imast_cost float not null ,
    imast_cmt char(1) not null ,
    imast_sttype char(5) not null ,
    imast_sergroup char(6) not null ,
    imast_serlast char(15) not null ,
    imast_lives integer not null ,
    imast_issper integer not null ,
    imast_useper float not null ,
    imast_useunit char(1) not null ,
    imast_pictime float not null ,
    imast_picunit char(1) not null ,
    imast_inspect char(1) not null ,
    imast_bomfeat char(1) not null ,
    imast_kitlist char(1) not null ,
    imast_weight float not null ,
    imast_dimstd char(20) not null ,
    imast_commodity char(8) not null ,
    imast_sopmps char(1) not null ,
    imast_dayormth char(1) not null ,
    imast_nodaymth integer not null ,
    imast_extmpsqty float not null ,
    imast_family char(1) not null ,
    imast_ftfadj integer not null ,
    imast_nvdoc char(1) not null ,
    imast_wbench char(1) not null ,
    imast_mpsgroup char(5) not null ,
    imast_commcd2 char(1) not null ,
    imast_ptfadj integer not null ,
    imast_minordqty float not null ,
    imast_incordqty float not null ,
    imast_calcadate char(1) not null ,
    imast_leadtadj integer not null ,
    imast_servittyp char(15) not null ,
    imast_spectype char(5) not null ,
    imast_itemtype1 char(15) not null ,
    imast_reptype char(30) not null ,
    imast_template char(15) not null ,
    imast_certify char(1) not null ,
    imast_sitem char(15) not null ,
    imast_servchcod char(6) not null ,
    imast_servcat char(1) not null ,
    imast_bbop char(15) not null ,
    imast_volume float not null ,
    imast_cmpuseana char(1) not null ,
    imast_simulated char(1) not null ,
    imast_uzcompmat char(20) 
        default ' ' not null ,
    imast_uzstkprov integer not null 
  );
revoke all on "maxmast".imast from "public";

create unique index "maxmast".imast_item on "maxmast".imast (imast_item);
    
create index "maxmast".imast_desckey on "maxmast".imast (imast_desckey);
    
create unique index "maxmast".imast_mpsgr_key on "maxmast".imast 
    (imast_mpsgroup,imast_item);
create unique index "maxmast".imast_key1 on "maxmast".imast (imast_sitem,
    imast_item);
create unique index "maxmast".imast_bbopkey on "maxmast".imast 
    (imast_bbop,imast_item);
{ TABLE "maxmast".uzfsc row size = 104 number of columns = 10 index size = 40 }
{ unload file name = uzfsc00743.unl number of rows = 308 }

create table "maxmast".uzfsc 
  (
    uzfsc_item char(15) not null ,
    uzfsc_descext char(33) not null ,
    uzfsc_desckey char(8) not null ,
    uzfsc_opbal float not null ,
    uzfsc_issues float not null ,
    uzfsc_receipts float not null ,
    uzfsc_adjust float not null ,
    uzfsc_clbal float not null ,
    uzfsc_fromdate date not null ,
    uzfsc_todate date not null 
  );
revoke all on "maxmast".uzfsc from "public";

create unique index "maxmast".uzfsc_key on "maxmast".uzfsc (uzfsc_desckey,
    uzfsc_item);
{ TABLE "maxmast".uzuom row size = 33 number of columns = 4 index size = 13 }
{ unload file name = uzuom00744.unl number of rows = 0 }

create table "maxmast".uzuom 
  (
    uzuom_fromuom char(5) not null ,
    uzuom_touom char(5) not null ,
    uzuom_convert float not null ,
    uzuom_desc char(15) not null 
  );
revoke all on "maxmast".uzuom from "public";

create index "maxmast".uzuom_idx1 on "maxmast".uzuom (uzuom_fromuom);
    
{ TABLE "maxmast".uzmford row size = 445 number of columns = 51 index size = 208 
              }
{ unload file name = uzmfo00746.unl number of rows = 0 }

create table "maxmast".uzmford 
  (
    uzmf_orderno char(10) not null ,
    uzmf_duedate date not null ,
    uzmf_dueqty float not null ,
    uzmf_revdue date not null ,
    uzmf_qtyscrap float not null ,
    uzmf_qtyrcvd float not null ,
    uzmf_item char(15) not null ,
    uzmf_revqty float not null ,
    uzmf_completed char(1) not null ,
    uzmf_remarks char(66) not null ,
    uzmf_manfac char(5) not null ,
    uzmf_scrappc float not null ,
    uzmf_lud date not null ,
    uzmf_lui char(10) not null ,
    uzmf_delstore char(5) not null ,
    uzmf_delacct char(5) not null ,
    uzmf_scrstore char(5) not null ,
    uzmf_scracct char(5) not null ,
    uzmf_released char(1) not null ,
    uzmf_stage char(1) not null ,
    uzmf_reldate date not null ,
    uzmf_startdate date not null ,
    uzmf_priority char(5) not null ,
    uzmf_printdate date not null ,
    uzmf_reprint char(1) not null ,
    uzmf_amendno integer not null ,
    uzmf_drawno char(20) not null ,
    uzmf_drawiss char(3) not null ,
    uzmf_routeid char(5) not null ,
    uzmf_modser char(10) not null ,
    uzmf_premarks char(56) not null ,
    uzmf_rtplanned char(1) not null ,
    uzmf_splitfrom char(10) not null ,
    uzmf_lastop char(5) not null ,
    uzmf_opscrap char(1) not null ,
    uzmf_monord float not null ,
    uzmf_serialop char(5) not null ,
    uzmf_contract char(15) not null ,
    uzmf_conlin integer not null ,
    uzmf_wipscrap float not null ,
    uzmf_lspro integer not null ,
    uzmf_glrefrom char(15) not null ,
    uzmf_glrefto char(15) not null ,
    uzmf_glvarfrom char(15) not null ,
    uzmf_glvarto char(15) not null ,
    uzmf_duetime integer not null ,
    uzmf_negdue integer not null ,
    uzmf_ordnum char(8) not null ,
    uzmf_linnum integer not null ,
    uzmf_pcontrlr char(3) not null ,
    uzmf_actualdte date not null 
  );
revoke all on "maxmast".uzmford from "public";

create unique index "maxmast".uzmf_orderno on "maxmast".uzmford 
    (uzmf_orderno);
create unique index "maxmast".uzmf_date_key on "maxmast".uzmford 
    (uzmf_item,uzmf_duedate,uzmf_orderno);
create unique index "maxmast".uzmf_revkey on "maxmast".uzmford 
    (uzmf_item,uzmf_revdue,uzmf_orderno);
create unique index "maxmast".uzmf_lastdate on "maxmast".uzmford 
    (uzmf_item,uzmf_negdue,uzmf_orderno);
create unique index "maxmast".uzmf_oeordlin on "maxmast".uzmford 
    (uzmf_ordnum,uzmf_linnum,uzmf_orderno);
{ TABLE "maxmast".uzmrcpt row size = 113 number of columns = 17 index size = 255 
              }
{ unload file name = uzmrc00747.unl number of rows = 0 }

create table "maxmast".uzmrcpt 
  (
    uzmr_item char(15) not null ,
    uzmr_duedate date not null ,
    uzmr_dueqty float not null ,
    uzmr_issqty float not null ,
    uzmr_orderno char(10) not null ,
    uzmr_lineno integer not null ,
    uzmr_rqtserial integer not null ,
    uzmr_qfactor float not null ,
    uzmr_opno char(5) not null ,
    uzmr_lud date not null ,
    uzmr_lui char(10) not null ,
    uzmr_abckflush char(1) not null ,
    uzmr_cmpparent char(15) not null ,
    uzmr_ordline integer not null ,
    uzmr_release integer not null ,
    uzmr_indmps char(1) not null ,
    uzmr_osallqty float not null 
  );
revoke all on "maxmast".uzmrcpt from "public";

create index "maxmast".uzmr_orderno on "maxmast".uzmrcpt (uzmr_orderno);
    
create index "maxmast".uzmr_datekey on "maxmast".uzmrcpt (uzmr_item,
    uzmr_duedate);
create unique index "maxmast".uzmr_ordkey on "maxmast".uzmrcpt 
    (uzmr_orderno,uzmr_ordline,uzmr_release,uzmr_lineno);
create unique index "maxmast".uzmr_rqtserial on "maxmast".uzmrcpt 
    (uzmr_rqtserial);
create unique index "maxmast".uzmr_opkey on "maxmast".uzmrcpt 
    (uzmr_orderno,uzmr_opno,uzmr_ordline,uzmr_release,uzmr_lineno);
    
create unique index "maxmast".uzmr_orditem on "maxmast".uzmrcpt 
    (uzmr_orderno,uzmr_ordline,uzmr_release,uzmr_item,uzmr_lineno);
    
create unique index "maxmast".uzmr_duekey on "maxmast".uzmrcpt 
    (uzmr_item,uzmr_duedate,uzmr_rqtserial);
{ TABLE "maxmast".uzmfop row size = 360 number of columns = 60 index size = 123 }
{ unload file name = uzmfo00748.unl number of rows = 0 }

create table "maxmast".uzmfop 
  (
    uzmfop_orderno char(10) not null ,
    uzmfop_opno char(5) not null ,
    uzmfop_shortdesc char(15) not null ,
    uzmfop_manfac char(5) not null ,
    uzmfop_workcen char(5) not null ,
    uzmfop_settime float not null ,
    uzmfop_setunit char(1) not null ,
    uzmfop_proctime float not null ,
    uzmfop_procunit char(1) not null ,
    uzmfop_qtime float not null ,
    uzmfop_qunit char(1) not null ,
    uzmfop_qoverride char(1) not null ,
    uzmfop_classcode char(5) not null ,
    uzmfop_stage char(1) not null ,
    uzmfop_textref char(10) not null ,
    uzmfop_remarks char(56) not null ,
    uzmfop_lud date not null ,
    uzmfop_lui char(10) not null ,
    uzmfop_preop char(5) not null ,
    uzmfop_nxtop char(5) not null ,
    uzmfop_pdatestrt date not null ,
    uzmfop_ptimestrt integer not null ,
    uzmfop_pdatefin date not null ,
    uzmfop_ptimefin integer not null ,
    uzmfop_sdatestrt date not null ,
    uzmfop_stimestrt integer not null ,
    uzmfop_sdatefin date not null ,
    uzmfop_stimefin integer not null ,
    uzmfop_adatestrt date not null ,
    uzmfop_atimestrt integer not null ,
    uzmfop_adatefin date not null ,
    uzmfop_atimefin integer not null ,
    uzmfop_aworkcen char(5) not null ,
    uzmfop_asettime float not null ,
    uzmfop_asetunit char(1) not null ,
    uzmfop_abproctim float not null ,
    uzmfop_abprcunit char(1) not null ,
    uzmfop_tbq float not null ,
    uzmfop_pbq float not null ,
    uzmfop_mbq float not null ,
    uzmfop_sbq float not null ,
    uzmfop_scrappc float not null ,
    uzmfop_qtygood float not null ,
    uzmfop_qtyscrap float not null ,
    uzmfop_planqty float not null ,
    uzmfop_startqty float not null ,
    uzmfop_schedqty float not null ,
    uzmfop_status char(1) not null ,
    uzmfop_setmiss char(1) not null ,
    uzmfop_backflush char(1) not null ,
    uzmfop_abckflush char(1) not null ,
    uzmfop_currency char(1) not null ,
    uzmfop_seq1 integer not null ,
    uzmfop_seq2 integer not null ,
    uzmfop_seq3 integer not null ,
    uzmfop_seq1a char(5) not null ,
    uzmfop_seq4 integer not null ,
    uzmfop_elaptime float not null ,
    uzmfop_elapunit char(1) not null ,
    uzmfop_despno char(10) not null 
  );
revoke all on "maxmast".uzmfop from "public";

create unique index "maxmast".uzmfop_key on "maxmast".uzmfop (uzmfop_orderno,
    uzmfop_opno);
create index "maxmast".uzmfop_rtcenkey on "maxmast".uzmfop (uzmfop_manfac,
    uzmfop_aworkcen);
create index "maxmast".uzmfop_workkey on "maxmast".uzmfop (uzmfop_manfac,
    uzmfop_aworkcen,uzmfop_seq1,uzmfop_seq1a,uzmfop_seq2,uzmfop_seq3,
    uzmfop_seq4);
create index "maxmast".uzmfop_despno on "maxmast".uzmfop (uzmfop_despno);
    
{ TABLE "maxmast".uzmrqt row size = 61 number of columns = 10 index size = 70 }
{ unload file name = uzmrq00749.unl number of rows = 0 }

create table "maxmast".uzmrqt 
  (
    uzmrqt_rqtserial serial not null ,
    uzmrqt_item char(15) not null ,
    uzmrqt_duedate date not null ,
    uzmrqt_dueqty float not null ,
    uzmrqt_ordserial integer not null ,
    uzmrqt_lineno integer not null ,
    uzmrqt_qfactor float not null ,
    uzmrqt_eqfactor float not null ,
    uzmrqt_opno char(5) not null ,
    uzmrqt_indmps char(1) not null 
  );
revoke all on "maxmast".uzmrqt from "public";

create unique index "maxmast".uzmrqt_rqtserial on "maxmast".uzmrqt 
    (uzmrqt_rqtserial);
create index "maxmast".uzmrqt_ordkey on "maxmast".uzmrqt (uzmrqt_ordserial,
    uzmrqt_lineno);
create unique index "maxmast".uzmrqt_datekey on "maxmast".uzmrqt 
    (uzmrqt_item,uzmrqt_duedate,uzmrqt_rqtserial);
{ TABLE "maxmast".uzmr1for row size = 41 number of columns = 6 index size = 112 }
{ unload file name = uzmr100750.unl number of rows = 0 }

create table "maxmast".uzmr1for 
  (
    uzmr1fo_rqtserial integer not null ,
    uzmr1fo_item char(15) not null ,
    uzmr1fo_ordserial integer not null ,
    uzmr1fo_orderno char(10) not null ,
    uzmr1fo_ordline integer not null ,
    uzmr1fo_release integer not null 
  );
revoke all on "maxmast".uzmr1for from "public";

create unique index "maxmast".uzmr1fo_rqtserial on "maxmast".uzmr1for 
    (uzmr1fo_rqtserial);
create index "maxmast".uzmr1fo_ordserial on "maxmast".uzmr1for 
    (uzmr1fo_ordserial);
create unique index "maxmast".uzmr1fo_ordkey on "maxmast".uzmr1for 
    (uzmr1fo_item,uzmr1fo_rqtserial);
create index "maxmast".uzmr1fo_orderno on "maxmast".uzmr1for (uzmr1fo_orderno);
    
create index "maxmast".uzmr1fo_purkey on "maxmast".uzmr1for (uzmr1fo_orderno,
    uzmr1fo_ordline,uzmr1fo_release);
{ TABLE "maxmast".uzpbrsh row size = 34 number of columns = 3 index size = 0 }
{ unload file name = uzpbr00755.unl number of rows = 2513 }

create table "maxmast".uzpbrsh 
  (
    uzp_printed char(15) not null ,
    uzp_level integer not null ,
    uzp_component char(15) not null 
  );
revoke all on "maxmast".uzpbrsh from "public";

{ TABLE "maxmast".uztemp1 row size = 31 number of columns = 3 index size = 0 }
{ unload file name = uztem00756.unl number of rows = 1654 }

create table "maxmast".uztemp1 
  (
    uzt_item char(15),
    uzt_component char(15),
    uzt_makebuy char(1)
  );
revoke all on "maxmast".uztemp1 from "public";

{ TABLE "maxmast".uzprtop row size = 284 number of columns = 35 index size = 85 }
{ unload file name = uzprt00759.unl number of rows = 12267 }

create table "maxmast".uzprtop 
  (
    uzpr_printed char(15),
    uzpr_level integer,
    uzpr_component char(15),
    uzpr_desckey char(8),
    uzpr_item char(15),
    uzpr_manfac char(5),
    uzpr_routeid char(5),
    uzpr_opno char(5),
    uzpr_ondate date,
    uzpr_intromod char(10),
    uzpr_offdate date,
    uzpr_termod char(10),
    uzpr_shortdesc char(15),
    uzpr_workcen char(5),
    uzpr_settime float,
    uzpr_setunit char(1),
    uzpr_proctime float,
    uzpr_procunit char(1),
    uzpr_qtime float,
    uzpr_qunit char(1),
    uzpr_qoverride char(1),
    uzpr_classcode char(5),
    uzpr_textref char(10),
    uzpr_remarks char(56),
    uzpr_lud date,
    uzpr_lui char(10),
    uzpr_tbq float,
    uzpr_pbq float,
    uzpr_mbq float,
    uzpr_sbq float,
    uzpr_scrappc float,
    uzpr_setmiss char(1),
    uzpr_backflush char(1),
    uzpr_elaptime float,
    uzpr_elapunit char(1)
  );
revoke all on "maxmast".uzprtop from "public";

create index "maxmast".uzpr_key on "maxmast".uzprtop (uzpr_printed,
    uzpr_level,uzpr_component,uzpr_manfac,uzpr_routeid,uzpr_opno,
    uzpr_ondate);
{ TABLE "maxmast".uzpbr row size = 64 number of columns = 8 index size = 28 }
{ unload file name = uzpbr00760.unl number of rows = 4257 }

create table "maxmast".uzpbr 
  (
    uzpbr_item char(15),
    uzpbr_desckey char(8),
    uzpbr_level integer,
    uzpbr_component char(15),
    uzpbr_keyword char(8),
    uzpbr_uom char(5),
    uzpbr_noff float,
    uzpbr_makebuy char(1)
  );
revoke all on "maxmast".uzpbr from "public";

create index "maxmast".uzpbr_idx1 on "maxmast".uzpbr (uzpbr_item);
    
{ TABLE "maxmast".uzptmp row size = 379 number of columns = 52 index size = 0 }
{ unload file name = uzptm00761.unl number of rows = 4257 }

create table "maxmast".uzptmp 
  (
    t0_item char(15),
    t0_desckey char(8),
    t0_uom char(5),
    t0_makebuy char(1),
    t0_level integer,
    t1_item char(15),
    t1_desckey char(8),
    t1_uom char(5),
    t1_noff float,
    t1_makebuy char(1),
    t2_item char(15),
    t2_desckey char(8),
    t2_uom char(5),
    t2_noff float,
    t2_makebuy char(1),
    t3_item char(15),
    t3_desckey char(8),
    t3_uom char(5),
    t3_noff float,
    t3_makebuy char(1),
    t4_item char(15),
    t4_desckey char(8),
    t4_uom char(5),
    t4_noff float,
    t4_makebuy char(1),
    t5_item char(15),
    t5_desckey char(8),
    t5_uom char(5),
    t5_noff float,
    t5_makebuy char(1),
    t6_item char(15),
    t6_desckey char(8),
    t6_uom char(5),
    t6_noff float,
    t6_makebuy char(1),
    t7_item char(15),
    t7_desckey char(8),
    t7_uom char(5),
    t7_noff float,
    t7_makebuy char(1),
    t8_item char(15),
    t8_desckey char(8),
    t8_uom char(5),
    t8_noff float,
    t8_makebuy char(1),
    t9_item char(15),
    t9_desckey char(8),
    t9_uom char(5),
    t9_makebuy char(1),
    t9_noff float,
    t9_noffuom char(5),
    t9_factor float
  );
revoke all on "maxmast".uzptmp from "public";

{ TABLE "maxmast".uzmii row size = 61 number of columns = 8 index size = 28 }
{ unload file name = uzmii00791.unl number of rows = 81 }

create table "maxmast".uzmii 
  (
    uzmii_item char(15),
    uzmii_prodgroup char(5),
    uzmii_detitem char(15),
    uzmii_desckey char(8),
    uzmii_noff float,
    uzmii_noffuom char(5),
    uzmii_level integer,
    uzmii_makebuy char(1)
  );
revoke all on "maxmast".uzmii from "public";

create index "maxmast".uzmii_idx1 on "maxmast".uzmii (uzmii_item);
    
{ TABLE "maxmast".uzshrt row size = 56 number of columns = 7 index size = 0 }
{ unload file name = uzshr00801.unl number of rows = 2429 }

create table "maxmast".uzshrt 
  (
    uzshrt_item char(15) not null ,
    uzshrt_desckey char(8) not null ,
    uzshrt_planner char(5) not null ,
    uzshrt_dueqty float not null ,
    uzshrt_balance float not null ,
    uzshrt_expected float not null ,
    uzshrt_duedate date not null 
  );
revoke all on "maxmast".uzshrt from "public";

{ TABLE "maxmast".uzllc row size = 69 number of columns = 9 index size = 28 }
{ unload file name = uzllc00802.unl number of rows = 93 }

create table "maxmast".uzllc 
  (
    uzllc_item char(15),
    uzllc_prodgroup char(5),
    uzllc_detitem char(15),
    uzllc_desckey char(8),
    uzllc_noff float,
    uzllc_noffuom char(5),
    uzllc_wastepc float,
    uzllc_level integer,
    uzllc_makebuy char(1)
  );
revoke all on "maxmast".uzllc from "public";

create index "maxmast".uzllc_idx1 on "maxmast".uzllc (uzllc_item);
    
{ TABLE "maxmast".pl_ext row size = 45 number of columns = 6 index size = 18 }
{ unload file name = pl_ex00807.unl number of rows = 167 }

create table "maxmast".pl_ext 
  (
    plx_supplier char(8),
    plx_currency char(5),
    plx_currval float,
    plx_baseval float,
    plx_currplt float,
    plx_baseplt float
  );
revoke all on "maxmast".pl_ext from "public";

create index "maxmast".plx_idx1 on "maxmast".pl_ext (plx_supplier);
    
{ TABLE "maxmast".resplna row size = 52 number of columns = 8 index size = 85 }
{ unload file name = respl00808.unl number of rows = 2791178 }

create table "maxmast".resplna 
  (
    rpa_item char(15),
    rpa_duedate date,
    rpa_dueqty integer,
    rpa_type integer,
    rpa_wordno char(10),
    rpa_acc char(10),
    rpa_snpshtdate date,
    rpa_makebuy char(1)
  );
revoke all on "maxmast".resplna from "public";

create index "maxmast".x_acc on "maxmast".resplna (rpa_acc);
create index "maxmast".x_duedate on "maxmast".resplna (rpa_duedate);
    
create index "maxmast".x_item2 on "maxmast".resplna (rpa_item);
    
create index "maxmast".x_snpshtdate on "maxmast".resplna (rpa_snpshtdate);
    
create index "maxmast".x_type on "maxmast".resplna (rpa_type);
    


grant select on "maxmast".al to "public" as "maxmast";
grant update on "maxmast".al to "public" as "maxmast";
grant insert on "maxmast".al to "public" as "maxmast";
grant delete on "maxmast".al to "public" as "maxmast";
grant index on "maxmast".al to "public" as "maxmast";
grant select on "maxmast".amana to "public" as "maxmast";
grant update on "maxmast".amana to "public" as "maxmast";
grant insert on "maxmast".amana to "public" as "maxmast";
grant delete on "maxmast".amana to "public" as "maxmast";
grant index on "maxmast".amana to "public" as "maxmast";
grant select on "maxmast".amcds to "public" as "maxmast";
grant update on "maxmast".amcds to "public" as "maxmast";
grant insert on "maxmast".amcds to "public" as "maxmast";
grant delete on "maxmast".amcds to "public" as "maxmast";
grant index on "maxmast".amcds to "public" as "maxmast";
grant select on "maxmast".amcln to "public" as "maxmast";
grant update on "maxmast".amcln to "public" as "maxmast";
grant insert on "maxmast".amcln to "public" as "maxmast";
grant delete on "maxmast".amcln to "public" as "maxmast";
grant index on "maxmast".amcln to "public" as "maxmast";
grant select on "maxmast".amcum to "public" as "maxmast";
grant update on "maxmast".amcum to "public" as "maxmast";
grant insert on "maxmast".amcum to "public" as "maxmast";
grant delete on "maxmast".amcum to "public" as "maxmast";
grant index on "maxmast".amcum to "public" as "maxmast";
grant select on "maxmast".amhst to "public" as "maxmast";
grant update on "maxmast".amhst to "public" as "maxmast";
grant insert on "maxmast".amhst to "public" as "maxmast";
grant delete on "maxmast".amhst to "public" as "maxmast";
grant index on "maxmast".amhst to "public" as "maxmast";
grant select on "maxmast".aphdr to "public" as "maxmast";
grant update on "maxmast".aphdr to "public" as "maxmast";
grant insert on "maxmast".aphdr to "public" as "maxmast";
grant delete on "maxmast".aphdr to "public" as "maxmast";
grant index on "maxmast".aphdr to "public" as "maxmast";
grant select on "maxmast".appcodes to "public" as "maxmast";
grant update on "maxmast".appcodes to "public" as "maxmast";
grant insert on "maxmast".appcodes to "public" as "maxmast";
grant delete on "maxmast".appcodes to "public" as "maxmast";
grant index on "maxmast".appcodes to "public" as "maxmast";
grant select on "maxmast".aprun to "public" as "maxmast";
grant update on "maxmast".aprun to "public" as "maxmast";
grant insert on "maxmast".aprun to "public" as "maxmast";
grant delete on "maxmast".aprun to "public" as "maxmast";
grant index on "maxmast".aprun to "public" as "maxmast";
grant select on "maxmast".apsql to "public" as "maxmast";
grant update on "maxmast".apsql to "public" as "maxmast";
grant insert on "maxmast".apsql to "public" as "maxmast";
grant delete on "maxmast".apsql to "public" as "maxmast";
grant index on "maxmast".apsql to "public" as "maxmast";
grant select on "maxmast".aptab to "public" as "maxmast";
grant update on "maxmast".aptab to "public" as "maxmast";
grant insert on "maxmast".aptab to "public" as "maxmast";
grant delete on "maxmast".aptab to "public" as "maxmast";
grant index on "maxmast".aptab to "public" as "maxmast";
grant select on "maxmast".arcca to "public" as "maxmast";
grant update on "maxmast".arcca to "public" as "maxmast";
grant insert on "maxmast".arcca to "public" as "maxmast";
grant delete on "maxmast".arcca to "public" as "maxmast";
grant index on "maxmast".arcca to "public" as "maxmast";
grant select on "maxmast".arelt to "public" as "maxmast";
grant update on "maxmast".arelt to "public" as "maxmast";
grant insert on "maxmast".arelt to "public" as "maxmast";
grant delete on "maxmast".arelt to "public" as "maxmast";
grant index on "maxmast".arelt to "public" as "maxmast";
grant select on "maxmast".arprod to "public" as "maxmast";
grant update on "maxmast".arprod to "public" as "maxmast";
grant insert on "maxmast".arprod to "public" as "maxmast";
grant delete on "maxmast".arprod to "public" as "maxmast";
grant index on "maxmast".arprod to "public" as "maxmast";
grant select on "maxmast".artable to "public" as "maxmast";
grant update on "maxmast".artable to "public" as "maxmast";
grant insert on "maxmast".artable to "public" as "maxmast";
grant delete on "maxmast".artable to "public" as "maxmast";
grant index on "maxmast".artable to "public" as "maxmast";
grant select on "maxmast".bkcheq to "public" as "maxmast";
grant update on "maxmast".bkcheq to "public" as "maxmast";
grant insert on "maxmast".bkcheq to "public" as "maxmast";
grant delete on "maxmast".bkcheq to "public" as "maxmast";
grant index on "maxmast".bkcheq to "public" as "maxmast";
grant select on "maxmast".bkpara to "public" as "maxmast";
grant update on "maxmast".bkpara to "public" as "maxmast";
grant insert on "maxmast".bkpara to "public" as "maxmast";
grant delete on "maxmast".bkpara to "public" as "maxmast";
grant index on "maxmast".bkpara to "public" as "maxmast";
grant select on "maxmast".bkstat to "public" as "maxmast";
grant update on "maxmast".bkstat to "public" as "maxmast";
grant insert on "maxmast".bkstat to "public" as "maxmast";
grant delete on "maxmast".bkstat to "public" as "maxmast";
grant index on "maxmast".bkstat to "public" as "maxmast";
grant select on "maxmast".ccmas to "public" as "maxmast";
grant update on "maxmast".ccmas to "public" as "maxmast";
grant insert on "maxmast".ccmas to "public" as "maxmast";
grant delete on "maxmast".ccmas to "public" as "maxmast";
grant index on "maxmast".ccmas to "public" as "maxmast";
grant select on "maxmast".ccost to "public" as "maxmast";
grant update on "maxmast".ccost to "public" as "maxmast";
grant insert on "maxmast".ccost to "public" as "maxmast";
grant delete on "maxmast".ccost to "public" as "maxmast";
grant index on "maxmast".ccost to "public" as "maxmast";
grant select on "maxmast".ccpara to "public" as "maxmast";
grant update on "maxmast".ccpara to "public" as "maxmast";
grant insert on "maxmast".ccpara to "public" as "maxmast";
grant delete on "maxmast".ccpara to "public" as "maxmast";
grant index on "maxmast".ccpara to "public" as "maxmast";
grant select on "maxmast".cctcode to "public" as "maxmast";
grant update on "maxmast".cctcode to "public" as "maxmast";
grant insert on "maxmast".cctcode to "public" as "maxmast";
grant delete on "maxmast".cctcode to "public" as "maxmast";
grant index on "maxmast".cctcode to "public" as "maxmast";
grant select on "maxmast".cctran to "public" as "maxmast";
grant update on "maxmast".cctran to "public" as "maxmast";
grant insert on "maxmast".cctran to "public" as "maxmast";
grant delete on "maxmast".cctran to "public" as "maxmast";
grant index on "maxmast".cctran to "public" as "maxmast";
grant select on "maxmast".ccwt to "public" as "maxmast";
grant update on "maxmast".ccwt to "public" as "maxmast";
grant insert on "maxmast".ccwt to "public" as "maxmast";
grant delete on "maxmast".ccwt to "public" as "maxmast";
grant index on "maxmast".ccwt to "public" as "maxmast";
grant select on "maxmast".cheader to "public" as "maxmast";
grant update on "maxmast".cheader to "public" as "maxmast";
grant insert on "maxmast".cheader to "public" as "maxmast";
grant delete on "maxmast".cheader to "public" as "maxmast";
grant index on "maxmast".cheader to "public" as "maxmast";
grant select on "maxmast".cobgt to "public" as "maxmast";
grant update on "maxmast".cobgt to "public" as "maxmast";
grant insert on "maxmast".cobgt to "public" as "maxmast";
grant delete on "maxmast".cobgt to "public" as "maxmast";
grant index on "maxmast".cobgt to "public" as "maxmast";
grant select on "maxmast".cocds to "public" as "maxmast";
grant update on "maxmast".cocds to "public" as "maxmast";
grant insert on "maxmast".cocds to "public" as "maxmast";
grant delete on "maxmast".cocds to "public" as "maxmast";
grant index on "maxmast".cocds to "public" as "maxmast";
grant select on "maxmast".coesc to "public" as "maxmast";
grant update on "maxmast".coesc to "public" as "maxmast";
grant insert on "maxmast".coesc to "public" as "maxmast";
grant delete on "maxmast".coesc to "public" as "maxmast";
grant index on "maxmast".coesc to "public" as "maxmast";
grant select on "maxmast".cohdr to "public" as "maxmast";
grant update on "maxmast".cohdr to "public" as "maxmast";
grant insert on "maxmast".cohdr to "public" as "maxmast";
grant delete on "maxmast".cohdr to "public" as "maxmast";
grant index on "maxmast".cohdr to "public" as "maxmast";
grant select on "maxmast".colin to "public" as "maxmast";
grant update on "maxmast".colin to "public" as "maxmast";
grant insert on "maxmast".colin to "public" as "maxmast";
grant delete on "maxmast".colin to "public" as "maxmast";
grant index on "maxmast".colin to "public" as "maxmast";
grant select on "maxmast".company to "public" as "maxmast";
grant update on "maxmast".company to "public" as "maxmast";
grant insert on "maxmast".company to "public" as "maxmast";
grant delete on "maxmast".company to "public" as "maxmast";
grant index on "maxmast".company to "public" as "maxmast";
grant select on "maxmast".compkey to "public" as "maxmast";
grant update on "maxmast".compkey to "public" as "maxmast";
grant insert on "maxmast".compkey to "public" as "maxmast";
grant delete on "maxmast".compkey to "public" as "maxmast";
grant index on "maxmast".compkey to "public" as "maxmast";
grant select on "maxmast".coqtn to "public" as "maxmast";
grant update on "maxmast".coqtn to "public" as "maxmast";
grant insert on "maxmast".coqtn to "public" as "maxmast";
grant delete on "maxmast".coqtn to "public" as "maxmast";
grant index on "maxmast".coqtn to "public" as "maxmast";
grant select on "maxmast".cost_int to "public" as "maxmast";
grant update on "maxmast".cost_int to "public" as "maxmast";
grant insert on "maxmast".cost_int to "public" as "maxmast";
grant delete on "maxmast".cost_int to "public" as "maxmast";
grant index on "maxmast".cost_int to "public" as "maxmast";
grant select on "maxmast".cotrd to "public" as "maxmast";
grant update on "maxmast".cotrd to "public" as "maxmast";
grant insert on "maxmast".cotrd to "public" as "maxmast";
grant delete on "maxmast".cotrd to "public" as "maxmast";
grant index on "maxmast".cotrd to "public" as "maxmast";
grant select on "maxmast".cotrn to "public" as "maxmast";
grant update on "maxmast".cotrn to "public" as "maxmast";
grant insert on "maxmast".cotrn to "public" as "maxmast";
grant delete on "maxmast".cotrn to "public" as "maxmast";
grant index on "maxmast".cotrn to "public" as "maxmast";
grant select on "maxmast".crest to "public" as "maxmast";
grant update on "maxmast".crest to "public" as "maxmast";
grant insert on "maxmast".crest to "public" as "maxmast";
grant delete on "maxmast".crest to "public" as "maxmast";
grant index on "maxmast".crest to "public" as "maxmast";
grant select on "maxmast".crfrm to "public" as "maxmast";
grant update on "maxmast".crfrm to "public" as "maxmast";
grant insert on "maxmast".crfrm to "public" as "maxmast";
grant delete on "maxmast".crfrm to "public" as "maxmast";
grant index on "maxmast".crfrm to "public" as "maxmast";
grant select on "maxmast".crmps to "public" as "maxmast";
grant update on "maxmast".crmps to "public" as "maxmast";
grant insert on "maxmast".crmps to "public" as "maxmast";
grant delete on "maxmast".crmps to "public" as "maxmast";
grant index on "maxmast".crmps to "public" as "maxmast";
grant select on "maxmast".crpar to "public" as "maxmast";
grant update on "maxmast".crpar to "public" as "maxmast";
grant insert on "maxmast".crpar to "public" as "maxmast";
grant delete on "maxmast".crpar to "public" as "maxmast";
grant index on "maxmast".crpar to "public" as "maxmast";
grant select on "maxmast".crrec to "public" as "maxmast";
grant update on "maxmast".crrec to "public" as "maxmast";
grant insert on "maxmast".crrec to "public" as "maxmast";
grant delete on "maxmast".crrec to "public" as "maxmast";
grant index on "maxmast".crrec to "public" as "maxmast";
grant select on "maxmast".crrel to "public" as "maxmast";
grant update on "maxmast".crrel to "public" as "maxmast";
grant insert on "maxmast".crrel to "public" as "maxmast";
grant delete on "maxmast".crrel to "public" as "maxmast";
grant index on "maxmast".crrel to "public" as "maxmast";
grant select on "maxmast".crsop to "public" as "maxmast";
grant update on "maxmast".crsop to "public" as "maxmast";
grant insert on "maxmast".crsop to "public" as "maxmast";
grant delete on "maxmast".crsop to "public" as "maxmast";
grant index on "maxmast".crsop to "public" as "maxmast";
grant select on "maxmast".crsum to "public" as "maxmast";
grant update on "maxmast".crsum to "public" as "maxmast";
grant insert on "maxmast".crsum to "public" as "maxmast";
grant delete on "maxmast".crsum to "public" as "maxmast";
grant index on "maxmast".crsum to "public" as "maxmast";
grant select on "maxmast".crtrc to "public" as "maxmast";
grant update on "maxmast".crtrc to "public" as "maxmast";
grant insert on "maxmast".crtrc to "public" as "maxmast";
grant delete on "maxmast".crtrc to "public" as "maxmast";
grant index on "maxmast".crtrc to "public" as "maxmast";
grant select on "maxmast".crtri to "public" as "maxmast";
grant update on "maxmast".crtri to "public" as "maxmast";
grant insert on "maxmast".crtri to "public" as "maxmast";
grant delete on "maxmast".crtri to "public" as "maxmast";
grant index on "maxmast".crtri to "public" as "maxmast";
grant select on "maxmast".cuhst to "public" as "maxmast";
grant update on "maxmast".cuhst to "public" as "maxmast";
grant insert on "maxmast".cuhst to "public" as "maxmast";
grant delete on "maxmast".cuhst to "public" as "maxmast";
grant index on "maxmast".cuhst to "public" as "maxmast";
grant select on "maxmast".curate to "public" as "maxmast";
grant update on "maxmast".curate to "public" as "maxmast";
grant insert on "maxmast".curate to "public" as "maxmast";
grant delete on "maxmast".curate to "public" as "maxmast";
grant index on "maxmast".curate to "public" as "maxmast";
grant select on "maxmast".cutran to "public" as "maxmast";
grant update on "maxmast".cutran to "public" as "maxmast";
grant insert on "maxmast".cutran to "public" as "maxmast";
grant delete on "maxmast".cutran to "public" as "maxmast";
grant index on "maxmast".cutran to "public" as "maxmast";
grant select on "maxmast".cutrn to "public" as "maxmast";
grant update on "maxmast".cutrn to "public" as "maxmast";
grant insert on "maxmast".cutrn to "public" as "maxmast";
grant delete on "maxmast".cutrn to "public" as "maxmast";
grant index on "maxmast".cutrn to "public" as "maxmast";
grant select on "maxmast".cymas to "public" as "maxmast";
grant update on "maxmast".cymas to "public" as "maxmast";
grant insert on "maxmast".cymas to "public" as "maxmast";
grant delete on "maxmast".cymas to "public" as "maxmast";
grant index on "maxmast".cymas to "public" as "maxmast";
grant select on "maxmast".dfqt to "public" as "maxmast";
grant update on "maxmast".dfqt to "public" as "maxmast";
grant insert on "maxmast".dfqt to "public" as "maxmast";
grant delete on "maxmast".dfqt to "public" as "maxmast";
grant index on "maxmast".dfqt to "public" as "maxmast";
grant select on "maxmast".dicla to "public" as "maxmast";
grant update on "maxmast".dicla to "public" as "maxmast";
grant insert on "maxmast".dicla to "public" as "maxmast";
grant delete on "maxmast".dicla to "public" as "maxmast";
grant index on "maxmast".dicla to "public" as "maxmast";
grant select on "maxmast".difac to "public" as "maxmast";
grant update on "maxmast".difac to "public" as "maxmast";
grant insert on "maxmast".difac to "public" as "maxmast";
grant delete on "maxmast".difac to "public" as "maxmast";
grant index on "maxmast".difac to "public" as "maxmast";
grant select on "maxmast".difpr to "public" as "maxmast";
grant update on "maxmast".difpr to "public" as "maxmast";
grant insert on "maxmast".difpr to "public" as "maxmast";
grant delete on "maxmast".difpr to "public" as "maxmast";
grant index on "maxmast".difpr to "public" as "maxmast";
grant select on "maxmast".difrc to "public" as "maxmast";
grant update on "maxmast".difrc to "public" as "maxmast";
grant insert on "maxmast".difrc to "public" as "maxmast";
grant delete on "maxmast".difrc to "public" as "maxmast";
grant index on "maxmast".difrc to "public" as "maxmast";
grant select on "maxmast".dilev to "public" as "maxmast";
grant update on "maxmast".dilev to "public" as "maxmast";
grant insert on "maxmast".dilev to "public" as "maxmast";
grant delete on "maxmast".dilev to "public" as "maxmast";
grant index on "maxmast".dilev to "public" as "maxmast";
grant select on "maxmast".diord to "public" as "maxmast";
grant update on "maxmast".diord to "public" as "maxmast";
grant insert on "maxmast".diord to "public" as "maxmast";
grant delete on "maxmast".diord to "public" as "maxmast";
grant index on "maxmast".diord to "public" as "maxmast";
grant select on "maxmast".direp to "public" as "maxmast";
grant update on "maxmast".direp to "public" as "maxmast";
grant insert on "maxmast".direp to "public" as "maxmast";
grant delete on "maxmast".direp to "public" as "maxmast";
grant index on "maxmast".direp to "public" as "maxmast";
grant select on "maxmast".disch to "public" as "maxmast";
grant update on "maxmast".disch to "public" as "maxmast";
grant insert on "maxmast".disch to "public" as "maxmast";
grant delete on "maxmast".disch to "public" as "maxmast";
grant index on "maxmast".disch to "public" as "maxmast";
grant select on "maxmast".disea to "public" as "maxmast";
grant update on "maxmast".disea to "public" as "maxmast";
grant insert on "maxmast".disea to "public" as "maxmast";
grant delete on "maxmast".disea to "public" as "maxmast";
grant index on "maxmast".disea to "public" as "maxmast";
grant select on "maxmast".disto to "public" as "maxmast";
grant update on "maxmast".disto to "public" as "maxmast";
grant insert on "maxmast".disto to "public" as "maxmast";
grant delete on "maxmast".disto to "public" as "maxmast";
grant index on "maxmast".disto to "public" as "maxmast";
grant select on "maxmast".dorou to "public" as "maxmast";
grant update on "maxmast".dorou to "public" as "maxmast";
grant insert on "maxmast".dorou to "public" as "maxmast";
grant delete on "maxmast".dorou to "public" as "maxmast";
grant index on "maxmast".dorou to "public" as "maxmast";
grant select on "maxmast".dtdef to "public" as "maxmast";
grant update on "maxmast".dtdef to "public" as "maxmast";
grant insert on "maxmast".dtdef to "public" as "maxmast";
grant delete on "maxmast".dtdef to "public" as "maxmast";
grant index on "maxmast".dtdef to "public" as "maxmast";
grant select on "maxmast".ecbst to "public" as "maxmast";
grant update on "maxmast".ecbst to "public" as "maxmast";
grant insert on "maxmast".ecbst to "public" as "maxmast";
grant delete on "maxmast".ecbst to "public" as "maxmast";
grant index on "maxmast".ecbst to "public" as "maxmast";
grant select on "maxmast".ecdes to "public" as "maxmast";
grant update on "maxmast".ecdes to "public" as "maxmast";
grant insert on "maxmast".ecdes to "public" as "maxmast";
grant delete on "maxmast".ecdes to "public" as "maxmast";
grant index on "maxmast".ecdes to "public" as "maxmast";
grant select on "maxmast".ecgrp to "public" as "maxmast";
grant update on "maxmast".ecgrp to "public" as "maxmast";
grant insert on "maxmast".ecgrp to "public" as "maxmast";
grant delete on "maxmast".ecgrp to "public" as "maxmast";
grant index on "maxmast".ecgrp to "public" as "maxmast";
grant select on "maxmast".edida to "public" as "maxmast";
grant update on "maxmast".edida to "public" as "maxmast";
grant insert on "maxmast".edida to "public" as "maxmast";
grant delete on "maxmast".edida to "public" as "maxmast";
grant index on "maxmast".edida to "public" as "maxmast";
grant select on "maxmast".edipo to "public" as "maxmast";
grant update on "maxmast".edipo to "public" as "maxmast";
grant insert on "maxmast".edipo to "public" as "maxmast";
grant delete on "maxmast".edipo to "public" as "maxmast";
grant index on "maxmast".edipo to "public" as "maxmast";
grant select on "maxmast".emod to "public" as "maxmast";
grant update on "maxmast".emod to "public" as "maxmast";
grant insert on "maxmast".emod to "public" as "maxmast";
grant delete on "maxmast".emod to "public" as "maxmast";
grant index on "maxmast".emod to "public" as "maxmast";
grant select on "maxmast".errlog to "public" as "maxmast";
grant update on "maxmast".errlog to "public" as "maxmast";
grant insert on "maxmast".errlog to "public" as "maxmast";
grant delete on "maxmast".errlog to "public" as "maxmast";
grant index on "maxmast".errlog to "public" as "maxmast";
grant select on "maxmast".ffield to "public" as "maxmast";
grant update on "maxmast".ffield to "public" as "maxmast";
grant insert on "maxmast".ffield to "public" as "maxmast";
grant delete on "maxmast".ffield to "public" as "maxmast";
grant index on "maxmast".ffield to "public" as "maxmast";
grant select on "maxmast".glavc to "public" as "maxmast";
grant update on "maxmast".glavc to "public" as "maxmast";
grant insert on "maxmast".glavc to "public" as "maxmast";
grant delete on "maxmast".glavc to "public" as "maxmast";
grant index on "maxmast".glavc to "public" as "maxmast";
grant select on "maxmast".glavn to "public" as "maxmast";
grant update on "maxmast".glavn to "public" as "maxmast";
grant insert on "maxmast".glavn to "public" as "maxmast";
grant delete on "maxmast".glavn to "public" as "maxmast";
grant index on "maxmast".glavn to "public" as "maxmast";
grant select on "maxmast".glbdg to "public" as "maxmast";
grant update on "maxmast".glbdg to "public" as "maxmast";
grant insert on "maxmast".glbdg to "public" as "maxmast";
grant delete on "maxmast".glbdg to "public" as "maxmast";
grant index on "maxmast".glbdg to "public" as "maxmast";
grant select on "maxmast".glbran to "public" as "maxmast";
grant update on "maxmast".glbran to "public" as "maxmast";
grant insert on "maxmast".glbran to "public" as "maxmast";
grant delete on "maxmast".glbran to "public" as "maxmast";
grant index on "maxmast".glbran to "public" as "maxmast";
grant select on "maxmast".glbudg to "public" as "maxmast";
grant update on "maxmast".glbudg to "public" as "maxmast";
grant insert on "maxmast".glbudg to "public" as "maxmast";
grant delete on "maxmast".glbudg to "public" as "maxmast";
grant index on "maxmast".glbudg to "public" as "maxmast";
grant select on "maxmast".glbun to "public" as "maxmast";
grant update on "maxmast".glbun to "public" as "maxmast";
grant insert on "maxmast".glbun to "public" as "maxmast";
grant delete on "maxmast".glbun to "public" as "maxmast";
grant index on "maxmast".glbun to "public" as "maxmast";
grant select on "maxmast".glpers to "public" as "maxmast";
grant update on "maxmast".glpers to "public" as "maxmast";
grant insert on "maxmast".glpers to "public" as "maxmast";
grant delete on "maxmast".glpers to "public" as "maxmast";
grant index on "maxmast".glpers to "public" as "maxmast";
grant select on "maxmast".glrac to "public" as "maxmast";
grant update on "maxmast".glrac to "public" as "maxmast";
grant insert on "maxmast".glrac to "public" as "maxmast";
grant delete on "maxmast".glrac to "public" as "maxmast";
grant index on "maxmast".glrac to "public" as "maxmast";
grant select on "maxmast".glrad to "public" as "maxmast";
grant update on "maxmast".glrad to "public" as "maxmast";
grant insert on "maxmast".glrad to "public" as "maxmast";
grant delete on "maxmast".glrad to "public" as "maxmast";
grant index on "maxmast".glrad to "public" as "maxmast";
grant select on "maxmast".glrco to "public" as "maxmast";
grant update on "maxmast".glrco to "public" as "maxmast";
grant insert on "maxmast".glrco to "public" as "maxmast";
grant delete on "maxmast".glrco to "public" as "maxmast";
grant index on "maxmast".glrco to "public" as "maxmast";
grant select on "maxmast".glrde to "public" as "maxmast";
grant update on "maxmast".glrde to "public" as "maxmast";
grant insert on "maxmast".glrde to "public" as "maxmast";
grant delete on "maxmast".glrde to "public" as "maxmast";
grant index on "maxmast".glrde to "public" as "maxmast";
grant select on "maxmast".glrhc to "public" as "maxmast";
grant update on "maxmast".glrhc to "public" as "maxmast";
grant insert on "maxmast".glrhc to "public" as "maxmast";
grant delete on "maxmast".glrhc to "public" as "maxmast";
grant index on "maxmast".glrhc to "public" as "maxmast";
grant select on "maxmast".glrli to "public" as "maxmast";
grant update on "maxmast".glrli to "public" as "maxmast";
grant insert on "maxmast".glrli to "public" as "maxmast";
grant delete on "maxmast".glrli to "public" as "maxmast";
grant index on "maxmast".glrli to "public" as "maxmast";
grant select on "maxmast".glrto to "public" as "maxmast";
grant update on "maxmast".glrto to "public" as "maxmast";
grant insert on "maxmast".glrto to "public" as "maxmast";
grant delete on "maxmast".glrto to "public" as "maxmast";
grant index on "maxmast".glrto to "public" as "maxmast";
grant select on "maxmast".glstat to "public" as "maxmast";
grant update on "maxmast".glstat to "public" as "maxmast";
grant insert on "maxmast".glstat to "public" as "maxmast";
grant delete on "maxmast".glstat to "public" as "maxmast";
grant index on "maxmast".glstat to "public" as "maxmast";
grant select on "maxmast".graph to "public" as "maxmast";
grant update on "maxmast".graph to "public" as "maxmast";
grant insert on "maxmast".graph to "public" as "maxmast";
grant delete on "maxmast".graph to "public" as "maxmast";
grant index on "maxmast".graph to "public" as "maxmast";
grant select on "maxmast".imacc to "public" as "maxmast";
grant update on "maxmast".imacc to "public" as "maxmast";
grant insert on "maxmast".imacc to "public" as "maxmast";
grant delete on "maxmast".imacc to "public" as "maxmast";
grant index on "maxmast".imacc to "public" as "maxmast";
grant select on "maxmast".imcat to "public" as "maxmast";
grant update on "maxmast".imcat to "public" as "maxmast";
grant insert on "maxmast".imcat to "public" as "maxmast";
grant delete on "maxmast".imcat to "public" as "maxmast";
grant index on "maxmast".imcat to "public" as "maxmast";
grant select on "maxmast".imcen to "public" as "maxmast";
grant update on "maxmast".imcen to "public" as "maxmast";
grant insert on "maxmast".imcen to "public" as "maxmast";
grant delete on "maxmast".imcen to "public" as "maxmast";
grant index on "maxmast".imcen to "public" as "maxmast";
grant select on "maxmast".imcsr to "public" as "maxmast";
grant update on "maxmast".imcsr to "public" as "maxmast";
grant insert on "maxmast".imcsr to "public" as "maxmast";
grant delete on "maxmast".imcsr to "public" as "maxmast";
grant index on "maxmast".imcsr to "public" as "maxmast";
grant select on "maxmast".imcst to "public" as "maxmast";
grant update on "maxmast".imcst to "public" as "maxmast";
grant insert on "maxmast".imcst to "public" as "maxmast";
grant delete on "maxmast".imcst to "public" as "maxmast";
grant index on "maxmast".imcst to "public" as "maxmast";
grant select on "maxmast".imctp to "public" as "maxmast";
grant update on "maxmast".imctp to "public" as "maxmast";
grant insert on "maxmast".imctp to "public" as "maxmast";
grant delete on "maxmast".imctp to "public" as "maxmast";
grant index on "maxmast".imctp to "public" as "maxmast";
grant select on "maxmast".imctr to "public" as "maxmast";
grant update on "maxmast".imctr to "public" as "maxmast";
grant insert on "maxmast".imctr to "public" as "maxmast";
grant delete on "maxmast".imctr to "public" as "maxmast";
grant index on "maxmast".imctr to "public" as "maxmast";
grant select on "maxmast".imdes to "public" as "maxmast";
grant update on "maxmast".imdes to "public" as "maxmast";
grant insert on "maxmast".imdes to "public" as "maxmast";
grant delete on "maxmast".imdes to "public" as "maxmast";
grant index on "maxmast".imdes to "public" as "maxmast";
grant select on "maxmast".imsu to "public" as "maxmast";
grant update on "maxmast".imsu to "public" as "maxmast";
grant insert on "maxmast".imsu to "public" as "maxmast";
grant delete on "maxmast".imsu to "public" as "maxmast";
grant index on "maxmast".imsu to "public" as "maxmast";
grant select on "maxmast".imsur to "public" as "maxmast";
grant update on "maxmast".imsur to "public" as "maxmast";
grant insert on "maxmast".imsur to "public" as "maxmast";
grant delete on "maxmast".imsur to "public" as "maxmast";
grant index on "maxmast".imsur to "public" as "maxmast";
grant select on "maxmast".imtyp to "public" as "maxmast";
grant update on "maxmast".imtyp to "public" as "maxmast";
grant insert on "maxmast".imtyp to "public" as "maxmast";
grant delete on "maxmast".imtyp to "public" as "maxmast";
grant index on "maxmast".imtyp to "public" as "maxmast";
grant select on "maxmast".imuom to "public" as "maxmast";
grant update on "maxmast".imuom to "public" as "maxmast";
grant insert on "maxmast".imuom to "public" as "maxmast";
grant delete on "maxmast".imuom to "public" as "maxmast";
grant index on "maxmast".imuom to "public" as "maxmast";
grant select on "maxmast".irsuh to "public" as "maxmast";
grant update on "maxmast".irsuh to "public" as "maxmast";
grant insert on "maxmast".irsuh to "public" as "maxmast";
grant delete on "maxmast".irsuh to "public" as "maxmast";
grant index on "maxmast".irsuh to "public" as "maxmast";
grant select on "maxmast".items to "public" as "maxmast";
grant update on "maxmast".items to "public" as "maxmast";
grant insert on "maxmast".items to "public" as "maxmast";
grant delete on "maxmast".items to "public" as "maxmast";
grant index on "maxmast".items to "public" as "maxmast";
grant select on "maxmast".lgmas to "public" as "maxmast";
grant update on "maxmast".lgmas to "public" as "maxmast";
grant insert on "maxmast".lgmas to "public" as "maxmast";
grant delete on "maxmast".lgmas to "public" as "maxmast";
grant index on "maxmast".lgmas to "public" as "maxmast";
grant select on "maxmast".mabal to "public" as "maxmast";
grant update on "maxmast".mabal to "public" as "maxmast";
grant insert on "maxmast".mabal to "public" as "maxmast";
grant delete on "maxmast".mabal to "public" as "maxmast";
grant index on "maxmast".mabal to "public" as "maxmast";
grant select on "maxmast".mabat to "public" as "maxmast";
grant update on "maxmast".mabat to "public" as "maxmast";
grant insert on "maxmast".mabat to "public" as "maxmast";
grant delete on "maxmast".mabat to "public" as "maxmast";
grant index on "maxmast".mabat to "public" as "maxmast";
grant select on "maxmast".macom to "public" as "maxmast";
grant update on "maxmast".macom to "public" as "maxmast";
grant insert on "maxmast".macom to "public" as "maxmast";
grant delete on "maxmast".macom to "public" as "maxmast";
grant index on "maxmast".macom to "public" as "maxmast";
grant select on "maxmast".maopn to "public" as "maxmast";
grant update on "maxmast".maopn to "public" as "maxmast";
grant insert on "maxmast".maopn to "public" as "maxmast";
grant delete on "maxmast".maopn to "public" as "maxmast";
grant index on "maxmast".maopn to "public" as "maxmast";
grant select on "maxmast".maxlog to "public" as "maxmast";
grant update on "maxmast".maxlog to "public" as "maxmast";
grant insert on "maxmast".maxlog to "public" as "maxmast";
grant delete on "maxmast".maxlog to "public" as "maxmast";
grant index on "maxmast".maxlog to "public" as "maxmast";
grant select on "maxmast".menuln to "public" as "maxmast";
grant update on "maxmast".menuln to "public" as "maxmast";
grant insert on "maxmast".menuln to "public" as "maxmast";
grant delete on "maxmast".menuln to "public" as "maxmast";
grant index on "maxmast".menuln to "public" as "maxmast";
grant select on "maxmast".mfac to "public" as "maxmast";
grant update on "maxmast".mfac to "public" as "maxmast";
grant insert on "maxmast".mfac to "public" as "maxmast";
grant delete on "maxmast".mfac to "public" as "maxmast";
grant index on "maxmast".mfac to "public" as "maxmast";
grant select on "maxmast".mfcst to "public" as "maxmast";
grant update on "maxmast".mfcst to "public" as "maxmast";
grant insert on "maxmast".mfcst to "public" as "maxmast";
grant delete on "maxmast".mfcst to "public" as "maxmast";
grant index on "maxmast".mfcst to "public" as "maxmast";
grant select on "maxmast".mfhrs to "public" as "maxmast";
grant update on "maxmast".mfhrs to "public" as "maxmast";
grant insert on "maxmast".mfhrs to "public" as "maxmast";
grant delete on "maxmast".mfhrs to "public" as "maxmast";
grant index on "maxmast".mfhrs to "public" as "maxmast";
grant select on "maxmast".mfop to "public" as "maxmast";
grant update on "maxmast".mfop to "public" as "maxmast";
grant insert on "maxmast".mfop to "public" as "maxmast";
grant delete on "maxmast".mfop to "public" as "maxmast";
grant index on "maxmast".mfop to "public" as "maxmast";
grant select on "maxmast".mfres to "public" as "maxmast";
grant update on "maxmast".mfres to "public" as "maxmast";
grant insert on "maxmast".mfres to "public" as "maxmast";
grant delete on "maxmast".mfres to "public" as "maxmast";
grant index on "maxmast".mfres to "public" as "maxmast";
grant select on "maxmast".mftrn to "public" as "maxmast";
grant update on "maxmast".mftrn to "public" as "maxmast";
grant insert on "maxmast".mftrn to "public" as "maxmast";
grant delete on "maxmast".mftrn to "public" as "maxmast";
grant index on "maxmast".mftrn to "public" as "maxmast";
grant select on "maxmast".mftro to "public" as "maxmast";
grant update on "maxmast".mftro to "public" as "maxmast";
grant insert on "maxmast".mftro to "public" as "maxmast";
grant delete on "maxmast".mftro to "public" as "maxmast";
grant index on "maxmast".mftro to "public" as "maxmast";
grant select on "maxmast".mmalp to "public" as "maxmast";
grant update on "maxmast".mmalp to "public" as "maxmast";
grant insert on "maxmast".mmalp to "public" as "maxmast";
grant delete on "maxmast".mmalp to "public" as "maxmast";
grant index on "maxmast".mmalp to "public" as "maxmast";
grant select on "maxmast".mmals to "public" as "maxmast";
grant update on "maxmast".mmals to "public" as "maxmast";
grant insert on "maxmast".mmals to "public" as "maxmast";
grant delete on "maxmast".mmals to "public" as "maxmast";
grant index on "maxmast".mmals to "public" as "maxmast";
grant select on "maxmast".mmcal to "public" as "maxmast";
grant update on "maxmast".mmcal to "public" as "maxmast";
grant insert on "maxmast".mmcal to "public" as "maxmast";
grant delete on "maxmast".mmcal to "public" as "maxmast";
grant index on "maxmast".mmcal to "public" as "maxmast";
grant select on "maxmast".mmctp to "public" as "maxmast";
grant update on "maxmast".mmctp to "public" as "maxmast";
grant insert on "maxmast".mmctp to "public" as "maxmast";
grant delete on "maxmast".mmctp to "public" as "maxmast";
grant index on "maxmast".mmctp to "public" as "maxmast";
grant select on "maxmast".mmff to "public" as "maxmast";
grant update on "maxmast".mmff to "public" as "maxmast";
grant insert on "maxmast".mmff to "public" as "maxmast";
grant delete on "maxmast".mmff to "public" as "maxmast";
grant index on "maxmast".mmff to "public" as "maxmast";
grant select on "maxmast".mmfi to "public" as "maxmast";
grant update on "maxmast".mmfi to "public" as "maxmast";
grant insert on "maxmast".mmfi to "public" as "maxmast";
grant delete on "maxmast".mmfi to "public" as "maxmast";
grant index on "maxmast".mmfi to "public" as "maxmast";
grant select on "maxmast".mmfr to "public" as "maxmast";
grant update on "maxmast".mmfr to "public" as "maxmast";
grant insert on "maxmast".mmfr to "public" as "maxmast";
grant delete on "maxmast".mmfr to "public" as "maxmast";
grant index on "maxmast".mmfr to "public" as "maxmast";
grant select on "maxmast".mmfw to "public" as "maxmast";
grant update on "maxmast".mmfw to "public" as "maxmast";
grant insert on "maxmast".mmfw to "public" as "maxmast";
grant delete on "maxmast".mmfw to "public" as "maxmast";
grant index on "maxmast".mmfw to "public" as "maxmast";
grant select on "maxmast".mmins to "public" as "maxmast";
grant update on "maxmast".mmins to "public" as "maxmast";
grant insert on "maxmast".mmins to "public" as "maxmast";
grant delete on "maxmast".mmins to "public" as "maxmast";
grant index on "maxmast".mmins to "public" as "maxmast";
grant select on "maxmast".mmpro to "public" as "maxmast";
grant update on "maxmast".mmpro to "public" as "maxmast";
grant insert on "maxmast".mmpro to "public" as "maxmast";
grant delete on "maxmast".mmpro to "public" as "maxmast";
grant index on "maxmast".mmpro to "public" as "maxmast";
grant select on "maxmast".mmres to "public" as "maxmast";
grant update on "maxmast".mmres to "public" as "maxmast";
grant insert on "maxmast".mmres to "public" as "maxmast";
grant delete on "maxmast".mmres to "public" as "maxmast";
grant index on "maxmast".mmres to "public" as "maxmast";
grant select on "maxmast".mmser to "public" as "maxmast";
grant update on "maxmast".mmser to "public" as "maxmast";
grant insert on "maxmast".mmser to "public" as "maxmast";
grant delete on "maxmast".mmser to "public" as "maxmast";
grant index on "maxmast".mmser to "public" as "maxmast";
grant select on "maxmast".mmtrc to "public" as "maxmast";
grant update on "maxmast".mmtrc to "public" as "maxmast";
grant insert on "maxmast".mmtrc to "public" as "maxmast";
grant delete on "maxmast".mmtrc to "public" as "maxmast";
grant index on "maxmast".mmtrc to "public" as "maxmast";
grant select on "maxmast".mmtrl to "public" as "maxmast";
grant update on "maxmast".mmtrl to "public" as "maxmast";
grant insert on "maxmast".mmtrl to "public" as "maxmast";
grant delete on "maxmast".mmtrl to "public" as "maxmast";
grant index on "maxmast".mmtrl to "public" as "maxmast";
grant select on "maxmast".mmtrm to "public" as "maxmast";
grant update on "maxmast".mmtrm to "public" as "maxmast";
grant insert on "maxmast".mmtrm to "public" as "maxmast";
grant delete on "maxmast".mmtrm to "public" as "maxmast";
grant index on "maxmast".mmtrm to "public" as "maxmast";
grant select on "maxmast".mmtro to "public" as "maxmast";
grant update on "maxmast".mmtro to "public" as "maxmast";
grant insert on "maxmast".mmtro to "public" as "maxmast";
grant delete on "maxmast".mmtro to "public" as "maxmast";
grant index on "maxmast".mmtro to "public" as "maxmast";
grant select on "maxmast".mmtrs to "public" as "maxmast";
grant update on "maxmast".mmtrs to "public" as "maxmast";
grant insert on "maxmast".mmtrs to "public" as "maxmast";
grant delete on "maxmast".mmtrs to "public" as "maxmast";
grant index on "maxmast".mmtrs to "public" as "maxmast";
grant select on "maxmast".mmuid to "public" as "maxmast";
grant update on "maxmast".mmuid to "public" as "maxmast";
grant insert on "maxmast".mmuid to "public" as "maxmast";
grant delete on "maxmast".mmuid to "public" as "maxmast";
grant index on "maxmast".mmuid to "public" as "maxmast";
grant select on "maxmast".mmuom to "public" as "maxmast";
grant update on "maxmast".mmuom to "public" as "maxmast";
grant insert on "maxmast".mmuom to "public" as "maxmast";
grant delete on "maxmast".mmuom to "public" as "maxmast";
grant index on "maxmast".mmuom to "public" as "maxmast";
grant select on "maxmast".mr1for to "public" as "maxmast";
grant update on "maxmast".mr1for to "public" as "maxmast";
grant insert on "maxmast".mr1for to "public" as "maxmast";
grant delete on "maxmast".mr1for to "public" as "maxmast";
grant index on "maxmast".mr1for to "public" as "maxmast";
grant select on "maxmast".mrcpt to "public" as "maxmast";
grant update on "maxmast".mrcpt to "public" as "maxmast";
grant insert on "maxmast".mrcpt to "public" as "maxmast";
grant delete on "maxmast".mrcpt to "public" as "maxmast";
grant index on "maxmast".mrcpt to "public" as "maxmast";
grant select on "maxmast".mrord to "public" as "maxmast";
grant update on "maxmast".mrord to "public" as "maxmast";
grant insert on "maxmast".mrord to "public" as "maxmast";
grant delete on "maxmast".mrord to "public" as "maxmast";
grant index on "maxmast".mrord to "public" as "maxmast";
grant select on "maxmast".mrqt to "public" as "maxmast";
grant update on "maxmast".mrqt to "public" as "maxmast";
grant insert on "maxmast".mrqt to "public" as "maxmast";
grant delete on "maxmast".mrqt to "public" as "maxmast";
grant index on "maxmast".mrqt to "public" as "maxmast";
grant select on "maxmast".msagf to "public" as "maxmast";
grant update on "maxmast".msagf to "public" as "maxmast";
grant insert on "maxmast".msagf to "public" as "maxmast";
grant delete on "maxmast".msagf to "public" as "maxmast";
grant index on "maxmast".msagf to "public" as "maxmast";
grant select on "maxmast".mserl to "public" as "maxmast";
grant update on "maxmast".mserl to "public" as "maxmast";
grant insert on "maxmast".mserl to "public" as "maxmast";
grant delete on "maxmast".mserl to "public" as "maxmast";
grant index on "maxmast".mserl to "public" as "maxmast";
grant select on "maxmast".msfst to "public" as "maxmast";
grant update on "maxmast".msfst to "public" as "maxmast";
grant insert on "maxmast".msfst to "public" as "maxmast";
grant delete on "maxmast".msfst to "public" as "maxmast";
grant index on "maxmast".msfst to "public" as "maxmast";
grant select on "maxmast".msrqt to "public" as "maxmast";
grant update on "maxmast".msrqt to "public" as "maxmast";
grant insert on "maxmast".msrqt to "public" as "maxmast";
grant delete on "maxmast".msrqt to "public" as "maxmast";
grant index on "maxmast".msrqt to "public" as "maxmast";
grant select on "maxmast".mswhd to "public" as "maxmast";
grant update on "maxmast".mswhd to "public" as "maxmast";
grant insert on "maxmast".mswhd to "public" as "maxmast";
grant delete on "maxmast".mswhd to "public" as "maxmast";
grant index on "maxmast".mswhd to "public" as "maxmast";
grant select on "maxmast".mswif to "public" as "maxmast";
grant update on "maxmast".mswif to "public" as "maxmast";
grant insert on "maxmast".mswif to "public" as "maxmast";
grant delete on "maxmast".mswif to "public" as "maxmast";
grant index on "maxmast".mswif to "public" as "maxmast";
grant select on "maxmast".mswih to "public" as "maxmast";
grant update on "maxmast".mswih to "public" as "maxmast";
grant insert on "maxmast".mswih to "public" as "maxmast";
grant delete on "maxmast".mswih to "public" as "maxmast";
grant index on "maxmast".mswih to "public" as "maxmast";
grant select on "maxmast".nphdr to "public" as "maxmast";
grant update on "maxmast".nphdr to "public" as "maxmast";
grant insert on "maxmast".nphdr to "public" as "maxmast";
grant delete on "maxmast".nphdr to "public" as "maxmast";
grant index on "maxmast".nphdr to "public" as "maxmast";
grant select on "maxmast".nptxt to "public" as "maxmast";
grant update on "maxmast".nptxt to "public" as "maxmast";
grant insert on "maxmast".nptxt to "public" as "maxmast";
grant delete on "maxmast".nptxt to "public" as "maxmast";
grant index on "maxmast".nptxt to "public" as "maxmast";
grant select on "maxmast".nvabc to "public" as "maxmast";
grant update on "maxmast".nvabc to "public" as "maxmast";
grant insert on "maxmast".nvabc to "public" as "maxmast";
grant delete on "maxmast".nvabc to "public" as "maxmast";
grant index on "maxmast".nvabc to "public" as "maxmast";
grant select on "maxmast".nvacc to "public" as "maxmast";
grant update on "maxmast".nvacc to "public" as "maxmast";
grant insert on "maxmast".nvacc to "public" as "maxmast";
grant delete on "maxmast".nvacc to "public" as "maxmast";
grant index on "maxmast".nvacc to "public" as "maxmast";
grant select on "maxmast".nvall to "public" as "maxmast";
grant update on "maxmast".nvall to "public" as "maxmast";
grant insert on "maxmast".nvall to "public" as "maxmast";
grant delete on "maxmast".nvall to "public" as "maxmast";
grant index on "maxmast".nvall to "public" as "maxmast";
grant select on "maxmast".nvcls to "public" as "maxmast";
grant update on "maxmast".nvcls to "public" as "maxmast";
grant insert on "maxmast".nvcls to "public" as "maxmast";
grant delete on "maxmast".nvcls to "public" as "maxmast";
grant index on "maxmast".nvcls to "public" as "maxmast";
grant select on "maxmast".nvtra to "public" as "maxmast";
grant update on "maxmast".nvtra to "public" as "maxmast";
grant insert on "maxmast".nvtra to "public" as "maxmast";
grant delete on "maxmast".nvtra to "public" as "maxmast";
grant index on "maxmast".nvtra to "public" as "maxmast";
grant select on "maxmast".nvtrm to "public" as "maxmast";
grant update on "maxmast".nvtrm to "public" as "maxmast";
grant insert on "maxmast".nvtrm to "public" as "maxmast";
grant delete on "maxmast".nvtrm to "public" as "maxmast";
grant index on "maxmast".nvtrm to "public" as "maxmast";
grant select on "maxmast".nvtrs to "public" as "maxmast";
grant update on "maxmast".nvtrs to "public" as "maxmast";
grant insert on "maxmast".nvtrs to "public" as "maxmast";
grant delete on "maxmast".nvtrs to "public" as "maxmast";
grant index on "maxmast".nvtrs to "public" as "maxmast";
grant select on "maxmast".nvxac to "public" as "maxmast";
grant update on "maxmast".nvxac to "public" as "maxmast";
grant insert on "maxmast".nvxac to "public" as "maxmast";
grant delete on "maxmast".nvxac to "public" as "maxmast";
grant index on "maxmast".nvxac to "public" as "maxmast";
grant select on "maxmast".object to "public" as "maxmast";
grant update on "maxmast".object to "public" as "maxmast";
grant insert on "maxmast".object to "public" as "maxmast";
grant delete on "maxmast".object to "public" as "maxmast";
grant index on "maxmast".object to "public" as "maxmast";
grant select on "maxmast".oeall to "public" as "maxmast";
grant update on "maxmast".oeall to "public" as "maxmast";
grant insert on "maxmast".oeall to "public" as "maxmast";
grant delete on "maxmast".oeall to "public" as "maxmast";
grant index on "maxmast".oeall to "public" as "maxmast";
grant select on "maxmast".oeatr to "public" as "maxmast";
grant update on "maxmast".oeatr to "public" as "maxmast";
grant insert on "maxmast".oeatr to "public" as "maxmast";
grant delete on "maxmast".oeatr to "public" as "maxmast";
grant index on "maxmast".oeatr to "public" as "maxmast";
grant select on "maxmast".oeccm to "public" as "maxmast";
grant update on "maxmast".oeccm to "public" as "maxmast";
grant insert on "maxmast".oeccm to "public" as "maxmast";
grant delete on "maxmast".oeccm to "public" as "maxmast";
grant index on "maxmast".oeccm to "public" as "maxmast";
grant select on "maxmast".oecds to "public" as "maxmast";
grant update on "maxmast".oecds to "public" as "maxmast";
grant insert on "maxmast".oecds to "public" as "maxmast";
grant delete on "maxmast".oecds to "public" as "maxmast";
grant index on "maxmast".oecds to "public" as "maxmast";
grant select on "maxmast".oecia to "public" as "maxmast";
grant update on "maxmast".oecia to "public" as "maxmast";
grant insert on "maxmast".oecia to "public" as "maxmast";
grant delete on "maxmast".oecia to "public" as "maxmast";
grant index on "maxmast".oecia to "public" as "maxmast";
grant select on "maxmast".oecit to "public" as "maxmast";
grant update on "maxmast".oecit to "public" as "maxmast";
grant insert on "maxmast".oecit to "public" as "maxmast";
grant delete on "maxmast".oecit to "public" as "maxmast";
grant index on "maxmast".oecit to "public" as "maxmast";
grant select on "maxmast".oeclk to "public" as "maxmast";
grant update on "maxmast".oeclk to "public" as "maxmast";
grant insert on "maxmast".oeclk to "public" as "maxmast";
grant delete on "maxmast".oeclk to "public" as "maxmast";
grant index on "maxmast".oeclk to "public" as "maxmast";
grant select on "maxmast".oecmt to "public" as "maxmast";
grant update on "maxmast".oecmt to "public" as "maxmast";
grant insert on "maxmast".oecmt to "public" as "maxmast";
grant delete on "maxmast".oecmt to "public" as "maxmast";
grant index on "maxmast".oecmt to "public" as "maxmast";
grant select on "maxmast".oecpc to "public" as "maxmast";
grant update on "maxmast".oecpc to "public" as "maxmast";
grant insert on "maxmast".oecpc to "public" as "maxmast";
grant delete on "maxmast".oecpc to "public" as "maxmast";
grant index on "maxmast".oecpc to "public" as "maxmast";
grant select on "maxmast".oedsc to "public" as "maxmast";
grant update on "maxmast".oedsc to "public" as "maxmast";
grant insert on "maxmast".oedsc to "public" as "maxmast";
grant delete on "maxmast".oedsc to "public" as "maxmast";
grant index on "maxmast".oedsc to "public" as "maxmast";
grant select on "maxmast".oehst to "public" as "maxmast";
grant update on "maxmast".oehst to "public" as "maxmast";
grant insert on "maxmast".oehst to "public" as "maxmast";
grant delete on "maxmast".oehst to "public" as "maxmast";
grant index on "maxmast".oehst to "public" as "maxmast";
grant select on "maxmast".oeipc to "public" as "maxmast";
grant update on "maxmast".oeipc to "public" as "maxmast";
grant insert on "maxmast".oeipc to "public" as "maxmast";
grant delete on "maxmast".oeipc to "public" as "maxmast";
grant index on "maxmast".oeipc to "public" as "maxmast";
grant select on "maxmast".oensi to "public" as "maxmast";
grant update on "maxmast".oensi to "public" as "maxmast";
grant insert on "maxmast".oensi to "public" as "maxmast";
grant delete on "maxmast".oensi to "public" as "maxmast";
grant index on "maxmast".oensi to "public" as "maxmast";
grant select on "maxmast".oepak to "public" as "maxmast";
grant update on "maxmast".oepak to "public" as "maxmast";
grant insert on "maxmast".oepak to "public" as "maxmast";
grant delete on "maxmast".oepak to "public" as "maxmast";
grant index on "maxmast".oepak to "public" as "maxmast";
grant select on "maxmast".oepck to "public" as "maxmast";
grant update on "maxmast".oepck to "public" as "maxmast";
grant insert on "maxmast".oepck to "public" as "maxmast";
grant delete on "maxmast".oepck to "public" as "maxmast";
grant index on "maxmast".oepck to "public" as "maxmast";
grant select on "maxmast".oeplst to "public" as "maxmast";
grant update on "maxmast".oeplst to "public" as "maxmast";
grant insert on "maxmast".oeplst to "public" as "maxmast";
grant delete on "maxmast".oeplst to "public" as "maxmast";
grant index on "maxmast".oeplst to "public" as "maxmast";
grant select on "maxmast".oeqbd to "public" as "maxmast";
grant update on "maxmast".oeqbd to "public" as "maxmast";
grant insert on "maxmast".oeqbd to "public" as "maxmast";
grant delete on "maxmast".oeqbd to "public" as "maxmast";
grant index on "maxmast".oeqbd to "public" as "maxmast";
grant select on "maxmast".oeqnh to "public" as "maxmast";
grant update on "maxmast".oeqnh to "public" as "maxmast";
grant insert on "maxmast".oeqnh to "public" as "maxmast";
grant delete on "maxmast".oeqnh to "public" as "maxmast";
grant index on "maxmast".oeqnh to "public" as "maxmast";
grant select on "maxmast".oeref to "public" as "maxmast";
grant update on "maxmast".oeref to "public" as "maxmast";
grant insert on "maxmast".oeref to "public" as "maxmast";
grant delete on "maxmast".oeref to "public" as "maxmast";
grant index on "maxmast".oeref to "public" as "maxmast";
grant select on "maxmast".oescm to "public" as "maxmast";
grant update on "maxmast".oescm to "public" as "maxmast";
grant insert on "maxmast".oescm to "public" as "maxmast";
grant delete on "maxmast".oescm to "public" as "maxmast";
grant index on "maxmast".oescm to "public" as "maxmast";
grant select on "maxmast".oeslm to "public" as "maxmast";
grant update on "maxmast".oeslm to "public" as "maxmast";
grant insert on "maxmast".oeslm to "public" as "maxmast";
grant delete on "maxmast".oeslm to "public" as "maxmast";
grant index on "maxmast".oeslm to "public" as "maxmast";
grant select on "maxmast".oespd to "public" as "maxmast";
grant update on "maxmast".oespd to "public" as "maxmast";
grant insert on "maxmast".oespd to "public" as "maxmast";
grant delete on "maxmast".oespd to "public" as "maxmast";
grant index on "maxmast".oespd to "public" as "maxmast";
grant select on "maxmast".oespp to "public" as "maxmast";
grant update on "maxmast".oespp to "public" as "maxmast";
grant insert on "maxmast".oespp to "public" as "maxmast";
grant delete on "maxmast".oespp to "public" as "maxmast";
grant index on "maxmast".oespp to "public" as "maxmast";
grant select on "maxmast".oespr to "public" as "maxmast";
grant update on "maxmast".oespr to "public" as "maxmast";
grant insert on "maxmast".oespr to "public" as "maxmast";
grant delete on "maxmast".oespr to "public" as "maxmast";
grant index on "maxmast".oespr to "public" as "maxmast";
grant select on "maxmast".oesrn to "public" as "maxmast";
grant update on "maxmast".oesrn to "public" as "maxmast";
grant insert on "maxmast".oesrn to "public" as "maxmast";
grant delete on "maxmast".oesrn to "public" as "maxmast";
grant index on "maxmast".oesrn to "public" as "maxmast";
grant select on "maxmast".omac to "public" as "maxmast";
grant update on "maxmast".omac to "public" as "maxmast";
grant insert on "maxmast".omac to "public" as "maxmast";
grant delete on "maxmast".omac to "public" as "maxmast";
grant index on "maxmast".omac to "public" as "maxmast";
grant select on "maxmast".paper to "public" as "maxmast";
grant update on "maxmast".paper to "public" as "maxmast";
grant insert on "maxmast".paper to "public" as "maxmast";
grant delete on "maxmast".paper to "public" as "maxmast";
grant index on "maxmast".paper to "public" as "maxmast";
grant select on "maxmast".pfield to "public" as "maxmast";
grant update on "maxmast".pfield to "public" as "maxmast";
grant insert on "maxmast".pfield to "public" as "maxmast";
grant delete on "maxmast".pfield to "public" as "maxmast";
grant index on "maxmast".pfield to "public" as "maxmast";
grant select on "maxmast".plosb to "public" as "maxmast";
grant update on "maxmast".plosb to "public" as "maxmast";
grant insert on "maxmast".plosb to "public" as "maxmast";
grant delete on "maxmast".plosb to "public" as "maxmast";
grant index on "maxmast".plosb to "public" as "maxmast";
grant select on "maxmast".plpen to "public" as "maxmast";
grant update on "maxmast".plpen to "public" as "maxmast";
grant insert on "maxmast".plpen to "public" as "maxmast";
grant delete on "maxmast".plpen to "public" as "maxmast";
grant index on "maxmast".plpen to "public" as "maxmast";
grant select on "maxmast".pltx2 to "public" as "maxmast";
grant update on "maxmast".pltx2 to "public" as "maxmast";
grant insert on "maxmast".pltx2 to "public" as "maxmast";
grant delete on "maxmast".pltx2 to "public" as "maxmast";
grant index on "maxmast".pltx2 to "public" as "maxmast";
grant select on "maxmast".pmask to "public" as "maxmast";
grant update on "maxmast".pmask to "public" as "maxmast";
grant insert on "maxmast".pmask to "public" as "maxmast";
grant delete on "maxmast".pmask to "public" as "maxmast";
grant index on "maxmast".pmask to "public" as "maxmast";
grant select on "maxmast".prdata to "public" as "maxmast";
grant update on "maxmast".prdata to "public" as "maxmast";
grant insert on "maxmast".prdata to "public" as "maxmast";
grant delete on "maxmast".prdata to "public" as "maxmast";
grant index on "maxmast".prdata to "public" as "maxmast";
grant select on "maxmast".printdev to "public" as "maxmast";
grant update on "maxmast".printdev to "public" as "maxmast";
grant insert on "maxmast".printdev to "public" as "maxmast";
grant delete on "maxmast".printdev to "public" as "maxmast";
grant index on "maxmast".printdev to "public" as "maxmast";
grant select on "maxmast".printque to "public" as "maxmast";
grant update on "maxmast".printque to "public" as "maxmast";
grant insert on "maxmast".printque to "public" as "maxmast";
grant delete on "maxmast".printque to "public" as "maxmast";
grant index on "maxmast".printque to "public" as "maxmast";
grant select on "maxmast".pst to "public" as "maxmast";
grant update on "maxmast".pst to "public" as "maxmast";
grant insert on "maxmast".pst to "public" as "maxmast";
grant delete on "maxmast".pst to "public" as "maxmast";
grant index on "maxmast".pst to "public" as "maxmast";
grant select on "maxmast".pstrl to "public" as "maxmast";
grant update on "maxmast".pstrl to "public" as "maxmast";
grant insert on "maxmast".pstrl to "public" as "maxmast";
grant delete on "maxmast".pstrl to "public" as "maxmast";
grant index on "maxmast".pstrl to "public" as "maxmast";
grant select on "maxmast".puldel to "public" as "maxmast";
grant update on "maxmast".puldel to "public" as "maxmast";
grant insert on "maxmast".puldel to "public" as "maxmast";
grant delete on "maxmast".puldel to "public" as "maxmast";
grant index on "maxmast".puldel to "public" as "maxmast";
grant select on "maxmast".puold to "public" as "maxmast";
grant update on "maxmast".puold to "public" as "maxmast";
grant insert on "maxmast".puold to "public" as "maxmast";
grant delete on "maxmast".puold to "public" as "maxmast";
grant index on "maxmast".puold to "public" as "maxmast";
grant select on "maxmast".puord to "public" as "maxmast";
grant update on "maxmast".puord to "public" as "maxmast";
grant insert on "maxmast".puord to "public" as "maxmast";
grant delete on "maxmast".puord to "public" as "maxmast";
grant index on "maxmast".puord to "public" as "maxmast";
grant select on "maxmast".pupdi to "public" as "maxmast";
grant update on "maxmast".pupdi to "public" as "maxmast";
grant insert on "maxmast".pupdi to "public" as "maxmast";
grant delete on "maxmast".pupdi to "public" as "maxmast";
grant index on "maxmast".pupdi to "public" as "maxmast";
grant select on "maxmast".purem to "public" as "maxmast";
grant update on "maxmast".purem to "public" as "maxmast";
grant insert on "maxmast".purem to "public" as "maxmast";
grant delete on "maxmast".purem to "public" as "maxmast";
grant index on "maxmast".purem to "public" as "maxmast";
grant select on "maxmast".ref to "public" as "maxmast";
grant update on "maxmast".ref to "public" as "maxmast";
grant insert on "maxmast".ref to "public" as "maxmast";
grant delete on "maxmast".ref to "public" as "maxmast";
grant index on "maxmast".ref to "public" as "maxmast";
grant select on "maxmast".reflog to "public" as "maxmast";
grant update on "maxmast".reflog to "public" as "maxmast";
grant insert on "maxmast".reflog to "public" as "maxmast";
grant delete on "maxmast".reflog to "public" as "maxmast";
grant index on "maxmast".reflog to "public" as "maxmast";
grant select on "maxmast".respln1 to "public" as "maxmast";
grant update on "maxmast".respln1 to "public" as "maxmast";
grant insert on "maxmast".respln1 to "public" as "maxmast";
grant delete on "maxmast".respln1 to "public" as "maxmast";
grant index on "maxmast".respln1 to "public" as "maxmast";
grant select on "maxmast".respln2 to "public" as "maxmast";
grant update on "maxmast".respln2 to "public" as "maxmast";
grant insert on "maxmast".respln2 to "public" as "maxmast";
grant delete on "maxmast".respln2 to "public" as "maxmast";
grant index on "maxmast".respln2 to "public" as "maxmast";
grant select on "maxmast".respln3 to "public" as "maxmast";
grant update on "maxmast".respln3 to "public" as "maxmast";
grant insert on "maxmast".respln3 to "public" as "maxmast";
grant delete on "maxmast".respln3 to "public" as "maxmast";
grant index on "maxmast".respln3 to "public" as "maxmast";
grant select on "maxmast".respln4 to "public" as "maxmast";
grant update on "maxmast".respln4 to "public" as "maxmast";
grant insert on "maxmast".respln4 to "public" as "maxmast";
grant delete on "maxmast".respln4 to "public" as "maxmast";
grant index on "maxmast".respln4 to "public" as "maxmast";
grant select on "maxmast".respln5 to "public" as "maxmast";
grant update on "maxmast".respln5 to "public" as "maxmast";
grant insert on "maxmast".respln5 to "public" as "maxmast";
grant delete on "maxmast".respln5 to "public" as "maxmast";
grant index on "maxmast".respln5 to "public" as "maxmast";
grant select on "maxmast".respln6 to "public" as "maxmast";
grant update on "maxmast".respln6 to "public" as "maxmast";
grant insert on "maxmast".respln6 to "public" as "maxmast";
grant delete on "maxmast".respln6 to "public" as "maxmast";
grant index on "maxmast".respln6 to "public" as "maxmast";
grant select on "maxmast".respln7 to "public" as "maxmast";
grant update on "maxmast".respln7 to "public" as "maxmast";
grant insert on "maxmast".respln7 to "public" as "maxmast";
grant delete on "maxmast".respln7 to "public" as "maxmast";
grant index on "maxmast".respln7 to "public" as "maxmast";
grant select on "maxmast".respln8 to "public" as "maxmast";
grant update on "maxmast".respln8 to "public" as "maxmast";
grant insert on "maxmast".respln8 to "public" as "maxmast";
grant delete on "maxmast".respln8 to "public" as "maxmast";
grant index on "maxmast".respln8 to "public" as "maxmast";
grant select on "maxmast".respln9 to "public" as "maxmast";
grant update on "maxmast".respln9 to "public" as "maxmast";
grant insert on "maxmast".respln9 to "public" as "maxmast";
grant delete on "maxmast".respln9 to "public" as "maxmast";
grant index on "maxmast".respln9 to "public" as "maxmast";
grant select on "maxmast".respln to "public" as "maxmast";
grant update on "maxmast".respln to "public" as "maxmast";
grant insert on "maxmast".respln to "public" as "maxmast";
grant delete on "maxmast".respln to "public" as "maxmast";
grant index on "maxmast".respln to "public" as "maxmast";
grant select on "maxmast".rthed to "public" as "maxmast";
grant update on "maxmast".rthed to "public" as "maxmast";
grant insert on "maxmast".rthed to "public" as "maxmast";
grant delete on "maxmast".rthed to "public" as "maxmast";
grant index on "maxmast".rthed to "public" as "maxmast";
grant select on "maxmast".rtmod to "public" as "maxmast";
grant update on "maxmast".rtmod to "public" as "maxmast";
grant insert on "maxmast".rtmod to "public" as "maxmast";
grant delete on "maxmast".rtmod to "public" as "maxmast";
grant index on "maxmast".rtmod to "public" as "maxmast";
grant select on "maxmast".rtop to "public" as "maxmast";
grant update on "maxmast".rtop to "public" as "maxmast";
grant insert on "maxmast".rtop to "public" as "maxmast";
grant delete on "maxmast".rtop to "public" as "maxmast";
grant index on "maxmast".rtop to "public" as "maxmast";
grant select on "maxmast".rtres to "public" as "maxmast";
grant update on "maxmast".rtres to "public" as "maxmast";
grant insert on "maxmast".rtres to "public" as "maxmast";
grant delete on "maxmast".rtres to "public" as "maxmast";
grant index on "maxmast".rtres to "public" as "maxmast";
grant select on "maxmast".sakey to "public" as "maxmast";
grant update on "maxmast".sakey to "public" as "maxmast";
grant insert on "maxmast".sakey to "public" as "maxmast";
grant delete on "maxmast".sakey to "public" as "maxmast";
grant index on "maxmast".sakey to "public" as "maxmast";
grant select on "maxmast".satrn to "public" as "maxmast";
grant update on "maxmast".satrn to "public" as "maxmast";
grant insert on "maxmast".satrn to "public" as "maxmast";
grant delete on "maxmast".satrn to "public" as "maxmast";
grant index on "maxmast".satrn to "public" as "maxmast";
grant select on "maxmast".saytd to "public" as "maxmast";
grant update on "maxmast".saytd to "public" as "maxmast";
grant insert on "maxmast".saytd to "public" as "maxmast";
grant delete on "maxmast".saytd to "public" as "maxmast";
grant index on "maxmast".saytd to "public" as "maxmast";
grant select on "maxmast".sfdata to "public" as "maxmast";
grant update on "maxmast".sfdata to "public" as "maxmast";
grant insert on "maxmast".sfdata to "public" as "maxmast";
grant delete on "maxmast".sfdata to "public" as "maxmast";
grant index on "maxmast".sfdata to "public" as "maxmast";
grant select on "maxmast".sffield to "public" as "maxmast";
grant update on "maxmast".sffield to "public" as "maxmast";
grant insert on "maxmast".sffield to "public" as "maxmast";
grant delete on "maxmast".sffield to "public" as "maxmast";
grant index on "maxmast".sffield to "public" as "maxmast";
grant select on "maxmast".sfmask to "public" as "maxmast";
grant update on "maxmast".sfmask to "public" as "maxmast";
grant insert on "maxmast".sfmask to "public" as "maxmast";
grant delete on "maxmast".sfmask to "public" as "maxmast";
grant index on "maxmast".sfmask to "public" as "maxmast";
grant select on "maxmast".sfparam to "public" as "maxmast";
grant update on "maxmast".sfparam to "public" as "maxmast";
grant insert on "maxmast".sfparam to "public" as "maxmast";
grant delete on "maxmast".sfparam to "public" as "maxmast";
grant index on "maxmast".sfparam to "public" as "maxmast";
grant select on "maxmast".siare to "public" as "maxmast";
grant update on "maxmast".siare to "public" as "maxmast";
grant insert on "maxmast".siare to "public" as "maxmast";
grant delete on "maxmast".siare to "public" as "maxmast";
grant index on "maxmast".siare to "public" as "maxmast";
grant select on "maxmast".siarp to "public" as "maxmast";
grant update on "maxmast".siarp to "public" as "maxmast";
grant insert on "maxmast".siarp to "public" as "maxmast";
grant delete on "maxmast".siarp to "public" as "maxmast";
grant index on "maxmast".siarp to "public" as "maxmast";
grant select on "maxmast".sical to "public" as "maxmast";
grant update on "maxmast".sical to "public" as "maxmast";
grant insert on "maxmast".sical to "public" as "maxmast";
grant delete on "maxmast".sical to "public" as "maxmast";
grant index on "maxmast".sical to "public" as "maxmast";
grant select on "maxmast".sicr1 to "public" as "maxmast";
grant update on "maxmast".sicr1 to "public" as "maxmast";
grant insert on "maxmast".sicr1 to "public" as "maxmast";
grant delete on "maxmast".sicr1 to "public" as "maxmast";
grant index on "maxmast".sicr1 to "public" as "maxmast";
grant select on "maxmast".sicr2 to "public" as "maxmast";
grant update on "maxmast".sicr2 to "public" as "maxmast";
grant insert on "maxmast".sicr2 to "public" as "maxmast";
grant delete on "maxmast".sicr2 to "public" as "maxmast";
grant index on "maxmast".sicr2 to "public" as "maxmast";
grant select on "maxmast".sicr3 to "public" as "maxmast";
grant update on "maxmast".sicr3 to "public" as "maxmast";
grant insert on "maxmast".sicr3 to "public" as "maxmast";
grant delete on "maxmast".sicr3 to "public" as "maxmast";
grant index on "maxmast".sicr3 to "public" as "maxmast";
grant select on "maxmast".sicr4 to "public" as "maxmast";
grant update on "maxmast".sicr4 to "public" as "maxmast";
grant insert on "maxmast".sicr4 to "public" as "maxmast";
grant delete on "maxmast".sicr4 to "public" as "maxmast";
grant index on "maxmast".sicr4 to "public" as "maxmast";
grant select on "maxmast".sicr5 to "public" as "maxmast";
grant update on "maxmast".sicr5 to "public" as "maxmast";
grant insert on "maxmast".sicr5 to "public" as "maxmast";
grant delete on "maxmast".sicr5 to "public" as "maxmast";
grant index on "maxmast".sicr5 to "public" as "maxmast";
grant select on "maxmast".sicr6 to "public" as "maxmast";
grant update on "maxmast".sicr6 to "public" as "maxmast";
grant insert on "maxmast".sicr6 to "public" as "maxmast";
grant delete on "maxmast".sicr6 to "public" as "maxmast";
grant index on "maxmast".sicr6 to "public" as "maxmast";
grant select on "maxmast".siday to "public" as "maxmast";
grant update on "maxmast".siday to "public" as "maxmast";
grant insert on "maxmast".siday to "public" as "maxmast";
grant delete on "maxmast".siday to "public" as "maxmast";
grant index on "maxmast".siday to "public" as "maxmast";
grant select on "maxmast".siim1 to "public" as "maxmast";
grant update on "maxmast".siim1 to "public" as "maxmast";
grant insert on "maxmast".siim1 to "public" as "maxmast";
grant delete on "maxmast".siim1 to "public" as "maxmast";
grant index on "maxmast".siim1 to "public" as "maxmast";
grant select on "maxmast".silot to "public" as "maxmast";
grant update on "maxmast".silot to "public" as "maxmast";
grant insert on "maxmast".silot to "public" as "maxmast";
grant delete on "maxmast".silot to "public" as "maxmast";
grant index on "maxmast".silot to "public" as "maxmast";
grant select on "maxmast".simas to "public" as "maxmast";
grant update on "maxmast".simas to "public" as "maxmast";
grant insert on "maxmast".simas to "public" as "maxmast";
grant delete on "maxmast".simas to "public" as "maxmast";
grant index on "maxmast".simas to "public" as "maxmast";
grant select on "maxmast".simre to "public" as "maxmast";
grant update on "maxmast".simre to "public" as "maxmast";
grant insert on "maxmast".simre to "public" as "maxmast";
grant delete on "maxmast".simre to "public" as "maxmast";
grant index on "maxmast".simre to "public" as "maxmast";
grant select on "maxmast".simrp to "public" as "maxmast";
grant update on "maxmast".simrp to "public" as "maxmast";
grant insert on "maxmast".simrp to "public" as "maxmast";
grant delete on "maxmast".simrp to "public" as "maxmast";
grant index on "maxmast".simrp to "public" as "maxmast";
grant select on "maxmast".sinst to "public" as "maxmast";
grant update on "maxmast".sinst to "public" as "maxmast";
grant insert on "maxmast".sinst to "public" as "maxmast";
grant delete on "maxmast".sinst to "public" as "maxmast";
grant index on "maxmast".sinst to "public" as "maxmast";
grant select on "maxmast".sinwk to "public" as "maxmast";
grant update on "maxmast".sinwk to "public" as "maxmast";
grant insert on "maxmast".sinwk to "public" as "maxmast";
grant delete on "maxmast".sinwk to "public" as "maxmast";
grant index on "maxmast".sinwk to "public" as "maxmast";
grant select on "maxmast".siopa to "public" as "maxmast";
grant update on "maxmast".siopa to "public" as "maxmast";
grant insert on "maxmast".siopa to "public" as "maxmast";
grant delete on "maxmast".siopa to "public" as "maxmast";
grant index on "maxmast".siopa to "public" as "maxmast";
grant select on "maxmast".siop to "public" as "maxmast";
grant update on "maxmast".siop to "public" as "maxmast";
grant insert on "maxmast".siop to "public" as "maxmast";
grant delete on "maxmast".siop to "public" as "maxmast";
grant index on "maxmast".siop to "public" as "maxmast";
grant select on "maxmast".siopn to "public" as "maxmast";
grant update on "maxmast".siopn to "public" as "maxmast";
grant insert on "maxmast".siopn to "public" as "maxmast";
grant delete on "maxmast".siopn to "public" as "maxmast";
grant index on "maxmast".siopn to "public" as "maxmast";
grant select on "maxmast".siopp to "public" as "maxmast";
grant update on "maxmast".siopp to "public" as "maxmast";
grant insert on "maxmast".siopp to "public" as "maxmast";
grant delete on "maxmast".siopp to "public" as "maxmast";
grant index on "maxmast".siopp to "public" as "maxmast";
grant select on "maxmast".siopw to "public" as "maxmast";
grant update on "maxmast".siopw to "public" as "maxmast";
grant insert on "maxmast".siopw to "public" as "maxmast";
grant delete on "maxmast".siopw to "public" as "maxmast";
grant index on "maxmast".siopw to "public" as "maxmast";
grant select on "maxmast".siord to "public" as "maxmast";
grant update on "maxmast".siord to "public" as "maxmast";
grant insert on "maxmast".siord to "public" as "maxmast";
grant delete on "maxmast".siord to "public" as "maxmast";
grant index on "maxmast".siord to "public" as "maxmast";
grant select on "maxmast".sipar to "public" as "maxmast";
grant update on "maxmast".sipar to "public" as "maxmast";
grant insert on "maxmast".sipar to "public" as "maxmast";
grant delete on "maxmast".sipar to "public" as "maxmast";
grant index on "maxmast".sipar to "public" as "maxmast";
grant select on "maxmast".sipre to "public" as "maxmast";
grant update on "maxmast".sipre to "public" as "maxmast";
grant insert on "maxmast".sipre to "public" as "maxmast";
grant delete on "maxmast".sipre to "public" as "maxmast";
grant index on "maxmast".sipre to "public" as "maxmast";
grant select on "maxmast".siprp to "public" as "maxmast";
grant update on "maxmast".siprp to "public" as "maxmast";
grant insert on "maxmast".siprp to "public" as "maxmast";
grant delete on "maxmast".siprp to "public" as "maxmast";
grant index on "maxmast".siprp to "public" as "maxmast";
grant select on "maxmast".sipst to "public" as "maxmast";
grant update on "maxmast".sipst to "public" as "maxmast";
grant insert on "maxmast".sipst to "public" as "maxmast";
grant delete on "maxmast".sipst to "public" as "maxmast";
grant index on "maxmast".sipst to "public" as "maxmast";
grant select on "maxmast".siref to "public" as "maxmast";
grant update on "maxmast".siref to "public" as "maxmast";
grant insert on "maxmast".siref to "public" as "maxmast";
grant delete on "maxmast".siref to "public" as "maxmast";
grant index on "maxmast".siref to "public" as "maxmast";
grant select on "maxmast".sirm1 to "public" as "maxmast";
grant update on "maxmast".sirm1 to "public" as "maxmast";
grant insert on "maxmast".sirm1 to "public" as "maxmast";
grant delete on "maxmast".sirm1 to "public" as "maxmast";
grant index on "maxmast".sirm1 to "public" as "maxmast";
grant select on "maxmast".sirm2 to "public" as "maxmast";
grant update on "maxmast".sirm2 to "public" as "maxmast";
grant insert on "maxmast".sirm2 to "public" as "maxmast";
grant delete on "maxmast".sirm2 to "public" as "maxmast";
grant index on "maxmast".sirm2 to "public" as "maxmast";
grant select on "maxmast".sirm3 to "public" as "maxmast";
grant update on "maxmast".sirm3 to "public" as "maxmast";
grant insert on "maxmast".sirm3 to "public" as "maxmast";
grant delete on "maxmast".sirm3 to "public" as "maxmast";
grant index on "maxmast".sirm3 to "public" as "maxmast";
grant select on "maxmast".sirp1 to "public" as "maxmast";
grant update on "maxmast".sirp1 to "public" as "maxmast";
grant insert on "maxmast".sirp1 to "public" as "maxmast";
grant delete on "maxmast".sirp1 to "public" as "maxmast";
grant index on "maxmast".sirp1 to "public" as "maxmast";
grant select on "maxmast".sirp2 to "public" as "maxmast";
grant update on "maxmast".sirp2 to "public" as "maxmast";
grant insert on "maxmast".sirp2 to "public" as "maxmast";
grant delete on "maxmast".sirp2 to "public" as "maxmast";
grant index on "maxmast".sirp2 to "public" as "maxmast";
grant select on "maxmast".sirp3 to "public" as "maxmast";
grant update on "maxmast".sirp3 to "public" as "maxmast";
grant insert on "maxmast".sirp3 to "public" as "maxmast";
grant delete on "maxmast".sirp3 to "public" as "maxmast";
grant index on "maxmast".sirp3 to "public" as "maxmast";
grant select on "maxmast".sirp4 to "public" as "maxmast";
grant update on "maxmast".sirp4 to "public" as "maxmast";
grant insert on "maxmast".sirp4 to "public" as "maxmast";
grant delete on "maxmast".sirp4 to "public" as "maxmast";
grant index on "maxmast".sirp4 to "public" as "maxmast";
grant select on "maxmast".sirqt to "public" as "maxmast";
grant update on "maxmast".sirqt to "public" as "maxmast";
grant insert on "maxmast".sirqt to "public" as "maxmast";
grant delete on "maxmast".sirqt to "public" as "maxmast";
grant index on "maxmast".sirqt to "public" as "maxmast";
grant select on "maxmast".sirun to "public" as "maxmast";
grant update on "maxmast".sirun to "public" as "maxmast";
grant insert on "maxmast".sirun to "public" as "maxmast";
grant delete on "maxmast".sirun to "public" as "maxmast";
grant index on "maxmast".sirun to "public" as "maxmast";
grant select on "maxmast".sismt to "public" as "maxmast";
grant update on "maxmast".sismt to "public" as "maxmast";
grant insert on "maxmast".sismt to "public" as "maxmast";
grant delete on "maxmast".sismt to "public" as "maxmast";
grant index on "maxmast".sismt to "public" as "maxmast";
grant select on "maxmast".sisqt to "public" as "maxmast";
grant update on "maxmast".sisqt to "public" as "maxmast";
grant insert on "maxmast".sisqt to "public" as "maxmast";
grant delete on "maxmast".sisqt to "public" as "maxmast";
grant index on "maxmast".sisqt to "public" as "maxmast";
grant select on "maxmast".sitmp to "public" as "maxmast";
grant update on "maxmast".sitmp to "public" as "maxmast";
grant insert on "maxmast".sitmp to "public" as "maxmast";
grant delete on "maxmast".sitmp to "public" as "maxmast";
grant index on "maxmast".sitmp to "public" as "maxmast";
grant select on "maxmast".siwip to "public" as "maxmast";
grant update on "maxmast".siwip to "public" as "maxmast";
grant insert on "maxmast".siwip to "public" as "maxmast";
grant delete on "maxmast".siwip to "public" as "maxmast";
grant index on "maxmast".siwip to "public" as "maxmast";
grant select on "maxmast".sjord to "public" as "maxmast";
grant update on "maxmast".sjord to "public" as "maxmast";
grant insert on "maxmast".sjord to "public" as "maxmast";
grant delete on "maxmast".sjord to "public" as "maxmast";
grant index on "maxmast".sjord to "public" as "maxmast";
grant select on "maxmast".slaget to "public" as "maxmast";
grant update on "maxmast".slaget to "public" as "maxmast";
grant insert on "maxmast".slaget to "public" as "maxmast";
grant delete on "maxmast".slaget to "public" as "maxmast";
grant index on "maxmast".slaget to "public" as "maxmast";
grant select on "maxmast".slarea to "public" as "maxmast";
grant update on "maxmast".slarea to "public" as "maxmast";
grant insert on "maxmast".slarea to "public" as "maxmast";
grant delete on "maxmast".slarea to "public" as "maxmast";
grant index on "maxmast".slarea to "public" as "maxmast";
grant select on "maxmast".slbctl to "public" as "maxmast";
grant update on "maxmast".slbctl to "public" as "maxmast";
grant insert on "maxmast".slbctl to "public" as "maxmast";
grant delete on "maxmast".slbctl to "public" as "maxmast";
grant index on "maxmast".slbctl to "public" as "maxmast";
grant select on "maxmast".slcmsg to "public" as "maxmast";
grant update on "maxmast".slcmsg to "public" as "maxmast";
grant insert on "maxmast".slcmsg to "public" as "maxmast";
grant delete on "maxmast".slcmsg to "public" as "maxmast";
grant index on "maxmast".slcmsg to "public" as "maxmast";
grant select on "maxmast".slctyp to "public" as "maxmast";
grant update on "maxmast".slctyp to "public" as "maxmast";
grant insert on "maxmast".slctyp to "public" as "maxmast";
grant delete on "maxmast".slctyp to "public" as "maxmast";
grant index on "maxmast".slctyp to "public" as "maxmast";
grant select on "maxmast".sllet to "public" as "maxmast";
grant update on "maxmast".sllet to "public" as "maxmast";
grant insert on "maxmast".sllet to "public" as "maxmast";
grant delete on "maxmast".sllet to "public" as "maxmast";
grant index on "maxmast".sllet to "public" as "maxmast";
grant select on "maxmast".sllhst to "public" as "maxmast";
grant update on "maxmast".sllhst to "public" as "maxmast";
grant insert on "maxmast".sllhst to "public" as "maxmast";
grant delete on "maxmast".sllhst to "public" as "maxmast";
grant index on "maxmast".sllhst to "public" as "maxmast";
grant select on "maxmast".sllink to "public" as "maxmast";
grant update on "maxmast".sllink to "public" as "maxmast";
grant insert on "maxmast".sllink to "public" as "maxmast";
grant delete on "maxmast".sllink to "public" as "maxmast";
grant index on "maxmast".sllink to "public" as "maxmast";
grant select on "maxmast".slosb to "public" as "maxmast";
grant update on "maxmast".slosb to "public" as "maxmast";
grant insert on "maxmast".slosb to "public" as "maxmast";
grant delete on "maxmast".slosb to "public" as "maxmast";
grant index on "maxmast".slosb to "public" as "maxmast";
grant select on "maxmast".slpil to "public" as "maxmast";
grant update on "maxmast".slpil to "public" as "maxmast";
grant insert on "maxmast".slpil to "public" as "maxmast";
grant delete on "maxmast".slpil to "public" as "maxmast";
grant index on "maxmast".slpil to "public" as "maxmast";
grant select on "maxmast".slrgn to "public" as "maxmast";
grant update on "maxmast".slrgn to "public" as "maxmast";
grant insert on "maxmast".slrgn to "public" as "maxmast";
grant delete on "maxmast".slrgn to "public" as "maxmast";
grant index on "maxmast".slrgn to "public" as "maxmast";
grant select on "maxmast".slslsp to "public" as "maxmast";
grant update on "maxmast".slslsp to "public" as "maxmast";
grant insert on "maxmast".slslsp to "public" as "maxmast";
grant delete on "maxmast".slslsp to "public" as "maxmast";
grant index on "maxmast".slslsp to "public" as "maxmast";
grant select on "maxmast".slter to "public" as "maxmast";
grant update on "maxmast".slter to "public" as "maxmast";
grant insert on "maxmast".slter to "public" as "maxmast";
grant delete on "maxmast".slter to "public" as "maxmast";
grant index on "maxmast".slter to "public" as "maxmast";
grant select on "maxmast".sltx1 to "public" as "maxmast";
grant update on "maxmast".sltx1 to "public" as "maxmast";
grant insert on "maxmast".sltx1 to "public" as "maxmast";
grant delete on "maxmast".sltx1 to "public" as "maxmast";
grant index on "maxmast".sltx1 to "public" as "maxmast";
grant select on "maxmast".sltx2 to "public" as "maxmast";
grant update on "maxmast".sltx2 to "public" as "maxmast";
grant insert on "maxmast".sltx2 to "public" as "maxmast";
grant delete on "maxmast".sltx2 to "public" as "maxmast";
grant index on "maxmast".sltx2 to "public" as "maxmast";
grant select on "maxmast".slview to "public" as "maxmast";
grant update on "maxmast".slview to "public" as "maxmast";
grant insert on "maxmast".slview to "public" as "maxmast";
grant delete on "maxmast".slview to "public" as "maxmast";
grant index on "maxmast".slview to "public" as "maxmast";
grant select on "maxmast".terminal to "public" as "maxmast";
grant update on "maxmast".terminal to "public" as "maxmast";
grant insert on "maxmast".terminal to "public" as "maxmast";
grant delete on "maxmast".terminal to "public" as "maxmast";
grant index on "maxmast".terminal to "public" as "maxmast";
grant select on "maxmast".tranmask to "public" as "maxmast";
grant update on "maxmast".tranmask to "public" as "maxmast";
grant insert on "maxmast".tranmask to "public" as "maxmast";
grant delete on "maxmast".tranmask to "public" as "maxmast";
grant index on "maxmast".tranmask to "public" as "maxmast";
grant select on "maxmast".translate to "public" as "maxmast";
grant update on "maxmast".translate to "public" as "maxmast";
grant insert on "maxmast".translate to "public" as "maxmast";
grant delete on "maxmast".translate to "public" as "maxmast";
grant index on "maxmast".translate to "public" as "maxmast";
grant select on "maxmast".tredi to "public" as "maxmast";
grant update on "maxmast".tredi to "public" as "maxmast";
grant insert on "maxmast".tredi to "public" as "maxmast";
grant delete on "maxmast".tredi to "public" as "maxmast";
grant index on "maxmast".tredi to "public" as "maxmast";
grant select on "maxmast".txihi to "public" as "maxmast";
grant update on "maxmast".txihi to "public" as "maxmast";
grant insert on "maxmast".txihi to "public" as "maxmast";
grant delete on "maxmast".txihi to "public" as "maxmast";
grant index on "maxmast".txihi to "public" as "maxmast";
grant select on "maxmast".txiid to "public" as "maxmast";
grant update on "maxmast".txiid to "public" as "maxmast";
grant insert on "maxmast".txiid to "public" as "maxmast";
grant delete on "maxmast".txiid to "public" as "maxmast";
grant index on "maxmast".txiid to "public" as "maxmast";
grant select on "maxmast".txiii to "public" as "maxmast";
grant update on "maxmast".txiii to "public" as "maxmast";
grant insert on "maxmast".txiii to "public" as "maxmast";
grant delete on "maxmast".txiii to "public" as "maxmast";
grant index on "maxmast".txiii to "public" as "maxmast";
grant select on "maxmast".txpers to "public" as "maxmast";
grant update on "maxmast".txpers to "public" as "maxmast";
grant insert on "maxmast".txpers to "public" as "maxmast";
grant delete on "maxmast".txpers to "public" as "maxmast";
grant index on "maxmast".txpers to "public" as "maxmast";
grant select on "maxmast".users to "public" as "maxmast";
grant update on "maxmast".users to "public" as "maxmast";
grant insert on "maxmast".users to "public" as "maxmast";
grant delete on "maxmast".users to "public" as "maxmast";
grant index on "maxmast".users to "public" as "maxmast";
grant select on "maxmast".uz_stdxrte to "public" as "maxmast";
grant update on "maxmast".uz_stdxrte to "public" as "maxmast";
grant insert on "maxmast".uz_stdxrte to "public" as "maxmast";
grant delete on "maxmast".uz_stdxrte to "public" as "maxmast";
grant index on "maxmast".uz_stdxrte to "public" as "maxmast";
grant select on "maxmast".v_rcpt_in3 to "public" as "maxmast";
grant update on "maxmast".v_rcpt_in3 to "public" as "maxmast";
grant insert on "maxmast".v_rcpt_in3 to "public" as "maxmast";
grant delete on "maxmast".v_rcpt_in3 to "public" as "maxmast";
grant index on "maxmast".v_rcpt_in3 to "public" as "maxmast";
grant select on "maxmast".aradds to "public" as "maxmast";
grant update on "maxmast".aradds to "public" as "maxmast";
grant insert on "maxmast".aradds to "public" as "maxmast";
grant delete on "maxmast".aradds to "public" as "maxmast";
grant index on "maxmast".aradds to "public" as "maxmast";
grant select on "maxmast".arbat to "public" as "maxmast";
grant update on "maxmast".arbat to "public" as "maxmast";
grant insert on "maxmast".arbat to "public" as "maxmast";
grant delete on "maxmast".arbat to "public" as "maxmast";
grant index on "maxmast".arbat to "public" as "maxmast";
grant select on "maxmast".arctd to "public" as "maxmast";
grant update on "maxmast".arctd to "public" as "maxmast";
grant insert on "maxmast".arctd to "public" as "maxmast";
grant delete on "maxmast".arctd to "public" as "maxmast";
grant index on "maxmast".arctd to "public" as "maxmast";
grant select on "maxmast".arcyc to "public" as "maxmast";
grant update on "maxmast".arcyc to "public" as "maxmast";
grant insert on "maxmast".arcyc to "public" as "maxmast";
grant delete on "maxmast".arcyc to "public" as "maxmast";
grant index on "maxmast".arcyc to "public" as "maxmast";
grant select on "maxmast".argroup to "public" as "maxmast";
grant update on "maxmast".argroup to "public" as "maxmast";
grant insert on "maxmast".argroup to "public" as "maxmast";
grant delete on "maxmast".argroup to "public" as "maxmast";
grant index on "maxmast".argroup to "public" as "maxmast";
grant select on "maxmast".arloc to "public" as "maxmast";
grant update on "maxmast".arloc to "public" as "maxmast";
grant insert on "maxmast".arloc to "public" as "maxmast";
grant delete on "maxmast".arloc to "public" as "maxmast";
grant index on "maxmast".arloc to "public" as "maxmast";
grant select on "maxmast".armas to "public" as "maxmast";
grant update on "maxmast".armas to "public" as "maxmast";
grant insert on "maxmast".armas to "public" as "maxmast";
grant delete on "maxmast".armas to "public" as "maxmast";
grant index on "maxmast".armas to "public" as "maxmast";
grant select on "maxmast".arres to "public" as "maxmast";
grant update on "maxmast".arres to "public" as "maxmast";
grant insert on "maxmast".arres to "public" as "maxmast";
grant delete on "maxmast".arres to "public" as "maxmast";
grant index on "maxmast".arres to "public" as "maxmast";
grant select on "maxmast".artat to "public" as "maxmast";
grant update on "maxmast".artat to "public" as "maxmast";
grant insert on "maxmast".artat to "public" as "maxmast";
grant delete on "maxmast".artat to "public" as "maxmast";
grant index on "maxmast".artat to "public" as "maxmast";
grant select on "maxmast".artbf to "public" as "maxmast";
grant update on "maxmast".artbf to "public" as "maxmast";
grant insert on "maxmast".artbf to "public" as "maxmast";
grant delete on "maxmast".artbf to "public" as "maxmast";
grant index on "maxmast".artbf to "public" as "maxmast";
grant select on "maxmast".artta to "public" as "maxmast";
grant update on "maxmast".artta to "public" as "maxmast";
grant insert on "maxmast".artta to "public" as "maxmast";
grant delete on "maxmast".artta to "public" as "maxmast";
grant index on "maxmast".artta to "public" as "maxmast";
grant select on "maxmast".artxd to "public" as "maxmast";
grant update on "maxmast".artxd to "public" as "maxmast";
grant insert on "maxmast".artxd to "public" as "maxmast";
grant delete on "maxmast".artxd to "public" as "maxmast";
grant index on "maxmast".artxd to "public" as "maxmast";
grant select on "maxmast".asbbd to "public" as "maxmast";
grant update on "maxmast".asbbd to "public" as "maxmast";
grant insert on "maxmast".asbbd to "public" as "maxmast";
grant delete on "maxmast".asbbd to "public" as "maxmast";
grant index on "maxmast".asbbd to "public" as "maxmast";
grant select on "maxmast".asbbh to "public" as "maxmast";
grant update on "maxmast".asbbh to "public" as "maxmast";
grant insert on "maxmast".asbbh to "public" as "maxmast";
grant delete on "maxmast".asbbh to "public" as "maxmast";
grant index on "maxmast".asbbh to "public" as "maxmast";
grant select on "maxmast".ascap to "public" as "maxmast";
grant update on "maxmast".ascap to "public" as "maxmast";
grant insert on "maxmast".ascap to "public" as "maxmast";
grant delete on "maxmast".ascap to "public" as "maxmast";
grant index on "maxmast".ascap to "public" as "maxmast";
grant select on "maxmast".ascon to "public" as "maxmast";
grant update on "maxmast".ascon to "public" as "maxmast";
grant insert on "maxmast".ascon to "public" as "maxmast";
grant delete on "maxmast".ascon to "public" as "maxmast";
grant index on "maxmast".ascon to "public" as "maxmast";
grant select on "maxmast".aslod to "public" as "maxmast";
grant update on "maxmast".aslod to "public" as "maxmast";
grant insert on "maxmast".aslod to "public" as "maxmast";
grant delete on "maxmast".aslod to "public" as "maxmast";
grant index on "maxmast".aslod to "public" as "maxmast";
grant select on "maxmast".asrqt to "public" as "maxmast";
grant update on "maxmast".asrqt to "public" as "maxmast";
grant insert on "maxmast".asrqt to "public" as "maxmast";
grant delete on "maxmast".asrqt to "public" as "maxmast";
grant index on "maxmast".asrqt to "public" as "maxmast";
grant select on "maxmast".assdr to "public" as "maxmast";
grant update on "maxmast".assdr to "public" as "maxmast";
grant insert on "maxmast".assdr to "public" as "maxmast";
grant delete on "maxmast".assdr to "public" as "maxmast";
grant index on "maxmast".assdr to "public" as "maxmast";
grant select on "maxmast".bkacct to "public" as "maxmast";
grant update on "maxmast".bkacct to "public" as "maxmast";
grant insert on "maxmast".bkacct to "public" as "maxmast";
grant delete on "maxmast".bkacct to "public" as "maxmast";
grant index on "maxmast".bkacct to "public" as "maxmast";
grant select on "maxmast".bkarc to "public" as "maxmast";
grant update on "maxmast".bkarc to "public" as "maxmast";
grant insert on "maxmast".bkarc to "public" as "maxmast";
grant delete on "maxmast".bkarc to "public" as "maxmast";
grant index on "maxmast".bkarc to "public" as "maxmast";
grant select on "maxmast".bkcva to "public" as "maxmast";
grant update on "maxmast".bkcva to "public" as "maxmast";
grant insert on "maxmast".bkcva to "public" as "maxmast";
grant delete on "maxmast".bkcva to "public" as "maxmast";
grant index on "maxmast".bkcva to "public" as "maxmast";
grant select on "maxmast".bkexh to "public" as "maxmast";
grant update on "maxmast".bkexh to "public" as "maxmast";
grant insert on "maxmast".bkexh to "public" as "maxmast";
grant delete on "maxmast".bkexh to "public" as "maxmast";
grant index on "maxmast".bkexh to "public" as "maxmast";
grant select on "maxmast".bkfrm to "public" as "maxmast";
grant update on "maxmast".bkfrm to "public" as "maxmast";
grant insert on "maxmast".bkfrm to "public" as "maxmast";
grant delete on "maxmast".bkfrm to "public" as "maxmast";
grant index on "maxmast".bkfrm to "public" as "maxmast";
grant select on "maxmast".bkint to "public" as "maxmast";
grant update on "maxmast".bkint to "public" as "maxmast";
grant insert on "maxmast".bkint to "public" as "maxmast";
grant delete on "maxmast".bkint to "public" as "maxmast";
grant index on "maxmast".bkint to "public" as "maxmast";
grant select on "maxmast".bkpayee to "public" as "maxmast";
grant update on "maxmast".bkpayee to "public" as "maxmast";
grant insert on "maxmast".bkpayee to "public" as "maxmast";
grant delete on "maxmast".bkpayee to "public" as "maxmast";
grant index on "maxmast".bkpayee to "public" as "maxmast";
grant select on "maxmast".bkpaymnt to "public" as "maxmast";
grant update on "maxmast".bkpaymnt to "public" as "maxmast";
grant insert on "maxmast".bkpaymnt to "public" as "maxmast";
grant delete on "maxmast".bkpaymnt to "public" as "maxmast";
grant index on "maxmast".bkpaymnt to "public" as "maxmast";
grant select on "maxmast".bkrec to "public" as "maxmast";
grant update on "maxmast".bkrec to "public" as "maxmast";
grant insert on "maxmast".bkrec to "public" as "maxmast";
grant delete on "maxmast".bkrec to "public" as "maxmast";
grant index on "maxmast".bkrec to "public" as "maxmast";
grant select on "maxmast".bksus to "public" as "maxmast";
grant update on "maxmast".bksus to "public" as "maxmast";
grant insert on "maxmast".bksus to "public" as "maxmast";
grant delete on "maxmast".bksus to "public" as "maxmast";
grant index on "maxmast".bksus to "public" as "maxmast";
grant select on "maxmast".bksym to "public" as "maxmast";
grant update on "maxmast".bksym to "public" as "maxmast";
grant insert on "maxmast".bksym to "public" as "maxmast";
grant delete on "maxmast".bksym to "public" as "maxmast";
grant index on "maxmast".bksym to "public" as "maxmast";
grant select on "maxmast".bksyr to "public" as "maxmast";
grant update on "maxmast".bksyr to "public" as "maxmast";
grant insert on "maxmast".bksyr to "public" as "maxmast";
grant delete on "maxmast".bksyr to "public" as "maxmast";
grant index on "maxmast".bksyr to "public" as "maxmast";
grant select on "maxmast".clbal to "public" as "maxmast";
grant update on "maxmast".clbal to "public" as "maxmast";
grant insert on "maxmast".clbal to "public" as "maxmast";
grant delete on "maxmast".clbal to "public" as "maxmast";
grant index on "maxmast".clbal to "public" as "maxmast";
grant select on "maxmast".clcat to "public" as "maxmast";
grant update on "maxmast".clcat to "public" as "maxmast";
grant insert on "maxmast".clcat to "public" as "maxmast";
grant delete on "maxmast".clcat to "public" as "maxmast";
grant index on "maxmast".clcat to "public" as "maxmast";
grant select on "maxmast".clcbg to "public" as "maxmast";
grant update on "maxmast".clcbg to "public" as "maxmast";
grant insert on "maxmast".clcbg to "public" as "maxmast";
grant delete on "maxmast".clcbg to "public" as "maxmast";
grant index on "maxmast".clcbg to "public" as "maxmast";
grant select on "maxmast".clcen to "public" as "maxmast";
grant update on "maxmast".clcen to "public" as "maxmast";
grant insert on "maxmast".clcen to "public" as "maxmast";
grant delete on "maxmast".clcen to "public" as "maxmast";
grant index on "maxmast".clcen to "public" as "maxmast";
grant select on "maxmast".clctp to "public" as "maxmast";
grant update on "maxmast".clctp to "public" as "maxmast";
grant insert on "maxmast".clctp to "public" as "maxmast";
grant delete on "maxmast".clctp to "public" as "maxmast";
grant index on "maxmast".clctp to "public" as "maxmast";
grant select on "maxmast".clhst to "public" as "maxmast";
grant update on "maxmast".clhst to "public" as "maxmast";
grant insert on "maxmast".clhst to "public" as "maxmast";
grant delete on "maxmast".clhst to "public" as "maxmast";
grant index on "maxmast".clhst to "public" as "maxmast";
grant select on "maxmast".cllnk to "public" as "maxmast";
grant update on "maxmast".cllnk to "public" as "maxmast";
grant insert on "maxmast".cllnk to "public" as "maxmast";
grant delete on "maxmast".cllnk to "public" as "maxmast";
grant index on "maxmast".cllnk to "public" as "maxmast";
grant select on "maxmast".clobg to "public" as "maxmast";
grant update on "maxmast".clobg to "public" as "maxmast";
grant insert on "maxmast".clobg to "public" as "maxmast";
grant delete on "maxmast".clobg to "public" as "maxmast";
grant index on "maxmast".clobg to "public" as "maxmast";
grant select on "maxmast".clopn to "public" as "maxmast";
grant update on "maxmast".clopn to "public" as "maxmast";
grant insert on "maxmast".clopn to "public" as "maxmast";
grant delete on "maxmast".clopn to "public" as "maxmast";
grant index on "maxmast".clopn to "public" as "maxmast";
grant select on "maxmast".clord to "public" as "maxmast";
grant update on "maxmast".clord to "public" as "maxmast";
grant insert on "maxmast".clord to "public" as "maxmast";
grant delete on "maxmast".clord to "public" as "maxmast";
grant index on "maxmast".clord to "public" as "maxmast";
grant select on "maxmast".cospm to "public" as "maxmast";
grant update on "maxmast".cospm to "public" as "maxmast";
grant insert on "maxmast".cospm to "public" as "maxmast";
grant delete on "maxmast".cospm to "public" as "maxmast";
grant index on "maxmast".cospm to "public" as "maxmast";
grant select on "maxmast".crate to "public" as "maxmast";
grant update on "maxmast".crate to "public" as "maxmast";
grant insert on "maxmast".crate to "public" as "maxmast";
grant delete on "maxmast".crate to "public" as "maxmast";
grant index on "maxmast".crate to "public" as "maxmast";
grant select on "maxmast".cumas to "public" as "maxmast";
grant update on "maxmast".cumas to "public" as "maxmast";
grant insert on "maxmast".cumas to "public" as "maxmast";
grant delete on "maxmast".cumas to "public" as "maxmast";
grant index on "maxmast".cumas to "public" as "maxmast";
grant select on "maxmast".cusbk to "public" as "maxmast";
grant update on "maxmast".cusbk to "public" as "maxmast";
grant insert on "maxmast".cusbk to "public" as "maxmast";
grant delete on "maxmast".cusbk to "public" as "maxmast";
grant index on "maxmast".cusbk to "public" as "maxmast";
grant select on "maxmast".dndpt to "public" as "maxmast";
grant update on "maxmast".dndpt to "public" as "maxmast";
grant insert on "maxmast".dndpt to "public" as "maxmast";
grant delete on "maxmast".dndpt to "public" as "maxmast";
grant index on "maxmast".dndpt to "public" as "maxmast";
grant select on "maxmast".dnfnc to "public" as "maxmast";
grant update on "maxmast".dnfnc to "public" as "maxmast";
grant insert on "maxmast".dnfnc to "public" as "maxmast";
grant delete on "maxmast".dnfnc to "public" as "maxmast";
grant index on "maxmast".dnfnc to "public" as "maxmast";
grant select on "maxmast".dnprs to "public" as "maxmast";
grant update on "maxmast".dnprs to "public" as "maxmast";
grant insert on "maxmast".dnprs to "public" as "maxmast";
grant delete on "maxmast".dnprs to "public" as "maxmast";
grant index on "maxmast".dnprs to "public" as "maxmast";
grant select on "maxmast".dnrpg to "public" as "maxmast";
grant update on "maxmast".dnrpg to "public" as "maxmast";
grant insert on "maxmast".dnrpg to "public" as "maxmast";
grant delete on "maxmast".dnrpg to "public" as "maxmast";
grant index on "maxmast".dnrpg to "public" as "maxmast";
grant select on "maxmast".dorec to "public" as "maxmast";
grant update on "maxmast".dorec to "public" as "maxmast";
grant insert on "maxmast".dorec to "public" as "maxmast";
grant delete on "maxmast".dorec to "public" as "maxmast";
grant index on "maxmast".dorec to "public" as "maxmast";
grant select on "maxmast".glapc to "public" as "maxmast";
grant update on "maxmast".glapc to "public" as "maxmast";
grant insert on "maxmast".glapc to "public" as "maxmast";
grant delete on "maxmast".glapc to "public" as "maxmast";
grant index on "maxmast".glapc to "public" as "maxmast";
grant select on "maxmast".glapt to "public" as "maxmast";
grant update on "maxmast".glapt to "public" as "maxmast";
grant insert on "maxmast".glapt to "public" as "maxmast";
grant delete on "maxmast".glapt to "public" as "maxmast";
grant index on "maxmast".glapt to "public" as "maxmast";
grant select on "maxmast".glbatch to "public" as "maxmast";
grant update on "maxmast".glbatch to "public" as "maxmast";
grant insert on "maxmast".glbatch to "public" as "maxmast";
grant delete on "maxmast".glbatch to "public" as "maxmast";
grant index on "maxmast".glbatch to "public" as "maxmast";
grant select on "maxmast".glhist to "public" as "maxmast";
grant update on "maxmast".glhist to "public" as "maxmast";
grant insert on "maxmast".glhist to "public" as "maxmast";
grant delete on "maxmast".glhist to "public" as "maxmast";
grant index on "maxmast".glhist to "public" as "maxmast";
grant select on "maxmast".glmas to "public" as "maxmast";
grant update on "maxmast".glmas to "public" as "maxmast";
grant insert on "maxmast".glmas to "public" as "maxmast";
grant delete on "maxmast".glmas to "public" as "maxmast";
grant index on "maxmast".glmas to "public" as "maxmast";
grant select on "maxmast".glpara to "public" as "maxmast";
grant update on "maxmast".glpara to "public" as "maxmast";
grant insert on "maxmast".glpara to "public" as "maxmast";
grant delete on "maxmast".glpara to "public" as "maxmast";
grant index on "maxmast".glpara to "public" as "maxmast";
grant select on "maxmast".glstan to "public" as "maxmast";
grant update on "maxmast".glstan to "public" as "maxmast";
grant insert on "maxmast".glstan to "public" as "maxmast";
grant delete on "maxmast".glstan to "public" as "maxmast";
grant index on "maxmast".glstan to "public" as "maxmast";
grant select on "maxmast".gltran to "public" as "maxmast";
grant update on "maxmast".gltran to "public" as "maxmast";
grant insert on "maxmast".gltran to "public" as "maxmast";
grant delete on "maxmast".gltran to "public" as "maxmast";
grant index on "maxmast".gltran to "public" as "maxmast";
grant select on "maxmast".glyer to "public" as "maxmast";
grant update on "maxmast".glyer to "public" as "maxmast";
grant insert on "maxmast".glyer to "public" as "maxmast";
grant delete on "maxmast".glyer to "public" as "maxmast";
grant index on "maxmast".glyer to "public" as "maxmast";
grant select on "maxmast".imcpr to "public" as "maxmast";
grant update on "maxmast".imcpr to "public" as "maxmast";
grant insert on "maxmast".imcpr to "public" as "maxmast";
grant delete on "maxmast".imcpr to "public" as "maxmast";
grant index on "maxmast".imcpr to "public" as "maxmast";
grant select on "maxmast".imfac to "public" as "maxmast";
grant update on "maxmast".imfac to "public" as "maxmast";
grant insert on "maxmast".imfac to "public" as "maxmast";
grant delete on "maxmast".imfac to "public" as "maxmast";
grant index on "maxmast".imfac to "public" as "maxmast";
grant select on "maxmast".imgrp to "public" as "maxmast";
grant update on "maxmast".imgrp to "public" as "maxmast";
grant insert on "maxmast".imgrp to "public" as "maxmast";
grant delete on "maxmast".imgrp to "public" as "maxmast";
grant index on "maxmast".imgrp to "public" as "maxmast";
grant select on "maxmast".imprc to "public" as "maxmast";
grant update on "maxmast".imprc to "public" as "maxmast";
grant insert on "maxmast".imprc to "public" as "maxmast";
grant delete on "maxmast".imprc to "public" as "maxmast";
grant index on "maxmast".imprc to "public" as "maxmast";
grant select on "maxmast".impty to "public" as "maxmast";
grant update on "maxmast".impty to "public" as "maxmast";
grant insert on "maxmast".impty to "public" as "maxmast";
grant delete on "maxmast".impty to "public" as "maxmast";
grant index on "maxmast".impty to "public" as "maxmast";
grant select on "maxmast".imsul to "public" as "maxmast";
grant update on "maxmast".imsul to "public" as "maxmast";
grant insert on "maxmast".imsul to "public" as "maxmast";
grant delete on "maxmast".imsul to "public" as "maxmast";
grant index on "maxmast".imsul to "public" as "maxmast";
grant select on "maxmast".kiact to "public" as "maxmast";
grant update on "maxmast".kiact to "public" as "maxmast";
grant insert on "maxmast".kiact to "public" as "maxmast";
grant delete on "maxmast".kiact to "public" as "maxmast";
grant index on "maxmast".kiact to "public" as "maxmast";
grant select on "maxmast".kialt to "public" as "maxmast";
grant update on "maxmast".kialt to "public" as "maxmast";
grant insert on "maxmast".kialt to "public" as "maxmast";
grant delete on "maxmast".kialt to "public" as "maxmast";
grant index on "maxmast".kialt to "public" as "maxmast";
grant select on "maxmast".kictl to "public" as "maxmast";
grant update on "maxmast".kictl to "public" as "maxmast";
grant insert on "maxmast".kictl to "public" as "maxmast";
grant delete on "maxmast".kictl to "public" as "maxmast";
grant index on "maxmast".kictl to "public" as "maxmast";
grant select on "maxmast".kifor to "public" as "maxmast";
grant update on "maxmast".kifor to "public" as "maxmast";
grant insert on "maxmast".kifor to "public" as "maxmast";
grant delete on "maxmast".kifor to "public" as "maxmast";
grant index on "maxmast".kifor to "public" as "maxmast";
grant select on "maxmast".kihdr to "public" as "maxmast";
grant update on "maxmast".kihdr to "public" as "maxmast";
grant insert on "maxmast".kihdr to "public" as "maxmast";
grant delete on "maxmast".kihdr to "public" as "maxmast";
grant index on "maxmast".kihdr to "public" as "maxmast";
grant select on "maxmast".kihst to "public" as "maxmast";
grant update on "maxmast".kihst to "public" as "maxmast";
grant insert on "maxmast".kihst to "public" as "maxmast";
grant delete on "maxmast".kihst to "public" as "maxmast";
grant index on "maxmast".kihst to "public" as "maxmast";
grant select on "maxmast".kiint to "public" as "maxmast";
grant update on "maxmast".kiint to "public" as "maxmast";
grant insert on "maxmast".kiint to "public" as "maxmast";
grant delete on "maxmast".kiint to "public" as "maxmast";
grant index on "maxmast".kiint to "public" as "maxmast";
grant select on "maxmast".kirou to "public" as "maxmast";
grant update on "maxmast".kirou to "public" as "maxmast";
grant insert on "maxmast".kirou to "public" as "maxmast";
grant delete on "maxmast".kirou to "public" as "maxmast";
grant index on "maxmast".kirou to "public" as "maxmast";
grant select on "maxmast".kitxt to "public" as "maxmast";
grant update on "maxmast".kitxt to "public" as "maxmast";
grant insert on "maxmast".kitxt to "public" as "maxmast";
grant delete on "maxmast".kitxt to "public" as "maxmast";
grant index on "maxmast".kitxt to "public" as "maxmast";
grant select on "maxmast".kiusr to "public" as "maxmast";
grant update on "maxmast".kiusr to "public" as "maxmast";
grant insert on "maxmast".kiusr to "public" as "maxmast";
grant delete on "maxmast".kiusr to "public" as "maxmast";
grant index on "maxmast".kiusr to "public" as "maxmast";
grant select on "maxmast".kival to "public" as "maxmast";
grant update on "maxmast".kival to "public" as "maxmast";
grant insert on "maxmast".kival to "public" as "maxmast";
grant delete on "maxmast".kival to "public" as "maxmast";
grant index on "maxmast".kival to "public" as "maxmast";
grant select on "maxmast".masdt to "public" as "maxmast";
grant update on "maxmast".masdt to "public" as "maxmast";
grant insert on "maxmast".masdt to "public" as "maxmast";
grant delete on "maxmast".masdt to "public" as "maxmast";
grant index on "maxmast".masdt to "public" as "maxmast";
grant select on "maxmast".mashr to "public" as "maxmast";
grant update on "maxmast".mashr to "public" as "maxmast";
grant insert on "maxmast".mashr to "public" as "maxmast";
grant delete on "maxmast".mashr to "public" as "maxmast";
grant index on "maxmast".mashr to "public" as "maxmast";
grant select on "maxmast".mfhst to "public" as "maxmast";
grant update on "maxmast".mfhst to "public" as "maxmast";
grant insert on "maxmast".mfhst to "public" as "maxmast";
grant delete on "maxmast".mfhst to "public" as "maxmast";
grant index on "maxmast".mfhst to "public" as "maxmast";
grant select on "maxmast".mford to "public" as "maxmast";
grant update on "maxmast".mford to "public" as "maxmast";
grant insert on "maxmast".mford to "public" as "maxmast";
grant delete on "maxmast".mford to "public" as "maxmast";
grant index on "maxmast".mford to "public" as "maxmast";
grant select on "maxmast".mmali to "public" as "maxmast";
grant update on "maxmast".mmali to "public" as "maxmast";
grant insert on "maxmast".mmali to "public" as "maxmast";
grant delete on "maxmast".mmali to "public" as "maxmast";
grant index on "maxmast".mmali to "public" as "maxmast";
grant select on "maxmast".mmaut to "public" as "maxmast";
grant update on "maxmast".mmaut to "public" as "maxmast";
grant insert on "maxmast".mmaut to "public" as "maxmast";
grant delete on "maxmast".mmaut to "public" as "maxmast";
grant index on "maxmast".mmaut to "public" as "maxmast";
grant select on "maxmast".mmcst to "public" as "maxmast";
grant update on "maxmast".mmcst to "public" as "maxmast";
grant insert on "maxmast".mmcst to "public" as "maxmast";
grant delete on "maxmast".mmcst to "public" as "maxmast";
grant index on "maxmast".mmcst to "public" as "maxmast";
grant select on "maxmast".mmsys to "public" as "maxmast";
grant update on "maxmast".mmsys to "public" as "maxmast";
grant insert on "maxmast".mmsys to "public" as "maxmast";
grant delete on "maxmast".mmsys to "public" as "maxmast";
grant index on "maxmast".mmsys to "public" as "maxmast";
grant select on "maxmast".mmtsk to "public" as "maxmast";
grant update on "maxmast".mmtsk to "public" as "maxmast";
grant insert on "maxmast".mmtsk to "public" as "maxmast";
grant delete on "maxmast".mmtsk to "public" as "maxmast";
grant index on "maxmast".mmtsk to "public" as "maxmast";
grant select on "maxmast".mmtty to "public" as "maxmast";
grant update on "maxmast".mmtty to "public" as "maxmast";
grant insert on "maxmast".mmtty to "public" as "maxmast";
grant delete on "maxmast".mmtty to "public" as "maxmast";
grant index on "maxmast".mmtty to "public" as "maxmast";
grant select on "maxmast".mmusr to "public" as "maxmast";
grant update on "maxmast".mmusr to "public" as "maxmast";
grant insert on "maxmast".mmusr to "public" as "maxmast";
grant delete on "maxmast".mmusr to "public" as "maxmast";
grant index on "maxmast".mmusr to "public" as "maxmast";
grant select on "maxmast".ndcon to "public" as "maxmast";
grant update on "maxmast".ndcon to "public" as "maxmast";
grant insert on "maxmast".ndcon to "public" as "maxmast";
grant delete on "maxmast".ndcon to "public" as "maxmast";
grant index on "maxmast".ndcon to "public" as "maxmast";
grant select on "maxmast".ndmas to "public" as "maxmast";
grant update on "maxmast".ndmas to "public" as "maxmast";
grant insert on "maxmast".ndmas to "public" as "maxmast";
grant delete on "maxmast".ndmas to "public" as "maxmast";
grant index on "maxmast".ndmas to "public" as "maxmast";
grant select on "maxmast".nvbin to "public" as "maxmast";
grant update on "maxmast".nvbin to "public" as "maxmast";
grant insert on "maxmast".nvbin to "public" as "maxmast";
grant delete on "maxmast".nvbin to "public" as "maxmast";
grant index on "maxmast".nvbin to "public" as "maxmast";
grant select on "maxmast".nvsto to "public" as "maxmast";
grant update on "maxmast".nvsto to "public" as "maxmast";
grant insert on "maxmast".nvsto to "public" as "maxmast";
grant delete on "maxmast".nvsto to "public" as "maxmast";
grant index on "maxmast".nvsto to "public" as "maxmast";
grant select on "maxmast".oechd to "public" as "maxmast";
grant update on "maxmast".oechd to "public" as "maxmast";
grant insert on "maxmast".oechd to "public" as "maxmast";
grant delete on "maxmast".oechd to "public" as "maxmast";
grant index on "maxmast".oechd to "public" as "maxmast";
grant select on "maxmast".oecln to "public" as "maxmast";
grant update on "maxmast".oecln to "public" as "maxmast";
grant insert on "maxmast".oecln to "public" as "maxmast";
grant delete on "maxmast".oecln to "public" as "maxmast";
grant index on "maxmast".oecln to "public" as "maxmast";
grant select on "maxmast".oecms to "public" as "maxmast";
grant update on "maxmast".oecms to "public" as "maxmast";
grant insert on "maxmast".oecms to "public" as "maxmast";
grant delete on "maxmast".oecms to "public" as "maxmast";
grant index on "maxmast".oecms to "public" as "maxmast";
grant select on "maxmast".oecpt to "public" as "maxmast";
grant update on "maxmast".oecpt to "public" as "maxmast";
grant insert on "maxmast".oecpt to "public" as "maxmast";
grant delete on "maxmast".oecpt to "public" as "maxmast";
grant index on "maxmast".oecpt to "public" as "maxmast";
grant select on "maxmast".oecus to "public" as "maxmast";
grant update on "maxmast".oecus to "public" as "maxmast";
grant insert on "maxmast".oecus to "public" as "maxmast";
grant delete on "maxmast".oecus to "public" as "maxmast";
grant index on "maxmast".oecus to "public" as "maxmast";
grant select on "maxmast".oedpt to "public" as "maxmast";
grant update on "maxmast".oedpt to "public" as "maxmast";
grant insert on "maxmast".oedpt to "public" as "maxmast";
grant delete on "maxmast".oedpt to "public" as "maxmast";
grant index on "maxmast".oedpt to "public" as "maxmast";
grant select on "maxmast".oeim to "public" as "maxmast";
grant update on "maxmast".oeim to "public" as "maxmast";
grant insert on "maxmast".oeim to "public" as "maxmast";
grant delete on "maxmast".oeim to "public" as "maxmast";
grant index on "maxmast".oeim to "public" as "maxmast";
grant select on "maxmast".oelin to "public" as "maxmast";
grant update on "maxmast".oelin to "public" as "maxmast";
grant insert on "maxmast".oelin to "public" as "maxmast";
grant delete on "maxmast".oelin to "public" as "maxmast";
grant index on "maxmast".oelin to "public" as "maxmast";
grant select on "maxmast".oemcr to "public" as "maxmast";
grant update on "maxmast".oemcr to "public" as "maxmast";
grant insert on "maxmast".oemcr to "public" as "maxmast";
grant delete on "maxmast".oemcr to "public" as "maxmast";
grant index on "maxmast".oemcr to "public" as "maxmast";
grant select on "maxmast".oempr to "public" as "maxmast";
grant update on "maxmast".oempr to "public" as "maxmast";
grant insert on "maxmast".oempr to "public" as "maxmast";
grant delete on "maxmast".oempr to "public" as "maxmast";
grant index on "maxmast".oempr to "public" as "maxmast";
grant select on "maxmast".oemsc to "public" as "maxmast";
grant update on "maxmast".oemsc to "public" as "maxmast";
grant insert on "maxmast".oemsc to "public" as "maxmast";
grant delete on "maxmast".oemsc to "public" as "maxmast";
grant index on "maxmast".oemsc to "public" as "maxmast";
grant select on "maxmast".oepar to "public" as "maxmast";
grant update on "maxmast".oepar to "public" as "maxmast";
grant insert on "maxmast".oepar to "public" as "maxmast";
grant delete on "maxmast".oepar to "public" as "maxmast";
grant index on "maxmast".oepar to "public" as "maxmast";
grant select on "maxmast".oephdr to "public" as "maxmast";
grant update on "maxmast".oephdr to "public" as "maxmast";
grant insert on "maxmast".oephdr to "public" as "maxmast";
grant delete on "maxmast".oephdr to "public" as "maxmast";
grant index on "maxmast".oephdr to "public" as "maxmast";
grant select on "maxmast".oepkg to "public" as "maxmast";
grant update on "maxmast".oepkg to "public" as "maxmast";
grant insert on "maxmast".oepkg to "public" as "maxmast";
grant delete on "maxmast".oepkg to "public" as "maxmast";
grant index on "maxmast".oepkg to "public" as "maxmast";
grant select on "maxmast".oeshp to "public" as "maxmast";
grant update on "maxmast".oeshp to "public" as "maxmast";
grant insert on "maxmast".oeshp to "public" as "maxmast";
grant delete on "maxmast".oeshp to "public" as "maxmast";
grant index on "maxmast".oeshp to "public" as "maxmast";
grant select on "maxmast".oetrn to "public" as "maxmast";
grant update on "maxmast".oetrn to "public" as "maxmast";
grant insert on "maxmast".oetrn to "public" as "maxmast";
grant delete on "maxmast".oetrn to "public" as "maxmast";
grant index on "maxmast".oetrn to "public" as "maxmast";
grant select on "maxmast".outrg to "public" as "maxmast";
grant update on "maxmast".outrg to "public" as "maxmast";
grant insert on "maxmast".outrg to "public" as "maxmast";
grant delete on "maxmast".outrg to "public" as "maxmast";
grant index on "maxmast".outrg to "public" as "maxmast";
grant select on "maxmast".pdchq to "public" as "maxmast";
grant update on "maxmast".pdchq to "public" as "maxmast";
grant insert on "maxmast".pdchq to "public" as "maxmast";
grant delete on "maxmast".pdchq to "public" as "maxmast";
grant index on "maxmast".pdchq to "public" as "maxmast";
grant select on "maxmast".phlin to "public" as "maxmast";
grant update on "maxmast".phlin to "public" as "maxmast";
grant insert on "maxmast".phlin to "public" as "maxmast";
grant delete on "maxmast".phlin to "public" as "maxmast";
grant index on "maxmast".phlin to "public" as "maxmast";
grant select on "maxmast".phord to "public" as "maxmast";
grant update on "maxmast".phord to "public" as "maxmast";
grant insert on "maxmast".phord to "public" as "maxmast";
grant delete on "maxmast".phord to "public" as "maxmast";
grant index on "maxmast".phord to "public" as "maxmast";
grant select on "maxmast".phrel to "public" as "maxmast";
grant update on "maxmast".phrel to "public" as "maxmast";
grant insert on "maxmast".phrel to "public" as "maxmast";
grant delete on "maxmast".phrel to "public" as "maxmast";
grant index on "maxmast".phrel to "public" as "maxmast";
grant select on "maxmast".plarch to "public" as "maxmast";
grant update on "maxmast".plarch to "public" as "maxmast";
grant insert on "maxmast".plarch to "public" as "maxmast";
grant delete on "maxmast".plarch to "public" as "maxmast";
grant index on "maxmast".plarch to "public" as "maxmast";
grant select on "maxmast".plcum to "public" as "maxmast";
grant update on "maxmast".plcum to "public" as "maxmast";
grant insert on "maxmast".plcum to "public" as "maxmast";
grant delete on "maxmast".plcum to "public" as "maxmast";
grant index on "maxmast".plcum to "public" as "maxmast";
grant select on "maxmast".plcva to "public" as "maxmast";
grant update on "maxmast".plcva to "public" as "maxmast";
grant insert on "maxmast".plcva to "public" as "maxmast";
grant delete on "maxmast".plcva to "public" as "maxmast";
grant index on "maxmast".plcva to "public" as "maxmast";
grant select on "maxmast".plopn to "public" as "maxmast";
grant update on "maxmast".plopn to "public" as "maxmast";
grant insert on "maxmast".plopn to "public" as "maxmast";
grant delete on "maxmast".plopn to "public" as "maxmast";
grant index on "maxmast".plopn to "public" as "maxmast";
grant select on "maxmast".plpara to "public" as "maxmast";
grant update on "maxmast".plpara to "public" as "maxmast";
grant insert on "maxmast".plpara to "public" as "maxmast";
grant delete on "maxmast".plpara to "public" as "maxmast";
grant index on "maxmast".plpara to "public" as "maxmast";
grant select on "maxmast".plstat to "public" as "maxmast";
grant update on "maxmast".plstat to "public" as "maxmast";
grant insert on "maxmast".plstat to "public" as "maxmast";
grant delete on "maxmast".plstat to "public" as "maxmast";
grant index on "maxmast".plstat to "public" as "maxmast";
grant select on "maxmast".plsupp to "public" as "maxmast";
grant update on "maxmast".plsupp to "public" as "maxmast";
grant insert on "maxmast".plsupp to "public" as "maxmast";
grant delete on "maxmast".plsupp to "public" as "maxmast";
grant index on "maxmast".plsupp to "public" as "maxmast";
grant select on "maxmast".plterm to "public" as "maxmast";
grant update on "maxmast".plterm to "public" as "maxmast";
grant insert on "maxmast".plterm to "public" as "maxmast";
grant delete on "maxmast".plterm to "public" as "maxmast";
grant index on "maxmast".plterm to "public" as "maxmast";
grant select on "maxmast".pltran to "public" as "maxmast";
grant update on "maxmast".pltran to "public" as "maxmast";
grant insert on "maxmast".pltran to "public" as "maxmast";
grant delete on "maxmast".pltran to "public" as "maxmast";
grant index on "maxmast".pltran to "public" as "maxmast";
grant select on "maxmast".pltrig to "public" as "maxmast";
grant update on "maxmast".pltrig to "public" as "maxmast";
grant insert on "maxmast".pltrig to "public" as "maxmast";
grant delete on "maxmast".pltrig to "public" as "maxmast";
grant index on "maxmast".pltrig to "public" as "maxmast";
grant select on "maxmast".prall to "public" as "maxmast";
grant update on "maxmast".prall to "public" as "maxmast";
grant insert on "maxmast".prall to "public" as "maxmast";
grant delete on "maxmast".prall to "public" as "maxmast";
grant index on "maxmast".prall to "public" as "maxmast";
grant select on "maxmast".prhed to "public" as "maxmast";
grant update on "maxmast".prhed to "public" as "maxmast";
grant insert on "maxmast".prhed to "public" as "maxmast";
grant delete on "maxmast".prhed to "public" as "maxmast";
grant index on "maxmast".prhed to "public" as "maxmast";
grant select on "maxmast".prlin to "public" as "maxmast";
grant update on "maxmast".prlin to "public" as "maxmast";
grant insert on "maxmast".prlin to "public" as "maxmast";
grant delete on "maxmast".prlin to "public" as "maxmast";
grant index on "maxmast".prlin to "public" as "maxmast";
grant select on "maxmast".prpara to "public" as "maxmast";
grant update on "maxmast".prpara to "public" as "maxmast";
grant insert on "maxmast".prpara to "public" as "maxmast";
grant delete on "maxmast".prpara to "public" as "maxmast";
grant index on "maxmast".prpara to "public" as "maxmast";
grant select on "maxmast".pucst to "public" as "maxmast";
grant update on "maxmast".pucst to "public" as "maxmast";
grant insert on "maxmast".pucst to "public" as "maxmast";
grant delete on "maxmast".pucst to "public" as "maxmast";
grant index on "maxmast".pucst to "public" as "maxmast";
grant select on "maxmast".pugrn to "public" as "maxmast";
grant update on "maxmast".pugrn to "public" as "maxmast";
grant insert on "maxmast".pugrn to "public" as "maxmast";
grant delete on "maxmast".pugrn to "public" as "maxmast";
grant index on "maxmast".pugrn to "public" as "maxmast";
grant select on "maxmast".pulin to "public" as "maxmast";
grant update on "maxmast".pulin to "public" as "maxmast";
grant insert on "maxmast".pulin to "public" as "maxmast";
grant delete on "maxmast".pulin to "public" as "maxmast";
grant index on "maxmast".pulin to "public" as "maxmast";
grant select on "maxmast".purel to "public" as "maxmast";
grant update on "maxmast".purel to "public" as "maxmast";
grant insert on "maxmast".purel to "public" as "maxmast";
grant delete on "maxmast".purel to "public" as "maxmast";
grant index on "maxmast".purel to "public" as "maxmast";
grant select on "maxmast".pusup to "public" as "maxmast";
grant update on "maxmast".pusup to "public" as "maxmast";
grant insert on "maxmast".pusup to "public" as "maxmast";
grant delete on "maxmast".pusup to "public" as "maxmast";
grant index on "maxmast".pusup to "public" as "maxmast";
grant select on "maxmast".rqmas to "public" as "maxmast";
grant update on "maxmast".rqmas to "public" as "maxmast";
grant insert on "maxmast".rqmas to "public" as "maxmast";
grant delete on "maxmast".rqmas to "public" as "maxmast";
grant index on "maxmast".rqmas to "public" as "maxmast";
grant select on "maxmast".rtcen to "public" as "maxmast";
grant update on "maxmast".rtcen to "public" as "maxmast";
grant insert on "maxmast".rtcen to "public" as "maxmast";
grant delete on "maxmast".rtcen to "public" as "maxmast";
grant index on "maxmast".rtcen to "public" as "maxmast";
grant select on "maxmast".slarc to "public" as "maxmast";
grant update on "maxmast".slarc to "public" as "maxmast";
grant insert on "maxmast".slarc to "public" as "maxmast";
grant delete on "maxmast".slarc to "public" as "maxmast";
grant index on "maxmast".slarc to "public" as "maxmast";
grant select on "maxmast".slcum to "public" as "maxmast";
grant update on "maxmast".slcum to "public" as "maxmast";
grant insert on "maxmast".slcum to "public" as "maxmast";
grant delete on "maxmast".slcum to "public" as "maxmast";
grant index on "maxmast".slcum to "public" as "maxmast";
grant select on "maxmast".slcust to "public" as "maxmast";
grant update on "maxmast".slcust to "public" as "maxmast";
grant insert on "maxmast".slcust to "public" as "maxmast";
grant delete on "maxmast".slcust to "public" as "maxmast";
grant index on "maxmast".slcust to "public" as "maxmast";
grant select on "maxmast".slcva to "public" as "maxmast";
grant update on "maxmast".slcva to "public" as "maxmast";
grant insert on "maxmast".slcva to "public" as "maxmast";
grant delete on "maxmast".slcva to "public" as "maxmast";
grant index on "maxmast".slcva to "public" as "maxmast";
grant select on "maxmast".slopn to "public" as "maxmast";
grant update on "maxmast".slopn to "public" as "maxmast";
grant insert on "maxmast".slopn to "public" as "maxmast";
grant delete on "maxmast".slopn to "public" as "maxmast";
grant index on "maxmast".slopn to "public" as "maxmast";
grant select on "maxmast".sloptn to "public" as "maxmast";
grant update on "maxmast".sloptn to "public" as "maxmast";
grant insert on "maxmast".sloptn to "public" as "maxmast";
grant delete on "maxmast".sloptn to "public" as "maxmast";
grant index on "maxmast".sloptn to "public" as "maxmast";
grant select on "maxmast".slrnd to "public" as "maxmast";
grant update on "maxmast".slrnd to "public" as "maxmast";
grant insert on "maxmast".slrnd to "public" as "maxmast";
grant delete on "maxmast".slrnd to "public" as "maxmast";
grant index on "maxmast".slrnd to "public" as "maxmast";
grant select on "maxmast".slstat to "public" as "maxmast";
grant update on "maxmast".slstat to "public" as "maxmast";
grant insert on "maxmast".slstat to "public" as "maxmast";
grant delete on "maxmast".slstat to "public" as "maxmast";
grant index on "maxmast".slstat to "public" as "maxmast";
grant select on "maxmast".slterm to "public" as "maxmast";
grant update on "maxmast".slterm to "public" as "maxmast";
grant insert on "maxmast".slterm to "public" as "maxmast";
grant delete on "maxmast".slterm to "public" as "maxmast";
grant index on "maxmast".slterm to "public" as "maxmast";
grant select on "maxmast".sltran to "public" as "maxmast";
grant update on "maxmast".sltran to "public" as "maxmast";
grant insert on "maxmast".sltran to "public" as "maxmast";
grant delete on "maxmast".sltran to "public" as "maxmast";
grant index on "maxmast".sltran to "public" as "maxmast";
grant select on "maxmast".smact to "public" as "maxmast";
grant update on "maxmast".smact to "public" as "maxmast";
grant insert on "maxmast".smact to "public" as "maxmast";
grant delete on "maxmast".smact to "public" as "maxmast";
grant index on "maxmast".smact to "public" as "maxmast";
grant select on "maxmast".smchd to "public" as "maxmast";
grant update on "maxmast".smchd to "public" as "maxmast";
grant insert on "maxmast".smchd to "public" as "maxmast";
grant delete on "maxmast".smchd to "public" as "maxmast";
grant index on "maxmast".smchd to "public" as "maxmast";
grant select on "maxmast".smcln to "public" as "maxmast";
grant update on "maxmast".smcln to "public" as "maxmast";
grant insert on "maxmast".smcln to "public" as "maxmast";
grant delete on "maxmast".smcln to "public" as "maxmast";
grant index on "maxmast".smcln to "public" as "maxmast";
grant select on "maxmast".smcnc to "public" as "maxmast";
grant update on "maxmast".smcnc to "public" as "maxmast";
grant insert on "maxmast".smcnc to "public" as "maxmast";
grant delete on "maxmast".smcnc to "public" as "maxmast";
grant index on "maxmast".smcnc to "public" as "maxmast";
grant select on "maxmast".smcpt to "public" as "maxmast";
grant update on "maxmast".smcpt to "public" as "maxmast";
grant insert on "maxmast".smcpt to "public" as "maxmast";
grant delete on "maxmast".smcpt to "public" as "maxmast";
grant index on "maxmast".smcpt to "public" as "maxmast";
grant select on "maxmast".smcrt to "public" as "maxmast";
grant update on "maxmast".smcrt to "public" as "maxmast";
grant insert on "maxmast".smcrt to "public" as "maxmast";
grant delete on "maxmast".smcrt to "public" as "maxmast";
grant index on "maxmast".smcrt to "public" as "maxmast";
grant select on "maxmast".smcst to "public" as "maxmast";
grant update on "maxmast".smcst to "public" as "maxmast";
grant insert on "maxmast".smcst to "public" as "maxmast";
grant delete on "maxmast".smcst to "public" as "maxmast";
grant index on "maxmast".smcst to "public" as "maxmast";
grant select on "maxmast".smdis to "public" as "maxmast";
grant update on "maxmast".smdis to "public" as "maxmast";
grant insert on "maxmast".smdis to "public" as "maxmast";
grant delete on "maxmast".smdis to "public" as "maxmast";
grant index on "maxmast".smdis to "public" as "maxmast";
grant select on "maxmast".smedy to "public" as "maxmast";
grant update on "maxmast".smedy to "public" as "maxmast";
grant insert on "maxmast".smedy to "public" as "maxmast";
grant delete on "maxmast".smedy to "public" as "maxmast";
grant index on "maxmast".smedy to "public" as "maxmast";
grant select on "maxmast".smesk to "public" as "maxmast";
grant update on "maxmast".smesk to "public" as "maxmast";
grant insert on "maxmast".smesk to "public" as "maxmast";
grant delete on "maxmast".smesk to "public" as "maxmast";
grant index on "maxmast".smesk to "public" as "maxmast";
grant select on "maxmast".smety to "public" as "maxmast";
grant update on "maxmast".smety to "public" as "maxmast";
grant insert on "maxmast".smety to "public" as "maxmast";
grant delete on "maxmast".smety to "public" as "maxmast";
grant index on "maxmast".smety to "public" as "maxmast";
grant select on "maxmast".smfir to "public" as "maxmast";
grant update on "maxmast".smfir to "public" as "maxmast";
grant insert on "maxmast".smfir to "public" as "maxmast";
grant delete on "maxmast".smfir to "public" as "maxmast";
grant index on "maxmast".smfir to "public" as "maxmast";
grant select on "maxmast".smhdr to "public" as "maxmast";
grant update on "maxmast".smhdr to "public" as "maxmast";
grant insert on "maxmast".smhdr to "public" as "maxmast";
grant delete on "maxmast".smhdr to "public" as "maxmast";
grant index on "maxmast".smhdr to "public" as "maxmast";
grant select on "maxmast".smilh to "public" as "maxmast";
grant update on "maxmast".smilh to "public" as "maxmast";
grant insert on "maxmast".smilh to "public" as "maxmast";
grant delete on "maxmast".smilh to "public" as "maxmast";
grant index on "maxmast".smilh to "public" as "maxmast";
grant select on "maxmast".smilp to "public" as "maxmast";
grant update on "maxmast".smilp to "public" as "maxmast";
grant insert on "maxmast".smilp to "public" as "maxmast";
grant delete on "maxmast".smilp to "public" as "maxmast";
grant index on "maxmast".smilp to "public" as "maxmast";
grant select on "maxmast".smilt to "public" as "maxmast";
grant update on "maxmast".smilt to "public" as "maxmast";
grant insert on "maxmast".smilt to "public" as "maxmast";
grant delete on "maxmast".smilt to "public" as "maxmast";
grant index on "maxmast".smilt to "public" as "maxmast";
grant select on "maxmast".smlin to "public" as "maxmast";
grant update on "maxmast".smlin to "public" as "maxmast";
grant insert on "maxmast".smlin to "public" as "maxmast";
grant delete on "maxmast".smlin to "public" as "maxmast";
grant index on "maxmast".smlin to "public" as "maxmast";
grant select on "maxmast".smlpr to "public" as "maxmast";
grant update on "maxmast".smlpr to "public" as "maxmast";
grant insert on "maxmast".smlpr to "public" as "maxmast";
grant delete on "maxmast".smlpr to "public" as "maxmast";
grant index on "maxmast".smlpr to "public" as "maxmast";
grant select on "maxmast".smpst to "public" as "maxmast";
grant update on "maxmast".smpst to "public" as "maxmast";
grant insert on "maxmast".smpst to "public" as "maxmast";
grant delete on "maxmast".smpst to "public" as "maxmast";
grant index on "maxmast".smpst to "public" as "maxmast";
grant select on "maxmast".smrch to "public" as "maxmast";
grant update on "maxmast".smrch to "public" as "maxmast";
grant insert on "maxmast".smrch to "public" as "maxmast";
grant delete on "maxmast".smrch to "public" as "maxmast";
grant index on "maxmast".smrch to "public" as "maxmast";
grant select on "maxmast".smrde to "public" as "maxmast";
grant update on "maxmast".smrde to "public" as "maxmast";
grant insert on "maxmast".smrde to "public" as "maxmast";
grant delete on "maxmast".smrde to "public" as "maxmast";
grant index on "maxmast".smrde to "public" as "maxmast";
grant select on "maxmast".smres to "public" as "maxmast";
grant update on "maxmast".smres to "public" as "maxmast";
grant insert on "maxmast".smres to "public" as "maxmast";
grant delete on "maxmast".smres to "public" as "maxmast";
grant index on "maxmast".smres to "public" as "maxmast";
grant select on "maxmast".smrhd to "public" as "maxmast";
grant update on "maxmast".smrhd to "public" as "maxmast";
grant insert on "maxmast".smrhd to "public" as "maxmast";
grant delete on "maxmast".smrhd to "public" as "maxmast";
grant index on "maxmast".smrhd to "public" as "maxmast";
grant select on "maxmast".smrse to "public" as "maxmast";
grant update on "maxmast".smrse to "public" as "maxmast";
grant insert on "maxmast".smrse to "public" as "maxmast";
grant delete on "maxmast".smrse to "public" as "maxmast";
grant index on "maxmast".smrse to "public" as "maxmast";
grant select on "maxmast".smrta to "public" as "maxmast";
grant update on "maxmast".smrta to "public" as "maxmast";
grant insert on "maxmast".smrta to "public" as "maxmast";
grant delete on "maxmast".smrta to "public" as "maxmast";
grant index on "maxmast".smrta to "public" as "maxmast";
grant select on "maxmast".smrtx to "public" as "maxmast";
grant update on "maxmast".smrtx to "public" as "maxmast";
grant insert on "maxmast".smrtx to "public" as "maxmast";
grant delete on "maxmast".smrtx to "public" as "maxmast";
grant index on "maxmast".smrtx to "public" as "maxmast";
grant select on "maxmast".smrty to "public" as "maxmast";
grant update on "maxmast".smrty to "public" as "maxmast";
grant insert on "maxmast".smrty to "public" as "maxmast";
grant delete on "maxmast".smrty to "public" as "maxmast";
grant index on "maxmast".smrty to "public" as "maxmast";
grant select on "maxmast".smseh to "public" as "maxmast";
grant update on "maxmast".smseh to "public" as "maxmast";
grant insert on "maxmast".smseh to "public" as "maxmast";
grant delete on "maxmast".smseh to "public" as "maxmast";
grant index on "maxmast".smseh to "public" as "maxmast";
grant select on "maxmast".smsel to "public" as "maxmast";
grant update on "maxmast".smsel to "public" as "maxmast";
grant insert on "maxmast".smsel to "public" as "maxmast";
grant delete on "maxmast".smsel to "public" as "maxmast";
grant index on "maxmast".smsel to "public" as "maxmast";
grant select on "maxmast".smsrn to "public" as "maxmast";
grant update on "maxmast".smsrn to "public" as "maxmast";
grant insert on "maxmast".smsrn to "public" as "maxmast";
grant delete on "maxmast".smsrn to "public" as "maxmast";
grant index on "maxmast".smsrn to "public" as "maxmast";
grant select on "maxmast".smsst to "public" as "maxmast";
grant update on "maxmast".smsst to "public" as "maxmast";
grant insert on "maxmast".smsst to "public" as "maxmast";
grant delete on "maxmast".smsst to "public" as "maxmast";
grant index on "maxmast".smsst to "public" as "maxmast";
grant select on "maxmast".smstg to "public" as "maxmast";
grant update on "maxmast".smstg to "public" as "maxmast";
grant insert on "maxmast".smstg to "public" as "maxmast";
grant delete on "maxmast".smstg to "public" as "maxmast";
grant index on "maxmast".smstg to "public" as "maxmast";
grant select on "maxmast".smsun to "public" as "maxmast";
grant update on "maxmast".smsun to "public" as "maxmast";
grant insert on "maxmast".smsun to "public" as "maxmast";
grant delete on "maxmast".smsun to "public" as "maxmast";
grant index on "maxmast".smsun to "public" as "maxmast";
grant select on "maxmast".smtdt to "public" as "maxmast";
grant update on "maxmast".smtdt to "public" as "maxmast";
grant insert on "maxmast".smtdt to "public" as "maxmast";
grant delete on "maxmast".smtdt to "public" as "maxmast";
grant index on "maxmast".smtdt to "public" as "maxmast";
grant select on "maxmast".smthd to "public" as "maxmast";
grant update on "maxmast".smthd to "public" as "maxmast";
grant insert on "maxmast".smthd to "public" as "maxmast";
grant delete on "maxmast".smthd to "public" as "maxmast";
grant index on "maxmast".smthd to "public" as "maxmast";
grant select on "maxmast".smwbl to "public" as "maxmast";
grant update on "maxmast".smwbl to "public" as "maxmast";
grant insert on "maxmast".smwbl to "public" as "maxmast";
grant delete on "maxmast".smwbl to "public" as "maxmast";
grant index on "maxmast".smwbl to "public" as "maxmast";
grant select on "maxmast".smwbs to "public" as "maxmast";
grant update on "maxmast".smwbs to "public" as "maxmast";
grant insert on "maxmast".smwbs to "public" as "maxmast";
grant delete on "maxmast".smwbs to "public" as "maxmast";
grant index on "maxmast".smwbs to "public" as "maxmast";
grant select on "maxmast".txlink to "public" as "maxmast";
grant update on "maxmast".txlink to "public" as "maxmast";
grant insert on "maxmast".txlink to "public" as "maxmast";
grant delete on "maxmast".txlink to "public" as "maxmast";
grant index on "maxmast".txlink to "public" as "maxmast";
grant select on "maxmast".txpara to "public" as "maxmast";
grant update on "maxmast".txpara to "public" as "maxmast";
grant insert on "maxmast".txpara to "public" as "maxmast";
grant delete on "maxmast".txpara to "public" as "maxmast";
grant index on "maxmast".txpara to "public" as "maxmast";
grant select on "maxmast".txrate to "public" as "maxmast";
grant update on "maxmast".txrate to "public" as "maxmast";
grant insert on "maxmast".txrate to "public" as "maxmast";
grant delete on "maxmast".txrate to "public" as "maxmast";
grant index on "maxmast".txrate to "public" as "maxmast";
grant select on "maxmast".txstat to "public" as "maxmast";
grant update on "maxmast".txstat to "public" as "maxmast";
grant insert on "maxmast".txstat to "public" as "maxmast";
grant delete on "maxmast".txstat to "public" as "maxmast";
grant index on "maxmast".txstat to "public" as "maxmast";
grant select on "maxmast".txtran to "public" as "maxmast";
grant update on "maxmast".txtran to "public" as "maxmast";
grant insert on "maxmast".txtran to "public" as "maxmast";
grant delete on "maxmast".txtran to "public" as "maxmast";
grant index on "maxmast".txtran to "public" as "maxmast";
grant select on "maxmast".whais to "public" as "maxmast";
grant update on "maxmast".whais to "public" as "maxmast";
grant insert on "maxmast".whais to "public" as "maxmast";
grant delete on "maxmast".whais to "public" as "maxmast";
grant index on "maxmast".whais to "public" as "maxmast";
grant select on "maxmast".whbay to "public" as "maxmast";
grant update on "maxmast".whbay to "public" as "maxmast";
grant insert on "maxmast".whbay to "public" as "maxmast";
grant delete on "maxmast".whbay to "public" as "maxmast";
grant index on "maxmast".whbay to "public" as "maxmast";
grant select on "maxmast".whbem to "public" as "maxmast";
grant update on "maxmast".whbem to "public" as "maxmast";
grant insert on "maxmast".whbem to "public" as "maxmast";
grant delete on "maxmast".whbem to "public" as "maxmast";
grant index on "maxmast".whbem to "public" as "maxmast";
grant select on "maxmast".whbty to "public" as "maxmast";
grant update on "maxmast".whbty to "public" as "maxmast";
grant insert on "maxmast".whbty to "public" as "maxmast";
grant delete on "maxmast".whbty to "public" as "maxmast";
grant index on "maxmast".whbty to "public" as "maxmast";
grant select on "maxmast".whpak to "public" as "maxmast";
grant update on "maxmast".whpak to "public" as "maxmast";
grant insert on "maxmast".whpak to "public" as "maxmast";
grant delete on "maxmast".whpak to "public" as "maxmast";
grant index on "maxmast".whpak to "public" as "maxmast";
grant select on "maxmast".whpru to "public" as "maxmast";
grant update on "maxmast".whpru to "public" as "maxmast";
grant insert on "maxmast".whpru to "public" as "maxmast";
grant delete on "maxmast".whpru to "public" as "maxmast";
grant index on "maxmast".whpru to "public" as "maxmast";
grant select on "maxmast".whpst to "public" as "maxmast";
grant update on "maxmast".whpst to "public" as "maxmast";
grant insert on "maxmast".whpst to "public" as "maxmast";
grant delete on "maxmast".whpst to "public" as "maxmast";
grant index on "maxmast".whpst to "public" as "maxmast";
grant select on "maxmast".whpty to "public" as "maxmast";
grant update on "maxmast".whpty to "public" as "maxmast";
grant insert on "maxmast".whpty to "public" as "maxmast";
grant delete on "maxmast".whpty to "public" as "maxmast";
grant index on "maxmast".whpty to "public" as "maxmast";
grant select on "maxmast".whrea to "public" as "maxmast";
grant update on "maxmast".whrea to "public" as "maxmast";
grant insert on "maxmast".whrea to "public" as "maxmast";
grant delete on "maxmast".whrea to "public" as "maxmast";
grant index on "maxmast".whrea to "public" as "maxmast";
grant select on "maxmast".whret to "public" as "maxmast";
grant update on "maxmast".whret to "public" as "maxmast";
grant insert on "maxmast".whret to "public" as "maxmast";
grant delete on "maxmast".whret to "public" as "maxmast";
grant index on "maxmast".whret to "public" as "maxmast";
grant select on "maxmast".whsal to "public" as "maxmast";
grant update on "maxmast".whsal to "public" as "maxmast";
grant insert on "maxmast".whsal to "public" as "maxmast";
grant delete on "maxmast".whsal to "public" as "maxmast";
grant index on "maxmast".whsal to "public" as "maxmast";
grant select on "maxmast".whszn to "public" as "maxmast";
grant update on "maxmast".whszn to "public" as "maxmast";
grant insert on "maxmast".whszn to "public" as "maxmast";
grant delete on "maxmast".whszn to "public" as "maxmast";
grant index on "maxmast".whszn to "public" as "maxmast";
grant select on "maxmast".whzon to "public" as "maxmast";
grant update on "maxmast".whzon to "public" as "maxmast";
grant insert on "maxmast".whzon to "public" as "maxmast";
grant delete on "maxmast".whzon to "public" as "maxmast";
grant index on "maxmast".whzon to "public" as "maxmast";
grant select on "maxmast".prtax to "public" as "maxmast";
grant update on "maxmast".prtax to "public" as "maxmast";
grant insert on "maxmast".prtax to "public" as "maxmast";
grant delete on "maxmast".prtax to "public" as "maxmast";
grant index on "maxmast".prtax to "public" as "maxmast";
grant select on "maxmast".imsto to "public" as "maxmast";
grant update on "maxmast".imsto to "public" as "maxmast";
grant insert on "maxmast".imsto to "public" as "maxmast";
grant delete on "maxmast".imsto to "public" as "maxmast";
grant index on "maxmast".imsto to "public" as "maxmast";
grant select on "maxmast".cust_tmp to "public" as "maxmast";
grant update on "maxmast".cust_tmp to "public" as "maxmast";
grant insert on "maxmast".cust_tmp to "public" as "maxmast";
grant delete on "maxmast".cust_tmp to "public" as "maxmast";
grant index on "maxmast".cust_tmp to "public" as "maxmast";
grant select on "maxmast".sysmenus to "public" as "maxmast";
grant update on "maxmast".sysmenus to "public" as "maxmast";
grant insert on "maxmast".sysmenus to "public" as "maxmast";
grant delete on "maxmast".sysmenus to "public" as "maxmast";
grant index on "maxmast".sysmenus to "public" as "maxmast";
grant select on "maxmast".sysmenuitems to "public" as "maxmast";
grant update on "maxmast".sysmenuitems to "public" as "maxmast";
grant insert on "maxmast".sysmenuitems to "public" as "maxmast";
grant delete on "maxmast".sysmenuitems to "public" as "maxmast";
grant index on "maxmast".sysmenuitems to "public" as "maxmast";
grant select on "maxmast".arpara to "public" as "maxmast";
grant update on "maxmast".arpara to "public" as "maxmast";
grant insert on "maxmast".arpara to "public" as "maxmast";
grant delete on "maxmast".arpara to "public" as "maxmast";
grant index on "maxmast".arpara to "public" as "maxmast";
grant select on "maxmast".nwmtlbcst to "public" as "maxmast";
grant update on "maxmast".nwmtlbcst to "public" as "maxmast";
grant insert on "maxmast".nwmtlbcst to "public" as "maxmast";
grant delete on "maxmast".nwmtlbcst to "public" as "maxmast";
grant index on "maxmast".nwmtlbcst to "public" as "maxmast";
grant select on "maxmast".mtlbcst to "public" as "maxmast";
grant update on "maxmast".mtlbcst to "public" as "maxmast";
grant insert on "maxmast".mtlbcst to "public" as "maxmast";
grant delete on "maxmast".mtlbcst to "public" as "maxmast";
grant index on "maxmast".mtlbcst to "public" as "maxmast";
grant select on "maxmast".imsup to "public" as "maxmast";
grant update on "maxmast".imsup to "public" as "maxmast";
grant insert on "maxmast".imsup to "public" as "maxmast";
grant delete on "maxmast".imsup to "public" as "maxmast";
grant index on "maxmast".imsup to "public" as "maxmast";
grant select on "maxmast".oemer to "public" as "maxmast";
grant update on "maxmast".oemer to "public" as "maxmast";
grant insert on "maxmast".oemer to "public" as "maxmast";
grant delete on "maxmast".oemer to "public" as "maxmast";
grant index on "maxmast".oemer to "public" as "maxmast";
grant select on "maxmast".oehdr to "public" as "maxmast";
grant update on "maxmast".oehdr to "public" as "maxmast";
grant insert on "maxmast".oehdr to "public" as "maxmast";
grant delete on "maxmast".oehdr to "public" as "maxmast";
grant index on "maxmast".oehdr to "public" as "maxmast";
grant select on "maxmast".uoe02a to "public" as "maxmast";
grant update on "maxmast".uoe02a to "public" as "maxmast";
grant insert on "maxmast".uoe02a to "public" as "maxmast";
grant delete on "maxmast".uoe02a to "public" as "maxmast";
grant index on "maxmast".uoe02a to "public" as "maxmast";
grant select on "maxmast".packdtl to "public" as "maxmast";
grant update on "maxmast".packdtl to "public" as "maxmast";
grant insert on "maxmast".packdtl to "public" as "maxmast";
grant delete on "maxmast".packdtl to "public" as "maxmast";
grant index on "maxmast".packdtl to "public" as "maxmast";
grant select on "maxmast".oldsoinfo to "public" as "maxmast";
grant update on "maxmast".oldsoinfo to "public" as "maxmast";
grant insert on "maxmast".oldsoinfo to "public" as "maxmast";
grant delete on "maxmast".oldsoinfo to "public" as "maxmast";
grant index on "maxmast".oldsoinfo to "public" as "maxmast";
grant select on "maxmast".nvtrn to "public" as "maxmast";
grant update on "maxmast".nvtrn to "public" as "maxmast";
grant insert on "maxmast".nvtrn to "public" as "maxmast";
grant delete on "maxmast".nvtrn to "public" as "maxmast";
grant index on "maxmast".nvtrn to "public" as "maxmast";
grant select on "maxmast".imast to "public" as "maxmast";
grant update on "maxmast".imast to "public" as "maxmast";
grant insert on "maxmast".imast to "public" as "maxmast";
grant delete on "maxmast".imast to "public" as "maxmast";
grant index on "maxmast".imast to "public" as "maxmast";
grant select on "maxmast".uzfsc to "public" as "maxmast";
grant update on "maxmast".uzfsc to "public" as "maxmast";
grant insert on "maxmast".uzfsc to "public" as "maxmast";
grant delete on "maxmast".uzfsc to "public" as "maxmast";
grant index on "maxmast".uzfsc to "public" as "maxmast";
grant select on "maxmast".uzuom to "public" as "maxmast";
grant update on "maxmast".uzuom to "public" as "maxmast";
grant insert on "maxmast".uzuom to "public" as "maxmast";
grant delete on "maxmast".uzuom to "public" as "maxmast";
grant index on "maxmast".uzuom to "public" as "maxmast";
grant select on "maxmast".uzmford to "public" as "maxmast";
grant update on "maxmast".uzmford to "public" as "maxmast";
grant insert on "maxmast".uzmford to "public" as "maxmast";
grant delete on "maxmast".uzmford to "public" as "maxmast";
grant index on "maxmast".uzmford to "public" as "maxmast";
grant select on "maxmast".uzmrcpt to "public" as "maxmast";
grant update on "maxmast".uzmrcpt to "public" as "maxmast";
grant insert on "maxmast".uzmrcpt to "public" as "maxmast";
grant delete on "maxmast".uzmrcpt to "public" as "maxmast";
grant index on "maxmast".uzmrcpt to "public" as "maxmast";
grant select on "maxmast".uzmfop to "public" as "maxmast";
grant update on "maxmast".uzmfop to "public" as "maxmast";
grant insert on "maxmast".uzmfop to "public" as "maxmast";
grant delete on "maxmast".uzmfop to "public" as "maxmast";
grant index on "maxmast".uzmfop to "public" as "maxmast";
grant select on "maxmast".uzmrqt to "public" as "maxmast";
grant update on "maxmast".uzmrqt to "public" as "maxmast";
grant insert on "maxmast".uzmrqt to "public" as "maxmast";
grant delete on "maxmast".uzmrqt to "public" as "maxmast";
grant index on "maxmast".uzmrqt to "public" as "maxmast";
grant select on "maxmast".uzmr1for to "public" as "maxmast";
grant update on "maxmast".uzmr1for to "public" as "maxmast";
grant insert on "maxmast".uzmr1for to "public" as "maxmast";
grant delete on "maxmast".uzmr1for to "public" as "maxmast";
grant index on "maxmast".uzmr1for to "public" as "maxmast";
grant select on "maxmast".uzpbrsh to "public" as "maxmast";
grant update on "maxmast".uzpbrsh to "public" as "maxmast";
grant insert on "maxmast".uzpbrsh to "public" as "maxmast";
grant delete on "maxmast".uzpbrsh to "public" as "maxmast";
grant index on "maxmast".uzpbrsh to "public" as "maxmast";
grant select on "maxmast".uztemp1 to "public" as "maxmast";
grant update on "maxmast".uztemp1 to "public" as "maxmast";
grant insert on "maxmast".uztemp1 to "public" as "maxmast";
grant delete on "maxmast".uztemp1 to "public" as "maxmast";
grant index on "maxmast".uztemp1 to "public" as "maxmast";
grant select on "maxmast".uzprtop to "public" as "maxmast";
grant update on "maxmast".uzprtop to "public" as "maxmast";
grant insert on "maxmast".uzprtop to "public" as "maxmast";
grant delete on "maxmast".uzprtop to "public" as "maxmast";
grant index on "maxmast".uzprtop to "public" as "maxmast";
grant select on "maxmast".uzpbr to "public" as "maxmast";
grant update on "maxmast".uzpbr to "public" as "maxmast";
grant insert on "maxmast".uzpbr to "public" as "maxmast";
grant delete on "maxmast".uzpbr to "public" as "maxmast";
grant index on "maxmast".uzpbr to "public" as "maxmast";
grant select on "maxmast".uzptmp to "public" as "maxmast";
grant update on "maxmast".uzptmp to "public" as "maxmast";
grant insert on "maxmast".uzptmp to "public" as "maxmast";
grant delete on "maxmast".uzptmp to "public" as "maxmast";
grant index on "maxmast".uzptmp to "public" as "maxmast";
grant select on "maxmast".uzmii to "public" as "maxmast";
grant update on "maxmast".uzmii to "public" as "maxmast";
grant insert on "maxmast".uzmii to "public" as "maxmast";
grant delete on "maxmast".uzmii to "public" as "maxmast";
grant index on "maxmast".uzmii to "public" as "maxmast";
grant select on "maxmast".uzshrt to "public" as "maxmast";
grant update on "maxmast".uzshrt to "public" as "maxmast";
grant insert on "maxmast".uzshrt to "public" as "maxmast";
grant delete on "maxmast".uzshrt to "public" as "maxmast";
grant index on "maxmast".uzshrt to "public" as "maxmast";
grant select on "maxmast".uzllc to "public" as "maxmast";
grant update on "maxmast".uzllc to "public" as "maxmast";
grant insert on "maxmast".uzllc to "public" as "maxmast";
grant delete on "maxmast".uzllc to "public" as "maxmast";
grant index on "maxmast".uzllc to "public" as "maxmast";
grant select on "maxmast".pl_ext to "public" as "maxmast";
grant update on "maxmast".pl_ext to "public" as "maxmast";
grant insert on "maxmast".pl_ext to "public" as "maxmast";
grant delete on "maxmast".pl_ext to "public" as "maxmast";
grant index on "maxmast".pl_ext to "public" as "maxmast";
grant select on "maxmast".resplna to "public" as "maxmast";
grant update on "maxmast".resplna to "public" as "maxmast";
grant insert on "maxmast".resplna to "public" as "maxmast";
grant delete on "maxmast".resplna to "public" as "maxmast";
grant index on "maxmast".resplna to "public" as "maxmast";





 


create view "maxmast".v_lab_cst (lab_item,lab_cost) as 
  select x0.imcst_item ,sum(x0.imcst_lcost ) from "maxmast".imcst 
    x0 where ((x0.imcst_costype = 'STD' ) AND (x0.imcst_element 
    LIKE 'CL%' ) ) group by x0.imcst_item ;                   
                       
create view "maxmast".v_mat_cst (mat_item,mat_cost) as 
  select x0.imcst_item ,sum(x0.imcst_lcost ) from "maxmast".imcst 
    x0 where ((x0.imcst_costype = 'STD' ) AND (x0.imcst_element 
    LIKE 'MAT%' ) ) group by x0.imcst_item ;                  
                       
create view "maxmast".v_cost_int (mat_item,lab_cost,mat_cost) as 
  select x0.mat_item ,x1.lab_cost ,x0.mat_cost from "maxmast".v_mat_cst 
    x0 ,outer("maxmast".v_lab_cst x1 ) where (x0.mat_item = x1.lab_item 
    ) ;                                                  
create view "maxmast".v_cst_int (v_item_id,v_lab_cost,v_mat_cost,v_date) as 
  select distinct x0.imcst_item ,(select sum((x1.imcst_lcost + 
    x1.imcst_tcost ) ) from "maxmast".imcst x1 where (((x1.imcst_item 
    = x0.imcst_item ) AND (x1.imcst_costype = 'STD' ) ) AND (x1.imcst_element 
    LIKE 'CL%' ) ) ) ,(select sum((x2.imcst_lcost + x2.imcst_tcost 
    ) ) from "maxmast".imcst x2 where (((x2.imcst_item = x0.imcst_item 
    ) AND (x2.imcst_costype = 'STD' ) ) AND (x2.imcst_element 
    LIKE 'MAT%' ) ) ) ,(select max(x3.imcst_lud ) from "maxmast".imcst 
    x3 where (((x3.imcst_item = x0.imcst_item ) AND (x3.imcst_costype 
    = 'STD' ) ) AND ((x3.imcst_element LIKE 'CL%' ) OR (x3.imcst_element 
    LIKE 'MAT%' ) ) ) ) from "maxmast".imcst x0 where (x0.imcst_item 
    = ANY (select x4.imcst_item from "maxmast".imcst x4 where 
    ((x4.imcst_costype = 'STD' ) AND ((x4.imcst_element LIKE 'CL%' 
    ) OR (x4.imcst_element LIKE 'MAT%' ) ) ) ) ) group by x0.imcst_item 
    ;                                      
create view "maxmast".v_rcpt_int (v_wo,v_qty_r,v_item_id,v_lab_cost,v_mat_cost,v_date) as 
  select distinct x0.nvtrn_current ,(select sum(x1.nvtrn_itemqty 
    ) from "maxmast".nvtrn x1 where ((((x0.nvtrn_current = x1.nvtrn_current 
    ) AND (x1.nvtrn_glrefrom != ' ' ) ) AND (x1.nvtrn_glrefrom 
    != 'pregl66test' ) ) AND (x1.nvtrn_trancode = 'Or' ) ) ) ,x0.nvtrn_item 
    ,(select sum(x2.imcst_lcost ) from "maxmast".imcst x2 where 
    (((x2.imcst_item = x0.nvtrn_item ) AND (x2.imcst_costype 
    = 'STD' ) ) AND (x2.imcst_element LIKE 'CL%' ) ) ) ,(select 
    sum(x3.imcst_lcost ) from "maxmast".imcst x3 where (((x3.imcst_item 
    = x0.nvtrn_item ) AND (x3.imcst_costype = 'STD' ) ) AND (x3.imcst_element 
    LIKE 'MAT%' ) ) ) ,(select max(x4.nvtrn_date ) from "maxmast".nvtrn 
    x4 where ((((x4.nvtrn_current = x0.nvtrn_current ) AND (x4.nvtrn_trancode 
    = 'Or' ) ) AND (x4.nvtrn_glrefrom != ' ' ) ) AND (x4.nvtrn_glrefrom 
    != 'pregl66test' ) ) ) from "maxmast".nvtrn x0 where (((x0.nvtrn_glrefrom 
    != ' ' ) AND (x0.nvtrn_glrefrom != 'pregl66test' ) ) AND (x0.nvtrn_trancode 
    = 'Or' ) ) group by x0.nvtrn_current ,x0.nvtrn_item ;
create view "maxmast".v_rcpt_in2 (v_wo2,v_qty_r2,v_item_id2,v_lab_cost2,v_mat_cost2,v_date2) as 
  select x0.v_wo ,sum(x1.nvtrn_itemqty ) ,x0.v_item_id ,x0.v_lab_cost 
    ,x0.v_mat_cost ,x0.v_date from "maxmast".v_rcpt_int x0 ,"maxmast".nvtrn 
    x1 where ((x0.v_wo = x1.nvtrn_current ) AND (x1.nvtrn_trancode 
    = 'Or' ) ) group by x0.v_wo ,x0.v_item_id ,x0.v_lab_cost ,
    x0.v_mat_cost ,x0.v_date ; 
create view "maxmast".v_rcpt_in9 (v_wo3,v_qty_r3,v_item_id3,v_lab_ucst3,v_mat_ucst3,v_lab_cost3,v_mat_cost3,v_date3) as 
  select x0.v_wo2 ,x0.v_qty_r2 ,x0.v_item_id2 ,x0.v_lab_cost2 
    ,x0.v_mat_cost2 ,(x0.v_qty_r2 * x0.v_lab_cost2 ) ,(x0.v_qty_r2 
    * x0.v_mat_cost2 ) ,x0.v_date2 from "maxmast".v_rcpt_in2 x0 
    ;                
create view "maxmast".ups_address (uniref,compname,address1,address2,city,state,postcode,country,telephone) as 
  select distinct x0.oetrn_invnum ,x1.ndm_name [1,35] ,x1.ndm_addr1 
    [1,35] ,x1.ndm_addr2 [1,35] ,x1.ndm_addr3 [1,30] ,x1.ndm_addr4 
    [1,35] ,x1.ndm_addr6 [1,9] ,x1.ndm_addr5 [1,35] ,x1.ndm_telephone 
    [1,15] from "maxmast".oetrn x0 ,"maxmast".ndmas x1 where (x0.oetrn_deladdcod 
    = x1.ndm_ndcode ) ;                                      
            
create view "maxmast".ups_invdetails (uniref,partnum,goodsdesc,tarriff_code,country_of_origin,qty,uom,price,currency) as 
  select x0.oetrn_invnum ,x0.oetrn_item ,TRIM ( BOTH  ' ' FROM 
    x1.imast_descext [1,31] ) || ' ' || x1.imast_uzcompmat ,'96033010' 
    ,x1.imast_descext [32,33] ,x0.oetrn_oinvqty ,x0.oetrn_priceuom 
    ,x0.oetrn_cprice ,x0.oetrn_currcode from "maxmast".oetrn x0 
    ,outer("maxmast".imast x1 ) where ((x0.oetrn_item = x1.imast_item 
    ) AND (x0.oetrn_linnum != 0 ) ) ;                        
                     
create view "maxmast".v_nvtrn_cog1 (nvtrn_fromstore,nvtrn_fromacct,nvtrn_tostore,nvtrn_toacct,nvtrn_item,nvtrn_date,nvtrn_time,nvtrn_itemqty,nvtrn_osqty,nvtrn_uom,nvtrn_itemuom,nvtrn_qty,nvtrn_origin,nvtrn_previous,nvtrn_current,nvtrn_trancode,nvtrn_completed,nvtrn_analyse,nvtrn_lud,nvtrn_lui,nvtrn_sequence,nvtrn_nextseq,nvtrn_cost,nvtrn_frombin,nvtrn_tobin,nvtrn_serno,nvtrn_sernoend,nvtrn_actual,nvtrn_paritem,nvtrn_linnum,nvtrn_contract,nvtrn_conlin,nvtrn_cposted,nvtrn_glrefrom,nvtrn_glrefto,nvtrn_containrs,nvtrn_dateneg,nvtrn_timeneg,nvtrn_scser,nvtrn_pickno,nvtrn_toncstval,nvtrn_worder) as 
  select x0.nvtrn_fromstore ,x0.nvtrn_fromacct ,x0.nvtrn_tostore 
    ,x0.nvtrn_toacct ,x0.nvtrn_item ,x0.nvtrn_date ,x0.nvtrn_time 
    ,x0.nvtrn_itemqty ,x0.nvtrn_osqty ,x0.nvtrn_uom ,x0.nvtrn_itemuom 
    ,x0.nvtrn_qty ,x0.nvtrn_origin ,x0.nvtrn_previous ,x0.nvtrn_current 
    ,x0.nvtrn_trancode ,x0.nvtrn_completed ,x0.nvtrn_analyse 
    ,x0.nvtrn_lud ,x0.nvtrn_lui ,x0.nvtrn_sequence ,x0.nvtrn_nextseq 
    ,x0.nvtrn_cost ,x0.nvtrn_frombin ,x0.nvtrn_tobin ,x0.nvtrn_serno 
    ,x0.nvtrn_sernoend ,x0.nvtrn_actual ,x0.nvtrn_paritem ,x0.nvtrn_linnum 
    ,x0.nvtrn_contract ,x0.nvtrn_conlin ,x0.nvtrn_cposted ,x0.nvtrn_glrefrom 
    ,x0.nvtrn_glrefto ,x0.nvtrn_containrs ,x0.nvtrn_dateneg ,
    x0.nvtrn_timeneg ,x0.nvtrn_scser ,x0.nvtrn_pickno ,x0.nvtrn_toncstval 
    ,x0.nvtrn_worder from "maxmast".nvtrn x0 where (x0.nvtrn_toacct 
    NOT IN ('ADJ' ,'SCRAP' ,'REWORK' ,'CHINA' ,'CHINE' ,'NUTS' ,'QUARA' 
    ,'RESVD' ,'RETNS' ,'REWRK' ,'SAMPL' )) ;                     
                              

grant select on "maxmast".v_rcpt_int to "public" as "maxmast";
grant select on "maxmast".v_rcpt_in2 to "public" as "maxmast";
grant select on "maxmast".v_rcpt_in9 to "public" as "maxmast";
grant select on "maxmast".ups_address to "public" as "maxmast";
grant select on "maxmast".ups_invdetails to "public" as "maxmast";
grant select on "maxmast".v_nvtrn_cog1 to "public" as "maxmast";



update statistics high for table al (
     al_altitem, al_lineno, al_prefitem, al_restrict) 
     resolution   0.50000 ;
update statistics medium for table al (
     al_aremarks, al_exchange, al_lud, al_lui, al_rescode) 
     resolution   2.50000   0.95000 ;
update statistics high for table argroup (
     argrp_group) 
     resolution   0.50000 ;
update statistics medium for table argroup (
     argrp_capcode, argrp_cicode, argrp_dep2cent, argrp_depcent, argrp_desc, 
     argrp_drtcode, argrp_eltcode, argrp_gladds, argrp_glasset, argrp_glccabl, 
     argrp_glccadisp, argrp_glccaresv, argrp_glcr, argrp_glcumdep, argrp_glddep, 
     argrp_gldeb, argrp_gldisp, argrp_glprof, argrp_glrevplnt, argrp_glrevtran, 
     argrp_gltran, argrp_method, argrp_movehist, argrp_plant, argrp_planttcd, 
     argrp_qtyuse, argrp_sgroup, argrp_term, argrp_txdgrp, argrp_txdtyp, 
     argrp_type) 
     resolution   2.50000   0.95000 ;
update statistics high for table armas (
     arm_asset, arm_attcode, arm_group, arm_location, arm_product) 
     resolution   0.50000 ;
update statistics medium for table armas (
     arm_adjpurch, arm_bfallow, arm_bfvalue, arm_capcode, arm_ccabase, 
     arm_ccadbl, arm_ccadcum, arm_ccadty, arm_ccarep, arm_ccavbf, 
     arm_ccawdv, arm_chcode, arm_cicode, arm_dep2cent, arm_depcent, 
     arm_desc, arm_dispdate, arm_eltcode, arm_jobdrdepn, arm_method, 
     arm_plant, arm_pldisp, arm_purdate, arm_purper, arm_purprice, 
     arm_puryear, arm_qty, arm_residual, arm_scdrdepn, arm_supplier, 
     arm_tdallow, arm_tddepn, arm_term, arm_tranpp, arm_transfers, 
     arm_txdepn, arm_txdgrp, arm_txdstdt, arm_txdtyp, arm_txpurch, 
     arm_txpused, arm_txtydp, arm_txyeim, arm_tyadds, arm_tydepn, 
     arm_tydisp, arm_type, arm_uom, arm_wdv, arm_wtdrdepn) 
     resolution   2.50000   0.95000 ;
update statistics high for table bkcheq (
     bkc_acctref, bkc_chequeno, bkc_regno, bkc_seq, bkc_source, 
     bkc_voucher) 
     resolution   0.50000 ;
update statistics medium for table bkcheq (
     bkc_date, bkc_ndcode, bkc_payee, bkc_payname, bkc_status, 
     bkc_type, bkc_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table bkpayee (
     bkp_code, bkp_ndcode, bkp_type) 
     resolution   0.50000 ;
update statistics medium for table bkpayee (
     bkp_acctname, bkp_acctno, bkp_acctref, bkp_accttype, bkp_altmethod, 
     bkp_banksort, bkp_boeprov, bkp_ccacct, bkp_cccomm, bkp_ccprov, 
     bkp_ccrate, bkp_charges, bkp_cntrycode, bkp_constant, bkp_currency, 
     bkp_docs, bkp_memo, bkp_payeeref, bkp_paymethod, bkp_rollno, 
     bkp_suffix, bkp_supplier, bkp_sysused, bkp_taxreg) 
     resolution   2.50000   0.95000 ;
update statistics high for table bkpaymnt (
     bkpm_acctref, bkpm_acintref, bkpm_banklink, bkpm_batch, bkpm_batchref, 
     bkpm_boeproof, bkpm_chequeno, bkpm_code, bkpm_currency, bkpm_extref, 
     bkpm_prooflist, bkpm_source, bkpm_status, bkpm_trandate, bkpm_trantype, 
     bkpm_type, bkpm_voucher) 
     resolution   0.50000 ;
update statistics medium for table bkpaymnt (
     bkpm_batchprt, bkpm_ccauth, bkpm_charges, bkpm_constant, bkpm_currvalue, 
     bkpm_discvalue, bkpm_docref, bkpm_linkref, bkpm_memo, bkpm_multicurr, 
     bkpm_ndcode, bkpm_orddate, bkpm_origcurr, bkpm_origdisc, bkpm_origval, 
     bkpm_page, bkpm_paydate, bkpm_payname, bkpm_period, bkpm_proof, 
     bkpm_revalno, bkpm_revdate, bkpm_userid, bkpm_value, bkpm_withhold, 
     bkpm_year) 
     resolution   2.50000   0.95000 ;
update statistics high for table bkrec (
     bkr_acctref, bkr_batch, bkr_batchref, bkr_chequeno, bkr_code, 
     bkr_currency, bkr_extref, bkr_page, bkr_source, bkr_status, 
     bkr_trandate, bkr_trantype, bkr_type, bkr_voucher) 
     resolution   0.50000 ;
update statistics medium for table bkrec (
     bkr_banklink, bkr_ccauth, bkr_currvalue, bkr_docref, bkr_linkref, 
     bkr_memo, bkr_multicurr, bkr_ndcode, bkr_origcurr, bkr_origdisc, 
     bkr_origval, bkr_payname, bkr_proof, bkr_userid, bkr_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table bksym (
     bksym_constant) 
     resolution   0.50000 ;
update statistics medium for table bksym (
     bksym_desc, bksym_ledger, bksym_lud, bksym_lui, bksym_match, 
     bksym_trantype) 
     resolution   2.50000   0.95000 ;
update statistics high for table cost_int (
     item) 
     resolution   0.50000 ;
update statistics medium for table cost_int (
     lab_cost, mat_cost) 
     resolution   2.50000   0.95000 ;
update statistics high for table cumas (
     cum_currency) 
     resolution   0.50000 ;
update statistics medium for table cumas (
     cum_bkcu2var, cum_bkcurvar, cum_boeprov, cum_conmethod, cum_decdesc, 
     cum_decplaces, cum_desc, cum_effctrl, cum_inemu, cum_pertolce, 
     cum_plcontrol, cum_plcu2var, cum_plcurvar, cum_plre2var, cum_plrevvar, 
     cum_rate, cum_shdesc, cum_slcontrol, cum_slcu2var, cum_slcurvar, 
     cum_slpfcntrl, cum_slre2var, cum_slrevvar, cum_trunfac, cum_trunmeth) 
     resolution   2.50000   0.95000 ;
update statistics medium for table cust_tmp (
     ct_country, ct_custcode) 
     resolution   2.50000   0.95000 ;
update statistics high for table cymas (
     cymas_country) 
     resolution   0.50000 ;
update statistics medium for table cymas (
     cymas_currency, cymas_eec, cymas_lang, cymas_lud, cymas_lui, 
     cymas_name, cymas_origcurr) 
     resolution   2.50000   0.95000 ;
update statistics high for table dfqt (
     dfqt_duedate, dfqt_item, dfqt_lineno, dfqt_ordserial, dfqt_rqtserial) 
     resolution   0.50000 ;
update statistics medium for table dfqt (
     dfqt_dueqty, dfqt_eqfactor, dfqt_indmps, dfqt_opno, dfqt_qfactor) 
     resolution   2.50000   0.95000 ;
update statistics high for table glapt (
     glapt_classes, glapt_contract, glapt_ident, glapt_item, glapt_prodgroup, 
     glapt_stkacct, glapt_store) 
     resolution   0.50000 ;
update statistics medium for table glapt (
     glapt_account, glapt_consgrn, glapt_consmftrn, glapt_consnvtrn, glapt_consrqmas, 
     glapt_consword, glapt_labaccnt, glapt_lud, glapt_lui, glapt_mataccnt, 
     glapt_oh1accnt, glapt_oh2accnt, glapt_oncaccnt, glapt_remarks, glapt_stockinv, 
     glapt_stockvar, glapt_subaccnt) 
     resolution   2.50000   0.95000 ;
update statistics high for table glhist (
     glh_account, glh_batch, glh_docref, glh_ledacct, glh_ledger, 
     glh_linkref, glh_period, glh_postdate, glh_proof, glh_trandate, 
     glh_unikey, glh_year) 
     resolution   0.50000 ;
update statistics medium for table glhist (
     glh_basecurr, glh_batchprt, glh_clctype, glh_clusr1, glh_clusr2, 
     glh_comment, glh_contract, glh_costcen, glh_costord, glh_dbcr, 
     glh_exportser, glh_extdocref, glh_fproof, glh_linktype, glh_mendflg, 
     glh_origacct, glh_remcode, glh_trantype, glh_userid, glh_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table glmas (
     glm_account, glm_actype, glm_consolid, glm_summclass) 
     resolution   0.50000 ;
update statistics medium for table glmas (
     glm_class1, glm_class2, glm_class3, glm_class4, glm_class5, 
     glm_clctype, glm_clelem, glm_clnotal, glm_control, glm_dateopen, 
     glm_dept, glm_desc, glm_history, glm_level, glm_password, 
     glm_postflag, glm_retain, glm_stream, glm_sumflg) 
     resolution   2.50000   0.95000 ;
update statistics high for table glpers (
     glper_perend, glper_period, glper_year) 
     resolution   0.50000 ;
update statistics medium for table glpers (
     glper_desc, glper_weeks) 
     resolution   2.50000   0.95000 ;
update statistics high for table glrac (
     glrac_colnum, glrac_lineno, glrac_repid) 
     resolution   0.50000 ;
update statistics medium for table glrac (
     glrac_sequence, glrac_status) 
     resolution   2.50000   0.95000 ;
update statistics high for table glrad (
     glrad_lineno, glrad_repid) 
     resolution   0.50000 ;
update statistics medium for table glrad (
     glrad_desc, glrad_fromacc, glrad_printall, glrad_reverse, glrad_toacc) 
     resolution   2.50000   0.95000 ;
update statistics high for table glrco (
     glrco_colnum, glrco_endcol, glrco_repid, glrco_startcol) 
     resolution   0.50000 ;
update statistics medium for table glrco (
     glrco_budcode, glrco_coltype, glrco_constant, glrco_endper, glrco_endyr, 
     glrco_fieldsize, glrco_nodecs, glrco_nozero, glrco_pnavalue, glrco_printpos, 
     glrco_rendper, glrco_rendyr, glrco_rstarper, glrco_rstaryr, glrco_startper, 
     glrco_startyr, glrco_valtype) 
     resolution   2.50000   0.95000 ;
update statistics high for table glrde (
     glrde_repid) 
     resolution   0.50000 ;
update statistics medium for table glrde (
     glrde_desclen, glrde_nocols, glrde_printaccs, glrde_printdesc, glrde_printpos, 
     glrde_printst, glrde_repname) 
     resolution   2.50000   0.95000 ;
update statistics high for table glrli (
     glrli_lineno, glrli_repid) 
     resolution   0.50000 ;
update statistics medium for table glrli (
     glrli_linefeed, glrli_linetype, glrli_noprint, glrli_swic, glrli_swil, 
     glrli_swir) 
     resolution   2.50000   0.95000 ;
update statistics high for table glrto (
     glrto_lineno, glrto_repid) 
     resolution   0.50000 ;
update statistics medium for table glrto (
     glrto_desc, glrto_highlight, glrto_totaltype, glrto_zeroise) 
     resolution   2.50000   0.95000 ;
update statistics high for table glstat (
     gls_account, gls_seq, gls_year) 
     resolution   0.50000 ;
update statistics medium for table glstat (
     gls_basecurr, gls_openbal, gls_p10bud, gls_p10cred, gls_p10deb, 
     gls_p11bud, gls_p11cred, gls_p11deb, gls_p12bud, gls_p12cred, 
     gls_p12deb, gls_p13bud, gls_p13cred, gls_p13deb, gls_p1bud, 
     gls_p1cred, gls_p1deb, gls_p2bud, gls_p2cred, gls_p2deb, 
     gls_p3bud, gls_p3cred, gls_p3deb, gls_p4bud, gls_p4cred, 
     gls_p4deb, gls_p5bud, gls_p5cred, gls_p5deb, gls_p6bud, 
     gls_p6cred, gls_p6deb, gls_p7bud, gls_p7cred, gls_p7deb, 
     gls_p8bud, gls_p8cred, gls_p8deb, gls_p9bud, gls_p9cred, 
     gls_p9deb) 
     resolution   2.50000   0.95000 ;
update statistics high for table gltran (
     glt_account, glt_batch, glt_docref, glt_exportser, glt_fproof, 
     glt_ledacct, glt_ledger, glt_linkref, glt_linktype, glt_period, 
     glt_postdate, glt_proof, glt_trandate, glt_unikey, glt_year) 
     resolution   0.50000 ;
update statistics medium for table gltran (
     glt_basecurr, glt_batchprt, glt_clctype, glt_clusr1, glt_clusr2, 
     glt_comment, glt_contract, glt_costcen, glt_costord, glt_dbcr, 
     glt_extdocref, glt_mendflg, glt_origacct, glt_remcode, glt_trantype, 
     glt_userid, glt_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table imacc (
     imacc_account, imacc_item, imacc_store) 
     resolution   0.50000 ;
update statistics medium for table imacc (
     imacc_balance, imacc_issueper, imacc_issueytd, imacc_lud, imacc_lui, 
     imacc_osallqty, imacc_ppopen, imacc_pyopen, imacc_recper, imacc_recytd) 
     resolution   2.50000   0.95000 ;
update statistics high for table imast (
     imast_bbop, imast_desckey, imast_item, imast_mpsgroup, imast_sitem) 
     resolution   0.50000 ;
update statistics medium for table imast (
     imast_abcclass, imast_altind, imast_archdate, imast_balance, imast_batchper, 
     imast_batchrule, imast_bomfeat, imast_bonord, imast_bufitem, imast_buildthro, 
     imast_calcadate, imast_certify, imast_class1, imast_class2, imast_class3, 
     imast_class4, imast_class5, imast_cmpuseana, imast_cmt, imast_commcd2, 
     imast_commcode, imast_commit, imast_commodity, imast_compclass, imast_composlt, 
     imast_cost, imast_costroute, imast_dayormth, imast_decimals, imast_depend, 
     imast_descext, imast_dimstd, imast_drawiss, imast_drawno, imast_effclass, 
     imast_entrydate, imast_exfiltr, imast_extmpsqty, imast_family, imast_freestock, 
     imast_ftfadj, imast_gdsearly, imast_gdslate, imast_gdsover, imast_gdsunder, 
     imast_gremarks, imast_incordqty, imast_inspect, imast_iplanner, imast_iremarks, 
     imast_issper, imast_itemtype1, imast_kitlist, imast_lastmrp, imast_leadtadj, 
     imast_leadtime, imast_lives, imast_llc, imast_lud, imast_lui, 
     imast_makebuy, imast_manfac, imast_manufclt, imast_maxordqty, imast_minordqty, 
     imast_monord, imast_monthcap, imast_nodaymth, imast_nvdoc, imast_orderno, 
     imast_ordline, imast_ordrule, imast_pcontrlr, imast_pending, imast_pictime, 
     imast_picunit, imast_ponord, imast_primeacct, imast_primestor, imast_prodgroup, 
     imast_ptfadj, imast_puaccount, imast_reptype, imast_safety, imast_scrappc, 
     imast_sergroup, imast_serlast, imast_servcat, imast_servchcod, imast_servittyp, 
     imast_shfiltr, imast_sic, imast_simulated, imast_slipfiltr, imast_sopalloc, 
     imast_sopcommit, imast_sopgfs, imast_sopmps, imast_sparecod, imast_spectype, 
     imast_stancost, imast_stockuom, imast_storelife, imast_sttype, imast_surplusdt, 
     imast_techflag, imast_techref, imast_template, imast_tracecode, imast_typecode, 
     imast_urgefiltr, imast_useper, imast_useunit, imast_uzcompmat, imast_uzstkprov, 
     imast_valclass, imast_volume, imast_wbench, imast_weight) 
     resolution   2.50000   0.95000 ;
update statistics high for table imcpr (
     imcpr_branch, imcpr_currency, imcpr_item, imcpr_manfac, imcpr_opno, 
     imcpr_routeid, imcpr_supplier, imcpr_workcen) 
     resolution   0.50000 ;
update statistics medium for table imcpr (
     imcpr_itaxstat, imcpr_lastpaid, imcpr_lastprice, imcpr_lastqty, imcpr_price) 
     resolution   2.50000   0.95000 ;
update statistics high for table imcst (
     imcst_costype, imcst_element, imcst_item) 
     resolution   0.50000 ;
update statistics medium for table imcst (
     imcst_lcalc, imcst_lcost, imcst_lrd, imcst_lud, imcst_lui, 
     imcst_manent, imcst_miss1, imcst_miss2, imcst_miss3, imcst_miss4, 
     imcst_roll, imcst_tcalc, imcst_tcost) 
     resolution   2.50000   0.95000 ;
update statistics high for table imctp (
     imctp_costype, imctp_item) 
     resolution   0.50000 ;
update statistics medium for table imctp (
     imctp_batchqty, imctp_date, imctp_lrd, imctp_lud, imctp_lui, 
     imctp_manfac, imctp_missa, imctp_missb, imctp_precision, imctp_roll, 
     imctp_routeid, imctp_scrappc) 
     resolution   2.50000   0.95000 ;
update statistics high for table imctr (
     imctr_costype, imctr_item) 
     resolution   0.50000 ;
update statistics medium for table imctr (
     imctr_remark) 
     resolution   2.50000   0.95000 ;
update statistics high for table imdes (
     imdes_item, imdes_lang) 
     resolution   0.50000 ;
update statistics medium for table imdes (
     imdes_descext, imdes_desckey) 
     resolution   2.50000   0.95000 ;
update statistics high for table imfac (
     imfac_item, imfac_manfac) 
     resolution   0.50000 ;
update statistics medium for table imfac (
     imfac_account, imfac_autorel, imfac_batchper, imfac_batchqty, imfac_batchrule, 
     imfac_costroute, imfac_delacct, imfac_delstore, imfac_exfiltr, imfac_flushtime, 
     imfac_fremarks, imfac_gdsearly, imfac_gdslate, imfac_gdsover, imfac_gdsunder, 
     imfac_incordqty, imfac_leadtime, imfac_lud, imfac_lui, imfac_minordqty, 
     imfac_opscrap, imfac_pcontrlr, imfac_pending, imfac_planroute, imfac_prcfact, 
     imfac_prefproc, imfac_scracct, imfac_scrappc, imfac_scrstore, imfac_shfiltr, 
     imfac_slipfiltr, imfac_store, imfac_techflag, imfac_urgefiltr) 
     resolution   2.50000   0.95000 ;
update statistics high for table imgrp (
     imgrp_prodgroup) 
     resolution   0.50000 ;
update statistics medium for table imgrp (
     imgrp_category, imgrp_cosglacc, imgrp_glsrev, imgrp_grpname, imgrp_lud, 
     imgrp_lui, imgrp_stkglacc) 
     resolution   2.50000   0.95000 ;
update statistics high for table imprc (
     imprc_branch, imprc_currency, imprc_item, imprc_offqtybrk, imprc_ondate, 
     imprc_subcon, imprc_supplier) 
     resolution   0.50000 ;
update statistics medium for table imprc (
     imprc_lud, imprc_lui, imprc_manfac, imprc_offdate, imprc_opno, 
     imprc_price, imprc_quantity, imprc_routeid, imprc_workcen) 
     resolution   2.50000   0.95000 ;
update statistics high for table imsto (
     imsto_item, imsto_pfaceloc, imsto_pfaceloc2, imsto_store) 
     resolution   0.50000 ;
update statistics medium for table imsto (
     imsto_account, imsto_average, imsto_balance, imsto_bin1, imsto_bin2, 
     imsto_blkpaktyp, imsto_capacity, imsto_capacity2, imsto_class, imsto_fifomatch, 
     imsto_fifotol, imsto_lstdate, imsto_lud, imsto_lui, imsto_manfac, 
     imsto_maxrepqty, imsto_minstock, imsto_orderper, imsto_orderqty, imsto_pfslocatn, 
     imsto_picrule, imsto_pictime, imsto_picunit, imsto_recpaktyp, imsto_reordmeth, 
     imsto_replnlvl, imsto_replnlvl2, imsto_replrule, imsto_reservloc, imsto_scontrolr, 
     imsto_shrinkwrp, imsto_sopalloc, imsto_sopcommit, imsto_sopgfs, imsto_soplock, 
     imsto_sremarks, imsto_supstore, imsto_targetstk, imsto_zone) 
     resolution   2.50000   0.95000 ;
update statistics high for table imsup (
     imsup_branch, imsup_item, imsup_manfac, imsup_opno, imsup_prefcode, 
     imsup_routeid, imsup_supplier, imsup_workcen) 
     resolution   0.50000 ;
update statistics medium for table imsup (
     imsup_actdate, imsup_blanket, imsup_btchprice, imsup_buyer, imsup_contact, 
     imsup_decimals, imsup_deluom, imsup_insppc, imsup_lud, imsup_lui, 
     imsup_maker, imsup_notifdays, imsup_partno, imsup_priceuom, imsup_remarks, 
     imsup_scrappc, imsup_split, imsup_stage, imsup_status, imsup_suptime, 
     imsup_terms, imsup_uremarks1, imsup_uremarks2, imsup_uremarks3, imsup_uremarks4, 
     imsup_uremarks5) 
     resolution   2.50000   0.95000 ;
update statistics high for table lgmas (
     lgmas_lang) 
     resolution   0.50000 ;
update statistics medium for table lgmas (
     lgmas_lud, lgmas_lui, lgmas_name) 
     resolution   2.50000   0.95000 ;
update statistics high for table mabal (
     mabal_account, mabal_period, mabal_year) 
     resolution   0.50000 ;
update statistics medium for table mabal (
     mabal_basecurr, mabal_budget, mabal_credit, mabal_debit) 
     resolution   2.50000   0.95000 ;
update statistics high for table macom (
     macom_remcode) 
     resolution   0.50000 ;
update statistics medium for table macom (
     macom_remark) 
     resolution   2.50000   0.95000 ;
update statistics high for table maopn (
     maopn_account, maopn_year) 
     resolution   0.50000 ;
update statistics medium for table maopn (
     maopn_openbal) 
     resolution   2.50000   0.95000 ;
update statistics high for table mfhrs (
     mfhrs_day, mfhrs_hourcal, mfhrs_startdate, mfhrs_starttime) 
     resolution   0.50000 ;
update statistics medium for table mfhrs (
     mfhrs_duration) 
     resolution   2.50000   0.95000 ;
update statistics high for table mfhst (
     mfhst_date, mfhst_orderno, mfhst_serial, mfhst_time) 
     resolution   0.50000 ;
update statistics medium for table mfhst (
     mfhst_completed, mfhst_dueqty, mfhst_type) 
     resolution   2.50000   0.95000 ;
update statistics high for table mfop (
     mfop_aworkcen, mfop_despno, mfop_manfac, mfop_opno, mfop_orderno, 
     mfop_seq1, mfop_seq1a, mfop_seq2, mfop_seq3, mfop_seq4) 
     resolution   0.50000 ;
update statistics medium for table mfop (
     mfop_abckflush, mfop_abprcunit, mfop_abproctim, mfop_adatefin, mfop_adatestrt, 
     mfop_asettime, mfop_asetunit, mfop_atimefin, mfop_atimestrt, mfop_backflush, 
     mfop_classcode, mfop_currency, mfop_elaptime, mfop_elapunit, mfop_lud, 
     mfop_lui, mfop_mbq, mfop_nxtop, mfop_pbq, mfop_pdatefin, 
     mfop_pdatestrt, mfop_planqty, mfop_preop, mfop_proctime, mfop_procunit, 
     mfop_ptimefin, mfop_ptimestrt, mfop_qoverride, mfop_qtime, mfop_qtygood, 
     mfop_qtyscrap, mfop_qunit, mfop_remarks, mfop_sbq, mfop_schedqty, 
     mfop_scrappc, mfop_sdatefin, mfop_sdatestrt, mfop_setmiss, mfop_settime, 
     mfop_setunit, mfop_shortdesc, mfop_stage, mfop_startqty, mfop_status, 
     mfop_stimefin, mfop_stimestrt, mfop_tbq, mfop_textref, mfop_workcen) 
     resolution   2.50000   0.95000 ;
update statistics high for table mford (
     mford_duedate, mford_item, mford_linnum, mford_negdue, mford_orderno, 
     mford_ordnum, mford_revdue) 
     resolution   0.50000 ;
update statistics medium for table mford (
     mford_actualdte, mford_amendno, mford_completed, mford_conlin, mford_contract, 
     mford_delacct, mford_delstore, mford_drawiss, mford_drawno, mford_dueqty, 
     mford_duetime, mford_glrefrom, mford_glrefto, mford_glvarfrom, mford_glvarto, 
     mford_lastop, mford_lspro, mford_lud, mford_lui, mford_manfac, 
     mford_modser, mford_monord, mford_opscrap, mford_pcontrlr, mford_premarks, 
     mford_printdate, mford_priority, mford_qtyrcvd, mford_qtyscrap, mford_reldate, 
     mford_released, mford_remarks, mford_reprint, mford_revqty, mford_routeid, 
     mford_rtplanned, mford_scracct, mford_scrappc, mford_scrstore, mford_serialop, 
     mford_splitfrom, mford_stage, mford_startdate, mford_wipscrap) 
     resolution   2.50000   0.95000 ;
update statistics high for table mftro (
     mftro_orderno) 
     resolution   0.50000 ;
update statistics medium for table mftro (
     mftro_source, mftro_tbflush, mftro_tlspro, mftro_tpdates, mftro_tplanqty, 
     mftro_trigdate, mftro_trigtime, mftro_tstartqty) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmali (
     mmali_initials, mmali_item, mmali_manfac, mmali_sequence) 
     resolution   0.50000 ;
update statistics medium for table mmali (
     mmali_itemdate, mmali_progress) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmalp (
     mmalp_branch, mmalp_date, mmalp_initials, mmalp_item, mmalp_itemseq, 
     mmalp_manfac, mmalp_orderno, mmalp_ordline, mmalp_ordserial, mmalp_release, 
     mmalp_reqno, mmalp_serial, mmalp_supplier, mmalp_supseq, mmalp_type) 
     resolution   0.50000 ;
update statistics medium for table mmalp (
     mmalp_llc, mmalp_makebuy, mmalp_recomm, mmalp_revdate, mmalp_revqty, 
     mmalp_supitdate, mmalp_tick) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmals (
     mmals_branch, mmals_initials, mmals_manfac, mmals_sequence, mmals_supplier) 
     resolution   0.50000 ;
update statistics medium for table mmals (
     mmals_progress, mmals_supdate) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmcal (
     mmcal_manfac, mmcal_sequence) 
     resolution   0.50000 ;
update statistics medium for table mmcal (
     mmcal_d0, mmcal_d1, mmcal_d2, mmcal_fri, mmcal_mon, 
     mmcal_s0, mmcal_s1, mmcal_s2, mmcal_sat, mmcal_sun, 
     mmcal_tableleng, mmcal_thu, mmcal_tue, mmcal_wed, mmcal_workdays) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmcst (
     mmcst_costype, mmcst_element) 
     resolution   0.50000 ;
update statistics medium for table mmcst (
     mmcst_account, mmcst_buyman, mmcst_buymiss, mmcst_class, mmcst_desc, 
     mmcst_lcalc, mmcst_lud, mmcst_lui, mmcst_makeman, mmcst_makemiss, 
     mmcst_tcalc) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmctp (
     mmctp_costype) 
     resolution   0.50000 ;
update statistics medium for table mmctp (
     mmctp_autoimctp, mmctp_costroute, mmctp_date, mmctp_desc, mmctp_dest, 
     mmctp_file, mmctp_fromcost, mmctp_frozen, mmctp_level, mmctp_lud, 
     mmctp_lui, mmctp_origdate, mmctp_precision, mmctp_regen, mmctp_report, 
     mmctp_term, mmctp_wasteflag) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmfw (
     mmfw_costype, mmfw_lineno, mmfw_manfac, mmfw_workcen) 
     resolution   0.50000 ;
update statistics medium for table mmfw (
     mmfw_cost, mmfw_element, mmfw_formula, mmfw_lud, mmfw_lui, 
     mmfw_percent, mmfw_rate, mmfw_remarks, mmfw_source, mmfw_timeunit) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmser (
     mmser_sergroup) 
     resolution   0.50000 ;
update statistics medium for table mmser (
     mmser_serlast) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmtrc (
     mmtrc_illc, mmtrc_item, mmtrc_trigdate) 
     resolution   0.50000 ;
update statistics medium for table mmtrc (
     mmtrc_lud, mmtrc_source) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmtrs (
     mmtrs_costype, mmtrs_illc, mmtrs_item, mmtrs_trigdate, mmtrs_trigtype) 
     resolution   0.50000 ;
update statistics medium for table mmtrs (
     mmtrs_lud, mmtrs_source) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmuid (
     mmuid_initials) 
     resolution   0.50000 ;
update statistics medium for table mmuid (
     mmuid_email, mmuid_lud, mmuid_lui, mmuid_userid) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmuom (
     mmuom_fromuom, mmuom_touom) 
     resolution   0.50000 ;
update statistics medium for table mmuom (
     mmuom_convert, mmuom_desc) 
     resolution   2.50000   0.95000 ;
update statistics high for table mmusr (
     mmusr_userid) 
     resolution   0.50000 ;
update statistics medium for table mmusr (
     mmusr_acct, mmusr_altcount, mmusr_altfresh, mmusr_iplanner, mmusr_manfac, 
     mmusr_mmdf, mmusr_name, mmusr_reqauth, mmusr_runid, mmusr_store, 
     mmusr_type, mmusr_workcen) 
     resolution   2.50000   0.95000 ;
update statistics high for table mrcpt (
     mrcpt_duedate, mrcpt_item, mrcpt_lineno, mrcpt_opno, mrcpt_orderno, 
     mrcpt_ordline, mrcpt_release, mrcpt_rqtserial) 
     resolution   0.50000 ;
update statistics medium for table mrcpt (
     mrcpt_abckflush, mrcpt_cmpparent, mrcpt_dueqty, mrcpt_indmps, mrcpt_issqty, 
     mrcpt_lud, mrcpt_lui, mrcpt_osallqty, mrcpt_qfactor) 
     resolution   2.50000   0.95000 ;
update statistics high for table mrord (
     mrord_duedate, mrord_item, mrord_ordserial) 
     resolution   0.50000 ;
update statistics medium for table mrord (
     mrord_dueqty, mrord_startdate) 
     resolution   2.50000   0.95000 ;
update statistics high for table mrqt (
     mrqt_duedate, mrqt_item, mrqt_lineno, mrqt_ordserial, mrqt_rqtserial) 
     resolution   0.50000 ;
update statistics medium for table mrqt (
     mrqt_dueqty, mrqt_eqfactor, mrqt_indmps, mrqt_opno, mrqt_qfactor) 
     resolution   2.50000   0.95000 ;
update statistics high for table msrqt (
     msrqt_customer, msrqt_delacct, msrqt_delstore, msrqt_duedate, msrqt_item, 
     msrqt_linnum, msrqt_ordnum, msrqt_parentid, msrqt_parlinnum, msrqt_rqtserial, 
     msrqt_source, msrqt_sourcref) 
     resolution   0.50000 ;
update statistics medium for table msrqt (
     msrqt_conlin, msrqt_contract, msrqt_dueqty, msrqt_firmord, msrqt_issqty, 
     msrqt_lud, msrqt_lui, msrqt_pegged, msrqt_sremarks) 
     resolution   2.50000   0.95000 ;
update statistics medium for table mtlbcst (
     mlc_item, mlc_labcost, mlc_matcost, mlc_valabcost, mlc_vamatcost) 
     resolution   2.50000   0.95000 ;
update statistics high for table ndcon (
     ndc_ndcode, ndc_seq) 
     resolution   0.50000 ;
update statistics medium for table ndcon (
     ndc_comment, ndc_email, ndc_forename, ndc_homephone, ndc_initial, 
     ndc_letters, ndc_lud, ndc_lui, ndc_maxonly, ndc_mobphone, 
     ndc_salut, ndc_surname, ndc_telephone, ndc_telex, ndc_title) 
     resolution   2.50000   0.95000 ;
update statistics high for table ndmas (
     ndm_alphcode, ndm_ndcode, ndm_postcode) 
     resolution   0.50000 ;
update statistics medium for table ndmas (
     ndm_addr1, ndm_addr2, ndm_addr3, ndm_addr4, ndm_addr5, 
     ndm_addr6, ndm_addtype, ndm_email, ndm_homephone, ndm_lastdate, 
     ndm_lud, ndm_lui, ndm_maxonly, ndm_mobphone, ndm_name, 
     ndm_nameext, ndm_telephone, ndm_telex) 
     resolution   2.50000   0.95000 ;
update statistics high for table nphdr (
     nphdr_key, nphdr_serial) 
     resolution   0.50000 ;
update statistics medium for table nphdr (
     nphdr_access, nphdr_modify, nphdr_user) 
     resolution   2.50000   0.95000 ;
update statistics high for table nptxt (
     nptxt_seq, nptxt_serial) 
     resolution   0.50000 ;
update statistics medium for table nptxt (
     nptxt_text) 
     resolution   2.50000   0.95000 ;
update statistics high for table nvacc (
     nvacc_account) 
     resolution   0.50000 ;
update statistics medium for table nvacc (
     nvacc_acname, nvacc_bins, nvacc_gfsfree, nvacc_lud, nvacc_lui, 
     nvacc_mrpacc, nvacc_nlacct, nvacc_nowhere, nvacc_ooacc, nvacc_serials, 
     nvacc_status) 
     resolution   2.50000   0.95000 ;
update statistics high for table nvcls (
     nvcls_class, nvcls_store) 
     resolution   0.50000 ;
update statistics medium for table nvcls (
     nvcls_counts, nvcls_days, nvcls_lud, nvcls_lui, nvcls_maxcounts, 
     nvcls_remarks, nvcls_totitems) 
     resolution   2.50000   0.95000 ;
update statistics high for table nvtrm (
     nvtrm_current, nvtrm_sequence) 
     resolution   0.50000 ;
update statistics medium for table nvtrm (
     nvtrm_remarks) 
     resolution   2.50000   0.95000 ;
update statistics high for table nvtrn (
     nvtrn_current, nvtrn_date, nvtrn_dateneg, nvtrn_glrefrom, nvtrn_glrefto, 
     nvtrn_item, nvtrn_origin, nvtrn_sequence, nvtrn_serno, nvtrn_time, 
     nvtrn_timeneg) 
     resolution   0.50000 ;
update statistics medium for table nvtrn (
     nvtrn_actual, nvtrn_analyse, nvtrn_completed, nvtrn_conlin, nvtrn_containrs, 
     nvtrn_contract, nvtrn_cost, nvtrn_cposted, nvtrn_fromacct, nvtrn_frombin, 
     nvtrn_fromstore, nvtrn_itemqty, nvtrn_itemuom, nvtrn_linnum, nvtrn_lud, 
     nvtrn_lui, nvtrn_nextseq, nvtrn_osqty, nvtrn_paritem, nvtrn_pickno, 
     nvtrn_previous, nvtrn_qty, nvtrn_scser, nvtrn_sernoend, nvtrn_toacct, 
     nvtrn_tobin, nvtrn_toncstval, nvtrn_tostore, nvtrn_trancode, nvtrn_uom, 
     nvtrn_uzopid, nvtrn_worder) 
     resolution   2.50000   0.95000 ;
update statistics high for table nvtrs (
     nvtrs_bin, nvtrs_checked, nvtrs_item, nvtrs_itemseq, nvtrs_pickseq, 
     nvtrs_scontrolr, nvtrs_store, nvtrs_trigdate) 
     resolution   0.50000 ;
update statistics medium for table nvtrs (
     nvtrs_countdate, nvtrs_counttime, nvtrs_reference, nvtrs_source) 
     resolution   2.50000   0.95000 ;
update statistics high for table nvxac (
     nvxac_facc, nvxac_fstore, nvxac_toacc, nvxac_tostore) 
     resolution   0.50000 ;
update statistics medium for table nvxac (
     nvxac_analyse, nvxac_history, nvxac_lud, nvxac_lui) 
     resolution   2.50000   0.95000 ;
update statistics high for table nwmtlbcst (
     nwmlc_item) 
     resolution   0.50000 ;
update statistics medium for table nwmtlbcst (
     nwmlc_labcost, nwmlc_matcost, nwmlc_valabcost, nwmlc_vamatcost) 
     resolution   2.50000   0.95000 ;
update statistics high for table oeatr (
     oeatr_ordnum, oeatr_serial) 
     resolution   0.50000 ;
update statistics medium for table oeatr (
     oeatr_edidate, oeatr_edioack, oeatr_editime, oeatr_faxoack, oeatr_hcdate, 
     oeatr_hcoack, oeatr_hctime, oeatr_lud, oeatr_lui, oeatr_reprint, 
     oeatr_source, oeatr_trigdate, oeatr_trigtime) 
     resolution   2.50000   0.95000 ;
update statistics high for table oecpt (
     oecpt_compline, oecpt_item, oecpt_linnum, oecpt_ordnum, oecpt_pickdate) 
     resolution   0.50000 ;
update statistics medium for table oecpt (
     oecpt_advance, oecpt_buildthro, oecpt_cost, oecpt_indmps, oecpt_lud, 
     oecpt_lui, oecpt_opno, oecpt_orderno, oecpt_ordline, oecpt_prevpdate, 
     oecpt_qfactor, oecpt_quantity, oecpt_selection) 
     resolution   2.50000   0.95000 ;
update statistics high for table oecus (
     oecus_account) 
     resolution   0.50000 ;
update statistics medium for table oecus (
     oecus_accman, oecus_acctprcat, oecus_altinv, oecus_anacode, oecus_aviexp, 
     oecus_certcomb, oecus_certdelpt, oecus_certify, oecus_class1, oecus_class2, 
     oecus_class3, oecus_compflag, oecus_consdays, oecus_consdesp, oecus_consinv, 
     oecus_constore, oecus_custdespn, oecus_custype, oecus_delterms, oecus_deltype, 
     oecus_ecpasswd, oecus_ecplist, oecus_edicode, oecus_edidespad, oecus_ediinvoic, 
     oecus_edioack, oecus_engineer, oecus_expiryday, oecus_faxdespad, oecus_faxinvoic, 
     oecus_faxoack, oecus_forcepo, oecus_fullcrchk, oecus_hcdespadv, oecus_hcinvoice, 
     oecus_hcoack, oecus_hcquote, oecus_invdisc, oecus_invmeth, oecus_lindisc, 
     oecus_lud, oecus_lui, oecus_misccrchk, oecus_miscval, oecus_nordytd, 
     oecus_numdnotes, oecus_ordlimit, oecus_ourcode, oecus_ouredi, oecus_ownparts, 
     oecus_payref, oecus_pfcashos, oecus_pfcashrec, oecus_pfdeposit, oecus_pfexpdays, 
     oecus_pricelist, oecus_pricepty, oecus_primedel, oecus_priority, oecus_prlistovr, 
     oecus_procret, oecus_proforma, oecus_proformas, oecus_promlist, oecus_qbbest, 
     oecus_qbdiscok, oecus_reconf, oecus_reqack, oecus_reqdn, oecus_reqoh, 
     oecus_salesman, oecus_salesoff, oecus_schrecdte, oecus_servinv, oecus_specdisc, 
     oecus_statdflt, oecus_stdpronly, oecus_stkalloc, oecus_transport, oecus_twinreqd, 
     oecus_unalchk, oecus_user1, oecus_user2, oecus_user3, oecus_valaloc, 
     oecus_valunaloc) 
     resolution   2.50000   0.95000 ;
update statistics high for table oedpt (
     oedpt_account, oedpt_nadcode, oedpt_storecode) 
     resolution   0.50000 ;
update statistics medium for table oedpt (
     oedpt_anacode, oedpt_country, oedpt_ctaxstat, oedpt_delinst, oedpt_delmetcod, 
     oedpt_delroute, oedpt_despdellt, oedpt_despqtys, oedpt_geog, oedpt_lastdel, 
     oedpt_lud, oedpt_lui, oedpt_ordnum, oedpt_salesman, oedpt_specinst, 
     oedpt_taxempt, oedpt_tempperm, oedpt_vatnumber, oedpt_whnorm) 
     resolution   2.50000   0.95000 ;
update statistics high for table oehdr (
     oehdr_account, oehdr_dateneg, oehdr_docdate, oehdr_entdate, oehdr_mcontract, 
     oehdr_ordnum, oehdr_ordtype, oehdr_ponum, oehdr_printreqd, oehdr_proforma, 
     oehdr_sales2man, oehdr_salesman, oehdr_salesoff, oehdr_shipment) 
     resolution   0.50000 ;
update statistics medium for table oehdr (
     oehdr_ackdate, oehdr_acktime, oehdr_allocval, oehdr_approved, oehdr_boepayee, 
     oehdr_ccauth, oehdr_compflag, oehdr_consdesp, oehdr_consign, oehdr_consinv, 
     oehdr_contact, oehdr_creditaut, oehdr_ctaxstat, oehdr_currcode, oehdr_delinst, 
     oehdr_delmedesc, oehdr_delmetcod, oehdr_delroute, oehdr_dochdrtxt, oehdr_doctext, 
     oehdr_drate1, oehdr_drate2, oehdr_drate3, oehdr_eccomment, oehdr_ecemail, 
     oehdr_edidespad, oehdr_ediinvoic, oehdr_edioack, oehdr_esource, oehdr_expirydte, 
     oehdr_faxdespad, oehdr_faxinvoic, oehdr_faxoack, oehdr_geog, oehdr_hcdespadv, 
     oehdr_hcinvoice, oehdr_hcoack, oehdr_hcquote, oehdr_inproc, oehdr_invdate, 
     oehdr_invdisc, oehdr_invoiceno, oehdr_lud, oehdr_lui, oehdr_miscval, 
     oehdr_nett, oehdr_ordsts, oehdr_ordval, oehdr_origcod, oehdr_origdesc, 
     oehdr_otycod, oehdr_otydesc, oehdr_partseq, oehdr_pfcashrec, oehdr_pfdpstval, 
     oehdr_pfexpiry, oehdr_pfprinted, oehdr_podno, oehdr_pricelist, oehdr_profit, 
     oehdr_promlist, oehdr_quoteprnt, oehdr_sendto, oehdr_sm2percen, oehdr_specinst, 
     oehdr_stflags, oehdr_store, oehdr_storecode, oehdr_suppcrchk, oehdr_tax, 
     oehdr_taxdate, oehdr_taxempt, oehdr_telephone, oehdr_telex, oehdr_termscode, 
     oehdr_time, oehdr_user1, oehdr_user2, oehdr_uspec1, oehdr_uspec2, 
     oehdr_uspec3, oehdr_uspec4, oehdr_uspec5, oehdr_version) 
     resolution   2.50000   0.95000 ;
update statistics high for table oehst (
     oehst_account, oehst_item, oehst_linnum, oehst_orddate, oehst_ordnum, 
     oehst_serial) 
     resolution   0.50000 ;
update statistics medium for table oehst (
     oehst_accman, oehst_anacode, oehst_areaname, oehst_average, oehst_branch, 
     oehst_category, oehst_catname, oehst_cgross, oehst_class1, oehst_class2, 
     oehst_class3, oehst_cldisc, oehst_codisc, oehst_contract, oehst_contype, 
     oehst_cost, oehst_country, oehst_cprice, oehst_ctax, oehst_currcode, 
     oehst_cusreqdte, oehst_custcntry, oehst_custitem, oehst_custype, oehst_deladdcod, 
     oehst_deldate, oehst_delnoteno, oehst_descext, oehst_despdate, oehst_despdellt, 
     oehst_entdate, oehst_geog, oehst_gross, oehst_grpname, oehst_imclass1, 
     oehst_imclass2, oehst_imclass3, oehst_imclass4, oehst_imclass5, oehst_invaddcod, 
     oehst_invaddr1, oehst_invdate, oehst_invname, oehst_invnum, oehst_itemac, 
     oehst_itemprcat, oehst_ldisc, oehst_linetype, oehst_lud, oehst_lui, 
     oehst_net, oehst_odisc, oehst_oeclass1, oehst_oeclass2, oehst_oinvqty, 
     oehst_orderno, oehst_ordtype, oehst_orduom, oehst_period, oehst_ponum, 
     oehst_price, oehst_pricelist, oehst_priceuom, oehst_primerate, oehst_prodgroup, 
     oehst_qtyord, oehst_region, oehst_reqdate, oehst_revcost, oehst_rgnname, 
     oehst_sales2man, oehst_salesman, oehst_salesoff, oehst_sinvqty, oehst_source, 
     oehst_stancost, oehst_stockuom, oehst_store, oehst_tax, oehst_territory, 
     oehst_terrname, oehst_trantype, oehst_type, oehst_typename, oehst_year) 
     resolution   2.50000   0.95000 ;
update statistics high for table oeim (
     oeim_item, oeim_salesoff) 
     resolution   0.50000 ;
update statistics medium for table oeim (
     oeim_allocacc, oeim_bomcomprc, oeim_bomkitchg, oeim_bompset, oeim_class1, 
     oeim_class2, oeim_comcd, oeim_comcode, oeim_datnrrp, oeim_dirdel, 
     oeim_ecsale, oeim_exactmult, oeim_fixedpric, oeim_gfsacc, oeim_hold, 
     oeim_ictaxstat, oeim_itaxstat, oeim_itemac, oeim_itemprcat, oeim_lud, 
     oeim_lui, oeim_maxordqty, oeim_minordqty, oeim_nextrrp, oeim_normsuom, 
     oeim_packsize, oeim_packtype, oeim_price, oeim_priceuom, oeim_pricupd, 
     oeim_rrp, oeim_rtnacc, oeim_seldec, oeim_sergroup, oeim_sernoarch, 
     oeim_taxcode, oeim_toraconv, oeim_trincst, oeim_weight) 
     resolution   2.50000   0.95000 ;
update statistics high for table oelin (
     oelin_groupline, oelin_linnum, oelin_ordnum, oelin_printsort, oelin_sortline) 
     resolution   0.50000 ;
update statistics medium for table oelin (
     oelin_clinnum, oelin_contract, oelin_contype, oelin_copyquote, oelin_dlinnum, 
     oelin_doclintxt, oelin_expirydte, oelin_linecode, oelin_lud, oelin_lui, 
     oelin_orderno, oelin_ordline, oelin_reason, oelin_socreate, oelin_status) 
     resolution   2.50000   0.95000 ;
update statistics high for table oemcr (
     oemcr_rcode) 
     resolution   0.50000 ;
update statistics medium for table oemcr (
     oemcr_carriage, oemcr_commodity, oemcr_lud, oemcr_lui, oemcr_miscac, 
     oemcr_prodclass, oemcr_rtext) 
     resolution   2.50000   0.95000 ;
update statistics high for table oemer (
     oemer_dateneg, oemer_item, oemer_linestat, oemer_linnum, oemer_orderno, 
     oemer_ordnum, oemer_pickdate, oemer_reqdate, oemer_store, oemer_todelpt) 
     resolution   0.50000 ;
update statistics medium for table oemer (
     oemer_actdiscnt, oemer_atpreqd, oemer_batchno, oemer_binloc, oemer_bompset, 
     oemer_certcomb, oemer_certdelpt, oemer_certify, oemer_certnum, oemer_certtype, 
     oemer_comcd, oemer_compflag, oemer_consdesp, oemer_consinv, oemer_country, 
     oemer_cusreqdte, oemer_custitem, oemer_despdate, oemer_directdel, oemer_discntac, 
     oemer_discode, oemer_drate1, oemer_drate2, oemer_drate3, oemer_escalate, 
     oemer_esccharge, oemer_fixprice, oemer_fromdelpt, oemer_invlinnum, oemer_invmeth, 
     oemer_invnum, oemer_itaxstat, oemer_itemac, oemer_linsource, oemer_location, 
     oemer_locdet, oemer_ltype, oemer_lud, oemer_lui, oemer_maker, 
     oemer_mntflag, oemer_ncgflg, oemer_needserv, oemer_netprice, oemer_netvalue, 
     oemer_normalupr, oemer_olinedate, oemer_orduom, oemer_origdoc, oemer_origord, 
     oemer_payref, oemer_prefix, oemer_price, oemer_pricelist, oemer_pricemeth, 
     oemer_priceprom, oemer_priceuom, oemer_prodgroup, oemer_prtflag, oemer_qbactused, 
     oemer_qbapcused, oemer_qbd1rate, oemer_qbd2rate, oemer_qbd3rate, oemer_qbipcused, 
     oemer_qbitmused, oemer_qboffqty, oemer_qbondate, oemer_qbonqty, oemer_qbtype, 
     oemer_qbvalue, oemer_qtyalloc, oemer_qtyord, oemer_qtyos, oemer_qtyovrdel, 
     oemer_qtyunddel, oemer_rollupcst, oemer_rollupprc, oemer_sdactused, oemer_sdapcused, 
     oemer_sdipcused, oemer_sditmused, oemer_sdondate, oemer_spactused, oemer_spapcused, 
     oemer_spondate, oemer_status, oemer_stdprcurr, oemer_stdprice, oemer_stdpruom, 
     oemer_suffix, oemer_supplier, oemer_suppto, oemer_taxcode, oemer_taxincl, 
     oemer_tempid, oemer_test, oemer_totqtyinv, oemer_uomfact, oemer_usedby, 
     oemer_user1, oemer_user2, oemer_user3, oemer_user4) 
     resolution   2.50000   0.95000 ;
update statistics high for table oempr (
     oempr_account, oempr_actinvdte, oempr_actinvtim, oempr_consign, oempr_dateneg, 
     oempr_delnoteno, oempr_despdate, oempr_invnoteno, oempr_item, oempr_linnum, 
     oempr_ordnum, oempr_pickdate, oempr_piknoseq, oempr_piknoteno, oempr_progflag, 
     oempr_schedule, oempr_serial, oempr_shipment, oempr_statflg, oempr_store, 
     oempr_taxincl) 
     resolution   0.50000 ;
update statistics medium for table oempr (
     oempr_binloc, oempr_custdelno, oempr_custpri, oempr_deldate, oempr_delroute, 
     oempr_edidate, oempr_editime, oempr_fndqty, oempr_invdate, oempr_lud, 
     oempr_lui, oempr_pickqty, oempr_smbatch, oempr_status, oempr_stkqty, 
     oempr_user1, oempr_user2, oempr_user3, oempr_user4, oempr_wavepikno) 
     resolution   2.50000   0.95000 ;
update statistics high for table oemsc (
     oemsc_linnum, oemsc_ordnum) 
     resolution   0.50000 ;
update statistics medium for table oemsc (
     oemsc_chgetype, oemsc_commodity, oemsc_cost, oemsc_country, oemsc_desc, 
     oemsc_dmscdscfl, oemsc_escalate, oemsc_esccharge, oemsc_esccost, oemsc_escline, 
     oemsc_escvalue, oemsc_itaxstat, oemsc_linestat, oemsc_lud, oemsc_lui, 
     oemsc_miscac, oemsc_netvalue, oemsc_origdoc, oemsc_prodgroup, oemsc_taxcode, 
     oemsc_taxincl, oemsc_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table oensi (
     oensi_linnum, oensi_ordnum) 
     resolution   0.50000 ;
update statistics medium for table oensi (
     oensi_cdescext, oensi_commodity, oensi_cost, oensi_decimals, oensi_descext, 
     oensi_item, oensi_linestat, oensi_lud, oensi_lui, oensi_suppcode, 
     oensi_weight) 
     resolution   2.50000   0.95000 ;
update statistics high for table oephdr (
     oeph_dtaxstat, oeph_pricelist, oeph_salesoff, oeph_ttaxstat, oeph_wtaxstat) 
     resolution   0.50000 ;
update statistics medium for table oephdr (
     oeph_currency, oeph_desc, oeph_lud, oeph_lui, oeph_offdate, 
     oeph_ondate) 
     resolution   2.50000   0.95000 ;
update statistics high for table oeplst (
     oepl_item, oepl_pricelist, oepl_salesoff) 
     resolution   0.50000 ;
update statistics medium for table oeplst (
     oepl_comcd, oepl_itemac, oepl_lud, oepl_lui, oepl_pcheff, 
     oepl_pchgam, oepl_pchgpv, oepl_price, oepl_priceuom) 
     resolution   2.50000   0.95000 ;
update statistics high for table oeref (
     oeref_rcode, oeref_rtype) 
     resolution   0.50000 ;
update statistics medium for table oeref (
     oeref_lud, oeref_lui, oeref_rtext) 
     resolution   2.50000   0.95000 ;
update statistics high for table oetrn (
     oetrn_batch, oetrn_cactinvno, oetrn_ccurrbr, oetrn_entdate, oetrn_glcposted, 
     oetrn_gllposted, oetrn_glmposted, oetrn_gloposted, oetrn_gltposted, oetrn_invnum, 
     oetrn_invreg, oetrn_lactinvno, oetrn_lcurrbr, oetrn_linnum, oetrn_mactinvno, 
     oetrn_mcurrbr, oetrn_mitmdisac, oetrn_oactinvno, oetrn_ocurrbr, oetrn_ordnum, 
     oetrn_regprtflg, oetrn_sales2man, oetrn_salesman, oetrn_salesoff, oetrn_serial, 
     oetrn_tactinvno, oetrn_tcurrbr, oetrn_txlinklin) 
     resolution   0.50000 ;
update statistics medium for table oetrn (
     oetrn_account, oetrn_boepayee, oetrn_branch, oetrn_ccauth, oetrn_ccost, 
     oetrn_cgross, oetrn_citmdisac, oetrn_cldisc, oetrn_cnet, oetrn_codisc, 
     oetrn_conmethod, oetrn_consign, oetrn_cosglacc, oetrn_cost, oetrn_cprice, 
     oetrn_crdbind, oetrn_csettdisc, oetrn_ctax, oetrn_ctaxable, oetrn_currcode, 
     oetrn_custcode, oetrn_deladdcod, oetrn_deldate, oetrn_delnoteno, oetrn_discntac, 
     oetrn_ediinvoic, oetrn_edinvdate, oetrn_edinvtime, oetrn_extref, oetrn_faxinvoic, 
     oetrn_geog, oetrn_gldate, oetrn_glref1, oetrn_glref2, oetrn_glref3, 
     oetrn_glref4, oetrn_glref5, oetrn_grosglval, oetrn_gross, oetrn_groupline, 
     oetrn_hcinvoice, oetrn_hide, oetrn_intref, oetrn_invdate, oetrn_invdcod, 
     oetrn_item, oetrn_itemac, oetrn_itemid, oetrn_ldisc, oetrn_ldiscntac, 
     oetrn_ldisglval, oetrn_lindcod, oetrn_linetype, oetrn_litmdisac, oetrn_lud, 
     oetrn_lui, oetrn_mprserial, oetrn_ncgflg, oetrn_net, oetrn_nettglval, 
     oetrn_odisc, oetrn_odisglacc, oetrn_odisglval, oetrn_oinvqty, oetrn_oitmdisac, 
     oetrn_orddate, oetrn_ordtype, oetrn_orduom, oetrn_origcod, oetrn_originv, 
     oetrn_origlin, oetrn_otycod, oetrn_pfcashrec, oetrn_ponum, oetrn_price, 
     oetrn_pricelist, oetrn_priceuom, oetrn_primerate, oetrn_prodgroup, oetrn_promlist, 
     oetrn_settdisc, oetrn_shipment, oetrn_sinvqty, oetrn_slinetype, oetrn_sm2percen, 
     oetrn_smbatch, oetrn_source, oetrn_stkglacc, oetrn_store, oetrn_susptax, 
     oetrn_tax, oetrn_taxable, oetrn_taxcode, oetrn_taxdate, oetrn_taxglval, 
     oetrn_taxrate, oetrn_termscode, oetrn_titmdisac, oetrn_trantype, oetrn_trunfac, 
     oetrn_trunmeth, oetrn_updflag) 
     resolution   2.50000   0.95000 ;
update statistics medium for table oldsoinfo (
     currate, currency, currvalue, invnum, itemno, 
     labcost, matcost, net, nobrushes, profit, 
     qty) 
     resolution   2.50000   0.95000 ;
update statistics medium for table omac (
     cost, item, stk, wip) 
     resolution   2.50000   0.95000 ;
update statistics high for table packdtl (
     item, ordnum, packnote) 
     resolution   0.50000 ;
update statistics medium for table packdtl (
     carton, prefix, quantity) 
     resolution   2.50000   0.95000 ;
update statistics high for table pl_ext (
     plx_supplier) 
     resolution   0.50000 ;
update statistics medium for table pl_ext (
     plx_baseplt, plx_baseval, plx_currency, plx_currplt, plx_currval) 
     resolution   2.50000   0.95000 ;
update statistics high for table plarch (
     pla_batch, pla_cclink, pla_currency, pla_extref, pla_ourref, 
     pla_period, pla_seq, pla_supplier, pla_trandate, pla_type, 
     pla_xref, pla_year) 
     resolution   0.50000 ;
update statistics medium for table plarch (
     pla_authdate, pla_authid, pla_basecurr, pla_boepayee, pla_coid, 
     pla_comment, pla_conmethod, pla_conrate, pla_constant, pla_contract, 
     pla_currrate, pla_currref, pla_currstat, pla_currvar, pla_discbase, 
     pla_discvalue, pla_docref, pla_duedate, pla_fproof, pla_gldate, 
     pla_invoicpen, pla_linkref, pla_origbase, pla_origcurr, pla_origdisc, 
     pla_origval, pla_paydate, pla_payee, pla_paymethod, pla_payvalue, 
     pla_pendflg, pla_peninvdat, pla_postdate, pla_proof, pla_remcode, 
     pla_revalno, pla_revcurr, pla_revdate, pla_source, pla_status, 
     pla_taxvalue, pla_terms, pla_trunfac, pla_trunmeth, pla_twindisc, 
     pla_twinpay, pla_twinrate, pla_twintax, pla_twinval, pla_userid, 
     pla_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table plopn (
     plopn_currency, plopn_supplier, plopn_year) 
     resolution   0.50000 ;
update statistics medium for table plopn (
     plopn_opbasbal, plopn_opcurbal) 
     resolution   2.50000   0.95000 ;
update statistics high for table plosb (
     plosb_currency, plosb_supplier) 
     resolution   0.50000 ;
update statistics medium for table plosb (
     plosb_balance, plosb_baseval, plosb_cumturn, plosb_euroval) 
     resolution   2.50000   0.95000 ;
update statistics high for table plstat (
     pls_currency, pls_period, pls_supplier, pls_year) 
     resolution   0.50000 ;
update statistics medium for table plstat (
     pls_bfdpurch, pls_totbascr, pls_totbasdb, pls_totcurcr, pls_totcurdb, 
     pls_totpurch) 
     resolution   2.50000   0.95000 ;
update statistics high for table plsupp (
     plsup_branch, plsup_credwith, plsup_currency, plsup_ndcode, plsup_priority, 
     plsup_supplier) 
     resolution   0.50000 ;
update statistics medium for table plsupp (
     plsup_accountco, plsup_acctref, plsup_anaid, plsup_balance, plsup_cashflow, 
     plsup_cexrate, plsup_class1, plsup_class2, plsup_class3, plsup_conspmt, 
     plsup_control, plsup_country, plsup_cumturn, plsup_dateopen, plsup_dittxstat, 
     plsup_glaccount, plsup_language, plsup_lastpay, plsup_lastpurch, plsup_limit, 
     plsup_ocind, plsup_payee, plsup_paymethod, plsup_percrate, plsup_remit, 
     plsup_status, plsup_staxstat, plsup_taxreg, plsup_termcode, plsup_twinbal, 
     plsup_twincurr, plsup_twinreqd, plsup_type, plsup_vatcode) 
     resolution   2.50000   0.95000 ;
update statistics high for table pltran (
     plt_batch, plt_cclink, plt_currency, plt_duedate, plt_extref, 
     plt_ourref, plt_period, plt_seq, plt_supplier, plt_trandate, 
     plt_type, plt_xref, plt_year) 
     resolution   0.50000 ;
update statistics medium for table pltran (
     plt_authdate, plt_authid, plt_basecurr, plt_baseval, plt_batchprt, 
     plt_boepayee, plt_coid, plt_comment, plt_conmethod, plt_conrate, 
     plt_constant, plt_contract, plt_currrate, plt_currref, plt_currstat, 
     plt_currvar, plt_discbase, plt_discvalue, plt_docref, plt_fproof, 
     plt_gldate, plt_invoicpen, plt_linkref, plt_origbase, plt_origcurr, 
     plt_origdisc, plt_origval, plt_paydate, plt_payee, plt_paymethod, 
     plt_payvalue, plt_pendflg, plt_peninvdat, plt_postdate, plt_proof, 
     plt_remcode, plt_revalno, plt_revcurr, plt_revdate, plt_source, 
     plt_status, plt_taxvalue, plt_terms, plt_trunfac, plt_trunmeth, 
     plt_twindisc, plt_twinpay, plt_twinrate, plt_twintax, plt_twinval, 
     plt_userid, plt_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table pltrig (
     pltri_batch, pltri_credwith, pltri_currency, pltri_duedate, pltri_ourref, 
     pltri_payee, pltri_paymethod, pltri_priority, pltri_seq, pltri_status, 
     pltri_supplier, pltri_trandate, pltri_type) 
     resolution   0.50000 ;
update statistics medium for table pltrig (
     pltri_acctref, pltri_autototal, pltri_baseval, pltri_bkdocreq, pltri_control, 
     pltri_discvalue, pltri_extref, pltri_glaccount, pltri_glvalue, pltri_headflag, 
     pltri_paydate, pltri_payvalue, pltri_remit, pltri_transtat) 
     resolution   2.50000   0.95000 ;
update statistics high for table prhed (
     prhed_batch, prhed_extref, prhed_ourref, prhed_supplier, prhed_trandate) 
     resolution   0.50000 ;
update statistics medium for table prhed (
     prhed_auth, prhed_authdate, prhed_authid, prhed_basecurr, prhed_batchprt, 
     prhed_boepayee, prhed_conmethod, prhed_constant, prhed_country, prhed_currency, 
     prhed_currrate, prhed_currref, prhed_currstat, prhed_disc, prhed_discvalue, 
     prhed_dittxstat, prhed_docref, prhed_duedate, prhed_esource, prhed_gldate, 
     prhed_lud, prhed_lui, prhed_payee, prhed_paymethod, prhed_postbatch, 
     prhed_printflag, prhed_pstatus, prhed_ref1, prhed_ref2, prhed_ref3, 
     prhed_taxdate, prhed_taxincl, prhed_taxvalue, prhed_terms, prhed_text1, 
     prhed_text2, prhed_trunfac, prhed_trunmeth, prhed_twinrate, prhed_type, 
     prhed_user1, prhed_user2, prhed_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table prlin (
     prlin_delnote, prlin_grn, prlin_line, prlin_orderno, prlin_ourref, 
     prlin_type) 
     resolution   0.50000 ;
update statistics medium for table prlin (
     prlin_account, prlin_auth, prlin_clctype, prlin_clusr1, prlin_clusr2, 
     prlin_costcen, prlin_costord, prlin_element, prlin_enddate, prlin_gross, 
     prlin_iaccount, prlin_inproc, prlin_invvalbas, prlin_itaxstat, prlin_lud, 
     prlin_lui, prlin_ref1, prlin_ref2, prlin_ref3, prlin_retstock, 
     prlin_startdate, prlin_tallocval, prlin_text1, prlin_text2, prlin_transdate, 
     prlin_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table prtax (
     prtax_ourref, prtax_taxcode) 
     resolution   0.50000 ;
update statistics medium for table prtax (
     prtax_acqtaxcod, prtax_comtaxrq, prtax_goodsval, prtax_line, prtax_taxval) 
     resolution   2.50000   0.95000 ;
update statistics high for table pst (
     pst_detitem, pst_lineno, pst_ondate, pst_orgitem, pst_paritem) 
     resolution   0.50000 ;
update statistics medium for table pst (
     pst_advance, pst_eremarks, pst_indmps, pst_intromod, pst_lud, 
     pst_lui, pst_noff, pst_noffuom, pst_offdate, pst_opno, 
     pst_ppf, pst_procsoppf, pst_termod, pst_wastepc) 
     resolution   2.50000   0.95000 ;
update statistics high for table pugrn (
     pugrn_delnote, pugrn_grn, pugrn_grndate, pugrn_grntime, pugrn_item, 
     pugrn_neggrndat, pugrn_neggrntim, pugrn_orderno, pugrn_ordline, pugrn_release, 
     pugrn_shipment) 
     resolution   0.50000 ;
update statistics medium for table pugrn (
     pugrn_conlin, pugrn_contract, pugrn_cposted, pugrn_glrefrom, pugrn_glrefto, 
     pugrn_glrefvar, pugrn_gracct, pugrn_grstore, pugrn_lud, pugrn_lui, 
     pugrn_matchdate, pugrn_matvalue, pugrn_mgcbase, pugrn_mgvbase, pugrn_planner, 
     pugrn_pricepaid, pugrn_purvalbas, pugrn_qtygood, pugrn_qtyinsp, pugrn_qtyrcvd, 
     pugrn_qtyreturn, pugrn_qtyrework, pugrn_qtyscrap, pugrn_qtysentbk, pugrn_remarks, 
     pugrn_retacct, pugrn_solinnum, pugrn_soordnum, pugrn_sremarks, pugrn_status, 
     pugrn_stkgood, pugrn_stkreturn, pugrn_toncstval, pugrn_volume, pugrn_weight) 
     resolution   2.50000   0.95000 ;
update statistics high for table puldel (
     puld_desckey, puld_orderno, puld_ordline, puld_sdesckey, puld_sequence) 
     resolution   0.50000 ;
update statistics medium for table puldel (
     puld_blanket, puld_branch, puld_commodity, puld_completed, puld_country, 
     puld_datelim, puld_decimals, puld_deluom, puld_descext, puld_insppc, 
     puld_item, puld_lastpaid, puld_lastprice, puld_linecost, puld_lud, 
     puld_lui, puld_partno, puld_price, puld_priceuom, puld_puaccount, 
     puld_qtylim, puld_scrappc, puld_sdescext, puld_status, puld_stocked, 
     puld_supplier, puld_suptime, puld_termcode, puld_terms, puld_type, 
     puld_valuelim, puld_weight) 
     resolution   2.50000   0.95000 ;
update statistics high for table pulin (
     pulin_branch, pulin_desckey, pulin_item, pulin_manfac, pulin_opno, 
     pulin_orderno, pulin_ordline, pulin_routeid, pulin_sdesckey, pulin_supplier) 
     resolution   0.50000 ;
update statistics medium for table pulin (
     pulin_amendflg, pulin_blanket, pulin_commodity, pulin_completed, pulin_contract, 
     pulin_country, pulin_datelim, pulin_decimals, pulin_deluom, pulin_descext, 
     pulin_drawiss, pulin_drawno, pulin_insppc, pulin_itaxstat, pulin_lastpaid, 
     pulin_lastprice, pulin_lastqty, pulin_linecost, pulin_lud, pulin_lui, 
     pulin_partno, pulin_price, pulin_priceuom, pulin_prodgrpcd, pulin_puaccount, 
     pulin_qtylim, pulin_scrappc, pulin_sdescext, pulin_socomplin, pulin_solinnum, 
     pulin_soordnum, pulin_status, pulin_stocked, pulin_suptime, pulin_termcode, 
     pulin_terms, pulin_type, pulin_valuelim, pulin_weight, pulin_workcen) 
     resolution   2.50000   0.95000 ;
update statistics high for table puold (
     puold_orderno, puold_ordline, puold_release) 
     resolution   0.50000 ;
update statistics medium for table puold (
     puold_completed, puold_deldate, puold_delqty, puold_duedate, puold_lud, 
     puold_lui, puold_qtygood, puold_qtyinsp, puold_qtyreturn, puold_qtyscrap, 
     puold_remarks) 
     resolution   2.50000   0.95000 ;
update statistics high for table puord (
     puord_branch, puord_orderno, puord_supplier, puord_supref) 
     resolution   0.50000 ;
update statistics medium for table puord (
     puord_ackdate, puord_amendflg, puord_amendno, puord_buyer, puord_buyername, 
     puord_completed, puord_cost, puord_currency, puord_dndcode, puord_edidate, 
     puord_edipo, puord_editime, puord_faxpo, puord_hcpo, puord_issuedate, 
     puord_lud, puord_lui, puord_manfac, puord_ndcode, puord_ordtype, 
     puord_printdate, puord_puaccount, puord_puscacct, puord_puscrapst, puord_pustore, 
     puord_qlimuom, puord_qtylim, puord_remarks, puord_reprint, puord_reqn, 
     puord_scndcode, puord_stage, puord_status, puord_stdterms, puord_termcode, 
     puord_terms, puord_wkcenrate, puord_wkcenunit, puord_workcen) 
     resolution   2.50000   0.95000 ;
update statistics high for table purel (
     purel_branch, purel_deldate, purel_duedate, purel_item, purel_orderno, 
     purel_ordline, purel_release, purel_revdate, purel_shipment, purel_supplier, 
     purel_worderno) 
     resolution   0.50000 ;
update statistics medium for table purel (
     purel_amendflg, purel_completed, purel_conlin, purel_contract, purel_delqty, 
     purel_dueqty, purel_edidate, purel_editime, purel_lud, purel_lui, 
     purel_mrpdate, purel_mrpqty, purel_orddate, purel_qtygood, purel_qtyinsp, 
     purel_qtyrcvd, purel_qtyreturn, purel_qtyrework, purel_qtyscrap, purel_qtysentbk, 
     purel_remarks, purel_reqn, purel_revqty, purel_satisfies, purel_stkreturn, 
     purel_user1) 
     resolution   2.50000   0.95000 ;
update statistics high for table purem (
     purem_orderno, purem_ordline, purem_sequence) 
     resolution   0.50000 ;
update statistics medium for table purem (
     purem_remarks) 
     resolution   2.50000   0.95000 ;
update statistics high for table pusup (
     pusup_branch, pusup_supplier) 
     resolution   0.50000 ;
update statistics medium for table pusup (
     pusup_account, pusup_contact, pusup_country, pusup_currency, pusup_delterms, 
     pusup_edicode, pusup_edipo, pusup_engdiary, pusup_engemail, pusup_engisdn, 
     pusup_engmobile, pusup_engnotepd, pusup_engpager, pusup_engregion, pusup_engskills, 
     pusup_engsupp, pusup_engtitle, pusup_engvehicl, pusup_faxpo, pusup_hcpo, 
     pusup_lang, pusup_lud, pusup_lui, pusup_ndcode, pusup_ourcode, 
     pusup_ouredi, pusup_puaccount, pusup_puscacct, pusup_puscrapst, pusup_pustore, 
     pusup_remarks, pusup_stage, pusup_status, pusup_taxincl, pusup_terms, 
     pusup_transport) 
     resolution   2.50000   0.95000 ;
update statistics high for table reflog (
     rfl_reference, rfl_reftype) 
     resolution   0.50000 ;
update statistics medium for table reflog (
     rfl_logdate, rfl_progid, rfl_source, rfl_termid, rfl_userid) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln (
     rp_acc, rp_item, rp_wordno) 
     resolution   0.50000 ;
update statistics medium for table respln (
     rp_duedate, rp_dueqty, rp_leadtime, rp_makebuy, rp_type) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln1 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln1 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_type, 
     rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln2 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln2 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_type, 
     rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln3 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln3 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_makebuy, 
     rp_type, rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln4 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln4 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_makebuy, 
     rp_type, rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln5 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln5 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_makebuy, 
     rp_type, rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln6 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln6 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_makebuy, 
     rp_type, rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table respln7 (
     rp_item) 
     resolution   0.50000 ;
update statistics medium for table respln7 (
     rp_acc, rp_duedate, rp_dueqty, rp_leadtime, rp_makebuy, 
     rp_type, rp_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table resplna (
     rpa_acc, rpa_duedate, rpa_item, rpa_snpshtdate, rpa_type) 
     resolution   0.50000 ;
update statistics medium for table resplna (
     rpa_dueqty, rpa_makebuy, rpa_wordno) 
     resolution   2.50000   0.95000 ;
update statistics high for table rtcen (
     rtcen_manfac, rtcen_workcen) 
     resolution   0.50000 ;
update statistics medium for table rtcen (
     rtcen_branch, rtcen_costcen, rtcen_crp, rtcen_entrydate, rtcen_hourcal, 
     rtcen_lud, rtcen_lui, rtcen_name, rtcen_procunit, rtcen_qoverride, 
     rtcen_qtime, rtcen_qunit, rtcen_resid, rtcen_resqty, rtcen_shortdesc, 
     rtcen_subcon, rtcen_supplier, rtcen_useetm) 
     resolution   2.50000   0.95000 ;
update statistics high for table rthed (
     rthed_item, rthed_manfac, rthed_routeid) 
     resolution   0.50000 ;
update statistics medium for table rthed (
     rthed_branch, rthed_improver, rthed_lud, rthed_lui, rthed_opscrap, 
     rthed_remarks, rthed_resp, rthed_sbq, rthed_serialop, rthed_status, 
     rthed_supplier, rthed_tbq, rthed_timesused) 
     resolution   2.50000   0.95000 ;
update statistics high for table rtop (
     rtop_item, rtop_manfac, rtop_ondate, rtop_opno, rtop_routeid) 
     resolution   0.50000 ;
update statistics medium for table rtop (
     rtop_backflush, rtop_classcode, rtop_elaptime, rtop_elapunit, rtop_intromod, 
     rtop_lud, rtop_lui, rtop_mbq, rtop_offdate, rtop_pbq, 
     rtop_proctime, rtop_procunit, rtop_qoverride, rtop_qtime, rtop_qunit, 
     rtop_remarks, rtop_sbq, rtop_scrappc, rtop_setmiss, rtop_settime, 
     rtop_setunit, rtop_shortdesc, rtop_tbq, rtop_termod, rtop_textref, 
     rtop_workcen) 
     resolution   2.50000   0.95000 ;
update statistics high for table sjord (
     sjord_duedate, sjord_item, sjord_negdue, sjord_orderno, sjord_revdue) 
     resolution   0.50000 ;
update statistics medium for table sjord (
     sjord_amendno, sjord_completed, sjord_conlin, sjord_contract, sjord_delacct, 
     sjord_delstore, sjord_drawiss, sjord_drawno, sjord_dueqty, sjord_duetime, 
     sjord_glrefrom, sjord_glrefto, sjord_glvarfrom, sjord_glvarto, sjord_lastop, 
     sjord_linnum, sjord_lspro, sjord_lud, sjord_lui, sjord_manfac, 
     sjord_modser, sjord_monord, sjord_opscrap, sjord_ordnum, sjord_pcontrlr, 
     sjord_premarks, sjord_printdate, sjord_priority, sjord_qtyrcvd, sjord_qtyscrap, 
     sjord_reldate, sjord_released, sjord_remarks, sjord_reprint, sjord_revqty, 
     sjord_routeid, sjord_rtplanned, sjord_scracct, sjord_scrappc, sjord_scrstore, 
     sjord_serialop, sjord_splitfrom, sjord_stage, sjord_startdate, sjord_wipscrap) 
     resolution   2.50000   0.95000 ;
update statistics high for table slarc (
     slarc_batch, slarc_currcode, slarc_custcode, slarc_extref, slarc_intref, 
     slarc_link, slarc_origcust, slarc_period, slarc_tranno, slarc_transdate, 
     slarc_year) 
     resolution   0.50000 ;
update statistics medium for table slarc (
     slarc_acctref, slarc_amount, slarc_basecurr, slarc_baseval, slarc_batchno, 
     slarc_batchprt, slarc_batchref, slarc_comment, slarc_conmethod, slarc_contract, 
     slarc_country, slarc_crdbind, slarc_currrate, slarc_currstat, slarc_currvar, 
     slarc_delkgiv, slarc_discamt, slarc_discbase, slarc_discgiv, slarc_duedate, 
     slarc_duedtechg, slarc_follodate, slarc_follorun, slarc_followrun, slarc_frlistno, 
     slarc_futpaid, slarc_gldate, slarc_invcust, slarc_invmeth, slarc_itemno, 
     slarc_linkref, slarc_lud, slarc_origbase, slarc_originv, slarc_osamount, 
     slarc_ostwinval, slarc_pendate, slarc_penref, slarc_pfpayref, slarc_postdate, 
     slarc_prlistno, slarc_prtflag, slarc_revalno, slarc_revcurr, slarc_revdate, 
     slarc_salesoff, slarc_severity, slarc_sourcecd, slarc_stmntdt, slarc_taxadj, 
     slarc_taxamount, slarc_termscode, slarc_trstatus, slarc_trtype, slarc_trunfac, 
     slarc_trunmeth, slarc_twinrate, slarc_twinval, slarc_userid, slarc_voucher) 
     resolution   2.50000   0.95000 ;
update statistics high for table slarea (
     slg_geogarea) 
     resolution   0.50000 ;
update statistics medium for table slarea (
     slg_areaname, slg_lud, slg_lui, slg_territory) 
     resolution   2.50000   0.95000 ;
update statistics high for table slbctl (
     sll_batchno) 
     resolution   0.50000 ;
update statistics medium for table slbctl (
     sll_batchref, sll_bcomplete, sll_bdate, sll_breport, sll_btotal, 
     sll_btype, sll_custcode, sll_dtotal, sll_intref, sll_items, 
     sll_lud, sll_userid) 
     resolution   2.50000   0.95000 ;
update statistics high for table slctyp (
     slk_custtype) 
     resolution   0.50000 ;
update statistics medium for table slctyp (
     slk_agecode, slk_ctdescr, slk_lud, slk_lui) 
     resolution   2.50000   0.95000 ;
update statistics high for table slcum (
     slcum_branch, slcum_currency) 
     resolution   0.50000 ;
update statistics medium for table slcum (
     slcum_lud, slcum_lui, slcum_slcontrol, slcum_slcu2var, slcum_slcurvar, 
     slcum_slpfcntrl, slcum_slre2var, slcum_slrevvar) 
     resolution   2.50000   0.95000 ;
update statistics high for table slcust (
     slm_agecode, slm_branch, slm_currcode, slm_custcode, slm_lang, 
     slm_nadcode, slm_postcode, slm_shortname) 
     resolution   0.50000 ;
update statistics medium for table slcust (
     slm_boebal, slm_boepayee, slm_cexrate, slm_conmethod, slm_consflg, 
     slm_country, slm_crchkbal, slm_crchkmeth, slm_credlflg, slm_credstop, 
     slm_credtflg, slm_crlimit, slm_ctaxstat, slm_custtype, slm_custvat, 
     slm_dittxstat, slm_geogarea, slm_inproc, slm_invacode, slm_invlimit, 
     slm_lpaydt, slm_lsaledt, slm_lupdate, slm_minstmval, slm_nocrednts, 
     slm_noinvpnts, slm_opendt, slm_ostwinval, slm_payhist, slm_penacct, 
     slm_pendays, slm_penrate, slm_pentaxcd, slm_ptflag, slm_slsperson, 
     slm_stmacode, slm_stmntreqd, slm_summreqd, slm_taxstatus, slm_termscode, 
     slm_twincurr, slm_twinreqd, slm_updid, slm_vatcode) 
     resolution   2.50000   0.95000 ;
update statistics high for table sllink (
     sln_branch) 
     resolution   0.50000 ;
update statistics medium for table sllink (
     sln_adjcac, sln_bankcac, sln_brdescr, sln_delkacct, sln_dgivcac, 
     sln_ldiscacc, sln_merchcac, sln_odiscacc, sln_taxcac) 
     resolution   2.50000   0.95000 ;
update statistics high for table slopn (
     slopn_currency, slopn_custcode, slopn_year) 
     resolution   0.50000 ;
update statistics medium for table slopn (
     slopn_opbasbal, slopn_opcurbal) 
     resolution   2.50000   0.95000 ;
update statistics high for table slosb (
     slosb_currency, slosb_custcode) 
     resolution   0.50000 ;
update statistics medium for table slosb (
     slosb_baseboe, slosb_basenboe, slosb_currboe, slosb_currnboe, slosb_disputed, 
     slosb_euroboe, slosb_euronboe) 
     resolution   2.50000   0.95000 ;
update statistics high for table slslsp (
     slr_slsperson) 
     resolution   0.50000 ;
update statistics medium for table slslsp (
     slr_aprdcost, slr_aprdvalue, slr_aytdcost, slr_aytdval, slr_bprdcost, 
     slr_bprdvalue, slr_bytdcost, slr_bytdvalue, slr_geog, slr_lud, 
     slr_lui, slr_ndcode, slr_salesoff, slr_slspname, slr_territory, 
     slr_terrman) 
     resolution   2.50000   0.95000 ;
update statistics high for table slstat (
     sls_currcode, sls_custcode, sls_period, sls_year) 
     resolution   0.50000 ;
update statistics medium for table slstat (
     sls_adjtot, sls_lud, sls_lui, sls_openbal, sls_recpttot, 
     sls_salestot, sls_totbascr, sls_totbasdb, sls_totcurcr, sls_totcurdb) 
     resolution   2.50000   0.95000 ;
update statistics high for table slterm (
     sld_termscode) 
     resolution   0.50000 ;
update statistics medium for table slterm (
     sld_adddays, sld_adddays1, sld_adddays2, sld_adddays3, sld_baseflg, 
     sld_damt1, sld_damt2, sld_damt3, sld_day1, sld_day2, 
     sld_day3, sld_delkperc, sld_delkvatin, sld_drate1, sld_drate2, 
     sld_drate3, sld_dueday, sld_dueday1, sld_dueday2, sld_dueday3, 
     sld_duemon, sld_lud, sld_lui, sld_month1, sld_month2, 
     sld_month3, sld_tcdesc) 
     resolution   2.50000   0.95000 ;
update statistics high for table sltran (
     slt_bankid, slt_batch, slt_currcode, slt_custcode, slt_duedate, 
     slt_extref, slt_intref, slt_link, slt_origcust, slt_pdcgroup, 
     slt_period, slt_tranno, slt_transdate, slt_trstatus, slt_trtype, 
     slt_voucher, slt_year) 
     resolution   0.50000 ;
update statistics medium for table sltran (
     slt_acctref, slt_amount, slt_basecurr, slt_baseval, slt_batchno, 
     slt_batchprt, slt_batchref, slt_boepayee, slt_ccauth, slt_comment, 
     slt_conmethod, slt_contract, slt_country, slt_crdbind, slt_currrate, 
     slt_currstat, slt_currvar, slt_delkgiv, slt_discamt, slt_discbase, 
     slt_discgiv, slt_duedtechg, slt_follodate, slt_follorun, slt_frlistno, 
     slt_futpaid, slt_gldate, slt_invcust, slt_invmeth, slt_itemno, 
     slt_linkref, slt_lud, slt_origbase, slt_originv, slt_osamount, 
     slt_ostwinval, slt_pendate, slt_penref, slt_pfpayref, slt_postdate, 
     slt_prlistno, slt_prtflag, slt_revalno, slt_revcurr, slt_revdate, 
     slt_salesoff, slt_severity, slt_sourcecd, slt_stmntdt, slt_taxadj, 
     slt_taxamount, slt_termscode, slt_trunfac, slt_trunmeth, slt_twinrate, 
     slt_twinval, slt_user1, slt_user2, slt_user3, slt_user4, 
     slt_user5, slt_user6, slt_userid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table syscolauth (
     colauth, colno, grantee, grantor, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table syscoldepend (
     colno, constrid, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table syscolumns (
     collength, colname, colno, coltype, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysconstraints (
     constrid, constrname, constrtype, idxname, owner, 
     tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysdefaults (
     colno, default, tabid, type) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysdepend (
     btabid, btype, dtabid, dtype) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysdistrib (
     colno, confidence, constructed, encdat, mode, 
     resolution, seqno, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysindexes (
     clustered, idxname, idxtype, owner, part1, 
     part2, part3, part4, part5, part6, 
     part7, part8, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysobjstate (
     name, objtype, owner, state, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysprocbody (
     data, datakey, procid, seqno) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysprocplan (
     created, data, datakey, datasize, planid, 
     procid, seqno) 
     resolution   2.50000   0.95000 ;
update statistics medium for table systabauth (
     grantee, grantor, tabauth, tabid) 
     resolution   2.50000   0.95000 ;
update statistics medium for table systables (
     audpath, created, dirpath, ncols, nindexes, 
     nrows, owner, rowsize, tabid, tabname, 
     tabtype, version) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysusers (
     password, priority, username, usertype) 
     resolution   2.50000   0.95000 ;
update statistics medium for table sysviews (
     seqno, tabid, viewtext) 
     resolution   2.50000   0.95000 ;
update statistics high for table txiid (
     txiid_account, txiid_ordlin, txiid_ordnum, txiid_release) 
     resolution   0.50000 ;
update statistics medium for table txiid (
     txiid_commodity, txiid_consign, txiid_country, txiid_delterms, txiid_lud, 
     txiid_lui, txiid_mass, txiid_nature, txiid_origin, txiid_suppunits, 
     txiid_traderref, txiid_transport, txiid_value) 
     resolution   2.50000   0.95000 ;
update statistics high for table txiii (
     txiii_branch, txiii_flow, txiii_refdate, txiii_serial, txiii_traderref, 
     txiii_vatlink) 
     resolution   0.50000 ;
update statistics medium for table txiii (
     txiii_commodity, txiii_consign, txiii_country, txiii_delterms, txiii_intref, 
     txiii_lud, txiii_lui, txiii_mass, txiii_month, txiii_nature, 
     txiii_ordlin, txiii_ordnum, txiii_origin, txiii_release, txiii_suppdecpr, 
     txiii_suppunits, txiii_transport, txiii_value, txiii_year) 
     resolution   2.50000   0.95000 ;
update statistics high for table txlink (
     txlnk_dtaxstat, txlnk_itaxstat, txlnk_keyarea, txlnk_ratecode, txlnk_taxlevel, 
     txlnk_ttaxstat, txlnk_wtaxstat) 
     resolution   0.50000 ;
update statistics medium for table txlink (
     txlnk_cumlevel) 
     resolution   2.50000   0.95000 ;
update statistics high for table txpers (
     txper_perend, txper_period, txper_year) 
     resolution   0.50000 ;
update statistics medium for table txpers (
     txper_desc) 
     resolution   2.50000   0.95000 ;
update statistics high for table txrate (
     txr_enddate, txr_taxcode) 
     resolution   0.50000 ;
update statistics medium for table txrate (
     txr_acqcode, txr_acqiglacc, txr_acqoglacc, txr_advinacc, txr_advoutac, 
     txr_comtaxrq, txr_desc, txr_inoutind, txr_isusglacc, txr_manualdis, 
     txr_osusglacc, txr_pradjind, txr_taxrate, txr_taxregrq, txr_vatiglacc, 
     txr_vatoglacc) 
     resolution   2.50000   0.95000 ;
update statistics high for table txstat (
     txsta_status, txsta_type) 
     resolution   0.50000 ;
update statistics medium for table txstat (
     txsta_descript) 
     resolution   2.50000   0.95000 ;
update statistics high for table txtran (
     txt_account, txt_advtax, txt_country, txt_glper, txt_glyear, 
     txt_ourref, txt_payref, txt_period, txt_revglper, txt_revglyear, 
     txt_saleslist, txt_seq, txt_source, txt_taxcode, txt_trandate, 
     txt_trantype, txt_vatnumber, txt_year) 
     resolution   0.50000 ;
update statistics medium for table txtran (
     txt_basecurr, txt_batch, txt_coid, txt_conmethod, txt_currency, 
     txt_currrate, txt_currval, txt_cutaxval, txt_extref, txt_fproof, 
     txt_goodsval, txt_linkref, txt_proof, txt_remcode, txt_ssdlink, 
     txt_summflag, txt_suspended, txt_taxreturn, txt_taxvalue, txt_trunfac, 
     txt_trunmeth, txt_twinrate) 
     resolution   2.50000   0.95000 ;
update statistics high for table uoe02a (
     uoe02a_account, uoe02a_item, uoe02a_ponum, uoe02a_runid) 
     resolution   0.50000 ;
update statistics medium for table uoe02a (
     uoe02a_deldate, uoe02a_qtyord, uoe02a_status, uoe02a_storecode, uoe02a_uspec1, 
     uoe02a_uspec2, uoe02a_uspec3, uoe02a_uspec4, uoe02a_uspec5) 
     resolution   2.50000   0.95000 ;
update statistics high for table uz_stdxrte (
     curr_code) 
     resolution   0.50000 ;
update statistics medium for table uz_stdxrte (
     x_rate) 
     resolution   2.50000   0.95000 ;
update statistics high for table uzfsc (
     uzfsc_desckey, uzfsc_item) 
     resolution   0.50000 ;
update statistics medium for table uzfsc (
     uzfsc_adjust, uzfsc_clbal, uzfsc_descext, uzfsc_fromdate, uzfsc_issues, 
     uzfsc_opbal, uzfsc_receipts, uzfsc_todate) 
     resolution   2.50000   0.95000 ;
update statistics high for table uzllc (
     uzllc_item) 
     resolution   0.50000 ;
update statistics medium for table uzllc (
     uzllc_desckey, uzllc_detitem, uzllc_level, uzllc_makebuy, uzllc_noff, 
     uzllc_noffuom, uzllc_prodgroup, uzllc_wastepc) 
     resolution   2.50000   0.95000 ;
update statistics high for table uzmii (
     uzmii_item) 
     resolution   0.50000 ;
update statistics medium for table uzmii (
     uzmii_desckey, uzmii_detitem, uzmii_level, uzmii_makebuy, uzmii_noff, 
     uzmii_noffuom, uzmii_prodgroup) 
     resolution   2.50000   0.95000 ;
update statistics high for table uzpbr (
     uzpbr_item) 
     resolution   0.50000 ;
update statistics medium for table uzpbr (
     uzpbr_component, uzpbr_desckey, uzpbr_keyword, uzpbr_level, uzpbr_makebuy, 
     uzpbr_noff, uzpbr_uom) 
     resolution   2.50000   0.95000 ;
update statistics medium for table uzpbrsh (
     uzp_component, uzp_level, uzp_printed) 
     resolution   2.50000   0.95000 ;
update statistics high for table uzprtop (
     uzpr_component, uzpr_level, uzpr_manfac, uzpr_ondate, uzpr_opno, 
     uzpr_printed, uzpr_routeid) 
     resolution   0.50000 ;
update statistics medium for table uzprtop (
     uzpr_backflush, uzpr_classcode, uzpr_desckey, uzpr_elaptime, uzpr_elapunit, 
     uzpr_intromod, uzpr_item, uzpr_lud, uzpr_lui, uzpr_mbq, 
     uzpr_offdate, uzpr_pbq, uzpr_proctime, uzpr_procunit, uzpr_qoverride, 
     uzpr_qtime, uzpr_qunit, uzpr_remarks, uzpr_sbq, uzpr_scrappc, 
     uzpr_setmiss, uzpr_settime, uzpr_setunit, uzpr_shortdesc, uzpr_tbq, 
     uzpr_termod, uzpr_textref, uzpr_workcen) 
     resolution   2.50000   0.95000 ;
update statistics medium for table uzptmp (
     t0_desckey, t0_item, t0_level, t0_makebuy, t0_uom, 
     t1_desckey, t1_item, t1_makebuy, t1_noff, t1_uom, 
     t2_desckey, t2_item, t2_makebuy, t2_noff, t2_uom, 
     t3_desckey, t3_item, t3_makebuy, t3_noff, t3_uom, 
     t4_desckey, t4_item, t4_makebuy, t4_noff, t4_uom, 
     t5_desckey, t5_item, t5_makebuy, t5_noff, t5_uom, 
     t6_desckey, t6_item, t6_makebuy, t6_noff, t6_uom, 
     t7_desckey, t7_item, t7_makebuy, t7_noff, t7_uom, 
     t8_desckey, t8_item, t8_makebuy, t8_noff, t8_uom, 
     t9_desckey, t9_factor, t9_item, t9_makebuy, t9_noff, 
     t9_noffuom, t9_uom) 
     resolution   2.50000   0.95000 ;
update statistics medium for table uzshrt (
     uzshrt_balance, uzshrt_desckey, uzshrt_duedate, uzshrt_dueqty, uzshrt_expected, 
     uzshrt_item, uzshrt_planner) 
     resolution   2.50000   0.95000 ;
update statistics medium for table uztemp1 (
     uzt_component, uzt_item, uzt_makebuy) 
     resolution   2.50000   0.95000 ;

 

