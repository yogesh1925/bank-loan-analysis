Select * from bank_loan_data;

Select Count(id) as Total_loan_applications from bank_loan_data;

Select Count(id) as MTD_Total_loan_applications from bank_loan_data
Where month(issue_date) = 12 And YEAR(issue_date) = 2021;

Select Count(id) as PMTD_Total_loan_applications from bank_loan_data
Where month(issue_date) = 11 And YEAR(issue_date) = 2021;

Select SUM(loan_amount) as total_funded_amount from bank_loan_data;

Select SUM(loan_amount) as MTD_total_funded_amount from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

Select sum(total_payment) as total_loanamt_recieved from bank_loan_data;

Select sum(total_payment) as MTD_total_loanamt_recieved from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

Select sum(total_payment) as PMTD_total_loanamt_recieved from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

Select  round(AVG(int_rate),4) * 100 as MTD_Average_intrest_rate from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

Select  round(AVG(int_rate) * 100,2) as PMTD_Average_intrest_rate from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;


--      important calculation    --
Select round(((Select  round(AVG(int_rate),4) * 100 from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021) - 

(Select  round(AVG(int_rate),4) * 100 from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021)) / 

(Select  round(AVG(int_rate),4) * 100 from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021),4) * 100 as Total_percentage_increasein_intrest_rate;

Select round(avg(dti)* 100,2) as Avg_dti from bank_loan_data;


-- important percentage calc--
Select
COUNT
	(Case
		When loan_status in ('Fully Paid', 'Current')
		then id 
		end) * 100 / count(id) as good_loan_percentage from bank_loan_data;


Select count(id) as no_of_goodloan_applications from bank_loan_data
where loan_status in ('Fully Paid','Current');

Select sum(loan_amount) as total_goodloan_amount_put from bank_loan_data
where loan_status in ('Fully Paid','Current');

Select sum(total_payment) as total_goodloan_amount_paid from bank_loan_data
where loan_status in ('Fully Paid','Current');

-- now for bad loans--

Select
	count(
		case when
			loan_status  = 'Charged Off' then id end) * 100.0 /
			count(id) as bad_loan_percentage from bank_loan_data;


Select count(id) as no_of_badloan_applications from bank_loan_data
where loan_status in ('Charged Off');

Select sum(loan_amount) as total_badloan_put from bank_loan_data
where loan_status in ('Charged Off');

Select sum(total_payment) as total_badloan_recieved from bank_loan_data
where loan_status in ('Charged Off');




SELECT
        loan_status,
            COUNT(id) AS Total_loan_applications,
            SUM(total_payment) AS Total_Amount_Received,
            SUM(loan_amount) AS Total_Funded_Amount,
            AVG(int_rate * 100) AS Interest_Rate,
            AVG(dti * 100) AS DTI
    from
        bank_loan_data
    group by
        loan_status;



Select 
		loan_status, 
			SUM(total_payment) AS MTD_Total_Amount_Received, 
			SUM(loan_amount) AS MTD_Total_Funded_Amount 

	FROM bank_loan_data
	WHERE 
		MONTH(issue_date) = 12 
	GROUP BY 
		loan_status;


Select 
	MONTH(issue_date) as month_num,
	DATENAME(MONTH,issue_date) as month_name,
	count(id) as total_num_of_applications,
	sum(loan_amount) as total_funded_amt,
	sum(total_payment) as total_recieved_amt

From bank_loan_data

group by MONTH(issue_date) , DATENAME(MONTH,issue_date)
order by MONTH(issue_date);



Select
	address_state as state_, 
	COUNT(id) as total_Loan_Applications,
	SUM(loan_amount) as total_Funded_Amount,
	SUM(total_payment) as total_Amount_Received

from bank_loan_data

group by address_state
order by address_state;


Select
	term as term, 
	COUNT(id) as total_Loan_Applications,
	SUM(loan_amount) as total_Funded_Amount,
	SUM(total_payment) as total_Amount_Received

from bank_loan_data

group by term
order by term;



Select 
	emp_length as  Employee_Length, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received

from bank_loan_data

group by emp_length
order by emp_length;


Select 
	purpose as PURPOSE, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received

from bank_loan_data

group by purpose
order by purpose;


Select
	home_ownership as Home_Ownership, 
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) as Total_Amount_Received

from bank_loan_data

group by home_ownership
order by home_ownership;








