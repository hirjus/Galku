# Galku

Ensimmäiset Rmarkdown - dokumentit. Vain Rmd- ja nb.html-tiedostot.

# 11.4.2018

Luonnos ensimmäiseksi luvuksi (alkuosaa), indexG1.PDF ja indexG1.html.

# 25.4.2018

Uudet versiot, html-tiedosto on mukavampi lukea, sillä koodi on oletuksena piilotettu.

# Siistitään Galku capaper-projektiin

Koodia on helpompi ja turvallisempaa muokkailla täällä ja siirtää vasta sitten capaper- projektiin. Ainakin aluksi, bookdown ei ole ihan helppo ympäristö, jos haluaa vain testailla r-koodia.

**4.8.2018**

kaavat1.Rmd - lisättiin muutama matriisiyhtälö. Drawmatrix-pakettia (LaTeX) ei ole vielä kokeilu bookdown-ympäristössä.

**6.8.2018**

Drawmatrix ei toiminut. Palataan asiaan, jos on tarve. Tägätään **versioksi 1**,
ja tehdään dev-haara siistimistä varten.

**6.8.2019**

Järjestellään tekstipätkiä.

**7.8.2018**

Lisättiin gitignore-tiedosto.

Data-osuus editoitu, **versio 1.02**.

**10.8.2018** hieman lisää korjailuja data-osuuteen, **versio 1.03**. Editoitiin lukuun 3 asti, **versio 1.04**.


**4.9.2018 versio 1.1** Viimeisimmät korjailut ja hieman poistoja. Historia jää näkyviin. Kaikkia yksinkertaisen CA:n kuvia ja taulukoita ei muutettu "bookdown-muotoon". Lisättiin 5.9. html-tulosteen indexG1.html lisäksi indexG1.pdf, vanhat versiot ark-hakemistossa.

**19.9.2018** Versio 1.2 työn alla.
Kokeillaan Githubin windows-klientillä dev-haaran päivitystä ("update from default branch" pudotusvalikosta).

18.9.2018: riviprofiilikuva, pari uutta karttaa (Saksan ja Belgian jako).
19.9.2018: Lisättiin uusi versio jäsennyksestä
 (ca_jasennysJH190918.pdf), ja galku-tuloste indexG1.pdf.

19.9.2018 Korvattu mutkikas if-lause case_when-lauseella, ikä-sukupuoli-vuorovaikutusmuuttuja, ikä-sukupuoli-maa - muuuttuja. Kaksi karttaa lisätty. Kartoista myös pdf-versiot Galku-img - hakemistoon.

**20.9.2018** Jätetään pinotut ja liitetyt taulut seuraavaan versioon. Laajempi data kannattaa ottaa käyttöön tässä, johdattelee MCA-teemoihin. Tägätään **versio 1.2**.

**25.9.2018** Jätetään SPSS-tiedoston puuttuvien vastausten tarkempi koodaus (haven-paketin read_spps-funktion user_na = TRUE - parametri) pois. Perustelu: tätä ei aiota tarkemmin analysoida. Maiden välillä on näissä puuttuvien tietojen tarkemmassa koodauksessa myös usein eroja. Muutettiin vastausvaihtoehtojen labelit (S,s,?, e, E). Siistittiin koodia datan alkukäsittelyssä. Pudotetaan Espanja pois isommasta datasta, mutta pidetään toistaiseksi Unkari.

**26.9.2018** Jatkettiin siivoilua, yksi rmd-tiedosto lisää viimeiseksi osaksi. R-datan eri analyyseissä käytettäviä tiedostoja muutama lisää r-koodiin. Tarpeetonta koodia (esim. ikä-sp - vuorovaikutusmuuttujan erilaiset luontiskriptit) pois.

**1.10.2018 Versio 1.3**, ikä-sukupuoli-maa - luokittelumuuttuja ja maakeskiarvot täydentävinä pisteinä. Kuvien yksityiskohdissa on vielä korjailtavaa (labeleiden etäisyys pisteistä jne.). Tägätään versio 1.2 -> 1.3.

