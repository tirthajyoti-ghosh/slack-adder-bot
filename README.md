<!--
*** Thanks for checking out this README Template. If you have a suggestion that would
*** make this better, please fork the repo and create a pull request or simply open
*** an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->





<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: MIT][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/tirthajyoti-ghosh/slack-adder-bot">
    <img src="https://user-images.githubusercontent.com/57726348/103025447-d7454d00-4577-11eb-86cd-c887d68b014e.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Slack Adder Bot</h3>

  <p align="center">
    TBA
    <br />
    <a href="https://github.com/tirthajyoti-ghosh/slack-adder-bot"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/tirthajyoti-ghosh/slack-adder-bot">View Demo</a>
    ·
    <a href="https://github.com/tirthajyoti-ghosh/slack-adder-bot/issues">Report Bug</a>
    ·
    <a href="https://github.com/tirthajyoti-ghosh/slack-adder-bot/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project

![Screenshot](https://user-images.githubusercontent.com/57726348/102822841-cc67ac80-43ff-11eb-8e58-72690aeae8eb.png)

A simple slack chat bot that adds two numbers. Eg: when the user types to the bot `234 + 123`, it responds back with `357`.

### Built With

* slack-ruby-bot-server
* slack-ruby-bot-server-events
* mongodb
* mongoid

## Live demo

**IMPORTANT!** Checkout this video first - <https://www.loom.com/share/07050cd0480c4109b01ad411b9e92189>

Deployed to Heroku - <https://enigmatic-thicket-31440.herokuapp.com/>

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* MongoDB
* Ruby
* Admin access to a Slack Workspace.

### Setting Up Slack

1. Create a new Slack app from [here](https://api.slack.com/apps?new_app=1)

2. Scroll down and you will find the **App Credentials** section. Take note of these four fields:

    * Client ID
    * Client Secret
    * Signing Secret
    * Verification Token

    ![image](https://user-images.githubusercontent.com/57726348/102981481-05eb0580-452f-11eb-8f2f-97aa185f1f2b.jpg)

    You will need these later.

3. Go to **OAuth & Permissions**. You will find this option in the side bar.

   ![image](https://user-images.githubusercontent.com/57726348/102981953-c375f880-452f-11eb-810b-b0dbd6ad0ca3.png)

4. Scroll down to **Scopes** and add these 👇 scopes *one-by-one* to **Bot Token Scopes**:

    * `users:read`
    * `channels:read`
    * `groups:read`
    * `chat:write`
    * `commands`
    * `im:history`
    * `incoming-webhook`

    ![image)](https://user-images.githubusercontent.com/57726348/102985652-83b20f80-4535-11eb-95a6-0fc71d7d9b1b.png)

5. Go to **Event Subscriptions**. You will find this option in the side bar. Then enable events.

   ![image](https://user-images.githubusercontent.com/57726348/102985992-15ba1800-4536-11eb-8ef2-f04d2459b579.png)

6. Click on **Subscribe to bot events**. Then click on the **Add Bot User Event** button. Then add `message.im` event.

   ![image](https://user-images.githubusercontent.com/57726348/102986763-549c9d80-4537-11eb-804f-c5dd8195b400.png)

   Everytime you send a direct message to the bot, the `message.im` event will be fired.

7. Now you have to install this app to your workspace. Go to **Basic Information**. You will find this option in the side bar. Then click the **Install to Workspace** button.

   ![image](https://user-images.githubusercontent.com/57726348/102987659-b4477880-4538-11eb-81b6-12a45bfd2284.png)

8. In the next page, you will be asked to **Allow** the bot permissions. In the last permission (**Where should Example Bot post?**), select any channel.

   ![image](https://user-images.githubusercontent.com/57726348/102988627-2f5d5e80-453a-11eb-904e-c29561dce9da.png)

### Installation

1. Clone this repository

   ```bash
   git clone https://github.com/tirthajyoti-ghosh/slack-adder-bot.git
   ```

2. Create an `.env` file in the root directory. Then fill these 👇 with their respective values (client id, client secret, etc. from slack app). The values must be put after the `=` sign.

   ```text
   SLACK_CLIENT_ID=
   SLACK_CLIENT_SECRET=
   SLACK_SIGNING_SECRET=
   SLACK_VERIFICATION_TOKEN=
   ```

3. Run `bundle install` and `foreman start` to boot the app.

   ```bash
   $ foreman start
   07:44:47 web.1  | started with pid 59258
   07:44:50 web.1  | * Listening on tcp://0.0.0.0:5000
   ```

### Setting Up Web Hook

1. Since Slack won't send a POST request to `localhost`, we need to expose our local server through a public tunneling service. You can use [ngrok](https://ngrok.com/).

   ```bash
   $ ngrok http 5000
   Forwarding https://ddfd97f80615.ngrok.io -> http://localhost:5000
   ```

2. Go to **Event Subscriptions** in your Slack apps dashboard. You will find this option in the side bar. Then paste this URL in the **Request URL** field:

   ```text
   <your ngrok URL>/api/slack/event

   Eg.,

   https://ddfd97f80615.ngrok.io/api/slack/event
   ```

   ![image](https://user-images.githubusercontent.com/57726348/103019463-e5da3700-456c-11eb-86c7-1163dfcebfad.png)

3. Click on **Save Changes** if necessary.

<!-- USAGE EXAMPLES -->
## Usage

Start a direct chat with the bot. The input must be in this format => `6+3`. If the input does not have two numbers and an addition symbol in between, respond back with a error message - "Sorry, I didn't understand that. I only add numbers in this format. eg: 5+6 or 6+3".

![image](https://user-images.githubusercontent.com/57726348/103020540-94cb4280-456e-11eb-81aa-c9d680a7c8b8.png)

<!-- ROADMAP -->
## Roadmap

TBA

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- CONTACT -->
## Contact

👤 **Tirthajyoti Ghosh**

* Website: [ghosh.tech](https://ghosh.tech/)
* GitHub - [@tirthajyoti-ghosh](https://github.com/tirthajyoti-ghosh)
* Twitter - [@terrific_ghosh](https://twitter.com/terrific_ghosh)
* LinkedIn - [@tirthajyoti-ghosh](https://www.linkedin.com/in/tirthajyoti-ghosh/)

Project Link: [https://github.com/tirthajyoti-ghosh/slack-adder-bot](https://github.com/tirthajyoti-ghosh/slack-adder-bot)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

TBA

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/tirthajyoti-ghosh/slack-adder-bot.svg?style=flat-square
[contributors-url]: https://github.com/tirthajyoti-ghosh/slack-adder-bot/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/tirthajyoti-ghosh/slack-adder-bot.svg?style=flat-square
[forks-url]: https://github.com/tirthajyoti-ghosh/slack-adder-bot/network/members
[stars-shield]: https://img.shields.io/github/stars/tirthajyoti-ghosh/slack-adder-bot.svg?style=flat-square
[stars-url]: https://github.com/tirthajyoti-ghosh/slack-adder-bot/stargazers
[issues-shield]: https://img.shields.io/github/issues/tirthajyoti-ghosh/slack-adder-bot.svg?style=flat-square
[issues-url]: https://github.com/tirthajyoti-ghosh/slack-adder-bot/issues
[license-shield]: https://img.shields.io/badge/License-MIT-yellow.svg
[license-url]: https://github.com/tirthajyoti-ghosh/slack-adder-bot/blob/development/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/tirthajyoti-ghosh/
