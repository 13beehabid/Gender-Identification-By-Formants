function [ freq ] = gender( human,char )     %name of person as input,
                                        %his/her fundamental freq as output

Fs=11025;                               %sampling frequency

 if(char=='a')
     a=human(1:5513);
 end
 
 if(char=='e')
     a=human(11027:16539);
 end
 
 if(char=='i')
     a=human(22053:27565);
 end
 
 if(char=='o')
     a=human(33079:38591);
 end
 
 if(char=='u')
     a=human(44105:49617);
 end

                  

 lpf=[0.25 0.5 0.25];              %low pass filter to remve noise
 a=conv(a,lpf);


 
N=length(a);                        % Number of Samples
Ts=1/Fs;                            % Sampling time
Tmax=(N-1)*Ts;                      % Max time for Last sample to occur
t=0:Ts:Tmax;

subplot(2,1,1);                     %plot the time domain signal for 'a'
plot(t,a);
title('Time Domain');
xlabel('Seconds');
ylabel('Amplitude'); 


subplot(2,1,2);                     %set the frequency d omain axis
f=-Fs/2:Fs/(N-1):Fs/2;

four_a=fft(a);                      % DTFT
abs_four=abs(four_a);
plot(f,abs_four);
title('Freq Domain');
xlabel('omega');
ylabel('Amplitude');    % ploting |X(exp^jw)|
[max_val freq]=max(abs_four);       %note the max freq (1st formant)

                %set the threshold

if((char=='a')&&(freq>225))
    disp('FEMALE')
end

if((char=='a')&&(freq<225))
disp('MALE')
end

 if((char=='e')&&(freq<110))
          disp('MALE')
    end
     if((char=='e')&&(freq>110))
            disp('FEMALE')
     
     end
            if((char=='i')&&(freq<260))
                disp('MALE')
            end
            if((char=='i')&&(freq>260))
                disp('MALE')
            end
            if((char=='o')&&(freq>285))
                disp('FEMALE')
            end
            if((char=='o')&&(freq<285))
                disp('MALE')
            end
            if((char=='u')&&(freq<310))
                disp('MALE')
            end
            if((char=='u')&&(freq>310))
                disp('FEMALE')
            end
            
          