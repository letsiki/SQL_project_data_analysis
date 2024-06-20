/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

WITH skill_job_salary AS (
SELECT 
  sd.skills,
  jpf.job_id,
  jpf.salary_year_avg
FROM skills_job_dim AS sjd
INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
)
SELECT
  skill_job_salary.skills AS skill,
  ROUND(AVG(skill_job_salary.salary_year_avg), 0) AS average_salary
FROM skill_job_salary
WHERE skill_job_salary.salary_year_avg IS NOT NULL
GROUP BY 
  skill
HAVING
  COUNT(1) > 100
ORDER BY
  average_salary DESC


/*
[
  {
    "skill": "spark",
    "average_salary": "113002"
  },
  {
    "skill": "databricks",
    "average_salary": "112881"
  },
  {
    "skill": "snowflake",
    "average_salary": "111578"
  },
  {
    "skill": "hadoop",
    "average_salary": "110888"
  },
  {
    "skill": "nosql",
    "average_salary": "108331"
  },
  {
    "skill": "jira",
    "average_salary": "107931"
  },
  {
    "skill": "aws",
    "average_salary": "106440"
  },
  {
    "skill": "alteryx",
    "average_salary": "105580"
  },
  {
    "skill": "azure",
    "average_salary": "105400"
  },
  {
    "skill": "looker",
    "average_salary": "103855"
  },
  {
    "skill": "python",
    "average_salary": "101512"
  },
  {
    "skill": "oracle",
    "average_salary": "100964"
  },
  {
    "skill": "java",
    "average_salary": "100214"
  },
  {
    "skill": "r",
    "average_salary": "98708"
  },
  {
    "skill": "flow",
    "average_salary": "98020"
  },
  {
    "skill": "tableau",
    "average_salary": "97978"
  },
  {
    "skill": "go",
    "average_salary": "97267"
  },
  {
    "skill": "ssis",
    "average_salary": "97235"
  },
  {
    "skill": "sql",
    "average_salary": "96435"
  },
  {
    "skill": "sql server",
    "average_salary": "96191"
  },
  {
    "skill": "vba",
    "average_salary": "93845"
  },
  {
    "skill": "sas",
    "average_salary": "93707"
  },
  {
    "skill": "sap",
    "average_salary": "92446"
  },
  {
    "skill": "power bi",
    "average_salary": "92324"
  },
  {
    "skill": "javascript",
    "average_salary": "91805"
  },
  {
    "skill": "ssrs",
    "average_salary": "91537"
  },
  {
    "skill": "sharepoint",
    "average_salary": "89027"
  },
  {
    "skill": "powerpoint",
    "average_salary": "88316"
  },
  {
    "skill": "excel",
    "average_salary": "86419"
  },
  {
    "skill": "spss",
    "average_salary": "85293"
  },
  {
    "skill": "sheets",
    "average_salary": "84130"
  },
  {
    "skill": "word",
    "average_salary": "82941"
  },
  {
    "skill": "outlook",
    "average_salary": "80680"
  }
]
*/