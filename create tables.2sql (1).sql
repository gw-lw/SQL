# principal investigator table 1

CREATE TABLE PRINCIPALINVESTIGATOR (
PPID int NOT NULL,
Institution CHAR(20) NOT NULL,
ScienceType CHAR(20) NOT NULL,
FirtsName CHAR(20) NOT NULL,
LastName CHAR(20) NOT NULL,
Education CHAR(20) NOT NULL,
TaxID CHAR(20) NOT NULL,
CONSTRAINT PI_PK PRIMARY KEY(PPID));

# Institution table 2 

CREATE TABLE INSTITUTION (
TaxID CHAR(20) NOT NULL,
InstitutionName CHAR(100) NOT NULL,
ContactPerson CHAR(100) NOT NULL,
ZipCode int(10) NOT NULL,
StreetAddress CHAR(100) not NULL,
CongressionalDistrict int not NULL,
CONSTRAINT institution_pk PRIMARY KEY(TaxID));
 
# Institution_contactPhone 3

CREATE TABLE InstitutionPhone (
ContactPhone CHAR(20) NOT NULL,
TaxID CHAR(20) NOT NULL,
CONSTRAINT InstitutionPhone_pk PRIMARY KEY(TaxID, ContactPhone));

# Corporation table 4

CREATE TABLE corporation (
CorporationID CHAR(100) NOT NULL,
CEO CHAR(20) NOT NULL,
NoofEmployee int NULL,
AnnualRevenue int NOT NULL,
TaxID CHAR(20) NOT NULL,
CONSTRAINT corporation_pk PRIMARY KEY(CorporationID));

# Education Institution table 5

CREATE TABLE EducationInst (
EducationInstID CHAR(100) NOT NULL,
President CHAR(20) NOT NULL,
NoofStudent int not NULL,
Endowment int NOT NULL,
TaxID CHAR(20) NOT NULL,
CONSTRAINT corporation_pk PRIMARY KEY(EducationInstID));


/*INSERT INTO institution VALUES
# ('PSI2563', 'Human Entertainment and more', 'bill', '20165', '3  yolo drive','465');


select * from institution;
*/

# Award table 6 

CREATE TABLE AWARD (
AwardID CHAR(20) NOT NULL,
AwardTitle CHAR(100) NOT NULL,
AwardAmount int NOT NULL DEFAULT 0,
AwardStartDate date NOT NULL,
AwardEndDate date NULL,
TaxID CHAR(20) NOT NULL,
DepID CHAR(20) NOT NULL,
CONSTRAINT AWARD_PK PRIMARY KEY(AwardID));




/* INSERT INTO AWARD VALUES
('PSI2563', 'Human Entertainment and more', '230000', '2017-01-01', '2090-02-22');

select *, datediff(AwardEndDate, AwardStartDate) / 365 as ageofAwardInYears
    from award;
*/
# Department table 7

CREATE TABLE Department (
DepID CHAR(20) NOT NULL,
ScienceSection CHAR(100) NOT NULL,
ApprovingOfficial CHAR(100) NOT NULL,
BranchChief CHAR(20) NOT NULL,
NFSDepApproval CHAR(100) NOT NULL,
CONSTRAINT Department_PK PRIMARY KEY(DepID));

# Department_Phone table 8

CREATE TABLE Department_Phone (
DepPhone CHAR(20) NOT NULL,
DepID CHAR(20) NOT NULL,
CONSTRAINT Department_Phone_PK PRIMARY KEY(DepPhone, DepID));

# FinancialReview table 9 

CREATE TABLE FinancialReview (
ReviewID CHAR(20) NOT NULL,
ReviewType CHAR(20) NOT NULL,
ReviewStartDate date NOT NULL,
ReviewEndDate date NOT NULL,
DepID CHAR(20) NOT NULL,
CONSTRAINT FinancialReview_PK PRIMARY KEY(ReviewID));

# Financial_Analyst table 10
CREATE TABLE Financial_Analyst (
ReviewID CHAR(20) NOT NULL,
AnalystID CHAR(20) NOT NULL,
CONSTRAINT FinancialReview_PK PRIMARY KEY(ReviewID, AnalystID ));

# Analyst table 11

CREATE TABLE Analyst (
AnalystID CHAR(20) NOT NULL,
AnalystFirstName CHAR(20) NOT NULL,
AnalystLastName CHAR(20) NOT NULL,
CONSTRAINT Analyst_PK PRIMARY KEY(AnalystID));

# AnalystPhone table 12

CREATE TABLE AnalystPhone (
AnalystPhone CHAR(20) NOT NULL,
AnalystID CHAR(20) NOT NULL,
CONSTRAINT AnalystPhone_PK PRIMARY KEY(AnalystPhone, AnalystID));

# Constraints Foreign key PRINCIPALINVESTIGATOR
ALTER TABLE PRINCIPALINVESTIGATOR
add constraint PRINCIPALINVESTIGATOR_INSTITUTION FOREIGN KEY(TaxID) REFERENCES INSTITUTION(TaxID);

# Constraints Foreign key PRINCIPALINVESTIGATOR

ALTER TABLE InstitutionPhone
add CONSTRAINT InstitutionPhone_INSTITUTION FOREIGN KEY(TaxID) REFERENCES INSTITUTION(TaxID);

# Constraints Foreign key corporation

ALTER TABLE corporation
add CONSTRAINT corporation_INSTITUTION FOREIGN KEY(TaxID) REFERENCES INSTITUTION(TaxID);

# Constraints Foreign key EducationInst

ALTER TABLE EducationInst
add CONSTRAINT EducationInst_INSTITUTION FOREIGN KEY(TaxID) REFERENCES INSTITUTION(TaxID);

# Constraints Foreign key AWARD

ALTER TABLE AWARD
add CONSTRAINT AWARD_INSTITUTION FOREIGN KEY(TaxID) REFERENCES INSTITUTION(TaxID),
add CONSTRAINT AWARD_Department FOREIGN KEY(DepID) REFERENCES Department(DepID);

# Constraints Foreign key Department_Phone

ALTER TABLE Department_Phone
add CONSTRAINT Department_Phone_Department FOREIGN KEY(DepID) REFERENCES Department(DepID);

# Constraints Foreign key FinancialReview

ALTER TABLE FinancialReview
add CONSTRAINT FinancialReview_Department FOREIGN KEY(DepID) REFERENCES Department(DepID);


# Constraints Foreign key Financial_Analyst

ALTER TABLE Financial_Analyst
add CONSTRAINT Financial_Analyst_FinancialReview FOREIGN KEY(ReviewID) REFERENCES FinancialReview(ReviewID),
add CONSTRAINT Financial_Analyst_Analyst FOREIGN KEY(AnalystID) REFERENCES Analyst(AnalystID);

# Constraints Foreign key AnalystPhone

ALTER TABLE AnalystPhone
add CONSTRAINT AnalystPhone_Analyst FOREIGN KEY(AnalystID) REFERENCES Analyst(AnalystID);




