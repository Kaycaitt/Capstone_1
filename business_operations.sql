# CREATE DATABASE business_operations;
# #Creation Complete#

CREATE TABLE Services
(	SupportID INT PRIMARY KEY AUTO_INCREMENT,
	Technical_Support VARCHAR (50) NOT NULL,
    Consultant_Support VARCHAR (50) NOT NULL,
    Sales_Support VARCHAR (50) NOT NULL
	);
    
    
CREATE TABLE Employee_Information
(	EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
	First_Name VARCHAR(30) NOT NULL,
    Last_Name VARCHAR(30) NOT NULL,
    Email_Address VARCHAR(40) NOT NULL,
    Phone_Number VARCHAR(10) NOT NULL,
    Hire_Date DATE NOT NULL,
    Department VARCHAR(20) NOT NULL,
    Job_Title VARCHAR(55) NOT NULL,
	Username VARCHAR(31) NOT NULL
    );
    
CREATE TABLE Transactions
(	TransactionID INT PRIMARY KEY AUTO_INCREMENT,
	Employee_Salary DECIMAL(8,2) NOT NULL,
	Cyber_Insurance DECIMAL(7,2) NOT NULL,
    Vendor_Transactions DECIMAL(9,2) NOT NULL,
    Customer_Transactions DECIMAL(10,2) NOT NULL,
    Technology_Costs DECIMAL(10,2) NOT NULL,
    Operational_Costs DECIMAL(11,2) NOT NULL,
    Service_Costs DECIMAL(8,2) NULL
    );
    
