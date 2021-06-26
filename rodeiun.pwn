						//--------------------------------------------------------------------------------------//
						//======================================================================================//
						//===========================Rodeiun DM Server Mod v0.1=================================//
						//======0.3dl SA:MP sürümüyle uyumlu olan Deathmatch modudur, tüm haklarý saklýdýr.=====//
						//======================================================================================//
						//--------------------------------------------------------------------------------------//


#include <a_samp>
//#include <pause>
#include <fix>
#include <a_mysql>
#include <streamer>
///#include <sampac>
//#include <nex-ac>
#include <YSF>
#include <sqlitei>
#include <sscanf2>
//#include <izcmd>
#include <antisurf>
#include <MV_Youtube>
#include <Pawn.RakNet>
//#include "Anti_cheat_pack.inc"
#include <FCNPC>
#include <streamer>
#include <YSI\y_iterate>
#include <YSI\y_bit>
///#include "AntiTeleport.inc"
#include <foreach>
//#include <weapon-config>
//#include <dialogs>
//#include <SKY>
#include <easyDialog>
#include <string>
#include <mSelection>
//#include <progress2>
#include <zcmd>
#include <cuffs>
#include <garage_block>
#include <EVF>
#include <AFK>

#pragma tabsize 0

AntiDeAMX()
{
	new rod[][] =
	{
		"Unarmed (Fist)",
		"Brass K"
	};
	#pragma unused rod
}

WasteDeAMXersTime()
{
    new rode;
    #emit load.pri rode
    #emit stor.pri rode
}

new paydayodul;

new Float:TeamAPos[3][4];
new Float:TeamBPos[3][4];

//----------------------------------------------------------
#define HAPIS_X             259.9107
#define HAPIS_Y             2943.5591
#define HAPIS_Z             2.7134
#define HAPIS_A             93.9906
#define SPAWN_X             2236.1191
#define SPAWN_Y             1678.5986
#define SPAWN_Z             1008.3594

#define GECERSIZ            -1
#define ICON_CONNECT        200
#define ICON_DISCONNECT     201

#define KAYITT 3324
#define jail 3209
#define tdm 3916
#define dm 2006
#define MUTEDD 1384
#define ipcakisma 0934
#define admpanel 4884
#define samx 8448

#define  PAUSE_LIMIT (3)
#define BULLET_HIT_TYPE_NONE            0
#define BULLET_HIT_TYPE_PLAYER          1
#define BULLET_HIT_TYPE_VEHICLE         2
#define BULLET_HIT_TYPE_OBJECT          3
#define BULLET_HIT_TYPE_PLAYER_OBJECT   4
#define GREEN 				0x21DD00FF
#define RED 				0xE60000FF
#define ADMIN_RED 			0xFB0000FF
#define YELLOW 				0xFFFF00FF
#define ORANGE 				0xF97804FF
#define LIGHTRED 			0xFF8080FF
#define LIGHTBLUE 			0x00C2ECFF
#define PURPLE 				0xB360FDFF
#define BLUE 				0x1229FAFF
#define LIGHTGREEN 			0x38FF06FF
#define DARKPINK 			0xE100E1FF
#define NICESKY 			0x99FFFFAA
#define GRAY 				0xCECECEFF
#define COLOR_WHITE 		0xFFFFFFFF
#define COLOR_NORMAL_PLAYER 0xFFBB7777
#define COLOR_FADE1 0xFFFFFFFF
#define COLOR_FADE2 0xC8C8C8C8
#define COLOR_FADE3 0xAAAAAAAA
#define COLOR_FADE4 0x8C8C8C8C
#define COLOR_FADE5 0x6E6E6E6E
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_LIGHTGREEN  0x9ACD32FF
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
//#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_RED 0xAA3333AA
#define COLOR_LIME 0x10F441AA
#define COLOR_MAGENTA 0xFF00FFFF
#define COLOR_NAVY 0x000080AA
#define COLOR_AQUA 0xF0F8FFAA
#define COLOR_CRIMSON 0xDC143CAA
#define COLOR_RADIO       (0x8D8DFFFF)
#define COLOR_PURPLE      (0xD0AEEBFF)
#define COLOR_FLBLUE 0x6495EDAA
#define COLOR_BISQUE 0xFFE4C4AA
#define COLOR_BLACK 0x000000AA
#define COLOR_CHARTREUSE 0x7FFF00AA
#define COLOR_BROWN 0XA52A2AAA
#define COLOR_CORAL 0xFF7F50AA
#define COLOR_GOLD 0xB8860BAA
#define COLOR_GREENYELLOW 0xADFF2FAA
#define COLOR_INDIGO 0x4B00B0AA
#define COLOR_IVORY 0xFFFF82AA
#define COLOR_LAWNGREEN 0x7CFC00AA
#define COLOR_LIMEGREEN 0x32CD32AA
#define COLOR_MIDNIGHTBLUE 0X191970AA
#define COLOR_MAROON 0x800000AA
#define COLOR_OLIVE 0x808000AA
#define COLOR_ORANGERED   (0xFF4500AA)
#define COLOR_PINK        (0xFFC0CBAA)
#define COLOR_SEAGREEN 	  (0x2E8B57AA)
#define COLOR_SPRINGGREEN (0x00FF7FAA)
#define COLOR_LIGHTRED    (0xE74C3CFF)
#define COLOR_CLIENT      (0xAAC4E5FF)
#define COLOR_CYAN        (0xC2A2DAAA)
#define COLOR_ADMINCHAT   (0xAA3333AA)
#define COLOR_DEPARTMENT  (0xF0CC00FF)
#define COLOR_DARKBLUE    (0x1394BFFF)

#undef MAX_PLAYERS
#define MAX_PLAYERS 100
/*#define SQL_HOST "localhost"
#define SQL_USER "root"
#define SQL_PASS ""
#define SQL_DB ""*/


#define MAX_PING 700
#define MAX_CAR_SPEED 450

#define MAX_BIRLIK 100
#define MAX_DM_AREA 10
#define MAX_DM_UYE 30
#define MAX_DUELLO 30
#define MAX_TDM_UYE 30
#define MAX_FREEROAM 5
#define MAX_FREEROAM_UYE 100
#define MAX_RAPOR 100
#define MAX_VEHICLE 100
#define KillOdul 100
#define VIPEKS 50


new const g_aWeaponSlots[] =
{
	0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, 0, 0, 0, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
};

new Float:_oldHealth, Float:_oldArmour;

new Timerxx[MAX_PLAYERS];
///new MySQL:sqlconnection;
new bool:YarismaDurum;
new TahminSayi;
new TahminOdul;
new	bool:Ikide[MAX_PLAYERS];
new	bool:Ucte[MAX_PLAYERS];
new	bool:Dortte[MAX_PLAYERS];
new	bool:Beste[MAX_PLAYERS];
new	bool:KOSKoruma[MAX_PLAYERS]; // true = Aktif, false = De-Aktif
new	bool:Hapiste[MAX_PLAYERS];
new bool:Godmode[MAX_PLAYERS];
new bool:Muted[MAX_PLAYERS];


// ARENA == MAP OLAN KARÞILAYICI EV SAHÝBÝ
// AREA == DM AREALAR
#define MAX_ARENA 100
enum arenaData
{
	Exists,
	ID,
	arenaName[15],
	arenaMember, // arenadaki aktif üye sayýsý
	arenaKatilma, // katýlýp katýlamayacaðýlaðý[ 0 = kapalý | 1 = açýk ]
	arenaHS // headshot açýkmý kapalýmý [ 0 = kapalý | 1 = açýk ]
}
new Arena[MAX_ARENA][arenaData];
///new Float:arenaSpawnX[MAX_ARENA][10];
///new Float:arenaSpawnY[MAX_ARENA][10];
///new Float:arenaSpawnZ[MAX_ARENA][10];

enum Vote
{
	bool:Baslatildi,
	oSoru[50],
	oSecenek1[20],
	oSecenek2[20],
	oSayi[2],
	oTimer
}
new Oylama[Vote];
new oyKullandi[MAX_PLAYERS];
new oySoru[MAX_PLAYERS][50];
new oySecenek[MAX_PLAYERS][20];
#define DIALOG_OYLAMABASLAT 9995 // Oylama Dialog ID. Mod ile çakýþýrsa buradan deðiþtirebilirsiniz.
#define DIALOG_OYLAMABASLAT2 9996
#define DIALOG_OYLAMABASLAT3 9997
#define DIALOG_OYLA 9999
#define OYLAMA_TIMER 60 // Lütfen oylamanýn biteceði süreyi girin. Süre saniye þeklinde olmalýdýr.

#define TDMID 9999
enum pData
{
	SQLID[5],
	Kaydoldu,
	bool:pSpawned,
	pSonOldurme,
	pSonOlduren,
	pArmour,
	CokluIzin,
	oynamaSaati,
	topOldurme,
	bool:nameTag,
	topOlme,
	PayDaySure,
	pHealth,
	pSonOldurmeZaman,
	pSonOlmeZaman,
	SonHasarVermeZaman, // milisaniye biçiminden
	SonHasarAlmaZaman,
	AdmLevel, // MAKS 3
	DJLevel, // MAKS. 3
	pGuns[13],
	pAmmo[13],
	Oyun, // oynadýðý oyun [0 = DM | 9999 = TDM | 2 = Freeroam | 3 = Düello | -1 = Lobi]
	pSonPM,
	pTDMTakimID, // 0 = A | 1 = B
	OdaID, // TDMID == TDM oynuyor. -1 = lobi
	Skor[11], // Skor - Level
	Para[11],
	Sifre[24],
	Isim[24],
	pVip, // 0 = Yok, 1 = VÝP
	HapisSure, // dakika biçiminden hapis süresi
	HapisSebep[50],
	HapisAtan[24],
	MuteSure,
	Ayarlar[6], // 0. deðer mesela bildirimler deðeri 0 ise kapalý gibi.
	MuteSebep[50],
	MuteAtan[24],
	Warning, // warn sayýsý
	Float:KD,
	OldurmeDM,
	OlmeDM,
	OldurmeTDM,
	OlmeTDM,
	Birligi,
	BirlikRutbe
}

new PlayerData[MAX_PLAYERS][pData];
new balonda[MAX_PLAYERS],balonobje[MAX_PLAYERS],balonates[MAX_PLAYERS][2],timerler[MAX_PLAYERS][6];
new balonkontrol[MAX_PLAYERS];
#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define GEREKEN_SKOR 150 // Balon oluþturmak için gereken skordur. '0' yazarsanýz skor istemez.
new PlayerText:StatikTD[MAX_PLAYERS];
new Skin[MAX_PLAYERS];
new bool:DisableAC[MAX_PLAYERS];
new bool:DisableVAC[MAX_VEHICLE];
new Float:PosP[MAX_PLAYERS][4];
new Float:EskiPos[MAX_PLAYERS][3]; // teleport hack için
new Interior[MAX_PLAYERS];
new VW[MAX_PLAYERS];

//====================//
forward GostergeYenile();
//====================//
new HGS;
new Gosterge[MAX_PLAYERS];

new Text: GostergeYazi[MAX_PLAYERS];
new Text: Hizg[MAX_PLAYERS];
new Text: Cang[MAX_PLAYERS];
new Text: Cizgi;
new Text: ArkaPlan0;
new Text: ArkaPlan1;
new Text: ArkaPlan2;
new Text: ArkaPlan3;
new Text: ArkaPlan4;
new Text: ArkaPlan5;
new Text: ArkaPlan6;

new Text:SaatBox;
new Text:Saat;
new Text:Tarih;
new Text:Cizgix;

new Float: KMH;
new Float: Yukseklik;
new Float: Xa;
new Float: Ya;
new Float: Za;
new Float: Xb[MAX_PLAYERS];
new Float: Yb[MAX_PLAYERS];
new Float: Zb[MAX_PLAYERS];

new ArIsim[][] = // Not made by me
{
    	"Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
        "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
        "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    	"Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
        "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
        "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
        "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
        "Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
        "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
        "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
        "Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
        "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
        "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
        "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
        "Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin",
        "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
        "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
        "Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
        "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
        "Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
        "Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
		"Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
        "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
        "Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
        "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    	"Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
        "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
        "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
        "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
        "Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
        "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
        "Tiller", "Utility Trailer"
};
///new PlayerText3D:TDMTakimLabel[MAX_PLAYERS][300];
///new PlayerText3D:DMTakimLabel[MAX_PLAYERS][300];

/*
Ayarlar deðiþkeni için;
0 = Sohbet Kanalý,
1 = PM,
2 = Ceza bildirimleri,
3 = Local Kanalý,
4 = Birlik Kanalý,
5 = Admin Kanalý.

Öncelikle oyun modunda 4 farklý oyun türü bulunmakta bunlar; DM, TDM, Freeroam, Düello.
TDM modunda 2 adet takým bulunur bu 2 takým A takýmý ve B takýmý olarak adlandýrýlýr, A takýmý Beyaz, B takýmý Siyah.
DM modunda ise farklý farklý arenalar bulunmakta.
Mute, Jail, Kick gibi ceza-i iþlem alternatifleri bulunmakta.
BAN sistemi eklenmedi ban atmak için 9999999999999 dk jail atabilirsiniz.
Anti-Hile sistemi çok güçlü deðil þuanlýk, ancak SAMPAC kontrolu getirildiðinde anti-hile eklentileri güçlendirilecek.

*/
enum dData
{
	DuelloID,
	DuelloOyuncular[2],
	DuelloExists,
	DuelloSilah1,
	DuelloSilah2,
	DuelloSilah3,
	DuelloSilah4,
	DuelloCan,
	DuelloZirh,
	DuelloMap,
	DuelloInt
}
new Duello[MAX_DUELLO][dData];

enum rData
{
	rExists,
	rID,
	rGonderen[3],
	rIcerik[256]
}
///new RaporData[MAX_RAPOR][rData];

/*
new Float:RandomDMS1[][] =
{
	{0.0000, 0.0000, 0.0000, 0.0000},
	{0.0000, 0.0000, 0.0000, 0.0000},
	{0.0000, 0.0000, 0.0000, 0.0000},
	{0.0000, 0.0000, 0.0000, 0.0000},
	{0.0000, 0.0000, 0.0000, 0.0000},
	{0.0000, 0.0000, 0.0000, 0.0000}
};

new sira[MAX_DM_UYE] = random(RandomDMS1[]);
SetPlayerPos(playerid, RandomDMS1[sira][0], RandomDMS1[sira][1], RandomDMS1[sira][2]);
SetPlayerFacingAngle(playerid, RandomDMS1[sira][3]);*/

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;
new Text:Textdraw4;
new Text:Textdraw5;
new Text:Textdraw6;


stock RandomEx(min, max)
	return random(max - min) + min;

new Float:arenaspawn[][] =
{
	{0.1111, 0.2222, 0.3333, 0.4444},
	{1.1111, 1.2222, 1.3333, 1.4444},
	{2.1111, 2.2222, 2.3333, 2.4444},
	{3.1111, 3.2222, 3.3333, 3.4444},
    {4.1111, 4.2222, 4.3333, 4.4444},
    {5.1111, 5.2222, 5.3333, 5.4444},
    {6.1111, 6.2222, 6.3333, 6.4444},
    {7.1111, 7.2222, 7.3333, 7.4444},
   	{8.1111, 8.2222, 8.3333, 8.4444}
};

new sira[MAX_PLAYERS];
/*
	sira[playerid] = random(arenaspawn[]);
	SetPlayerPos(playerid, arenaspawn[sira][0], arenaspawn[sira][1], arenaspawn[sira][2]);
	SetPlayerFacingAngle(playerid, arenaspawn[sira][3]);
*/

new BilgiMSG[][] =
{
	{"Discord adresimizi ziyaret ederek detaylý bilgilere ulaþabilirsiniz."},
	{"Sað kýsýmda bulunan kýsýmdan bilgilerinizi görebilirsiniz."},
	{"Detaylý karakter bilgileriniz için '/stats'."},
	{"Komut listesini görmek için '/yardim'."},
	{"Aktif yetkililere soru sormak için veya oyuncu þikayet etmek için '/rapor'."},
	{"Aktif yetkilileri görmek için '/admins'."},
	{"Ýstek þarký göndermek için '/isteksarki'."},
	{"Aktif DJ'leri görmek için '/djs'."},
	{"Yapýmcýlarý görmek için '/credits'."}
};


enum dmData
{
 	dmUyesayi[3],
 	dmOyuncular,
 	dmExists,
	dmID,
	dmGuns[13],
	dmArenaID,
	dmBir, // birinci
	dmIki, // ikinci
	dmUc
}
new Deathmatch[MAX_DM_AREA][dmData];

enum tdmData
{
	tdmGuns[13],
	tdmT1olme,
	tdmT2olme,
	tdmT1oldurme,
	tdmT2oldurme
}
new TDeathmatch[tdmData];

new aTeamSayi; // a takýmýnda kaç kiþinin olduðunu gösterir.
new bTeamSayi; // b takýmýnda kaç kiþinin olduðunu gösterir. 512

enum araclarr
{
	aracExists,
	aracModel,
	aracInt,
	aracVW,
	aracMapID,
	Text3D:aracText[150],
	aracSahip,
	aracHP,
	aracPos[3],
	aracID
}
new Arac[MAX_VEHICLE][araclarr];

//----------------------------------------------------------

main()
{
	print("\n---------------------------------------");
	print("Rodeiun DM Server - By Rodeiun.\n");
	print("---------------------------------------\n");
}

//----------------------------------------------------------
stock ReturnName(playerid)
{
	static name[ MAX_PLAYER_NAME + 1 ];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}
