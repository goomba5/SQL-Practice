-- Example page 115
SELECT 	invoice_number AS "Invoice Number", 
				vendor_name AS "Vendor Name"
FROM ap.vendors INNER JOIN ap.invoices
ON vendors.vendor_id = invoices.vendor_id
ORDER BY invoice_number;

-- Example page 117
SELECT 	invoice_number AS "Invoice Number", 
				vendor_name AS "Vendor Name",
                invoice_due_date AS "Invoice Due Date",
                invoice_total - payment_total - credit_total AS "Balance Due"
FROM ap.vendors v INNER JOIN ap.invoices i
ON v.vendor_id = i.vendor_id
ORDER BY invoice_number;

-- Example page 119
-- How to Join Tables from Different DBs
SELECT 	vendor_name AS "Vendor Name",
				customer_last_name AS "Customer Last Name",
                customer_first_name AS "Customer First Name",
                vendor_state AS "State",
                vendor_city AS "City"
FROM ap.vendors v
			JOIN om.customers c
            ON v.vendor_zip_code = c.customer_zip
ORDER BY "State", "City";

-- Example page 121
-- Compound Join Statement
SELECT customer_first_name, customer_last_name
FROM om.customers c
			JOIN ex.employees e
            ON c.customer_first_name = e.first_name
			AND c.customer_last_name = e.last_name;
            
-- Example page 125
-- Joining More than Two Tables
SELECT 	vendor_name, invoice_number, invoice_date,
				line_item_amount, account_description
FROM ap.vendors v
			JOIN ap.invoices i
				ON v.vendor_id = i.vendor_id
			JOIN ap.invoice_line_items li
				ON i.invoice_id = li.invoice_id
			JOIN ap.general_ledger_accounts gl
				ON li.account_number = gl.account_number
WHERE invoice_total - payment_total - credit_total > 0
ORDER BY vendor_name, line_item_amount DESC;

-- WORKING WITH OUTER JOINS (STARTS AT PG. 128)

/*
The Left Join includes all of the rows from the FIRST table (departments),
whereas the Join clause only includes the rows where the
department table dept. number and the employee table dept. number MATCH.

With the Left Join, the employees table does not have a person in the Operations department,
so the last_name column displays a NULL value in the result grid.
*/
-- Example page 132
-- Using the Left Join clause
SELECT department_name, d.department_number, last_name
FROM ex.departments d
			LEFT JOIN ex.employees e
            ON d.department_number = e.department_number
ORDER BY department_name;

-- vs Join clause
SELECT department_name, d.department_number, last_name
FROM ex.departments d
			JOIN ex.employees e
            ON d.department_number = e.department_number
ORDER BY department_name;

/*
The Right Join includes all of the rows from the second table (employees).
For Watson and Locario, their department IDs in the employee table do not exist
in the departments table, so they appear as NULL values.
*/
-- Example page 132
-- Using the Right Join clause
SELECT department_name, d.department_number, last_name
FROM ex.departments d
			RIGHT JOIN ex.employees e
            ON d.department_number = e.department_number
ORDER BY department_name;
