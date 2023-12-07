% Read from CSV file and create rules
:- use_module(library(csv)).

% Predicate to read data from a CSV file and sotre it as rules
read_csv_and_store(Filename) :-
        csv_read_file(Filename, Rows, []),
        process_rows(Rows).

% Process each row in the CSV file and store data as rules
process_rows([]).
process_rows([Row|Rows]) :-
        process_row(Row),
        process_rows(Rows).

% Store data from a row as a rule
process_row(row(EEID, FullName, JobTitle, Department, BusinessUnit, Gender, Ethnicity,
        Age, HireDate, AnnualSalary, Bonus, Country, City, ExitDate)) :-
        assert(employee(EEID, FullName, JobTitle, Department, BusinessUnit, Gender,
                Ethnicity, Age, HireDate, AnnualSalary, Bonus, Country, City, ExitDate)).

% Rule 1
is_seattle_employee(FullName) :-
        employee(_, FullName, _, _, _, _, _, _, _, _, _, _, City, _),
        City = 'Seattle'.

% Rule 2
is_senior_manager_in_IT(FullName) :-
        employee(_, FullName, JobTitle, Department, _, _, _, _, _, _, _, _, _, _),
        JobTitle = 'Sr. Manger',
        Department = 'IT'.

% Rule 3
is_director_finance_miami(FullName) :-
        employee(_, FullName, JobTitle, Department, _, _, _, _, _, _, _, _, City, _),
        JobTitle = 'Director',
        Department = 'Finance',
        City = 'Miami'.

% Rule 4
is_asian_US_manufacturing_40M(FullName, BusinessUnit, Gender, Ethnicity, Age) :-
        employee(_, FullName, _, _, BusinessUnit, Gender, Ethnicity, Age, _, _, _, _, _, _),
        BusinessUnit = 'Manufacturing',
        Gender = 'Male',
        Age > 40,
        Ethnicity = 'Asian'.

% Rule 5
greet(EEID) :-
        employee(EEID, FullName, JobTitle, Department, BusinessUnit, _, _, _, _, _, _, _, _, _),
        format('Hello, ~w, ~w of ~w, ~w!', [FullName, JobTitle, Department, BusinessUnit]).

% Rule 6
years_until_retirement(FullName, Age, Years_to_retire) :-
        employee(_, FullName, _, _, _, _, _, Age, _, _, _, _, _, _),
        Years_to_retire is 65 - Age.

% Rule 7
is_rd_black_midAge(FullName, BusinessUnit, Ethnicity, Age) :-
        employee(_, FullName, _, _, BusinessUnit, _, Ethnicity, Age, _, _, _, _, _, _),
        BusinessUnit = 'Research & Development',
        Ethnicity = 'Black',
        Age >= 25,
        Age =< 50.

% Rule 8
is_ITorFin_PHXorMIAorAUS(FullName, Department, City) :-
        employee(_, FullName, _, Department, _, _, _, _, _, _, _, _, City, _),
        (Department = 'IT'; Department = 'Finance'),
        (City = 'Phoenix'; City = 'Miami'; City = 'Austin').

% Rule 9
is_female_senior_role(FullName, JobTitle) :-
        employee(_, FullName, JobTitle, _, _, Gender, _, _, _, _, _, _, _, _),
        atom_concat('Sr.', _, JobTitle),
        Gender = 'Female'.

% Rule 10
is_highly_paid_senior_manager(FullName, AnnualSalary) :-
        employee(_, FullName, JobTitle, _, _, _, _, _, _, AnnualSalary, _, _, _, _),
        JobTitle = 'Sr. Manger',
        str_to_num(AnnualSalary, Salary),
        Salary > 120000.

% Rule 11
is_prime_age(FullName, Age) :-
        employee(_, FullName, _, _, _, _, _, Age, _, _, _, _, _, _),
        not((Age1 is Age-1, between(2, Age1, N), 0 is mod(Age, N))), not(Age is 1).

% Rule 12
average_salary(JobTitle, Salary) :-
        distinct(employee(_, _, JobTitle, _, _, _, _, _, _, _, _, _, _, _)),
        findall(AnnualSalary, employee(_, _, JobTitle, _, _, _, _, _, _, AnnualSalary,
        _, _, _, _), Salaries),
        maplist(str_to_num, Salaries, SalaryNums), % remove nonnumeric values in Salaries
        average(SalaryNums, Salary).

