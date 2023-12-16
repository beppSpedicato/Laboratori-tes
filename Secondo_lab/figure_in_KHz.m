function result = figure_in_KHz(X, fc, titleString, ylabelString, color)
    N = length(X);
    f_Hz = linspace(-fc/2, fc/2, N);
    f_kHz = f_Hz / 1000;
    figure;
    stem(f_kHz, X, color);
    ylabel(ylabelString);
    title(string(titleString));
    xlabel('Frequenza in KHz');
    grid on;
end
