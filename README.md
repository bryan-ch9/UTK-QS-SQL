Project Summary:
The primary goal of this project was to analyze multi-year regional sales data using SQL and create an interactive dashboard in Power BI. This solution was designed to uncover patterns, seasonal trends, and growth opportunities across counties, quarters, and years.

I started with a raw dataset containing sales by county, quarter, and year. Using SQL, I transformed this data into key analytical views. These were imported into Power BI to create an interactive and professional-grade dashboard.

Methodology:
1. Data Source & Structure-
SQL table: Colorado_vehicle_sales
Key columns: year, quarter, county, sales
2. SQL Data Preparation-
Query Name                	Description
Total Sales by County     	Aggregates total sales across all years per county      
Average Quarterly Sales   	Computes mean sales per quarter across all counties     
Yearly Trends by County   	Tracks yearly sales performance for each county         
Year-over-Year Growth     	Calculates percentage increase/decrease in yearly sales
Quarterly Sales Breakdown	Pivoted view of sales by quarter across multiple years  
 Five main queries were created to structure the data for analysis:

Each result set was saved as a separate table for easy import into Power BI.

3. Power BI Visualization Design-
Visual Elements Used:
	Bar Charts – County comparisons by total sales and YoY growth
	Line Charts – Trendlines showing seasonal and annual performance
	Matrix Tables – Detailed quarter-by-year breakdowns
	Slicers – Filter by year, quarter, and county
	Maps (Optional) – Visualize sales by region

Dashboard Design Focus:
	Clean layout, uniform color palette
	Clear titles and tooltips
	Drill-down from yearly to quarterly data

Project Goals: Predicted vs Achieved

Objective    	Goal	Achieved	Description  
Identify top-performing counties     			Found via bar charts and total aggregates                
Understand seasonal/quarterly trends	
	Line charts and matrix views confirmed seasonal patterns
Calculate YoY sales growth         		
Custom SQL calculations with percentage deltas
Build an interactive dashboard			Filters, drill-downs, tooltips implemented in Power BI
Present professional visualizations  	
	Final dashboard is presentation-ready and user-friendly


Key Insights

Top Counties: Arapahoe, Adams, and El Paso consistently generated the highest sales.
Seasonality: Sales often peaked in Q4, suggesting strong holiday-season demand.
YoY Growth: Some counties, like Weld and Larimer, exhibited positive growth trends, while others were more volatile.
Regional Performance: Rural counties had slower growth, indicating opportunities for investment or marketing.
Deliverables:
-	SQL scripts for calculated metrics
-	Power BI file with complete dashboard
-	 Fully interactive visual components
-	Modular design ready for real-time refresh and future expansion
Conclusion
This project delivered a highly functional business intelligence dashboard using SQL and Power BI. By analyzing over 7 years of sales data, I produced actionable insights for strategic planning. The resulting visuals are interactive, clean, and designed for decision-makers to explore key metrics with ease.
-Next steps could include integrating product-level data, expanding to forecasting models, and publishing to Power BI Service with scheduled refreshes.
![image](https://github.com/user-attachments/assets/68ec54e9-56e2-40d3-9ca2-5bed45ad7891)