% Remove non-numeric characters from numbers
str_to_num(Str, Num) :-
        atom_chars(Str, Chars),
        include(is_numeric_char, Chars, Numerics),
        atomic_list_concat(Numerics, '', NumericAtom),
        atom_number(NumericAtom, Num).

is_numeric_char(Char) :-
        char_type(Char, digit).

% Find average of a list of numbers
average(List, Average) :-
        sum_list(List, Sum),
        length(List, Length),
        Length > 0,
        Average is Sum / Length.

% Rule 13
total_salary(FullName, Salary) :-
        employee(_, FullName, _, _, _, _, _, _, _, AnnualSalary, Bonus, _, _, _),
        str_to_num(AnnualSalary, SalaryNum),
        str_to_num(Bonus, BonusNum),
        Salary is SalaryNum + (SalaryNum * BonusNum / 100).

% Rule 14
takehome_salary(FullName, JobTitle, TakeHomeSalary) :-
        employee(_, FullName, JobTitle, _, _, _, _, _, _, AnnualSalary, _, _, _, _),
        str_to_num(AnnualSalary, SalaryNum),
        str_to_num(Bonus, BonusNum),
        TotalSalary is SalaryNum + (SalaryNum * BonusNum / 100),
        calc_tax_rate(TotalSalary, TaxRate),
        TakeHomeSalary is TotalSalary - (TotalSalary * TaxRate).

calc_tax_rate(Salary, TaxRate) :-
        Salary =< 50000, TaxRate is 1/5;
        Salary > 50000, Salary =< 100000, TaxRate is 1/4;
        Salary > 100000, Salary =< 200000, TaxRate is 3/10;
        Salary > 200000, TaxRate is 35/100.

% Rule 15
total_years(FullName, Years) :-
        employee(_, FullName, _, _, _, _, _, _, HireDate, _, _, _, _, ExitDate),
%       get_day_month(HireDate, HireDateDayMonth),
%       get_day_month(ExitDate, ExitDateDayMonth),
        get_year(HireDate, HireDateYear),
        get_year(ExitDate, ExitDateYear),
%       write('Hire '), write(HireDateDayMonth), write(HireDateYear),
%       write('Exit '), write(ExitDateDayMonth), write(ExitDateYear),
        write('Hire: '), writeln(HireDateYear),
        write('Exit: '), writeln(ExitDateYear),
        compare_years(HireDateYear, ExitDateYear, Years).
%       write(' employed '), write(YearsEmployed),
%       compare_days_months(HireDateDayMonth, ExitDateDayMonth, YearsEmployed),
%       YearsEmployed is YearsEmployed,
%       write(' employed '), write(YearsEmployed),
%       Years is YearsEmployed.

%get_day_month(Date, DayMonthNum) :-
%       atom_length(Date, Length),
%       (Length >= 2
%       -> SubLength is Length - 2,
%       sub_atom(Date, 0, SubLength, _, DayMonthAtom),
%       str_to_num(DayMonthAtom, DayMonthNum)
%       ; DayMonthAtom is 0,
%       str_to_num(DayMonthAtom, DayMonthNum)).

get_year(Date, YearNum4) :-
        atom_length(Date, Length),
        (Length >= 2
        -> sub_atom(Date, _, 2, 0, YearAtom),
        str_to_num(YearAtom, YearNum2),
        add_19_20(YearNum2, YearNum4)
        ; YearNum2 is 0,
        str_to_num(YearNum2, YearNum4)).

add_19_20(Year, YearNum4) :-
        (Year > 23
        -> YearNum4 is (Year + 1900)
        ; YearNum4 is (Year + 2000)).

compare_years(HireDateYear, ExitDateYear, YearsEmployed) :-
        (ExitDateYear > 0
        -> YearsEmployed is (ExitDateYear - HireDateYear)
        ; YearsEmployed is (2023 - HireDateYear)).

%compare_days_months(HireDateDayMonth, ExitDateDayMonth, YearsEmployed) :-
%       (ExitDateDayMonth >= HireDateDayMonth
%       -> YearsEmployed is (YearsEmployed + 1)
%       ; YearsEmployed is YearsEmployed),
%       (ExitDateDayMonth = 0,
%       HireDateDayMonth >= 1128
%       -> YearsEmployed is (YearsEmployed + 1)
%       ; YearsEmployed is YearsEmployed).