**3.10.2018** Siistitään versio 1.3 versioksi 1.4. Datan rajaaminen ja käsittely R-koodissa, tiedostojen nimeäminen, maiden ja muuttujien valinnat (kaksi aineistoa, iso ja pieni). Poistetaan turhia ja pitkiä muuttuja- yms. listauksia.

**9.10.2018** Datan ja muuttujien valinta tehty. Espanja ja Iso-Britannia pois isosta aineistosta, briteiltä puuttuu tieto TOPBOT (oma arvio asemasta yhteiskunnan hierarkiassa) ja haluan aineistoon yhden sosioekonomisen muuttujan. Espanjan vastausvaihtoehdot poikkeavat substanssikysymyksissä.

**10.10.2018** Myös USA pois, koska TOPBOT-muuttuja puuttuu. Data-luvussa taulukoitu kaikki 15 muuttujaa maittain, puuttuneisuuden arvioimiseksi. Nämä taulukot siirretään siihen lukuu, jossa aineistoa laajennettaan. Tarkistettu yksinkertaisen esimerkin koodi, faktoroinneissa luodaan aina uusi muuttuja. Vanhaan jäävät metatiedot talteen. Versio 1.4 alkaa olla valmis.

**11.10.2018 Versio 1.4**

**11.10.2018 Aloitetaan dev-haarassa versio 1.5** . Siistitään tekstiä, siirretään laajemman aineiston puuttuvien havaintojen kuvailu sinne missä data otetaan käyttöön.

**11.10.2018** Kysymyksiä taulukoina ja kyselylomakkeen kuva. Laajemman muuttujajoukon koodia ei vielä siirrettu "pinotut taulut" - jaksoon.

**13.10.2018** Kaksi substanssimuuttujaa (V12, V13) mukaan, muuttujataulukoiden hiomista, tekstin ja koodin siistimistä.

**5.12.2018 Versio 1.5** masteriin, ja uusi dev-haara. Muokataan versioksi 1.5.1

**27.12.2018** Aloitetaan versio 1.5.1 .

**23.3.2019** Pieniä lisäyksiä ja korjauksia (kaava-dokkari, jotain muita). Pikku editointeja datan valintaan.
**23.3.2019** Johdattelevan esimerkin data, testaillaan faktorointia.

**25.5.2019 Versio 1.5.1** masteriin ja dev-haaraan uusi versio 1.5.2. Paljon pieniä muutoksia, ei suurempia.

**5.6.2019** Aloitetaan dev-haarassa versio 1.5.2 ( ei vielä tägätty)

**7.6.2019** Koko aineiston puuttuneisuuden taulukointikokeiluja

**30.1.2020** Aloitettiin siistiminen ja editointi. **Versio 1.5.2**, treeni2-projekin
datan luku, uusien muuttujien (R-faktorit) luonti ja muunnokset toimivat.

**31.1.2020 Versio 1.5.3** Uudet faktoroinnit ja datan luontiskriptit toimivat.
Johdatteleva esimerkki G1_2_johdesim.Rmd toimii ensimmäiseen CA-karttaan asti.
HTML-tulostus toimii vain G1_1_data2.Rmd - tiedostolla (knit to html). Muut kolme
voi ajaa RStudion Run all - komennolla.

**1.2.2020 Versio 1.5.4** html-tulostus (knit to html RStudiossa) toimii, neljä
ensimmäistä Rmd-tiedostoa ajetaan indexG1.html - tiedostoksi. Muut Rmd-tiedostot
on disaploitu index.Rmd - tiedostossa.

**Versio 1.5.5** - G1_3_tulk1.Rmd toimii, html-tiedosto syntyy. CA-kuvat kääntyvät
x-akselin ympäri (180 astetta), ja profiikuvissa maiden tunnukset ovat selvästi
väärin. Uudessa datassa maa-faktorin järjestys on muuttunut, ja kuvat tehdään
"käsityönä" CA-tulosobjenktin (SimpleCA1) tiedoista. Pieleen menee!

