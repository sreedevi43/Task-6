Sales Trend Analysis – Task 6
-------------------------------
What This Is
==============
This SQL script digs into the online_sales dataset to spot patterns in how sales are performing month by month.
Instead of just listing numbers, it answers the big questions you’d normally ask in a sales meeting:

When do we make the most money?

Which months are quieter?

How many orders are coming in, and how often are they repeat orders?

Think of it as your “quick pulse check” on business trends.

The Data Behind It
=======================
We’re working with an online_sales table, which contains:

order_date → the day the order happened

quantity → how many items were sold

price → how much each item cost

order_id → the unique number for each order (if available)

What the Script Does 
=========================
Pulls out months and years from each order date so we can group sales over time.

Totals up revenue for each month (just multiplying quantity * price).

Counts how many orders we got each month (both total and unique orders).

Puts revenue and order counts in one place so you can see them side-by-side.

Finds the top 3 months where we made the most money.

Lets you zoom in on a single year if you just want recent trends.

Why It’s Useful
=================
Spot seasonal spikes (e.g., holiday sales boosts).

See if marketing pushes actually turned into more revenue.

Identify slow months so you can plan promotions or campaigns.

Keep leadership in the loop without manually crunching numbers.

A Quick Example
================
Here’s the kind of insight you’ll get:

Year  	Month 	Revenue	  Orders
---------------------------------
2024  	Jan	    52,000	  1,200
2024  	Feb	    47,500	  1,050
2024	  Mar	    61,200	  1,340

In this example, March clearly took the crown — maybe because of a product launch or seasonal event

conclusion
=============
This script isn’t just running a bunch of SQL commands—it’s taking raw sales data and turning it into a story you can actually use.
In just a few queries, you’ll spot the months when business is booming, the ones that could use a little love, and where the biggest wins are hiding.
Whether you’re sharing results with your team, planning your next big promo, or just keeping a finger on the pulse, these insights help you make decisions you can feel good about—because they’re backed by solid data, not gut feelings.
