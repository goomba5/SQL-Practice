
-- SELECT ALL FROM INVOICES TABLE
SELECT * FROM ap.invoices;

-- SELECT specific columns from the invoices table,
-- ORDER BY the invoice total in descending order
SELECT invoice_number, invoice_date, invoice_total
FROM ap.invoices
ORDER BY invoice_total DESC;

-- SELECT columns using numeral operators, assign value using alias
-- Display results WHERE invoice ID is equal to record 17
SELECT invoice_id, invoice_total,
       credit_total + payment_total AS total_credits
FROM ap.invoices
WHERE invoice_id = 17;
 
 -- SELECT columnsn from invoices
 -- WHERE invoice date is between specific dates
SELECT invoice_number, invoice_date, invoice_total
FROM ap.invoices
WHERE invoice_date BETWEEN '2014-06-01' AND '2014-06-30'
ORDER BY invoice_date DESC;
 
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_total > 50000;

-- Ex. ch3.6
-- SELECT vendor name, vendor contact last name, vendor contact first name
-- FROM vendors table, then run the query
SELECT vendor_name, CONCAT(vendor_contact_first_name, ' ', vendor_contact_last_name) AS "vendor contact"
FROM ap.vendors
ORDER BY vendor_contact_last_name;

-- Ex. ch3.7
-- SELECT vendor contacts by last name, first name
-- WHERE the contact's last name starts with a, b, c, or e
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS "vendor contact"
FROM ap.vendors
WHERE vendor_contact_last_name REGEXP '^[ABCE]'
ORDER BY vendor_contact_last_name;

-- Ex.ch3.8
SELECT invoice_due_date, invoice_total * 0.10 AS "Total Discount", "Total Discount" + invoice_total AS "Total"
FROM ap.invoices
WHERE invoice_total >= '500' AND invoice_total <= '1000'
ORDER BY invoice_due_date DESC;

-- Ex.ch3.9
-- Because the ORDER BY clause orders the Balance Due from greatest to least
-- LIIMIT 5 shows the five largest amounts
SELECT invoice_number AS "Invoice Number", 
				invoice_total AS "Invoice Total", 
				payment_total + credit_total AS "Payment Credit Total", 
				invoice_total - "Payment Credit Total" AS "Balance Due"
FROM ap.invoices
WHERE "Balance Due" > '50'
ORDER BY "Balance Due" DESC
LIMIT 5;
