.model small
.code
org 100h  

    start:
        jmp mulai 
         
       nama           db 13,10,' Masukkan Nama Kamu Disini   : $'
       lanjut         db 13,10,'JIKA LANJUT TEKAN (Y) =  $'
       tampung_nama   db 30,?,30 dup(?)  
       masukkan       db 13,10,'Masukkan Nomor Solat: $'
      
daftar db 13,10,' __________________________________'
       db 13,10,'                                   '
       db 13,10,' +***LIAT JADWAL SHOLAT WAJIB DISINI***+'
       db 13,10,' __________________________________'
       db 13,10,' *                                *'
       db 13,10,' * NO| SOLAT                      *'
       db 13,10,' *________________________________*' 
       db 13,10,' *                                *'
       db 13,10,' * 1.| SUBUH                      *'
       db 13,10,' *________________________________*' 
       db 13,10,' *                                *'
       db 13,10,' * 2.| DHUHUR                     *'
       db 13,10,' *________________________________*'
       db 13,10,' *                                *'
       db 13,10,' * 3.| ASHR                       *'
       db 13,10,' *________________________________*'
       db 13,10,' *                                *'
       db 13,10,' * 4.| MAGHRIB                    *'
       db 13,10,' *________________________________*'
       db 13,10,' *                                *'
       db 13,10,' * 5.| ISYA                       *'
       db 13,10,' *________________________________*','$'
    mulai:
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx  
        
        mov ah,09h
	    mov dx,offset daftar
	    int 21h
	    mov ah,09h
	    mov dx,offset lanjut
	    int 21h
	    mov ah,01h
	    int 21h
	    cmp al,'y'
	    jmp proses
	    jne error_msg
error_msg:
        mov ah,09h
        mov dx,offset error_msg
        int 21h
        int 20h
proses:
        mov ah,09h
        mov dx,offset masukkan 
        int 21h
        mov ah,01
        int 21h
        mov bh,al
       
       
        cmp al,'1'
        je hasil1
        
        cmp al,'2'
        je hasil2
        
        cmp al,'3'
        je hasil3
        
        cmp al,'4'
        je hasil4
        
        cmp al,'5'
        je hasil5   
        
hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h
hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h
	
hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h  
hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h
       
;-----------------------------------------------------------------------------------------
teks1  db 13,10,' '
       db 13,10,'Kamu memilih No. 1 adalah Sholat SUBUH'
       db 13,10,'Waktu Sholat SUBUH : 03:48 WIB'
       db 13,10,'AYO JALANKAN SHALAT TEPAT WAKTU !!! $'
teks2  db 13,10,' '
       db 13,10,'Kamu memilih No. 2 adalah Sholat DHUHUR'
       db 13,10,'Waktu Sholat DHUHUR : 11.29 WIB'
       db 13,10,'AYO JALANKAN SHALAT TEPAT WAKTU !!!! $'
teks3  db 13,10,' '
       db 13,10,'Kamu memilih No 3 adalah Sholat ASYAR'
       db 13,10,'Waktu Sholat ASYAR : 14:54 WIB'
       db 13,10,'AYO JALANKAN SHALAT TEPAT WAKTU !!! $'
teks4  db 13,10,' '
       db 13,10,'Kamu memilih No 4 adalah Sholat MAGHRIB'  
       db 13,10,'Waktu Sholat MAGHRIB : 17:45 WIB'
       db 13,10,'AYO JALANKAN SHALAT TEPAT WAKTU !!! $'
teks5  db 13,10,' '
       db 13,10,'Kamu memilih No 5 adalah Sholat ISYA'
       db 13,10,'Waktu Sholat ISYA : 19:01 WIB'
       db 13,10,'AYO JALANKAN SHALAT TEPAT WAKTU !!! $'