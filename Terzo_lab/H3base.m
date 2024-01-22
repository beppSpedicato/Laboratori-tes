function result = H3base(x, h, Fs, label)
    % Funzioni
    spettro_di_energia = @(X) abs(X).^2;

    % Segnale filtrato tramite porta
    x_filtered = conv(x, h);
    result = x_filtered;

    XFF = fft(x_filtered); % dft uscita
    XFI = fft([x' zeros(length(x_filtered) - length(x), 1)']'); % dft ingresso
    HF = spettro_di_energia(fftshift(XFF ./ XFI));
    
    % plot grafici
    spettro_x = spettro_di_energia(x);
    spettro_x_filtered = spettro_di_energia(x_filtered);
    t_f = linspace(0, length(x_filtered)/Fs, length(x_filtered));

    figure;
    subplot(3,1,1);
    plot(linspace(-length(x_filtered)/(2*Fs), length(x_filtered)/(2*Fs), length(x_filtered)), HF);
    title(['Spettro Funzione di trasferimento H(f)' label]);
    xlabel('Frequenza Hz');
    ylabel('Ampiezza');
    
    subplot(3,1,2);
    plot(t_f, [spettro_x' zeros(1, length(x_filtered)-length(x))]' );
    title(['Spettro Segnale di Input' label]);
    xlabel('Tempo (s)');
    ylabel('Ampiezza');
    
    subplot(3,1,3);
    plot(t_f, spettro_x_filtered);
    title(['Spettro Segnale Filtrato' label]);
    xlabel('Tempo (s)');
    ylabel('Ampiezza');
    grid on;
end
