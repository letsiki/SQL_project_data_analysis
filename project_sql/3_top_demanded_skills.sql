/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

WITH top_skills AS (
SELECT 
  sd.skills,
  jpf.job_id
FROM skills_job_dim AS sjd
INNER JOIN job_postings_fact AS jpf ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
)
SELECT
  top_skills.skills AS skill,
  COUNT(top_skills.job_id) AS times_requested
FROM top_skills
GROUP BY 
  skill
ORDER BY
  times_requested DESC
LIMIT 5



/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skill": "sql",
    "times_requested": "92628"
  },
  {
    "skill": "excel",
    "times_requested": "67031"
  },
  {
    "skill": "python",
    "times_requested": "57326"
  },
  {
    "skill": "tableau",
    "times_requested": "46554"
  },
  {
    "skill": "power bi",
    "times_requested": "39468"
  }
]
*/