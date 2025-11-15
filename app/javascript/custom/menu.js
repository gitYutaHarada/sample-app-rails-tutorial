// メニュー操作
 
// トグルリスナーを追加してクリックをリッスンする
document.addEventListener("turbo:load", function() {
    const hamburger = document.getElementById("hamburger")
    const navbarMenu = document.getElementById("navbar-menu")
    if (hamburger && navbarMenu) {
        hamburger.addEventListener("click", function() {
            navbarMenu.classList.toggle("collapse");
        })
    }
    let account = document.querySelector("#account");
    if (account) {
        account.addEventListener("click", function(event) {
            event.preventDefault();
            let menu = document.querySelector("#dropdown-menu");
            menu.classList.toggle("active");
        })

    }
})