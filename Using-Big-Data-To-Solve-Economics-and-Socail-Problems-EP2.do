*install binscatter
ssc install binscatter, replace

*draw a bin scatter plot visualizing class size changes at 40 student enrollment threshold
binscatter classize school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)

*bin scatter average math scores with class size
binscatter avgmath school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)

*bin scatter different variables 
binscatter disadvantaged school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)
binscatter female school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)
binscatter religious school_enrollment if inrange(school_enrollment,20,60), rd(40.5) discrete line(lfit)

*create new variables
gen above40 = 0
replace above40 = 1 if school_enrollment > 40
gen x = school_enrollment - 40
gen x_above40 = x*above40

*create a regression of class size based upon the above40 indicator
reg classize above40 if inrange(school_enrollment,0,80)

*create a regression of class size on above 40, x, and x_above40
reg classize above40 x x_above40 if inrange(school_enrollment,0,80)

*create a regression of math average on above 40 variable
reg avgmath above40 if inrange(school_enrollment,0,80)

*create a regression of math average on above 40, x, and x_above40 variables 
reg avgmath above40 x x_above40 if inrange(school_enrollment,0,80)
