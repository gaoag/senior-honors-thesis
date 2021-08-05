# senior-honors-thesis
All the code used to generate the results in the paper is here (albeit, messy and unorganized). Paper is Will organize this into an easy-to-replicate format at some point, hopefully.

Evolution of the internet: a brief explainer
![The Evolution of the Internet](https://imgur.com/DPFqzFU)


Appendix stuff:
- event-study-graphs contains all the graphs of the event study regressions, as well as an RData file containing all the coefficients. The RData file can also be found in /R_files/event_studies.RData and loaded into an R environment. 
- parallel-trends-graphs contains all the parallel trends graphs, split by industry code and outcome of interest
- RData files for the fixed effects regressions can be found in /R_files/pmfe.RData, as well as pmfesuper.RData and pmferegional.RData (those files are for Extension 1, the regressions in which only supercomputing sites or only regional network sites were considered "treated" and the other sites were removed from the data). Load them by calling results <- load.RData(filename), and look at the coefficients by calling results[["X"]] where X is one of the industry codes (51, 511, 512, etc). Be sure to put quotes around the industry code, the table is hashed with the string version. The code used to generate this is found at pooled_fe_indst_plm.R, and can be run with the data in /msa_files/
- R files for Extension 2 (correlation by distance) can be found in /R_files/computing_distance_correlations.R .
- All regressions/results can be derived from the data found in /msa_files/ . To get from raw data to /msa_files/, refer to the python notebooks, and to https://www.bls.gov/cew/downloadable-data-files.htm (annual averages under 'CSVs
Single Files' heading) for the raw data

