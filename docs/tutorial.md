# Vysvětlení jak to funguje
## index.html
- stránka s jedním velkým ```<div>```, který se chová jako grid
- v tomto ```<div>``` je několikrát zopakovaný prvek se samotným obrázkem k zobrazení
- používáme tag ```<picture>```, aby bylo možné vybrat odpovídající velikost obrázku podle velikosti obrazovky. Díky tomuto koncový uživatel ušetří velký datový přenos při načítání většího množství obrázků
- popsáno tady:
```html=
<figure class="gallery-item"> <!--figure used to group image and caption-->
    <picture> <!--tag allowing us to specify multiple image size variants-->
        <source media="(max-width:480px)" srcset="img/480/1.webp"> <!--show this image if screen size is up to 480px-->
        <source media="(max-width:960px)" srcset="img/960/1.webp"> <!--show this image if screen size is up to 960px-->
        <img src="img/1920/1.webp" alt="Autíčko"> <!--default image; will be loaded if none of conditions above are true => in this example if screen width > 960px-->
    </picture>
    <figcaption>
    Škoda Forman ve Special linu <!--just some text bellow the image-->
    </figcaption>
</figure>
```
### Srovnání obrázkových formátů
#### WEBP
- výhody:
    - zabírá méně úložiště
    - z toho plyne rychlejší načtení
    - alpha kanál
- nevýhody:
    - procesorově náročnější dekódování
    - nepodporováno u starších prohlížečů
#### PNG
- výhody:
    - nejmenší velikost souborů obrázků s malým počtem barev - např. text
    - alpha kanál
- nevýhody:
    - u barevně rozmanitých fotek největší velikost souborů
#### JPEG
- výhody:
    - menší velikost než png u hodně barevných fotek
- nevýhody:
    - nemá alpha kanál
    - ztrátová komprese - obrázek ztráci kvalitu
## css/main.css
- používám grid a media query
- media query aplikuje pravidla uvnitř něj pokud platí podmínka
- popsáno tady:
```css=
.gallery {
    display: grid; /* set main container as grid */
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); /* set how grid's columns will look like */
    /* repeat(y, something) writes "something" "y" times */
    /* grid-template-columns: repeat(4, 1fr); is same as grid-template-columns: 1fr 1fr 1fr 1fr; (this means "grid has 4 columns, each column has a size of one fraction - 25%")*/
    /* grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));  make as many columns as possible if their size is between 400px to 1fr; they will be equally wide */
    gap: 1em; /* space between elements */
}

@media(min-width: 2050px) { /* use rules inside this media query if the condition is true (screen width > 2050px)*/
    .gallery { /* arrange items only into 4 columns */
        grid-template-columns: repeat(4, minmax(400px, 1fr)); 
    }
}
```