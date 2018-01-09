# mandrill-stats
A script to calculate total sends, open rate, and click through rate on a template basis in Mandrill

1. Configure your Mandrill API key
2. Add the name of the templates you want stats on to the templates_to_query array
3. Make sure you have the mandrill gem installed
```bash
gem install mandrill-api
```
4. Run from the script from the command line
```bash
ruby mandrill_stats.rb
```
