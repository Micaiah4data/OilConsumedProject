Select*
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']
order by 1,2


--Main POV

Select Location, Year, Continent, OilConsumptionBarrels
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']
where continent is not null
order by 1,2


select location,Year,Continent,OilConsumptionBarrels, Population, (Population/OilConsumptionBarrels)*100 as ConsumptionByPopulation
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']
Where Population is not null
order by 1,2


--Countries with the highest Oil consumption compared to their population

select location, population, Max(OilConsumptionBarrels) as HighestOilConsumers, max((OilConsumptionBarrels/population))*100 as HighestOilConsumersPerPopulation
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']
--where location like '%Nigeria%'
where continent is not null
group by population, location
order by HighestOilConsumers desc


--continent with highest OilpriceHistory by population

select continent, population, Max(OilConsumptionBarrels) as HighestOilUsers
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']
--where location like '%Nigeria%'
where continent is not null
group by continent, population
order by HighestOilUsers desc

--Creating a Table
DROP Table if exists #PercentPopulationOilUsers
Create Table #PercentPopulationOilUsers
(
Continent nvarchar(255),
Location nvarchar(255),
Population numeric,
HighestOilUsers numeric,
OilCrudePriceSinceHistory numeric
)

Insert into #PercentPopulationOilUsers
Select continent, location, population, OilConsumptionBarrels, OilCrudePriceSinceHistory
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']

--Views

Create view PercentPopulationOilUsers as
Select continent, location, population, OilConsumptionBarrels, OilCrudePriceSinceHistory
from [OilProject].[dbo].['world-crude-oil-price-vs-oil-co$']
where continent is not null 