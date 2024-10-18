/*ARCHIVED DATA SIFTING*/
#This query is looking to see how frequent breaches are per state in descending order of archived breaches.#
SELECT State, COUNT(State) AS '# of Incidents' FROM market_research.breach_report_archive
GROUP BY State
ORDER BY `# of Incidents` DESC;

#This query looks to group company breaches, number of breaches, and location of breaches within archived information.#
SELECT `Name of Covered Entity` AS 'Company Name', COUNT(Type_of_Breach) AS 'Number of Breaches', Location_of_Breached_Information AS 'Breach Location' FROM market_research.breach_report_archive
GROUP BY `Name of Covered Entity`, Location_of_Breached_Information
ORDER BY `Number of Breaches` DESC, `Breach Location`;

#Query showing each breach type (and combined ones) and the sum of corresponding affected individuals descending#
SELECT Type_of_Breach, SUM(Individuals_Affected) AS 'Affected Individuals' FROM market_research.breach_report_archive
GROUP BY Type_of_Breach
ORDER BY `Affected Individuals` DESC;

#Amount of breaches overall from 2009-2024#
SELECT `Name of Covered Entity`, COUNT(*) AS breach_count
FROM market_research.breach_report_archive
GROUP BY `Name of Covered Entity`
HAVING COUNT(*) >= 2;

#Obtain count of total amount of affected individuals over course of data#
SELECT SUM(Individuals_Affected) AS 'Total Affected Users' FROM market_research.breach_report_archive;

#Count of most common information leak.#
SELECT `Location_of_Breached_Information`, COUNT(`Location_of_Breached_Information`) AS 'Breach Location' FROM market_research.breach_report_archive
GROUP BY `Location_of_Breached_Information`;

/*Current Breach Reports*/
#Query pulls Company name, breach type from current events categorized by 1st quarter#
SELECT `Name of Covered Entity`, `Type of Breach`, `Breach Submission Date` FROM market_research.breach_report
WHERE `Breach Submission Date` BETWEEN '2024-01-01' AND '2024-03-31'
ORDER BY `Type of Breach`;

#Number of Individuals Affected v. Type of Breach#
SELECT `State`, `Individuals Affected` AS 'Affected Individuals', `Location of Breached Information` AS 'Breach Location' FROM market_research.breach_report
GROUP BY `State`;

#Searching for top 50 companies with the highest # of individuals affected#
SELECT `Name of Covered Entity`, `Individuals Affected`, `Type of Breach`, `Location of Breached Information` FROM market_research.breach_report
ORDER BY `Individuals Affected` DESC
LIMIT 50;

#Obtain count of total amount of affected individuals over course of data#
SELECT SUM(`Individuals Affected`) AS 'Total Affected Users' FROM market_research.breach_report;

#Per state, number of recorded incidents over course of data#
SELECT State, COUNT(State) AS '# of Incidents' FROM market_research.breach_report
GROUP BY State
ORDER BY `# of Incidents` DESC;

#Number of Entity Type Breaches (Type of Provider)#
SELECT `Covered Entity Type`, COUNT(`Covered Entity Type`) AS 'Total Entities' FROM market_research.breach_report
GROUP BY `Covered Entity Type`;

#Count of most common information leak#
SELECT `Location of Breached Information`, COUNT(`Location of Breached Information`) AS 'Breach Location' FROM market_research.breach_report
GROUP BY `Location of Breached Information`;