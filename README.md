# README

This program takes by default the data in `input.txt` and outputs the movements of the rover simulation. In order to execute it run:

```ruby main.rb```

## Compatibility
Comaptible with most of modern ruby versions, there is a `Gemfile` file but the only dependencies added are being used only for testing.

## Debug

All debug messages are hidden behind an environment flag called `DEBUG`, in order to run the program with the debug information enabled execute:

```DEBUG=true ruby main.rb```

## Testing

There are some specs under `spec` folder, to run the specs execute

```rspec```
