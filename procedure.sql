select * from Talk
select * from Speaker
select * from Event

alter proc GetTalksByVenue @venue nvarchar(100) = null, @subject nvarchar(100) = null
AS
select tk.Subject, tk.Venue, sp.Fullname, sp.Profession, tk.Time
from Talk tk
join Speaker sp on tk.SpeakerId = sp.Id
where 
tk.Venue = ISNULL(@venue, tk.Venue) 
AND 
tk.Subject LIKE '%' + isnull(@subject, tk.Subject) + '%'

exec GetTalksByVenue @venue = 'Auditorium A', @subject = 'Wp'


