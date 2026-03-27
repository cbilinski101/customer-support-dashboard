-- Customer Support Dashboard Queries

-- 1. View all data
SELECT *
FROM support_data;


-- 2. Total number of tickets
SELECT COUNT(*) AS total_tickets
FROM support_data;


-- 3. Total open vs resolved tickets
SELECT
    status,
    COUNT(*) AS ticket_count
FROM support_data
GROUP BY status
ORDER BY ticket_count DESC;


-- 4. Tickets by priority
SELECT
    priority,
    COUNT(*) AS ticket_count
FROM support_data
GROUP BY priority
ORDER BY ticket_count DESC;


-- 5. Tickets by category
SELECT
    category,
    COUNT(*) AS ticket_count
FROM support_data
GROUP BY category
ORDER BY ticket_count DESC;


-- 6. Tickets handled by each agent
SELECT
    agent,
    COUNT(*) AS ticket_count
FROM support_data
GROUP BY agent
ORDER BY ticket_count DESC;


-- 7. Average response time by agent
SELECT
    agent,
    ROUND(AVG(response_time_minutes), 2) AS avg_response_time_minutes
FROM support_data
GROUP BY agent
ORDER BY avg_response_time_minutes ASC;


-- 8. Average resolution time for resolved tickets only
SELECT
    ROUND(AVG(resolution_time_minutes), 2) AS avg_resolution_time_minutes
FROM support_data
WHERE status = 'Resolved';


-- 9. Average resolution time by priority
SELECT
    priority,
    ROUND(AVG(resolution_time_minutes), 2) AS avg_resolution_time_minutes
FROM support_data
WHERE status = 'Resolved'
GROUP BY priority
ORDER BY avg_resolution_time_minutes ASC;


-- 10. Average customer satisfaction by agent
SELECT
    agent,
    ROUND(AVG(customer_satisfaction), 2) AS avg_customer_satisfaction
FROM support_data
WHERE customer_satisfaction > 0
GROUP BY agent
ORDER BY avg_customer_satisfaction DESC;


-- 11. Average customer satisfaction by category
SELECT
    category,
    ROUND(AVG(customer_satisfaction), 2) AS avg_customer_satisfaction
FROM support_data
WHERE customer_satisfaction > 0
GROUP BY category
ORDER BY avg_customer_satisfaction DESC;


-- 12. High-priority tickets
SELECT *
FROM support_data
WHERE priority = 'High';


-- 13. Open tickets only
SELECT *
FROM support_data
WHERE status = 'Open';


-- 14. Resolved tickets only
SELECT *
FROM support_data
WHERE status = 'Resolved';


-- 15. Fastest responding agent
SELECT
    agent,
    ROUND(AVG(response_time_minutes), 2) AS avg_response_time_minutes
FROM support_data
GROUP BY agent
ORDER BY avg_response_time_minutes ASC
LIMIT 1;


-- 16. Slowest resolving category
SELECT
    category,
    ROUND(AVG(resolution_time_minutes), 2) AS avg_resolution_time_minutes
FROM support_data
WHERE status = 'Resolved'
GROUP BY category
ORDER BY avg_resolution_time_minutes DESC
LIMIT 1;


-- 17. Daily ticket volume
SELECT
    created_date,
    COUNT(*) AS tickets_created
FROM support_data
GROUP BY created_date
ORDER BY created_date;


-- 18. Average satisfaction by priority
SELECT
    priority,
    ROUND(AVG(customer_satisfaction), 2) AS avg_customer_satisfaction
FROM support_data
WHERE customer_satisfaction > 0
GROUP BY priority
ORDER BY avg_customer_satisfaction DESC;