# Audio-Synthesizer
Chip for a sound synthesizer

VLSI Project: Audio Synthesizer Chip
Group members:             Steve Corey
                                        Nick Elliott
                                        Marko Ljubicic
                                        Jim Squire
                                                               
The idea: Design a chip for a sound synthesizer. The design will have a CPU core that will run a small ISA, an I2C peripheral to communicate with external audio processors based on digital potentiometers, and eight PWM generators.
 
The motivation: To push the boundaries of PWM sound generation. This is not a mere buzzing, bleeping chip, it is a complex sound synthesizer that can communicate to external processors.
 
Basic assumptions: 16-bit bus width. Eight PWM outputs. Custom ISA with instructions related to generating audio waveforms. I2C master peripheral to communicate with external devices.
