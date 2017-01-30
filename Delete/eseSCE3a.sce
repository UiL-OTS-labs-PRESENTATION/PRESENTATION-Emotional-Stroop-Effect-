# This file is made/ adapted by Esther Meeuwissen. For questions esther.meeuwissen@fcdonders.ru.nl
# may2012 This file is adapted by Marijn Struiksma. For questions m.struiksma@uu.nl

pcl_file = "esePCL3a.pcl"; 					# pcl file name geven
scenario = "eseSCE3a.sce"; 						# for log-file
default_font_size = 50;                      # size of the letters
default_background_color = 0, 0, 0;    		# use black
#default_background_color = 255, 255, 255;    		# use black
default_text_color = 150, 150, 150;          # use light grey as default
#screen_height = 768;                        # display settings
#screen_width = 1024;                        # display settings
#screen_bit_depth = 8;  							# display settings
#pulse_width = 10;									# determines the length of time that the codes remain on the port
#write_codes = true; 								# presentation will write user defined codes to the output port when an event occurs
active_buttons = 5;									# 1 button active
button_codes = 1,2,3,4,253;						
#response_port_output = true; 					# no output at response events (in the pcl file teporarily restored, to avoid unwanted responses)
response_matching=simple_matching;
stimulus_properties = wordnr, number, condition, number, colorcode, number, word, string;
event_code_delimiter = ";";
 
begin;													# start scenario

picture {} default; 									# default picture of emtpy screen

picture {text { caption = " "; } text1;	   # picture with text as in 'text1'
         x = 0; y = 0;} pict1;
picture {text { caption = "  ";}; 			   # picture with blank screen
			x = 0; y = 0;} pict2;
			
picture {text { caption = "*";};					# picture with fixation cross
			x = 0; y = 0;} fix1;		

nothing { default_code = "space"; } stim; 	# empty stimulus

################################# blank-screen
trial {													# trial define
		trial_duration = 800; 						# trial duur 1000 ms
		picture { 										# het object is een picture
		text { caption = " ";}; 					# met een blanco scherm
		x = 0; y = 0;};
response_active = true;    						# in het midden van het scherm
} blank;  												# de trial heet blank

################################# blank-kort-screen
trial {													# trial define
		trial_duration = 350; 						# trial duur 1000 ms
		picture { 										# het object is een picture
		text { caption = " ";}; 					# met een blanco scherm
		x = 0; y = 0;};
response_active = true;    						# in het midden van het scherm
} blankkort;  		
		
######################################### default-trial

trial {   												# trial define
   all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	stimulus_event {									# define 1e stimulus event
		nothing stim;
		time = 0; 										# op t=0
 		} event; 										# het stimulus event heet event
} trial1;  		

trial {   												# trial define
   all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	stimulus_event {									# define 1e stimulus event
		nothing stim;
		time = 0; 										# op t=0
 		} eventcode; 										# het stimulus event heet event
} trial2;  


trial {													# trial define
	all_responses = false;							# only responses that occur while some stimulus is active can affect the trial duration
	trial_type = first_response;
	#terminator_button = 1;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	stimulus_event {									# define 1e stimulus event
		picture pict1; 										# op t=0
		target_button = 1;
		response_active = true;  						# responsen komen door
		stimulus_time_in = 100;
		stimulus_time_out = never;	 				# vanaf t = 100 (100 ms na start event) is reageren mogelijk, tot 'never' = geen eindtijd
 		} event_word; 										# het stimulus event heet event
} trial_word; 	 												# deze trial heet trial_word

####################################### start-screen that precedes the practice-session
trial {													# trial define
	trial_type = specific_response;
	terminator_button = 5;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Welkom bij het experiment ‘Gekleurde Woorden’. 

Je krijgt zo meteen een reeks woorden te zien 
op het computerscherm. Deze woorden kunnen in het 
rood, geel, groen of blauw op het scherm verschijnen. 
Als je een woord ziet, gaat het erom dat je zo
snel mogelijk de kleur van het woord benoemt via 
een druk op een toets. Het gaat in dit experiment 
dus niet om de betekenis van het woord, maar slechts 
om de kleur. Telkens als je de kleur hebt benoemd, 
krijg je het volgende woord te zien. 

Klik op enter om door 
te gaan naar de volgende pagina.";											# met de text 'oefensessie'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} oefen1; 												# deze trial heet oefen



trial {													# trial define
	trial_type = specific_response;
	terminator_button = 5;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Om de kleur van een woord te benoemen, druk je op een toets. 
Je gebruikt de twee toetsen links van de spatiebalk 
en de twee toetsen rechts van de spatiebalk.  
Dit zijn de ALT en WINDOWS toetsen. 

De linker WINDOWS toets staat voor rood, 
de linker ALT toets staat voor groen. 
De rechter ALT toets staat voor blauw, 
de rechter WINDOWS toets staat voor geel. 

Druk op enter om verder te gaan."; 											# met de text 'oefensessie'
		font_size = 35;};
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} oefen2; 												# deze trial heet oefen

trial {													# trial define
	trial_type = specific_response;
	terminator_button = 5;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Je gebruikt je wijs- en middelvinger 
van beide handen om de toetsen in te drukken.  
Het is de bedoeling dat je deze vingers 
gedurende het hele experiment op 
de ALT en WINDOWS toetsen houdt. 
Natuurlijk kun je tussendoor wel 
even verzitten en bewegen. 

Geef je antwoord zo snel mogelijk, maar het
is ook belangrijk om het juiste antwoord te geven.

Druk op enter om verder te gaan."; 											# met de text 'oefensessie'
		font_size = 35;};
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} oefen3; 												# deze trial heet oefen

