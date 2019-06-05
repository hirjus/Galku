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

Drawmatrix ei toiminut. Palataan asiaan, jos on tarve. Tägätään versioksi 1, ja tehdään dev-haara siistimistä varten.

**6.8.2019**

Järjestellään tekstipätkiä.

**7.8.2018**

Lisättiin gitignore-tiedosto.

Data-osuus editoitu, versio 1.02.

**10.8.2018** hieman lisää korjailuja data-osuuteen, versio 1.03. Editoitiin lukuun 3 asti, versio 1.04.


**4.9.2018** versio 1.1, viimeisimmät korjailut ja hieman poistoja. Historia jää näkyviin. Kaikkia yksinkertaisen CA:n kuvia ja taulukoita ei muutettu "bookdown-muotoon". Lisättiin 5.9. html-tulosteen indexG1.html lisäksi indexG1.pdf, vanhat versiot ark-hakemistossa.

**19.9.2018** Versio 1.2 työn alla
Kokeillaan Githubin windows-klientillä dev-haaran päivitystä ("update from default branch" pudotusvalikosta).

18.9.2018: riviprofiilikuva, pari uutta karttaa (Saksan ja Belgian jako).
19.9.2018: Lisättiin uusi versio jäsennyksestä
 (ca_jasennysJH190918.pdf), ja galku-tuloste indexG1.pdf.

19.9.2018 Korvattu mutkikas if-lause case_when-lauseella, ikä-sukupuoli-vuorovaikutusmuuttuja, ikä-sukupuoli-maa - muuuttuja. Kaksi karttaa lisätty. Kartoista myös pdf-versiot Galku-img - hakemistoon.

**20.9.2018** Jätetään pinotut ja liitetyt taulut seuraavaan versioon. Laajempi data kannattaa ottaa käyttöön tässä, johdattelee MCA-teemoihin. Tägätään versio 1.2.

**25.9.2018** Jätetään SPSS-tiedoston puuttuvien vastausten tarkempi koodaus (haven-paketin read_spps-funktion user_na = TRUE - parametri) pois. Perustelu: tätä ei aiota tarkemmin analysoida. Maiden välillä on näissä puuttuvien tietojen tarkemmassa koodauksessa myös usein eroja. Muutettiin vastausvaihtoehtojen labelit (S,s,?, e, E). Siistittiin koodia datan alkukäsittelyssä. Pudotetaan Espanja pois isommasta datasta, mutta pidetään toistaiseksi Unkari.

**26.9.2018** Jatkettiin siivoilua, yksi rmd-tiedosto lisää viimeiseksi osaksi. R-datan eri analyyseissä käytettäviä tiedostoja muutama lisää r-koodiin. Tarpeetonta koodia (esim. ikä-sp - vuorovaikutusmuuttujan erilaiset luontiskriptit) pois.

**1.10.2018** Versio 1.3, ikä-sukupuoli-maa - luokittelumuuttuja ja maakeskiarvot täydentävinä pisteinä. Kuvien yksityiskohdissa on vielä korjailtavaa (labeleiden etäisyys pisteistä jne.). Tägätään versio 1.2 -> 1.3.

**3.10.2018** Siistitään versio 1.3 versioksi 1.4. Datan rajaaminen ja käsittely R-koodissa, tiedostojen nimeäminen, maiden ja muuttujien valinnat (kaksi aineistoa, iso ja pieni). Poistetaan turhia ja pitkiä muuttuja- yms. listauksia.

**9.10.2018** Datan ja muuttujien valinta tehty. Espanja ja Iso-Britannia pois isosta aineistosta, briteiltä puuttuu tieto TOPBOT (oma arvio asemasta yhteiskunnan hierarkiassa) ja haluan aineistoon yhden sosioekonomisen muuttujan. Espanjan vastausvaihtoehdot poikkeavat substanssikysymyksissä.

**10.10.2018** Myös USA pois, koska TOPBOT-muuttuja puuttuu. Data-luvussa taulukoitu kaikki 15 muuttujaa maittain, puuttuneisuuden arvioimiseksi. Nämä taulukot siirretään siihen lukuu, jossa aineistoa laajennettaan. Tarkistettu yksinkertaisen esimerkin koodi, faktoroinneissa luodaan aina uusi muuttuja. Vanhaan jäävät metatiedot talteen. Versio 1.4 alkaa olla valmis.

**11.10.2018** Versio 1.4

**11.10.2018** Aloitetaan dev-haarassa versio 1.5. Siistitään tekstiä, siirretään laajemman aineiston puuttuvien havaintojen kuvailu sinne missä data otetaan käyttöön.

**11.10.2018** Kysymyksiä taulukoina ja kyselylomakkeen kuva. Laajemman muuttujajoukon koodia ei vielä siirrettu "pinotut taulut" - jaksoon.

**13.10.2018** Kaksi substanssimuuttujaa (V12, V13) mukaan, muuttujataulukoiden hiomista, tekstin ja koodin siistimistä.

**5.12.2018** Versio 1.5 masteriin, ja uusi dev-haara. Muokataan versioksi 1.51

**27.12.2018** Versio 1.5.1

**23.3.2019** Pieniä lisäyksiä ja korjauksia (kaava-dokkari, jotain muita). Pikku editointeja datan valintaan.
**23.3.2019** Johdattelevan esimerkin data, testaillaan faktorointia.

**25.5.2019** Versio 1.5.1 masteriin ja dev-haaraan uusi versio 1.5.2. Paljon pieniä muutoksia, ei suurempia.

**5.6.2019** Aloitetaan dev-haarassa versio 1.5.2
