import { css } from "./WDevCore/WModules/WStyledRender.js";

const OnLoad = async () => {    
    Main.append("hola mundo");
}
const cssCus = css`
    .dep-container{
        display: grid;
        grid-template-columns: 30% 30% 30%;
        gap: 20px;
        padding: 20px;
    }
    .card {
        padding: 20px;
        background-color: #0e8bd9;
        display: grid;
        grid-template-rows: 40px 20px 70px;
        color: #fff;
        border-radius: 15px;
    }
    .card h1 {
        font-size: 24px;
        margin: 5px 0px;
    }
    .cont-mini-cards {
        width: 100%;
        display: flex;
        gap: 5px;
    }
    .mini-card {
        padding: 8px;
        background-color: #fff;
        font-size: 11px;
        border-radius: 10px;
        color: #444;
        margin: 10px 0px;
        display: flex;
        flex-wrap: wrap;
        height: 21px;
        align-items: center;
        gap:5px;
    }
    .mini-card img{ 
        height: 20px;
        width: 20px;
        object-fit: contain;
    }
    @media (max-width: 1300px){
        .dep-container{
            display: grid;
            grid-template-columns: 50% 50%;
            gap: 20px;
            padding: 20px;            
        }
        .cont-mini-cards {
            flex-direction: column;
        }
        .mini-card {
            padding: 8px;
            color: #444;
            margin: 10px 0px 0px 0px;
            height: 21px;
        }
        .card {
            padding: 20px;
            background-color: #0e8bd9;
            display: grid;
            grid-template-rows: 40px 20px auto;
            color: #fff;
            border-radius: 15px;
        }
    }
    @media (max-width: 800px){
        .dep-container{
            display: grid;
            grid-template-columns: 100%;
            gap: 20px;
            padding: 20px;
        }

    }
`
window.onload = OnLoad;