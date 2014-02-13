# xCV: Presentation
...The goal of xCV is to end up with an XML based tool or CV (résume) formatting and presentation.
...The idea is to separate the data contained within the résume from it's presentation, as well as adding computable semantic (for example, make distinctive the identity data that can change from those that are permanent).

...It consists of the association of the following:
1. An XML Schema, that define the elements of an XML dialect that is used to describe the data contained in a résume.
2. A number of XSLT programs, each matching a template, that are used to transform the data into an appropriate formatting language.

...Eventually, the project should also contain:
3. A tool to help entering the data of the résume, and hide the mechanics behing.
4. An example of a résume, presented with the complete set of the XML elements defined in the dialect.

# Todo
* Add existence condition on the sections of the résume.
* Handle language transaltion of the enumerated data type elements (ie <status>).
* Handle externe specification of the positionning of the defferent section (someone'd better place Education before Experience?).
* Develop the interactive tool for data entry and automation process.