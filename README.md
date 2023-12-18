# Nmap API for iOS app

## Description
This API offers an interface for conducting network scans using Nmap, enabling the detection of open ports and running services on a specified IP address. 
It is designed to integrate with applications requiring network security information and auditing.

## Getting Started

### Prerequisites
- Vapor
- Swift 5
- Nmap installed on the server

### Installation
1. Clone the repository:
2. Navigate to the project directory and compile:
3. Run the server:

## Usage

Make a GET request to `/ip/:ip` where `:ip` is the IP address you want to scan.

### Request Example

http://127.0.0.1:8080/ip/127.0.0.1

### Response
The API returns a list of open ports and detected services in JSON format.

## Acknowledgments

- [Vapor](https://vapor.codes)
- [Nmap](https://nmap.org)

## Disclaimer and Legal Notice

### Disclaimer
The `Nmap API for iOS app` is provided for educational and professional purposes only. The author of this software, [martinoli], is not responsible for any misuse of the tool, 
or for any damage that may be caused by the use of this tool. It is the end user's responsibility to obey all applicable local, state, national, and international laws.

### Legal and Ethical Use
By using the `Nmap API for iOS app`, you agree to use it in a manner consistent with ethical and legal guidelines. 
This includes obtaining proper consent from the network owners and administrators before conducting any scanning or auditing activities. 
Unauthorized scanning and network auditing can be considered as illegal activities under various laws, and such actions are strictly discouraged and condemned.

It is the user's responsibility to ensure that their use of this tool complies with all relevant laws and regulations. If you are unsure or have any questions regarding the legal use of this tool, please consult a professional legal advisor.
