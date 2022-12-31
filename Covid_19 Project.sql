select date, Location, total_cases, new_cases, total_deaths, population 
from Covid_Death
WHERE continent IS NOT NULL
oRDER BY 1, 2;

-- lOOKING AT TOTAL CASES VS TOTAL DEATHS 

select date, Location, total_cases, total_deaths, (total_deaths/total_cases)*100 As Death_Perc
from Covid_Death
where location = 'Asia'
oRDER BY 1, 2;

-- LOOKING AT TOTAL CASES VS POPULATION
--SHOW WHAT PERCENTAGE OF POPULATION GOT COVID

select date, Location, total_cases, population, (total_cases/population)*100 As Case_Perc
from Covid_Death
--where location = 'Asia'
oRDER BY 1, 2;

--LOOKING FOR LOCATION WITH HIGHEST INFECTION RATE COMPARED TO POPULATION

select Location, Max(total_cases) As HighestInfectedCaseCount, population, Max((total_cases/population))*100 As percpopulationinfected
from Covid_Death
--where location = 'Asia'
Group by Location, population
oRDER BY  percpopulationinfected Desc;


-- LOOKING FOR THE LOCATION WITH THE HIGHEST DEATH RATE COMPARED TO POPULATION 

select Location, Max(CAST(total_deaths AS int)) As HighestdeathCount, population, Max((total_deaths/population))*100 As Deathperc_population
from Covid_Death
--where location = 'Asia'
Group by Location, population
oRDER BY   Deathperc_population Desc;	


-- ShOW CONTINENT WITH HIGHEST DEATH COUNT PER POPULATION 

select continent, Max(CAST(total_deaths AS int)) As HighestdeathCount
from Covid_Death
--where location = 'Asia'
Group by continent
oRDER BY  HighestdeathCount Desc;		

-- GLOBAL NUMBER OF CASES AND DEATHS 

select SUM(total_cases) As Total_Cases, Sum(Cast(Total_Deaths as int)) As Total_Death , Sum(Cast(Total_Deaths as int))/SUM(total_cases) As Death_Perc
from Covid_Death


--LOOKIG AT POPULATION AND VACCINATION 

Select cd.continent, max(cv.new_vaccinations) As Total_Vaccinated, Max(cd.population)
from Covid_Death cd
join Covid_Vaccination cv
ON cd.population = cv.population
Group by cd.continent
Having continent is not null;


	








