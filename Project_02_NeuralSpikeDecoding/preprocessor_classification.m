data = load("~/Workspace/ComputationalCognitiveScience/Project_02_NeuralSpikeDecoding/data/monkeydata.mat");
training_data = data.trial;

spike_count = NaN;
target = NaN;

for i = 1:98
    count =1;
    for k=1:8        
        for n=1:length(training_data)  
            tmax=600;
            spike_num=0;
            for t=1:tmax
                if training_data(n,k).spikes(i,t) == 1
                    spike_num = spike_num + 1;
                end
            end
            spike_count(count,i)= spike_num;
            target(count) = k;
            count = count +1;
        end
    end
end


save -6 data/classification/spike_count_600.mat spike_count