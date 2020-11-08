Vehicle Towing in Buffalo
================
Kaiser Mahmood

[<i class="fa fa-file-code-o fa-1x" aria-hidden="true"></i> Download
this file as a
template](http://adamwilson.us/SpatialDataScience/scripts/Project_ProposalTemplate.Rmd).

# Introduction to problem/question

Towing of vehicles is a huge problem and there may be a lot of factor
that could influence towing.

# Problem / Question

I would to explore the towing data in buffalo to figure out any
potential spatial relation of towing with location, and roadway and
demographic characteristics.

# Inspiring Examples

## Example 1

![Example map for Seasonal Effect on
Towing](https://d33wubrfki0l68.cloudfront.net/2142d29f0c7c10b7683992ecded288a110e67a56/61b2e/post/2019-08-05_ggplot2-tutorial_files/figure-html/plot-seasons-1.png)

I found this graphic easy to understand yet rich with detail. The
graphic showing change in temperature withing a year for different
season. Though my project in about towing I couldn’t find any similar
types of plot on towing. I like this plot because similar plot like this
would capture the seasonal effect on towing.

## Example 2

![Example map for location of
Towing](http://2.bp.blogspot.com/-8cUZ9icDB0w/VdCdZN5uA-I/AAAAAAAACcw/0iIfBoouBrI/s1600/R%2BGraphics%253A%2BDevice%2B2%2B%2528ACTIVE%2529_359.png)

The graphic is showing NYC broughs with accidents. Because I couldn’t
find similar map for towing I’m showing this. I like this plot because
similar plot like this would capture the location of towing.

# Proposed data sources

[Towing data](https://data.buffalony.gov/Transportation/Tows/5c88-nfii).
[Annual Average Daily Traffic Volume
Counts](https://data.buffalony.gov/Transportation/Annual-Average-Daily-Traffic-Volume-Counts/y93c-u65y)

# Proposed methods

I would like to create some maps of towing with respect to location,
season of the year, demographic information, vehicle information (such
as maker, model, year etc) to explore the factors that influence towing.
I would also like to do a statistical analysis (possibly [linear
regression](http://r-statistics.co/Linear-Regression.html)) to justify
results I would get from different plots.I would like to use ggplot2,
dplyr, ggmap and possibly other packages that has been discussed in the
class. Ideally I would like to do the statistical analysis in R but if
it wouldn’t be possible then I would do in in excel or NLOGIT software
and show my result in the project.

# Expected results

I expect to figure out that towing may be impacted by season of the year
(may be more towing in winter). Also towing location refers to possible
location of accidents. So if I can identify those locations then proper
sign can be placed there to warn the road users.