stock SendClientMessageEx(playerid, color, const text[], {Float, _}:...)
{
	static
	    args,
	    strx[144];

	/*
     *  Custom function that uses #emit to format variables into a string.
     *  This code is very fragile; touching any code here will cause crashing!
	*/
	if ((args = numargs()) == 3)
	{
	    SendClientMessage(playerid, color, text);
	}
	else
	{
		while (--args >= 3)
		{
			#emit LCTRL 5
			#emit LOAD.alt args
			#emit SHL.C.alt 2
			#emit ADD.C 12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S text
		#emit PUSH.C 144
		#emit PUSH.C strx
		#emit PUSH.S 8
		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		SendClientMessage(playerid, color, strx);

		#emit RETN
	}
	return 1;
}
stock MesajGonder(playerid, text[])
{
	SendClientMessageEx(playerid, COLOR_GREEN, "[R-DM] {FFFFFF} %s", text);
	return 1;
}
stock BilgiMesajGonder(playerid, text[])
{
	SendClientMessageEx(playerid, COLOR_LIGHTBLUE, "[R-DM]  {FFFFFF} %s", text);
	return 1;
}
stock HataMesajGonder(playerid, text[])
{
	SendClientMessageEx(playerid, COLOR_RED, "[R-DM] {FFFFFF} %s", text);
	return 1;
}
stock Kullanilabilir(playerid)
{
	new count = 0;
	if(PlayerData[playerid][Kaydoldu] == 0)
	    count++;
	if(!PlayerData[playerid][pSpawned])
	    count++;
	if(Hapiste[playerid])
	    count++;
	if(count != 0)
	    return false;
	if(count == 0)
        return true;
	return 0;
}
/*
Ayarlar deðiþkeni için;
0 = Sohbet Kanalý,
1 = PM,
2 = Ceza bildirimleri,
3 = Local Kanalý,
4 = Birlik Kanalý,
5 = Admin Kanalý.
*/
stock SendAdminAlert(text[])
{
	foreach(new i:Player)
	{
	    if(IsPlayerConnected(i))
		{
		    if(PlayerData[i][AdmLevel] != 0)
			{
				if(PlayerData[i][Ayarlar][5] == 1)
				{
		    		SendClientMessageEx(i, COLOR_ADMINCHAT, "ADM: {FFFFFF} %s", text);
				}
			}
		}
	}
	return 1;
}
stock YetersizSeviye(playerid, seviye, type)
{
	new x[10];
	switch(type)
	{
	    case 0: format(x, 10, "Admin");
	    case 1: format(x, 10, "DJ");
	}
	new std[750];
	format(std, 750, "{FF0000}Bu komutu kullanmak için en az {CCCCCC}'%d'{FF0000} level {CCCCCC}'%s' {FF0000}olmalýsýnýz.", seviye, x);
	HataMesajGonder(playerid, std);
	return 1;
}
HM(color, msg[])
{
    foreach(new i : Player)
    {
    	if(IsPlayerConnected(i))
		{
	        if(PlayerData[i][Ayarlar][0] == 1)
	        {
		        if(strlen(msg) > 64)
		        {
		            SendClientMessageEx(i, color, msg);
		            SendClientMessageEx(i, color, "..%s", msg[64]);
		        }
		        else SendClientMessageEx(i, color, msg);
			}
		}
    }
    return 1;
}
/*
Ayarlar deðiþkeni için;
0 = Sohbet Kanalý,
1 = PM,
2 = Ceza bildirimleri,
3 = Local Kanalý,
4 = Birlik Kanalý,
5 = Admin Kanalý.
*/
HileKullaniyo(playerid, tur[], islem)
{
	// islem = [0 = Kick, 1 = Hapis]
	new xas[15];
	switch(islem)
	{
	    case 0: format(xas, 15, "Kick");
	    case 1: format(xas, 15, "Hapis");
	}
	foreach(new i : Player)
	{
 		if(IsPlayerConnected(i))
		{
			if(PlayerData[i][AdmLevel] != 0)
			{
			    if(PlayerData[i][Ayarlar][5] == 1)
			    {
				    new strq[1600];
				    format(strq, 1600, "Hile Uyarýsý! Kullanan:{CCCCCC}%s(%d){FF0000} Hile Türü: {CCCCCC}%s {FF0000} Uygulanan Ýþlem: {CCCCCC}%s", ReturnName(playerid), playerid, tur, xas);
					SendClientMessageEx(i, COLOR_RED, strq);
				}
			}
		}
	}
	switch(islem)
	{
	    case 0: Kick(playerid);
	    case 1: cmd_jail(INVALID_PLAYER_ID, playerid, 60, "Hile Kullanýmý");
	}
	return 1;
}
stock GiveVehicleHP(vehicleid, amount)
{
	DisableVAC[vehicleid] = true;
	new Float:HP;
	GetVehicleHealth(vehicleid, HP);
	SetVehicleHealth(vehicleid, HP+amount);
	Arac[vehicleid][aracHP] += amount;
	DisableVAC[vehicleid] = false;
	return 1;
}
stock SetVehicleHP(vehicleid, amount)
{
	DisableVAC[vehicleid] = true;
	new Float:HP;
	SetVehicleHealth(vehicleid, amount);
	Arac[vehicleid][aracHP] = amount;
	DisableVAC[vehicleid] = false;
	return 1;
}
stock GetVehicleHP(vehicleid)
	return Arac[vehicleid][aracHP];
stock GetHealth(playerid)
	return PlayerData[playerid][pHealth];
stock GetArmour(playerid)
	return PlayerData[playerid][pArmour];
stock SetHealth(playerid, amount)
{
	DisableAC[playerid] = true;
	SetPlayerHealth(playerid, amount);
	PlayerData[playerid][pHealth] = amount;
	DisableAC[playerid] = false;
	return 1;
}
stock SetArmour(playerid, amount)
{
	DisableAC[playerid] = true;
	SetPlayerArmour(playerid, amount);
	PlayerData[playerid][pArmour] = amount;
	DisableAC[playerid] = false;
	return 1;
}
stock GiveHealth(playerid, amount)
{
	DisableAC[playerid] = true;
	SetPlayerHealth(playerid, GetPlayerHealth(playerid) + amount);
	PlayerData[playerid][pHealth] += amount;
	DisableAC[playerid] = false;
	return 1;
}
stock GiveArmour(playerid, amount)
{
	DisableAC[playerid] = true;
	SetPlayerArmour(playerid, GetPlayerArmour(playerid) + amount);
	PlayerData[playerid][pArmour] += amount;
	DisableAC[playerid] = false;
	return 1;
}
stock HealthHackControl(playerid)
{
	new count = 0;
	if(DisableAC[playerid] == false)
	{
		new Float:HP, Float:ZR;
		GetPlayerArmour(playerid, ZR);
		GetPlayerHealth(playerid, HP);
	    if(HP != PlayerData[playerid][pHealth]) count++;
	    if(ZR != PlayerData[playerid][pArmour]) count++;
	}
	if(count != 0) HileKullaniyo(playerid, "Can & Zýrh Hilesi", 0);
	return 1;
}
stock GetWeaponModel(weaponid) {
    new const g_aWeaponModels[] = {
		0, 331, 333, 334, 335, 336, 337, 338, 339, 341, 321, 322, 323, 324,
		325, 326, 342, 343, 344, 0, 0, 0, 346, 347, 348, 349, 350, 351, 352,
		353, 355, 356, 372, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366,
		367, 368, 368, 371
    };
    if (1 <= weaponid <= 46)
        return g_aWeaponModels[weaponid];

	return 0;
}
stock SilahSifirla(playerid)
{
	DisableAC[playerid] = true;
	for(new i = 0; i < 13; i++)
	{
		PlayerData[playerid][pGuns][i] = 0;
		PlayerData[playerid][pAmmo][i] = 0;
	}
	ResetPlayerWeapons(playerid);
	
	DisableAC[playerid] = false;
	return 1;
}
stock SilahVer(playerid, weaponid, ammo)
{
	DisableAC[playerid] = true;
	if (weaponid < 0 || weaponid > 46)
	    return 0;
	PlayerData[playerid][pGuns][g_aWeaponSlots[weaponid]] = weaponid;
	PlayerData[playerid][pAmmo][g_aWeaponSlots[weaponid]] += ammo;
	GivePlayerWeapon(playerid, weaponid, ammo);
	DisableAC[playerid] = false;
	return 1;
}
stock WeaponHackControl(playerid)
{
	new count = 0;
	if(DisableAC[playerid] == false)
	{
	    new weapons[13], ammo[13];
	    for(new i = 0; i < 13; i++)
		{
			GetPlayerWeaponData(playerid, i, weapons[i], ammo[i]); // playerid, slot, weaponid, ammo
			if(PlayerData[playerid][pGuns][i] != weapons[i]) count++;
			if(PlayerData[playerid][pAmmo][i] != ammo[i]) count++;
		}
	}
	if (GetPlayerWeapon(playerid) == 35 || GetPlayerWeapon(playerid) == 36 || GetPlayerWeapon(playerid) == 37 || GetPlayerWeapon(playerid) == 38)
	    count++;
	if(count != 0)
	{
		HileKullaniyo(playerid, "Silah Hilesi", 0);
	}
	return 1;
}
stock PosDegistir(playerid, Float:xPos, Float:yPos, Float:zPos)
{
		DisableAC[playerid] = true;
		SetPlayerPos(playerid, xPos, yPos, zPos);
		PosP[playerid][0] = xPos;
		PosP[playerid][1] = yPos;
		PosP[playerid][2] = zPos;
		DisableAC[playerid] = false;
}
stock TeleportHackControl(playerid)
{
	if(DisableAC[playerid] == true)
	{
	    new Float:Poslar[3];
	    GetPlayerPos(playerid, Poslar[0], Poslar[1], Poslar[2]);
		for(new i = 0; i < 3; i++)
		{
		    if(Poslar[i] != PosP[playerid][i])
				HileKullaniyo(playerid, "Teleport Hack", 0);
		}
	}
}
stock Car_Nearest(playerid)
{
	static
	    Float:fX,
	    Float:fY,
	    Float:fZ;

	for (new i = 0; i != MAX_VEHICLE; i ++)
	{
		if (Arac[i][Exists])
		{
			GetVehiclePos(Arac[i][aracID], fX, fY, fZ);
			if (IsPlayerInRangeOfPoint(playerid, 4.0, fX, fY, fZ))
			{
			    return Arac[i][aracID];
			}
		}
	}
	return -1;
}
stock OyunAdi(playerid)
{
	new isim[20];
    // oynadýðý oyun [0 = DM | 9999 = TDM | 2 = Freeroam | 3 = Düello | -1 = Lobi]
	switch(PlayerData[playerid][Oyun])
	{
	    case 0: format(isim, 20, "Deathmatch");
	    case TDMID: format(isim, 20, "Team Deathmatch");
		case 2: format(isim, 20, "Freeoram");
		case 3: format(isim, 20, "Düelloda");
		case -1: format(isim, 20, "Lobi");
	}
	return isim;
}
stock ReturnOdaIsim(playerid)
{
	new isim[20];
 	if(PlayerData[playerid][OdaID] == -1)
		format(isim, 20, "Lobi");
	if(PlayerData[playerid][OdaID] == TDMID)
		format(isim, 20, "TDM");
   if(PlayerData[playerid][OdaID] != -1 || PlayerData[playerid][OdaID] != TDMID)
		format(isim, 20, "%d", PlayerData[playerid][OdaID]);
	return isim;
}
stock AracinÝcindekiler(vid)
{
	foreach(new i:Player)
	{
	    if(PlayerData[i][pSpawned])
		{
			if(GetPlayerVehicleID(i) == vid)
				return i;
		}
	}
	return 1;
}
stock GetNearestVehicle(playerid)
{
	static
	    Float:fX,
	    Float:fY,
	    Float:fZ;

	for (new i = 1; i != MAX_VEHICLE; i ++) if (IsValidVehicle(i) && GetVehiclePos(i, fX, fY, fZ))
	{
	    if (IsPlayerInRangeOfPoint(playerid, 3.5, fX, fY, fZ)) return i;
	}
	return INVALID_VEHICLE_ID;
}

stock GetSkin(playerid) return Skin[playerid];
stock SetSkin(playerid, skinid)
{
	DisableAC[playerid] = true;
	SetPlayerSkin(playerid, skinid);
	Skin[playerid] = skinid;
	DisableAC[playerid] = false;
	return 1;
}
stock SkinHackControl(playerid)
{
	if(DisableAC[playerid] == false)
	{
	    new xasd = GetPlayerSkin(playerid);
	    if(xasd != Skin[playerid])
	        HileKullaniyo(playerid, "Skin Hack", 0);
	}
	return 1;
}
stock GiveScore(playerid, amount)
{
	DisableAC[playerid] = true;
	PlayerData[playerid][Skor] = PlayerData[playerid][Skor] + amount;
	SetPlayerScore(playerid, PlayerData[playerid][Skor] + amount);
	DisableAC[playerid] = false;
	return 1;
}
stock GetScore(playerid) return PlayerData[playerid][Skor];
stock SetScore(playerid, amount)
{
	DisableAC[playerid] = true;
	PlayerData[playerid][Skor] = PlayerData[playerid][Skor] - PlayerData[playerid][Skor];
	PlayerData[playerid][Skor] = amount;
	GiveScore(playerid, -GetScore(playerid));
	GiveScore(playerid, amount);
	DisableAC[playerid] = false;
	return 1;
}
stock SkorSifirla(playerid)
{
	DisableAC[playerid] = true;
	PlayerData[playerid][Skor] = 0;
	SetPlayerScore(playerid, 0);
	DisableAC[playerid] = false;
	return 1;
}
stock ScoreHackControl(playerid)
{
	if(DisableAC[playerid] == false)
	{
	    if(GetPlayerScore(playerid) != GetScore(playerid))
	    {
			SetScore(playerid, 10);
			SkorSifirla(playerid);
			HileKullaniyo(playerid, "Skor Hilesi", 0);
	    }
	}
	return 1;
}
stock AracOlustur(playerid, renk0, renk1, model)
{
// playerid, aracýn sahibidir.
	DisableAC[playerid] = true;
	for(new i = 0; i < MAX_VEHICLE; i++)
	{
	    if(Arac[i][aracExists] == 0)
		{
		    new PosAga[4];
		    GetPlayerPos(playerid, PosAga[0], PosAga[1], PosAga[2]);
		    GetPlayerFacingAngle(playerid, PosAga[3]);
	        Arac[i][aracID] = CreateVehicle(model, PosAga[0]+5, PosAga[1]+5, PosAga[2], PosAga[3], renk0, renk1, -1, -1);
	        Arac[i][aracSahip] = playerid;
	        Arac[i][aracExists] = 1;
			format(Arac[i][aracText], 150, "%s[Sahip ID: %d] ~ %s[VehicleID: %d]", ReturnName(playerid), playerid, ArIsim[GetVehicleModel(Arac[i][aracID])], Arac[i][aracID]);
			Attach3DTextLabelToVehicle(Arac[i][aracText], Arac[i][aracID], 0.0, 0.0, 0.0); // Attaching Text Label To Vehicle.
			DisableVAC[Arac[i][aracID]] = false;
	    }
	}
	return 1;
}
stock AracSil(vid)
{
	DisableVAC[vid] = true;
	DestroyVehicle(vid);
	return 1;
}
stock ReplaceCar(vid)
{
	DisableVAC[vid] = true;
	Arac[vid][aracHP] = 1000;
	SetVehicleHealth(vid, 1000);
	RepairVehicle(vid);
	AddVehicleComponent(vid, 1010);
	DisableVAC[vid] = false;
	return 1;
}
stock CarHackControl(vid)
{
	if(DisableVAC[vid] == false)
		if(Arac[vid][aracExists] != 1) return AracSil(vid);
	return 1;
}
stock GiveCash(playerid, amount)
{
	DisableAC[playerid] = true;
	PlayerData[playerid][Para] += amount;
	GivePlayerMoney(playerid, amount);
	DisableAC[playerid] = false;
	return 1;
}
stock GetCash(playerid) return PlayerData[playerid][Para];
stock SetCash(playerid, amount)
{
	DisableAC[playerid] = true;
	PlayerData[playerid][Para] -= PlayerData[playerid][Para];
	PlayerData[playerid][Para] += amount;
	GiveCash(playerid, -GetPlayerMoney(playerid));
	GiveCash(playerid, PlayerData[playerid][Para]);
	DisableAC[playerid] = false;
	return 1;
}
stock ParaSifirla(playerid)
{
	DisableAC[playerid] = true;
	PlayerData[playerid][Para] = 0;
	ResetPlayerMoney(playerid);
	DisableAC[playerid] = false;
	return 1;
}
stock CashHackControl(playerid)
{
	if(DisableAC[playerid] == false)
	{
	    if(GetPlayerMoney(playerid) != GetCash(playerid))
		{
			GiveCash(playerid, 100000);
			ParaSifirla(playerid);
			HileKullaniyo(playerid, "Para Hilesi", 0);
	    }
	}
}
stock HackCheck(playerid)
{
	CashHackControl(playerid);
	SkinHackControl(playerid);
	WeaponHackControl(playerid);
	HealthHackControl(playerid);
	TeleportHackControl(playerid);
	ScoreHackControl(playerid);
	if(!DisableAC[playerid])
	{
		if(Interior[playerid] != GetPlayerInterior(playerid))
		    HileKullaniyo(playerid, "Interior Hack", 0);
		if(VW[playerid] != GetPlayerVirtualWorld(playerid))
		    HileKullaniyo(playerid, "VW Hack", 0);
	}
	return 1;
}
stock GetIP(playerid)
{
	new pip[16];
	GetPlayerIp(playerid, pip, sizeof(pip));
	return pip;
}/*
stock BA(playerid)
{
	new ip[32];
	GetPlayerIp(playerid,ip,sizeof(ip));
	for(new i = 0, p = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && !npc[i])
	{
		p = GetPlayerPing(i);
		if(i == playerid || !strcmp(ip,GetIP(i)) || p <= 0 || p >= 50000)
		{
            HileKullaniyo(i, "Bot", 0);
			if(var[i] != GECERSIZ)
			{
				KillTimer(var[i]);
				var[i] = GECERSIZ;
			}
		}
	}
//	format(ip,sizeof(ip),"banip %s",ip);
	return 1;//SendRconCommand(ip);
}*/
/*public OnPlayerCommandReceived(playerid, cmdtext[])
{
	return 1;
}*/
Spawnla(playerid)
{
	SetPlayerInterior(playerid,1);
	SetPlayerPos(playerid, SPAWN_X, SPAWN_Y, SPAWN_Z);
	SilahSifirla(playerid);
	SetArmour(playerid, 0);
	if(PlayerData[playerid][OdaID] == TDMID && PlayerData[playerid][Oyun] == TDMID)
	{
        PlayerData[playerid][OldurmeTDM] = 0;
        PlayerData[playerid][OlmeTDM] = 0;
		if(PlayerData[playerid][pTDMTakimID] == 0)
		    aTeamSayi--;
		if(PlayerData[playerid][pTDMTakimID] == 1)
		    bTeamSayi--;
        PlayerData[playerid][pTDMTakimID] = GECERSIZ;
	}
	PlayerData[playerid][OdaID] = GECERSIZ;
	PlayerData[playerid][Oyun] = GECERSIZ;
	return 1;
}
public GostergeYenile()
{
	for(new i = 0; i < MAX_VEHICLE; i++)
		CarHackControl(i);
	foreach(new i:Player)
	{
		if(IsPlayerConnected(i) && IsPlayerInAnyVehicle(i) && Gosterge[i] == 1)
		{
			TextDrawShowForPlayer(i, Text:ArkaPlan0);
			TextDrawShowForPlayer(i, Text:ArkaPlan1);
			TextDrawShowForPlayer(i, Text:ArkaPlan2);
			TextDrawShowForPlayer(i, Text:ArkaPlan3);
			TextDrawShowForPlayer(i, Text:ArkaPlan4);
			TextDrawShowForPlayer(i, Text:ArkaPlan5);
			TextDrawShowForPlayer(i, Text:ArkaPlan6);

			new HGG[265]; new Float:Can;
			GetVehicleHP(GetPlayerVehicleID(i), Can);
   			GetPlayerPos(i,Xa,Ya,Za);
   			KMH = floatsqroot(floatpower(floatabs(floatsub(Xa,Xb[i])),2)+floatpower(floatabs(floatsub(Ya,Yb[i])),2)+floatpower(floatabs(floatsub(Za,Zb[i])),2));
			KMH *= 14.2;
   			Yukseklik = Za;
			format(HGG, sizeof(HGG), "~b~~h~~h~Isim: ~w~%s~n~~g~~h~KM: ~w~%0.0f km/h~n~~n~~y~~h~Yukseklik: ~w~%.1f m~n~~r~~h~Can: ~w~%.2f", ArIsim[GetVehicleModel(GetPlayerVehicleID(i))-400], KMH, Yukseklik, Can);
			TextDrawSetString(Text:GostergeYazi[i], HGG);
            TextDrawShowForPlayer(i, GostergeYazi[i]);

			if(KMH >= 250)
			{
				TextDrawTextSize(Hizg[i],603.000000,0.000000);
			}
			else
			{
				TextDrawTextSize(Hizg[i], floatadd(534.0, floatdiv(KMH, 3.900000)),0.000000);
			}
			TextDrawShowForPlayer(i, Hizg[i]);

			if(Can < 0)
			{
				TextDrawTextSize(Cang[i],538.000000,0.000000);
			}
			else if(Can >= 1000)
			{
				TextDrawTextSize(Cang[i],603.000000,0.000000);
			}
			else
			{
				TextDrawTextSize(Cang[i],floatadd(534.0, floatdiv(Can, 14.6000000)),0.000000);
			}
  			TextDrawShowForPlayer(i, Cang[i]);
  			TextDrawShowForPlayer(i, Cizgi);
		}
		else
		{
			TextDrawHideForPlayer(i, Text:GostergeYazi[i]);
			TextDrawHideForPlayer(i, Text:Hizg[i]);
			TextDrawHideForPlayer(i, Text:Cang[i]);
			TextDrawHideForPlayer(i, Text:ArkaPlan0);
			TextDrawHideForPlayer(i, Text:ArkaPlan1);
			TextDrawHideForPlayer(i, Text:ArkaPlan2);
			TextDrawHideForPlayer(i, Text:ArkaPlan3);
			TextDrawHideForPlayer(i, Text:ArkaPlan4);
			TextDrawHideForPlayer(i, Text:ArkaPlan5);
			TextDrawHideForPlayer(i, Text:ArkaPlan6);
			TextDrawHideForPlayer(i, Text:Cizgi);
		}	GetPlayerPos(i,Xb[i],Yb[i],Zb[i]), Xb[i] = Xa; Yb[i] = Ya; Zb[i] = Za;
	}
}

stock ShowStats(playerid, userid)
{
	new str[50];
	format(str, 50, "%s(%d) ~ Karakter", ReturnName(userid), userid);
	new start[1000];
	format(start, 1000, "Hesap Adý:\t[ %s ]\nSQLID:\t[ %d ]\nBulunduðu Yer:\t[ %s ]\nSkor:\t[ %d ]\nPara:\t[ %d ]\nOynama Saati:\t[ %d ]\nToplam Ölme:\t[ %d ]\nToplam Öldürme:\t[ %d ]\nK/D:\t[ %.2f ]\nCan/Zýrh:\t[ %d/%d ]\nPayDay:\t[ %d/60 ]\nAdmin Level\t[ %d/3 ]\nDJ Level\t[ %d/3 ]\nBulunduðu Oda:\t[ %d ]\nVIP\t[ %s ]\nHapis Süre/Sebep/Cezalandýran:\t[ %d / %s / %s ]\nMute Süre/Sebep/Cezalandýran:\t[ %d / %s / %s ]\nWarn Sayýsý:\t[ %d ]\nBirlik ID: [ %d ]",
 	ReturnName(userid),
 	PlayerData[userid][SQLID],
	OyunAdi(userid),
    GetScore(userid),
    GetCash(userid),
    PlayerData[userid][oynamaSaati],
    PlayerData[userid][topOlme],
    PlayerData[userid][topOldurme],
    PlayerData[userid][KD],
	GetHealth(userid),
	GetArmour(userid),
	PlayerData[userid][PayDaySure],
	PlayerData[userid][AdmLevel],
	PlayerData[userid][DJLevel],
	ReturnOdaIsim(userid),
	(PlayerData[userid][pVip] ? ("Var") : ("Yok"),
	PlayerData[userid][HapisSure],
	PlayerData[userid][HapisSebep],
	PlayerData[userid][HapisAtan],
	PlayerData[userid][MuteSure],
	PlayerData[userid][MuteSebep],
	PlayerData[userid][MuteAtan],
	PlayerData[userid][Warning],
    PlayerData[userid][Birligi]);
	Dialog_Show(playerid, KARAKTER, DIALOG_STYLE_MSGBOX, str, start, "Tamam", "Çýkýþ");
	return 1;
}
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	ShowStats(playerid, clickedplayerid);
}
public OnVehicleDeath(vehicleid, killerid)
{
	HackCheck(killerid);
	return 1;
}
public OnPlayerFinishedDownloading(playerid, virtualworld)
{
    //SendClientMessage(playerid,COLOR_WHITE,"Downloads finished.");
	return 1;
}
stock AyniOdadakiler(odaid, oyunid)
{
	foreach(new i:Player)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(PlayerData[i][pSpawned])
			{
			    if(PlayerData[i][OdaID] == odaid)
			    {
			        if(PlayerData[i][Oyun] == oyunid)
			            return i;
			    }
			}
	    }
	}
	return GECERSIZ;
}
//----------------------------------------------------------
public OnPlayerText(playerid, text[])
{// rip
	if(Muted[playerid])
	{
	    new xre[200];
	    format(xre, 200, "{FF0000}» Siz susturulmuþsunuz, konuþamazsýnýz. «{CCCCCC}• Geriye Kalan Süre(sn): {00FF00}%d\n{CCCCCC}• Ýþlem Uygulayan: {00FF00}%s\n{CCCCCC}• Sebep: {00FF00}%s\n{CCCCCC}~Bu iþlemin hatalý olduðunu düþünüyorsanýz discord sunucumuzdan þikayet oluþturunuz.~", PlayerData[playerid][MuteSure], PlayerData[playerid][MuteAtan], PlayerData[playerid][MuteSebep]);
		Dialog_Show(playerid, MUTEDD, DIALOG_STYLE_MSGBOX, "Muted", xre, "Tamam", "Kapat");
		return 0;
	}
	if(Hapiste[playerid])
	{
 		new rer[200];
	    format(rer, 200, "{FF0000}» Hapiste yazý yazamazsýnýz. «{CCCCCC}• Geriye Kalan Süre(sn): {00FF00}%d\n{CCCCCC}• Ýþlem Uygulayan: {00FF00}%s\n{CCCCCC}• Sebep: {00FF00}%s\n{CCCCCC}~Bu iþlemin hatalý olduðunu düþünüyorsanýz discord sunucumuzdan þikayet oluþturunuz.~", PlayerData[playerid][HapisSure], PlayerData[playerid][HapisAtan], PlayerData[playerid][HapisSebep]);
		Dialog_Show(playerid, MUTEDD, DIALOG_STYLE_MSGBOX, "Jailed", rer, "Tamam", "Kapat");
		return 0;
	}
	switch(PlayerData[playerid][Oyun])
	{
	    case 0:
	    {
	        if(strlen(text) > 64)
	        {
				foreach(new i : Player) { if(PlayerData[i][Oyun] == 0){ if(PlayerData[i][OdaID] == PlayerData[playerid][OdaID]) {
				            new strt[260], st[100];
				            format(strt, 200, "•%d/%d• [%s] »» {CCCCCC}%s", PlayerData[playerid][OldurmeDM], PlayerData[playerid][OlmeDM], ReturnName(playerid), text);
				            format(st, 100, "{CCCCCC}...%s", text[64]);
				       	 	SendClientMessage(i, COLOR_BLUE, strt);
				       	 	SendClientMessage(i, COLOR_BLUE, st);
				       	 	return 0;
				        }
					}
				}
			} else {
				foreach(new i : Player) { if(PlayerData[i][Oyun] == 0){ if(PlayerData[i][OdaID] == PlayerData[playerid][OdaID]) {
    						new strp[260];
				            format(strp, 260, "•%d/%d• [%s] »» {CCCCCC}%s", PlayerData[playerid][OldurmeDM], PlayerData[playerid][OlmeDM], ReturnName(playerid), text);
				       	 	SendClientMessage(i, COLOR_BLUE, strp);
				       	 	return 0;
				        } // dmodaid
					} // dmodaýd
				} // foreach
			} // else
	    } // case
	    case TDMID:
	    {
	        if(strlen(text) > 64)
	        {
				foreach(new i : Player) { if(PlayerData[i][Oyun] == 0){ if(PlayerData[i][OdaID] == PlayerData[playerid][OdaID]) {
							new stra[1000], sta[500];
							format(stra, sizeof(stra), "•%s• [%s] »» {CCCCCC}%s", (PlayerData[playerid][pTDMTakimID] == 0) ? ("Team A") : ("Team B"), ReturnName(playerid), text);
				       	 	SendClientMessage(i, COLOR_BLUE, stra);
				       	 	format(sta, 500, "{CCCCCC}...%s", text[64]);
				       	 	SendClientMessage(i, COLOR_BLUE, sta);
				       	 	return 0;
				        }
					}
				}
			} else {
				foreach(new i : Player) { if(PlayerData[i][Oyun] == 0){ if(PlayerData[i][OdaID] == PlayerData[playerid][OdaID]) {
							new stry[750];
							format(stry, sizeof(stry), "•%s• [%s] »» {CCCCCC}%s", (PlayerData[playerid][pTDMTakimID] == 0) ? ("Team A") : ("Team B"), ReturnName(playerid), text);
				       	 	SendClientMessage(i, COLOR_BLUE, stry);
				       	 	return 0;
				        } // dmodaid
					} // dmodaýd
				} // foreach
			} // else
	    } // case
	} // swt
	if(PlayerData[playerid][Oyun] != 0 || PlayerData[playerid][Oyun] != TDMID)
	{
		if(PlayerData[playerid][pVip] == 1)
		{
	 			new s[500], ss[500];
	 			if (strlen(text) > 64)
		        {
		            format(s, 500, "»VIP« {CCCCCC}%.64s", text);
		            format(ss, 500, "»VIP« {CCCCCC}%s", text[64]);
		            HM(COLOR_YELLOW, s);
		            HM(COLOR_YELLOW, ss);
		        }
		        else
		        {
		            format(s, 500, "»VIP« {CCCCCC}%s", text);
		            HM(COLOR_YELLOW, s);
		        }
		}
		switch(PlayerData[playerid][AdmLevel])
		{
		    case 1:
		    {
	  			if (strlen(text) > 64)
		        {
		            new s[150];
		            format(s,150,"{9900FF}»ADM« {CCCCCC}%.64s", text);
		            HM(COLOR_GREEN, s);
		            new ss[150];
		            format(ss, 150, "{9900FF}»ADM« {CCCCCC}...%s", text[64]);
		            HM(COLOR_GREEN, ss);
		        }
		        else
		        {
		             new star[150];
		             format(star, 150, "{9900FF}»ADM« {CCCCCC}%s", text);
		             HM(COLOR_GREEN, star);
		        }
		    }
		    case 2:
		    {
	  			if (strlen(text) > 64)
		        {
		            new a[150], b[150];
		            format(a, 150, "{999999}»Y.ADM« {CCCCCC}%.64s", text);
		            format(b, 150, "{999999}»Y.ADM« {CCCCCC}...%s", text[64]);
		            HM(COLOR_BLACK, a);
		            HM(COLOR_BLACK, b);
		        }
		        else
		        {
		            new a[150];
		            format(a, 150, "{999999}»Y.ADM« {CCCCCC}%s", text);
		            HM(COLOR_BLACK, a);
		        }
		    }
		    case 3:
		    {
	  			if (strlen(text) > 64)
		        {
		            new b[500], c[500];
		            format(b, 500, "{FF0000}»OWN« {CCCCCC}%.64s", text);
		            format(c, 500, "{FF0000}»OWN« {CCCCCC}...%s", text[64]);
		            HM(COLOR_RED, b);
		            HM(COLOR_RED, c);
		        }
		        else
		        {
	         		new d[500];
		            format(d, 500, "{FF0000}»OWN« {CCCCCC}%s", text);
		            HM(COLOR_RED, d);
		        }
		    }
		}
		switch(PlayerData[playerid][DJLevel])
		{
		    case 1:
		    {
	  			if (strlen(text) > 64)
		        {
		            new e[500], w[500];
		            format(e, 500, "{9900FF}»DJ« {CCCCCC}%.64s", text);
		            format(w, 500, "{9900FF}»DJ« {CCCCCC}...%s", text[64]);
		            HM(COLOR_GREEN, e);
		            HM(COLOR_GREEN, w);
		        }
		        else
		        {
		            new e[500];
		            format(e, 500, "{9900FF}»DJ« {CCCCCC}%s", text);
		            HM(COLOR_GREEN, e);
		        }
		    }
		    case 2:
		    {
	  			if (strlen(text) > 64)
		        {
		            new s[500], a[500];
		            format(s, 500, "{999999}»Y.DJ« {CCCCCC}%.64s", text);
		            format(a, 500, "{999999}»Y.DJ« {CCCCCC}...%s", text[64]);
		            HM(COLOR_BLACK, s);
		            HM(COLOR_BLACK, a);
		        }
		        else
		        {
		            new as[500];
		            format(as, 500, "{999999}»Y.DJ« {CCCCCC}%s", text);
		            HM(COLOR_BLACK, as);
		        }
		    }
		    case 3:
		    {
	  			if (strlen(text) > 64)
		        {
					new xds[500], dds[500];
					format(xds, 500, "{FF0000}»B.DJ« {CCCCCC}%.64s", text);
					format(dds, 500, "{FF0000}»B.DJ« {CCCCCC}...%s", text[64]);
		            HM(COLOR_RED, xds);
		            HM(COLOR_RED, dds);
		        }
		        else
		        {
		            new d[760];
		            format(d, 760, "{FF0000}»B.DJ« {CCCCCC}%s", text);
		            HM(COLOR_RED, d);
		        }
		        return 0;
		    }
		}
	}
	return 0;
}
stock GetHighestID(exceptof = INVALID_PLAYER_ID)
{
	new h = 0;
	for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && i != exceptof && i > h) h = i;
	return h;
}
stock CountIP(const ip[])
{
	new c = 0;
	for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && !strcmp(GetIP(i),ip)) c++;
	return c;
}
stock Log(sz_fileName[], sz_input[])
{
	if(!fexist(sz_fileName)) return 1;
	new	sz_logEntry[156], i_dateTime[2][3], File: fileHandle = fopen(sz_fileName, io_append);
	gettime(i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2]);
	getdate(i_dateTime[1][0], i_dateTime[1][1], i_dateTime[1][2]);
	format(sz_logEntry, sizeof(sz_logEntry), "[%i/%i/%i - %i:%i:%i] %s\r\n", i_dateTime[1][2],i_dateTime[1][1],i_dateTime[1][0], i_dateTime[0][0], i_dateTime[0][1], i_dateTime[0][2], sz_input);
	fwrite(fileHandle, sz_logEntry);
	return fclose(fileHandle);
}
public OnPlayerConnect(playerid)
{
	SendDeathMessage(INVALID_PLAYER_ID,playerid,ICON_CONNECT);
	
	TextDrawShowForPlayer(playerid, SaatBox);
	TextDrawShowForPlayer(playerid, Saat);
	TextDrawShowForPlayer(playerid, Tarih);
	TextDrawShowForPlayer(playerid, Cizgix);
	
	StatikTD[playerid] = CreatePlayerTextDraw(playerid, 499.000000, 101.000000, "~g~Ölme:~w~ N/A\n~r~Öldürme:~w~ N/A\n~b~KD:~w~ N/A");
	PlayerTextDrawBackgroundColor(playerid, StatikTD[playerid], 32);
	PlayerTextDrawFont(playerid, StatikTD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, StatikTD[playerid], 0.270000, 1.000000);
	PlayerTextDrawColor(playerid, StatikTD[playerid], -1);
	PlayerTextDrawSetOutline(playerid, StatikTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, StatikTD[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, StatikTD[playerid], 0);
	
	PlayerTextDrawShow(playerid, StatikTD[playerid]); // Textdrawý göstermek için
	//PlayerTextDrawHide(id, StatikTD[id]); Textdrawý gizlemek için
	
	Textdraw0 = TextDrawCreate(685.199462, 439.046691, "usebox");
	TextDrawLetterSize(Textdraw0, 0.000000, 1.561848);
	TextDrawTextSize(Textdraw0, -10.800000, 0.000000);
	TextDrawAlignment(Textdraw0, 1);
	TextDrawColor(Textdraw0, 0);
	TextDrawUseBox(Textdraw0, true);
	TextDrawBoxColor(Textdraw0, 102);
	TextDrawSetShadow(Textdraw0, 0);
	TextDrawSetOutline(Textdraw0, 0);
	TextDrawFont(Textdraw0, 0);

	Textdraw1 = TextDrawCreate(259.999969, 436.800048, "discord.gg/BgaEB23");
	TextDrawLetterSize(Textdraw1, 0.342000, 1.077332);
	TextDrawAlignment(Textdraw1, 1);
	TextDrawColor(Textdraw1, -5963521);
	TextDrawSetShadow(Textdraw1, -146);
	TextDrawSetOutline(Textdraw1, 0);
	TextDrawBackgroundColor(Textdraw1, 51);
	TextDrawFont(Textdraw1, 1);
	TextDrawSetProportional(Textdraw1, 1);

	Textdraw2 = TextDrawCreate(-4.799985, 438.293487, "[][][][][][]");
	TextDrawLetterSize(Textdraw2, 0.246000, 0.965333);
	TextDrawAlignment(Textdraw2, 1);
	TextDrawColor(Textdraw2, -2139094785);
	TextDrawUseBox(Textdraw2, true);
	TextDrawBoxColor(Textdraw2, 0);
	TextDrawSetShadow(Textdraw2, 95);
	TextDrawSetOutline(Textdraw2, 0);
	TextDrawBackgroundColor(Textdraw2, 51);
	TextDrawFont(Textdraw2, 0);
	TextDrawSetProportional(Textdraw2, 1);

	Textdraw3 = TextDrawCreate(555.200012, 439.040161, "[][][][][][]");
	TextDrawLetterSize(Textdraw3, 0.273999, 1.002666);
	TextDrawAlignment(Textdraw3, 1);
	TextDrawColor(Textdraw3, -2139094785);
	TextDrawSetShadow(Textdraw3, 119);
	TextDrawSetOutline(Textdraw3, 0);
	TextDrawBackgroundColor(Textdraw3, 51);
	TextDrawFont(Textdraw3, 2);
	TextDrawSetProportional(Textdraw3, 1);

	Textdraw4 = TextDrawCreate(392.800018, 437.546813, "~b~/~w~oyunkatil ~b~/~w~dm ~b~/~w~tdm ~b~/~w~admins ~b~/~w~rapor");
	TextDrawLetterSize(Textdraw4, 0.318000, 1.002666);
	TextDrawAlignment(Textdraw4, 1);
	TextDrawColor(Textdraw4, -1);
	TextDrawSetShadow(Textdraw4, 126);
	TextDrawSetOutline(Textdraw4, 0);
	TextDrawBackgroundColor(Textdraw4, 51);
	TextDrawFont(Textdraw4, 1);
	TextDrawSetProportional(Textdraw4, 1);

	Textdraw5 = TextDrawCreate(95.999969, 438.293457, "~b~/~w~lobby ~b~/~w~ccmy ~b~/~w~id ~b~/~w~freeroam ~b~/~w~djs");
	TextDrawLetterSize(Textdraw5, 0.270799, 1.017599);
	TextDrawAlignment(Textdraw5, 1);
	TextDrawColor(Textdraw5, -1);
	TextDrawSetShadow(Textdraw5, 125);
	TextDrawSetOutline(Textdraw5, 0);
	TextDrawBackgroundColor(Textdraw5, 51);
	TextDrawFont(Textdraw5, 1);
	TextDrawSetProportional(Textdraw5, 1);

	Textdraw6 = TextDrawCreate(271.199951, 424.106719, "Rodeiun {FF0000}Death{0000FF}match");
	TextDrawLetterSize(Textdraw6, 0.335599, 1.390933);
	TextDrawAlignment(Textdraw6, 1);
	TextDrawColor(Textdraw6, 16777215);
	TextDrawSetShadow(Textdraw6, 74);
	TextDrawSetOutline(Textdraw6, 0);
	TextDrawBackgroundColor(Textdraw6, 51);
	TextDrawFont(Textdraw6, 1);
	TextDrawSetProportional(Textdraw6, 1);

	TextDrawShowForPlayer(playerid,Text:Textdraw0);
	TextDrawShowForPlayer(playerid,Text:Textdraw1);
	TextDrawShowForPlayer(playerid,Text:Textdraw2);
	TextDrawShowForPlayer(playerid,Text:Textdraw3);
	TextDrawShowForPlayer(playerid,Text:Textdraw4);
	TextDrawShowForPlayer(playerid,Text:Textdraw5);
	TextDrawShowForPlayer(playerid,Text:Textdraw6);
	
    oyKullandi[playerid] = 0;
   	balonda[playerid] = 0;
	balonkontrol[playerid] = 0;
	SetTimerEx("Giris_Yap",2500,false, "i",playerid);
 	return 1;
}
stock AdminMessage(color, const strd[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    stringx[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 8)
	{
		#emit ADDR.pri strd
		#emit STOR.pri start

	    for (end = start + (args - 8); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S strd
		#emit PUSH.C 144
		#emit PUSH.C stringx

		#emit LOAD.S.pri 8
		#emit ADD.C 4
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (PlayerData[i][AdmLevel] != 0)
			{
  				SendClientMessage(i, color, stringx);
			}
		}
		return 1;
	}
    foreach (new i : Player)
	{
		if (PlayerData[i][AdmLevel] != 0)
		{
			SendClientMessage(i, color, strd);
		}
	}
	return 1;
}
stock GetPlayerSpeed(vid)
{
/*
stock GetPlayerSpeed(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
    GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
    return floatround(ST[3]);
}
*/
    new Float:vx, Float:vy, Float:vz, Float:vel;
	vel = GetVehicleVelocity(vid, vx, vy, vz);
	vel = (floatsqroot(((vx*vx)+(vy*vy))+(vz*vz))* 181.5);
	return floatround(vel);
}
/* ///
forward AntiEngine();
public AntiEngine()
{
	foreach(new playerid : Player)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
		if (IsSpeedoVehicle(vehicleid) && GetEngineStatus(vehicleid) != true && GetPlayerSpeed(vehicleid) >= 40)
		{
		    new sur[670];
		    format(sur, 670, "%s(%d) adlý oyuncu Engine Hack kullanýyor olabilir. (%d KMH)", ReturnName(playerid), playerid, GetPlayerSpeed(vehicleid));
			AdminAlert(sur);
	  	}
		if (IsSpeedoVehicle(vehicleid) && GetEngineStatus(vehicleid) != true && GetPlayerSpeed(vehicleid) >= 60)
	 	{
		    new surr[670];
		    format(surr, 670, "%s(%d) adlý oyuncu Engine Hack kullanýyor olabilir. (%d KMH)", ReturnName(playerid), playerid, GetPlayerSpeed(vehicleid));
			AdminAlert(surr);
	  	}
	}
	return 1;
}*/
forward exSaat();
public exSaat()
{
	new string[75];
	new Year, Month, Day, Hour, Minute, Second;

	getdate(Year, Month, Day);
	format(string, sizeof string, "~w~%02d~r~/~w~%02d~r~/~w~%d", Day, Month, Year);
	TextDrawSetString(Tarih, string);

	gettime(Hour, Minute, Second);
	format(string, sizeof string, "~w~%02d~r~:~w~%02d~r~:~w~%02d", Hour, Minute,Second);
	TextDrawSetString(Saat, string);
	return true;
}

forward balonyukari(playerid);
forward balonasagi(playerid);
forward balonileri(playerid);
forward balongeri(playerid);
forward balonsag(playerid);
forward balonsol(playerid);
public balonyukari(playerid)
{
    new Float:ox,Float:oy,Float:oz;
	GetObjectPos(balonobje[playerid],ox,oy,oz);
	MoveObject(balonobje[playerid],ox,oy,oz+0.1,10.0);
	return 1;
}

public balonasagi(playerid)
{
    new Float:ox,Float:oy,Float:oz;
	GetObjectPos(balonobje[playerid],ox,oy,oz);
	MoveObject(balonobje[playerid],ox,oy,oz-0.1,10.0);
	return 1;
}
public balonileri(playerid)
{
    new Float:ox,Float:oy,Float:oz;
	GetObjectPos(balonobje[playerid],ox,oy,oz);
	MoveObject(balonobje[playerid],ox,oy+0.5,oz,10.0);
	return 1;
}
public balongeri(playerid)
{
    new Float:ox,Float:oy,Float:oz;
	GetObjectPos(balonobje[playerid],ox,oy,oz);
	MoveObject(balonobje[playerid],ox,oy-0.5,oz,10.0);
	return 1;
}
public balonsag(playerid)
{
    new Float:ox,Float:oy,Float:oz;
	GetObjectPos(balonobje[playerid],ox,oy,oz);
	MoveObject(balonobje[playerid],ox+0.5,oy,oz,10.0);
	return 1;
}
public balonsol(playerid)
{
    new Float:ox,Float:oy,Float:oz;
	GetObjectPos(balonobje[playerid],ox,oy,oz);
	MoveObject(balonobje[playerid],ox-0.5,oy,oz,10.0);
	return 1;
}
forward DelayedKick(playerid);
public DelayedKick(playerid)
{
    Kick(playerid);
    return 1;
}
public OnPlayerEnterVehicle(playerid, vehicleid)
{
    SetPVarInt(playerid, "AracaBindi", vehicleid);
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(balonda[playerid] == 1 && balonkontrol[playerid] == 1)
	{
	    new Float:ox,Float:oy,Float:oz;
		GetObjectPos(balonobje[playerid],ox,oy,oz);
		if(PRESSED(KEY_YES | KEY_WALK)) { timerler[playerid][0] = SetTimerEx("balonyukari",30,true,"i",playerid); }
		if(RELEASED(KEY_YES | KEY_WALK)) { KillTimer(timerler[playerid][0]); }

		if(PRESSED(KEY_NO | KEY_WALK)) { timerler[playerid][1] = SetTimerEx("balonasagi",30,true,"i",playerid); }
		if(RELEASED(KEY_NO | KEY_WALK)) { KillTimer(timerler[playerid][1]); }

		if(PRESSED(KEY_SECONDARY_ATTACK | KEY_YES)) { timerler[playerid][2] = SetTimerEx("balonileri",30,true,"i",playerid); }
		if(RELEASED(KEY_SECONDARY_ATTACK | KEY_YES)) { KillTimer(timerler[playerid][2]); }

		if(PRESSED(KEY_SECONDARY_ATTACK | KEY_NO)) { timerler[playerid][3] = SetTimerEx("balongeri",30,true,"i",playerid); }
		if(RELEASED(KEY_SECONDARY_ATTACK | KEY_NO)) { KillTimer(timerler[playerid][3]); }

		if(PRESSED(KEY_CROUCH | KEY_YES)) { timerler[playerid][4] = SetTimerEx("balonsag",30,true,"i",playerid); }
		if(RELEASED(KEY_CROUCH | KEY_YES)) { KillTimer(timerler[playerid][4]); }

		if(PRESSED(KEY_CROUCH | KEY_NO)) { timerler[playerid][5] = SetTimerEx("balonsol",30,true,"i",playerid); }
		if(RELEASED(KEY_CROUCH | KEY_NO)) { KillTimer(timerler[playerid][5]); }
	}
	if(newkeys == 512)
	{
		if(PlayerData[playerid][Oyun] == 2)
		{
		    new vehicleid = GetPlayerVehicleID(playerid);
		    if(GetPVarInt(playerid, "AracaBindi") == vehicleid)
			{
		    	MesajGonder(playerid, "Aracýn tamir edildi.");
		    	ReplaceCar(vehicleid);
			}
		}
	}
	return 1;
}
public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        if(GetPVarInt(playerid, "AracaBindi") != GetPlayerVehicleID(playerid))
        {
             HileKullaniyo(playerid, "Enter Car Hack", 0);
        }
    }
    return 1;
}

stock DB_Escape(text[])
{
	new
		ret[160],
		ch,
		i,
		j;
	while ((ch = text[i++]) && j < sizeof (ret))
	{
		if (ch == '\'')
		{
			if (j < sizeof (ret) - 2)
			{
				ret[j++] = '\'';
				ret[j++] = '\'';
			}
		}
		else if (j < sizeof (ret))
		{
			ret[j++] = ch;
		}
		else
		{
			j++;
		}
	}
	ret[sizeof (ret) - 1] = '\0';
	return ret;
}
CMD:nameoff(playerid)
{
	if(PlayerData[playerid][nameTag]){
		foreach(new i:Player)
			ShowPlayerNameTagForPlayer(playerid, i, false);
		MesajGonder(playerid, "Nametaglar kapandý.");
	}else {
		foreach(new i:Player)
		    ShowPlayerNameTagForPlayer(playerid, i, true);
		MesajGonder(playerid, "Nametaglar açýldý.");
	}
	return 1;
}
CMD:spec(playerid, params[])
{
	if (PlayerData[playerid][AdmLevel] < 1) return YetersizSeviye(playerid, 1, 0);
 	if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) return Spawnla(playerid);
    new id;
    if (sscanf(params, "u", id)) return BilgiMesajGonder(playerid, "/spec [ID/Isim]");
    if (!IsPlayerConnected(id)) return HataMesajGonder(playerid, "Ýzlemek istediðin kiþi oyunda deðil.");
    if (id == playerid) return HataMesajGonder(playerid, "Kendini izleyemezsin.");
    SetPlayerInterior(playerid, GetPlayerInterior(id));
    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
    TogglePlayerSpectating(playerid, true);
    if (IsPlayerInAnyVehicle(id))
        PlayerSpectateVehicle(playerid, GetPlayerVehicleID(id));
    if (!IsPlayerInAnyVehicle(id))
        PlayerSpectatePlayer(playerid, id);
	new rts[780];
	format(rts, 780, "%s adlý kiþiyi izliyorsun, tekrar /spec ile çýkabilirsin.", ReturnName(id));
    MesajGonder(playerid, rts);
	return 1;
}
CMD:shud(playerid)
{
	switch(Gosterge[playerid])
	{
	    case 0:
		{
			Gosterge[playerid] = 1;
			MesajGonder(playerid, "Hýz göstergesi açýldý.");
		}
		case 1:
		{
		    Gosterge[playerid] = 0;
		    MesajGonder(playerid, "Hýz göstergesi kapandý.");
		}
	}
	return 1;
}
CMD:neon(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return HataMesajGonder(playerid, "Herhangi bir aracýn içinde deðilsin.");
	if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) return HataMesajGonder(playerid, "Sürücü deðilsiniz.");
 	Dialog_Show(playerid, NEON, DIALOG_STYLE_LIST, "Neon Renginizi Seçiniz","{0000FF}Mavi\n{00FF00}Yeþil\n{FFFF00}Sarý\n{FFFFFF}Beyaz\n{FF00FF}Pembe\n{CCCCCC}Neonu Kaldýr","Ekle","Kapat");
	return 1;
}
CMD:mute(playerid, params[])
{
	new targetid, sure, sebep[50];
	if(PlayerData[playerid][AdmLevel] == 0) return YetersizSeviye(playerid, 1, 0);
	if(sscanf(params, "uds[50]", targetid, sure, sebep)) return BilgiMesajGonder(playerid, "/mute [id] [süre]");
	if(!IsPlayerConnected(targetid) || targetid == INVALID_PLAYER_ID) return HataMesajGonder(playerid, "Böyle bir oyuncu yok.");
	if(sure > 500 || 1 > sure) return HataMesajGonder(playerid, "En fazla 500, en az 1 girilebilir");
	format(PlayerData[targetid][MuteAtan], 24, ReturnName(playerid));
	format(PlayerData[targetid][MuteSebep], 50, sebep);
	PlayerData[targetid][MuteSure] = sure;
	new str[1000];
	format(str, 1000, "{00FF00}» {CCCCCC}%s {FF0000}adlý yetkili tarafýndan susturuldunuz. {00FF00}«\n» {FF0000}Sebep: {CCCCCC}%s {00FF00}«\n» {FF0000}Süre(saniye): {CCCCCC}%d {00FF00}«\n{000000}Bu iþlemin hatalý olduðunu düþünüyorsanýz discord sunucumuzdan þikayet oluþturabilirsiniz.\t{CCCCCC}/discord", ReturnName(playerid), PlayerData[targetid][MuteSebep], PlayerData[targetid][MuteSure]);
	Dialog_Show(targetid, MUTEDD, DIALOG_STYLE_MSGBOX, "• Muted •", str, "Tamam", "Tamam");
	return 1;
}
CMD:balonolustur(playerid)
{
	if(IsPlayerInAnyVehicle(playerid)) return HataMesajGonder(playerid, "Araçta bu komutu kullanamazsýn.");
    if(PlayerData[playerid][Oyun] != 2) return HataMesajGonder(playerid, "Bu Komutu sadece freeroamda kullanabilirsiniz.");
	if(GetScore(playerid) < GEREKEN_SKOR) return HataMesajGonder(playerid, "En az 150 skora sahip olmalýsýnýz.");
	if(balonda[playerid] == 1) return SendClientMessage(playerid,-1,"{FF0000}HATA: {FFFFFF}Zaten balonunuz var.");
	if(GetPlayerInterior(playerid) != 0) return SendClientMessage(playerid,-1,"{FF0000}HATA: {FFFFFF}Ýnterior içerisinde balon oluþturamazsýn.");
	new Float:poz[3];
	GetPlayerPos(playerid,poz[0],poz[1],poz[2]);
	DestroyObject(balonobje[playerid]);
	DestroyObject(balonates[playerid][0]);
	DestroyObject(balonates[playerid][1]);
	balonobje[playerid] = CreateObject(19335, poz[0],poz[1],poz[2],   0.00, 0.00, 0.00);
	balonates[playerid][0] = CreateObject(18692,poz[0],poz[1],poz[2],   0.00, 0.00, 0.00);
	balonates[playerid][1] = CreateObject(18692, poz[0],poz[1],poz[2],   0.00, 0.00, 0.00);
	AttachObjectToObject(balonates[playerid][0], balonobje[playerid], 0.0, 0.0, 2.0, 0.0, 0.0, 0.0, 1);
 	AttachObjectToObject(balonates[playerid][1], balonobje[playerid], 0.0, 0.0, 4.0, 0.0, 0.0, 0.0, 1);
 	SetPlayerPos(playerid,poz[0],poz[1],poz[2]+2);
 	SendClientMessage(playerid,-1,"{24FF0A}Balon: {FFFFFF}Þuanda balon kullanýyorsunuz, çýkmak için {FF0000}/balonsil {FFFFFF}kullanabilirsiniz.");
 	SendClientMessage(playerid,-1,"{24FF0A}Balon: {FFFFFF}Balonu kontrol etmek için {FF0000}/balonkontrol {FFFFFF}kullanabilirsiniz.");
 	balonda[playerid] = 1;
 	GiveScore(playerid,GetPlayerScore(playerid) - GEREKEN_SKOR);
	return 1;
}
CMD:balonkontrol(playerid)
{
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,-1,"{FF0000}HATA: {FFFFFF}Araçta bu komutu kullanamazsýnýz.");
    if(PlayerData[playerid][Oyun] != 2) return HataMesajGonder(playerid, "Bu Komutu sadece freeroamda kullanabilirsiniz.");
    if(balonda[playerid] == 0) return SendClientMessage(playerid,-1,"{FF0000}HATA: {FFFFFF}Balonunuz yok. Oluþturmak için /balonolustur");
    if(balonkontrol[playerid] == 0)
    {
        balonkontrol[playerid] = 1;
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FFFFFF}Þuanda balonu kontrol ediyorsunuz, kontrol etmeyi býrakmak için {FF0000}/balonkontrol {FFFFFF}kullanýn.");
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FF0000}Alt+Y - {FFFFFF}Balonun yukarý kalkmasýný saðlar.");
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FF0000}Alt+N - {FFFFFF}Balonun aþaðý inmesini saðlar.");
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FF0000}F+Y - {FFFFFF}Balonun ileri gitmesini saðlar.");
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FF0000}F+N - {FFFFFF}Balonun geri gitmesini saðlar.");
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FF0000}C+Y - {FFFFFF}Balonun sað tarafa gitmesini saðlar.");
	    SendClientMessage(playerid,-1,"{24FF0A}Balon: {FF0000}C+N - {FFFFFF}Balonun sol tarafa gitmesini saðlar.");
    }
    else
    {
        balonkontrol[playerid] = 0;
       	SendClientMessage(playerid,-1,"{24FF0A}Balon: {FFFFFF}Balonu kontrol etmekten vazgeçtiniz.");
    }
	return 1;
}
CMD:balonsil(playerid)
{
    if(balonda[playerid] == 0) return SendClientMessage(playerid,-1,"{FF0000}HATA: {FFFFFF}Bir balonunuz yok.");
    if(PlayerData[playerid][Oyun] != 2) return HataMesajGonder(playerid, "Bu Komutu sadece freeroamda kullanabilirsiniz.");
	DestroyObject(balonobje[playerid]);
	DestroyObject(balonates[playerid][0]);
	DestroyObject(balonates[playerid][1]);
	balonda[playerid] = 0;
	balonkontrol[playerid] = 0;
	SendClientMessage(playerid,-1,"{24FF0A}Balon: {FFFFFF}Balonunuz baþarýyla silindi.");
	return 1;
}
CMD:id(playerid, params[])
{
	new isim[24], dia[400], count = 0;
	if(sscanf(params, "s[24]", isim)) return BilgiMesajGonder(playerid, "/id [ISIM]");
	foreach(new i:Player)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(strfind(ReturnName(i), isim, true))
	        {
				count++;
	            format(dia, 400, "{CCCCCC}%s(%d) ~ %s", ReturnName(i), i, (IsPlayerPause(i) ? ("{FF0000}AFK") : ("{00FF00}Online"));
	        }
	    }
	}
	if(count == 0)
	{
		new agal[85];
		format(agal, 85, "%d sonuç", count);
		Dialog_Show(playerid, 6959, DIALOG_STYLE_MSGBOX, agal, dia, "Tamam", "Kapat");
	}
	else
	{
	    new str[85];
	    format(str, 85, "%s isiminde kimse bulunamadý.", isim);
	    MesajGonder(playerid, str);
	}
	return 1;
}
CMD:apanel(playerid)
{
	if(PlayerData[playerid][AdmLevel] == 0) return YetersizSeviye(playerid, 1, 0);
	new and[300];
	format(and, 300, "{CCCCCC}PayDay ücretini deðiþtir(saatlik)\t\t{FF0000}[ {FFFFFF}%d {00FF00}]\n{CCCCCC}DM Ayarlarý\n{CCCCCC}Oyuncu Ayarlarý", paydayodul);
	Dialog_Show(playerid, admpanel, DIALOG_STYLE_LIST, "Admin Panel", and, "Tamam", "Çýkýþ");
	return 1;
}
CMD:oylamabaslat(playerid)
{
    if(PlayerData[playerid][AdmLevel] < 2) return YetersizSeviye(playerid, 2, 0);
	if(Oylama[Baslatildi] == true) return SendClientMessage(playerid,GECERSIZ,"{FF0000}[HATA] {FFFFFF}Zaten oylama baþlatýlmýþ.");
	if(AktifOyuncu() < 3) return SendClientMessage(playerid,GECERSIZ,"{FF0000}[HATA] {FFFFFF}Oylama baþlatmak için sunucuda en az 3 kiþi olmalýdýr.");
	format(oySoru[playerid],50,"");
	format(oySecenek[playerid],20,"");
	format(Oylama[oSoru],50,"");
	format(Oylama[oSecenek1],20,"");
	format(Oylama[oSecenek2],20,"");
	Oylama[oSayi][0] = 0;
	Oylama[oSayi][1] = 0;
	Dialog_Show(playerid,DIALOG_OYLAMABASLAT,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 1","Lütfen oyunculara sormak istediðiniz soruyu girin:","Devam","Kapat");
	return 1;
}
CMD:oylamabitir(playerid)
{
    if(PlayerData[playerid][AdmLevel] < 2) return YetersizSeviye(playerid, 2, 0);
	if(Oylama[Baslatildi] == false) return SendClientMessage(playerid,GECERSIZ,"{FF0000}[HATA] {FFFFFF}Oylama baþlatýlmamýþ.");
	Oylama[Baslatildi] = false;
	KillTimer(Oylama[oTimer]);
	new stringa[200];
	format(stringa,sizeof(stringa),"{66FF00}[OYLAMA]: %s: %d , %s: %d",Oylama[oSecenek1],Oylama[oSayi][0],Oylama[oSecenek2],Oylama[oSayi][1]);
	HM(GECERSIZ,stringa);
	SendClientMessage(playerid,GECERSIZ,"{66FF00}[OYLAMA]: {FFFFFF}Oylama bitirildi.");
	format(Oylama[oSoru],50,"");
	format(Oylama[oSecenek1],20,"");
	format(Oylama[oSecenek2],20,"");
	Oylama[oSayi][0] = 0;
	Oylama[oSayi][1] = 0;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        oyKullandi[i] = 0;
	    }
	}
	return 1;
}
CMD:oyver(playerid)
{
	if(oyKullandi[playerid] == 1) return SendClientMessage(playerid,GECERSIZ,"{FF0000}[HATA] {FFFFFF}Zaten oy kullandýnýz.");
    if(Oylama[Baslatildi] == false) return SendClientMessage(playerid,GECERSIZ,"{FF0000}[HATA] {FFFFFF}Oylama baþlatýlmamýþ.");
    new stringw[124];
    format(stringw,sizeof(stringw),"{66FF00}Soru: {FFFFFF}%s?",Oylama[oSoru]);
    Dialog_Show(playerid,DIALOG_OYLA,DIALOG_STYLE_MSGBOX,"{00FFB7}Oylama",stringw,Oylama[oSecenek1],Oylama[oSecenek2]);
	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}
