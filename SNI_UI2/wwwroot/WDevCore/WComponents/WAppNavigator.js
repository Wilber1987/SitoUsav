import { WRender } from "../WModules/WComponentsTools.js";
import { WIcons } from "../WModules/WIcons.js";
import { WCssClass } from "../WModules/WStyledRender.js";


/**
 * @typedef {Object} NavConfig 
 *  * @property {Boolean} [Inicialize] 
    * @property {String} [alignItems] flex-end
    * @property {String} [DisplayMode] right
    * @property {Array} [Elements]
    * @property {Boolean} [DarkMode]
    * @property {String} [Direction] row | column
    * @property {String} [NavStyle] nav | tab
**/
class WAppNavigator extends HTMLElement {
    /**
     * 
     * @param {NavConfig} Config 
     */
    constructor(Config) {
        super();
        this.attachShadow({ mode: "open" });
        this.Config = Config;
        for (const p in Config) {
            this[p] = Config[p];
        }
        this.DrawAppNavigator();
        this.Elements = this.Elements ?? [];
    }
    attributeChangedCallBack() {
        this.DrawAppNavigator();
    }
    connectedCallback() {
        if (this.Inicialize == true && this.InitialNav != undefined) {
            this.InitialNav();
        }
    }
    ActiveMenu = (ev) => {
        var navs = this.parentNode.querySelectorAll("w-app-navigator");
        navs.forEach(nav => {
            nav.shadowRoot.querySelectorAll(".elementNavActive").forEach(elementNavActive => {
                elementNavActive.className = "elementNav";
            });
        });
        if (ev) {
            ev.className = "elementNavActive";
            if (this.NavStyle != "tab") {
                this.shadowRoot.querySelector("#MainNav").className = "navInactive";
            }
        }
    }
    DrawAppNavigator() {
        this.shadowRoot.innerHTML = "";
        if (this.id == undefined) {
            const Rand = Math.random();
            this.id = "Menu" + Rand;
        }

        this.DarkMode = this.DarkMode ?? false;
        this.DisplayMode = this.DisplayMode ?? "left";
        this.shadowRoot.append(WRender.createElement(this.Style()));
        if (this.NavStyle == undefined) {
            this.NavStyle = "nav";
        }
        if (this.NavStyle == "nav") {
            const header = {
                type: "header", props: {
                    onclick: () => {
                        const nav = this.shadowRoot.querySelector("#MainNav");
                        if (nav.className == "navActive") {
                            nav.className = "navInactive";
                        } else {
                            nav.className = "navActive";
                        }
                    }
                }, children: [{
                    type: "img", props: {
                        src: WIcons.Menu,
                        class: "DisplayBtn",
                    }
                }]
            }
            if (typeof this.NavTitle === "string") {
                header.children.push({
                    type: "label", props: { class: "NavTitle", innerText: this.NavTitle }
                });
            }
            this.shadowRoot.appendChild(WRender.createElement(header));
        }
        const Nav = { type: "nav", props: { id: "MainNav", className: this.NavStyle }, children: [] };
        this.Elements.forEach((element, Index) => {
            const elementNav = WRender.createElement({
                type: "a",
                props: { id: "element" + (element.id ?? Index), class: "elementNav" }
            });

            elementNav.append(element.name)
            if (element.icon) {
                elementNav.append(WRender.createElement({
                    type: 'img', props: {
                        src: element.icon, class: 'IconNav'
                    }
                }));
            }
            if (element.url != undefined && element.url != "#") {
                elementNav.href = element.url
            }

            Nav.children.push(elementNav);
            if (element.SubNav != undefined) {
                this.AddSubNav(Index, element, elementNav, Nav);
            } else {
                if (elementNav.url == undefined) {
                    elementNav.url = "#" + this.id;
                }
                elementNav.onclick = async (ev) => {
                    this.ActiveMenu(elementNav);
                    if (element.action != undefined) {
                        element.action();
                    }
                }
            }
            if (Index == 0 && element.SubNav == undefined) {
                this.InitialNav = () => {
                    elementNav.onclick();
                }
            }
        });
        this.shadowRoot.append(WRender.createElement(Nav));
    }
    AddSubNav(Index, element, elementNav, Nav) {
        const SubMenuId = "SubMenu" + Index + this.id;
        const SubNav = WRender.Create({
            tagName: "section",
            id: SubMenuId, href: element.url, className: "UnDisplayMenu"
        });
        if (element.SubNav.Elements != undefined) {
            element.SubNav.Elements.forEach(SubElement => {
                SubNav.append(WRender.Create({
                    tagName: "a",
                    innerText: SubElement.name,
                    onclick: async (ev) => {
                        if (SubElement.action != undefined) {
                            SubElement.action(ev);
                        }
                    }

                }));
            });
            elementNav.onclick = (ev) => {
                this.ActiveMenu(ev);
                const MenuSelected = this.shadowRoot.querySelector("#" + SubMenuId);
                if (MenuSelected.className.includes("UnDisplayMenu")) {
                    //console.log(this.NavStyle == "tab", this.NavStyle == "tab" ? "DisplayMenu tabSubMenu" : "DisplayMenu");
                    MenuSelected.className = this.Direction != "column" ? "DisplayMenu AbsoluteDisplay" : "DisplayMenu";
                } else {
                    MenuSelected.className = this.Direction != "column" ? "UnDisplayMenu AbsoluteDisplay" : "UnDisplayMenu";
                }
            };
            Nav.children.push(SubNav);
        }
    }

