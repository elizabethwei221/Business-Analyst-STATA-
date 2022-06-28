. use "/Users/elizabeth/Desktop/HSPN/project 1/OHT Formative Evaluation Survey.dta", clear
drop id-Q02other
drop Q42
foreach var of varlist Q3-Q41 {
  gen _1`var'=1 if `var'==1
  gen _2`var'=1 if `var'==2
  gen _3`var'=1 if `var'==3
  gen _4`var'=1 if `var'==4
  gen _5`var'=1 if `var'==5
}
gen province=1
collapse (sum) _1Q3-_5Q41, by(province)
reshape long _1Q _2Q _3Q _4Q _5Q, i(province) j(question) 
egen n=rowtotal(_1Q _2Q _3Q _4Q _5Q)
gen _1Q_perc=_1Q/n*100
gen _2Q_perc=_2Q/n*100
gen _3Q_perc=_3Q/n*100
gen _4Q_perc=_4Q/n*100
gen _5Q_perc=_5Q/n*100
gen text="Develop goals that are widely understood and supported among members" if question==3
	replace text="Identify how different organizations/programs in the community could help " if question==4
	replace text="Respond to the needs and problems of the community" if question==5
	replace text="Include the views and priorities of the people affected by the OHT's work" if question==6
	replace text="Obtain support from individuals and organizations in the community" if question==7
	replace text="We have a common vision of how to improve the integration of care." if question==8
	replace text="We understand the role we will play in taking responsibility for the local population" if question==9
	replace text="We understand the role we will play in coordinating care" if question==10
	replace text="We have agreed to share responsibility for achieving improved patient outcomes" if question==11
	replace text="We share tools for clinical coordination" if question==12
	replace text="We share clinical information across partners" if question==13
	replace text="We have used data to identify the improvements for our target populations" if question==14
	replace text="We are prepared to question the basis of what the team is doing" if question==15
	replace text="We critically appraise potential weaknesses in what our OHT is planning" if question==16
	replace text="The members of the OHT build on each other’s ideas" if question==17
	replace text="Empowering people/members involved in the OHT" if question==18
	replace text="Communicating the vision of the OHT" if question==19
	replace text="Creating an environment where differences of opinion can be voiced" if question==20
	replace text="Helping the OHT to be creative and look at things differently" if question==21
	replace text="Fostering respect, trust and inclusiveness amongst OHT members" if question==22
	replace text="Communicating among members" if question==23
	replace text="Organizing OHT member activities, including meetings and projects" if question==24
	replace text="Skills and expertise" if question==25
	replace text="Data and information" if question==26
	replace text="Ability to identify target population criteria and deliver interventions" if question==27
	replace text="Connections to political decision-makers, government agencies" if question==28
	replace text="Money" if question==29
	replace text="Tools and technologies" if question==30
	replace text="Organization or practice setting’s attitude toward change" if question==31
	replace text="Your organization’s shared VALUES are compatible with those of other OHT members" if question==32
	replace text="Your organization’s STAFF have a strong sense of belonging to your OHT" if question==33
	replace text="I think that my organization/practice setting will benefit from this change" if question==34
	replace text="This change will make my role easier" if question==35
	replace text="I feel it is worthwhile for me that the organization adopted this change" if question==36
	replace text="I have the skills that are needed to make this change work" if question==37
	replace text="This change will disrupt many of the working relationships I have developed" if question==38
	replace text="We have a ‘we are in it together’ attitude" if question==39
	replace text="We take the time needed to develop new ideas" if question==40
	replace text="To what extent do you think your OHT’s objectives can actually be achieved?" if question==41
label variable question "Item"
label variable text "Item Text"
label variable _1Q_perc "1 (%)"
label variable _2Q_perc "2 (%)"
label variable _3Q_perc "3 (%)"
label variable _4Q_perc "4 (%)"
label variable _5Q_perc "5 (%)"
order question text _1Q_perc-_5Q_perc
export excel question text _1Q_perc _2Q_perc _3Q_perc _4Q_perc _5Q_perc using "Project 1", sheet("Appendix B") firstrow(varlabels) keepcellfmt



