# FiveM Guilded API
FiveM Guilded API uses the recently released Guilded API to interact with your Guilded bots from within your FiveM server.

For assistance, open an Issue or join my Discord: https://discord.gg/eUDwYzk

## Installation Steps
1. Install the contents of this repository
2. Create a Guilded bot for your server under the Manage Bots option
3. Generate a token for your bot, copy it
4. Paste the generated token and the guild ID into `config.lua`
5. Add `start FiveM_Guilded_API` to your `server.cfg` file
6. Run your FiveM server and see in the console if the connection was successful

## Documentation
Documentation can be found on the wiki: https://github.com/gegelendvay/FiveM_Guilded_API/wiki

## Usage
Once you installed and set up the script, you can use its functions from other server-side scripts by calling `exports.FiveM_Guilded_API:GetMember("abcdefgh")` for example.

## Contributions
If you have an update containing new and unused API endpoints or you have improvements you want to share, feel free to open a Pull Request and contribute to the project. Every contribution is much appreciated!

The API documentation can be found here: https://www.guilded.gg/docs/api/introduction

## Future Plans
I plan to integrate more and more endpoints into this script to have a broader functionality than it currently has. This is currently restricted by the available models, which I hope will get added to in the future by the Guilded team.

Since the API does not have a versioning scheme yet, issues may occur if response data get modified by the maintainers. I will try to keep up with the updates to mitigate these issues that may arise.

The integration of a Guilded connection for FiveM, similar to the one used on Discord, would significantly improve the functionality of the script, but sadly this is out of my scope.

## License
The project is licensed under the MIT License