library(metafor)

### read in data and assign it to 'dat'
dat <- readxl::read_xlsx("C:/Users/hanna/Dropbox/PC/Documents/2_Uni/2_Master_Uni-Erfurt_GeKo/04_Hiwi_JITSUVAX/04_Auswertungen/230306_Meta-Analyse/02_Ergebnisse & Daten/Metaanalysis_SPSS.xlsx")

### calculate cohen's d
dat <- escalc(measure="SMD", 
              m1i = M_exp,
              m2i = M_con,
              sd1i = S_exp,
              sd2i = S_con,
              n1i = N_exp,
              n2i = N_con,
              data = dat)

### fit random-effects model
res <- rma(yi, vi, data=dat)
res

### generate a basic forest plot
forest(res, slab = dat$Author_Year, addcred = TRUE, main="Effects of 
       Misinformation Exposure")

