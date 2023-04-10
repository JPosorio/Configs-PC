function web_search() {
  emulate -L zsh
  typeset -A urls
  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    github      "https://github.com/search?q="
    brave       "https://search.brave.com/search?q="
    youtube       "https://www.youtube.com/results?search_query="
  )
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine '$1' not supported."
    return 1
  fi
  if [[ $# -gt 1 ]]; then
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi
   open "$url"
}
alias br='web_search brave'
alias gt='web_search github'
alias yt='web_search youtube'
if [[ ${#ZSH_WEB_SEARCH_ENGINES} -gt 0 ]]; then
  typeset -A engines
  engines=($ZSH_WEB_SEARCH_ENGINES)
  for key in ${(k)engines}; do
    alias "$key"="web_search $key"
  done
  unset engines key
fi
