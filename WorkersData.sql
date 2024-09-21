SELECT * FROM [workers data]

-- What is the average age of the educational status
SELECT TOP(3) education, AVG(age) AS average_age FROM [workers data]
GROUP BY education
ORDER BY average_age DESC

-- Group each of the races by count 
SELECT race, COUNT(race) AS race_count FROM [workers data]
GROUP BY race
ORDER BY race_count DESC

-- Is it true that the Black race has the highest capital loss? If not, Find out who does
SELECT race, SUM(capital_loss) AS total_capital_loss FROM [workers data]
GROUP BY race
ORDER BY total_capital_loss DESC


-- NeoColonialism is known if Blacks works less hours than whites. Show if there is neocolonialism.
SELECT race, SUM(hours_per_week) AS total_hours_per_week FROM [workers data]
GROUP BY race
ORDER BY total_hours_per_week DESC

-- Show what gender work the most hours amongst the Black 
SELECT gender, SUM(hours_per_week) AS total_hours_per_week FROM [workers data]
WHERE race = 'Black'
GROUP BY gender
ORDER BY total_hours_per_week DESC

-- Show what occupation works the most hours among the whites 
SELECT TOP(3) occupation, SUM(hours_per_week) AS total_hours_per_week FROM [workers data]
WHERE race = 'White'
GROUP BY occupation
ORDER BY total_hours_per_week DESC

-- In the US, does the white work more than the Blacks ? Show with a table 
SELECT race, SUM(hours_per_week) AS total_hours_per_week FROM [workers data]
WHERE native_country = 'United-States' 
GROUP BY race
ORDER BY total_hours_per_week DESC

-- In Japan, does females earn more capital gains than males ?
SELECT gender, SUM(capital_gain) AS total_capital_gain FROM [workers data]
WHERE native_country = 'Japan'
GROUP BY gender
ORDER BY total_capital_gain DESC

-- The Income is distributed as Above 50k = 1, and BELOW 50k = 0. Find out what country has most of its female citizen earning above 50k
SELECT TOP(3) native_country, COUNT(income_50K) AS total_income FROM [workers data]
WHERE gender = 'Female' AND income_50K = 1
GROUP BY native_country
ORDER BY total_income DESC

-- In the US, what marital_status type earns the most capital gain ?
SELECT TOP(3) marital_status, SUM(capital_gain) AS total_capital_gain FROM [workers data]
WHERE native_country = 'United-States'
GROUP BY marital_status 
ORDER BY total_capital_gain DESC

-- In Japan, what Occupation type earns the most capital gain ?
SELECT TOP(3) occupation, SUM(capital_gain) AS total_capital_gain FROM [workers data]
WHERE native_country = 'Japan'
GROUP BY occupation
ORDER BY total_capital_gain DESC