stock TDGuncelle(playerid)
{
	new ezix[800];
	//[0 = DM | 9999 = TDM | 2 = Freeroam | 3 = Düello | -1 = Lobi]
	switch(PlayerData[playerid][Oyun])
	{
	    case 0:
			format(ezix, sizeof(ezix), "~y~OYUN ÝÇÝ[DM]\n~g~Ölme:~w~ %d\n~r~Öldürme:~w~ %d\n~b~KD:~w~ %.2f", PlayerData[playerid][OlmeDM], PlayerData[playerid][OldurmeDM], PlayerData[playerid][KD]);
		case TDMID:
		    format(ezix, sizeof(ezix), "~y~OYUN ÝÇÝ[TDM]\n~g~Ölme:~w~ %d\n~r~Öldürme:~w~ %d\n~b~KD:~w~ %.2f", PlayerData[playerid][OlmeTDM], PlayerData[playerid][OldurmeTDM], PlayerData[playerid][KD]);
		case 2:
		    format(ezix, sizeof(ezix), "~g~Virtual World:~w~ %d\n~g~Interior:~w~ %d", VW[playerid], Interior[playerid]);
		case 3:
		{
		    new karsidaki;
		    for(new i = 0; i < 2; i++)
		    {
				if(Duello[PlayerData[playerid][OdaID]][DuelloOyuncular][i] != playerid)
				    karsidaki = Duello[PlayerData[playerid][OdaID]][DuelloOyuncular][i];
			}
		    format(ezix, sizeof(ezix), "~g~Düello ID:~w~ %d\n~g~Rakip:~w~ %s(%d)", PlayerData[playerid][OdaID], ReturnName(karsidaki), karsidaki);
		}
		case -1:
		{
		    if(PlayerData[playerid][topOlme] == 0)
		    	format(ezix, sizeof(ezix), "~g~Toplam Ölme:~w~ %d\n~r~Toplam Öldürme:~w~ %d\n~b~KD:~w~ %d.00", PlayerData[playerid][topOlme], PlayerData[playerid][topOldurme], PlayerData[playerid][topOldurme]);
			if(PlayerData[playerid][topOlme] > 0)
				format(ezix, sizeof(ezix), "~g~Toplam Ölme:~w~ %d\n~r~Toplam Öldürme:~w~ %d\n~b~KD:~w~ %.2f", PlayerData[playerid][topOlme], PlayerData[playerid][topOldurme], PlayerData[playerid][KD]);
		}
	}
	PlayerTextDrawSetString(playerid, StatikTD[playerid], ezix);
}
public OnPlayerUpdate(playerid)
{
	HackCheck(playerid);
	if(PlayerData[playerid][topOlme] == 0)
	    PlayerData[playerid][KD] = PlayerData[playerid][topOldurme];
	if(PlayerData[playerid][topOlme] > 0)
		PlayerData[playerid][KD] = floatdiv(pInfo[playerid][topOldurme], pInfo[playerid][topOlme]);
	if(CountIP(GetIP(playerid)) != 1)
	{
			new sd = CountIP(GetIP(playerid));
   			if(PlayerData[sd][CokluIzin] != 1)
	    	{
				Dialog_Show(sd, ipcakisma, DIALOG_STYLE_MSGBOX, "Olaðan IP Çakýþmasý", "Merhaba deðerli oyuncumuz! Taþýdýðýnýz IP adresini birden çok oyuncu kullandýðý için bu IP'yi kullanan oyuncularý kickledik.\nBu sorunu çözme yollarý:\n• VIP Paketi satýn almak\t[ Bu sayede tek bir IP den birden fazla kiþi girebilir. ]\n• Eðer tek baþýnýza kendi modeminizden baðlanýyorsanýz Modem'i resetleyin.\nSorununuz halen daha çözülmediyse Discord adresimizden ticket oluþturabilirsiniz.(/discord)", "Tamam", "Çýkýþ");
				new bss[1000];
				format(bss, 1000, "%s adlý oyuncu IP çakýþmasý sebebiyle oyundan atýldý.", ReturnName(sd));
				SendAdminAlert(bss);
				Kick(sd);
			}
	}
	if(balonda[playerid] == 1)
	{
 		new Float:pos[3];
 		GetObjectPos(balonobje[playerid],pos[0],pos[1],pos[2]);
	 	if(!IsPlayerInRangeOfPoint(playerid,50,pos[0],pos[1],pos[2]))
 		{
		      DestroyObject(balonobje[playerid]);
		      DestroyObject(balonates[playerid][0]);
		      DestroyObject(balonates[playerid][1]);
		      balonda[playerid] = 0;
		      balonkontrol[playerid] = 0;
		      SendClientMessage(playerid,-1,"{24FF0A}Balon: {FFFFFF}Balondan uzaklaþtýðýnýz için balonunuz silindi.");
	    }
	}
	if(PlayerData[playerid][pSpawned])
		GetPlayerPos(playerid, EskiPos[playerid][0], EskiPos[playerid][1], EskiPos[playerid][2]);

	if(!IsPlayerInRangeOfPoint(playerid, 50.0, EskiPos[playerid][0], EskiPos[playerid][1], EskiPos[playerid][2]) && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER || GetPlayerState(playerid)) != PLAYER_STATE_DRIVER && GetPlayerSurfingVehicleID(i) == INVALID_VEHICLE_ID)
		new divf[150], Float:distance;
		distance = GetPlayerDistanceFromPoint(playerid, EskiPos[playerid][0], EskiPos[playerid][1], EskiPos[playerid][2]);
		format(divf, "%s adlý oyuncu Teleport Hack kullanýyor olabilir. (Mesafe: %0.2f mt.)", distance);
		AdminMessage(COLOR_RED, divf);

	if(IsPlayerInAnyVehicle(playerid))
	{
	    Gosterge[playerid] = 1;
	}
	else
	{
	    Gosterge[playerid] = 0;
	}
	TDGuncelle(playerid);
	if(Hapiste[playerid])
	{
		new str[790];
		format(str, 790, "{0000FF}• Kalan Süre: {00FF00}%d •\t{0000FF}• Hapise Atan: {00FF00}%s •\t{0000FF}• Sebep: {00FF00}%s •\n{CCCCCC}• Lütfen bu pencereyi hapiste olduðunuz sürece kapatmayýnýz.", PlayerData[playerid][HapisSure], PlayerData[playerid][HapisAtan], PlayerData[playerid][HapisSebep]);
		Dialog_Show(playerid, jail, DIALOG_STYLE_MSGBOX, "» Hapis «",str, "Tamam", "Tamam");
	}
	else
	{
	    MesajGonder(playerid, "Hapis süreniz doldu.");
	    Spawnla(playerid);
	}
	new Float:lSurfOffsets[ 3 ];
    GetPlayerSurfingOffsets( playerid, lSurfOffsets[ 0 ], lSurfOffsets[ 1 ],  lSurfOffsets[ 2 ] );
    if( lSurfOffsets[ 0 ] != lSurfOffsets[ 0 ] || lSurfOffsets[ 1 ] != lSurfOffsets[ 1 ] || lSurfOffsets[ 2 ] != lSurfOffsets[ 2 ] ) // Surfing Ýnviseble  Surfing Offseti NaN gönderdigi zaman atýlýr
    {
		HileKullaniyo(playerid, "Anti Surfing Ýnviseble", 0);
    }

	GetPlayerPos(playerid, PosP[playerid][0], PosP[playerid][1], PosP[playerid][2]);
	GetPlayerFacingAngle(playerid, PosP[playerid][3]);
	Interior[playerid] = GetPlayerInterior(playerid);
	VW[playerid] = GetPlayerVirtualWorld(playerid);

 	new Float:health, Float:armour;
    GetPlayerHealth(playerid,health);
    GetPlayerArmour(playerid,armour);
    _oldHealth = health;
    _oldArmour = armour;
    new PlayerWeapon[MAX_PLAYERS];
    new gunname[32];
    PlayerWeapon[playerid] = GetPlayerWeapon(playerid);
    if(PlayerWeapon[playerid] == 38 || PlayerWeapon[playerid] == 39 || PlayerWeapon[playerid] == 36 || PlayerWeapon[playerid] == 35 || PlayerWeapon[playerid] == 37 || PlayerWeapon[playerid] == 40)
    {
		HileKullaniyo(playerid, "Silah Hilesi", 0);
    }
    if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
    {
		HileKullaniyo(playerid, "Jetpack Hilesi", 0);
    }

	if(GetPlayerWeapon(playerid) == 38){
		AdminMessage(COLOR_RED, "%s adlý oyuncu Minigun(38) kullandý ve silahý sýfýrlandý.", ReturnName(playerid));
		GivePlayerWeapon(playerid, 38, 0);
	}
	return 1;
}
forward OylamaBitir();
public OylamaBitir()
{
	if(Oylama[Baslatildi] == false) return 1;
	Oylama[Baslatildi] = false;
	KillTimer(Oylama[oTimer]);
	new strin[200];
	format(strin,sizeof(strin),"{66FF00}[OYLAMA]: %s: %d , %s: %d",Oylama[oSecenek1],Oylama[oSayi][0],Oylama[oSecenek2],Oylama[oSayi][1]);
	HM(GECERSIZ,strin);
	format(Oylama[oSoru],50,"");
	format(Oylama[oSecenek1],20,"");
	format(Oylama[oSecenek2],20,"");
	Oylama[oSayi][0] = 0;
	Oylama[oSayi][1] = 0;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if(IsPlayerConnected(i))
	    {
	        oyKullandi[i] = 0;
	    }
	}
	return 1;
}

///public TeleportHack(playerid)
///{
///	HileKullaniyo(playerid, "Teleport Hack", 0);
///	return 1;
///}
stock AktifOyuncu()
{
	new count = 0;
	foreach(new i:Player)
	{
	    if(IsPlayerConnected(i))
	    {
	        count++;
	    }
	}
	return count;
}
CMD:gotopos(playerid, params[])
{
	new Float:x, Float:y, Float:z;
	if(sscanf(params, "fff", x,y,z)) return BilgiMesajGonder(playerid, "/gotopos [x] [y] [z]");
	if(PlayerData[playerid][AdmLevel] != 0)
	{
	    SetPlayerPos(playerid, x, y, z);
	}
	return 1;
}
CMD:x(playerid, params[])
{
    new Float:posx, Float:posy, Float:posz, Float:npos;
    if (PlayerData[playerid][AdmLevel] >= 1)
    {
        if (sscanf(params, "f", npos)) return BilgiMesajGonder(playerid, "/x [Kordinat]");
        GetPlayerPos(playerid, posx, posy, posz);
        SetPlayerPos(playerid, posx+npos, posy, posz);
        return 1;
    }
    else return HataMesajGonder(playerid, "Bu komutu kullanmak için yetkiniz yok.");
}
CMD:y(playerid, params[])
{
    new Float:posx, Float:posy, Float:posz, Float:npos;
    if (PlayerData[playerid][AdmLevel] >= 1)
    {
        if (sscanf(params, "f", npos)) return BilgiMesajGonder(playerid, "/y [Kordinat]");
        GetPlayerPos(playerid, posx, posy, posz);
        SetPlayerPos(playerid, posx, posy+npos, posz);
        return 1;
    }
    else return HataMesajGonder(playerid, "Bu komutu kullanmak için yetkiniz yok.");
}
CMD:z(playerid, params[])
{
    new Float:posx, Float:posy, Float:posz, Float:npos;
    if (PlayerData[playerid][AdmLevel] >= 1)
    {
        if (sscanf(params, "f", npos)) return BilgiMesajGonder(playerid, "/z [Kordinat]");
        GetPlayerPos(playerid, posx, posy, posz);
        SetPlayerPos(playerid, posx, posy, posz+npos);
        return 1;
    }
    else return HataMesajGonder(playerid, "Bu komutu kullanmak için yetkiniz yok.");
}
CMD:ann(playerid, params[])
{
	new texts[750], type;
	if(PlayerData[playerid][AdmLevel] < 0) return YetersizSeviye(playerid, 1, 0);
	if(sscanf(params, "sd", texts, type)) return HataMesajGonder(playerid, "/ann [Yazý] [Tip]");
	if(type > 6) return HataMesajGonder(playerid, "Tip olarak en fazla 6 kullanýlabilir.");
	foreach(new i:Player)
	{
	    if(PlayerData[i][Ayarlar][0] == 1)
			GameTextForAll(texts, 5000, type);
	}
	new ttds[1000];
	format(ttds, sizeof(ttds), "%s(%d) adlý yetkili (%s)(%d) kullandý.(Ann)", ReturnName(playerid), playerid, texts, type);
	SendAdminAlert(ttds);
	return 1;
}
CMD:makeadmin(playerid, params[])
{
	new id, level;
	if(!IsPlayerAdmin(playerid)) return HataMesajGonder(playerid, "RCON Admin olmalýsýnýz.");
	if (!IsPlayerConnected(playerid)) return 1;
    if (PlayerData[playerid][AdmLevel] < 3) return YetersizSeviye(playerid, 2, 0);
    if (sscanf(params, "ui",id,level)) return BilgiMesajGonder(playerid, "/setadmin [ID/Isim] [Level]");
    if (!IsPlayerConnected(id)) return HataMesajGonder(playerid, "Oyuncu giriþ yapmamýþ.");
    if (level < 0 || level > 3) return HataMesajGonder(playerid, "Level 0'dan küçük, 3'den fazla olamaz.");
    PlayerData[id][AdmLevel] = level;
    new sds[679], dsd[680];
    format(sds, 679, "%s adlý yetkili tarafýndan %d level yetkili yapýldýnýz.", ReturnName(playerid), level);
    format(dsd, 680, "%s adlý oyuncuyu baþarýyla %d level yetkili yaptýnýz.", ReturnName(id), level);
	BilgiMesajGonder(id, sds);
	BilgiMesajGonder(playerid, dsd);
	return 1;
}
CMD:jail(playerid, params[])
{
	new id, sure, sebep[50];
	if(PlayerData[playerid][AdmLevel] == 0) return HataMesajGonder(playerid, "Admin olmalýsýnýz!");
	if(sscanf(params, "uds[50]",id,sure,sebep)) return BilgiMesajGonder(playerid, "/jail [id] [süre] [sebep]");
	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID) return HataMesajGonder(playerid, "Böyle bir oyuncu yok.");
	if(sure < 0 || sure > 500) return HataMesajGonder(playerid, "En az 1, en fazla 500 dakika atabilirsiniz.");
	Hapiste[id] = true;
	Godmode[id] = true;
	SetPlayerPos(playerid, HAPIS_X, HAPIS_Y, HAPIS_Z);
	new str[2000];
		if(sure > 99999){
		format(str, sizeof(str), "«(%s) - JAIL» %s ~ %s • [Reason: %s] • [Sýnýrsýz]", ReturnDate(), ReturnName(playerid), ReturnName(id), sebep);
		sure = 9999999999999;
	}
	PlayerData[id][HapisSure] = sure;
	format(PlayerData[id][HapisSebep], 50, sebep);
	format(PlayerData[id][HapisAtan], 24, ReturnName(playerid));
	if(sure != 9999999999999)
		format(str, sizeof(str), "«(%s) - JAIL» %s ~ %s • [Reason: %s] • [%d DK]", ReturnDate(), ReturnName(playerid), ReturnName(id), sebep, sure);
	HM(COLOR_RED, str);
	return 1;
}/*
CMD:ban(playerid, params[])
{
	new id, reason[128];
	if(PlayerData[playerid][AdmLevel] < 2) return HataMesajGonder(playerid, "En az 2 level admin olmalýsýnýz.");
	if(sscanf(params, "ui", id, reason)) return BilgiMesajGonder(playerid, "/ban [id] [sebep]");
	if(!IsPlayerConnected(id)) return HataMesajGonder(playerid, "Böyle bir oyuncu yok.");
	if(id != playerid){
		//mysql iþlemleri
		new str[1000];
		format(str, sizeof(str), "«(%s) - BAN» %s ~ %s • [Reason: %s]", ReturnDate(), ReturnName(playerid), ReturnName(id), reason);
		HM(COLOR_RED, str);
		BanEx(id, reason);
	}
 	return 1;
}*/
CMD:tdm(playerid)
{
	new orospucocu[960];
	strcat(orospucocu, "Takým\t\tDoluluk Oraný\n");
	format(orospucocu, 960, "{FF0000}A Takýmý\t\t{FFFFFF}[ {CCCCCC}%d/%d {FFFFFF}]\n{0000FF}B Takýmý\t\t{FFFFFF}[ {CCCCCC}%d/%d {FFFFFF}]", aTeamSayi, MAX_TDM_UYE/2, bTeamSayi, MAX_TDM_UYE/2);
	Dialog_Show(playerid, tdm, DIALOG_STYLE_LIST, "» Team Deathmatch «", orospucocu, "Seç", "Ýptal");
	return 1;
}
CMD:oyunkatil(playerid, params[])
{// oynadýðý oyun [0 = DM | 9999 = TDM | 2 = Freeroam | 3 = Düello | -1 = Lobi]
	new oyun, odaid;
	if(PlayerData[playerid][Oyun] != -1) return HataMesajGonder(playerid, "Bu komutu kullanmak için lobide olmalýsýnýz.");
	if(sscanf(params, "dd", oyun, odaid))
	{
		BilgiMesajGonder(playerid, "/oyunkatil [OYUN TÝP] [ODA ID]\nEðer TDM oynayacaksanýz ODA ID bölümüne '9999' yazýn.");
 		MesajGonder(playerid, "Oda tipleri: 0 = DM, 1 = TDM");
 		return 0;
	}
	if(oyun != 0 || oyun != 1 || oyun != 2) return HataMesajGonder(playerid, "Geçersiz oyun tipi.");
	if(odaid != TDMID || odaid > MAX_DM_AREA || Deathmatch[odaid][Exists] != 1) return HataMesajGonder(playerid, "Geçersiz oda id.\nOda ID'lerine bakmak için /dm & /tdm");
	switch(oyun)
	{
		case 1:
		{
		    if(TDeathmatch[tdmUyeler] == MAX_TDM_UYE) return HataMesajGonder(playerid, "Bu oyun odasý tamamen dolu.");
			new mila[900];
			new yarisi = MAX_TDM_UYE/2;
			format(mila, 900, "{0000FF}A Takýmý\t\t{CCCCCC}[%d/%d]\n{FF0000}B Takýmý\t\t{CCCCCC}[%d/%d]", aTeamSayi, yarisi, bTeamSayi, yarisi);
		    Dialog_Show(playerid, tdmkatil, DIALOG_STYLE_LIST, "Takým Seçme", mila, "Seç", "Çýkýþ");
		}
		case 0:
		{
		    if(Deathmatch[odaid][dmUyesayi] == MAX_DM_UYE) return HataMesajGonder(playerid, "Bu oyun odasý tamamen dolu.");
		    DMYolla(playerid, odaid);
		}
	}
	return 1;
}
CMD:dm(playerid)
{
	if(!PlayerData[playerid][pSpawned]) return HataMesajGonder(playerid, "Spawn olmadan bu komutu kullanamazsýnýz.");
	if(PlayerData[playerid][Oyun] != GECERSIZ) return HataMesajGonder(playerid, "Lobide deðilsin!");
	new amasya[10000];
	for(new i = 0; i < MAX_DM_AREA; i++)
	{
	    if(Arena[i][Exists] == 1)
	    {
	        new did;
	        did = Deathmatch[i][dmID];
			format(amasya, 10000, "{C72A2A}%s[%d]\t{0000FF}%d\t{FFFF00}%s\t{CCCCCC}%s\n", Arena[did][arenaName], Arena[did][ID], Arena[did][arenaMember], (Arena[did][arenaKatilma] == 1) ? ("{00FF00}Katýlabilir") : ("{FF0000}Katýlamaz"), (Arena[did][arenaHS] == 1) ? ("{00FF00}Açýk") : ("{FF0000}Kapalý"));
		}
	}
 	strcat(amasya, "Arena Ýsim[ID]\tAktif Oyuncu\tKatýlabilme durumu\tHeadshot\n");
	Dialog_Show(playerid, dm, DIALOG_STYLE_LIST, "Rodeiun DM", amasya, "Seç", "Kapat");
	return 1;
}

CMD:lobby(playerid)
{
	if(!PlayerData[playerid][pSpawned]) return HataMesajGonder(playerid, "Spawn olmadan bu komutu kullanamazsýnýz.");
	if(PlayerData[playerid][Oyun] != GECERSIZ) return HataMesajGonder(playerid, "Zaten lobidesin!");
	Spawnla(playerid);
	return 1;
}
CMD:admins(playerid)
{
	new count = 0;
	SendClientMessage(playerid, COLOR_GREY, "-----------------------------------------------------------");
	foreach (new i : Player) if (PlayerData[i][AdmLevel] > 0)
	{
	    	count++;
	        SendClientMessageEx(playerid, COLOR_WHITE, "{2ECC71}%s\t{CCCCCC}Admin Level: %d", PlayerData[i][AdmLevel]);
	}
	if (!count) HataMesajGonder(playerid, " Aktif yetkili yok.");
	SendClientMessage(playerid, COLOR_GREY, "-----------------------------------------------------------");
	return 1;
}

//----------------------------------------------------------
stock MapYukle(playerid){
	RemoveBuildingForPlayer(playerid, 11447, -1309.6016, 2492.4766, 86.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 11440, -1321.2109, 2503.3438, 85.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 11441, -1310.7734, 2514.0078, 86.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 11445, -1289.3672, 2513.6094, 86.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 11444, -1325.6719, 2527.7031, 86.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 11446, -1334.3828, 2524.6016, 86.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 11442, -1314.8359, 2526.4688, 86.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 11458, -1316.8516, 2542.6719, 86.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 11443, -1301.7188, 2527.4922, 86.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 11459, -1292.7969, 2529.0000, 86.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 11457, -1303.7734, 2550.2344, 86.2266, 0.25);
		RemoveBuildingForPlayer(playerid, 1308, 9.0234, 15.1563, -5.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 13052, -69.0469, 86.8359, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 13053, -59.9531, 110.4609, 13.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 13054, -61.4531, -36.9922, 1.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 13055, -91.2891, -38.8672, 2.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 13056, -43.8984, 41.1094, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 13057, -120.0234, -77.9063, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 3376, -96.0859, 3.1953, 6.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 3376, -15.5234, 68.4531, 6.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3404, -132.9766, -93.7109, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 3404, -85.8438, -102.1563, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 3404, -61.8672, 46.9531, 2.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 13477, -21.9453, 101.3906, 4.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 13488, -81.5703, -79.4453, 4.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -112.4766, -158.2422, 2.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -149.3359, -160.5078, 3.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 672, 65.7891, -168.7266, 0.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 3402, -85.8438, -102.1563, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 705, -65.6719, -96.1719, 1.9453, 0.25);
	RemoveBuildingForPlayer(playerid, 3402, -132.9766, -93.7109, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 13367, -120.0234, -77.9063, 14.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1428, -116.0000, -77.2500, 15.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 13489, -81.5703, -79.4453, 4.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1428, -118.5000, -75.9375, 5.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1428, -116.7578, -76.3516, 3.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 705, -58.6328, -66.6250, 2.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 3175, -143.5156, -51.3516, 1.9141, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -140.6016, -44.9531, 2.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 12911, -61.4531, -36.9922, 1.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 12917, -99.9922, -40.3047, 1.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 12920, -91.2891, -38.8672, 2.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -67.6719, 2.0469, 2.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 3374, -50.0156, 3.1797, 3.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3375, -96.0859, 3.1953, 6.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 12914, -75.1797, 12.1719, 3.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 12918, -72.0391, 18.4453, 1.9531, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -35.7109, 18.1016, 3.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -81.8984, 56.8516, 2.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3276, -71.8359, 58.8750, 2.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 3374, -92.8672, 58.3438, 3.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 3374, -91.9453, 47.8125, 3.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 12919, -43.8984, 41.1094, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 3375, -15.5234, 68.4531, 6.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 3402, -61.8672, 46.9531, 2.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 12915, -69.0469, 86.8359, 2.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -15.2109, 94.8438, 3.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 3374, -41.2500, 98.4141, 3.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 3374, -36.0156, 96.1875, 3.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 12912, -59.9531, 110.4609, 13.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 12913, -21.9453, 101.3906, 4.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -71.7109, 135.3438, 1.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 705, -71.2422, 174.6641, 1.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 13205, -85.8047, -201.5625, 8.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -12.9766, -198.0313, 5.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1308, 23.7578, -198.5625, 0.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1294, -116.8750, -183.2656, 5.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 12921, -128.2578, -179.3203, 4.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 4517, -193.8281, 269.5078, 12.8906, 0.25);

return 1;
}
public OnPlayerSpawn(playerid)
{
	PlayerData[playerid][SonHasarVermeZaman] = GECERSIZ;
	PlayerData[playerid][SonHasarAlmaZaman] = GECERSIZ;
    Timerxx[playerid] = SetTimerEx("CP",990,1,"i",playerid);
	CallLocalFunction("Kos_Koruma", "i", playerid);
	MapYukle(playerid);
	return 1;
}

