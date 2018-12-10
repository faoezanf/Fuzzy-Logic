clc;clear all;

index = 1; %index perulangan
indexIntenR = 1; %index intensitas array myu rendah
indexIntenT = 1; %index intensitas array myu tinggi
indexKumpulan = 1; %index array kumpulan index kepala keluarga sementara

dataCsv = csvread("DataTugas2.csv",1);

while (index<101) %proses memasukkan data csv ke array
    pendapatan(index) = dataCsv(index,2);
    hutang(index) = dataCsv(index,3);
    index = index + 1;
end

index = 1;

while (index<101)
    %fuzzification pendapatan
    if (pendapatan(index) >= 0) && (pendapatan(index) <= 0.3)
        miuTurunA(index) = 1;
        miuNaikA(index) = 0;
        statusTurunA = 1;
        statusNaikA = 1;
    elseif (pendapatan(index) > 0.3) && (pendapatan(index) <= 1)
        miuTurunA(index) = RumusTurun(1,0.3,pendapatan(index));
        miuNaikA(index) = RumusNaik(1,0.3,pendapatan(index));
        statusTurunA = 1;
        statusNaikA = 2;
    elseif (pendapatan(index) > 1) && (pendapatan(index) <= 1.7)
        miuTurunA(index) = RumusTurun(1.7,1,pendapatan(index));
        miuNaikA(index) = RumusNaik(1.7,1,pendapatan(index));
        statusTurunA = 2;
        statusNaikA = 3;
    else
        miuTurunA(index) = 0;
        miuNaikA(index) = 1;
        statusTurunA = 3;
        statusNaikA = 3;
    end

    %fuzzification hutang
    if (hutang(index) >=0) && (hutang(index) <= 25)
        miuKecilB(index) = 1;
        miuBesarB(index) = 0;
        statusTurunB = 1;
        statusNaikB = 1;
    elseif (hutang(index) > 25) && (hutang(index) <= 50)
        miuKecilB(index) = RumusTurun(50,25,hutang(index));
        miuBesarB(index) = RumusNaik(50,25,hutang(index));
        statusTurunB = 1;
        statusNaikB = 2;
    elseif (hutang(index) > 50) && (hutang(index) <=75)
        miuKecilB(index) = RumusTurun(75,50,hutang(index));
        miuBesarB(index) = RumusNaik(75,50,hutang(index));
        statusTurunB = 2;
        statusNaikB = 3;
    else
        miuKecilB(index) = 0;
        miuBesarB(index) = 1;
        statusTurunB = 3;
        statusTurunB = 3;
        
    end

    %inference
    if ((statusTurunA == 1 && statusTurunB == 2) || (statusTurunA == 1 && statusTurunB == 3) || (statusTurunA == 2 && statusTurunB == 3))
        status1 = 100;
        if miuTurunA(index) < miuKecilB(index)
            intensitasStatus1 = miuTurunA(index);
        else
            intensitasStatus1 = miuKecilB(index);
        end
        arrayIntensitasTinggi(indexIntenT) = intensitasStatus1;
        indexIntenT = indexIntenT + 1;
    else
        status1 = 0; 
         if miuTurunA(index) < miuKecilB(index)
            intensitasStatus1 = miuTurunA(index);
         else
            intensitasStatus1 = miuKecilB(index);
         end
         arrayIntensitasRendah(indexIntenR) = intensitasStatus1;
         indexIntenR = indexIntenR + 1;
    end

    if ((statusTurunA == 1 && statusNaikB == 2) || (statusTurunA == 1 && statusNaikB == 3) || (statusTurunA == 2 && statusNaikB == 3))
        status2 = 100;
        if miuTurunA(index) < miuBesarB(index)
            intensitasStatus2 = miuTurunA(index);
        else
            intensitasStatus2 = miuBesarB(index);
        end
        arrayIntensitasTinggi(indexIntenT) = intensitasStatus2;
        indexIntenT = indexIntenT + 1;
    else
        status2 = 0;
         if miuTurunA(index) < miuBesarB(index)
            intensitasStatus2 = miuTurunA(index);
         else
            intensitasStatus2 = miuBesarB(index);
         end
         arrayIntensitasRendah(indexIntenR) = intensitasStatus2;
         indexIntenR = indexIntenR + 1;
    end

    if ((statusNaikA == 1 && statusTurunB == 2) || (statusNaikA == 1 && statusTurunB == 3) || (statusNaikA == 2 && statusTurunB == 3))
        status3 = 100;
        if miuNaikA(index) < miuKecilB(index)
           intensitasStatus3 = miuNaikA(index);
        else
           intensitasStatus3 = miuKecilB(index);
        end
        arrayIntensitasTinggi(indexIntenT) = intensitasStatus3;
        indexIntenT = indexIntenT + 1;
    else
        status3 = 0;
        if miuNaikA(index) < miuKecilB(index)
           intensitasStatus3 = miuNaikA(index);
        else
           intensitasStatus3 = miuKecilB(index);
        end
        arrayIntensitasRendah(indexIntenR) = intensitasStatus3;
        indexIntenR = indexIntenR + 1;
    end

    if ((statusNaikA == 1 && statusNaikB == 2) || (statusNaikA == 1 && statusNaikB == 3) || (statusNaikA == 2 && statusNaikB == 3))
        status4 = 100;
        if miuNaikA(index) < miuBesarB(index)
           intensitasStatus4 = miuNaikA(index);
        else
           intensitasStatus4 = miuBesarB(index);
        end
        arrayIntensitasTinggi(indexIntenT) = intensitasStatus4;
        indexIntenT = indexIntenT + 1;
    else
        status4 = 0;
        if miuNaikA(index) < miuBesarB(index)
           intensitasStatus4 = miuNaikA(index);
        else
           intensitasStatus4 = miuBesarB(index);
        end
        arrayIntensitasRendah(indexIntenR) = intensitasStatus4;
        indexIntenR = indexIntenR + 1;
    end

    if (status1 ~= 0 && status2 ~= 0 && status3 ~= 0 && status4 ~= 0)
        statusAkhir = 100;
        intensitasTinggi = min(arrayIntensitasTinggi);
        intensitasRendah = 0;
    elseif (status1 ~= 100 && status2 ~= 100 && status3 ~= 100 && status4 ~= 100)
        statusAkhir = 0;
        intensitasRendah = max(arrayIntensitasRendah);
        intensitasTinggi = 0;
    else
        statusAkhir1 = 0;
        statusAkhir2 = 100;
        intensitasRendah = max(arrayIntensitasRendah);
        intensitasTinggi = min(arrayIntensitasTinggi);
    end
    
    %defuzzification
    y = (50*intensitasRendah) + (80*intensitasTinggi);
    y = y / (intensitasRendah + intensitasTinggi);

    
    if (y>50)
        if(indexKumpulan==21) %jika array solusi sudah lebih dari 20, maka akan mereplace nilai di array tersebut yang paling kecil
            j=1;
            while(j<21)
                if(y > kumpulanYterbaik(j))
                   indexTerkecil = j;
                end
                j = j + 1;
            end
            if exist('indexTerkecil')
                kumpulanYterbaik(indexTerkecil) = y;
                kumpulanTerbaik(indexTerkecil) = index;
                clear indexTerkecil;
            end
        else
            kumpulanTerbaik(indexKumpulan) = index;
            kumpulanYterbaik(indexKumpulan) = y;
            indexKumpulan = indexKumpulan + 1;
        end
    end   
    clear arrayIntensitasRendah; %pe-reset-an array agar isi array tersebut kosong
    clear arrayIntensitasTinggi; %pe-reset-an array agar isi array tersebut kosong
    indexIntenR = 1; %pe-reset-an nilai index arrayIntensitasRendah
    indexIntenT = 1; %pe-reset-an nilai index arrayIntensitasTinggi
    index = index + 1;
end

index = 1;
while(index<21) % menampilkan hasil fuzzy logic di program
    show = [index kumpulanTerbaik(index) kumpulanYterbaik(index)];
    disp(show);
    index=index+1;
end

% menampilkan hasil fuzzy logic menjadi file csv
data = [kumpulanTerbaik'];
datasorted = sort(data);
xlswrite('TebakanTugas2.xlsx',datasorted);