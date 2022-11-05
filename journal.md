09/21/22 
I am still brainstorming ideas for the class project. One of the main leads is creating a model for EV sales - related to the abstract I submitted for my application. Here, I would theoretically use some methods such as matrix completion and time-series prediction on features such as price, location, specs, subsidy eligibility in the location/time, etc. to predict the expected sales in a location/time combination. 

Again, most of my time will be spent collecting data if I were to go through with this project idea. I mentioned some great sources in the application and I plan to continue searching for usable data to stand-in for features this week.


10/03/22
Going through a subject change. Details regarding this change sent over email (shown below):
{I have decided to change my project's subject. Over the last few weeks I have been trying to find data for state-wise EV sales data, EV model specs, state-wise subsidies, etc. and overall all the data is either second-hand, shady or inaccurate. To not waste more time on this, I think I will just leave out the EV subject since I feel that the EV subject itself just doesn't have dependable data that I can access.
The subject I now am gravitating toward:
Using topographic and structure data in the US to define best placements for wind-farms.
While I was looking into infrastructure information for EV car chargers, I ran across the "Optimization of train routes based on neuro-fuzzy modeling" paper below which uses constraint based methods for ranking train routes. This led me to look into wind-farm placement work given the sudden rise of wind-farms across the US and the world. Then I found some other statistical approaches for determining wind-farm locations using GIS data (that I will look over this week). After understanding these statistical approaches, I want to try to extend the use of methods in EV car charger locations (found in "Review of Electric Vehicle Charging Station Location Planning") to wind farm locations.
Possible data:
This website from the USGS contains data for topography and structure information for the US. https://apps.nationalmap.gov/downloader/#/}

This week I plan to look over the past work in GIS-based wind-farm placements.


10/13/22
Over the last week I looked over the prior research and the subject area of wind-farm placements is very promising - both in relation to prior research on that specific subject and the applications of ML algorithms on similar subjects such as charging station placements/warehouse planning. 

On the topic: following my initial search (and given that I am a Texan), I learned that Texas is the leading state implementing wind energy solutions. Therefore, as the main growing market, I am choosing to focus only on working with Texas data to also make the scope smaller.

As discussed in our emails, most of my time was spent on finding and downloading data that I could potentially utilize for the model. The following were my main requirements in the data:
	-Mode in either longitude/latitude format or shapefile format (since I have used these two formats in my prior works)
	-Source is dependable/reputable (as you will later find out, this meant only government sources that typically publically release the kind of data I need)

The following are the data I have found so far:
	-Elevation data for the Continental USA (shapefile)
	-Road location data for Texas (shapefile)
	-Structure location data for Texas (shapefile)
	-Railroad location data for Texas (shapefile)
	-Wind farm location data for Texas (longitude/latitude)
	-Average wind speed by location data for Texas (longitude/latitude)

Other data I plan to mention in my project:
	-Official Energy Generation by source type such as wind/hydro/coal/etc. for USA (csv)
	-Official Wind energy Generation for USA and Texas (csv)

Given the green light from the instructures, I will continue down this project line. This week, I will now look to play around with the data itself to make sure it is usable.

10/20/22
Two key new potential models I looked into (now basis on other energy planning/scoping):
(1) Senocak and Goren describe a SVM method that uses GIS information (slope, elevation, current land use, river/lake/other water information) to 
predict the potential Biomass energy production of a small geographic region. The GIS information they used was very specific and the SVM model only
defined the basic production probability of the whole area as a whole (based on historical data). I will look into using thier 2-step method of using
SVM or similar to first calculate the production probability of areas (after segmenting them) and then using GIS information for the potential calculation.

(2) Luo use a Mixed Integer Second Order Cone Programming(MISOCP) method to plan a network of electric vehicle charging station. The constraint heavy method 
is quite confusion to read and I will try to decypher and look into ways for applying to my problem. 

Potential pivot using (2) -> Creating a plan of windfarms that can be completed in one swift completion plan.


10/27/22

On pivot point mentioned above -> Most plans for wind farms use voronoi tesellation model (pick areas for each turbine and expand to maximize output or minimize transmission moving). Check papers added.

Added - Quick visualizing tools for the data previously collected.
ToDo - Recreate the algorithm presented in the work by Qi, et al.
![pic](https://github.com/sjp2232/ML-Climate-Project-Template-Fall2022/blob/main/etc/other/apso.jpg?raw=true)


11/3/22

Wake modelling - The aim of the wake model is to calculate the mean streamwise velocity distribution in the entire wind farm as a function of position. Think of wake turbulance that comes with planes as they move through the air. 

https://www.houstonchronicle.com/business/energy/article/Feds-want-to-build-massive-wind-farm-larger-than-17319323.php - Get location of the new farm and define the planning for the turbine placements. Checked-  area is covered in the dataset for GIS/LIDAR from the govt.
Mixed integer second-order cone programming - Included code for solver in ecos folder (use as package) in src. ECOS_BB. 
	{
	min  c'*x
	s.t. A*x = b
     G*x <=_K h
     some x_i in {0,1}
     some x_j integer}