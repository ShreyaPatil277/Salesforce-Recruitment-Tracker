# Recruitment Tracker (Salesforce)

A recruitment management app built on the Salesforce Platform (Developer Edition)
to track job positions and candidate applications.

## Features
- **Data model:** Position and Application custom objects linked by Master-Detail,
  with a roll-up summary (Total Applications) on Position
- **Lightning App:** custom "Recruitment" app with tabs for Positions and Applications
- **Validation rule:** prevents negative experience values
- **Security:** OWD Private on Position, role hierarchy (Hiring Manager > Recruiter),
  permission set, and criteria-based sharing rule
- **Flow:** record-triggered flow sends an email when an application is marked Hired
- **Apex:** bulkified before-insert trigger blocks duplicate applications
  (same candidate email + position), with a test class
- **Reports & Dashboard:** Applications by Status

## Data Model
Position (1) ──< Application (Master-Detail)

| Object | Key fields |
|---|---|
| Position__c | Department, Status, Number of Openings, Closing Date |
| Application__c | Position (Master-Detail), Candidate Name, Candidate Email, Experience, Status, Application Date |

## Screenshots
![Schema](screenshots/schema-builder.png)
![Dashboard](screenshots/dashboard.png)

## Tech
Salesforce Developer Edition, Apex, Flow, Lightning App Builder, Reports & Dashboards

## What I learned
Master-Detail vs Lookup, record-level security, bulkification and governor limits,
writing Apex test classes.
