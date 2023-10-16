import { css } from "./WDevCore/WModules/WStyledRender.js";

const data =   [
    { name: "imagen1", imagen: "./Media/Image/avatar.png"},
    { name: "imagen1", imagen: "./Media/Image/avatar.png"},
    { name: "imagen1", imagen: "./Media/Image/avatar.png"},
]
const OnLoad = async () => {    
    //Main.append("hola mundo");
    Main.innerHTML = data.map(x => `<img src="${x.imagen}">`).join("");
}
window.onload = OnLoad;