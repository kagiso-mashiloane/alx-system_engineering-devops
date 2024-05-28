Postmortem: Payment Processing Service Outage

Issue Summary:

Duration: May 20, 2024, from 14:00 to 16:30 GMT
Impact: The payment processing service was down, causing all transactions to fail. Users experienced errors when attempting to make purchases. Approximately 75% of the user base was affected.
Root Cause: A misconfigured database failover mechanism caused a cascade failure in the transaction processing service.
Timeline:

14:00 GMT: Issue detected by an automated monitoring alert indicating a spike in transaction failures.
14:05 GMT: Initial investigation by the on-call engineer; suspected temporary network glitch.
14:15 GMT: Confirmed that the issue was not network-related; escalated to the database team.
14:30 GMT: Database team identified a possible issue with the failover configuration but were unable to pinpoint the exact cause.
15:00 GMT: Misleading path: Investigated potential DDoS attack, which was ruled out after checking firewall logs and traffic patterns.
15:30 GMT: Rediscovered failover configuration errors; senior database engineer brought in for a deeper investigation.
16:00 GMT: Root cause identified as a misconfigured failover setting in the primary database.
16:15 GMT: Applied configuration fix and began verifying system stability.
16:30 GMT: Service fully restored; transaction success rate back to normal.
Root Cause and Resolution:

Root Cause: The primary database's failover mechanism was misconfigured during a recent update, causing the system to fail when the primary database experienced a minor, recoverable error. This misconfiguration led to repeated failover attempts that overwhelmed the system and blocked transaction processing.
Resolution: The configuration error was corrected by updating the failover settings to ensure that only critical errors would trigger a failover. The team conducted a thorough review of the failover logic and tested the corrected configuration under simulated load conditions to confirm stability.
Corrective and Preventative Measures:

Improvements:

Configuration Management: Enhance the configuration management process to include more rigorous testing of failover settings during updates.
Monitoring and Alerts: Improve monitoring to detect misconfigurations in real-time, focusing on failover events and database health metrics.
Documentation and Training: Update documentation to reflect the correct failover configurations and provide training for engineers on the importance of these settings.
Tasks:

Patch Database Failover Configuration:
Review and apply the correct failover settings across all environments (Dev, Test, Production).
Enhanced Monitoring:
Implement monitoring for failover events and database health metrics.
Set up alerts for unusual failover activity.
Update Documentation:
Revise the failover configuration documentation to include detailed setup and verification steps.
Engineer Training:
Conduct a training session for all engineers on the updated failover mechanisms and the critical nature of correct configurations.
Simulated Failover Drills:
Schedule regular drills to simulate database failover scenarios and ensure all engineers are familiar with the recovery procedures.
By implementing these measures, we aim to prevent similar incidents in the future and improve the overall reliability of our payment processing service.
