

output$playerPic <- renderUI({
  # if (is.null(input$playerA)) return()
  # if (input$playerA=="") return()
  # print(input$playerA)
  # print("enter picture")
  
  req(input$playerA)
  playerName <- pgMini[pgMini$PLAYERID==input$playerA,]$name
     thePlayer <- tolower(str_replace(playerName," ","-"))
 # print(thePlayer) #"darren-bent"
  u <- paste0("http://www.premierleague.com/en-gb/players/profile.career-history.html/",thePlayer)
  print(u)
    u.get<- GET(u)
    print("OK to here")
    u.content=content(u.get, as="text")
    u.html <- htmlParse(u.content)
#    print(u.html)
    picLink <-xpathSApply(u.html, "//*/img[@class='heroimg']/@src")
      #unname(picLink)
      print(picLink)
      if (!is.null(picLink)) {
      src1 <- paste0("http://www.premierleague.com",unname(picLink))
      } else {
        src1 <- "http://www.premierleague.com/content/dam/premierleague/shared-images/site-furniture/players/-lsh.jpg"
      }
      print(src1) #1] "http://www.premierleague.com/content/dam/premierleague/shared-images/players/d/darren-bent/10738-lsh.jpg" is a picture
      tags$img(src=src1, width=300)
#       } else {
#        tags$p("No Picture Available") 
#       }
 # caption <-"test"
 # caption
})