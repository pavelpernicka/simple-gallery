# Picture vs Img
## figure > picture
- obrázek vybrán pomocí definovaných break-pointů
- využíváno, pokud je potřeba AD (Art-Direction) = specifické ořezy obrázku (na počítači celý člověk, na mobilu jen xicht)
- tady by automatický výběr dělal nepořádek - layout stránky by byl podle breakpointu v CSS, obrázek by prohlížeč vybral automaticky třeba jiný
```html=
<picture>
  <source media="(max-width:480px)" srcset="img/480/1.webp">
  <source media="(max-width:960px)" srcset="img/960/1.webp">
  <img src="img/1920/1.webp" alt="Autíčko"><
</picture>
```
                
## figure > img se srcset atributem
```html=
<img src="medium_1024.png"
  srcset="
    small_600.png 600w, 
    medium_1024.png 1024w, 
    large_1600.png 1600w"
  width="200" height="200" alt="…">
```
- XXXw = šířka obrázku (ne obrazovky!)
- prohlížeč sám vybírá nejlepší variantu
- když zmenšujeme okno, nenačítá průběžně menší varianty

### Přidání atributu sizes (kejkle navíc, v galerii netřeba)

```html=
<img src="goat.jpg"
    srcset="
        goat.jpg 800w, 
        goat-1200.jpg 1200w, 
        goat-1800.jpg 1800w" 
    sizes="
           (max-width: 500px) 100vw, 
           (max-width: 700px) 96vw, 60vw" 
    alt="A goat climbing a mountain">
```
- pro (max-width: 500px) nastaví specifickou šířku obrázku

### danuv hraci koutek
- názorná ukázka: https://mdn.github.io/learning-area/html/multimedia-and-embedding/responsive-images/responsive.html
