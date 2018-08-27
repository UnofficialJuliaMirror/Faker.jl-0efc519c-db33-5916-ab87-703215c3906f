
 	centuries = ("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI","XVII", "XVIII", "XIX", "XX", "XXI")

 	year_top =2100

 	unix_time()= rand(0: Dates.value((Dates.DateTime(Dates.now())) - (Dates.DateTime(1970,1,1))))

 	function date_time()
 		fec = Dates.DateTime(rand(1970:year_top),rand(01:12),1,rand(01:23),rand(00:59),rand(00:59)) + Dates.Day(rand(01:31))
 		return Dates.format(fec, "Y-m-d HH:MM:SS")
 	end

 	date_time_ad()= Dates.format(iso8601(), "Y-m-d HH:MM:SS")

 	iso8601()=
 	Dates.DateTime(rand(1970:year_top),rand(01:12),1,rand(01:23),rand(00:59),rand(00:59)) + Dates.Day(rand(01:31))

 	function date(pattern="Y-m-d")
 		x = Dates.DateTime(rand(1970:year_top),rand(01:12),1,rand(01:23),rand(00:59),rand(00:59)) + Dates.Day(rand(01:31))

 		return Dates.format(x, pattern)

 	end

 	function time(pattern="H:M:S")
 		x= Dates.DateTime(1,1,1,rand(01:23),rand(00:59),rand(00:59))

 		return Dates.format(x, pattern)
 	end

 	function date_time_between(start_date="-30y", end_date="now")

 		try
 			start_date = Dates.DateTime(Dates.now()) + Dates.Year(parse(Int,start_date[1:end-1]))
 		catch
 			start_date = Dates.DateTime(Dates.now())
 		end

 		try
 		end_date = Dates.DateTime(Dates.now()) + Dates.Year(parse(Int,end_date[1:end-1]))
 	catch
 	end_date = Dates.DateTime(Dates.now())
 end

 dr=(start_date:Day(1):end_date)[rand(1:end)]
 return Dates.format(dr, "Y-m-d HH:MM:SS")

end

function date_time_this_century(;before_now=true, after_now=false)
	r = Dates.DateTime(Dates.now())
	this_century_start = Dates.DateTime((Int(Dates.year(r)) - (Dates.year(r) % 100)), 1, 1)
	next_century_start = Dates.DateTime(Dates.year(this_century_start) + 100, 1, 1)

	if before_now && after_now
		dr=(this_century_start:Day(1):next_century_start)[rand(1:end)]
	elseif (before_now==false) && after_now
		dr=(r:Day(1):next_century_start)[rand(1:end)]
	elseif (after_now==false) && before_now
		dr=(this_century_start:Day(1):r)[rand(1:end)]
	else
		return  Dates.format(r, "Y-m-d HH:MM:SS")
	end

	return Dates.format(dr, "Y-m-d HH:MM:SS")

end

function  date_time_this_decade(;before_now=true, after_now=false)
	r = Dates.DateTime(Dates.now())
	this_decade_start = Dates.DateTime((Int(Dates.year(r)) - (Dates.year(r) % 10)), 1, 1)
	next_decade_start = Dates.DateTime(Dates.year(this_decade_start) + 10, 1, 1)

	if before_now && after_now
		dr=(this_decade_start:Day(1):next_decade_start)[rand(1:end)]
	elseif (before_now==false) && after_now
		dr=(r:Day(1):next_decade_start)[rand(1:end)]
	elseif (after_now==false) && before_now
		dr=(this_decade_start:Day(1):r)[rand(1:end)]
	else
		return  Dates.format(r, "Y-m-d HH:MM:SS")
	end

	return Dates.format(dr, "Y-m-d HH:MM:SS")
end



function date_time_this_year(;before_now=true, after_now=false)
	r = Dates.DateTime(Dates.now())
	this_year_start = Dates.DateTime(Dates.year(r), 1, 1)
	next_year_start = Dates.DateTime(Dates.year(r) + 1, 1, 1)

	if before_now && after_now
		dr=(this_year_start:Day(1):next_year_start)[rand(1:end)]
	elseif (before_now==false) && after_now
		dr=(r:Day(1):next_year_start)[rand(1:end)]
	elseif (after_now==false) && before_now
		dr=(this_year_start:Day(1):r)[rand(1:end)]
	else
		return Dates.format(r, "Y-m-d HH:MM:SS")
	end

	return  Dates.format(dr, "Y-m-d HH:MM:SS")
end


function date_time_this_month(;before_now=true, after_now=false)
	r = Dates.DateTime(Dates.now())
	this_month_start = Dates.DateTime(Dates.year(r), Dates.month(r), 1)
	next_month_start = Dates.DateTime(Dates.year(r), (Dates.month(r)+ 1)%12, 1)

	if before_now && after_now
		dr=(this_month_start:Day(1):next_month_start)[rand(1:end)]
	elseif (before_now==false) && after_now
		dr=(r:Day(1):next_month_start)[rand(1:end)]
	elseif (after_now==false) && before_now
		dr=(this_month_start:Day(1):r)[rand(1:end)]
	else
		return  Dates.format(r, "Y-m-d HH:MM:SS")
	end

	return Dates.format(dr, "Y-m-d HH:MM:SS")
end

ap = ("AM","PM")
am_pm()= ap[rand(1:2)]

day_of_month()= rand(1:31)

day_of_week()= Dates.dayname(Date(2015,07,rand(12:18)))

months()=rand(1:12)

month_name()= Dates.monthname(Date(2015,rand(1:12),15))

year()=rand(1920:year_top)

century()= centuries[rand(1:length(centuries))]

function timezone()
	executor(data["en"]["faker"]["address"]["time_zone"])
end