trial {													# trial define
	trial_type = specific_response;
	terminator_button = 5;					# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Je mag nu eerst een paar keer oefenen.
Tijdens de oefensessie krijg je feedback. 
Probeer zo snel mogelijk de kleuren van 
elke toets te leren.
Als er na de oefening nog onduidelijkheden zijn, 
kun je vragen aan de proefleider stellen. 

Ter herinnering vind je de kleuren van de toetsen 
onder het toetsenbord terug. 

Leg nu je vingers klaar op de toetsen.
Start de oefensessie door op
enter te drukken. Succes!"; 											# met de text 'oefensessie'
		font_size = 35;};
		x = 0; y = 0;};								# in het midden van het scherm														
	response_active = true;  						# responsen komen door
} oefen4; 												# deze trial heet oefen

trial {													# trial define
	trial_duration=forever;	
	trial_type = specific_response;				# eerste response eindigt de trial				
	terminator_button=5;
	picture { 											# object is een picture
		text { caption = "Einde van de oefensessie.

De proefleider komt zo even binnen.
Als je nog vragen hebt, dan kun je die nu
aan de proefleider stellen.

Leg nu je vingers klaar op de toetsen.
Je krijgt vanaf nu geen feedback meer.
Start het experiment door op 
enter te drukken. Succes!"; 	# met de text 'einde van de oefensessie'
		font_size = 35;};
		x = 0; y = 0;};
	code = "start_experiment";										# in het middel van het scherm															
	response_active = true; 					   # responsen mogen nu doorkomen
} eindeoefen;											# deze trial heel eindeoefen

############################## fixatie
 trial {													# trial define
	trial_duration = 1000; 							# trial duur 1000 ms
	picture { text { caption = "*";}; 			# met de text '*'
		x = 0; y = 0;};
	code = "fix";
response_active = true;  							# in het midden van het scherm
} fix;  													# de trial heet fix

############################## feedback trials
trial {        # feedback trial
    start_delay = 200;
    picture { text { caption = "fout";}; 			# met de text 'fout'
		x = 0; y = 0;};
	code = "fout";
    time = 0;
    duration = 500;
} wrong_feedback;
trial {        # feedback trial
    start_delay = 200;
    picture { text { caption = "goed";}; 			# met de text 'fout'
		x = 0; y = 0;};
	code = "goed";
    time = 0;
    duration = 500;
} right_feedback;

trial {        # feedback trial only logfile
	trial_duration=450;	
   picture {};
	code = "fout";
} wrong;

trial {        # feedback trial only logfile
	trial_duration=450;	
   picture {};
	code = "goed";
} right;

trial {													# trial define
	trial_duration=forever;	
	trial_type = specific_response;				# eerste response eindigt de trial				
	terminator_button=5;
	picture { 											# object is een picture
		text { caption = "Dit was de oefening. 
Om te beginnen moet je minstens 13 keer
een goed antwoord geven. Dit is nog niet gelukt. 
Je mag nu nog een keer oefenen.

Leg nu je vingers klaar op de toetsen.
Start de oefening door op
enter te drukken. Succes!"; 	# met de text 'einde van de oefensessie'
		font_size = 35;};
		x = 0; y = 0;};
	code = "start_oefenhh";										# in het middel van het scherm															
	response_active = true; 					   # responsen mogen nu doorkomen
} herhaling;											# deze trial heel eindeoefen



##################################### play beep-sound
wavefile { filename = "beep.wav"; } beepwav; # filenaam van de wavfile geven en deze wavfile beepwav noemen								
trial {													# trial define
   sound { wavefile beepwav; } sound1;			# geluid van wavfile beepwav is sound1
	code = "beep";
} beep; 													# de trial heet beep

################# beep en fix samen

trial {											# 
	trial_type = first_response;
	trial_duration = 1000;
   picture fix1;
   time = 0;
   sound { wavefile beepwav; };
   time = 0;
	code = "fixbeep";
}fixbeep; 

########################################
#################################### photo's
trial {													# trial define
	trial_duration=2000;
	trial_type=fixed;
	picture { 											# het object is een picture
		text { caption = "Pauze";
		font_color = 255,90,255;}; 								# met de text 'druk op de knop om verder te gaan'
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "pauze";
	response_active = true;  						# responsen komen door
} breaks; 


trial {													# trial define
	trial_type = specific_response;
   terminator_button=5;								# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Leg je vingers weer klaar op de toetsen.
Ga verder met het experiment door op
enter te drukken. Succes!";								# met de text 'druk op de knop om verder te gaan'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "endpause";
	response_active = true;  						# responsen komen door
} endpause; 

trial {													# trial define
	trial_type = specific_response;
   terminator_button=5;								# specifies what responses, if any, will cause the trial to end
	trial_duration = forever;                 # the length of the trial in milliseconds      
	picture { 											# het object is een picture
		text { caption = "Leg je vingers weer klaar op de toetsen.
Ga verder met de oefensessie door op 
enter te drukken. Succes!";								# met de text 'druk op de knop om verder te gaan'
		font_size = 35;}; 
		x = 0; y = 0;};								# in het midden van het scherm														
	code = "endpause";
	response_active = true;  						# responsen komen door
} endbreak; 


################################# end-screen
trial {													# trial define
	trial_duration = 5000;                 # trial duur oneindig  
	picture { text { caption = "Einde van de taak";}; # picture met de text 'einde van het experiment'
		x = 0; y = 0;};								# in het midden van het scherm															# de correcte response is button 1
} einde;  												# de trial heet einde