Testattu, järjestys pitää muuttaa maa-faktorilla samaksi kuin alkuperäisellä
C_ALPHAN - muuttujalla. Tämä korjaa pulmat, havainnollistettu testiaineistolla,
ei vielä korjattu.

**4.2.2020 Versio 1.5.6** Galkun html- ja pdf-tulostus toimivat. Editoidaan
hieman siistimmäksi, mutta ei turhaan hiota. Poistetaan tarpeetonta tekstiä,
vanha koodi voi jäädä.

**6.2.2020** Kommentoitu pois osa tarkistustaulukoista.

**24.2.2020 Versio 1.5.7** Pieniä ja isompia korjailuja, siistimistä ja vanhan
koodin (koodilohkojen) asetuksia passiivisiksi (eval=FALSE, include=FALSE).

**30.3.2020** Asetettiin karttatulostuksen koodilohkoissa fig.asp=1 ja
out.width=90%. Koodilohkon fig.cap tekee kuvasta "kelluvan", voi tulla pulmia
plot-komennon kuvatekstien kanssa. Tätä hiotaan myöhemmin.
Poistettiin tulosteesta testikuvia (C_ALPHAN - merkkijonomuuttujan faktoroinnin
sivuvaikutukset, kun järjestys muuttu). Esimerkit ovat koodissa tallessa.

**8.4.2020** Pientä editointia. Lisäsin ISSP-dokumentteihin dokkarin lomakkeen
laadinnasta. Vakiomassa - ca:n kokeiluja, mikä kelpaa ca-funktiolle dataksi.

**9.4.2020** CAcalc_1.R - laskentaa ca-tuloksilla.

**3.5.2020** Karttojen parantelua, editointia. Muutamia kommentteja tekstiin.

**4.5.2020** Karttojen parantelua, pistekoon säätämistä (par(cex=)), diagnosiikkaa
ikä-sukupuoli-maa - ca-tuloksilla (laatu, massa ja kontribuutiot).

**28.5.2020** Editointia, kuvien säätämistä.

**8.6.2020** Testattu alustavasti toiminta dplyr 1.0.0 - versiolla, näyttäisi toimivan.
CAcalc_1.R - skriptissä janoja kartan pisteiden välille.

**11.6.2020** Kuvien parantelua, maaga-kuvat pdf-tiedostoina ja koodi CAcalc_1.R-
skriptissä. Hieman tekstiä johdattelevan esimerkin asymmetriseen kuvaan.

**14.6.2020** Maa-sukupuoli-ikä - karttojen kehittelyä.

**12.8.2020** Siistittiin tekstiä. Testattiin ca-paketin caconv- ja cacoord-funktioita.
Hiottiin maaga-kuvia valmiiksi (CAcalc_1.R).

**5.9.2020** Pientä editointia, lisättiin riviprofiili-ca:n ja perus-ca:n
khii2-etäisyyksien ja massojen vertailuja.

**6.9.2020** Versio 1.5.8 - kevään ja kesän muutokset.

**7.9.2020** Uusi R-skripti Subset_ca1.R, kehitelty osajoukko-CA:n kuvia
G1_4_CAlaaj1.Rmd - skriptin maa-sukupuoli-ikäluokka - muuttujan kartoille.

**8.9.2020** Subset_ca1.R: lisää subsetca - karttoja eri optioilla. Asymmetrinen
"rowgreen" näyttäisi toimivan parhaiten.

**9.9.2020** Jatkettiin subsetca- kuvine ja BaseR-plot - funktion avulla
"zoomattujen" kuvien kehitttelyä. Pilkotaan liian pitkät Rmd-tiedostot pienemmiksi,
ensimmäisenä G1_4_CAlaaj1.Rmd, loppuosa on nyt G1_4_CAlaaj2.Rmd ja subset CA on
G1_4_CAlaaj1.Rmd.
