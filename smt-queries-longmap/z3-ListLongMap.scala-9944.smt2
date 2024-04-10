; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117488 () Bool)

(assert start!117488)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-fun call!66156 () (_ BitVec 32))

(declare-datatypes ((array!94039 0))(
  ( (array!94040 (arr!45414 (Array (_ BitVec 32) (_ BitVec 64))) (size!45964 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94039)

(declare-fun bm!66153 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94039 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66153 (= call!66156 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1380290 () Bool)

(declare-fun e!782125 () Bool)

(declare-fun call!66157 () (_ BitVec 32))

(assert (=> b!1380290 (= e!782125 (= call!66156 call!66157))))

(declare-fun bm!66154 () Bool)

(assert (=> bm!66154 (= call!66157 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380292 () Bool)

(declare-fun res!922534 () Bool)

(declare-fun e!782124 () Bool)

(assert (=> b!1380292 (=> (not res!922534) (not e!782124))))

(assert (=> b!1380292 (= res!922534 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45964 a!3961)))))

(declare-fun b!1380293 () Bool)

(declare-fun res!922533 () Bool)

(assert (=> b!1380293 (=> (not res!922533) (not e!782124))))

(declare-fun to!135 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380293 (= res!922533 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380294 () Bool)

(assert (=> b!1380294 (= e!782124 (not (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> b!1380294 e!782125))

(declare-fun c!128319 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380294 (= c!128319 (validKeyInArray!0 (select (arr!45414 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45959 0))(
  ( (Unit!45960) )
))
(declare-fun lt!607908 () Unit!45959)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94039 (_ BitVec 32) (_ BitVec 32)) Unit!45959)

(assert (=> b!1380294 (= lt!607908 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun res!922532 () Bool)

(assert (=> start!117488 (=> (not res!922532) (not e!782124))))

(assert (=> start!117488 (= res!922532 (and (bvslt (size!45964 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45964 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117488 e!782124))

(declare-fun array_inv!34442 (array!94039) Bool)

(assert (=> start!117488 (array_inv!34442 a!3961)))

(assert (=> start!117488 true))

(declare-fun b!1380291 () Bool)

(assert (=> b!1380291 (= e!782125 (= (bvadd #b00000000000000000000000000000001 call!66156) call!66157))))

(assert (= (and start!117488 res!922532) b!1380293))

(assert (= (and b!1380293 res!922533) b!1380292))

(assert (= (and b!1380292 res!922534) b!1380294))

(assert (= (and b!1380294 c!128319) b!1380291))

(assert (= (and b!1380294 (not c!128319)) b!1380290))

(assert (= (or b!1380291 b!1380290) bm!66153))

(assert (= (or b!1380291 b!1380290) bm!66154))

(declare-fun m!1265479 () Bool)

(assert (=> b!1380294 m!1265479))

(declare-fun m!1265481 () Bool)

(assert (=> b!1380294 m!1265481))

(assert (=> b!1380294 m!1265481))

(declare-fun m!1265483 () Bool)

(assert (=> b!1380294 m!1265483))

(declare-fun m!1265485 () Bool)

(assert (=> b!1380294 m!1265485))

(declare-fun m!1265487 () Bool)

(assert (=> start!117488 m!1265487))

(declare-fun m!1265489 () Bool)

(assert (=> b!1380293 m!1265489))

(declare-fun m!1265491 () Bool)

(assert (=> bm!66153 m!1265491))

(declare-fun m!1265493 () Bool)

(assert (=> bm!66154 m!1265493))

(check-sat (not bm!66153) (not bm!66154) (not b!1380294) (not b!1380293) (not start!117488))
(check-sat)
(get-model)

(declare-fun d!148745 () Bool)

(assert (=> d!148745 (= (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34)) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39851 () Bool)

(assert (= bs!39851 d!148745))

(assert (=> bs!39851 m!1265493))

(declare-fun m!1265511 () Bool)

(assert (=> bs!39851 m!1265511))

(declare-fun m!1265513 () Bool)

(assert (=> bs!39851 m!1265513))

(assert (=> b!1380294 d!148745))

(declare-fun d!148747 () Bool)

(assert (=> d!148747 (= (validKeyInArray!0 (select (arr!45414 a!3961) pivot!34)) (and (not (= (select (arr!45414 a!3961) pivot!34) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45414 a!3961) pivot!34) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380294 d!148747))

(declare-fun call!66169 () (_ BitVec 32))

(declare-fun bm!66165 () Bool)

(assert (=> bm!66165 (= call!66169 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380316 () Bool)

(declare-fun e!782140 () Bool)

(declare-fun call!66168 () (_ BitVec 32))

(assert (=> b!1380316 (= e!782140 (= call!66168 call!66169))))

(declare-fun b!1380317 () Bool)

(declare-fun e!782141 () Bool)

(assert (=> b!1380317 (= e!782141 e!782140)))

(declare-fun c!128325 () Bool)

(assert (=> b!1380317 (= c!128325 (validKeyInArray!0 (select (arr!45414 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(declare-fun d!148749 () Bool)

(assert (=> d!148749 e!782141))

(declare-fun res!922546 () Bool)

(assert (=> d!148749 (=> (not res!922546) (not e!782141))))

(declare-fun lt!607917 () (_ BitVec 32))

(assert (=> d!148749 (= res!922546 (and (bvsge lt!607917 #b00000000000000000000000000000000) (bvslt lt!607917 (size!45964 a!3961))))))

(assert (=> d!148749 (= lt!607917 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))

(declare-fun lt!607916 () Unit!45959)

(declare-fun choose!86 (array!94039 (_ BitVec 32) (_ BitVec 32)) Unit!45959)

(assert (=> d!148749 (= lt!607916 (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148749 (and (bvslt (size!45964 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) from!3339) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45964 a!3961)))))

(assert (=> d!148749 (= (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607916)))

(declare-fun b!1380318 () Bool)

(assert (=> b!1380318 (= e!782140 (= (bvadd call!66168 #b00000000000000000000000000000001) call!66169))))

(declare-fun bm!66166 () Bool)

(assert (=> bm!66166 (= call!66168 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (= (and d!148749 res!922546) b!1380317))

(assert (= (and b!1380317 c!128325) b!1380318))

(assert (= (and b!1380317 (not c!128325)) b!1380316))

(assert (= (or b!1380318 b!1380316) bm!66165))

(assert (= (or b!1380318 b!1380316) bm!66166))

(assert (=> bm!66165 m!1265493))

(declare-fun m!1265515 () Bool)

(assert (=> b!1380317 m!1265515))

(assert (=> b!1380317 m!1265515))

(declare-fun m!1265517 () Bool)

(assert (=> b!1380317 m!1265517))

(declare-fun m!1265519 () Bool)

(assert (=> d!148749 m!1265519))

(declare-fun m!1265521 () Bool)

(assert (=> bm!66166 m!1265521))

(assert (=> b!1380294 d!148749))

(declare-fun d!148751 () Bool)

(assert (=> d!148751 (= (array_inv!34442 a!3961) (bvsge (size!45964 a!3961) #b00000000000000000000000000000000))))

(assert (=> start!117488 d!148751))

(declare-fun b!1380335 () Bool)

(declare-fun e!782151 () (_ BitVec 32))

(assert (=> b!1380335 (= e!782151 #b00000000000000000000000000000000)))

(declare-fun b!1380336 () Bool)

(declare-fun e!782150 () (_ BitVec 32))

(assert (=> b!1380336 (= e!782151 e!782150)))

(declare-fun c!128335 () Bool)

(assert (=> b!1380336 (= c!128335 (validKeyInArray!0 (select (arr!45414 a!3961) from!3339)))))

(declare-fun b!1380337 () Bool)

(declare-fun call!66174 () (_ BitVec 32))

(assert (=> b!1380337 (= e!782150 call!66174)))

(declare-fun d!148753 () Bool)

(declare-fun lt!607922 () (_ BitVec 32))

(assert (=> d!148753 (and (bvsge lt!607922 #b00000000000000000000000000000000) (bvsle lt!607922 (bvsub (size!45964 a!3961) from!3339)))))

(assert (=> d!148753 (= lt!607922 e!782151)))

(declare-fun c!128334 () Bool)

(assert (=> d!148753 (= c!128334 (bvsge from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148753 (and (bvsle from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45964 a!3961)))))

(assert (=> d!148753 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607922)))

(declare-fun bm!66171 () Bool)

(assert (=> bm!66171 (= call!66174 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380338 () Bool)

(assert (=> b!1380338 (= e!782150 (bvadd #b00000000000000000000000000000001 call!66174))))

(assert (= (and d!148753 c!128334) b!1380335))

(assert (= (and d!148753 (not c!128334)) b!1380336))

(assert (= (and b!1380336 c!128335) b!1380338))

(assert (= (and b!1380336 (not c!128335)) b!1380337))

(assert (= (or b!1380338 b!1380337) bm!66171))

(declare-fun m!1265529 () Bool)

(assert (=> b!1380336 m!1265529))

(assert (=> b!1380336 m!1265529))

(declare-fun m!1265531 () Bool)

(assert (=> b!1380336 m!1265531))

(declare-fun m!1265533 () Bool)

(assert (=> bm!66171 m!1265533))

(assert (=> bm!66154 d!148753))

(declare-fun b!1380343 () Bool)

(declare-fun e!782155 () (_ BitVec 32))

(assert (=> b!1380343 (= e!782155 #b00000000000000000000000000000000)))

(declare-fun b!1380344 () Bool)

(declare-fun e!782154 () (_ BitVec 32))

(assert (=> b!1380344 (= e!782155 e!782154)))

(declare-fun c!128339 () Bool)

(assert (=> b!1380344 (= c!128339 (validKeyInArray!0 (select (arr!45414 a!3961) from!3339)))))

(declare-fun b!1380345 () Bool)

(declare-fun call!66176 () (_ BitVec 32))

(assert (=> b!1380345 (= e!782154 call!66176)))

(declare-fun d!148763 () Bool)

(declare-fun lt!607924 () (_ BitVec 32))

(assert (=> d!148763 (and (bvsge lt!607924 #b00000000000000000000000000000000) (bvsle lt!607924 (bvsub (size!45964 a!3961) from!3339)))))

(assert (=> d!148763 (= lt!607924 e!782155)))

(declare-fun c!128338 () Bool)

(assert (=> d!148763 (= c!128338 (bvsge from!3339 pivot!34))))

(assert (=> d!148763 (and (bvsle from!3339 pivot!34) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle pivot!34 (size!45964 a!3961)))))

(assert (=> d!148763 (= (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) lt!607924)))

(declare-fun bm!66173 () Bool)

(assert (=> bm!66173 (= call!66176 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(declare-fun b!1380346 () Bool)

(assert (=> b!1380346 (= e!782154 (bvadd #b00000000000000000000000000000001 call!66176))))

(assert (= (and d!148763 c!128338) b!1380343))

(assert (= (and d!148763 (not c!128338)) b!1380344))

(assert (= (and b!1380344 c!128339) b!1380346))

(assert (= (and b!1380344 (not c!128339)) b!1380345))

(assert (= (or b!1380346 b!1380345) bm!66173))

(assert (=> b!1380344 m!1265529))

(assert (=> b!1380344 m!1265529))

(assert (=> b!1380344 m!1265531))

(declare-fun m!1265541 () Bool)

(assert (=> bm!66173 m!1265541))

(assert (=> bm!66153 d!148763))

(declare-fun d!148767 () Bool)

(assert (=> d!148767 (= (isPivot!0 a!3961 from!3339 to!135 pivot!34) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) (arrayCountValidKeys!0 a!3961 pivot!34 to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39854 () Bool)

(assert (= bs!39854 d!148767))

(assert (=> bs!39854 m!1265491))

(declare-fun m!1265543 () Bool)

(assert (=> bs!39854 m!1265543))

(assert (=> bs!39854 m!1265513))

(assert (=> b!1380293 d!148767))

(check-sat (not d!148767) (not bm!66166) (not b!1380336) (not b!1380344) (not d!148745) (not bm!66165) (not d!148749) (not b!1380317) (not bm!66173) (not bm!66171))
(check-sat)
(get-model)

(assert (=> bm!66165 d!148753))

(assert (=> d!148745 d!148753))

(declare-fun b!1380385 () Bool)

(declare-fun e!782179 () (_ BitVec 32))

(assert (=> b!1380385 (= e!782179 #b00000000000000000000000000000000)))

(declare-fun b!1380386 () Bool)

(declare-fun e!782178 () (_ BitVec 32))

(assert (=> b!1380386 (= e!782179 e!782178)))

(declare-fun c!128357 () Bool)

(assert (=> b!1380386 (= c!128357 (validKeyInArray!0 (select (arr!45414 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun b!1380387 () Bool)

(declare-fun call!66194 () (_ BitVec 32))

(assert (=> b!1380387 (= e!782178 call!66194)))

(declare-fun d!148787 () Bool)

(declare-fun lt!607942 () (_ BitVec 32))

(assert (=> d!148787 (and (bvsge lt!607942 #b00000000000000000000000000000000) (bvsle lt!607942 (bvsub (size!45964 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> d!148787 (= lt!607942 e!782179)))

(declare-fun c!128356 () Bool)

(assert (=> d!148787 (= c!128356 (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) to!135))))

(assert (=> d!148787 (and (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) to!135) (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000000) (bvsle to!135 (size!45964 a!3961)))))

(assert (=> d!148787 (= (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135) lt!607942)))

(declare-fun bm!66191 () Bool)

(assert (=> bm!66191 (= call!66194 (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34 #b00000000000000000000000000000001) to!135))))

(declare-fun b!1380388 () Bool)

(assert (=> b!1380388 (= e!782178 (bvadd #b00000000000000000000000000000001 call!66194))))

(assert (= (and d!148787 c!128356) b!1380385))

(assert (= (and d!148787 (not c!128356)) b!1380386))

(assert (= (and b!1380386 c!128357) b!1380388))

(assert (= (and b!1380386 (not c!128357)) b!1380387))

(assert (= (or b!1380388 b!1380387) bm!66191))

(declare-fun m!1265577 () Bool)

(assert (=> b!1380386 m!1265577))

(assert (=> b!1380386 m!1265577))

(declare-fun m!1265579 () Bool)

(assert (=> b!1380386 m!1265579))

(declare-fun m!1265581 () Bool)

(assert (=> bm!66191 m!1265581))

(assert (=> d!148745 d!148787))

(declare-fun b!1380389 () Bool)

(declare-fun e!782181 () (_ BitVec 32))

(assert (=> b!1380389 (= e!782181 #b00000000000000000000000000000000)))

(declare-fun b!1380390 () Bool)

(declare-fun e!782180 () (_ BitVec 32))

(assert (=> b!1380390 (= e!782181 e!782180)))

(declare-fun c!128359 () Bool)

(assert (=> b!1380390 (= c!128359 (validKeyInArray!0 (select (arr!45414 a!3961) from!3339)))))

(declare-fun b!1380391 () Bool)

(declare-fun call!66195 () (_ BitVec 32))

(assert (=> b!1380391 (= e!782180 call!66195)))

(declare-fun d!148789 () Bool)

(declare-fun lt!607943 () (_ BitVec 32))

(assert (=> d!148789 (and (bvsge lt!607943 #b00000000000000000000000000000000) (bvsle lt!607943 (bvsub (size!45964 a!3961) from!3339)))))

(assert (=> d!148789 (= lt!607943 e!782181)))

(declare-fun c!128358 () Bool)

(assert (=> d!148789 (= c!128358 (bvsge from!3339 to!135))))

(assert (=> d!148789 (and (bvsle from!3339 to!135) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle to!135 (size!45964 a!3961)))))

(assert (=> d!148789 (= (arrayCountValidKeys!0 a!3961 from!3339 to!135) lt!607943)))

(declare-fun bm!66192 () Bool)

(assert (=> bm!66192 (= call!66195 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) to!135))))

(declare-fun b!1380392 () Bool)

(assert (=> b!1380392 (= e!782180 (bvadd #b00000000000000000000000000000001 call!66195))))

(assert (= (and d!148789 c!128358) b!1380389))

(assert (= (and d!148789 (not c!128358)) b!1380390))

(assert (= (and b!1380390 c!128359) b!1380392))

(assert (= (and b!1380390 (not c!128359)) b!1380391))

(assert (= (or b!1380392 b!1380391) bm!66192))

(assert (=> b!1380390 m!1265529))

(assert (=> b!1380390 m!1265529))

(assert (=> b!1380390 m!1265531))

(declare-fun m!1265583 () Bool)

(assert (=> bm!66192 m!1265583))

(assert (=> d!148745 d!148789))

(declare-fun d!148791 () Bool)

(assert (=> d!148791 (= (validKeyInArray!0 (select (arr!45414 a!3961) from!3339)) (and (not (= (select (arr!45414 a!3961) from!3339) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45414 a!3961) from!3339) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380344 d!148791))

(declare-fun d!148793 () Bool)

(assert (=> d!148793 (= (validKeyInArray!0 (select (arr!45414 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))) (and (not (= (select (arr!45414 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45414 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380317 d!148793))

(assert (=> b!1380336 d!148791))

(declare-fun bm!66198 () Bool)

(declare-fun call!66201 () (_ BitVec 32))

(assert (=> bm!66198 (= call!66201 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun d!148795 () Bool)

(declare-fun e!782184 () Bool)

(assert (=> d!148795 e!782184))

(declare-fun c!128362 () Bool)

(assert (=> d!148795 (= c!128362 (validKeyInArray!0 (select (arr!45414 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(assert (=> d!148795 true))

(declare-fun _$73!14 () Unit!45959)

(assert (=> d!148795 (= (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) _$73!14)))

(declare-fun b!1380398 () Bool)

(declare-fun call!66200 () (_ BitVec 32))

(assert (=> b!1380398 (= e!782184 (= call!66200 call!66201))))

(declare-fun bm!66197 () Bool)

(assert (=> bm!66197 (= call!66200 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1380397 () Bool)

(assert (=> b!1380397 (= e!782184 (= (bvadd call!66200 #b00000000000000000000000000000001) call!66201))))

(assert (= (and d!148795 c!128362) b!1380397))

(assert (= (and d!148795 (not c!128362)) b!1380398))

(assert (= (or b!1380397 b!1380398) bm!66197))

(assert (= (or b!1380397 b!1380398) bm!66198))

(assert (=> bm!66198 m!1265493))

(assert (=> d!148795 m!1265515))

(assert (=> d!148795 m!1265515))

(assert (=> d!148795 m!1265517))

(assert (=> bm!66197 m!1265521))

(assert (=> d!148749 d!148795))

(declare-fun b!1380399 () Bool)

(declare-fun e!782186 () (_ BitVec 32))

(assert (=> b!1380399 (= e!782186 #b00000000000000000000000000000000)))

(declare-fun b!1380400 () Bool)

(declare-fun e!782185 () (_ BitVec 32))

(assert (=> b!1380400 (= e!782186 e!782185)))

(declare-fun c!128364 () Bool)

(assert (=> b!1380400 (= c!128364 (validKeyInArray!0 (select (arr!45414 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380401 () Bool)

(declare-fun call!66202 () (_ BitVec 32))

(assert (=> b!1380401 (= e!782185 call!66202)))

(declare-fun d!148797 () Bool)

(declare-fun lt!607944 () (_ BitVec 32))

(assert (=> d!148797 (and (bvsge lt!607944 #b00000000000000000000000000000000) (bvsle lt!607944 (bvsub (size!45964 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148797 (= lt!607944 e!782186)))

(declare-fun c!128363 () Bool)

(assert (=> d!148797 (= c!128363 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (=> d!148797 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle pivot!34 (size!45964 a!3961)))))

(assert (=> d!148797 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) lt!607944)))

(declare-fun bm!66199 () Bool)

(assert (=> bm!66199 (= call!66202 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) pivot!34))))

(declare-fun b!1380402 () Bool)

(assert (=> b!1380402 (= e!782185 (bvadd #b00000000000000000000000000000001 call!66202))))

(assert (= (and d!148797 c!128363) b!1380399))

(assert (= (and d!148797 (not c!128363)) b!1380400))

(assert (= (and b!1380400 c!128364) b!1380402))

(assert (= (and b!1380400 (not c!128364)) b!1380401))

(assert (= (or b!1380402 b!1380401) bm!66199))

(declare-fun m!1265585 () Bool)

(assert (=> b!1380400 m!1265585))

(assert (=> b!1380400 m!1265585))

(declare-fun m!1265587 () Bool)

(assert (=> b!1380400 m!1265587))

(declare-fun m!1265589 () Bool)

(assert (=> bm!66199 m!1265589))

(assert (=> bm!66173 d!148797))

(assert (=> d!148767 d!148763))

(declare-fun b!1380403 () Bool)

(declare-fun e!782188 () (_ BitVec 32))

(assert (=> b!1380403 (= e!782188 #b00000000000000000000000000000000)))

(declare-fun b!1380404 () Bool)

(declare-fun e!782187 () (_ BitVec 32))

(assert (=> b!1380404 (= e!782188 e!782187)))

(declare-fun c!128366 () Bool)

(assert (=> b!1380404 (= c!128366 (validKeyInArray!0 (select (arr!45414 a!3961) pivot!34)))))

(declare-fun b!1380405 () Bool)

(declare-fun call!66203 () (_ BitVec 32))

(assert (=> b!1380405 (= e!782187 call!66203)))

(declare-fun d!148799 () Bool)

(declare-fun lt!607945 () (_ BitVec 32))

(assert (=> d!148799 (and (bvsge lt!607945 #b00000000000000000000000000000000) (bvsle lt!607945 (bvsub (size!45964 a!3961) pivot!34)))))

(assert (=> d!148799 (= lt!607945 e!782188)))

(declare-fun c!128365 () Bool)

(assert (=> d!148799 (= c!128365 (bvsge pivot!34 to!135))))

(assert (=> d!148799 (and (bvsle pivot!34 to!135) (bvsge pivot!34 #b00000000000000000000000000000000) (bvsle to!135 (size!45964 a!3961)))))

(assert (=> d!148799 (= (arrayCountValidKeys!0 a!3961 pivot!34 to!135) lt!607945)))

(declare-fun bm!66200 () Bool)

(assert (=> bm!66200 (= call!66203 (arrayCountValidKeys!0 a!3961 (bvadd pivot!34 #b00000000000000000000000000000001) to!135))))

(declare-fun b!1380406 () Bool)

(assert (=> b!1380406 (= e!782187 (bvadd #b00000000000000000000000000000001 call!66203))))

(assert (= (and d!148799 c!128365) b!1380403))

(assert (= (and d!148799 (not c!128365)) b!1380404))

(assert (= (and b!1380404 c!128366) b!1380406))

(assert (= (and b!1380404 (not c!128366)) b!1380405))

(assert (= (or b!1380406 b!1380405) bm!66200))

(assert (=> b!1380404 m!1265481))

(assert (=> b!1380404 m!1265481))

(assert (=> b!1380404 m!1265483))

(declare-fun m!1265591 () Bool)

(assert (=> bm!66200 m!1265591))

(assert (=> d!148767 d!148799))

(assert (=> d!148767 d!148789))

(declare-fun b!1380407 () Bool)

(declare-fun e!782190 () (_ BitVec 32))

(assert (=> b!1380407 (= e!782190 #b00000000000000000000000000000000)))

(declare-fun b!1380408 () Bool)

(declare-fun e!782189 () (_ BitVec 32))

(assert (=> b!1380408 (= e!782190 e!782189)))

(declare-fun c!128368 () Bool)

(assert (=> b!1380408 (= c!128368 (validKeyInArray!0 (select (arr!45414 a!3961) from!3339)))))

(declare-fun b!1380409 () Bool)

(declare-fun call!66204 () (_ BitVec 32))

(assert (=> b!1380409 (= e!782189 call!66204)))

(declare-fun d!148801 () Bool)

(declare-fun lt!607946 () (_ BitVec 32))

(assert (=> d!148801 (and (bvsge lt!607946 #b00000000000000000000000000000000) (bvsle lt!607946 (bvsub (size!45964 a!3961) from!3339)))))

(assert (=> d!148801 (= lt!607946 e!782190)))

(declare-fun c!128367 () Bool)

(assert (=> d!148801 (= c!128367 (bvsge from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (=> d!148801 (and (bvsle from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001) (size!45964 a!3961)))))

(assert (=> d!148801 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) lt!607946)))

(declare-fun bm!66201 () Bool)

(assert (=> bm!66201 (= call!66204 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1380410 () Bool)

(assert (=> b!1380410 (= e!782189 (bvadd #b00000000000000000000000000000001 call!66204))))

(assert (= (and d!148801 c!128367) b!1380407))

(assert (= (and d!148801 (not c!128367)) b!1380408))

(assert (= (and b!1380408 c!128368) b!1380410))

(assert (= (and b!1380408 (not c!128368)) b!1380409))

(assert (= (or b!1380410 b!1380409) bm!66201))

(assert (=> b!1380408 m!1265529))

(assert (=> b!1380408 m!1265529))

(assert (=> b!1380408 m!1265531))

(declare-fun m!1265593 () Bool)

(assert (=> bm!66201 m!1265593))

(assert (=> bm!66166 d!148801))

(declare-fun b!1380411 () Bool)

(declare-fun e!782192 () (_ BitVec 32))

(assert (=> b!1380411 (= e!782192 #b00000000000000000000000000000000)))

(declare-fun b!1380412 () Bool)

(declare-fun e!782191 () (_ BitVec 32))

(assert (=> b!1380412 (= e!782192 e!782191)))

(declare-fun c!128370 () Bool)

(assert (=> b!1380412 (= c!128370 (validKeyInArray!0 (select (arr!45414 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380413 () Bool)

(declare-fun call!66205 () (_ BitVec 32))

(assert (=> b!1380413 (= e!782191 call!66205)))

(declare-fun d!148803 () Bool)

(declare-fun lt!607947 () (_ BitVec 32))

(assert (=> d!148803 (and (bvsge lt!607947 #b00000000000000000000000000000000) (bvsle lt!607947 (bvsub (size!45964 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148803 (= lt!607947 e!782192)))

(declare-fun c!128369 () Bool)

(assert (=> d!148803 (= c!128369 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148803 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45964 a!3961)))))

(assert (=> d!148803 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607947)))

(declare-fun bm!66202 () Bool)

(assert (=> bm!66202 (= call!66205 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380414 () Bool)

(assert (=> b!1380414 (= e!782191 (bvadd #b00000000000000000000000000000001 call!66205))))

(assert (= (and d!148803 c!128369) b!1380411))

(assert (= (and d!148803 (not c!128369)) b!1380412))

(assert (= (and b!1380412 c!128370) b!1380414))

(assert (= (and b!1380412 (not c!128370)) b!1380413))

(assert (= (or b!1380414 b!1380413) bm!66202))

(assert (=> b!1380412 m!1265585))

(assert (=> b!1380412 m!1265585))

(assert (=> b!1380412 m!1265587))

(declare-fun m!1265595 () Bool)

(assert (=> bm!66202 m!1265595))

(assert (=> bm!66171 d!148803))

(check-sat (not bm!66199) (not bm!66202) (not d!148795) (not b!1380412) (not bm!66197) (not b!1380404) (not b!1380408) (not bm!66200) (not b!1380390) (not bm!66198) (not b!1380386) (not b!1380400) (not bm!66192) (not bm!66191) (not bm!66201))
(check-sat)