//----------------------------------------------------------
public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if (!success)
	{
	    new komut[570];
	    format(komut, 570, "'%s' adlý komut bulunamadý, yardým için /rapor kullanabilirsiniz.", cmdtext);
		MesajGonder(playerid, komut);
	}
	if (success)
	{
	    if(!Kullanilabilir(playerid)) return HataMesajGonder(playerid, "Þuan komut kullanamazsýn.");
		if(Hapiste[playerid])
		{
	 		new drr[1000];
		    format(drr, 1000, "{FF0000}» Hapiste yazý yazamazsýnýz. «{CCCCCC}• Geriye Kalan Süre(sn): {00FF00}%d\n{CCCCCC}• Ýþlem Uygulayan: {00FF00}%s\n{CCCCCC}• Sebep: {00FF00}%s\n{CCCCCC}~Bu iþlemin hatalý olduðunu düþünüyorsanýz discord sunucumuzdan þikayet oluþturunuz.~", PlayerData[playerid][HapisSure], PlayerData[playerid][HapisAtan], PlayerData[playerid][HapisSebep]);
			Dialog_Show(playerid, MUTEDD, DIALOG_STYLE_MSGBOX, "Jailed", drr, "Tamam", "Kapat");
		}
	}
	return 1;
}
forward Giris_Yap(playerid);
public Giris_Yap(playerid)
{
	new str[2000];
	format(str, sizeof(str), "Oyuna hoþgeldin, %s. Sunucumuzda karakterin bulunamadý.\nKayýt olmak için lütfen aþþaðýya þifreni gir.\nEn fazla 23 karakter.", ReturnName(playerid));
	Dialog_Show(playerid, KAYITT, DIALOG_STYLE_PASSWORD, "Kayýt",str, "Devam", "Ýptal");
  	return 1;
}
ReturnDate()
{
	static
	    date[36];

	getdate(date[2], date[1], date[0]);
	gettime(date[3], date[4], date[5]);

	format(date, sizeof(date), "%02d/%02d/%d, %02d:%02d", date[0], date[1], date[2], date[3], date[4]);
	return date;
}
stock NearestPlayers(Float:fPosX, Float:fPosY, Float:fPosZ, Float:dist5)
{
	foreach(new i:Player)
	{
		if(PlayerData[i][pSpawned])
		{
		    if(IsPlayerInRangeOfPoint(i, dist5, fPosX, fPosY, fPosZ))
		    {
				return i;
		    }
		}
	}
	return GECERSIZ;
}
stock IsNumeric(const str[])
{
	for (new i = 0, l = strlen(str); i != l; i ++)
	{
	    if (i == 0 && str[0] == '-')
			continue;

	    else if (str[i] < '0' || str[i] > '9')
			return 0;
	}
	return 1;
}
stock EkranTemizle(playerid, amount)
{
	for (new i; i < amount; i++)
	    SendClientMessage(playerid, 0xFFFFFFFF, "");
	return 1;
}
CMD:chattemizle(playerid, params[])
{
	if(PlayerData[playerid][AdmLevel] == 0) return HataMesajGonder(playerid, "Admin deðilsiniz.\nKendi ekranýnýzý temizlemek için '/ccmy'");
	new miktar;
	if(isnull(params)) miktar = 25;
	if(IsNumeric(params)){
	    miktar = strval(params);
		foreach(new i:Player)
		    EkranTemizle(i, miktar);
		new ekran[760];
		format(ekran, 760, "%s adlý yetkili tüm chati temizledi!", ReturnName(playerid));
		HM(COLOR_BLUE, ekran);
	}
	return 1;
}
CMD:ccmy(playerid) return EkranTemizle(playerid);
CMD:yarismabaslat(playerid, params[])
{
	if(PlayerData[playerid][AdmLevel] < 2) return YetersizSeviye(playerid, 2, 0);
	if(YarismaDurum == true) return SendClientMessage(playerid, 0xE74C3CFF, "Yarýþma zaten baþlamýþ, /yarismabitir ile bitirebilirsiniz.");
	new odul, sayi;
	if(sscanf(params, "ii", sayi, odul)) return SendClientMessage(playerid, 0xBBFFEEFF, "KULLANIM: /yarismabaslat [Sayý] [Ödül]");
	if(sayi < 1000 || sayi > 10000) return SendClientMessage(playerid, 0xE74C3CFF, "Sayý en az 1000, en fazla 10,000 olabilir.");
	if(odul < 1) return SendClientMessage(playerid, 0xE74C3CFF, "Geçersiz ödül miktarý.");
	new str[150];
	YarismaDurum = true;
	TahminSayi = sayi;
	TahminOdul = odul;
	format(str, sizeof(str), "%s adlý yetkili sayý tahmin yarýþmasý baþlattý. /tahmin komutunu kullanarak tahmin edebilirsiniz. (Ödül: $%d)", ReturnName(playerid), odul);
	HM(0xBBFFEEFF, str);
	return 1;
}
CMD:yarismabitir(playerid)
{
    if(PlayerData[playerid][AdmLevel] < 2) return YetersizSeviye(playerid, 2, 0);
    if(YarismaDurum == false) return SendClientMessage(playerid, 0xE74C3CFF, "Yarýþma baþlatýlmamýþ. (/yarismabaslat)");
    new str[80];
    YarismaDurum = false;
    TahminSayi = 0;
    TahminOdul = 0;
    format(str, sizeof(str), "%s adlý yetkili tarafýndan sayý tahmin yarýþmasý bitirildi.", ReturnName(playerid));
	HM(0xBBFFEEFF, str);
	return 1;
}
CMD:tahmin(playerid, params[])
{
    if(YarismaDurum == false) return SendClientMessage(playerid, 0xE74C3CFF, "Sayý tahmin yarýþmasý baþlatýlmamýþ.");
    if(isnull(params)) return SendClientMessage(playerid, 0xBBFFEEFF, "KULLANIM: /tahmin [Sayý]");
    new sayi = strval(params);
    if(sayi < 1000 || sayi > 10000) return SendClientMessage(playerid, 0xE74C3CFF, "Sayý en az 1000, en fazla 10,000 olabilir.");
    new str[150];
    if(sayi < TahminSayi)
    {
		format(str, sizeof(str), "{E74C3C}»» {FFFFFF}%d sayýsý doðru sayýdan küçük, yeniden deneyin. (%d < XXXX)", sayi, sayi);
		BilgiMesajGonder(playerid, str);
    }
    else if(sayi > TahminSayi)
    {
        format(str, sizeof(str), "{E74C3C}»» {FFFFFF}%d sayýsý doðru sayýdan büyük, yeniden deneyin. (%d > XXXX)", sayi, sayi);
		BilgiMesajGonder(playerid, str);
    }
    else if(sayi == TahminSayi)
    {
        format(str, sizeof(str), "%s adlý oyuncu sayýyý doðru tahmin ederek $%d kazandý. (Sayý: %d)", ReturnName(playerid), TahminOdul, TahminSayi);
        HM(0xBBFFEEFF, str);
        GivePlayerMoney(playerid, TahminOdul);
        YarismaDurum = false;
        TahminSayi = 0;
        TahminOdul = 0;
    }
	return 1;
}
stock ResetPlayer(playerid)
{
	PlayerData[playerid][Kaydoldu] = 1;
	PlayerData[playerid][pSonOldurme] = INVALID_PLAYER_ID;
	PlayerData[playerid][pSonOlduren] = INVALID_PLAYER_ID;
	PlayerData[playerid][pSonOldurmeZaman] = GECERSIZ;
	PlayerData[playerid][pSonOlmeZaman] = GECERSIZ;
	PlayerData[playerid][SonHasarVermeZaman] = GECERSIZ;
	PlayerData[playerid][SonHasarAlmaZaman] = GECERSIZ;
	PlayerData[playerid][AdmLevel] = 0;
	PlayerData[playerid][DJLevel] = 0;
	SilahSifirla(playerid);
	PlayerData[playerid][Oyun] = GECERSIZ;
	PlayerData[playerid][pSonPM] = INVALID_PLAYER_ID;
	PlayerData[playerid][OdaID] = GECERSIZ;
	PlayerData[playerid][Skor] = 0;
	PlayerData[playerid][Para] = 0;
	PlayerData[playerid][pVip] = 0;
	PlayerData[playerid][HapisSure] = 0;
	format(PlayerData[playerid][HapisSebep], 50, "Null");
	PlayerData[playerid][HapisAtan] = INVALID_PLAYER_ID;
	PlayerData[playerid][MuteSure] = 0;
	format(PlayerData[playerid][MuteSebep], 50, "Null");
	PlayerData[playerid][MuteAtan] = INVALID_PLAYER_ID;
	PlayerData[playerid][Warning] = 0;
	PlayerData[playerid][pTDMTakimID] = GECERSIZ;
	PlayerData[playerid][KD] = 0;
	PlayerData[playerid][OldurmeDM] = 0;
	PlayerData[playerid][OlmeDM] = 0;
	PlayerData[playerid][OldurmeTDM] = 0;
	PlayerData[playerid][OlmeTDM] = 0;
	PlayerData[playerid][Birligi] = GECERSIZ;
	PlayerData[playerid][BirlikRutbe] = GECERSIZ;
 	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	PlayerData[playerid][SonHasarAlmaZaman] = 0;
    if(issuerid != INVALID_PLAYER_ID)
    {
    	PlayerData[issuerid][SonHasarVermeZaman] = 0;
		if(GetPlayerState(issuerid) == PLAYER_STATE_DRIVER)
			HileKullaniyo(issuerid, "Driver By Hack", 0);
	    new Float:nHealth, Float:nArmour;
		GetPlayerHealth(playerid,nHealth);
        GetPlayerArmour(playerid,nArmour);
        if(nHealth == _oldHealth && nArmour == _oldArmour)
        {
				HileKullaniyo(playerid, "Can & Zýrh Hilesi", 0);
        }
    }
    return 1;
}
stock TDMYenile()
{
	new playerid = AyniOdadakiler(TDMID, TDMID);
	Spawnla(playerid);
	aTeamSayi = 0;
	bTeamSayi = 0;
	
}
stock TDMYolla(playerid, teamid)
{
	if(TDeathmatch[tdmUyeler] == MAX_TDM_UYE) return HataMesajGonder(playerid, "TDM maks oyuncuya ulaþtý.");
	SilahSifirla(playerid);
	PlayerData[playerid][Oyun] = TDMID;
	SetHealth(playerid, 100);
	SetArmour(playerid, 100);
	for(new i = 0; i < 13; i++)
		SilahVer(playerid, TDeathmatch[tdmGuns][i], 1000);
	PlayerData[playerid][pTDMTakimID] = teamid;
	if(PlayerData[playerid][pTDMTakimID] == 0)
		aTeamSayi--;
	if(PlayerData[playerid][pTDMTakimID] == 1)
 		bTeamSayi--;
	PlayerData[playerid][OdaID] = TDMID;
	PlayerData[playerid][OldurmeTDM] = 0;
	PlayerData[playerid][OlmeTDM] = 0;
	if(teamid == 0)
	{
	    new a = RandomEx(0, 2);
		PosDegistir(playerid, TeamAPos[a][0], TeamAPos[a][1], TeamAPos[a][2]);
		SetPlayerFacingAngle(playerid, TeamAPos[a][3]);
	}
	if(teamid == 1)
	{
 	    new ab = RandomEx(0, 2);
		PosDegistir(playerid, TeamBPos[ab][0], TeamBPos[ab][1], TeamBPos[ab][2]);
		SetPlayerFacingAngle(playerid, TeamBPos[ab][3]);
	}
	PlayerData[playerid][OldurmeDM] = 0;
	PlayerData[playerid][OlmeDM] = 0;
	PlayerData[playerid][OldurmeTDM] = 0;
	PlayerData[playerid][OlmeTDM] = 0;
	return 1;
}
stock DMYolla(playerid, areaid)
{
	if(Deathmatch[areaid][dmUyesayi] == MAX_DM_UYE) return HataMesajGonder(playerid, "Bu arena dolu, baþka arena seçin.");
	Deathmatch[areaid][dmUyesayi]++;
	for(new i = 0; i < 13; i++)
		SilahVer(playerid, Deathmatch[areaid][dmGuns][i], 10000);
	return 1;
}
stock DMSil(areaid)
{
	Deathmatch[areaid][dmUyesayi] = 0;
	Deathmatch[areaid][dmID] = GECERSIZ;
	for(new i = 0; i < 13; i++)
		Deathmatch[areaid][dmGuns][i] = 0;
	Deathmatch[areaid][dmArenaID] = GECERSIZ;
	Deathmatch[areaid][dmBir] = INVALID_PLAYER_ID;
	Deathmatch[areaid][dmIki] = INVALID_PLAYER_ID;
	Deathmatch[areaid][dmUc] = INVALID_PLAYER_ID;
	Deathmatch[areaid][dmArenaID] = GECERSIZ;
	return 1;
}
stock DMOlustur(areaid, weaps[13]);

