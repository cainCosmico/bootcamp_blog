const body = document.getElementsByTagName('html')[0];

const defaul_theme = () => {
  if (localStorage.theme === 'dark' ) {
    body.classList.add('dark');
  } else {
    body.classList.remove('dark');
  }
}
defaul_theme();

const toggleDarkMode = () => {
  if(body.classList.contains('dark')) {
    body.classList.remove('dark');
    localStorage.theme = 'light'
  } else {
    body.classList.add('dark');
    localStorage.theme = 'dark'
  }
}

var toggle_mode_btn = document.getElementsByClassName('toggle-dark-mode-btn')[0];
toggle_mode_btn.onclick = toggleDarkMode