    Style() {
        const style = this.querySelector("#NavStyle" + this.id);
        if (style) {
            style.parentNode.removeChild(style);
        }
        let navDirection = "row";
        if (this.Direction == "column") {
            navDirection = "column";
        }
        const Style = {
            type: "w-style",
            props: {
                id: "NavStyle" + this.id,
                ClassList: [
                    new WCssClass(`.nav, .navInactive, .navActive`, {
                        display: "flex",
                        "flex-direction": navDirection,
                        padding: "0px 10px",
                        transition: "all 1s",
                        "justify-content": this.alignItems,
                        "flex-wrap": "wrap",
                        position: "relative"
                    }), new WCssClass(`.tab`, {
                        display: "flex",
                        "flex-direction": navDirection,
                        //padding: "0px 10px",
                        transition: "all 1s",
                        "justify-content": "center"
                    }), new WCssClass(`.tab .elementNavActive`, {
                        "border-top": "solid 1px rgba(0,0,0,0)",
                        "border-left": "solid 1px rgba(0,0,0,0)",
                        "border-right": "solid 1px rgba(0,0,0,0)",
                        "border-radius": "0.1cm",
                        color: this.DarkMode ? "#4da6ff" : "#444444"
                    }), new WCssClass(`a`, {
                        "text-decoration": "none",
                        cursor: "pointer"
                    }), new WCssClass(`.elementNav`, {
                        "text-decoration": "none",
                        color: this.DarkMode ? "#d3d3d3" : "#444444",
                        padding: 8,
                        "border": "solid 1px rgb(0,0,0,0)",
                        "border-bottom": `solid 2px rgba(0,0,0,0)`,
                        transition: "all 0.6s",
                        display: "flex", "align-items": "center",
                        cursor: "pointer",
                        "font-size": 12,
                        position: "relative"
                    }), new WCssClass(`.elementNavActive`, {
                        "text-decoration": "none",
                        color: this.DarkMode ? "#4da6ff" : "#444444",
                        padding: "8px",
                        "font-size": 12,
                        "border": "solid 1px rgb(0,0,0,0)",
                        "border-bottom": "solid 2px #4da6ff",
                        transition: "all 0.6s",
                        display: "flex", "align-items": "center",
                    }), new WCssClass(`h4.elementNavActive`, {
                        display: "none",
                    }), new WCssClass(`.elementNav:hover`, {
                        "border-bottom": "solid 2px #444444"
                    }), new WCssClass(`header`, {
                        display: "flex",
                        "align-items": "center",
                        "justify-content": this.alignItems,
                        "box-shadow": "0 1px 1px 0 rgba(0,0,0,0.3)"
                    }), new WCssClass(`.IconNav`, {
                        height: 20,
                        width: 20,
                        margin: 5
                    }), new WCssClass(`.tab .elementNavActive, .tab .elementNav`, {
                        display: "flex",
                        "flex-direction": "column",
                        "min-width": 100
                    }), new WCssClass(`.tab .IconNav`, {
                        height: 40,
                        width: 40
                    }), new WCssClass(`.NavTitle`, {
                        "font-size": "1.1rem",
                        padding: "10px",
                        color: "#888888",
                        cursor: "pointer"
                    }),
                    //Estilos de submenu
                    new WCssClass(` .DisplayMenu`, {
                        overflow: "hidden",
                        "padding-left": "10px",
                        "max-height": "1000px",
                        display: "flex",
                        "flex-direction": "column",
                        margin: "10px 0px"
                    }), new WCssClass(` .AbsoluteDisplay`, {
                        position: "absolute",
                        top:"+40px",
                        left: 0,
                        "background-color": "#fff",
                        padding: 12,
                        "box-shadow": "0 0 5px 0 #888",
                        "border-radius": 15
                    }),  new WCssClass(` .UnDisplayMenu`, {
                        overflow: "hidden",
                        "max-height": "0px",                        
                        padding: 0,
                        "box-shadow": "none"
                    }),new WCssClass(`.DisplayMenu a`, {
                        "text-decoration": "none",
                        color: "#8e8e8e",
                        padding: 10,
                        "font-size": 12,
                        "margin-bottom": 10,
                        "border-radius": 5,
                        "background-color": this.DarkMode ? "rgb(0,0,0,50%)" : "rgb(0,0,0,10%)",
                        color: this.DarkMode ? "#d3d3d3" : "#444444",
                        //padding: "10px",
                    }), //ocultacion. 
                    new WCssClass(`.DisplayBtn`, {
                        margin: "10px",
                        display: "none",
                        height: "15px", width: "15px",
                        cursor: "pointer",
                        filter: this.DarkMode ? "invert(90%)" : "invert(0%)"
                    }), new WCssClass(`.navActive`, {
                        overflow: "hidden",
                        "max-height": "5000px",
                    })
                ],
                MediaQuery: [{
                    condicion: "(max-width: 1200px)",
                    ClassList: []
                }, {
                    condicion: "(max-width: 800px)",
                    ClassList: [
                        new WCssClass(`.DisplayBtn`, {
                            display: "initial",
                            height: 25,
                            width: 25,
                        }), new WCssClass(`.nav`, {
                            "flex-direction": "column",
                            overflow: "hidden",
                            "max-height": "0px"
                        }), new WCssClass(`.navActive, .navInactive, .nav`, {
                            overflow: "hidden",
                            "max-height": "5000px",
                            transition: "all 0.6s",
                            "position": "fixed",
                            "z-index": "999",
                            "background-color": this.DarkMode ? "#444444" : "#fff",
                            "color": "#fff",
                            "width": "80%",
                            "height": "100vh",
                            top: 0,
                            "box-shadow": "0 5px 5px 3px rgba(0,0,0,0.3)",
                            "flex-direction": "column",
                            "justify-content": "initial",
                            "padding-top": 20,
                            right: this.DisplayMode == "left" ? "inherit" : "0"

                        }), new WCssClass(`.navInactive, .nav`, {
                            opacity: "0",
                            "pointer-events": "none",
                            transform: this.DisplayMode == "left" ? "translateX(-100%)" : "translateX(+100%)",

                        }),
                        new WCssClass(`header`, {
                            display: "flex",
                            "align-items": "center",
                            "justify-content": this.alignItems,
                            "box-shadow": "none"
                        }),
                    ]
                }]
            }
        }
        return Style;
    }
}
customElements.define("w-app-navigator", WAppNavigator);
export { WAppNavigator };
