import requests # You will need to install requests through pip or another mechanism 
import getpass # This allows us to collect the password without showing it in the terminal

# Ask for credentials
jss_username = raw_input("Please enter your JSS username: ")
jss_password = getpass.getpass("Please enter your JSS password: ")

# Set our JSS URL
jss_url = 'https://your.jss.com:8443'

print ""

# Start an infinite loop that will allow us to keep searching for devices until we select no
while True:
    
    # Get the match term
    match = raw_input("Search term (username, serialnumber, device name, etc)\nNote use * as wildcard: ")
    
    print "--------------------------------------------------------"
    print "Searching for: %s" % match

    # Request all computer matching the search term
    computers_request = requests.get(jss_url + '/JSSResource/computers/match/%s' % match,
                            auth=(jss_username,jss_password),
                            headers={'Accept': 'application/json'}
                            )
    # Request all mobile_devices matching the search term
    mobile_devices_request = requests.get(jss_url + '/JSSResource/mobiledevices/match/%s' % match,
                            auth=(jss_username,jss_password),
                            headers={'Accept': 'application/json'}
                            )

    # String concatnanation and using len() to get the amount of devices
    print "Search term: %s" % match
    print "Found %s mobile devices" % len(mobile_devices_request.json()['mobile_devices'])
    print "Found %s computers" % len(computers_request.json()['computers'])
    
    # Adding a pause
    raw_input("--Press enter to see results--")
 
    # For loop to go over the json returned by the jss and display each entry
    computers = computers_request.json()['computers']
    for computer in computers:
        print "Device Type: Computer"
        print "Computer Name: %s" % computer['name']
        print "Username: %s" % computer['username']
        print "Serial Number: %s" % computer['serial_number']
        print ""

    # For loop to go over the json returned by the jss and display each entry
    mobile_devices = mobile_devices_request.json()['mobile_devices']
    for mobile_device in mobile_devices:
        print "Device Type: Computer"
        print "Mobile Device Name: %s" % mobile_device['name']
        print "Username: %s" % mobile_device['username']
        print "Serial Number: %s" %mobile_device['serial_number']
        print ""
    
    # See if we want to continue or break the loop
    if raw_input("Would you like to continue? [y,n] ") in 'yesYESYes':
        continue
    else:
        break

print "Goodbye"