CREATE TABLE Customer_Information
(	CompanyID INT PRIMARY KEY AUTO_INCREMENT,
	Company_Name VARCHAR(150) NOT NULL,
	Company_Address VARCHAR(100) NOT NULL,
    Covered_Entity_Type VARCHAR(30) NOT NULL,
    State VARCHAR(2) NOT NULL,
    Company_Contact VARCHAR(80) NOT NULL,
    Phone_Number VARCHAR(16) NOT NULL,
    Last_Breach DATE NOT NULL,
    Services BOOLEAN NULL,
    Notes VARCHAR(500) NULL,
    SupportID INT,
    CONSTRAINT fk_support FOREIGN KEY (SupportID) REFERENCES Services (SupportID) ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
    

/*Query to create some fake rows*/
INSERT INTO employee_information (first_name,last_name,email_address,phone_number,hire_date,department,job_title,username)
VALUES ('John','Smith','john.smith@example.com','555-0123','2020-01-15','Sales','Sales Manager','johnsmith2020'),
('Sarah', 'Johnson', 'sarah.johnson@example.com', '555-0456', '2019-03-22', 'Marketing', 'Marketing Specialist', 'sjohnson19'),
('Emily', 'Davis', 'emily.davis@example.com', '555-0789', '2021-06-30', 'HR', 'HR Coordinator', 'edavis21'),
('Michael', 'Brown', 'michael.brown@example.com', '555-1112', '2022-11-05', 'IT', 'Software Engineer', 'mbrown22'),
('Jessica', 'Wilson', 'jessica.wilson@example.com', '555-1314', '2018-08-19', 'Finance', 'Financial Analyst', 'jwilson18'),
('David', 'Taylor', 'david.taylor@example.com', '555-1516', '2023-02-12', 'Operations', 'Operations Manager', 'dtaylor23'),
('Amanda', 'Martinez', 'amanda.martinez@example.com', '555-1718', '2020-09-23', 'Customer Service', 'Customer Support Rep', 'amartinez20'),
('Chris', 'Anderson', 'chris.anderson@example.com', '555-1920', '2021-04-14', 'Legal', 'Legal Advisor', 'canderson21'),
('Angela', 'Thomas', 'angela.thomas@example.com', '555-2122', '2019-12-01', 'Research', 'Research Scientist', 'athomas19'),
('Brian', 'Jackson', 'brian.jackson@example.com', '555-2324', '2022-07-17', 'Marketing', 'Brand Manager', 'bjackson22'),
('Laura', 'White', 'laura.white@example.com', '555-2526', '2018-05-30', 'Sales', 'Account Executive', 'lwhite18'),
('Kevin', 'Harris', 'kevin.harris@example.com', '555-2728', '2020-10-11', 'IT', 'Network Administrator', 'kharris20'),
('Megan', 'Clark', 'megan.clark@example.com', '555-2930', '2023-01-21', 'Finance', 'Accountant', 'mclark23'),
('Robert', 'Lewis', 'robert.lewis@example.com', '555-3132', '2019-07-26', 'Operations', 'Logistics Manager', 'rlewis19'),
('Jessica', 'Hall', 'jessica.hall@example.com', '555-3334', '2022-03-29', 'HR', 'Recruiter', 'jhall22'),
('Steven', 'Allen', 'steven.allen@example.com', '555-3536', '2021-05-15', 'Customer Service', 'Service Manager', 'sallen21'),
('Sophia', 'Young', 'sophia.young@example.com', '555-3738', '2020-12-09', 'Research', 'Data Analyst', 'syoung20'),
('Jacob', 'King', 'jacob.king@example.com', '555-3930', '2023-08-24', 'IT', 'System Analyst', 'jking23'),
('Olivia', 'Wright', 'olivia.wright@example.com', '555-4142', '2018-06-18', 'Sales', 'Sales Associate', 'owright18'),
('Daniel', 'Scott', 'daniel.scott@example.com', '555-4344', '2021-09-10', 'Marketing', 'Content Strategist', 'dscott21');

INSERT INTO customer_information (Company_Name,Company_Address,Covered_Entity_Type,State,Company_Contact,Phone_Number,Last_Breach,Services,Notes)
VALUES ('HealthFirst Medical Center', '123 Health St, Cityville', 'Healthcare Providers', 'NY', 'Dr. John Smith', '555-0011', '2023-03-15', 'Emergency, Surgery', 'Community-focused care'),
('CarePlus Clinic', '456 Wellness Ave, Townsville', 'Health Plans', 'CA', 'Jane Doe', '555-0022', '2022-10-05', 'Primary Care', 'Offers telehealth services'),
('City Hospital', '789 City Rd, Metropolis', 'Healthcare Providers', 'TX', 'Dr. Emily Johnson', '555-0033', '2023-05-20', 'Emergency, Outpatient', '24/7 emergency services'),
('MediCare Group', '321 Health Blvd, Uptown', 'Healthcare Clearinghouse', 'FL', 'Dr. Robert Brown', '555-0044', '2023-01-12', 'General Practice', 'Multispecialty group'),
('Hope Wellness Clinic', '654 Care Dr, Suburbia', 'Healthcare Providers', 'IL', 'Sarah Wilson', '555-0055', '2023-07-30', 'Mental Health Services', 'Focus on holistic healing'),
('Family Health Center', '987 Family Ln, Oldtown', 'Health Plans', 'NY', 'Dr. Mike Lee', '555-0066', '2022-12-15', 'Family Medicine', 'Sliding scale for payments'),
('WellSpring Hospital', '213 Wellness Way, Rivertown', 'Healthcare Providers', 'NV', 'Dr. Anna Green', '555-0077', '2023-08-21', 'Rehabilitation', 'Specializes in recovery'),
('Bright Future Clinic', '876 Sunshine Blvd, Dreamland', 'Healthcare Clearinghouse', 'OR', 'Dr. Laura White', '555-0088', '2023-02-11', 'Pediatric Care', 'Family-oriented environment'),
('Unity Health System', '543 Harmony Rd, Peaceville', 'Health Plans', 'WA', 'Dr. James Black', '555-0099', '2022-09-14', 'Multi-Specialty Services', 'Community outreach programs'),
('Compassionate Care Center', '321 Compassion Ct, Kindtown', 'Healthcare Providers', 'AZ', 'Dr. Olivia Young', '555-0100', '2023-06-04', 'Hospice and Palliative Care', 'Focus on end-of-life care'),
('Horizon Medical Institute', '654 Horizon Dr, Skylark', 'Healthcare Providers', 'CO', 'Dr. Daniel Harris', '555-0111', '2023-01-25', 'Surgical Services', 'State-of-the-art facilities'),
('Lifeline Medical Center', '432 Lifeline Rd, Healthyburg', 'Healthcare Clearinghouse', 'TX', 'Dr. Maria Gonzalez', '555-0122', '2022-11-19', 'Emergency, Cardiology', 'Leading in heart health'),
('Pinnacle Health Group', '876 Pinnacle Ave, Peaksville', 'Health Plans', 'GA', 'Dr. Chris Adams', '555-0133', '2023-04-10', 'Specialty Care', 'Integrative medicine focus'),
('Safe Harbor Clinic', '245 Safe St, Harbortown', 'Healthcare Providers', 'ME', 'Dr. Nancy Brown', '555-0144', '2022-08-29', 'Urgent Care', 'Open on weekends'),
('Beacon Health Services', '678 Beacon Blvd, Lightcity', 'Healthcare Clearinghouse', 'MA', 'Dr. Kevin Clark', '555-0155', '2023-03-02', 'Preventive Care', 'Focus on wellness'),
('New Horizons Hospital', '912 Horizon Ct, Futureland', 'Healthcare Providers', 'IL', 'Dr. Samantha King', '555-0166', '2023-05-11', 'Neurosurgery', 'Cutting-edge treatment'),
('Wellness Works Clinic', '321 Well Rd, Fitville', 'Health Plans', 'MI', 'Dr. Jessica Blue', '555-0177', '2023-09-01', 'Nutrition and Wellness', 'Classes on healthy living'),
('Healing Hands Hospital', '789 Healing Way, Caretown', 'Healthcare Providers', 'NV', 'Dr. Eric White', '555-0188', '2022-10-25', 'Emergency, Maternity', 'Family-centered maternity care'),
('Sunshine Family Health', '147 Sunshine Rd, Brightville', 'Healthcare Clearinghouse', 'NY', 'Dr. Lisa Green', '555-0199', '2023-04-30', 'Family Medicine', 'Offers weekend hours'),
('Complete Care Clinic', '963 Complete St, Totality', 'Health Plans', 'OH', 'Dr. Mark Brown', '555-0200', '2023-02-08', 'Comprehensive Care', 'Focus on preventive medicine');

INSERT INTO Transactions (Employee_Salary,Cyber_Insurance,Vendor_Transactions,Customer_Transactions,Technology_Costs,Operational_Costs,Service_Costs)
VALUES (3000000, 75000, 600000, 1250000, 400000, 750000, 250000),
(3750000, 100000, 900000, 1500000, 600000, 1000000, 350000),
(2500000, 50000, 450000, 1100000, 350000, 600000, 200000),
(4500000, 125000, 1100000, 1750000, 750000, 1250000, 500000),
(2750000, 60000, 550000, 1050000, 300000, 650000, 150000),
(4000000, 90000, 800000, 1400000, 550000, 900000, 300000),
(3500000, 85000, 700000, 1300000, 500000, 850000, 250000),
(3400000, 80000, 625000, 1200000, 475000, 700000, 225000),
(4250000, 120000, 1050000, 1650000, 650000, 1100000, 450000),
(4750000, 150000, 1250000, 1850000, 900000, 1500000, 600000),
(3100000, 70000, 575000, 1150000, 375000, 700000, 200000),
(3850000, 95000, 850000, 1450000, 525000, 950000, 325000),
(2650000, 55000, 425000, 1025000, 325000, 575000, 175000),
(4600000, 130000, 1150000, 1800000, 700000, 1250000, 475000),
(2900000, 65000, 500000, 1080000, 350000, 600000, 225000),
(4200000, 110000, 1000000, 1550000, 600000, 1000000, 400000),
(3600000, 85000, 675000, 1250000, 450000, 800000, 250000),
(3400000, 80000, 600000, 1200000, 400000, 750000, 225000),
(4650000, 135000, 1150000, 1900000, 700000, 1300000, 500000),
(3000000, 75000, 600000, 1250000, 400000, 750000, 250000),
(3750000, 100000, 900000, 1500000, 600000, 1000000, 350000);

INSERT INTO Services (Technical_Support,Consultant_Support,Sales_Support)
VALUES ('24/7 monitoring and incident response', 'Monthly security posture assessments', 'Tailored cybersecurity solutions for clients'),
('Email and phone support with SLA under 1 hour', 'Annual compliance audits and consultations', 'Lead generation through security awareness webinars'),
('Real-time threat intelligence updates', 'Custom risk management frameworks', 'Client-specific cybersecurity training sessions'),
('On-site support for critical breaches', 'Expert guidance on threat mitigation strategies', 'Collaborative marketing for new security services'),
('Access to a self-service portal with security resources', 'One-on-one consulting for incident response planning', 'Promotions on bundled security packages for businesses'),
('Remote support with secure connection tools', 'Vendor risk assessments and recommendations', 'Sales enablement tools for better customer engagement'),
('Comprehensive technical documentation and best practices', 'Regular updates on industry standards and compliance', 'Customer success stories to showcase our impact'),
('Dedicated security account manager for client relations', 'Security awareness training for employees', 'Sales presentations highlighting ROI of cybersecurity investments'),
('Ticketing system for tracking vulnerabilities', 'Process optimization for incident response', 'Referral program for client introductions to new businesses'),
('Scheduled threat landscape reviews and follow-ups', 'Strategic advice for security architecture', 'Incentives for long-term contracts and renewals');