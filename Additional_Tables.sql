#Creating Company Table and adding ID column as PK#
CREATE TABLE Company AS
	SELECT DISTINCT(`Name of Covered Entity`)
    FROM market_research.breach_report;
    
ALTER TABLE market_research.company
ADD CompanyID INT PRIMARY KEY AUTO_INCREMENT NOT NULL;

#Changing placement of PK column#
ALTER TABLE `market_research`.`company` 
CHANGE COLUMN `CompanyID` `CompanyID` INT NOT NULL AUTO_INCREMENT FIRST;

#Inserting distinct records from breach_report#
INSERT IGNORE INTO market_research.company (`Name of Covered Entity`) 
SELECT DISTINCT Name_of_Covered_Entity FROM market_research.breach_report_archive;

ALTER TABLE market_research.company 
ADD UNIQUE (`Name of Covered Entity`);

INSERT IGNORE INTO market_research.company (`Name of Covered Entity`) 
SELECT DISTINCT Name_of_Covered_Entity 
FROM market_research.breach_report_archive
ON DUPLICATE KEY UPDATE `Name of Covered Entity` = `Name of Covered Entity`;

#Checking/Deleting Duplicates#
ALTER TABLE market_research.company 
ADD UNIQUE (`Name of Covered Entity`);

INSERT IGNORE INTO market_research.company (`Name of Covered Entity`) 
SELECT DISTINCT Name_of_Covered_Entity 
FROM market_research.breach_report_archive
ON DUPLICATE KEY UPDATE `Name of Covered Entity` = `Name of Covered Entity`;

SELECT `Name of Covered Entity`, COUNT(*) AS count
FROM market_research.company
GROUP BY `Name of Covered Entity`
HAVING COUNT(*) > 1;

#Foreign Key Constraint for Company Table for breach_report#
ALTER TABLE market_research.breach_report
ADD CompanyID INT;

ALTER TABLE market_research.breach_report
ADD CONSTRAINT fk_company FOREIGN KEY (CompanyID) REFERENCES company (CompanyID) ON DELETE RESTRICT ON UPDATE CASCADE;

#Foreign Key Constraint for Company Table for breach_report_archive#
ALTER TABLE market_research.breach_report_archive
ADD CompanyID INT;

ALTER TABLE market_research.breach_report_archive
ADD CONSTRAINT fk_company2 FOREIGN KEY (CompanyID) REFERENCES company (CompanyID) ON DELETE RESTRICT ON UPDATE CASCADE;

#Figuring How to Tie Foreign Keys to Primary#
UPDATE market_research.breach_report_archive
SET CompanyID = 1201
WHERE `Name of Covered Entity` = 'Zwanger-Pesiri Radiology';