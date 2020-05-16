

treated_msas = c('C4194', 'C4266', 'C4162', 'C4174', 'C1450', 'C3070', 'C2642', 'C1698', 'C1658', 'C1146', 'C3830', 'C2706', 'C1206', 'C4790', 'C1446', 'C4594')
supercomputing_msas = c('C2706', 'C4174', 'C1658', 'C1450', 'C3830')
regional_msas = c('C4194', 'C4266', 'C4162', 'C3070', 'C2642', 'C1698', 'C1146', 'C1206', 'C4790', 'C1446', 'C4594')

pooled_models = hash()

for (industry in c("51", "511", "512", "515", "516", "517", "518", "519")) {
  msa_df = read.csv(paste(paste('../msa_files/panel_', industry, sep=""), '_msa.csv', sep=""), header=TRUE)
  msa_df$treated_general_dummy = ifelse(msa_df$area_fips %in% treated_msas, 1, 0)
  msa_df$post_dummy = ifelse(msa_df$year>=1995, 1, 0)
  msa_df$did = msa_df$post_dummy * msa_df$treated_general_dummy
  
  lq_estabs_lm = lm(lq_annual_avg_estabs ~ treated_general_dummy + post_dummy + did, data=msa_df)
  lq_empl_lm = lm(lq_annual_avg_emplvl ~ treated_general_dummy + post_dummy + did, data=msa_df)
  lq_pay_lm = lm(lq_avg_annual_pay ~ treated_general_dummy + post_dummy + did, data=msa_df)
  estabs_lm = lm(annual_avg_estabs ~ treated_general_dummy + post_dummy + did, data=msa_df)
  empl_lm = lm(annual_avg_emplvl ~ treated_general_dummy + post_dummy + did, data=msa_df)
  pay_lm = lm(avg_annual_pay ~ treated_general_dummy + post_dummy + did, data=msa_df)
  
  pooled_models[[industry]] = list(lq_estabs_lm, lq_empl_lm, lq_pay_lm, estabs_lm, empl_lm, pay_lm)
}

pooled_models_separated_regional = hash()
# now, redo while considering different things:
for (industry in c("51", "511", "512", "515", "516", "517", "518", "519")) {
  msa_df = read.csv(paste(paste('../msa_files/panel_', industry, sep=""), '_msa.csv', sep=""), header=TRUE)
  
  # cut out supercomputing MSAs, thus removing them from considerations
  msa_df = subset(msa_df, !(area_fips %in% supercomputing_msas))
  
  msa_df$treated_general_dummy = ifelse(msa_df$area_fips %in% treated_msas, 1, 0)
  msa_df$post_dummy = ifelse(msa_df$year>=1995, 1, 0)
  msa_df$did = msa_df$post_dummy * msa_df$treated_general_dummy
  
  lq_estabs_lm = lm(lq_annual_avg_estabs ~ treated_general_dummy + post_dummy + did, data=msa_df)
  lq_empl_lm = lm(lq_annual_avg_emplvl ~ treated_general_dummy + post_dummy + did, data=msa_df)
  lq_pay_lm = lm(lq_avg_annual_pay ~ treated_general_dummy + post_dummy + did, data=msa_df)
  estabs_lm = lm(annual_avg_estabs ~ treated_general_dummy + post_dummy + did, data=msa_df)
  empl_lm = lm(annual_avg_emplvl ~ treated_general_dummy + post_dummy + did, data=msa_df)
  pay_lm = lm(avg_annual_pay ~ treated_general_dummy + post_dummy + did, data=msa_df)
  
  pooled_models_separated_regional[[industry]] = list(lq_estabs_lm, lq_empl_lm, lq_pay_lm, estabs_lm, empl_lm, pay_lm)
}

pooled_models_separated_supercomputing = hash()
# now, redo while considering different things:
for (industry in c("51", "511", "512", "515", "516", "517", "518", "519")) {
  msa_df = read.csv(paste(paste('../msa_files/panel_', industry, sep=""), '_msa.csv', sep=""), header=TRUE)
  
  # cut out regional MSAs, thus removing them from consideration
  msa_df = subset(msa_df, !(area_fips %in% regional_msas))
  
  msa_df$treated_general_dummy = ifelse(msa_df$area_fips %in% treated_msas, 1, 0)
  msa_df$post_dummy = ifelse(msa_df$year>=1995, 1, 0)
  msa_df$did = msa_df$post_dummy * msa_df$treated_general_dummy
  
  lq_estabs_lm = lm(lq_annual_avg_estabs ~ treated_general_dummy + post_dummy + did, data=msa_df)
  lq_empl_lm = lm(lq_annual_avg_emplvl ~ treated_general_dummy + post_dummy + did, data=msa_df)
  lq_pay_lm = lm(lq_avg_annual_pay ~ treated_general_dummy + post_dummy + did, data=msa_df)
  estabs_lm = lm(annual_avg_estabs ~ treated_general_dummy + post_dummy + did, data=msa_df)
  empl_lm = lm(annual_avg_emplvl ~ treated_general_dummy + post_dummy + did, data=msa_df)
  pay_lm = lm(avg_annual_pay ~ treated_general_dummy + post_dummy + did, data=msa_df)
  
  pooled_models_separated_supercomputing[[industry]] = list(lq_estabs_lm, lq_empl_lm, lq_pay_lm, estabs_lm, empl_lm, pay_lm)
}

