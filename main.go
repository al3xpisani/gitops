package main

import "net/http"

func main(){
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("<h1>Listening on port 8080</h1>"))
	})
	http.ListenAndServe(":8080",nil)
}