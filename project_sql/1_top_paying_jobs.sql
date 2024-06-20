/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
  jpf.job_title AS job_role,
  cd.name AS company_name,
  jpf.salary_year_avg AS yearly_salary
FROM
    job_postings_fact AS jpf
LEFT JOIN
  company_dim AS cd ON cd.company_id = jpf.company_id
WHERE
  jpf.salary_year_avg IS NOT NULL
  AND jpf.job_title_short = 'Data Analyst'
  AND jpf.job_work_from_home = TRUE
ORDER BY
  jpf.salary_year_avg DESC
LIMIT 10

/*
Here's the breakdown of the top data analyst jobs in 2023:
Wide Salary Range: Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
Diverse Employers: Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

RESULTS
=======
[
  {
    "job_role": "Data Analyst",
    "company_name": "Mantys",
    "yearly_salary": "650000.0"
  },
  {
    "job_role": "Director of Analytics",
    "company_name": "Meta",
    "yearly_salary": "336500.0"
  },
  {
    "job_role": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "yearly_salary": "255829.5"
  },
  {
    "job_role": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "yearly_salary": "232423.0"
  },
  {
    "job_role": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "yearly_salary": "217000.0"
  },
  {
    "job_role": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "yearly_salary": "205000.0"
  },
  {
    "job_role": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "yearly_salary": "189309.0"
  },
  {
    "job_role": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "yearly_salary": "189000.0"
  },
  {
    "job_role": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "yearly_salary": "186000.0"
  },
  {
    "job_role": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "yearly_salary": "184000.0"
  }
]
*/
