--Получение статистики по зп
SELECT round(avg(salary_from), 2) AS avg_salary_from, round(avg(salary_to), 2) AS avg_salary_to, 
min(salary_from) AS min_salary_from, min(salary_to) AS min_salary_to, 
max(salary_from) AS max_salary_from, max(salary_to) AS max_salary_to
FROM public.parcing_table ;


--кол-во вакансий по регионам
SELECT area, count(name) counted
FROM public.parcing_table
GROUP BY  area
ORDER BY counted DESC;

--кол-во вакансий по компаниям
SELECT employer,
       COUNT(name) AS num_vacancies 
FROM public.parcing_table 
GROUP BY employer 
ORDER BY num_vacancies DESC;

--кол-во вакансий по типу занятости
SELECT employment, count(name) AS counted
FROM public.parcing_table
GROUP BY employment
ORDER BY counted desc



--кол-во вакансий по грейду
SELECT experience,
       COUNT(name) AS num_vacancies
FROM public.parcing_table 
GROUP BY experience 
ORDER BY num_vacancies DESC;


--Определение типичного места работы для аналитиков по различным параметрам
SELECT employer,
       COUNT(*) AS num_vacancies,
       ROUND(AVG(salary_from), 2) AS avg_salary_from,
       ROUND(AVG(salary_to), 2) AS avg_salary_to,
       employment,
       schedule
FROM public.parcing_table 
WHERE name LIKE '%Аналитик данных%' OR name LIKE '%аналитик данных%' OR name LIKE '%Системный аналитик%' OR name LIKE '%системный аналитик%'
GROUP BY employer, employment, schedule 
ORDER BY num_vacancies DESC;

--частота упоминания хард-скиллов
SELECT key_skills_1,
       COUNT(name) AS num_mention
FROM public.parcing_table 
GROUP BY key_skills_1 
ORDER BY num_mention DESC;

--частота упоминания софт-склиллов 
SELECT soft_skills_1,
count(name) AS num_mention
FROM public.parcing_table
GROUP BY soft_skills_1 
ORDER BY num_mention  desc


--доля вакансий по грейду
SELECT experience,
       COUNT(*) AS num_vacancies,
       ROUND(COUNT(*) * 100.0 / 1326, 2) AS percent_vacancies
FROM public.parcing_table
WHERE name LIKE '%Аналитик данных%' 
   OR name LIKE '%аналитик данных%'
   OR name LIKE '%Системный аналитик%'
   OR name LIKE '%системный аналитик%'
GROUP BY experience
ORDER BY percent_vacancies DESC;






