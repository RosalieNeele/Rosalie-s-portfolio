preprocess <- function (data) {
  
  data_clean <- data  |> 
    
    # rename variables
    rename(age = ridageyr,     # ridageyr - Age in years at screening
           sex = riagendr,     # riagendr - Gender (1 = male, 2 = female)
           bp = bpxsy1,        # bpxsy1 - Systolic: Blood pres (1st rdg) mm Hg
           bmi = bmxbmi,       # bmxbmi - Body Mass Index (kg/m**2)
           HbA1C = lbxgh,      # lbxgh - Glycohemoglobin (%)
           chol = lbdtcsi) |>  # lbdtcsi - Total Cholesterol (mmol/L)
    
    # change sex to factor
    mutate(sex = factor(sex, levels = c(1, 2), labels = c("male", "female"))) |> 
    
    # exclude cases younger than 18
    filter(age >= 18) |> 
    
    # select relevant variables
    select(age, sex, bmi, HbA1C, bp) |> 
    
    # retain only complete cases
    na.omit()
}
