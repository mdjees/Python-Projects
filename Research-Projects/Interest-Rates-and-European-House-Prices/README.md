# Assessing the Impact of Interest Rate Fluctuations on Real Estate Prices in European Countries

## Research overview
An MBA research project examining the relationship between real interest rates and housing prices across **26 European countries from 2009 to 2024**. The submitted report describes a balanced panel of **416 country-year observations** and studies differences across monetary-policy regimes.

## Research question
Is there a statistically and economically significant relationship between changes in interest rates and real estate prices in European economies, and does the relationship vary across time, countries and monetary-policy regimes?

## Data and variables (as described in the report)
- Dependent variable: inflation-adjusted, log-transformed House Price Index (HPI).
- Main explanatory variable: real interest rate, defined in the report as the ECB policy rate less annual CPI inflation.
- Controls described in the methodology: real GDP growth, inflation, population and mortgage credit.
- Sources named: Eurostat and the ECB Statistical Data Warehouse.

## Methods described
- Pooled OLS benchmark
- Country fixed effects and random effects, with a Hausman comparison
- Instrumental-variable / 2SLS specification using lagged interest rates
- Dynamic specifications with lagged interest rates
- Regime-dependent analysis around 2014
- Diagnostic checks for multicollinearity, heteroskedasticity and serial correlation

## Findings reported in the submitted paper
The executive summary reports an insignificant baseline pooled-OLS interest-rate coefficient, but positive and significant coefficients in fixed-effects and IV specifications. It also reports a post-2014 change in the estimated relationship, delayed transmission, and substantial cross-country heterogeneity. These are the paper's reported findings and should not be treated as established causal facts without reproducing the analysis.

## Critical review points before external publication
1. **Instrument validity:** lagged policy rates can be relevant, but their exclusion restriction is not automatic. They may affect current housing prices through persistent monetary conditions and expectations. Provide a stronger institutional argument and report first-stage diagnostics and weak-instrument tests.
2. **Specification consistency:** the report describes multiple variable sets in different sections. Reconcile the final regression specification, sample and control set across all model tables.
3. **Panel diagnostics:** the report records heteroskedasticity and serial correlation. Use country-clustered standard errors and consider cross-sectional dependence tests where appropriate.
4. **Pooled OLS output:** the report includes a page where pooled OLS results are described as NaN / unsuccessful. Re-run and explain the final estimation sample and missing-data handling.
5. **Coefficient interpretation:** the report alternates between level, log and elasticity language. State the exact dependent-variable transformation and interpret coefficients in units consistent with the estimated model.
6. **Rate measurement:** distinguish policy rates, mortgage rates and real rates. The ECB policy rate may not represent borrowing costs in non-euro-area countries or each country's household mortgage market.
7. **Causal wording:** fixed effects and lagged instruments do not by themselves establish causality. Present estimates as conditional associations unless identification assumptions are defended.
8. **Reproducibility:** the report PDF was supplied, but the underlying panel dataset and analysis scripts were not included in this upload. Add the anonymised/redistributable data, source links, code and a variable dictionary before claiming reproducibility.

## Portfolio positioning
This project demonstrates macro-financial research, panel-data reasoning and interpretation of heterogeneous housing-market responses. The final portfolio version should pair the report with reproducible code and a transparent limitations section.

## Source file status
The research PDF was supplied for review but is not included in this repository yet. No underlying data or statistical code has been published here.