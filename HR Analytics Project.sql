# -- 1. Which three departments had the highest satisfaction scores, and which three had the lowest satisfaction scores?

SELECT 
dept, round(AVG(`satisfaction_level`),4) as avg_satisfaction
FROM `employee attrition`
GROUP BY 1
order by 2 desc
LIMIT 3;

SELECT 
dept, round(AVG(`satisfaction_level`),4) as avg_satisfaction
FROM `employee attrition`
GROUP BY 1
order by 2
LIMIT 3;

#-- 2. What is the relationship between salary and satisfaction score?

select 
salary, round(avg(`satisfaction_level`),4)
from `employee attrition`
group by 1
order by 2 desc
;

-- 3. How did the top two and bottom two depts perform in the following arears
# -- a. last_evaluation
# -- b. number_project
# -- c. average_montly_hours
# -- d. time_spend_company
# -- e. Work_accident
# -- f. promotion_last_5years

select 
	case
    when dept in ('management', 'RandD') then 'top_dept'
    when dept in ('accounting', 'hr') then 'lower_dept'
    end as top_bot,
	count(`EMP ID`) as number_of_emp,
    round(avg(`last_evaluation`),2) as avg_last_evaluation,
    round(avg(`number_project`),2) as avg_number_project,
    round(avg(`average_montly_hours`),2) as hours_worked,
    round(avg(`time_spend_company`),2) as time_at_company,
	round(avg(`Work_accident`),2) as avg_num_accidents,
    round(avg(`promotion_last_5years`),2) as avg_num_proms
from `employee attrition`
where dept in ('management', 'RandD', 'accounting', 'hr')
group by 1
;

SELECT * FROM `employee attrition`



