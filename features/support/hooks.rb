Before('@watir') do

  #
  # Setup Browser & Webdrivers gem
  #
  @browser_name          = :firefox
  Webdrivers.install_dir = 'webdrivers_bin'

  #
  # Setup Recorder
  #
  opts      = { input:     'desktop',
                output:    'test-recording.mp4',
                framerate: 15,
                log:       'recorder.log'
  }
  @recorder = FFMPEG::ScreenRecorder.new(opts)

  #
  # Start recording and launch browser
  #
  @recorder.start
  @browser = Watir::Browser.new @browser_name
end

#
# Close browser and stop recording
#
After('@watir') do
  @recorder.stop
  @browser.quit
end