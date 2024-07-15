[data, Fs] = audioread ("C:\Users\86191\Desktop\The_Phoenix.mp3"); % 88 245
End = round (size (data, 1) * 88 / 245);
new_data = data (1 : End, :);
audiowrite ("表演音乐.wav", new_data, Fs);