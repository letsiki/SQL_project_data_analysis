/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_ten_paying AS (
  SELECT *
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
)
SELECT DISTINCT sd.skills
FROM skills_job_dim AS sjd
INNER JOIN top_ten_paying AS ttp ON ttp.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id




/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

[
  {
    "skills": "atlassian"
  },
  {
    "skills": "aws"
  },
  {
    "skills": "azure"
  },
  {
    "skills": "bitbucket"
  },
  {
    "skills": "confluence"
  },
  {
    "skills": "crystal"
  },
  {
    "skills": "databricks"
  },
  {
    "skills": "excel"
  },
  {
    "skills": "flow"
  },
  {
    "skills": "git"
  },
  {
    "skills": "gitlab"
  },
  {
    "skills": "go"
  },
  {
    "skills": "hadoop"
  },
  {
    "skills": "jenkins"
  },
  {
    "skills": "jira"
  },
  {
    "skills": "jupyter"
  },
  {
    "skills": "numpy"
  },
  {
    "skills": "oracle"
  },
  {
    "skills": "pandas"
  },
  {
    "skills": "power bi"
  },
  {
    "skills": "powerpoint"
  },
  {
    "skills": "pyspark"
  },
  {
    "skills": "python"
  },
  {
    "skills": "r"
  },
  {
    "skills": "sap"
  },
  {
    "skills": "snowflake"
  },
  {
    "skills": "sql"
  },
  {
    "skills": "tableau"
  }
]
*/