Dialog:NEON(playerid, response, listitem, inputtext[])
{
	if(response)
	{
 		 if(listitem == 0)
   		 {
		     SetPVarInt(playerid, "neon", 1);
		     SetPVarInt(playerid, "Mavi", CreateObject(18648,0,0,0,0,0,0));
		     SetPVarInt(playerid, "Mavi2", CreateObject(18648,0,0,0,0,0,0));
		     AttachObjectToVehicle(GetPVarInt(playerid, "Mavi"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     AttachObjectToVehicle(GetPVarInt(playerid, "Mavi2"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     GameTextForPlayer(playerid, "~b~Mavi~w~ Renkli Neon Arabaniza Eklendi",3500,5);
     	 }
     	 if(listitem == 1)
     	 {
		     SetPVarInt(playerid, "neon", 1);
		     SetPVarInt(playerid, "Yeþil", CreateObject(18649,0,0,0,0,0,0));
		     SetPVarInt(playerid, "Yeþil2", CreateObject(18649,0,0,0,0,0,0));
		     AttachObjectToVehicle(GetPVarInt(playerid, "Yeþil"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     AttachObjectToVehicle(GetPVarInt(playerid, "Yeþil2"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     GameTextForPlayer(playerid, "~g~Yesil~w~ Renkli Neon Arabaniza Eklendi",3500,5);
	     }
	     if(listitem == 2)
	     {
		     SetPVarInt(playerid, "neon", 1);
		     SetPVarInt(playerid, "Sarý", CreateObject(18650,0,0,0,0,0,0));
		     SetPVarInt(playerid, "Sarý2", CreateObject(18650,0,0,0,0,0,0));
		     AttachObjectToVehicle(GetPVarInt(playerid, "Sarý"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     AttachObjectToVehicle(GetPVarInt(playerid, "Sarý2"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     GameTextForPlayer(playerid, "~y~Sari~w~ Renkli Neon Arabaniza Eklendi",3500,5);
	     }
	     if(listitem == 3)
	     {
		     SetPVarInt(playerid, "neon", 1);
		     SetPVarInt(playerid, "Beyaz", CreateObject(18652,0,0,0,0,0,0));
		     SetPVarInt(playerid, "Beyaz2", CreateObject(18652,0,0,0,0,0,0));
		     AttachObjectToVehicle(GetPVarInt(playerid, "Beyaz"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     AttachObjectToVehicle(GetPVarInt(playerid, "Beyaz2"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     GameTextForPlayer(playerid, "~w~Beyaz~w~ Renkli Neon Arabaniza Eklendi",3500,5);
	     }
	     if(listitem == 4)
	     {
		     SetPVarInt(playerid, "neon", 1);
		     SetPVarInt(playerid, "Pembe", CreateObject(18651,0,0,0,0,0,0));
		     SetPVarInt(playerid, "Pembe2", CreateObject(18651,0,0,0,0,0,0));
		     AttachObjectToVehicle(GetPVarInt(playerid, "Pembe"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     AttachObjectToVehicle(GetPVarInt(playerid, "Pembe2"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		     GameTextForPlayer(playerid, "~p~Pembe~w~ Renkli Neon Arabaniza Eklendi",3500,5);
	     }
	     if(listitem == 5)
	     {
		     DestroyObject(GetPVarInt(playerid, "Mavi"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Mavi2"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Yeþil"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Yeþil2"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Sarý"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Sarý2"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Beyaz"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Beyaz2"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Pembe"));
		     DeletePVar(playerid, "neon");
		     DestroyObject(GetPVarInt(playerid, "Pembe2"));
		     DeletePVar(playerid, "neon");
		     GameTextForPlayer(playerid, "~g~Neon Aracinizdan Silindi!",3500,5);
 		}
	}
	return 1;
}
Dialog:dmayar(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	
	}
}
Dialog:oyuncuayar(playerid, response, listitem, inputtext[])
{
	if(response)
	{

	}
}
Dialog:jail(playerid, response, listitem, inputtext[])
{
	new str[790];
	format(str, 790, "{0000FF}• Kalan Süre: {00FF00}%d •\t{0000FF}• Hapise Atan: {00FF00}%s •\t{0000FF}• Sebep: {00FF00}%s •\n{CCCCCC}• Lütfen bu pencereyi hapiste olduðunuz sürece kapatmayýnýz.", PlayerData[playerid][HapisSure], PlayerData[playerid][HapisAtan], PlayerData[playerid][HapisSebep]);
	Dialog_Show(playerid, jail, DIALOG_STYLE_MSGBOX, "» Hapis «",str, "Tamam", "Tamam");
}
Dialog:dm(playerid, response, listitem, inputtext[])
{
	if(response)
		MesajGonder(playerid, "Katýlmak istediðinz odanýn ID'sini öðrenip '/oyunkatil 0 (id)' þeklinde katýlabilirsiniz.");
}
Dialog:tdm(playerid, response, listitem, inputtext[])
{
	if(response)
		MesajGonder(playerid, "Katýlmak istediðiniz odanýn ID'sini öðrenip '/oyunkatil 1 (id)' þeklinde katýlabilirsiniz.");
}

Dialog:admpanel(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0:
			{
				new sam[670];
				format(sam, 670, "Lütfen PayDay maaþýný belirtiniz.\nÞuanki maaþ: $%d", paydayodul);
				Dialog_Show(playerid, samx, DIALOG_STYLE_INPUT, "Maaþ Belirleme", sam, "Tamam", "Ýptal");
			}
			case 1:
			{
				Dialog_Show(playerid, dmayar, DIALOG_STYLE_LIST, "Deathmatch Panel", "DM Oda Ayarlarý\nDM Odasý Oluþtur\nDM Odalarý\nDM Odasý Sil", "Seç", "Geri");
			}
			case 2:
			{
			    Dialog_Show(playerid, oyuncuayar, DIALOG_STYLE_INPUT, "Oyuncu ID", "Üzerinde deðiþiklik yapmak istediðiniz oyuncunun idsini girin.", "Tamam", "Ýptal");
			}
		}
	}
}
Dialog:samx(playerid, response, listitem, inputtext[])
{
	if(response)
	{
			    if(!IsNumeric(inputtext))
			    {
					new samz[670];
					format(samz, 670, "Lütfen PayDay maaþýný belirtiniz.\nÞuanki maaþ: $%d\nGirdiðiniz içerik sayý olmalýdýr!", paydayodul);
   					Dialog_Show(playerid, samx, DIALOG_STYLE_INPUT, "Maaþ Belirleme", samz, "Tamam", "Ýptal");
				}
				if(strlen(inputtext) > 10000)
				{
					new sammz[670];
					format(sammz, 670, "Lütfen PayDay maaþýný belirtiniz.\nÞuanki maaþ: $%d\nGirdiðiniz sayý $10.000 den büyük olmamaldýr!", paydayodul);
   					Dialog_Show(playerid, samx, DIALOG_STYLE_INPUT, "Maaþ Belirleme", sammz, "Tamam", "Ýptal");
				}
				new mam[350];
				paydayodul = strval(inputtext);
				format(mam, 350,"%s adlý yetkili saatlik maaþý $%d olarak deðiþtirdi!", paydayodul);
				HM(COLOR_GREEN, mam);

	}
	return 1;
}
Dialog:KAYITT(playerid, response, listitem, inputtext[])
{
			if(!response)
			{
				Kick(playerid);
	  		}
			if(response)
			{
				new str[1000], std[1000], sss[1000];
				format(str, 1000, "Þifre boþ olamaz!\nKayýt olmak için lütfen aþþaðýya þifreni gir.");
				format(std, 1000, "Þifre rakam içermelidir!\nKayýt olmak için lütfen aþþaðýya þifreni gir.");
				format(sss, 1000, "Þifre en fazla 23 karakter olmalýdýr.!\nKayýt olmak için lütfen aþþaðýya þifreni gir.");
			    if(isnull(inputtext)) return Dialog_Show(playerid, KAYITT, DIALOG_STYLE_PASSWORD, "Kayýt",str, "Devam", "Ýptal");
			    if(!IsNumeric(inputtext)) return Dialog_Show(playerid, KAYITT, DIALOG_STYLE_PASSWORD, "Kayýt",std, "Devam", "Ýptal");
			    if(strlen(inputtext) > 23) return Dialog_Show(playerid, KAYITT, DIALOG_STYLE_PASSWORD, "Kayýt", sss, "Devam", "Ýptal");
			    format(PlayerData[playerid][Sifre], 23, inputtext);
			    BilgiMesajGonder(playerid, "Baþarýyla kayýt oldunuz, yardým için /rapor.");
			    PlayerData[playerid][Kaydoldu] = 1;
				Spawnla(playerid);
				ResetPlayer(playerid);
			}
	return 1;
}
Dialog:DIALOG_OYLAMABASLAT(playerid, response, listitem, inputtext[])
{
			if(response)
   			{
		        if(isnull(inputtext)) return Dialog_Show(playerid,DIALOG_OYLAMABASLAT,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 1","Lütfen oyunculara sormak istediðiniz soruyu girin:","Devam","Kapat");
		        if(strlen(inputtext) < 5 || strlen(inputtext) > 50)
		        {
		            SendClientMessage(playerid,-1,"{FF0000}[HATA] {FFFFFF}Soru 5 ile 50 karakter arasýnda olmalýdýr.");
		            return Dialog_Show(playerid,DIALOG_OYLAMABASLAT,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 1","Lütfen oyunculara sormak istediðiniz soruyu girin:","Devam","Kapat");
		        }
		        format(oySoru[playerid],50,inputtext);
		        Dialog_Show(playerid,DIALOG_OYLAMABASLAT2,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 2","Lütfen bu soru için birinci seçeneði girin:","Devam","Kapat");
		    }
		    return 1;
}
Dialog:DIALOG_OYLAMABASLAT2(playerid, response, listitem, inputtext[])
{
		    if(!response)
		    {
		        format(oySoru[playerid],50,"");
		    }
		    if(response)
		    {
		        if(isnull(inputtext)) return Dialog_Show(playerid,DIALOG_OYLAMABASLAT2,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 2","Lütfen bu soru için birinci seçeneði girin:","Devam","Kapat");
		        if(strlen(inputtext) > 20)
		        {
		            SendClientMessage(playerid,-1,"{FF0000}[HATA] {FFFFFF}Seçenek 1, 20 karakterden fazla olamaz.");
		            return Dialog_Show(playerid,DIALOG_OYLAMABASLAT2,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 2","Lütfen bu soru için birinci seçeneði girin:","Devam","Kapat");
		        }
		        format(oySecenek[playerid],20,inputtext);
		        Dialog_Show(playerid,DIALOG_OYLAMABASLAT3,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 3","Lütfen bu soru için ikinci seçeneði girin:","Devam","Kapat");
		    }
		    return 1;
}
Dialog:DIALOG_OYLAMABASLAT3(playerid, response, listitem, inputtext[])
{
		    if(!response)
		    {
		        format(oySoru[playerid],50,"");
				format(oySecenek[playerid],20,"");
		    }
		    if(response)
		    {
		        if(isnull(inputtext)) return Dialog_Show(playerid,DIALOG_OYLAMABASLAT3,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 3","Lütfen bu soru için ikinci seçeneði girin:","Devam","Kapat");
		        if(strlen(inputtext) > 20) return Dialog_Show(playerid,DIALOG_OYLAMABASLAT3,DIALOG_STYLE_INPUT,"{00FFB7}Oylama Baþlat - Adým 3","Lütfen bu soru için ikinci seçeneði girin:","Devam","Kapat");
		        if(Oylama[Baslatildi] == true)
		        {
		            format(oySoru[playerid],50,"");
					format(oySecenek[playerid],20,"");
		            return 1;
		        }
		        Oylama[Baslatildi] = true;
		        format(Oylama[oSoru],50,oySoru[playerid]);
		        format(Oylama[oSecenek1],20,oySecenek[playerid]);
		        format(Oylama[oSecenek2],20,inputtext);
		        Oylama[oTimer] = SetTimer("OylamaBitir",OYLAMA_TIMER*1000,false);
		        new string[150];
		        format(string,sizeof(string),"{66FF00}[OYLAMA]: Soru: %s",Oylama[oSoru]);
		        HM(-1,string);
		        HM(-1,"{66FF00}[OYLAMA]: {FFFFFF}Bu soruya oy vermek için /oyver komutunu kullanýnýz.");
			}
			return 1;
}
Dialog:DIALOG_OYLA(playerid, response, listitem, inputtext[])
{
		    new str[100];
		    if(!response)
		    {
		        if(Oylama[Baslatildi] == false) return 1;
		        Oylama[oSayi][1]++;
		        oyKullandi[playerid] = 1;
		        format(str,sizeof(str),"{66FF00}Oyunuzu %s yönünde kullandýnýz. Sonuçlar birazdan açýklanacaktýr.",Oylama[oSecenek2]);
		        SendClientMessage(playerid,-1,str);
		    }
		    if(response)
		    {
		        if(Oylama[Baslatildi] == false) return 1;
		        Oylama[oSayi][0]++;
		        oyKullandi[playerid] = 1;
		        format(str,sizeof(str),"{66FF00}Oyunuzu %s yönünde kullandýnýz. Sonuçlar birazdan açýklanacaktýr.",Oylama[oSecenek1]);
		        SendClientMessage(playerid,-1,str);
		    }
			return 1;
}

stock MesafeBul( Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2 )
{
	return ( x1 + y1 + z1 ) - ( x2 + y2 + z2 );
}/*
public GetPlayerLastShotVectors(playerid, Float:fOriginX, Float:fOriginY, Float:fOriginZ, Float:fHitPosX, Float:fHitPosY, Float:fHitPosZ)
{
	new Float:xox = (fOriginX + fOriginY, fOriginZ) - (fHitPosX + fHitPosY + fHitPosZ);//MesafeBul(fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);
	new Float:yy;
	new count = 0;
	GetPlayerFacingAngle(playerid, yy);
 	new id = NearestPlayer(fHitPosX, fHitPosY, fHitPosZ, 0.1);
	if(xox > 1000)
	{ // bill gates? bruh.
		if(PlayerData[id][pSonHasarAlmaZaman] != -1)
			count++;
		if(count > 5)
		{
			BilgiMesajGonder(playerid, "distance: %f, angle: %f.", xox, yy);
			foreach(new i : Player)
			{
				if(PlayerData[i][AdmLevel] != 0)
				{
					SendClientMessage(playerid, COLOR_RED, "Hile Log: %s adlý oyuncu Slient Aimbot kullanýyor olabilir(distance: %f)", ReturnName(playerid), xox);
				}
			}
			new ttd[560];
			new Float:std, Float:dts;
			GetPlayerFacingAngle(id, std);
			GetPlayerFacingAngle(playerid, dts);
			format(ttd, "Size ateþ eden %s(%d) oyuncuda hile tespiti yapýldý, (Your Angle: %f, %s Angle: %f) hile olduðunu düþünüyorsanýz þikayet oluþturun", ReturnName(playerid), playerid, std, dts);
			MesajGonder(id, "ttd);
		}
	}
	return 1;
}
*/
public OnVehicleMod(playerid, vehicleid, componentid)
{
	if (GetPlayerInterior(playerid) == 0)
	{
	    HileKullaniyo(playerid, "Tunning Hack", 0);
	    return 0;
	}
	return 1;
}
public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	new weapname[32];
	GetWeaponName(weaponid, weapname, sizeof(weapname));
	if(GetPVarInt(playerid, weapname) < 1)
	{
		HileKullaniyo(playerid, "Hile Kullanýmý", 0);
		SetPVarInt(playerid, weapname, GetPVarInt(playerid, weapname) -1);
		return 0;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		HileKullaniyo(playerid, "Sürücü Drive By", 0);
	}
	if (!GetPlayerWeapon(playerid) && weaponid != 0)
 	{
  		HileKullaniyo(playerid, "Silahsýz Ateþ", 0);
  	}
  	if (IsPlayerPause(playerid))
    {
		HileKullaniyo(playerid, "Weapon Hack", 0);
        return 0;
    }
  	if (hittype == BULLET_HIT_TYPE_PLAYER)
  	{
	  	new Float:fOriginX, Float:fOriginY, Float:fOriginZ, Float:fHitPosX, Float:fHitPosY, Float:fHitPosZ, Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		GetPlayerLastShotVectors(playerid, fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);

		new Float:yyyy = VectorSize(fOriginX - fHitPosX, fOriginY - fHitPosY, fOriginZ - fHitPosZ); // origin ile hit arasýndaki vektör boyutu.
		new Float:xxxx = VectorSize(fOriginX - x, fOriginY - y, fOriginZ - z);
		if(yyyy > 50.00)
		{

			    new formats[450], fmx[450], fff[500];
			    format(fff, 500, "%s adlý oyuncu Slient Aimbot kullanýyor olabilir. (Hasar Verdimi: Evet)(Hasar Alan Oyuncu ID: %d)(distance: %f)", ReturnName(playerid), hitid, yyyy);
			    format(fmx, 450, "Size ateþ eden %s adlý oyuncuda Slient Aimbot tespit edildi.", ReturnName(playerid));
			    format(formats, 450, "origin dist %f. length %f. Slient Aimbot tespit edildi.", xxxx, yyyy);
				MesajGonder(playerid, formats);
				MesajGonder(hitid, fmx);
				SendAdminAlert(fff);
		}
	}
	PlayerData[hitid][SonHasarAlmaZaman] = 0;
	PlayerData[playerid][SonHasarVermeZaman] = 0;

	return 1;
}
stock Skill(playerid)
{
	new a = 0;
	if(PlayerData[playerid][pSonOldurmeZaman] <= 8)
	{
		if(Ikide[playerid] == true && Ucte[playerid] == false && Dortte[playerid] == false && Beste[playerid] == false)
			a = 2;
		if(Ikide[playerid] == false && Ucte[playerid] == true && Dortte[playerid] == false && Beste[playerid] == false)
			a = 3;
		if(Ikide[playerid] == false && Ucte[playerid] == false && Dortte[playerid] == true && Beste[playerid] == false)
			a = 4;
		if(Ikide[playerid] == false && Ucte[playerid] == false && Dortte[playerid] == false && Beste[playerid] == true)
			a = 5;
   	}
   	return a;
}
public OnPlayerDeath(playerid, killerid, reason)
{// [0 = DM | 9999 = TDM | 2 = Freeroam | 3 = Düello | -1 = Lobi]
	foreach(new i:Player)
	{
	    if(PlayerData[i][Oyun] == PlayerData[playerid][Oyun])
	        SendDeathMessageToPlayer(i, killerid, playerid, reason);
	}
	if(killerid != INVALID_PLAYER_ID)
	{
	    new x, y;
	    x = GetPlayerVirtualWorld(playerid);
	    y = GetPlayerVirtualWorld(killerid);
		if(x != y) HileKullaniyo(killerid, "Hile", 0);
	    GiveCash(killerid, KillOdul);
	    GiveScore(killerid, 1);
	    if(PlayerData[killerid][pVip] != 0) { GiveCash(killerid, VIPEKS); GiveScore(killerid, 1); }
		GiveCash(playerid, -KillOdul);
		GiveScore(playerid, -1);
		if(Godmode[playerid] == true || Godmode[killerid] == true)
			SpawnPlayer(playerid);
		if(PlayerData[playerid][Oyun] == 3 || PlayerData[playerid][Oyun] == -1)
			SpawnPlayer(playerid);
		PlayerData[killerid][pSonOldurmeZaman] = 0;
		PlayerData[playerid][pSonOlmeZaman] = 0;
		switch(PlayerData[killerid][Oyun])
		{
		    case 0:
		    {
		        PlayerData[killerid][OldurmeDM]++;
		        PlayerData[playerid][OlmeDM]++;
		    }
		    case TDMID:
		    {
      			if(PlayerData[killerid][pTDMTakimID] == 1)
		        	TDeathmatch[tdmT1oldurme]++;
 		        if(PlayerData[playerid][pTDMTakimID] == 2)
		        	TDeathmatch[tdmT2oldurme]++;

		        if(PlayerData[playerid][pTDMTakimID] == 1)
		        	TDeathmatch[tdmT1olme]++;
 		        if(PlayerData[playerid][pTDMTakimID] == 2)
		        	TDeathmatch[tdmT2olme]++;
		    }
		}
		if(PlayerData[killerid][pSonOldurmeZaman] != 5 || PlayerData[killerid][pSonOldurmeZaman] > 5 && PlayerData[killerid][Oyun] == 0)
		{
			foreach(new i : Player) { if(PlayerData[i][Oyun] == 0){
				SendClientMessageEx(i, COLOR_WHITE, "{CCCCCC}%s {00FFFF}adlý oyuncu, {CCCCCC}%s {00FFFF}adlý oyuncuyu öldürdü[%s].", ReturnName(killerid), ReturnName(playerid));
				}
			}
		}
		if(PlayerData[killerid][pSonOldurmeZaman] != 5 || PlayerData[killerid][pSonOldurmeZaman] > 5 && PlayerData[killerid][Oyun] == TDMID)
		{
			foreach(new i : Player) { if(PlayerData[i][Oyun] == TDMID) {
				SendClientMessageEx(i, COLOR_WHITE, "{CCCCCC}%s {00FFFF}adlý takým, {CCCCCC}%s {00FFFF}takýmýndan birini katlederek puan kazandý.", (PlayerData[killerid][pTDMTakimID] == 0) ? ("A") : ("B"), (PlayerData[playerid][pTDMTakimID] == 0) ? ("A") : ("B"));
				}
			}
		}
		new b = Skill(killerid);
		new ttu[650];
		switch (b)
		{
			case 2: format(ttu, 650, "%s adlý oyuncu %s adlý oyuncu katlederek ikide iki yaptý!", ReturnName(killerid), ReturnName(playerid));
			case 3: format(ttu, 650, "%s adlý oyuncu %s adlý oyuncu katlederek üçte üç yaptý!", ReturnName(killerid), ReturnName(playerid));
			case 4: format(ttu, 650, "%s adlý oyuncu %s adlý oyuncu katlederek dörtte dört yaptý!", ReturnName(killerid), ReturnName(playerid));
			case 5: format(ttu, 650, "%s adlý oyuncu %s adlý oyuncu katlederek beþte beþ yaptý!", ReturnName(killerid), ReturnName(playerid));
		}
		HM(COLOR_LIGHTGREEN, ttu);
	}
   	return 1;
}
stock AyniVWdekiler(playerid)
{
	new vw1, vw[MAX_PLAYERS];
	GetPlayerVirtualWorld(playerid, vw1);
	foreach(new i : Player)
	{
	    GetPlayerVirtualWorld(i, vw[i]);
	    if(vw[i] == vw1)
	        return i;
	}
	return GECERSIZ;
}


//----------------------------------------------------------
public OnPlayerDisconnect(playerid, reason)
{
	SendDeathMessage(INVALID_PLAYER_ID,playerid,ICON_DISCONNECT);
    oyKullandi[playerid] = 0;
   	if(balonda[playerid] == 1)
	{
	    balonda[playerid] = 0;
	    balonkontrol[playerid] = 0;
	    DestroyObject(balonobje[playerid]);
	    DestroyObject(balonates[playerid][0]);
	    DestroyObject(balonates[playerid][1]);
	    for(new i; i<6; i++)
	    {
	        KillTimer(timerler[playerid][i]);
	    }
	}
    return 1;
}
public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if(KOSKoruma[damagedid] == true) return false;
    if(Godmode[playerid] == true) return false;
    return 1;
}
//----------------------------------------------------------
public OnGamemodeExit()
{
	KillTimer(HGS);

 	TextDrawDestroy(Text:ArkaPlan0);
    TextDrawDestroy(Text:ArkaPlan1);
    TextDrawDestroy(Text:ArkaPlan2);
    TextDrawDestroy(Text:ArkaPlan3);
    TextDrawDestroy(Text:ArkaPlan4);
    TextDrawDestroy(Text:ArkaPlan5);
    TextDrawDestroy(Text:ArkaPlan6);
    TextDrawDestroy(Text:Cizgi);

   	for(new i=0; i<GetMaxPlayers(); i++)
	{
		TextDrawDestroy(GostergeYazi[i]);
		TextDrawDestroy(Hizg[i]);
		TextDrawDestroy(Cang[i]);
	}
	return 1;
}
public OnGameModeInit()
{
	paydayodul = 0;
	YarismaDurum = false;
	TahminSayi = 0;
	TahminOdul = 0;
	aTeamSayi = 0;
	bTeamSayi = 0;

    ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetTimer("exSaat", 1000, 1);
	SaatBox = TextDrawCreate(606.000000, 101.000000, "_");
	TextDrawBackgroundColor(SaatBox, 255);
	TextDrawFont(SaatBox, 1);
	TextDrawLetterSize(SaatBox, 0.500000, 3.200000);
	TextDrawColor(SaatBox, -1);
	TextDrawSetOutline(SaatBox, 0);
	TextDrawSetProportional(SaatBox, 1);
	TextDrawSetShadow(SaatBox, 1);
	TextDrawUseBox(SaatBox, 1);
	TextDrawBoxColor(SaatBox, 102);
	TextDrawTextSize(SaatBox, 499.000000, 4.000000);
	TextDrawSetSelectable(SaatBox, 0);

	Saat = TextDrawCreate(553.000000, 98.000000, "15~r~:~w~33~r~:~w~22");
	TextDrawAlignment(Saat, 2);
	TextDrawBackgroundColor(Saat, 102);
	TextDrawFont(Saat, 2);
	TextDrawLetterSize(Saat, 0.499999, 1.900000);
	TextDrawColor(Saat, -1);
	TextDrawSetOutline(Saat, 1);
	TextDrawSetProportional(Saat, 1);
	TextDrawSetSelectable(Saat, 0);

	Tarih = TextDrawCreate(554.000000, 119.000000, "~w~02~r~/~w~04~r~/~w~2017");
	TextDrawAlignment(Tarih, 2);
	TextDrawBackgroundColor(Tarih, 102);
	TextDrawFont(Tarih, 2);
	TextDrawLetterSize(Tarih, 0.240000, 1.100000);
	TextDrawColor(Tarih, -1);
	TextDrawSetOutline(Tarih, 1);
	TextDrawSetProportional(Tarih, 1);
	TextDrawSetSelectable(Tarih, 0);

	Cizgix = TextDrawCreate(498.000000, 111.000000, "~r~-");
	TextDrawBackgroundColor(Cizgix, 102);
	TextDrawFont(Cizgix, 1);
	TextDrawLetterSize(Cizgix, 7.639996, 1.000000);
	TextDrawColor(Cizgix, -1);
	TextDrawSetOutline(Cizgix, 1);
	TextDrawSetProportional(Cizgix, 1);
	TextDrawSetSelectable(Cizgix, 0);
	
 	HGS = SetTimer("GostergeYenile",300,1);
	ArkaPlan0 = TextDrawCreate(611.000000,377.000000,"_");
	TextDrawUseBox(ArkaPlan0,1);
	TextDrawBoxColor(ArkaPlan0,0x00000033);
	TextDrawTextSize(ArkaPlan0,529.000000,0.000000);
	TextDrawAlignment(ArkaPlan0,0);
	TextDrawBackgroundColor(ArkaPlan0,0x000000ff);
	TextDrawFont(ArkaPlan0,1);
	TextDrawLetterSize(ArkaPlan0,-3.700000,5.100007);
	TextDrawColor(ArkaPlan0,0xffffffff);
	TextDrawSetProportional(ArkaPlan0,1);
	TextDrawSetShadow(ArkaPlan0,1);

	ArkaPlan1 = TextDrawCreate(611.000000,375.000000,"_");
	TextDrawUseBox(ArkaPlan1,1);
	TextDrawBoxColor(ArkaPlan1,0x000000ff);
	TextDrawTextSize(ArkaPlan1,530.000000,185.000000);
	TextDrawAlignment(ArkaPlan1,0);
	TextDrawBackgroundColor(ArkaPlan1,0x000000ff);
	TextDrawFont(ArkaPlan1,3);
	TextDrawLetterSize(ArkaPlan1,2.799999,-0.200000);
	TextDrawColor(ArkaPlan1,0xffffffff);
	TextDrawSetOutline(ArkaPlan1,1);
	TextDrawSetProportional(ArkaPlan1,1);
	TextDrawSetShadow(ArkaPlan1,1);

	ArkaPlan2 = TextDrawCreate(532.000000,375.000000,"_");
	TextDrawUseBox(ArkaPlan2,1);
	TextDrawBoxColor(ArkaPlan2,0x000000ff);
	TextDrawTextSize(ArkaPlan2,530.000000,32.000000);
	TextDrawAlignment(ArkaPlan2,0);
	TextDrawBackgroundColor(ArkaPlan2,0x000000ff);
	TextDrawFont(ArkaPlan2,3);
	TextDrawLetterSize(ArkaPlan2,1.000000,5.299999);
	TextDrawColor(ArkaPlan2,0xffffffff);
	TextDrawSetOutline(ArkaPlan2,1);
	TextDrawSetProportional(ArkaPlan2,1);
	TextDrawSetShadow(ArkaPlan2,1);

	ArkaPlan3 = TextDrawCreate(532.000000,426.000000,"_");
	TextDrawUseBox(ArkaPlan3,1);
	TextDrawBoxColor(ArkaPlan3,0x000000ff);
	TextDrawTextSize(ArkaPlan3,609.000000,82.000000);
	TextDrawAlignment(ArkaPlan3,0);
	TextDrawBackgroundColor(ArkaPlan3,0x000000ff);
	TextDrawFont(ArkaPlan3,3);
	TextDrawLetterSize(ArkaPlan3,1.500000,-0.200000);
	TextDrawColor(ArkaPlan3,0xffffffff);
	TextDrawSetOutline(ArkaPlan3,1);
	TextDrawSetProportional(ArkaPlan3,1);
	TextDrawSetShadow(ArkaPlan3,1);

	ArkaPlan4 = TextDrawCreate(613.000000,375.000000,"_");
	TextDrawUseBox(ArkaPlan4,1);
	TextDrawBoxColor(ArkaPlan4,0x000000ff);
	TextDrawTextSize(ArkaPlan4,607.000000,-1.000000);
	TextDrawAlignment(ArkaPlan4,0);
	TextDrawBackgroundColor(ArkaPlan4,0x000000ff);
	TextDrawLetterSize(ArkaPlan4,0.199999,5.399997);
	TextDrawFont(ArkaPlan4,3);
	TextDrawColor(ArkaPlan4,0xffffffff);
	TextDrawSetOutline(ArkaPlan4,1);
	TextDrawSetProportional(ArkaPlan4,1);
	TextDrawSetShadow(ArkaPlan4,1);

	ArkaPlan5 = TextDrawCreate(538.000000,397.000000,"_");
	TextDrawUseBox(ArkaPlan5,1);
	TextDrawBoxColor(ArkaPlan5,0x00ff0033);
	TextDrawTextSize(ArkaPlan5,603.000000,64.000000);
	TextDrawAlignment(ArkaPlan5,0);
	TextDrawBackgroundColor(ArkaPlan5,0x000000ff);
	TextDrawFont(ArkaPlan5,3);
	TextDrawLetterSize(ArkaPlan5,1.000000,-0.000000);
	TextDrawColor(ArkaPlan5,0xffffffff);
	TextDrawSetOutline(ArkaPlan5,1);
	TextDrawSetProportional(ArkaPlan5,1);
	TextDrawSetShadow(ArkaPlan5,1);

	ArkaPlan6 = TextDrawCreate(607.000000,420.000000,"_");
	TextDrawUseBox(ArkaPlan6,1);
	TextDrawBoxColor(ArkaPlan6,0xff000033);
	TextDrawTextSize(ArkaPlan6,534.000000,0.000000);
	TextDrawAlignment(ArkaPlan6,0);
	TextDrawBackgroundColor(ArkaPlan6,0x000000ff);
	TextDrawFont(ArkaPlan6,3);
	TextDrawLetterSize(ArkaPlan6,1.000000,-0.000000);
	TextDrawColor(ArkaPlan6,0xffffffff);
	TextDrawSetOutline(ArkaPlan6,1);
	TextDrawSetProportional(ArkaPlan6,1);
	TextDrawSetShadow(ArkaPlan6,1);

	Cizgi = TextDrawCreate(556.000000,420.000000,"_");
	TextDrawUseBox(Cizgi,1);
	TextDrawBoxColor(Cizgi,0xffffffff);
	TextDrawTextSize(Cizgi,551.000000,0.000000);
	TextDrawAlignment(Cizgi,0);
	TextDrawBackgroundColor(Cizgi,0x000000ff);
	TextDrawFont(Cizgi,3);
	TextDrawLetterSize(Cizgi,0.199999,-0.000000);
	TextDrawColor(Cizgi,0xffffffff);
	TextDrawSetOutline(Cizgi,1);
	TextDrawSetProportional(Cizgi,1);
	TextDrawSetShadow(Cizgi,1);

	for(new i=0; i<GetMaxPlayers(); i++)
	{
		Gosterge[i] = 1;
  		GostergeYazi[i] = TextDrawCreate(535.000000,376.000000, " ");
    	TextDrawAlignment(GostergeYazi[i],0);
     	TextDrawBackgroundColor(GostergeYazi[i],0x000000ff);
      	TextDrawFont(GostergeYazi[i],1);
		TextDrawLetterSize(GostergeYazi[i],0.199999,0.899999);
  		TextDrawSetProportional(GostergeYazi[i],1);
    	TextDrawSetShadow(GostergeYazi[i],1);
     	TextDrawColor(GostergeYazi[i],0xffff00ff);

		Hizg[i] = TextDrawCreate(538.000000,397.000000,"_");
		TextDrawUseBox(Hizg[i],1);
		TextDrawBoxColor(Hizg[i],0x00ff0066);
		TextDrawAlignment(Hizg[i],0);
		TextDrawBackgroundColor(Hizg[i],0x000000ff);
		TextDrawFont(Hizg[i],3);
		TextDrawLetterSize(Hizg[i],9.100000,-0.000000);
		TextDrawColor(Hizg[i],0xffffffff);
		TextDrawSetOutline(Hizg[i],1);
		TextDrawSetProportional(Hizg[i],1);
		TextDrawSetShadow(Hizg[i],1);

		Cang[i] = TextDrawCreate(538.000000,420.000000,"_");
		TextDrawUseBox(Cang[i],1);
		TextDrawBoxColor(Cang[i],0xff000066);
		TextDrawAlignment(Cang[i],0);
		TextDrawBackgroundColor(Cang[i],0x000000ff);
		TextDrawFont(Cang[i],3);
		TextDrawLetterSize(Cang[i],1.000000,-0.000000);
		TextDrawColor(Cang[i],0xffffffff);
		TextDrawSetOutline(Cang[i],1);
		TextDrawSetProportional(Cang[i],1);
		TextDrawSetShadow(Cang[i],1);

	}
	///////////////////////////
	TeamAPos[0][0] = 2170.7734;
	TeamAPos[0][1] = -1810.2108;
	TeamAPos[0][2] = 13.3757;
	TeamAPos[0][3] = 2.0494;
	///////////////////////////
	TeamAPos[1][0] = 2164.2251;
	TeamAPos[1][1] = -1812.6514;
	TeamAPos[1][2] = 13.5469;
	TeamAPos[1][3] = 295.5702;
	///////////////////////////
	TeamAPos[2][0] = 2177.2317;
	TeamAPos[2][1] = -1811.8984;
	TeamAPos[2][2] = 13.5469;
	TeamAPos[2][3] = 273.0518;
	///////////////////////////
	///////////////////////////
	///////////////////////////
	TeamBPos[0][0] = 2117.1809;
	TeamBPos[0][1] = -1590.5281;
	TeamBPos[0][2] = 13.5497;
	TeamBPos[0][3] = 3.9139;
	///////////////////////////
	TeamBPos[1][0] = 2111.1394;
	TeamBPos[1][1] = -1589.6772;
	TeamBPos[1][2] = 13.5425;
	TeamBPos[1][3] = 353.8036;
	///////////////////////////
	TeamBPos[2][0] = 2105.4099;
	TeamBPos[2][1] = -1590.4081;
	TeamBPos[2][2] = 13.5148;
	TeamBPos[2][3] = 7.1309;
	///////////////////////////
	Map_Yukle();
	AntiDeAMX();
	WasteDeAMXersTime();
	SetTimer("MinuteUpdate",60000,true);
	SetTimer("SecondUpdate",900,true);
	SetTimer("Milisaniye",1,true);
	SetTimer("Saataga",3600000,true);
	return 1;
}
forward Saataga();
public Saataga()
{
	foreach(new i:Player)
	{
		if(PlayerData[i][pSpawned])
		    PlayerData[i][oynamaSaati]++;
	}
}
forward Milisaniye();
public Milisaniye()
{
	foreach(new i:Player)
	{
		if(PlayerData[i][pSpawned])
		{
			if(PlayerData[i][SonHasarAlmaZaman] != -1)
			    PlayerData[i][SonHasarAlmaZaman]++;
			if(PlayerData[i][SonHasarVermeZaman] != -1)
				PlayerData[i][SonHasarVermeZaman]++;
		}
	}
}
forward MinuteUpdate();
public MinuteUpdate()
{
	foreach(new i : Player)
	{
		if(PlayerData[i][pSpawned])
		{
				if(PlayerData[i][HapisSure] == 0)
				    Hapiste[i] = false;
				PlayerData[i][PayDaySure]++;
			    if(Hapiste[i])
				{
					PlayerData[i][HapisSure]--;
					new str[790];
					format(str, 790, "{0000FF}• Kalan Süre: {00FF00}%d •\t{0000FF}• Hapise Atan: {00FF00}%s •\t{0000FF}• Sebep: {00FF00}%s •\n{CCCCCC}• Lütfen bu pencereyi hapiste olduðunuz sürece kapatmayýnýz.", PlayerData[i][HapisSure], PlayerData[i][HapisAtan], PlayerData[i][HapisSebep]);
					Dialog_Show(i, jail, DIALOG_STYLE_MSGBOX, "» Hapis «",str, "Tamam", "Tamam");
					if(PlayerData[i][PayDaySure] == 60)
						MesajGonder(i, "Hapiste olduðun için bu maaþý kaçýrdýn!");
				}
				else
				{
					if(PlayerData[i][PayDaySure] == 60)
					{
					    new dgko[670];
					    format(dgko, 670, "{CCCCCC}Oyunda 1 saat bulunduðunuz için saatlik ücret olarak {0000FF}$%d {CCCCCC}kazandýnýz!", paydayodul);
						GiveCash(i, paydayodul);
						MesajGonder(i, dgko);
					}
				}
		}
	}
	return 1;
}
stock getTime()
{
	new Saat[3], m[256];
	gettime(Saat[0], Saat[1], Saat[2]);

	format(m, sizeof(m), "%02d:%02d", Saat[0], Saat[1]);
	return m;
}
forward SecondUpdate();
public SecondUpdate()
{
	new Time[2];
	gettime(Time[0], Time[1]);
	SetWorldTime(Time[0]);
	foreach(new playerid : Player)
	{
	    SetPlayerTime(playerid, Time[0], Time[1]);
	    if(PlayerData[playerid][pSonOldurmeZaman] != -1)
			PlayerData[playerid][pSonOldurmeZaman]++;
		if(Muted[playerid])
		    PlayerData[playerid][MuteSure]--;
		if(PlayerData[playerid][HapisSure] <= 0)
		    Spawnla(playerid);
	    if(PlayerData[playerid][pSonOlmeZaman] != -1)
			PlayerData[playerid][pSonOlmeZaman]++;
	}
	return 1;
}
//----------------------------------------------------------
forward Kos_Koruma(playerid);
public Kos_Koruma(playerid)
{
	KOSKoruma[playerid] = true;
	SetPlayerChatBubble(playerid, "[KOS Koruma]", COLOR_GREEN, 10.0, 5000);
   	TogglePlayerControllable(playerid, 0);
   	SetTimerEx("Antikos", 5000, false,"d", playerid);
	return 1;
}
forward Antikos(playerid);
public Antikos(playerid)
{
	KOSKoruma[playerid] = false;
   	TogglePlayerControllable(playerid, 1);
   	return 1;
}
stock Map_Yukle(){
	//baya büyük bi arena clan war için uygun
	CreateObject(19550, -188.36566, 25.83386, 4.33260,   0.00000, 0.00000, -19.26000);
	CreateObject(19550, 37.50950, -52.78980, 4.35460,   0.04530, 0.00000, -19.26000);
	CreateObject(19550, -80.31960, -11.64040, 4.35460,   0.04530, 0.00000, -19.26000);
	CreateObject(19550, -171.06210, 107.18940, 4.40460,   0.00000, 0.00000, -19.26000);
	CreateObject(19550, -53.12312, 65.95869, 4.40460,   0.00000, 0.00000, -19.26000);
	CreateObject(19550, 64.57230, 24.77450, 4.40460,   0.00000, 0.00000, -19.26000);
	CreateObject(19550, 30.49630, -73.02523, 4.35460,   0.04530, 0.00000, -19.26000);
	CreateObject(19550, -225.76953, -92.65704, 4.40460,   0.00000, 0.00000, -19.26000);
	CreateObject(19550, -113.44648, -123.64100, 4.40460,   0.00000, 0.00000, -11.57999);
	CreateObject(19550, 6.46889, -147.04012, 4.35460,   0.04530, 0.00000, -9.48001);
	CreateObject(5836, -190.08452, 156.47586, 16.14403,   0.00000, 0.00000, 0.00000);
	CreateObject(8620, -175.46797, 154.68236, 27.77219,   0.00000, 0.00000, 18.00000);
	CreateObject(11444, -84.12066, -112.20272, 4.40150,   0.00000, 0.00000, 12.54000);
	CreateObject(11443, -162.50058, 147.06161, 4.59400,   0.00000, 0.00000, 37.26000);
	CreateObject(3415, -198.09590, 147.16559, 4.40270,   0.00000, 0.00000, 383.99930);
	CreateObject(9076, -103.90587, -23.84804, 21.54330,   0.00000, 0.00000, -22.19999);
	CreateObject(9076, -85.11570, -31.97990, 21.54330,   0.00000, 0.00000, 159.70003);
	CreateObject(8881, 3.18450, -168.75720, 38.55910,   0.00000, 0.00000, 489.48001);
	CreateObject(939, -144.42168, -35.11485, 6.75970,   0.00000, 0.00000, 25.38000);
	CreateObject(3761, -125.97102, 13.99999, 6.36330,   0.00000, 0.00000, 6.66000);
	CreateObject(3761, -83.32198, 11.96366, 6.36330,   0.00000, 0.00000, -47.28001);
	CreateObject(3761, -46.69231, -6.03571, 6.36330,   0.00000, 0.00000, -47.28001);
	CreateObject(2604, -35.17562, -38.93902, 5.13270,   0.00000, 0.00000, 16.38000);
	CreateObject(17031, -57.84507, -161.08569, 2.52175,   0.00000, 0.00000, -35.81998);
	CreateObject(17031, -196.75752, 92.56764, 2.30198,   0.00000, 0.00000, -35.81998);
	CreateObject(17060, -145.21164, 144.00476, 4.39210,   0.00000, 0.00000, 11.34000);
	CreateObject(1358, -120.70203, 107.02035, 5.61470,   0.00000, 0.00000, 0.00000);
	CreateObject(11293, 58.03480, -81.07501, 10.16302,   0.00000, 0.00000, -50.52000);
	CreateObject(2935, 0.50996, -14.12672, 5.87010,   0.00000, 0.00000, 0.00000);
	CreateObject(2935, 8.64304, 19.41779, 5.84640,   0.00000, 0.00000, -51.24000);
	CreateObject(2935, 8.60983, 41.54618, 5.87010,   0.00000, 0.00000, -94.20000);
	CreateObject(11686, 33.24710, 61.93110, 4.42330,   0.00000, 0.00000, 280.01959);
	CreateObject(16133, 98.17435, 32.31175, 2.71736,   0.00000, 0.00000, 0.00000);
	CreateObject(16133, -204.03775, -131.37627, 3.11719,   0.00000, 0.00000, -146.04004);
	CreateObject(2567, -125.14869, -77.62735, 6.30557,   0.00000, 0.00000, 0.00000);
	CreateObject(11444, -92.86896, -152.05734, 4.40150,   0.00000, 0.00000, 12.54000);
	CreateObject(11444, -32.03143, -81.24593, 4.40150,   0.00000, 0.00000, 99.00000);
	CreateObject(11444, -54.78228, -125.74839, 4.40150,   0.00000, 0.00000, 12.54000);
	CreateObject(2934, 38.50356, 5.79714, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2934, 44.90850, 32.77372, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2934, 59.92773, -13.34804, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2932, 26.58703, 21.68887, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2932, -0.02132, 20.67710, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2934, 60.61630, 29.09180, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(11444, -57.23111, -81.24819, 4.40150,   0.00000, 0.00000, 12.54000);
	CreateObject(17031, -94.48351, -26.39624, 4.56076,   0.00000, 0.00000, -26.75997);
	CreateObject(7980, 39.22261, -92.44768, 6.37260,   0.00000, 0.00000, -28.98000);
	CreateObject(7980, -227.05988, -95.82317, 6.37260,   0.00000, 0.00000, 9.59999);
	CreateObject(12957, -173.82260, -22.52600, 5.09070,   0.00000, 0.00000, 0.00000);
	CreateObject(12957, -119.66961, -64.20184, 5.09070,   0.00000, 0.00000, 0.00000);
	CreateObject(2932, -5.53512, 38.37406, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2934, 18.40945, 51.76796, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2932, -19.19342, 31.60811, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2932, 24.97462, -4.39102, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(1415, -91.42853, 63.52815, 4.52040,   0.00000, 0.00000, 18.90000);
	CreateObject(1415, -114.09245, 105.39571, 4.52040,   0.00000, 0.00000, 18.90000);
	CreateObject(3468, -156.57759, -150.99403, 5.10940,   0.00000, 0.00000, -86.10001);
	CreateObject(3468, -146.28177, -134.15930, 5.10940,   0.00000, 0.00000, -45.60001);
	CreateObject(1521, -166.85503, -56.96604, 5.56860,   0.00000, 0.00000, 40.91999);
	CreateObject(1521, -140.80376, -72.30338, 5.56860,   0.00000, 0.00000, 40.91999);
	CreateObject(2567, -115.56506, -105.26660, 6.30557,   0.00000, 0.00000, 91.62000);
	CreateObject(2567, -87.45428, -120.82129, 6.30557,   0.00000, 0.00000, 91.62000);
	CreateObject(2991, -150.61835, -109.19294, 5.03350,   0.00000, 0.00000, 66.96001);
	CreateObject(2991, -149.96300, -119.04388, 5.03350,   0.00000, 0.00000, 66.96001);
	CreateObject(2991, -148.19768, -89.27029, 5.03350,   0.00000, 0.00000, 66.96001);
	CreateObject(3434, -224.35194, -19.48306, 18.69860,   0.00000, 0.00000, 74.88000);
	CreateObject(12947, -252.41441, -44.48530, 4.39780,   0.00000, 0.00000, -99.12004);
	CreateObject(8341, -75.88802, 103.62309, 8.40390,   0.00000, 0.00000, 56.46000);
	CreateObject(2934, 44.64558, 77.37548, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(19872, -120.73740, -144.45790, 4.40560,   0.00000, 0.00000, 25.62000);
	CreateObject(19872, -45.36902, -103.48723, 4.40560,   0.00000, 0.00000, 25.62000);
	CreateObject(19872, -113.48607, -97.03957, 4.40560,   0.00000, 0.00000, 25.62000);
	CreateObject(12957, -91.73546, -87.07818, 5.09070,   0.00000, 0.00000, 0.00000);
	CreateObject(2567, -92.67847, -65.12991, 6.30557,   0.00000, 0.00000, 53.09999);
	CreateObject(13435, -130.43359, -166.59050, 7.43910,   0.00000, 0.00000, 0.00000);
	CreateObject(19790, -173.38551, -97.49868, 4.40560,   0.00000, 0.00000, 0.00000);
	CreateObject(19790, -170.89288, -71.69531, 4.40560,   0.00000, 0.00000, 0.00000);
	CreateObject(19606, -225.89740, -96.30780, -227.39281,   0.00000, 0.00000, 0.00000);
	CreateObject(11444, -37.78106, -58.92517, 4.40150,   0.00000, 0.00000, 65.10000);
	CreateObject(3761, -75.52419, 60.34912, 6.36330,   0.00000, 0.00000, -47.28001);
	CreateObject(2935, -34.21813, 33.37302, 5.84640,   0.00000, 0.00000, -51.24000);
	CreateObject(2934, -100.56200, 42.15413, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(18566, -75.33752, 28.56880, 4.77371,   0.00000, 0.00000, 44.57999);
	CreateObject(1415, -95.68472, 9.40380, 4.52040,   0.00000, 0.00000, 18.90000);
	CreateObject(1358, -103.89942, 57.64829, 5.61470,   0.00000, 0.00000, 0.00000);
	CreateObject(18452, -176.77800, 34.55900, 7.29180,   0.00000, 0.00000, 19.62000);
	CreateObject(2932, -2.46239, 68.66240, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2935, -9.00574, 63.23537, 5.87010,   0.00000, 0.00000, -94.20000);
	CreateObject(2934, -20.21329, 83.05450, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(11686, 23.58272, 79.92445, 4.42330,   0.00000, 0.00000, 244.01968);
	CreateObject(2934, 53.96600, 61.98772, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2934, 59.33500, 47.59172, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(2932, 57.40252, 13.58465, 5.84640,   0.00000, 0.00000, 0.00000);
	CreateObject(11293, 73.12558, -56.28968, 10.16302,   0.00000, 0.00000, -25.02000);
	CreateObject(11293, 91.82700, -23.28744, 10.16302,   0.00000, 0.00000, -25.02000);
	CreateObject(2935, -51.51044, 21.56444, 5.84640,   0.00000, 0.00000, -51.24000);
	CreateObject(3761, -100.13026, 17.63846, 6.36330,   0.00000, 0.00000, -1.32001);
	CreateObject(18275, -204.59119, -45.82849, 6.65280,   0.00000, 0.00000, 76.68001);
	CreateObject(18275, -188.68211, -39.67706, 6.65280,   0.00000, 0.00000, 54.84002);
	CreateObject(18248, -153.59319, 64.51628, 12.45530,   0.00000, 0.00000, 0.00000);
	CreateObject(17953, -201.14131, 3.55730, 14.07130,   0.00000, 0.00000, -2.64000);
	CreateObject(18981, -268.27069, -25.70150, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -276.50189, -49.29940, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -284.77661, -72.86717, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -293.00278, -96.42643, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -301.10147, -119.61782, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -293.49933, -134.94287, 16.90490,   0.00000, 0.00000, 970.66022);
	CreateObject(18981, -270.23120, -143.11603, 16.90490,   0.00000, 0.00000, 970.66022);
	CreateObject(18981, -247.01903, -151.26245, 16.90490,   0.00000, 0.00000, 970.66022);
	CreateObject(18981, -224.00345, -159.29831, 16.90490,   0.00000, 0.00000, 970.66022);
	CreateObject(18981, -200.64030, -167.48991, 16.90490,   0.00000, 0.00000, 970.66022);
	CreateObject(18981, -177.17853, -174.07152, 16.90490,   0.00000, 0.00000, 977.73993);
	CreateObject(18981, -153.35109, -179.24402, 16.90490,   0.00000, 0.00000, 977.73993);
	CreateObject(18981, -129.13170, -184.47937, 16.90490,   0.00000, 0.00000, 977.73993);
	CreateObject(18981, -105.21077, -189.56689, 16.90490,   0.00000, 0.00000, 978.21991);
	CreateObject(18981, -81.31056, -194.46515, 16.90490,   0.00000, 0.00000, 978.21991);
	CreateObject(18981, -56.98708, -199.49315, 16.90490,   0.00000, 0.00000, 978.21991);
	CreateObject(18981, -32.87363, -203.45750, 16.90490,   0.00000, 0.00000, 983.19971);
	CreateObject(18981, -8.20613, -206.35986, 16.90490,   0.00000, 0.00000, 983.19971);
	CreateObject(18981, 16.18597, -209.30794, 16.90490,   0.00000, 0.00000, 983.19971);
	CreateObject(18981, 40.77184, -212.20879, 16.90490,   0.00000, 0.00000, 983.19971);
	CreateObject(18981, 58.98633, -202.39529, 16.90490,   0.00000, 0.00000, 1071.04126);
	CreateObject(18981, 45.23775, -212.82022, 16.90490,   0.00000, 0.00000, 983.19971);
	CreateObject(18981, 62.96144, -177.86555, 16.90490,   0.00000, 0.00000, 1071.04126);
	CreateObject(18981, 66.72333, -153.89946, 16.90490,   0.00000, 0.00000, 1071.04126);
	CreateObject(18981, 73.35564, -131.09676, 16.90490,   0.00000, 0.00000, 1057.11511);
	CreateObject(18981, 82.99465, -108.31223, 16.90490,   0.00000, 0.00000, 1057.11511);
	CreateObject(18981, 91.96726, -85.35136, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 100.31294, -61.83707, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 108.56535, -38.64548, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 116.95894, -15.27270, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 125.22208, 7.92406, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 133.30954, 30.89962, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 140.38744, 51.35205, 16.90490,   0.00000, 0.00000, 1060.35657);
	CreateObject(18981, 132.71069, 67.18531, 16.90490,   0.00000, 0.00000, 1148.49390);
	CreateObject(18981, 109.78524, 75.42806, 16.90490,   0.00000, 0.00000, 1152.27515);
	CreateObject(18981, 86.70115, 82.67454, 16.90490,   0.00000, 0.00000, 1152.27515);
	CreateObject(18981, 63.80860, 90.17660, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, 40.75575, 97.99019, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, 17.49327, 105.88885, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -5.83627, 113.79960, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -29.18765, 121.87651, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -52.43621, 129.87346, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -75.55591, 137.79932, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -98.30614, 145.74910, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -121.59369, 153.95720, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -144.57513, 161.77982, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -167.44141, 169.56348, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -185.46875, 175.78333, 16.90490,   0.00000, 0.00000, 1151.25476);
	CreateObject(18981, -260.43503, -3.38424, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -252.41058, 19.66578, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -244.33073, 43.00005, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -236.26537, 66.16208, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -228.12762, 89.55597, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -220.00665, 112.94646, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -212.03780, 135.62878, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -204.06458, 158.57133, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(18981, -200.93896, 167.73587, 16.90490,   0.00000, 0.00000, -19.24000);
	CreateObject(3279, 4.65571, -125.22807, 4.37570,   0.00000, 0.00000, 10.50000);
	CreateObject(3279, -162.86575, 159.71506, 4.44510,   0.00000, 0.00000, 0.00000);
	// dm arena
    CreateObject(2567, -2336.314941, -1640.633911, 484.630737, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2301.392578, -1627.197998, 484.670380, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2314.179443, -1594.421509, 484.807892, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2343.463135, -1589.182617, 484.506561, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2351.352539, -1621.264038, 484.591064, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2366.177979, -1636.281860, 487.789581, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2354.506104, -1663.518188, 484.840881, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2345.463623, -1670.893555, 485.279541, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2341.165771, -1673.465210, 485.303070, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2325.129395, -1672.878174, 483.735962, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2311.699707, -1680.271362, 483.050110, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2292.910156, -1681.031738, 483.704956, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2294.843018, -1664.711914, 483.971710, 0.0000, 0.0000, 337.5000);
	CreateObject(2567, -2311.246338, -1648.872803, 484.630737, 0.0000, 0.0000, 225.0000);
	CreateObject(2567, -2336.895020, -1646.609497, 484.630737, 0.0000, 0.0000, 225.0000);
	CreateObject(2567, -2336.221924, -1662.573853, 484.531403, 0.0000, 0.0000, 191.2500);
	CreateObject(2567, -2316.828125, -1616.891479, 484.679993, 0.0000, 0.0000, 191.2500);
	CreateObject(2567, -2334.033447, -1607.302856, 484.650360, 0.0000, 0.0000, 191.2500);
	CreateObject(2567, -2348.554932, -1645.748779, 484.630737, 0.0000, 0.0000, 191.2500);
	CreateObject(2567, -2325.560547, -1658.864502, 484.509460, 0.0000, 0.0000, 191.2500);
	CreateObject(2567, -2323.133789, -1662.379883, 484.266663, 0.0000, 0.0000, 191.2500);
	CreateObject(3566, -2327.326904, -1634.585938, 485.316742, 0.0000, 0.0000, 326.2500);
	CreateObject(3566, -2299.204834, -1665.336914, 484.440430, 0.0000, 0.0000, 33.7500);
	CreateObject(3568, -2315.249756, -1659.719971, 485.013702, 0.0000, 0.0000, 0.0000);
	CreateObject(3569, -2309.797852, -1618.707886, 485.423431, 0.0000, 0.0000, 326.2500);
	CreateObject(3570, -2291.498047, -1644.552368, 483.875580, 0.0000, 0.0000, 0.0000);
	CreateObject(3571, -2309.593506, -1674.547363, 483.171722, 0.0000, 0.0000, 0.0000);
	CreateObject(3572, -2329.296387, -1650.533447, 484.051056, 0.0000, 0.0000, 22.5000);
	CreateObject(3573, -2319.301758, -1692.957275, 484.332184, 0.0000, 0.0000, 337.5000);
	CreateObject(3574, -2301.176514, -1690.773682, 483.476379, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2360.822021, -1611.048706, 490.795959, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2341.263184, -1628.295532, 485.384308, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2359.319824, -1627.029419, 486.973755, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2330.454834, -1658.523804, 485.394806, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2317.129639, -1634.668701, 485.394806, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2305.042236, -1647.361450, 485.385162, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2327.924561, -1600.704590, 485.483612, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2343.419434, -1590.568115, 485.282135, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2350.219238, -1603.163330, 485.312134, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2303.232910, -1621.588623, 485.486053, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2304.961182, -1649.203979, 490.014191, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2289.983154, -1649.958252, 484.911835, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2295.047852, -1673.533447, 485.333221, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2286.268311, -1685.839111, 483.349548, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2286.079346, -1699.802979, 480.217377, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2291.963135, -1705.900635, 478.814331, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2292.865234, -1715.660400, 476.669159, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2299.854736, -1723.877075, 478.265167, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2309.010010, -1724.484863, 480.788635, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2314.422607, -1726.729736, 481.261627, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2322.418945, -1728.106323, 482.269104, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2328.467529, -1725.440063, 487.663757, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2333.441162, -1721.192383, 493.058411, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2340.715576, -1714.717041, 495.755737, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2341.117676, -1706.828003, 500.986847, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2364.259277, -1675.352417, 485.621674, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2360.095703, -1682.370972, 484.607727, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2351.202148, -1688.597412, 485.823334, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2344.638916, -1693.606079, 488.778931, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2337.851807, -1698.279785, 492.251923, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2333.491943, -1702.348755, 497.646576, 0.0000, 0.0000, 326.2500);
	CreateObject(3574, -2330.356934, -1705.130981, 503.041229, 0.0000, 0.0000, 326.2500);
	CreateObject(3576, -2330.317871, -1675.948608, 483.324524, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2334.555908, -1670.772461, 483.614197, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2334.961670, -1670.790405, 484.599670, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2341.290527, -1657.382446, 484.195801, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2346.580078, -1626.531250, 487.031525, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2348.993896, -1626.406860, 486.767273, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2358.703857, -1629.229492, 488.861420, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2329.914063, -1604.280396, 485.307861, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2323.830811, -1631.979492, 489.364532, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2308.326416, -1651.860596, 490.340088, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2310.652832, -1674.351074, 485.975677, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2317.132568, -1675.588745, 482.984924, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2326.085938, -1657.466187, 489.590454, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2294.402588, -1682.192261, 484.404480, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2296.313721, -1694.655273, 487.672028, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2295.135010, -1716.002197, 478.167480, 0.0000, 0.0000, 0.0000);
	CreateObject(3576, -2306.588135, -1721.947266, 484.984283, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2290.259277, -1702.578979, 481.005524, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2299.341309, -1693.704346, 486.961853, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2304.407471, -1682.085571, 484.264526, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2310.408691, -1653.830322, 483.472626, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2317.309570, -1639.453613, 483.659424, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2317.177002, -1695.379272, 487.817657, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2325.634033, -1604.023438, 488.063538, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2333.040527, -1599.074463, 486.690735, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2348.017334, -1626.424805, 486.155914, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2345.265625, -1661.274536, 483.748901, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2335.622803, -1656.859131, 486.547729, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2328.655029, -1679.273438, 482.692932, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2322.120605, -1681.083252, 482.079987, 0.0000, 0.0000, 0.0000);
	CreateObject(3577, -2316.599854, -1680.642334, 481.987885, 0.0000, 0.0000, 0.0000);
	CreateObject(3621, -2274.715576, -1643.258179, 481.569885, 0.0000, 0.0000, 292.5000);
	CreateObject(3621, -2273.295410, -1654.169434, 477.494263, 0.0000, 0.0000, 292.5000);
	CreateObject(3621, -2271.133789, -1667.026733, 488.283569, 0.0000, 0.0000, 292.5000);
	CreateObject(3621, -2269.915527, -1678.776978, 499.072876, 0.0000, 0.0000, 292.5000);
	CreateObject(3621, -2267.937988, -1690.454712, 509.862183, 0.0000, 0.0000, 292.5000);
	CreateObject(3621, -2266.802979, -1702.213867, 520.651489, 0.0000, 0.0000, 292.5000);
	CreateObject(3621, -2311.154297, -1583.302734, 486.385193, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2303.369629, -1590.350952, 497.174500, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2296.533691, -1597.877686, 507.963806, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2288.803467, -1603.723755, 518.753113, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2281.841553, -1609.585571, 529.542419, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2273.068115, -1614.406006, 540.331726, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2306.027344, -1575.928589, 484.291962, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2300.405518, -1573.310181, 485.036194, 0.0000, 0.0000, 326.2500);
	CreateObject(3621, -2295.889893, -1569.952759, 486.181793, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2381.111328, -1556.622070, 485.393799, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2386.510742, -1554.655273, 493.485779, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2391.428955, -1558.346069, 501.577759, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2396.637939, -1561.987061, 509.669739, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2402.659668, -1558.594116, 517.176270, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2416.482910, -1563.445679, 527.965576, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2425.725098, -1561.763428, 536.057556, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2437.033691, -1564.354980, 546.846863, 0.0000, 0.0000, 22.5000);
	CreateObject(3621, -2360.992920, -1570.567749, 496.652527, 0.0000, 0.0000, 33.7500);
	CreateObject(3621, -2411.037598, -1622.042480, 524.441833, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2406.382568, -1623.267090, 528.703979, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2406.604492, -1624.312012, 524.044678, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2404.288818, -1628.937378, 536.795959, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2399.595947, -1630.353027, 541.216431, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2395.112549, -1630.714966, 541.592163, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2402.939941, -1623.035400, 522.799805, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2399.562256, -1617.838379, 524.880737, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2402.171387, -1606.881104, 516.740784, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2393.857422, -1598.965576, 511.355743, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2388.558350, -1603.428833, 518.792297, 0.0000, 0.0000, 101.2500);
	CreateObject(3621, -2268.383301, -1726.920288, 490.300476, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2414.704346, -1705.155640, 453.184875, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2404.257080, -1695.992432, 460.593506, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2400.566406, -1692.755127, 466.102112, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2396.360596, -1690.288574, 469.679169, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2392.697510, -1687.010010, 474.845001, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2388.880615, -1683.961426, 478.448120, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2385.226563, -1680.669189, 485.005859, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2381.301758, -1677.782104, 490.503937, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2377.666260, -1674.462158, 497.134155, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2373.208252, -1672.373291, 503.441284, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2367.880859, -1671.585571, 507.299072, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2363.125977, -1669.940796, 513.735901, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2359.167236, -1667.104736, 521.202026, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2355.941650, -1664.604614, 529.294006, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2357.637451, -1665.488892, 537.385986, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2356.118896, -1659.672241, 548.175293, 0.0000, 0.0000, 123.7499);
	CreateObject(3621, -2357.577148, -1659.783081, 556.267273, 0.0000, 0.0000, 180.0000);
	CreateObject(3621, -2276.968262, -1720.709229, 482.853668, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2281.766602, -1716.830444, 485.518860, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2288.115234, -1713.593872, 489.876892, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2294.530273, -1710.384766, 496.831116, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2298.926270, -1706.339355, 501.297058, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2302.206299, -1701.831665, 508.475311, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2301.854004, -1695.819458, 514.324097, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2299.400879, -1688.937134, 520.631226, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2299.172607, -1682.976196, 521.189880, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2299.179932, -1680.519409, 521.189880, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2300.419189, -1675.491943, 521.189880, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2360.349609, -1665.334839, 514.756531, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2369.688721, -1642.597534, 526.565186, 0.0000, 0.0000, 202.5000);
	CreateObject(3621, -2295.260010, -1602.761230, 522.177063, 0.0000, 0.0000, 225.0000);
	CreateObject(3630, -2327.224609, -1615.609497, 484.208710, 0.0000, 0.0000, 0.0000);
	CreateObject(3630, -2319.954834, -1654.982422, 484.168304, 0.0000, 0.0000, 326.2500);
	CreateObject(3630, -2310.685791, -1690.634399, 483.923004, 0.0000, 0.0000, 315.0000);
	CreateObject(3630, -2312.572754, -1685.079834, 485.682922, 0.0000, 0.0000, 281.2500);
	CreateObject(3630, -2336.646729, -1675.244141, 484.305267, 0.0000, 0.0000, 281.2500);
	CreateObject(3630, -2344.531250, -1668.465942, 487.856140, 0.0000, 0.0000, 225.0000);
	CreateObject(3630, -2344.031982, -1629.346802, 486.882568, 0.0000, 0.0000, 191.2500);
	CreateObject(3630, -2339.204834, -1621.760742, 486.882568, 0.0000, 0.0000, 135.0000);
	CreateObject(3630, -2352.068115, -1611.842285, 484.128448, 0.0000, 0.0000, 78.7500);
	CreateObject(3633, -2348.546875, -1576.734253, 485.559082, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2351.261230, -1575.790527, 486.364471, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2360.983398, -1588.044189, 491.472260, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2363.417480, -1593.334717, 493.348175, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2389.895996, -1596.703857, 511.265350, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2390.213379, -1595.107544, 508.387054, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2379.964844, -1598.043701, 501.020966, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2391.717773, -1614.432129, 501.737854, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2380.814209, -1620.183838, 523.274231, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2370.755615, -1641.000854, 520.885071, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2336.563965, -1636.860474, 517.618347, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2337.415039, -1641.208740, 517.263184, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2325.749023, -1626.045532, 520.544495, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2322.753418, -1617.289795, 521.924622, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2316.621094, -1616.917480, 519.905090, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2301.388916, -1601.685303, 523.821411, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2317.457520, -1589.139526, 527.221008, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2326.767090, -1582.636841, 524.628540, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2335.715088, -1575.730347, 517.764771, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2315.838867, -1585.370728, 497.017609, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2294.966797, -1597.470459, 488.791534, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2291.445313, -1616.161987, 496.926270, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2294.306641, -1628.933594, 497.529999, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2279.813477, -1686.689941, 503.787689, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2330.206787, -1622.703369, 483.183960, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2351.177734, -1674.038452, 484.149231, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2370.438232, -1650.069458, 486.579895, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2346.200195, -1653.607666, 510.266632, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2331.214844, -1614.637573, 486.183624, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2324.602783, -1613.327759, 486.183624, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2324.023682, -1624.038574, 483.181183, 0.0000, 0.0000, 0.0000);
	CreateObject(3633, -2326.693115, -1620.981934, 483.184174, 0.0000, 0.0000, 0.0000);
	CreateObject(3722, -2345.201904, -1565.404541, 487.359009, 0.0000, 0.0000, 303.7500);
	CreateObject(3722, -2374.109619, -1582.683594, 504.408691, 0.0000, 0.0000, 135.0000);
	CreateObject(3722, -2389.786865, -1622.503906, 505.731323, 0.0000, 0.0000, 135.0000);
	CreateObject(3724, -2378.034668, -1675.410645, 505.603851, 0.0000, 0.0000, 0.0000);
	CreateObject(3761, -2363.133057, -1573.118408, 501.354828, 0.0000, 0.0000, 0.0000);
	CreateObject(3796, -2375.542480, -1591.645020, 498.981720, 0.0000, 0.0000, 0.0000);
	CreateObject(5132, -2355.964355, -1644.626465, 486.352142, 0.0000, 0.0000, 292.5000);
	CreateObject(5259, -2358.257080, -1580.783447, 490.732971, 0.0000, 0.0000, 0.0000);
	CreateObject(5260, -2362.768311, -1596.165649, 493.975891, 0.0000, 0.0000, 0.0000);
	CreateObject(5261, -2339.938721, -1616.132568, 484.936951, 0.0000, 0.0000, 0.0000);
	CreateObject(5262, -2342.557617, -1589.434448, 494.540100, 0.0000, 0.0000, 0.0000);
	CreateObject(7025, -2321.758545, -1603.206543, 485.339691, 0.0000, 0.0000, 0.0000);
	CreateObject(3621, -2295.258789, -1602.722656, 488.283569, 0.0000, 0.0000, 292.5001);
	CreateObject(3621, -2341.703613, -1545.883667, 495.825500, 0.0000, 0.0000, 303.7500);
	CreateObject(3621, -2345.732666, -1545.420532, 503.917480, 0.0000, 0.0000, 303.7500);
	CreateObject(3621, -2348.005371, -1547.780029, 507.292297, 0.0000, 0.0000, 303.7500);
	CreateObject(3621, -2349.671143, -1551.047852, 512.817261, 0.0000, 0.0000, 303.7500);
	CreateObject(3621, -2350.299805, -1555.868042, 522.979736, 0.0000, 0.0000, 303.7500);
	CreateObject(3621, -2396.684570, -1572.032349, 499.509155, 0.0000, 0.0000, 281.2500);
	CreateObject(3621, -2390.768555, -1572.090698, 505.541443, 0.0000, 0.0000, 281.2500);
	CreateObject(3621, -2385.899902, -1582.632813, 516.330750, 0.0000, 0.0000, 281.2500);
	CreateObject(3621, -2297.569336, -1612.247437, 496.306702, 0.0000, 0.0000, 292.5001);
	CreateObject(3621, -2365.228027, -1559.348389, 487.061310, 0.0000, 0.0000, 0.0001);
	CreateObject(3621, -2367.927734, -1561.871704, 494.820831, 0.0000, 0.0000, 0.0001);
	CreateObject(3621, -2401.316162, -1569.468018, 496.761719, 0.0000, 0.0000, 22.5001);
	CreateObject(3621, -2437.069580, -1591.788452, 503.691772, 0.0000, 0.0000, 22.5001);
	CreateObject(3621, -2277.302246, -1673.357788, 474.540894, 0.0000, 0.0000, 112.5001);
	CreateObject(3621, -2271.942871, -1675.368652, 482.632874, 0.0000, 0.0000, 112.5001);
	CreateObject(3621, -2268.838379, -1706.347168, 483.608215, 0.0000, 0.0000, 22.5001);
	CreateObject(3621, -2343.547607, -1725.392334, 488.077637, 0.0000, 0.0000, 326.2502);
	CreateObject(3621, -2282.527344, -1734.272827, 470.754974, 0.0000, 0.0000, 22.5001);
	CreateObject(3621, -2287.560547, -1735.441040, 476.300476, 0.0000, 0.0000, 22.5001);
	//////////////////
    new tmpobjid;
	tmpobjid = CreateDynamicObject(19378, -5729.271484, 11242.795898, -3461.782226, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, -5729.271484, 11242.795898, -3461.782226, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 264.123992, 2944.232666, 4.282150, 0.000000, -0.275499, 358.808288, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 258.875488, 2944.289794, 9.498729, 0.000000, -89.482101, 358.808288, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 248.523803, 2944.498779, 9.598400, 0.000000, -89.482101, 358.808288, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 243.155044, 2944.623291, 4.442198, 0.000000, -0.275499, 358.808288, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 258.771087, 2939.535888, 4.823500, 92.071601, -91.311302, 359.925506, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 258.875488, 2944.289794, 1.636999, -0.000000, -89.482093, -1.191711, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 248.523818, 2944.498779, 1.720999, -0.000000, -89.482093, -1.191711, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 248.366500, 2939.907714, 4.823500, 92.071601, -91.311302, 358.601196, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 248.523803, 2949.072998, 4.823490, 92.071601, -91.311302, 358.601196, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(19378, 258.967926, 2948.628906, 4.823490, 92.071601, -91.311302, 358.601196, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "airvent_gz", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 262.657470, 2947.772460, 2.491411, -0.000001, 0.000038, -1.999999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 259.989379, 2947.864013, 2.491411, -0.000001, 0.000038, -1.999999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 256.437561, 2947.942626, 2.491411, -0.000001, 0.000038, -1.999999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 253.769454, 2948.034179, 2.491411, -0.000001, 0.000038, -1.999999, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 253.658660, 2940.511718, 2.491411, -0.000001, 0.000030, 179.900054, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 256.328308, 2940.508789, 2.491411, -0.000001, 0.000030, 179.900054, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 259.880798, 2940.547851, 2.491411, -0.000001, 0.000030, 179.900054, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(1368, 262.550445, 2940.544921, 2.491411, -0.000001, 0.000030, 179.900054, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19304, 252.014038, 2941.648681, 2.310200, 0.000007, -0.000000, 90.781204, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.966735, 2945.118408, 2.310200, 0.000007, -0.000000, 90.781204, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.939529, 2947.109130, 2.310200, 0.000007, -0.000000, 90.781204, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 252.014038, 2941.648681, 3.560199, 0.000015, -0.000000, 90.781181, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.966735, 2945.118408, 3.560199, 0.000015, -0.000000, 90.781181, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.939529, 2947.109130, 3.560199, 0.000015, -0.000000, 90.781181, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 252.014038, 2941.648681, 4.780197, 0.000022, -0.000000, 90.781158, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.966735, 2945.118408, 4.780197, 0.000022, -0.000000, 90.781158, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.939529, 2947.109130, 4.780197, 0.000022, -0.000000, 90.781158, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 252.014038, 2941.648681, 6.050199, 0.000030, -0.000000, 90.781135, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.966735, 2945.118408, 6.050199, 0.000030, -0.000000, 90.781135, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.939529, 2947.109130, 6.050199, 0.000030, -0.000000, 90.781135, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 252.014038, 2941.648681, 7.200201, 0.000038, -0.000000, 90.781112, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.966735, 2945.118408, 7.200201, 0.000038, -0.000000, 90.781112, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.939529, 2947.109130, 7.200201, 0.000038, -0.000000, 90.781112, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 252.014038, 2941.648681, 8.520198, 0.000045, -0.000000, 90.781089, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.966735, 2945.118408, 8.520198, 0.000045, -0.000000, 90.781089, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 251.939529, 2947.109130, 8.520198, 0.000045, -0.000000, 90.781089, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 263.481475, 2943.024414, 1.758637, 0.000000, 0.000000, -89.599952, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2523, 263.531219, 2945.256591, 1.700722, 0.000000, 0.000000, -89.199966, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1808, 251.601364, 2948.698242, 1.737286, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2308, 243.795578, 2947.683593, 1.814883, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2356, 244.611602, 2947.415283, 1.822849, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2604, 248.024093, 2948.520019, 2.591666, 0.000000, 0.000000, -0.699999, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2356, 248.194061, 2946.449218, 1.815892, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1805, 249.639465, 2946.883300, 2.025357, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(11665, 249.255798, 2941.848632, 2.407093, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18637, 250.920135, 2943.080810, 2.479939, 82.699974, 110.200035, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19172, 258.539306, 2939.675292, 6.121088, 0.399999, 0.000000, -179.000091, -1, -1, -1, 300.00, 300.00);
	//buda baya büyük bi map
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1582.082763, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1607.054809, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1632.014404, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1656.863037, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.039733, -1632.014404, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.039916, -1607.054809, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.031311, -1582.082763, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.041748, -1656.863037, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1681.831787, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.039489, -1681.831787, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.039489, -1706.791870, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 670.039489, -1731.761718, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1706.831420, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 645.070312, -1731.821044, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1681.831787, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1706.771850, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1731.766479, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1656.842407, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1631.842651, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1606.859130, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 695.041625, -1581.870239, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1607.054809, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1582.083129, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1632.046752, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1657.048339, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1682.047119, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1707.037109, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	tmpobjid = CreateDynamicObjectEx(18981, 620.070434, -1731.826904, 73.148765, 0.000000, 90.000000, 0.000000, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 3095, "a51jdrx", "sam_camo", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObjectEx(11012, 657.570861, -1603.572265, 80.188774, 0.000000, 0.000000, 540.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11085, 655.156188, -1602.464355, 80.728736, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11012, 656.478149, -1710.237670, 80.188774, 0.000000, 0.000029, -0.000018, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11085, 658.892822, -1711.345825, 80.728736, 0.000000, 0.000029, 0.000073, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1572.734619, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1579.345092, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1585.916381, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1592.297241, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1598.829101, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1605.459716, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1612.150634, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1618.780517, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1625.450805, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1632.161621, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1638.732299, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1645.442016, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1652.103759, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1658.734375, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1665.405395, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1672.025756, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1678.666625, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1685.307495, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1691.968505, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1698.648315, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1705.330200, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1711.972534, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1718.642944, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1725.313720, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1731.955932, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1738.335205, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 707.506469, -1744.976806, 76.378723, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 704.176696, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 697.626403, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 691.015625, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 684.405334, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 629.324951, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 622.704345, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 616.043212, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 609.393005, -1744.196166, 76.378723, 0.000000, 0.000000, -180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1740.855712, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1734.324707, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1727.744140, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1721.052246, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1714.451782, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1707.780273, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1701.129638, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1694.448974, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1687.828369, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1681.166625, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1674.566284, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1667.914794, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1661.404541, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1654.793701, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1648.122924, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1641.642089, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1634.921020, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1628.240112, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1621.569335, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1615.018920, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1608.367675, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1588.395019, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1601.686523, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1595.025146, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1581.793823, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1575.063720, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 607.612548, -1568.363769, 76.378723, 0.000000, 0.000000, -270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 610.932617, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 617.463562, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 624.154052, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 630.765197, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 684.716003, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 691.387023, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 697.976928, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(974, 704.617187, -1569.644775, 76.378723, 0.000000, 0.000000, -360.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11428, 679.148742, -1680.945068, 78.848739, 0.000000, 0.000000, -90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11011, 636.542846, -1665.048217, 77.488815, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11011, 680.152465, -1649.497924, 77.488815, 0.000000, 0.000000, 270.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11428, 641.668457, -1632.313842, 78.848739, 0.000000, 0.000000, 90.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 628.984741, -1643.243896, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 639.718688, -1649.525878, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 646.450317, -1641.064208, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 665.414367, -1650.051513, 74.416191, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 654.958251, -1621.160644, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 634.666259, -1625.073242, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 622.181091, -1623.182739, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 616.924743, -1631.000976, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(2669, 627.384277, -1592.138061, 74.988761, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 620.613342, -1580.938720, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 611.493652, -1579.763671, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(2669, 619.460815, -1574.451049, 74.938758, 0.000000, 0.000000, 64.600021, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 612.088256, -1572.962280, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 610.603515, -1571.794799, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 608.352844, -1574.486938, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 611.507263, -1577.577636, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 615.465148, -1582.765014, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 619.213806, -1584.036499, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 616.899108, -1587.914550, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 614.258239, -1593.377197, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 621.500549, -1598.084716, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 615.626159, -1607.683959, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 624.657287, -1610.638183, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 615.012451, -1616.209472, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 613.766601, -1624.982055, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 618.561523, -1640.726074, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 624.252929, -1649.588623, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 645.342956, -1651.536621, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 650.545288, -1664.590698, 74.433151, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 654.198425, -1686.418457, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 679.640380, -1693.615844, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 691.664245, -1694.963867, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 700.306945, -1704.948486, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 693.215148, -1709.425903, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(2669, 686.728271, -1721.696777, 74.978729, 0.000000, 0.000000, 180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 692.968505, -1732.304687, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 702.940185, -1737.620971, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 698.646728, -1740.669799, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 701.901733, -1740.051879, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 701.196533, -1741.847534, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 705.258605, -1742.143066, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(2669, 692.271179, -1740.570556, 74.968757, 0.000000, 0.000000, 133.500030, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 688.046508, -1737.952392, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 688.046508, -1737.952392, 74.748764, 0.000000, 0.000000, 29.799997, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 688.403625, -1732.246826, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 686.822021, -1730.228271, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 691.431274, -1726.223876, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 699.344726, -1715.345825, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 700.466003, -1710.397949, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 692.285095, -1702.273315, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11442, 695.756958, -1596.287963, 73.688743, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 698.310058, -1598.381958, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 699.174987, -1596.523315, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 697.529113, -1596.576904, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 687.172485, -1590.428344, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 683.408935, -1578.883300, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 695.152404, -1581.059204, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(2669, 689.589599, -1583.591430, 74.948745, 0.000000, 0.000000, -50.799987, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 701.108215, -1579.147705, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 702.165100, -1575.261352, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 697.187011, -1572.055908, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 691.009277, -1575.515747, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 689.279602, -1578.442871, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 683.774291, -1591.497558, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 684.342956, -1599.488281, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 689.702941, -1603.410766, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 685.912414, -1610.465820, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 696.533630, -1609.976684, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 697.046569, -1620.562744, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 689.343933, -1625.630615, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 700.151672, -1630.645385, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 663.024902, -1629.986328, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 687.628784, -1670.952758, 73.641227, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 687.628784, -1668.402832, 73.641227, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 684.078735, -1670.102661, 73.641227, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 684.078735, -1664.472534, 73.641227, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 684.078735, -1664.472534, 74.551216, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 687.678771, -1664.472534, 73.621231, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 695.240966, -1669.869140, 73.466537, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 695.240966, -1669.869140, 75.686515, 0.000000, 0.000000, 45.599998, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 703.502258, -1678.783325, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 701.031616, -1682.230834, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 701.128234, -1678.639160, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 697.154113, -1678.887939, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 700.724426, -1673.494384, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 695.681762, -1685.001342, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 689.044067, -1685.746093, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 702.264587, -1664.792114, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(11442, 620.688537, -1713.149658, 73.798751, 0.000000, 0.000000, 180.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(2669, 619.549072, -1730.864501, 74.958740, 0.000000, 0.000000, 132.099929, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 613.347900, -1727.124267, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 611.973937, -1732.159667, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 614.744628, -1736.840820, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 621.126281, -1739.104736, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 626.423828, -1733.811523, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 626.398132, -1727.257934, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 617.385070, -1725.137329, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 623.767089, -1736.271484, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 619.953857, -1730.618041, 76.308265, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 618.361816, -1718.261474, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 619.402465, -1704.232788, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 624.951110, -1701.529052, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 614.759094, -1694.956787, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 621.652404, -1690.093383, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 627.247619, -1695.392700, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 627.575622, -1687.425659, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 619.639953, -1684.783691, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 614.497314, -1685.910400, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 621.494140, -1678.597778, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 613.740356, -1671.260375, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 613.740356, -1671.260375, 74.658752, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 617.905090, -1657.142211, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 640.171447, -1668.862426, 81.332870, 14.800000, -0.500000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 672.584411, -1666.679565, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 679.994201, -1732.300170, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 679.994201, -1738.770141, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 641.171081, -1733.302246, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 640.409057, -1740.498657, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 636.075500, -1736.761352, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 654.292968, -1735.749023, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 664.405090, -1734.627807, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 661.541809, -1740.450439, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 655.759216, -1716.804199, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 646.330810, -1719.275634, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 638.000366, -1726.056396, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 636.254638, -1719.760620, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 646.985595, -1726.618530, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 682.932128, -1721.853515, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 678.242065, -1725.944824, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 677.862121, -1716.636108, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 680.228149, -1707.275878, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 662.600463, -1710.277099, 74.838104, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 650.543579, -1708.738647, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 637.801330, -1710.526367, 74.844497, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 636.852111, -1702.950317, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 635.741210, -1692.251220, 74.838127, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 637.649963, -1684.776245, 74.838127, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 640.618957, -1680.446777, 74.838119, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 644.216613, -1697.694946, 74.837219, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 676.800415, -1630.420776, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 677.585327, -1620.088378, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 676.696105, -1606.114501, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 665.835571, -1602.973266, 74.844490, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 665.995300, -1610.058593, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 650.147399, -1602.391235, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 635.552062, -1610.471923, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 633.513916, -1602.552612, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 630.921752, -1591.943481, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 644.368164, -1587.456787, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 653.213989, -1582.917602, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 633.637023, -1581.744140, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 634.247680, -1572.449340, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 650.322692, -1573.493652, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 677.293518, -1573.840087, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 677.330261, -1581.308105, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 667.661315, -1578.558349, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 660.461608, -1589.358520, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 672.468444, -1590.810913, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 677.491943, -1595.951049, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 664.000366, -1596.229248, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 652.321533, -1594.589111, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3799, 647.855895, -1611.452148, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3800, 669.503051, -1616.567138, 74.837211, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 677.101867, -1624.781372, 74.838111, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 675.455810, -1637.950561, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	tmpobjid = CreateDynamicObjectEx(3798, 687.483703, -1633.642211, 73.648765, 0.000000, 0.000000, 0.000000, 300.00, 300.00);
	//////////
	CreateDynamicObject(18751,534.3700000,-2450.3800000,7.0800000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,482.9200000,-2477.8800000,8.9600000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(10841,486.5000000,-2499.0700000,8.9800000,0.0000000,0.0000000,110.0000000);
	CreateDynamicObject(10841,499.9500000,-2505.5900000,8.5100000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,521.6200000,-2505.3500000,8.9600000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,539.6800000,-2505.3500000,8.4800000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,561.0900000,-2505.1700000,8.6800000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,581.5600000,-2500.8700000,8.2100000,0.0000000,0.0000000,24.0000000);
	CreateDynamicObject(10841,588.0900000,-2486.7400000,7.9600000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(10841,587.7000000,-2465.3400000,8.6300000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(10841,587.3600000,-2446.2400000,8.1900000,0.0000000,0.0000000,91.0000000);
	CreateDynamicObject(10841,586.7200000,-2424.2300000,8.3700000,0.0000000,0.0000000,92.0000000);
	CreateDynamicObject(10841,583.7300000,-2404.3900000,8.8300000,0.0000000,0.0000000,106.0000000);
	CreateDynamicObject(10841,571.4200000,-2396.7000000,8.1600000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,551.4100000,-2396.4300000,8.2500000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,530.8100000,-2396.3800000,8.1600000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(10841,509.0500000,-2396.9700000,8.3000000,0.0000000,0.0000000,3.0000000);
	CreateDynamicObject(10841,488.4400000,-2400.6900000,8.3000000,0.0000000,0.0000000,17.0000000);
	CreateDynamicObject(10841,483.6000000,-2413.1200000,8.9700000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(10841,483.2600000,-2435.2500000,9.0600000,0.0000000,0.0000000,89.0000000);
	CreateDynamicObject(10841,482.6100000,-2455.4200000,9.0500000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(3279,570.3700000,-2412.3900000,4.9500000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(3279,502.3700000,-2414.3900000,5.5600000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(3279,503.1800000,-2486.6300000,6.0600000,0.0000000,0.0000000,96.0000000);
	CreateDynamicObject(3279,570.3500000,-2486.9000000,6.4200000,0.0000000,0.0000000,182.0000000);
	CreateDynamicObject(3565,570.2800000,-2466.1200000,9.3600000,0.0000000,10.0000000,0.0000000);
	CreateDynamicObject(3565,561.1800000,-2436.3600000,10.9700000,0.0000000,0.0000000,12.0000000);
	CreateDynamicObject(2669,534.3500000,-2417.1800000,9.5600000,0.0000000,0.0000000,200.0000000);
	CreateDynamicObject(10773,516.7600000,-2433.1200000,11.8600000,0.0000000,0.0000000,-30.0000000);
	CreateDynamicObject(1234,1531.9600000,-1700.9600000,12.3800000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(3865,522.4500000,-2483.9400000,10.0000000,0.0000000,0.0000000,60.0000000);
	CreateDynamicObject(13591,548.4200000,-2470.7100000,12.1100000,8.0000000,4.0000000,-23.0000000);
	CreateDynamicObject(2669,501.2200000,-2462.6200000,8.5800000,0.0000000,0.0000000,-80.0000000);
	CreateDynamicObject(11319,549.4800000,-2493.1400000,8.5100000,0.0000000,-26.0000000,52.0000000);
	CreateDynamicObject(11319,543.5300000,-2491.8200000,8.9200000,0.0000000,-15.0000000,121.0000000);
	CreateDynamicObject(1383,535.5500000,-2451.0400000,44.1000000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(13591,551.6000000,-2451.4900000,11.8400000,0.0000000,10.0000000,-34.0000000);
	CreateDynamicObject(13591,525.6100000,-2464.6000000,12.2100000,0.0000000,14.0000000,200.0000000);
	CreateDynamicObject(13591,551.4900000,-2430.4900000,10.5600000,0.0000000,12.0000000,100.0000000);
	CreateObject(19543, -1335.97949, 2425.67969, 93.04828,   0.00000, 0.00000, -90.42001);
	//prison
	CreateDynamicObject(18981,1871.7440200,-1698.8618200,5215.2099600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19354,1882.9877900,-1687.7003200,5217.3779300,0.0000000,0.0000000,33.4800000);
	CreateDynamicObject(1536,1882.1022900,-1686.5136700,5215.6831100,0.0000000,0.0000000,-56.0201200);
	CreateDynamicObject(1536,1883.7889400,-1688.9746100,5215.6831100,0.0000000,0.0000000,123.4800000);
	CreateDynamicObject(19354,1883.8645000,-1690.6436800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1880.4753400,-1686.3632800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1883.8645000,-1693.8474100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1883.8645000,-1697.0512700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1883.8645000,-1700.2572000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1882.1844500,-1701.9030800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1873.8996600,-1701.9030800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19400,1874.7214400,-1706.7480500,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19354,1878.9774200,-1701.9090600,5215.1655300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1649,1878.9400600,-1701.8741500,5219.1250000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1878.9774200,-1701.9030800,5220.5649400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1876.3225100,-1701.9023400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1877.2696500,-1686.3632800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1874.0699500,-1686.3632800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1872.3796400,-1688.0130600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1872.3700000,-1700.3691400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1874.7214400,-1703.5438200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18981,1871.9040500,-1723.8623000,5215.2099600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19354,1883.8645000,-1703.5655500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1883.8645000,-1706.7724600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1874.0487100,-1711.0026900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1877.2607400,-1711.0026900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1649,1876.9184600,-1712.6843300,5216.9101600,0.0000000,90.0000000,90.0000000);
	CreateDynamicObject(1649,1876.9184600,-1715.9718000,5216.9101600,0.0000000,90.0000000,90.0000000);
	CreateDynamicObject(9131,1876.9184600,-1714.2552500,5217.6601600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1872.3704800,-1713.2048300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1872.3704800,-1716.4150400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(9131,1876.9184600,-1712.4310300,5217.6601600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(9131,1876.9184600,-1716.0806900,5217.6601600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18762,1876.9184600,-1714.5507800,5216.0542000,0.0000000,90.0000000,90.0000000);
	CreateDynamicObject(18762,1876.9174800,-1711.5811800,5214.0556600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18762,1876.9174800,-1717.4671600,5214.0556600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1649,1878.9400600,-1701.8741500,5219.1250000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(9131,1876.9184600,-1712.4310300,5219.9321300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(9131,1876.9184600,-1714.2552500,5219.9321300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(9131,1876.9184600,-1716.0806900,5219.9321300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1649,1876.9184600,-1712.6843300,5216.9101600,0.0000000,90.0000000,-90.0000000);
	CreateDynamicObject(1649,1876.9184600,-1715.9718000,5216.9101600,0.0000000,90.0000000,-90.0000000);
	CreateDynamicObject(19807,1876.6910400,-1711.3459500,5216.6025400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19807,1876.6910400,-1713.0422400,5216.6025400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19807,1876.6910400,-1714.9100300,5216.6025400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19807,1876.6910400,-1716.7226600,5216.6025400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19807,1877.1684600,-1717.3015100,5216.6025400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19807,1877.1684600,-1715.4162600,5216.6025400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19807,1877.1684600,-1713.6079100,5216.6025400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19807,1877.2085000,-1711.7712400,5216.6025400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1239,1879.2443800,-1701.8819600,5218.4863300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1870.6888400,-1698.7972400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1867.4804700,-1698.7972400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1861.0639600,-1698.7972400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19446,1872.3704800,-1706.8044400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19446,1879.4489700,-1708.4257800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19446,1881.9630100,-1713.2086200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1861.0600600,-1698.7707500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1523,1860.2800300,-1698.8264200,5215.6079100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1862.7211900,-1693.9113800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1859.4130900,-1693.9113800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1861.0725100,-1692.3741500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1861.1364700,-1694.0251500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1494,1861.1203600,-1695.5572500,5215.6264600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1494,1859.5397900,-1695.5572500,5215.6264600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1861.1240200,-1695.5573700,5219.8823200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1861.9547100,-1692.9661900,5215.7085000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1860.2597700,-1692.9896200,5215.7085000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1864.2736800,-1698.7972400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19446,1867.4907200,-1689.2010500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19446,1862.8835400,-1693.9145500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1867.4825400,-1701.9030800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1864.6777300,-1701.9051500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1870.6889600,-1701.9030800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1859.4284700,-1700.2987100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19446,1872.3790300,-1694.1626000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19385,1870.6821300,-1701.9100300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19447,1872.3535200,-1706.8172600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1869.0096400,-1703.5306400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19385,1869.0085400,-1706.7275400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19446,1856.4285900,-1706.8040800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1863.4187000,-1703.5919200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1863.4187000,-1706.7929700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1863.4187000,-1710.0000000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19446,1861.2365700,-1711.6688200,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19385,1865.9716800,-1710.0053700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1865.9716800,-1706.7342500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1865.9716800,-1703.5400400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1867.4991500,-1701.9249300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19355,1869.0096400,-1709.8194600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1865.9716800,-1713.1328100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19446,1858.5351600,-1706.7506100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19378,1858.0854500,-1706.8050500,5215.6269500,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(19355,1867.4842500,-1714.6649200,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19385,1870.6622300,-1714.6649200,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19355,1872.3535200,-1713.2314500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1865.9677700,-1703.5927700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1865.9677700,-1706.7973600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1865.9677700,-1710.0069600,5217.3798800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19385,1872.3535200,-1716.4217500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19385,1870.8502200,-1718.0465100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19385,1865.9758300,-1716.3577900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1859.8607200,-1713.3527800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1861.3607200,-1716.4602100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1864.3996600,-1711.7611100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19446,1858.2836900,-1701.9036900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19446,1877.1939700,-1717.6264600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1872.3535200,-1719.7265600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1874.7070300,-1727.2408400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1870.8383800,-1718.0665300,5217.3798800,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19450,1879.4423800,-1736.3702400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18070,1878.4387200,-1731.8044400,5218.6171900,0.0000000,180.0000000,-180.0000000);
	CreateDynamicObject(19358,1874.7089800,-1731.8698700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1874.7089800,-1735.0817900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19450,1882.0063500,-1733.4408000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19449,1877.1674800,-1718.9683800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19387,1877.1323200,-1725.5577400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19357,1880.3408200,-1725.5577400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19354,1883.8806200,-1697.0393100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1874.0487100,-1711.0026900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1861.0600600,-1698.7707500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1862.7211900,-1693.9113800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1861.9547100,-1692.9661900,5215.7085000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1860.2597700,-1692.9896200,5215.7085000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19354,1867.4825400,-1701.9030800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1870.6889600,-1701.9030800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19384,1863.4187000,-1703.5919200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19384,1863.4187000,-1710.0000000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18070,1878.4387200,-1731.8044400,5216.1513700,0.0000000,0.0000000,-180.0000000);
	CreateDynamicObject(19358,1885.1566200,-1727.0468800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1536,1885.1147500,-1728.6429400,5215.6831100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1883.5240500,-1728.7043500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1883.5240500,-1725.5577400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1536,1885.0947300,-1725.6412400,5215.6831100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19302,1881.9488500,-1728.0080600,5216.9443400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1881.9488500,-1726.2583000,5216.9443400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19304,1881.9688700,-1727.1577100,5218.7729500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19449,1882.0001200,-1720.7940700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1874.7089800,-1729.4775400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19357,1873.9986600,-1725.5577400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1872.3535200,-1722.9171100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1872.3554700,-1724.8568100,5217.3798800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19450,1869.3188500,-1722.9314000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1870.8383800,-1725.5672600,5217.3798800,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2491,1879.4196800,-1740.0054900,5214.9262700,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(3031,1880.3918500,-1740.0815400,5216.8613300,0.0000000,0.0000000,138.1799000);
	CreateDynamicObject(19388,1870.5245400,-1736.3792700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18981,1872.0640900,-1748.8610800,5215.2099600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19450,1869.3188500,-1732.5377200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1873.7282700,-1736.3785400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19388,1871.3470500,-1738.0749500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19450,1876.2486600,-1737.2137500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19388,1877.6519800,-1742.8671900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1877.6500200,-1738.8859900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19404,1879.1859100,-1740.7450000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1871.3470500,-1741.2773400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1880.7231400,-1738.7491500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1879.1562500,-1740.2028800,5216.5478500,0.0000000,180.0000000,180.0000000);
	CreateDynamicObject(19369,1879.3348400,-1737.6077900,5214.7426800,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19369,1879.3348400,-1737.5998500,5215.4487300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19369,1879.3348400,-1737.5898400,5216.1460000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19369,1879.3348400,-1737.5798300,5216.8505900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19369,1879.3348400,-1737.5698200,5217.6552700,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(3031,1878.3717000,-1740.5444300,5216.8613300,0.0000000,0.0000000,40.8600000);
	CreateDynamicObject(19450,1876.0676300,-1744.4348100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1880.7380400,-1741.1801800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1869.6600300,-1741.2829600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1869.6600300,-1738.0692100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1870.4792500,-1742.8244600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1873.9771700,-1725.5727500,5217.3798800,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19388,1877.1363500,-1725.5717800,5217.3789100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1880.3277600,-1725.5717800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19357,1872.4177200,-1723.8709700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19357,1872.4201700,-1720.6613800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1864.7948000,-1742.8244600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1867.9873000,-1742.8244600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18981,1847.0716600,-1749.0211200,5215.2099600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(18981,1899.1873800,-1748.9008800,5217.4868200,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19404,1866.2854000,-1734.9886500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19404,1867.9798600,-1739.7115500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19388,1863.1639400,-1736.6076700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(14488,1839.4101600,-1740.9538600,5218.1460000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18981,1846.9200400,-1724.0531000,5215.2099600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19355,1867.6545400,-1718.0465100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19355,1864.4578900,-1718.0465100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19388,1866.2854000,-1738.1960400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1865.5659200,-1736.6076700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19450,1868.9595900,-1734.8441200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1867.8000500,-1733.3212900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19460,1860.7982200,-1731.8789100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19460,1860.7982200,-1722.3018800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19460,1868.9506800,-1728.4499500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19368,1867.7769800,-1733.2876000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19414,1866.2629400,-1734.9841300,5217.3769500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19396,1863.1689500,-1736.5743400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19441,1865.3780500,-1736.5772700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1492,1850.2889400,-1734.2340100,5215.6269500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1497,1859.9160200,-1714.8385000,5215.6928700,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1497,1859.8900100,-1711.8474100,5215.6928700,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19428,1862.0686000,-1718.0465100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19368,1867.7769800,-1730.0054900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19396,1866.2629400,-1731.6225600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19396,1866.2629400,-1728.4012500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19396,1866.2629400,-1725.1977500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19368,1867.7769800,-1726.8057900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19368,1867.7769800,5217.3779300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1997,1868.3719500,-1727.9101600,5215.6865200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1997,1868.3719500,-1724.7788100,5215.6865200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1997,1868.3719500,-1731.1180400,5215.6865200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1860.7657500,-1736.6076700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19388,1858.3680400,-1736.6076700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19441,1861.5135500,-1736.5772700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18070,1857.1936000,-1722.1992200,5218.6171900,0.0000000,180.0000000,0.0000000);
	CreateDynamicObject(19358,1855.1595500,-1736.6076700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19450,1853.4857200,-1731.8800000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1853.4857200,-1719.1025400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18070,1857.1936000,-1722.1992200,5216.1513700,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1853.4857200,-1725.4729000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19368,1867.4209000,-1723.6729700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19368,1864.2309600,-1723.6729700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19368,1862.3241000,-1723.6720000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19451,1856.0616500,-1717.4321300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1851.8393600,-1717.5131800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1850.2889400,-1722.2730700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1850.2889400,-1725.4768100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1850.2889400,-1728.6809100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1850.2889400,-1733.4891400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1850.2889400,-1731.0898400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2637,1860.0153800,-1731.8823200,5216.1098600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2125,1858.8032200,-1732.3137200,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19358,1853.4857200,-1722.2690400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19388,1850.2889400,-1719.1236600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19450,1850.2889400,-1739.9127200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1850.2889400,-1745.5207500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1533,1861.4713100,-1717.9571500,5215.6928700,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1533,1861.4864500,-1716.4735100,5215.6928700,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19463,1845.3067600,-1730.3391100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19463,1843.6104700,-1724.2074000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19463,1835.6789600,-1730.3391100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19463,1845.3077400,-1720.8697500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19463,1838.7205800,-1725.5894800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19463,1835.6895800,-1720.8698700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19453,1843.7639200,-1715.9792500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19390,1850.1950700,-1719.1226800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19361,1850.1950700,-1715.9221200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19371,1850.1950700,-1722.5466300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19398,1850.1971400,-1728.6828600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19371,1850.1950700,-1725.7403600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19451,1860.7106900,-1722.2133800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19451,1860.7106900,-1731.8321500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19451,1853.5870400,-1731.8321500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19389,1853.5880100,-1719.1044900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19359,1853.5870400,-1725.4223600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19359,1853.5870400,-1722.2572000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1492,1850.2889400,-1729.4204100,5215.6269500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1492,1850.2889400,-1719.8698700,5215.6269500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19450,1858.3707300,-1742.8244600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19358,1851.9649700,-1742.8244600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19359,1855.2573200,-1736.5797100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19389,1858.3669400,-1736.5787400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19432,1860.1538100,-1736.5797100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.1571000,-1742.8654800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1850.3199500,-1747.7558600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1754.1689500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1861.5754400,-1742.8654800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1864.7910200,-1742.8654800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1853.6477100,-1744.5312500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1851.9642300,-1746.0487100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1855.3371600,-1746.0487100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1860.4005100,-1744.5312500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1858.7121600,-1746.0487100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1862.0948500,-1746.0487100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1857.0195300,-1744.5312500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,-1744.5312500,5217.3779300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1859.0499300,-1752.5957000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1863.7805200,-1747.7380400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1860.4005100,-1750.9444600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1857.0195300,-1750.9416500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1853.6477100,-1750.9325000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19440,1854.3630400,-1752.5987500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1855.3371600,-1749.4229700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1858.7121600,-1749.4229700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1862.0948500,-1749.4229700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1755.6832300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1858.9305400,-1755.6844500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1863.7757600,-1754.1689500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1865.7285200,-1744.5312500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1865.7285200,-1753.4089400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1864.2071500,-1755.7143600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19413,1872.0537100,-1751.7279100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1867.2464600,-1751.7279100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19440,1869.6517300,-1751.7279100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1874.7554900,-1750.9035600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1874.7554900,-1747.0579800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19440,1874.0433300,-1751.7269300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1870.6186500,-1756.6676000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19440,1865.7294900,-1755.8094500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1874.7554900,-1754.1029100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19440,1874.7535400,-1756.4924300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1280,1868.5610400,-1703.3616900,5216.1152300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(14782,1866.4157700,-1705.1047400,5216.7055700,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19355,1869.0096400,-1713.0107400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19428,1865.9726600,-1711.5616500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19428,1865.9726600,-1707.9870600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2400,1866.1130400,-1714.0395500,5215.7089800,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19428,1866.6910400,-1710.8304400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2398,1866.3116500,-1704.1536900,5217.2187500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19142,1866.3204300,-1713.8857400,5217.9184600,0.0000000,-90.0000000,-90.0000000);
	CreateDynamicObject(19142,1866.3204300,-1713.2866200,5217.9184600,0.0000000,-90.0000000,-90.0000000);
	CreateDynamicObject(19142,1866.3204300,-1712.6872600,5217.9184600,0.0000000,-90.0000000,-90.0000000);
	CreateDynamicObject(19142,1866.3204300,-1712.0634800,5217.9184600,0.0000000,-90.0000000,-90.0000000);
	CreateDynamicObject(19142,1866.3204300,-1711.4412800,5217.9184600,0.0000000,-90.0000000,-90.0000000);
	CreateDynamicObject(356,1866.5307600,-1714.1239000,5217.3715800,0.0000000,3.0000000,90.0000000);
	CreateDynamicObject(356,1866.5307600,-1712.9322500,5217.3715800,0.0000000,3.0000000,90.0000000);
	CreateDynamicObject(356,1866.5307600,-1711.7497600,5217.3715800,0.0000000,3.0000000,90.0000000);
	CreateDynamicObject(2475,1868.4254200,-1714.5168500,5216.2060500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(343,1868.6861600,-1714.3436300,5217.0039100,-180.0000000,90.0000000,34.4400000);
	CreateDynamicObject(343,1868.1453900,-1714.3436300,5217.0039100,-180.0000000,90.0000000,34.4400000);
	CreateDynamicObject(343,1867.5620100,-1714.3436300,5217.0039100,-180.0000000,90.0000000,34.4400000);
	CreateDynamicObject(356,1866.5307600,-1714.1239000,5216.5517600,0.0000000,3.0000000,90.0000000);
	CreateDynamicObject(356,1866.5307600,-1712.9322500,5216.5517600,0.0000000,3.0000000,90.0000000);
	CreateDynamicObject(356,1866.5307600,-1711.7497600,5216.5517600,0.0000000,3.0000000,90.0000000);
	CreateDynamicObject(2358,1867.7890600,-1714.2667200,5216.4541000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2043,1868.5240500,-1714.1560100,5216.4414100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2043,1868.5240500,-1714.3360600,5216.4414100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(3016,1868.5755600,-1714.3415500,5218.5278300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(3016,1868.1252400,-1714.3415500,5218.5278300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(3016,1867.6848100,-1714.3538800,5218.5278300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18637,1867.1864000,-1714.6259800,5217.6835900,90.0000000,0.0000000,180.0000000);
	CreateDynamicObject(18637,1867.1864000,-1714.6259800,5216.6206100,90.0000000,0.0000000,180.0000000);
	CreateDynamicObject(348,1868.8277600,-1714.2882100,5217.7583000,-90.0000000,0.0000000,-154.6201000);
	CreateDynamicObject(348,1868.1944600,-1714.2882100,5217.7583000,-90.0000000,0.0000000,-154.6201000);
	CreateDynamicObject(348,1867.7475600,-1714.2882100,5217.7583000,-90.0000000,0.0000000,-154.6201000);
	CreateDynamicObject(1280,1868.5610400,-1704.6230500,5216.1167000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2172,1867.1680900,-1693.5730000,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2172,1867.1680900,-1691.6628400,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2172,1867.1680900,-1689.7528100,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2172,1868.0858200,-1690.7627000,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1868.0858200,-1692.6787100,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1868.0858200,-1694.5827600,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1871.8459500,-1689.7327900,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2172,1863.4343300,-1690.7426800,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1863.4343300,-1692.6584500,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1863.4343300,-1694.5704300,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1863.4343300,-1696.4899900,5215.7045900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2172,1871.8459500,-1691.6479500,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2172,1871.8459500,-1693.5664100,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2172,1871.8459500,-1695.4832800,5215.7045900,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1703,1878.1003400,-1686.9615500,5215.6860400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1823,1872.8465600,-1687.4063700,5215.7060500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1703,1874.5417500,-1686.9615500,5215.6860400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2811,1877.3160400,-1686.8809800,5215.6772500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1703,1872.9923100,-1690.0573700,5215.6860400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1703,1872.9923100,-1693.6518600,5215.6860400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2811,1872.9469000,-1690.8405800,5215.6772500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1703,1883.2511000,-1690.9325000,5215.6860400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1823,1883.8425300,-1694.5018300,5215.7060500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1703,1883.2511000,-1695.0310100,5215.6860400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1823,1873.4406700,-1695.2174100,5215.7060500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1703,1872.9923100,-1697.7744100,5215.6860400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2811,1883.2928500,-1697.9704600,5215.6772500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1703,1883.2511000,-1698.8382600,5215.6860400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2604,1879.7760000,-1702.4953600,5216.5019500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2161,1877.0655500,-1702.0029300,5217.0307600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2164,1875.3048100,-1702.0029300,5215.6752900,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2161,1877.0655500,-1702.0029300,5215.6826200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19355,1861.3443600,-1714.9085700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19355,1861.1944600,-1711.7611100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1850.9436000,-1745.4432400,5215.7002000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1812,1854.2629400,-1745.4432400,5215.7002000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1812,1857.6280500,-1745.4432400,5215.7002000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1812,1861.0094000,-1745.4432400,5215.7002000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1812,1854.2424300,-1750.0199000,5215.7002000,0.0000000,0.0000000,-180.0000000);
	CreateDynamicObject(1812,1857.6047400,-1750.0199000,5215.7002000,0.0000000,0.0000000,-180.0000000);
	CreateDynamicObject(1812,1860.9853500,-1750.0199000,5215.7002000,0.0000000,0.0000000,-180.0000000);
	CreateDynamicObject(14455,1843.8747600,-1715.4466600,5217.3745100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19361,1848.5435800,-1720.7695300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19361,1845.3465600,-1720.7695300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19361,1848.5277100,-1714.3919700,5217.3779300,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19361,1845.3226300,-1714.3919700,5217.3779300,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(14455,1849.1468500,-1714.4914600,5217.3745100,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(14604,1849.7124000,-1716.6666300,5216.6816400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1432,1846.0742200,-1716.6804200,5215.8129900,0.0000000,0.0000000,46.2600000);
	CreateDynamicObject(1432,1847.2768600,-1718.9504400,5215.8129900,0.0000000,0.0000000,-4.5000000);
	CreateDynamicObject(2894,1845.9670400,-1717.0129400,5216.4301800,0.0000000,0.0000000,-16.3800000);
	CreateDynamicObject(2852,1847.1134000,-1719.0170900,5216.4262700,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1216,1855.0836200,-1742.4625200,5216.3833000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(1216,1857.8209200,-1742.4625200,5216.3833000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(1216,1860.4652100,-1742.4625200,5216.3833000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2415,1855.8857400,-1721.5489500,5215.5112300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2417,1855.6010700,-1722.8474100,5215.5512700,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2426,1860.0550500,-1721.7446300,5216.6601600,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2453,1859.9663100,-1723.4753400,5217.0312500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2361,1857.0656700,-1718.1014400,5215.6821300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1734.4464100,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2637,1860.0153800,-1733.9742400,5216.1098600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2637,1855.4222400,-1734.3070100,5216.1098600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2637,1860.0153800,-1729.7956500,5216.1098600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2637,1860.0153800,-1727.7042200,5216.1098600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2637,1855.4222400,-1730.6495400,5216.1098600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2637,1855.4222400,-1726.9472700,5216.1098600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1733.4715600,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1731.3430200,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1729.2570800,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1730.2434100,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1728.1798100,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1858.8032200,-1727.2586700,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1806,1864.8718300,-1695.6384300,5215.8227500,0.0000000,0.0000000,116.3400000);
	CreateDynamicObject(1502,1866.7053200,-1698.8158000,5215.6269500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1502,1863.3900100,-1702.8107900,5215.6269500,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1502,1863.4401900,-1710.7491500,5215.6269500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1502,1865.4156500,-1701.8818400,5215.6269500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(1502,1874.6964100,-1702.7618400,5215.6269500,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1502,1877.6280500,-1742.0836200,5215.6269500,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1502,1877.6623500,-1739.6389200,5215.6269500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1502,1871.3336200,-1737.2940700,5215.6269500,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19805,1869.1043700,-1703.9094200,5217.2187500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19431,1877.6500200,-1741.2894300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1871.3470500,-1743.6872600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19431,1880.7380400,-1743.5849600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1649,1879.4094200,-1740.7855200,5216.6704100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1649,1879.4094200,-1740.7252200,5216.6704100,0.0000000,90.0000000,180.0000000);
	CreateDynamicObject(1649,1867.9294400,-1739.7424300,5216.6704100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1649,1867.9294400,-1739.6882300,5216.6704100,0.0000000,90.0000000,180.0000000);
	CreateDynamicObject(1649,1872.1191400,-1751.7738000,5216.6704100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1649,1872.1191400,-1751.7294900,5216.6704100,0.0000000,90.0000000,180.0000000);
	CreateDynamicObject(1649,1866.2601300,-1735.1004600,5216.6704100,0.0000000,90.0000000,90.0000000);
	CreateDynamicObject(1649,1866.2933300,-1735.1004600,5216.6704100,0.0000000,90.0000000,-90.0000000);
	CreateDynamicObject(983,1877.9412800,-1729.6871300,5217.9790000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(983,1884.3492400,-1729.6871300,5217.9790000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2894,1880.1618700,-1729.7634300,5216.6606400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2190,1878.6251200,-1729.8241000,5216.6601600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1806,1878.1367200,-1732.0258800,5215.7085000,0.0000000,0.0000000,-30.0000000);
	CreateDynamicObject(2462,1881.8393600,-1734.8304400,5215.6787100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2462,1881.8393600,-1735.8106700,5215.6787100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2164,1879.5783700,-1736.2473100,5215.6884800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2162,1877.8100600,-1736.2673300,5215.6694300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(1808,1876.2038600,-1736.0499300,5215.6787100,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2165,1881.1378200,-1731.4445800,5215.8608400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19454,1886.7409700,-1727.2032500,5215.6215800,0.0000000,90.0000000,90.0000000);
	CreateDynamicObject(2125,1854.9063700,-1728.1058300,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1855.8973400,-1728.1058300,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1855.8973400,-1725.7237500,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1854.9063700,-1725.7237500,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1854.9063700,-1729.3577900,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1855.8951400,-1729.3577900,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1855.8973400,-1731.7987100,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1854.9063700,-1731.7987100,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1854.9063700,-1733.0992400,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1855.8973400,-1733.0992400,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1855.8973400,-1735.4997600,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2125,1854.9063700,-1735.4997600,5216.0200200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(3388,1861.3803700,-1724.7982200,5215.7060500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1997,1861.9058800,-1726.1943400,5215.6865200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1997,1861.9058800,-1728.6544200,5215.6865200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1997,1861.9058800,-1731.0970500,5215.6865200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1997,1861.9058800,-1733.5797100,5215.6865200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(3388,1861.3803700,-1735.2141100,5215.7060500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2163,1863.7131300,-1723.7641600,5217.0039100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2414,1867.8877000,-1739.4002700,5215.6865200,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2414,1869.1091300,-1739.3990500,5215.6875000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2414,1866.6982400,-1736.9238300,5215.6865200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2414,1866.6982400,-1734.9188200,5215.6865200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2606,1867.6262200,-1739.4184600,5218.5297900,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2190,1868.2153300,-1739.5174600,5216.5815400,0.0000000,0.0000000,172.8000000);
	CreateDynamicObject(2190,1867.8020000,-1739.6071800,5216.5815400,0.0000000,0.0000000,168.1200000);
	CreateDynamicObject(2190,1867.3320300,-1739.5905800,5216.5815400,0.0000000,0.0000000,155.1002000);
	CreateDynamicObject(2190,1866.8960000,-1739.5225800,5216.5815400,0.0000000,0.0000000,147.7802000);
	CreateDynamicObject(2190,1866.4661900,-1739.3682900,5216.5815400,0.0000000,0.0000000,137.5204000);
	CreateDynamicObject(19808,1867.6418500,-1739.0983900,5216.7402300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2342,1866.7486600,-1733.7561000,5216.8569300,0.0000000,0.0000000,-110.5800000);
	CreateDynamicObject(1806,1868.4845000,-1738.0443100,5215.7089800,0.0000000,0.0000000,142.3801000);
	CreateDynamicObject(1806,1868.0567600,-1734.8217800,5215.7089800,0.0000000,0.0000000,101.2801000);
	CreateDynamicObject(2608,1866.7506100,-1735.0604200,5216.2880900,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2190,1866.6499000,-1736.6654100,5216.5815400,0.0000000,0.0000000,64.6801000);
	CreateDynamicObject(2190,1866.6499000,-1736.2590300,5216.5815400,0.0000000,0.0000000,64.6801000);
	CreateDynamicObject(2190,1866.6499000,-1735.8498500,5216.5815400,0.0000000,0.0000000,64.6801000);
	CreateDynamicObject(14842,1839.6938500,-1725.8450900,5217.3515600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(14842,1840.3691400,-1729.3757300,5217.3515600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(14842,1843.7338900,-1728.6954300,5217.3515600,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19371,1844.7102100,-1728.6444100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19444,1844.7121600,-1726.8193400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(11707,1845.5351600,-1730.1710200,5216.9204100,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(11707,1847.4477500,-1730.1710200,5216.9204100,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1839.6368400,-1723.6158400,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19444,1848.3842800,-1723.4907200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19444,1846.4196800,-1723.4907200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19444,1844.4790000,-1723.4907200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19444,1842.5323500,-1723.4907200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19444,1840.5997300,-1723.4907200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1841.5771500,-1723.6158400,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1843.5185500,-1723.6158400,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1845.4388400,-1723.6158400,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1847.3980700,-1723.6158400,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(11707,1844.8697500,-1729.4901100,5216.9204100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(11707,1844.8697500,-1727.5721400,5216.9204100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1649,1874.6865200,-1706.4304200,5216.6704100,0.0000000,90.0000000,90.0000000);
	CreateDynamicObject(1649,1874.7390100,-1706.4304200,5216.6704100,0.0000000,90.0000000,-90.0000000);
	CreateDynamicObject(1806,1864.7357200,-1694.0731200,5215.8227500,0.0000000,0.0000000,85.6200000);
	CreateDynamicObject(1806,1864.7114300,-1692.0014600,5215.8227500,0.0000000,0.0000000,109.8600000);
	CreateDynamicObject(1806,1864.7613500,-1690.4466600,5215.8227500,0.0000000,0.0000000,59.8200600);
	CreateDynamicObject(1806,1869.4361600,-1692.2719700,5215.8227500,0.0000000,0.0000000,85.6200100);
	CreateDynamicObject(1806,1869.4039300,-1694.3010300,5215.8227500,0.0000000,0.0000000,70.2600000);
	CreateDynamicObject(1806,1869.4787600,-1690.2498800,5215.8227500,0.0000000,0.0000000,113.8200000);
	CreateDynamicObject(1806,1870.5715300,-1694.2911400,5215.8227500,0.0000000,0.0000000,-82.7400000);
	CreateDynamicObject(1806,1870.4718000,-1692.1055900,5215.8227500,0.0000000,0.0000000,-99.7200400);
	CreateDynamicObject(1806,1870.5433300,-1690.4856000,5215.8227500,0.0000000,0.0000000,-72.4800300);
	CreateDynamicObject(1806,1870.4770500,-1695.7719700,5215.8227500,0.0000000,0.0000000,-119.4600000);
	CreateDynamicObject(1806,1865.7712400,-1694.2108200,5215.8227500,0.0000000,0.0000000,-90.9000000);
	CreateDynamicObject(1806,1865.7591600,-1692.3555900,5215.8227500,0.0000000,0.0000000,-105.4201000);
	CreateDynamicObject(1806,1865.8223900,-1690.2637900,5215.8227500,0.0000000,0.0000000,-100.1400700);
	CreateDynamicObject(2514,1856.4209000,-1751.9405500,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1859.8103000,-1751.9405500,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1863.1959200,-1751.9405500,5215.6938500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2514,1863.1440400,-1743.4738800,5215.6938500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1859.7242400,-1743.4738800,5215.6938500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1856.3073700,-1743.4738800,5215.6938500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2514,1852.9682600,-1743.4738800,5215.6938500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1985,1832.3199500,-1734.0035400,5218.6801800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1985,1830.0372300,-1734.0415000,5218.6801800,0.0000000,0.0000000,-130.4400000);
	CreateDynamicObject(1985,1835.5415000,-1733.5064700,5218.7002000,0.0000000,0.0000000,-35.3400000);
	CreateDynamicObject(1985,1835.5229500,-1731.2398700,5218.7002000,0.0000000,0.0000000,-101.0400000);
	CreateDynamicObject(14782,1844.8256800,-1731.0942400,5216.6748000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(14791,1846.5665300,-1741.3653600,5217.7470700,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(14411,1847.3070100,-1747.0128200,5213.3984400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(946,1829.7655000,-1740.6684600,5217.8813500,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1946,1831.8950200,-1741.3537600,5215.9111300,-120.8999900,85.7400100,53.7000000);
	CreateDynamicObject(2628,1830.1452600,-1749.8315400,5215.7192400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2628,1832.5336900,-1749.8315400,5215.7192400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2628,1834.8410600,-1749.8315400,5215.7192400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2627,1837.3032200,-1749.7005600,5215.7031300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2627,1839.3282500,-1749.7005600,5215.7031300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2629,1841.6524700,-1749.4481200,5215.7109400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2629,1843.7271700,-1749.4481200,5215.7109400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2913,1841.1887200,-1750.0017100,5216.6894500,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(2913,1843.2688000,-1750.0017100,5216.6894500,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(2915,1839.9443400,-1731.0841100,5215.8344700,0.0000000,0.0000000,20.1600000);
	CreateDynamicObject(2121,1878.7142300,-1716.9945100,5216.2085000,0.0000000,0.0000000,-97.5600000);
	CreateDynamicObject(1810,1875.5760500,-1714.9152800,5215.6992200,0.0000000,0.0000000,79.5600000);
	CreateDynamicObject(2121,1878.6926300,-1715.2047100,5216.2085000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2121,1878.6088900,-1713.4005100,5216.2085000,0.0000000,0.0000000,-83.0400300);
	CreateDynamicObject(2121,1878.6872600,-1711.7168000,5216.2085000,0.0000000,0.0000000,-102.9600400);
	CreateDynamicObject(1810,1875.3625500,-1711.3911100,5215.6992200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1810,1875.4465300,-1713.0097700,5215.6992200,0.0000000,0.0000000,94.0200000);
	CreateDynamicObject(1810,1875.4279800,-1716.6613800,5215.6992200,0.0000000,0.0000000,93.5400000);
	CreateDynamicObject(16378,1858.2884500,-1704.3579100,5216.4668000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2191,1858.5443100,-1706.1455100,5215.5864300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2164,1860.9252900,-1706.6250000,5215.7002000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2257,1856.5502900,-1704.2181400,5217.5810500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2289,1856.5561500,-1710.6081500,5217.5410200,0.0000000,0.0000000,90.2400000);
	CreateDynamicObject(2207,1859.2712400,-1710.1619900,5215.6933600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1714,1857.3183600,-1709.2141100,5215.6875000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2108,1856.9447000,-1707.2557400,5215.7143600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2244,1862.9925500,-1711.1760300,5215.9687500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2190,1859.2393800,-1708.2987100,5216.4594700,0.0000000,0.0000000,-35.4000000);
	CreateDynamicObject(19808,1858.6844500,-1708.7139900,5216.4775400,0.0000000,0.0000000,-35.3400000);
	CreateDynamicObject(2280,1857.0067100,-1707.6792000,5217.5156300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2267,1856.5561500,-1709.0972900,5217.9975600,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1670,1859.1059600,-1708.9231000,5216.4897500,0.0000000,0.0000000,63.3000000);
	CreateDynamicObject(1663,1860.6922600,-1709.9211400,5216.1547900,0.0000000,0.0000000,-106.0799500);
	CreateDynamicObject(1663,1860.6530800,-1708.4512900,5216.1547900,0.0000000,0.0000000,-77.4599000);
	CreateDynamicObject(18981,1847.8303200,-1774.0157500,5215.2099600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19367,1846.9853500,-1754.1489300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1848.6475800,-1752.4917000,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1755.6641800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1850.3199500,-1757.3787800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1855.2110600,-1758.9610600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19395,1850.3199500,-1760.5874000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1763.7972400,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1767.0092800,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1770.2116700,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1773.4216300,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1776.6269500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1779.8386200,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1850.3199500,-1783.0358900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1846.9853500,-1757.3615700,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1760.5634800,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1763.7634300,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1766.9663100,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1770.1756600,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1773.3743900,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1776.5814200,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19395,1846.9853500,-1779.7895500,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19367,1846.9853500,-1782.9866900,5217.3779300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19367,1848.6569800,-1784.6077900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2412,1874.8043200,-1706.5939900,5215.7216800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2412,1872.9909700,-1706.5939900,5215.7216800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1808,1883.4578900,-1708.0184300,5215.7002000,0.0000000,0.0000000,-139.0200000);
	CreateDynamicObject(2066,1882.2548800,-1702.4969500,5215.6840800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2066,1883.1590600,-1702.4969500,5215.6840800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2639,1879.8582800,-1719.4936500,5216.3217800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2639,1877.7741700,-1719.4925500,5216.3208000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2639,1875.6908000,-1719.4936500,5216.3217800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2639,1873.6059600,-1719.4925500,5216.3208000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2639,1881.9361600,-1719.4925500,5216.3208000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(1722,1868.5810500,-1701.7282700,5215.7080100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1722,1867.9184600,-1701.7282700,5215.7080100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1722,1867.2670900,-1701.7282700,5215.7080100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1722,1866.6159700,-1701.7282700,5215.7080100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2008,1875.3769500,-1707.2369400,5215.7060500,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2309,1876.7360800,-1706.5141600,5215.7211900,0.0000000,0.0000000,86.1000000);
	CreateDynamicObject(2210,1875.3461900,-1708.0201400,5216.4438500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2167,1877.9827900,-1708.3208000,5215.6967800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2167,1878.8852500,-1708.3208000,5215.6967800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2165,1881.5888700,-1707.8596200,5215.7089800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2309,1881.3641400,-1706.4798600,5215.7211900,0.0000000,0.0000000,156.3600000);
	CreateDynamicObject(2309,1880.9638700,-1704.0483400,5215.7211900,0.0000000,0.0000000,4.6800000);
	CreateDynamicObject(19459,1842.1976300,-1758.9587400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1762.1501500,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1765.3775600,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1768.5736100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1771.7774700,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1774.9843800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1778.1857900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1842.1976300,-1781.3867200,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1762.1829800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1765.4033200,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1768.6237800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1771.8242200,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1775.0247800,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1778.2054400,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1781.4465300,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1855.2110600,-1784.6077900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1858.0164800,-1763.8083500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1858.0164800,-1773.4414100,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1858.0164800,-1783.0677500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1839.3387500,-1760.5188000,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1839.3387500,-1770.2283900,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1839.3387500,-1779.7762500,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(16649,1881.7556200,-1747.0194100,5217.2128900,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(16649,1881.7556200,-1750.8774400,5217.2128900,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1873.1107200,-1746.1984900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1869.9928000,-1746.1975100,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19367,1867.2454800,-1746.1984900,5217.3779300,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19440,1874.7540300,-1749.0246600,5217.3779300,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1874.7574500,-1749.3724400,5219.5600600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1886.8293500,-1749.0605500,5221.8418000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1891.0212400,-1740.8834200,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1906.5373500,-1752.1474600,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1891.6422100,-1752.1474600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.0212400,-1757.0199000,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1907.0528600,-1757.0277100,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1891.6422100,-1745.7757600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6339100,-1748.2889400,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6339100,-1749.6340300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1901.2631800,-1749.6340300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19367,1901.8089600,-1750.6304900,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1901.2605000,-1748.2902800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5373500,-1745.7757600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19367,1901.8089600,-1747.2939500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1907.0528600,-1740.8869600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(18981,1899.1074200,-1723.9069800,5217.4868200,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19367,1896.3719500,-1744.2585400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1896.3719500,-1753.6647900,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1901.8089600,-1744.0841100,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1901.8089600,-1753.8416700,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1740.8785400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1737.6684600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1734.4599600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1731.2506100,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1728.0417500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1724.8321500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1721.6237800,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1718.4150400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1741.0500500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1737.8399700,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1734.6285400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1731.4194300,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1728.2160600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1725.0117200,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1721.8028600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1718.5929000,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1715.3797600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1901.8089600,-1715.2099600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1907.0528600,-1731.2629400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1907.0528600,-1721.6385500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1907.0528600,-1715.2216800,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1904.3780500,-1713.7086200,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1894.7464600,-1713.7086200,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1891.0212400,-1731.2587900,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1891.0212400,-1721.6344000,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1891.0212400,-1715.2120400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19440,1889.1405000,-1713.7086200,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18981,1899.3374000,-1773.8964800,5217.4868200,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(19395,1896.3719500,-1756.8719500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1760.0810500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1763.2873500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1766.4939000,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1769.6966600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1772.8968500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1776.0999800,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1779.3029800,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1896.3719500,-1782.5074500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1757.0441900,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1760.2500000,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1763.4548300,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1766.6639400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1769.8679200,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1773.0737300,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1776.2790500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19395,1901.8089600,-1779.4847400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1901.8089600,-1782.6900600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1891.0212400,-1766.6496600,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1891.0212400,-1776.2771000,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1891.0212400,-1782.6967800,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1907.0528600,-1766.6562500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1907.0528600,-1776.2889400,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19367,1907.0528600,-1782.7060500,5219.7329100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19459,1904.3824500,-1784.1805400,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19459,1894.7509800,-1784.1805400,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19440,1889.1340300,-1784.1805400,5219.7329100,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2414,1868.4708300,-1752.2063000,5215.6875000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2414,1870.4754600,-1752.2063000,5215.6875000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2414,1872.4790000,-1752.2063000,5215.6875000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2414,1873.3029800,-1752.2043500,5215.6884800,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2606,1869.0000000,-1756.3748800,5218.5297900,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2606,1869.0000000,-1756.4930400,5218.0869100,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2606,1870.9801000,-1756.3748800,5218.5297900,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2606,1872.9603300,-1756.3748800,5218.5297900,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2606,1870.9801000,-1756.4930400,5218.0869100,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2606,1872.9603300,-1756.4930400,5218.0869100,14.9900000,0.0000000,180.0000000);
	CreateDynamicObject(2414,1874.3099400,-1753.0908200,5215.6875000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2414,1874.3099400,-1755.0937500,5215.6875000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2414,1874.2071500,-1756.2032500,5215.6884800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2414,1869.4956100,-1756.2032500,5215.6875000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2414,1871.4990200,-1756.2032500,5215.6875000,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2414,1873.0637200,-1756.2021500,5215.6894500,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19302,1873.9609400,-1701.8895300,5216.9233400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19302,1870.5865500,-1701.8895300,5216.9233400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19302,1869.0052500,-1706.7932100,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1865.9495800,-1710.0686000,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1865.9642300,-1716.4146700,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1872.3482700,-1716.4731400,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1870.5643300,-1714.6610100,5216.9233400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19302,1870.7441400,-1718.0427200,5216.9233400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19302,1870.8906300,-1725.5587200,5216.9233400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19302,1877.0349100,-1725.5587200,5216.9233400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19302,1870.5822800,-1736.3883100,5216.9233400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19302,1874.6868900,-1734.9820600,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19302,1874.6868900,-1727.2934600,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1869.6705300,-1741.3382600,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1866.2760000,-1738.0972900,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19302,1872.3695100,-1700.4267600,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1866.2426800,-1731.6855500,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1866.2426800,-1728.4549600,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1866.2426800,-1725.2485400,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1863.0655500,-1736.5716600,5216.9233400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1492,1857.5843500,-1736.5787400,5215.6269500,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19302,1853.5118400,-1719.1693100,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2608,1878.4671600,-1708.1474600,5218.7363300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2922,1878.0528600,-1740.8354500,5217.3881800,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2611,1876.2229000,-1701.7775900,5217.5473600,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2612,1872.2214400,-1709.1457500,5217.5473600,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(16779,1859.4683800,-1704.1344000,5219.2475600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1862.8320300,-1711.1583300,5219.2387700,15.0000000,0.0000000,-115.4999000);
	CreateDynamicObject(19378,1858.1253700,-1706.8050500,5219.1621100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1886,1862.8320300,-1706.2983400,5219.2387700,15.0000000,0.0000000,-115.4999000);
	CreateDynamicObject(2253,1863.0134300,-1706.3647500,5215.9809600,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1860.0313700,-1700.3549800,5219.2387700,15.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1886,1863.4240700,-1698.3015100,5219.2387700,15.0000000,0.0000000,134.1599600);
	CreateDynamicObject(1886,1871.9482400,-1698.2044700,5219.2387700,15.0000000,0.0000000,214.9796000);
	CreateDynamicObject(1886,1882.5051300,-1688.0223400,5219.2387700,15.0000000,0.0000000,-56.1603600);
	CreateDynamicObject(1886,1883.4067400,-1707.9150400,5219.2387700,15.0000000,0.0000000,220.9793200);
	CreateDynamicObject(1886,1881.5242900,-1708.9122300,5219.2387700,15.0000000,0.0000000,-36.6608700);
	CreateDynamicObject(1886,1872.7753900,-1711.5162400,5219.2387700,15.0000000,0.0000000,36.5991600);
	CreateDynamicObject(1886,1866.4991500,-1716.3670700,5219.2387700,15.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1886,1865.3746300,-1714.8405800,5219.2387700,15.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1886,1870.7858900,-1718.6422100,5219.2387700,15.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1870.7858900,-1724.9759500,5219.2387700,15.0000000,0.0000000,180.0000000);
	CreateDynamicObject(1886,1881.5084200,-1725.1406300,5219.2387700,15.0000000,0.0000000,236.9999200);
	CreateDynamicObject(1886,1875.2672100,-1727.2937000,5219.2387700,15.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1886,1874.2042200,-1726.0376000,5219.2387700,15.0000000,0.0000000,-47.7600300);
	CreateDynamicObject(1886,1870.5078100,-1742.2623300,5219.2387700,15.0000000,0.0000000,180.0000000);
	CreateDynamicObject(18981,1871.7440200,-1698.8618200,5219.5952100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1886,1877.0910600,-1740.7445100,5219.2387700,15.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1886,1867.7017800,-1733.8831800,5219.2387700,15.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1866.7451200,-1732.8621800,5219.2387700,15.0000000,0.0000000,131.6999500);
	CreateDynamicObject(1886,1866.7451200,-1729.5650600,5219.2387700,15.0000000,0.0000000,131.7000000);
	CreateDynamicObject(1886,1866.7451200,-1726.3422900,5219.2387700,15.0000000,0.0000000,131.7000000);
	CreateDynamicObject(1886,1865.8064000,-1736.0694600,5219.2387700,15.0000000,0.0000000,221.2799700);
	CreateDynamicObject(1886,1854.0719000,-1736.1304900,5219.2387700,15.0000000,0.0000000,132.8998700);
	CreateDynamicObject(1886,1849.7863800,-1729.8299600,5219.2387700,15.0000000,0.0000000,215.6397600);
	CreateDynamicObject(1886,1849.7741700,-1720.2888200,5219.2387700,15.0000000,0.0000000,221.3395500);
	CreateDynamicObject(1886,1851.9868200,-1718.0844700,5219.2387700,15.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1865.7808800,-1737.0244100,5219.2387700,15.0000000,0.0000000,-49.6199200);
	CreateDynamicObject(1886,1849.2088600,-1731.2258300,5220.7417000,15.0000000,0.0000000,310.1398000);
	CreateDynamicObject(1886,1828.8708500,-1740.7414600,5222.7627000,15.0000000,0.0000000,90.0000000);
	CreateDynamicObject(18981,1872.7441400,-1723.8623000,5219.5952100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1886,1874.1716300,-1748.9182100,5219.2387700,15.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1886,1864.7740500,-1743.4316400,5219.2387700,15.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1850.7882100,-1746.5346700,5219.2387700,15.0000000,0.0000000,44.8200500);
	CreateDynamicObject(19303,1850.3132300,-1760.4940200,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1763.7053200,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1766.9193100,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1770.1246300,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1773.3328900,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1776.5390600,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1779.7428000,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1850.3132300,-1782.9466600,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1779.8809800,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1776.6715100,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1773.4687500,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1770.2673300,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1767.0639600,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1763.8579100,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1760.6525900,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1846.9841300,-1757.4676500,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19302,1850.3166500,-1754.2231400,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1863.7713600,-1754.2331500,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1864.6912800,-1742.8278800,5216.9233400,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(19302,1867.3038300,-1751.7044700,5216.9233400,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19302,1874.7647700,-1750.9698500,5216.9233400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19302,1874.7647700,-1746.9626500,5216.9233400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2949,1861.3444800,-1746.0677500,5215.7065400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2949,1857.9622800,-1746.0677500,5215.7065400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2949,1854.5847200,-1746.0677500,5215.7065400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2949,1851.2139900,-1746.0677500,5215.7065400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2949,1856.0472400,-1749.4139400,5215.7065400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2949,1862.8005400,-1749.4139400,5215.7065400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2949,1859.4315200,-1749.4139400,5215.7065400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(18981,1847.8303200,-1774.0157500,5219.5942400,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1812,1893.5942400,-1755.8115200,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2008,1872.0673800,-1741.2773400,5215.7045900,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1720,1872.1356200,-1740.3690200,5215.6982400,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1806,1872.9528800,-1742.6665000,5215.7085000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2608,1872.7656300,-1744.1254900,5218.7363300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2608,1874.6447800,-1744.1254900,5218.7363300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2008,1874.0517600,-1741.2773400,5215.7045900,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1806,1874.7241200,-1742.6464800,5215.7085000,0.0000000,0.0000000,-25.0800000);
	CreateDynamicObject(1720,1875.0314900,-1740.3690200,5215.6982400,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2838,1873.9982900,-1755.9875500,5216.7387700,0.0000000,0.0000000,-113.0400000);
	CreateDynamicObject(2190,1871.5340600,-1752.0605500,5216.5908200,0.0000000,0.0000000,-13.7400000);
	CreateDynamicObject(2190,1871.9597200,-1752.0206300,5216.5908200,0.0000000,0.0000000,-18.5400000);
	CreateDynamicObject(2190,1872.3991700,-1752.0365000,5216.5908200,0.0000000,0.0000000,-25.6200000);
	CreateDynamicObject(2190,1872.8253200,-1752.0810500,5216.5908200,0.0000000,0.0000000,-30.0000000);
	CreateDynamicObject(2190,1873.2511000,-1752.1848100,5216.5908200,0.0000000,0.0000000,-36.7200000);
	CreateDynamicObject(19808,1872.0925300,-1752.5162400,5216.7412100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2852,1869.5958300,-1752.3410600,5216.7343800,0.0000000,0.0000000,43.8600000);
	CreateDynamicObject(1808,1866.1516100,-1756.2377900,5215.7080100,0.0000000,0.0000000,136.9799200);
	CreateDynamicObject(2008,1874.2590300,-1753.8465600,5215.9194300,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2309,1871.3076200,-1753.9233400,5215.7168000,0.0000000,0.0000000,-18.2400100);
	CreateDynamicObject(2162,1865.8061500,-1754.4796100,5216.9951200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2309,1872.6377000,-1754.3984400,5215.7168000,0.0000000,0.0000000,-91.1399800);
	CreateDynamicObject(2162,1872.6364700,-1756.2966300,5215.8154300,0.0000000,0.0000000,180.0000000);
	CreateDynamicObject(2775,1869.5585900,-1752.1756600,5218.5253900,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2309,1868.3934300,-1754.4325000,5215.7168000,0.0000000,0.0000000,-161.5201300);
	CreateDynamicObject(18981,1847.7452400,-1718.1104700,5219.5952100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(18981,1872.7441400,-1731.9965800,5219.5971700,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(18981,1862.3110400,-1742.6298800,5219.5961900,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(18981,1862.3110400,-1749.2290000,5219.5952100,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(18981,1847.8303200,-1763.7384000,5219.5932600,0.0000000,90.0000000,0.0000000);
	CreateDynamicObject(1886,1887.4012500,-1747.0207500,5221.5693400,15.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1886,1887.4012500,-1750.9027100,5221.5693400,15.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1886,1899.2242400,-1714.2779500,5221.5693400,15.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1886,1899.2242400,-1783.6127900,5221.5693400,15.0000000,0.0000000,180.0000000);
	CreateDynamicObject(19459,1891.6221900,-1742.7454800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1755.2325400,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1742.6054700,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1755.4173600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1739.2673300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1736.0826400,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1732.8621800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1729.6479500,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1726.4362800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1723.2320600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1720.0507800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5573700,-1716.8078600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1739.4637500,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1736.2572000,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1733.0184300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1729.8138400,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1726.6212200,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1723.3992900,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1720.1989700,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1716.9973100,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1758.4942600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1761.6748000,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1764.8759800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1768.0781300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1771.2800300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1774.4813200,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1777.7028800,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1891.6221900,-1780.9244400,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1758.6590600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1761.8627900,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1765.0648200,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1768.2857700,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1771.4715600,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1774.6727300,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1777.8908700,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19459,1906.5773900,-1781.1289100,5219.7329100,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1757.2911400,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1759.0745800,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1762.2558600,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1765.4552000,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1768.6578400,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1771.8795200,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1775.0616500,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1778.3039600,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1781.5261200,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1760.5325900,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1763.7136200,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1766.9342000,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1770.1345200,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1773.3348400,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1776.5174600,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1779.7978500,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1783.0029300,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1740.0684800,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1736.8386200,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1733.5961900,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1730.4361600,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1727.2133800,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1723.9908400,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1720.8015100,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1717.5787400,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1893.5942400,-1714.3347200,5217.9824200,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1741.4985400,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1738.2611100,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1735.1013200,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1731.8468000,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1728.5366200,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1725.4215100,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1722.2106900,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1719.0218500,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(2514,1891.6058300,-1715.8155500,5217.9873000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1742.0333300,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1738.6523400,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1735.5058600,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1732.2823500,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1729.0578600,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1725.8542500,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1722.6596700,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1719.4646000,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1758.0679900,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1761.2738000,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1764.4816900,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1767.7064200,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1770.8892800,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1774.0832500,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1777.2987100,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(1812,1904.4681400,-1780.5310100,5217.9824200,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1779.0743400,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1775.7979700,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1772.6031500,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1769.4451900,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1766.2652600,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1763.0274700,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1759.8415500,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1756.6004600,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1740.5310100,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1737.1890900,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1734.0476100,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1730.8304400,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1727.6104700,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1724.4697300,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1721.2099600,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(2514,1906.4686300,-1717.9699700,5217.9873000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1756.8221400,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1760.0351600,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1763.2403600,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1766.4504400,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1769.6499000,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1772.8501000,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1776.0500500,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1779.2530500,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1782.4561800,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1741.0606700,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1737.8496100,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1734.6408700,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1731.4304200,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1728.2275400,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1725.0201400,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1721.8118900,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1718.6042500,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1896.3712200,-1715.3877000,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1757.0009800,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1760.1987300,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1763.4057600,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1766.6284200,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1769.8177500,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8177500,-1773.0269800,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1776.2351100,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1779.4392100,5219.2373000,0.0000000,0.0000000,90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1740.8912400,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1737.6812700,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1734.4605700,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1731.2605000,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1728.0505400,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1724.8404500,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1721.6368400,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(19303,1901.8182400,-1718.4254200,5219.2373000,0.0000000,0.0000000,-90.0000000);
	CreateDynamicObject(18981,1899.1074200,-1723.9069800,5221.9643600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(18981,1899.1873800,-1748.9008800,5221.9643600,0.0000000,90.0000000,0.3600000);
	CreateDynamicObject(18981,1899.3374000,-1773.8964800,5221.9643600,0.0000000,90.0000000,0.3600000);
	// lv dm
	CreateObject(19545, -1335.81409, 2439.94556, 93.05431,   0.00000, 0.00000, -90.48000);
	CreateObject(19543, -1335.74475, 2454.06543, 93.06335,   0.00000, 0.00000, -90.42001);
	CreateObject(19545, -1335.67395, 2468.66016, 93.03807,   0.00000, 0.00000, -90.48000);
	CreateObject(19543, -1335.47522, 2483.53369, 93.03035,   0.00000, 0.00000, -90.42001);
	CreateObject(19545, -1335.32898, 2497.60522, 93.08282,   0.00000, 0.00000, -90.48000);
	CreateObject(19543, -1335.23242, 2512.53418, 93.03474,   0.00000, 0.00000, -90.42001);
	CreateObject(19545, -1335.15930, 2526.93677, 92.97658,   0.00000, 0.00000, -90.48000);
	CreateObject(19543, -1335.08728, 2541.56177, 93.01205,   0.00000, 0.00000, -90.42001);
	CreateObject(19545, -1300.82178, 2449.17041, 93.10503,   0.00000, 0.00000, -180.42003);
	CreateObject(19543, -1287.52161, 2449.00879, 93.10875,   0.00000, 0.00000, -0.42001);
	CreateObject(19545, -1272.88794, 2448.86841, 93.03989,   0.00000, 0.00000, -180.42003);
	CreateObject(19543, -1266.09595, 2448.64575, 93.03609,   0.00000, 0.00000, -0.42001);
	CreateObject(19543, -1300.32886, 2510.96143, 93.12669,   0.00000, 0.00000, -0.42001);
	CreateObject(19545, -1285.72058, 2511.04126, 93.12460,   0.00000, 0.00000, -180.00000);
	CreateObject(19543, -1270.75745, 2510.88574, 93.12243,   0.00000, 0.00000, -0.42001);
	CreateObject(19545, -1265.77173, 2510.86304, 93.09244,   0.00000, 0.00000, -180.42003);
	CreateObject(19545, -1289.29712, 2541.20288, 93.10183,   0.00000, 0.00000, -90.36001);
	CreateObject(3866, -1275.26819, 2535.40088, 100.87151,   0.00000, 0.00000, -1.55999);
	CreateObject(3866, -1351.23987, 2438.34058, 100.64305,   0.00000, 0.00000, 179.76004);
	CreateObject(3571, -1314.61938, 2539.50977, 94.37326,   0.00000, 0.00000, 89.57999);
	CreateObject(3571, -1311.86133, 2543.62427, 96.96465,   0.00000, 0.00000, 178.98000);
	CreateObject(3570, -1314.55750, 2544.52759, 94.26495,   0.00000, 0.00000, 89.46002);
	CreateObject(3572, -1309.11255, 2540.85059, 94.41985,   0.00000, 0.00000, -90.96000);
	CreateObject(3572, -1306.58948, 2540.80493, 94.41985,   0.00000, 0.00000, -90.96000);
	CreateObject(3572, -1309.24146, 2532.91138, 94.41985,   0.00000, 0.00000, -90.96000);
	CreateObject(3572, -1306.69678, 2532.84790, 94.41985,   0.00000, 0.00000, -90.96000);
	CreateObject(3565, -1306.78369, 2525.10522, 94.46378,   0.00000, 0.00000, -0.12000);
	CreateObject(3565, -1306.74084, 2527.63940, 94.47618,   0.00000, 0.00000, -0.48000);
	CreateObject(3565, -1306.74634, 2525.11572, 96.47523,   0.00000, 0.00000, -0.12000);
	CreateObject(3572, -1312.04297, 2519.90625, 94.40878,   0.00000, 0.00000, -90.96000);
	CreateObject(3572, -1306.80713, 2519.95190, 94.40878,   0.00000, 0.00000, -0.30001);
	CreateObject(3571, -1309.63965, 2514.68896, 94.40530,   0.00000, 0.00000, 89.10001);
	CreateObject(3571, -1309.63965, 2514.68896, 96.98679,   0.00000, 0.00000, 89.10001);
	CreateObject(3565, -1307.27893, 2514.64673, 96.96046,   0.00000, 0.00000, 88.55997);
	CreateObject(3565, -1307.27893, 2514.64673, 94.36629,   0.00000, 0.00000, 88.55997);
	CreateObject(3571, -1306.79138, 2522.50391, 94.41064,   0.00000, 0.00000, 179.99995);
	CreateObject(3565, -1304.18604, 2514.56934, 94.37637,   0.00000, 0.00000, 88.55997);
	CreateObject(3565, -1306.31519, 2514.63110, 94.38891,   0.00000, 0.00000, 88.55997);
	CreateObject(3571, -1311.85693, 2542.80518, 96.96252,   0.00000, 0.00000, 178.98000);
	CreateObject(3572, -1317.68030, 2506.79126, 94.40878,   0.00000, 0.00000, -90.96000);
	CreateObject(3571, -1317.85999, 2494.15894, 94.37505,   0.00000, 0.00000, 88.97997);
	CreateObject(3572, -1315.35107, 2494.15039, 94.35683,   0.00000, 0.00000, -90.96000);
	CreateObject(3565, -1315.35535, 2494.10791, 96.98445,   0.00000, 0.00000, 89.09996);
	CreateObject(3565, -1312.84363, 2494.06665, 96.98445,   0.00000, 0.00000, 89.09996);
	CreateObject(3572, -1313.05090, 2494.12695, 94.35683,   0.00000, 0.00000, -90.96000);
	CreateObject(3571, -1315.18445, 2488.92090, 94.37505,   0.00000, 0.00000, 178.86005);
	CreateObject(3571, -1307.65723, 2488.75488, 94.37505,   0.00000, 0.00000, 178.86005);
	CreateObject(3571, -1307.63855, 2488.74756, 97.02114,   0.00000, 0.00000, 178.86005);
	CreateObject(3572, -1304.94214, 2493.78149, 94.40878,   0.00000, 0.00000, 90.17999);
	CreateObject(3572, -1304.99316, 2483.52148, 97.00896,   0.00000, 0.00000, 89.57999);
	CreateObject(3565, -1307.73425, 2480.78149, 94.35297,   0.00000, 0.00000, 179.34001);
	CreateObject(3570, -1307.77478, 2478.34009, 97.02271,   0.00000, 0.00000, 0.00000);
	CreateObject(3570, -1307.77478, 2478.34009, 94.34821,   0.00000, 0.00000, 0.00000);
	CreateObject(3570, -1307.78894, 2475.74927, 94.34821,   0.00000, 0.00000, 0.00000);
	CreateObject(3571, -1307.82214, 2473.22827, 94.33404,   0.00000, 0.00000, 178.86005);
	CreateObject(3571, -1299.95813, 2473.12939, 94.33404,   0.00000, 0.00000, 179.58002);
	CreateObject(3571, -1299.95813, 2473.12939, 96.92695,   0.00000, 0.00000, 179.58002);
	CreateObject(3565, -1299.93115, 2475.58887, 94.30623,   0.00000, 0.00000, 179.34001);
	CreateObject(3571, -1305.15784, 2467.95850, 96.92695,   0.00000, 0.00000, 89.46004);
	CreateObject(3565, -1307.66528, 2468.03467, 96.93475,   0.00000, 0.00000, 268.62003);
	CreateObject(3570, -1307.90112, 2470.90332, 94.34821,   0.00000, 0.00000, 0.00000);
	CreateObject(3570, -1307.91614, 2468.37183, 94.34821,   0.00000, 0.00000, 0.00000);
	CreateObject(3571, -1307.89319, 2465.83276, 94.33404,   0.00000, 0.00000, 178.86005);
	CreateObject(3572, -1307.92236, 2465.22607, 94.31898,   0.00000, 0.00000, -1.44000);
	CreateObject(3565, -1310.71362, 2455.96460, 94.32115,   0.00000, 0.00000, 269.81998);
	CreateObject(3571, -1305.24146, 2460.01758, 93.60576,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1305.29199, 2456.06152, 93.62006,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1305.29199, 2456.06152, 96.25092,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1305.24146, 2460.01758, 96.22431,   0.00000, 0.00000, 269.58029);
	CreateObject(3565, -1305.24048, 2460.11255, 98.69941,   0.00000, 0.00000, 269.51999);
	CreateObject(3565, -1305.27515, 2456.05005, 98.69941,   0.00000, 0.00000, 269.51999);
	CreateObject(3571, -1302.82678, 2459.90869, 93.60576,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1302.83777, 2456.04443, 93.62006,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1302.79150, 2459.85498, 96.22431,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1302.83459, 2456.00806, 96.22431,   0.00000, 0.00000, 269.58029);
	CreateObject(3565, -1302.82532, 2455.98291, 98.69941,   0.00000, 0.00000, 269.51999);
	CreateObject(3565, -1302.78333, 2459.88232, 98.69941,   0.00000, 0.00000, 269.51999);
	CreateObject(3571, -1300.18909, 2459.90381, 94.40408,   0.00000, 0.00000, 269.58029);
	CreateObject(3571, -1300.20032, 2456.04248, 94.40408,   0.00000, 0.00000, 269.58029);
	CreateObject(3572, -1307.85266, 2450.27026, 94.32199,   0.00000, 0.00000, -90.59998);
	CreateObject(3572, -1308.51306, 2450.23608, 94.31593,   0.00000, 0.00000, -90.59998);
	CreateObject(3572, -1302.96509, 2450.70947, 94.29411,   0.00000, 0.00000, 0.00000);
	CreateObject(3572, -1302.96423, 2448.14746, 94.29411,   0.00000, 0.00000, 0.00000);
	CreateObject(3565, -1302.95972, 2444.88672, 96.74778,   0.00000, 0.00000, 0.00000);
	CreateObject(3572, -1302.97485, 2447.46777, 94.31246,   0.00000, 0.00000, 0.00000);
	CreateObject(3571, -1302.99268, 2444.90601, 94.40408,   0.00000, 0.00000, 360.06046);
	CreateObject(3571, -1302.98010, 2442.63135, 94.40408,   0.00000, 0.00000, 360.06046);
	CreateObject(3572, -1303.00085, 2440.03613, 94.42535,   0.00000, 0.00000, 0.06001);
	CreateObject(3570, -1299.18445, 2437.61523, 94.41805,   0.00000, 0.00000, 0.00000);
	CreateObject(3570, -1299.17847, 2435.09204, 94.41805,   0.00000, 0.00000, 0.00000);
	CreateObject(3572, -1307.07642, 2437.61328, 94.42535,   0.00000, 0.00000, 0.06001);
	CreateObject(3572, -1307.07751, 2435.09375, 94.42535,   0.00000, 0.00000, 0.06001);
	CreateObject(3570, -1299.12097, 2432.57935, 94.40038,   0.00000, 0.00000, 0.00000);
	CreateObject(3570, -1299.12097, 2432.57935, 97.00125,   0.00000, 0.00000, 0.00000);
	CreateObject(3571, -1299.12903, 2430.12085, 94.40408,   0.00000, 0.00000, 360.06046);
	CreateObject(3571, -1299.12903, 2430.12085, 96.97163,   0.00000, 0.00000, 360.06046);
	CreateObject(3261, -1311.94177, 2538.53784, 93.81839,   0.00000, 0.00000, 0.00000);
	CreateObject(3261, -1311.86438, 2535.48096, 93.81839,   0.00000, 0.00000, 0.00000);
	CreateObject(3261, -1307.92810, 2538.37598, 95.69952,   0.00000, 0.00000, -1.56000);
	CreateObject(3261, -1307.92810, 2535.36938, 95.65967,   0.00000, 0.00000, -0.66000);
	CreateObject(3261, -1307.99084, 2532.33838, 95.63976,   0.00000, 0.00000, -0.66000);
	CreateObject(3261, -1308.02686, 2529.30298, 95.71945,   0.00000, 0.00000, -0.66000);
	CreateObject(3261, -1305.21130, 2523.40869, 97.86443,   0.00000, 0.00000, -0.66000);
	CreateObject(3261, -1304.95300, 2521.09473, 95.70074,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1307.96033, 2521.14551, 95.66021,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1303.02124, 2514.96753, 95.53137,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1316.10486, 2506.81006, 95.76900,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1316.25415, 2495.52246, 95.74658,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1316.30078, 2490.60498, 95.66173,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1311.72522, 2493.85303, 98.25520,   0.00000, 0.00000, 89.09998);
	CreateObject(3261, -1308.60059, 2488.93286, 95.67210,   0.00000, 0.00000, -1.44000);
	CreateObject(3261, -1308.50916, 2491.92358, 95.67210,   0.00000, 0.00000, -1.44000);
	CreateObject(3572, -1312.17102, 2494.15210, 94.35683,   0.00000, 0.00000, -90.96000);
	CreateObject(3261, -1308.44849, 2494.93750, 95.67210,   0.00000, 0.00000, -1.44000);
	CreateObject(3261, -1309.29260, 2479.76807, 98.25995,   0.00000, 0.00000, 180.11990);
	CreateObject(3261, -1299.74487, 2474.61938, 98.33898,   0.00000, 0.00000, 180.11990);
	CreateObject(3261, -1303.24915, 2448.99976, 95.47143,   0.00000, 0.00000, 269.81985);
	CreateObject(3261, -1306.27930, 2449.01392, 95.47143,   0.00000, 0.00000, 269.81985);
	CreateObject(3261, -1312.24133, 2455.40430, 95.54812,   0.00000, 0.00000, 269.81985);
	CreateObject(3261, -1301.99341, 2455.36499, 95.54812,   0.00000, 0.00000, 269.81985);
	CreateObject(3261, -1301.36389, 2446.32471, 98.04671,   0.00000, 0.00000, 180.12010);
	CreateObject(3261, -1302.75195, 2444.60327, 94.54922,   0.00000, 0.00000, 180.12010);
	CreateObject(3261, -1302.83557, 2441.61499, 94.47964,   0.00000, 0.00000, 180.12010);
	CreateObject(3261, -1299.00208, 2438.57544, 95.54860,   0.00000, 0.00000, 180.12010);
	CreateObject(3261, -1299.00342, 2435.50098, 95.54860,   0.00000, 0.00000, 180.12010);
	CreateObject(19406, -1329.98938, 2420.21899, 94.74254,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.95032, 2426.37354, 91.23223,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.92395, 2432.71313, 94.74254,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.88440, 2438.97119, 91.23223,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.82129, 2445.24146, 94.74254,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.74854, 2451.60327, 91.23223,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.67188, 2457.93140, 94.74254,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.61975, 2464.18823, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.55725, 2470.49780, 94.70523,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.48462, 2476.86938, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.44031, 2483.15137, 94.68866,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.34192, 2489.48486, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.30505, 2495.82275, 94.68866,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.28101, 2502.15161, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.26465, 2508.52124, 94.68866,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.16821, 2514.80151, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19406, -1329.12512, 2521.07520, 94.68866,   0.00000, 0.00000, -1.68000);
	CreateObject(19376, -1329.09204, 2527.39453, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19376, -1329.03186, 2543.37573, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(1491, -1329.09314, 2533.70801, 92.96272,   0.00000, 0.00000, -91.26000);
	CreateObject(1491, -1329.08301, 2533.58716, 92.96272,   0.00000, 0.00000, 87.06000);
	CreateObject(19376, -1329.03149, 2539.85669, 91.26954,   0.00000, 0.00000, 0.00000);
	CreateObject(19376, -1293.00525, 2423.70728, 91.23223,   0.00000, 0.00000, -1.02000);
	CreateObject(19406, -1292.49182, 2442.66357, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1292.60010, 2436.31592, 91.23223,   0.00000, 0.00000, -1.02000);
	CreateObject(1491, -1292.86279, 2428.43359, 93.06434,   0.00000, 0.00000, 445.67993);
	CreateObject(1491, -1292.65063, 2431.49341, 93.06434,   0.00000, 0.00000, 625.67987);
	CreateObject(19376, -1292.39185, 2448.86694, 91.23223,   0.00000, 0.00000, -1.02000);
	CreateObject(19406, -1292.30078, 2455.21143, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1292.23633, 2461.59570, 91.23223,   0.00000, 0.00000, -1.02000);
	CreateObject(19406, -1292.11304, 2467.88501, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1292.12573, 2473.86816, 91.23223,   0.00000, 0.00000, 0.18000);
	CreateObject(19406, -1292.09937, 2480.13184, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1292.17090, 2486.46460, 91.23223,   0.00000, 0.00000, 1.26000);
	CreateObject(19406, -1292.26843, 2492.76172, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1292.39624, 2499.02368, 91.23223,   0.00000, 0.00000, 1.26000);
	CreateObject(19406, -1292.49182, 2505.34814, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1292.59631, 2511.70679, 91.23223,   0.00000, 0.00000, 1.26000);
	CreateObject(19406, -1292.68054, 2518.06104, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(19376, -1293.09473, 2524.34204, 91.23223,   0.00000, 0.00000, 4.86000);
	CreateObject(19406, -1293.49915, 2530.69922, 94.74251,   0.00000, 0.00000, -0.18000);
	CreateObject(1491, -1293.48486, 2532.23242, 93.10249,   0.00000, 0.00000, 89.76000);
	CreateObject(1491, -1293.52124, 2535.25659, 93.10249,   0.00000, 0.00000, 270.11984);
	CreateObject(19376, -1293.46179, 2540.07104, 91.23223,   0.00000, 0.00000, -1.08000);
	CreateObject(19376, -1293.41406, 2543.16211, 91.25200,   0.00000, 0.00000, -1.08000);
	CreateObject(970, -1315.43494, 2515.89111, 93.46120,   0.00000, 0.00000, 0.00000);
	CreateObject(970, -1316.65491, 2515.89014, 93.46120,   0.00000, 0.00000, 0.00000);
	CreateObject(970, -1318.73279, 2513.85767, 93.46120,   0.00000, 0.00000, 88.79997);
	CreateObject(970, -1318.81091, 2509.75073, 93.46120,   0.00000, 0.00000, 88.79997);
	CreateObject(970, -1319.01685, 2500.69043, 93.46120,   0.00000, 0.00000, 88.79997);
	CreateObject(970, -1319.07275, 2496.55078, 93.46120,   0.00000, 0.00000, 89.75994);
	CreateObject(840, -1299.04163, 2498.03638, 94.49631,   0.00000, 0.00000, -160.50002);
	CreateObject(840, -1299.15967, 2538.77881, 94.49631,   0.00000, 0.00000, -164.75999);
	CreateObject(840, -1323.28687, 2541.81812, 94.49631,   0.00000, 0.00000, 4.20000);
	CreateObject(840, -1323.96619, 2500.64795, 94.49631,   0.00000, 0.00000, 4.20000);
	CreateObject(840, -1297.82153, 2424.03101, 94.49631,   0.00000, 0.00000, -177.11995);
	CreateObject(840, -1296.82617, 2460.42041, 94.45689,   0.00000, 0.00000, -177.11995);
	CreateObject(19321, -1364.37244, 2455.43823, 94.53623,   0.00000, 0.00000, 0.00000);
	CreateObject(19321, -1346.30652, 2451.68164, 94.56457,   0.00000, 0.00000, -91.08002);
	CreateObject(19321, -1279.53845, 2521.69922, 94.58904,   0.00000, 0.00000, 88.85998);
	CreateObject(19321, -1264.74500, 2523.16528, 94.58904,   0.00000, 0.00000, 179.27994);
	CreateObject(1225, -1363.88416, 2462.33911, 93.49045,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1273.28003, 2508.87598, 97.13500,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1289.87024, 2526.15283, 93.49045,   0.00000, 0.00000, 0.00000);
	CreateObject(3279, -1285.42310, 2461.57617, 92.84683,   0.00000, 0.00000, 0.48000);
	CreateObject(3279, -1340.10400, 2513.84619, 92.81009,   0.00000, 0.00000, -181.25995);
	CreateObject(18260, -1336.91809, 2531.31030, 94.50557,   0.00000, 0.00000, -73.26002);
	CreateObject(18260, -1344.57422, 2488.80103, 94.34827,   0.00000, 0.00000, -135.00002);
	CreateObject(18260, -1353.22949, 2463.05762, 94.34827,   0.00000, 0.00000, -32.70000);
	CreateObject(18260, -1275.41650, 2510.72632, 94.34827,   0.00000, 0.00000, -231.66000);
	CreateObject(18260, -1271.92090, 2477.50928, 94.34827,   0.00000, 0.00000, -285.41998);
	CreateObject(18260, -1279.02844, 2434.43896, 94.34827,   0.00000, 0.00000, -230.03999);
	CreateObject(1225, -1307.76453, 2514.96509, 98.63624,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1271.91296, 2475.18213, 97.18613,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1276.85205, 2433.01172, 97.13630,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1344.00891, 2490.94678, 97.11565,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1355.76416, 2464.07813, 97.08524,   0.00000, 0.00000, 0.00000);
	CreateObject(1225, -1303.81531, 2457.49561, 100.44165,   0.00000, 0.00000, 0.00000);
	CreateObject(762, -1316.24939, 2426.24927, 94.48556,   0.00000, 0.00000, -4.56000);
	CreateObject(762, -1352.70898, 2541.18579, 95.54475,   0.00000, 0.00000, -32.82000);
	CreateObject(762, -1268.99646, 2430.90088, 94.48853,   0.00000, 0.00000, 6.18000);
	CreateObject(693, -1298.83752, 2531.95068, 93.42791,   0.00000, 0.00000, 0.00000);
	CreateObject(693, -1322.69128, 2451.23560, 93.42791,   0.00000, 0.00000, 0.00000);
	CreateObject(673, -1359.11780, 2514.03369, 92.65952,   0.00000, 0.00000, 0.00000);
	CreateObject(673, -1333.40088, 2478.69653, 92.65952,   0.00000, 0.00000, 0.00000);
	CreateObject(673, -1359.21008, 2422.52808, 92.65952,   0.00000, 0.00000, 0.00000);
	CreateObject(673, -1267.89929, 2488.72852, 92.65952,   0.00000, 0.00000, 0.00000);
	CreateObject(673, -1286.54529, 2446.29956, 92.65952,   0.00000, 0.00000, 0.00000);
	CreateObject(673, -1299.00024, 2507.79834, 92.65952,   0.00000, 0.00000, 0.00000);
	CreateObject(19313, -1336.19165, 2548.78662, 96.17060,   0.00000, 0.00000, -0.42000);
	CreateObject(19313, -1350.21545, 2548.88135, 96.17060,   0.00000, 0.00000, -0.42000);
	CreateObject(19313, -1359.19922, 2548.89209, 96.17060,   0.00000, 0.00000, -0.42000);
	CreateObject(19313, -1365.93237, 2541.92627, 96.17060,   0.00000, 0.00000, 91.14001);
	CreateObject(19313, -1365.95264, 2527.93359, 96.17060,   0.00000, 0.00000, 88.56001);
	CreateObject(19313, -1366.11877, 2513.98340, 96.17060,   0.00000, 0.00000, 90.00001);
	CreateObject(19313, -1366.12476, 2500.02124, 96.17060,   0.00000, 0.00000, 90.00001);
	CreateObject(19313, -1366.24219, 2486.11011, 96.17060,   0.00000, 0.00000, 88.68001);
	CreateObject(19313, -1366.53198, 2472.07153, 96.17060,   0.00000, 0.00000, 88.68001);
	CreateObject(19313, -1366.69067, 2458.08862, 96.17060,   0.00000, 0.00000, 89.76000);
	CreateObject(19313, -1366.71606, 2444.14551, 96.17060,   0.00000, 0.00000, 89.76000);
	CreateObject(19313, -1366.77710, 2430.12012, 96.17060,   0.00000, 0.00000, 89.76000);
	CreateObject(19313, -1360.15051, 2420.87061, 96.17060,   0.00000, 0.00000, 161.57993);
	CreateObject(19313, -1346.42065, 2418.52075, 96.17060,   0.00000, 0.00000, 178.91995);
	CreateObject(19313, -1332.41577, 2418.39941, 96.17060,   0.00000, 0.00000, 179.99992);
	CreateObject(19313, -1318.43835, 2418.37866, 96.17060,   0.00000, 0.00000, 179.99992);
	CreateObject(19313, -1304.41650, 2418.28491, 96.17060,   0.00000, 0.00000, 178.55994);
	CreateObject(19313, -1290.43506, 2418.03125, 96.17060,   0.00000, 0.00000, 179.39986);
	CreateObject(19313, -1276.45776, 2417.89893, 96.17060,   0.00000, 0.00000, 179.39986);
	CreateObject(19313, -1266.04675, 2417.78540, 96.17060,   0.00000, 0.00000, 179.39986);
	CreateObject(19313, -1259.09387, 2424.72583, 96.17060,   0.00000, 0.00000, 269.87979);
	CreateObject(19313, -1259.04639, 2438.67749, 96.17060,   0.00000, 0.00000, 269.87979);
	CreateObject(19313, -1259.00696, 2452.73071, 96.17060,   0.00000, 0.00000, 269.87979);
	CreateObject(19313, -1258.95776, 2466.74878, 96.17060,   0.00000, 0.00000, 269.87979);
	CreateObject(19313, -1258.92859, 2480.75098, 96.17060,   0.00000, 0.00000, 269.87979);
	CreateObject(19313, -1258.80652, 2494.66821, 96.17060,   0.00000, 0.00000, 269.51981);
	CreateObject(19313, -1258.72949, 2508.67261, 96.17060,   0.00000, 0.00000, 269.51981);
	CreateObject(19313, -1258.62146, 2522.64624, 96.17060,   0.00000, 0.00000, 269.51981);
	CreateObject(19313, -1258.52026, 2536.63135, 96.17060,   0.00000, 0.00000, 269.51981);
	CreateObject(19313, -1258.51807, 2541.38330, 96.17060,   0.00000, 0.00000, 269.51981);
	CreateObject(19313, -1265.44592, 2548.35376, 96.17060,   0.00000, 0.00000, 359.93970);
	CreateObject(19313, -1279.45935, 2548.37720, 96.17060,   0.00000, 0.00000, 359.93970);
	CreateObject(19313, -1293.43396, 2548.41992, 96.17060,   0.00000, 0.00000, 359.93970);
	CreateObject(19313, -1307.43408, 2548.56616, 96.17060,   0.00000, 0.00000, 358.43976);
	CreateObject(19313, -1321.43091, 2548.76514, 96.17060,   0.00000, 0.00000, 359.51971);
	CreateObject(16112, -1354.95374, 2538.86743, 79.64680,   0.00000, 0.00000, 0.00000);
	CreateObject(16112, -1356.01257, 2516.29321, 80.43873,   0.00000, 0.00000, 0.00000);
	CreateObject(16112, -1355.37842, 2499.64307, 80.43873,   0.00000, 0.00000, 0.00000);
	CreateObject(16112, -1357.07898, 2476.28955, 80.55650,   0.00000, 0.00000, 0.00000);
	CreateObject(16112, -1363.88550, 2448.02637, 80.53825,   0.00000, 0.00000, 0.00000);
	CreateObject(16112, -1365.47534, 2431.71167, 80.53825,   0.00000, 0.00000, 0.00000);
	CreateObject(16112, -1359.48596, 2417.57983, 81.33454,   0.00000, 0.00000, -4.62000);
	CreateObject(16112, -1352.03027, 2415.90430, 81.33454,   0.00000, 0.00000, 4.68000);
	CreateObject(16112, -1338.57446, 2415.50391, 81.33454,   0.00000, 0.00000, 14.16000);
	CreateObject(16112, -1323.70471, 2414.24927, 81.61378,   0.00000, 0.00000, 8.64000);
	CreateObject(16112, -1299.16797, 2421.11890, 80.69973,   -1.86000, -6.96000, 24.42000);
	CreateObject(16112, -1273.88513, 2429.45581, 80.61716,   -1.86000, -6.96000, 24.42000);
	CreateObject(16112, -1251.03748, 2430.47681, 82.49886,   -1.86000, -6.96000, -6.48000);
	CreateObject(16112, -1250.83081, 2446.23438, 82.88873,   -1.86000, -6.96000, -6.48000);
	CreateObject(16112, -1256.33777, 2449.94238, 81.08793,   -1.86000, -6.96000, 128.39998);
	CreateObject(16112, -1269.11584, 2486.19775, 80.65921,   -1.86000, -6.96000, 128.39998);
	CreateObject(16112, -1270.28333, 2509.01660, 80.76313,   -1.86000, -6.96000, 128.39998);
	CreateObject(16112, -1261.02124, 2527.24268, 80.76313,   -1.86000, -6.96000, 128.39998);
	CreateObject(16112, -1258.06519, 2546.52026, 80.76313,   -1.86000, -6.96000, 185.28000);
	CreateObject(16112, -1287.62805, 2542.61670, 80.76313,   -1.86000, -6.96000, 185.28000);
	CreateObject(16112, -1322.93982, 2539.92798, 80.65164,   -1.86000, -6.96000, 185.28000);
	CreateObject(16112, -1331.01990, 2535.52856, 80.65164,   -1.86000, -6.96000, 185.28000);
	CreateObject(898, -1361.20215, 2523.66260, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1360.52319, 2531.90723, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1360.91211, 2536.93359, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1360.73926, 2539.73975, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1359.69055, 2544.84229, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1353.65601, 2548.36328, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1345.26111, 2547.81714, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1335.66211, 2548.78589, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1327.97607, 2549.14111, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1322.00549, 2548.68994, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1314.81763, 2546.96436, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1304.46814, 2547.55957, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1295.54248, 2548.33813, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1288.59131, 2548.35986, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1281.46423, 2548.29907, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1273.67212, 2548.21875, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1266.50085, 2548.31641, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1260.38135, 2548.31470, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1258.97559, 2541.81689, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1258.93738, 2534.33838, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1259.26099, 2528.18335, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1259.68176, 2521.79297, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1259.95886, 2512.41821, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1260.22546, 2503.34644, 86.26307,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1259.32764, 2494.32422, 86.26307,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1260.33777, 2486.76172, 86.26307,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1261.38403, 2477.28638, 86.14327,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1260.78186, 2468.27466, 86.14327,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1260.29053, 2460.01782, 86.14327,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1260.06287, 2455.10083, 86.14327,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1258.34009, 2436.17090, 86.14327,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1361.26062, 2517.79102, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1361.66333, 2512.42065, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1361.57849, 2504.08618, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1361.10400, 2498.30029, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1362.01257, 2490.22974, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1362.28479, 2484.57935, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1363.13513, 2479.05908, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1363.49451, 2473.79785, 86.11781,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1364.10876, 2468.41089, 86.11781,   2.76000, 78.84002, 0.00000); // bug fix v.0.1 by rodeiun.
	CreateObject(898, -1364.68298, 2458.83472, 86.21302,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1367.75391, 2451.62622, 86.27760,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1367.59607, 2447.38379, 86.31756,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1367.45227, 2441.97266, 86.19770,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1368.33386, 2435.35571, 86.27761,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1367.98035, 2430.35229, 86.31755,   2.76000, 78.84002, 0.00000);
	CreateObject(898, -1333.43945, 2416.16846, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1303.84448, 2417.22266, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1298.10034, 2417.98999, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1293.11292, 2419.01294, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1288.57214, 2419.14673, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1283.90845, 2420.23096, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1277.00220, 2421.98999, 86.23338,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1271.43274, 2421.98340, 86.18891,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1264.56494, 2422.39722, 86.18891,   2.76000, 78.84002, -10.20000);
	CreateObject(898, -1257.07983, 2422.09473, 86.18891,   2.76000, 78.84002, -10.20000);
	return 1;
}
