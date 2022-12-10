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
![pic](https://github.com/sjp2232/ML-Climate-Project-Template-Fall2022/blob/main/etc/other/apso.png?raw=true)


11/3/22

Wake modelling - The aim of the wake model is to calculate the mean streamwise velocity distribution in the entire wind farm as a function of position. Think of wake turbulance that comes with planes as they move through the air. 

https://www.houstonchronicle.com/business/energy/article/Feds-want-to-build-massive-wind-farm-larger-than-17319323.php - Get location of the new farm and define the planning for the turbine placements. Checked-  area is covered in the dataset for GIS/LIDAR from the govt.
Mixed integer second-order cone programming - Included code for solver in ecos folder (use as package) in src. ECOS_BB. pip install ecos. 
	{
	min  c'*x
	s.t. A*x = b
     G*x <=_K h
     some x_i in {0,1}
     some x_j integer}

11/12/22

Based on the location mentioned in the news letter mentioned above, I located the necessary data as defined by Wu, et al. in the "A synchronization..." paper. That is, I located wind data from buoy in the location of the windfarm area and collected the wind data (this includes the direction, the speeds m/s and the direction's probability). Based on the location in the article, I then created a gridded 50 by 50 location matrix of 140meters x 140meters blocks that total to 7km x 7km area in the Gulf of Mexico. This lines up with Dhoot's and other similar approaches' interpretation of the Offshore Windfarm planning problem that looks to optimize the binary matrix of the same shape that defines the wind turbine locations (0/1 for whether the block contains a wind turbine in the center). This interpretation can also be similarly approached to truncate the Jensen's Wake turbulance model by blocking 5 spaces between the turbine locations so that wake of turbines in any direction do not impact the other turbine. That said, I will look to extend the method from Dhoot using interaction matrix W to Wu's wake turbulance calculation method - this allows the model to also take into account the wind direction/speeds into turbine placements. 
Check data and scripts as added in the src folder.

Currently - Recreate the genetic algorithm method mentioned by Wu to stand as the base model to compare my compact/single pass model to that will combine all steps of turbine placement/cable management/substation placement. 

Next week - Find method to quantify the costs of cable connections (to be minimized). 


11/19/22

This week I connected with Dafne to confirm the mode and overview of the project in regard to the course's expectations. This included questions regarding the nature of the problem formualtion itself and my project thus far. The grid view and the rest of the formulation in connection with the turbine calculations are standard in the industry and inline with many other physical simulations with area found in works (think the CNN used in calculating the greenhouse effects of coal mines). Questions around the wake effect modelling are fine in the interaction-matrix based approach (rest not confirmed due to hard to read - will check later). Cable objective function under some critic due to approaches that try to minimize loads? - Not necessary or correct since each line for turbines connected independently anyway and will take care of load calculations in that regard. Therefore, approach to GA with heuristic (value defining function) defined with A*(1/2*(L(array))+(L(export))) where A is the weighting factor for the cables by length and L() is the lengths respectively - take care of the cable requirements. In this, L(array) will be calculated with the Minimum spanning tree and L(export) will be distance to shore from the most-connected node in the tree. Then, we can use the secondary method to calcualte the actual cable configuration and placement of substation. The values for the mutation and crossover probabilities are standard. 

Next week - Generate some premilinary results using above approach to discuss with Alp.


11/25/22

This week I completed the definitions for the GA - the mutations and the crossover methods (check the scripts in .ipynb files). The functions for each of the functions have to be carefully defined since we have to have viable children (contain only 50 turbines). This means we have to play around with the standard definitons such that they can become viable - check each function definitions for those changes. Also added scripts for processing data for usability in creating charts (scripts also included).

Next week - Run the tests such that best methods for mutations and crossovers are defined. Use those to then get the best configurations using multiple objective functions. This will also include recreating the cable defining method to test the configurations created. Finally complete the case study for the Texas location with 200 turbines.


12/03/22

This week I completed the general recreation (with modifications based on specificity of the problem) of the Genetic Algortihm for wake model optimization. This meant recreating all the functions required to explore the problem from an algorithmic view (all done by me manually since they are not too difficult). 

In preparation of the demo next week, I will finish up the implimentation of the NSGA2 model for distance/wake multi-optimization and create graphs/images. This will include writing all the required functions myself per the requirements of the problem.  


12/06/22 (sub-update for the presentation)

In preparation of the project presentation, I created multiple illustrations of the basic single objective GA and new multi objective GAs. And then I presented the preliminary results from small iteration convergences. Next week, I will formulate the case study for the final leg of the project. Main pain points currently are the k-means methods incorporation such that the complexity does not drastically increase to un-dealable leaves.

12/10/22 (final code update)

Added a pseudo multi-objective method that calculates a scaled values for both and adds them together. Cleaned up many parts of the scripts and prepared a folder to use to store all the resources for creating illustrations for the final paper. Next week: Write the paper and create illustrations