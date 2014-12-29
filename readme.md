Customizing Output/Markup in Cucumber Formatters
================================================

This is an example cucumber project with some very simple examples on
what classes needed reopened to add your custom print statement(s).
If you are adding a new print method (such as #put_collapsible_list),
there are more steps you need than just (re)defining the method in the
formatter class.

Because sometimes business wants to use cucumber for regression and have
a record of what ran and what the results were other than "tests passed."

Running
--------

Just grab the source, and run cucumber from that directory with the formatters
you want to use:

    cucumber features/ --format html --out test.html --format pretty

Notes
-------

Only the HTML formatter has the method added in this example. The Pretty
formatter code is there but commented out. This is to show that you don't
need to add your method to all the formatters, just the ones you want to
handle your output.
