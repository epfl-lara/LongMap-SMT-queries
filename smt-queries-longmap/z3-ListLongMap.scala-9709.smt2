; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114814 () Bool)

(assert start!114814)

(declare-fun b!1361329 () Bool)

(declare-fun e!772300 () Bool)

(declare-fun e!772302 () Bool)

(assert (=> b!1361329 (= e!772300 e!772302)))

(declare-fun res!905483 () Bool)

(assert (=> b!1361329 (=> (not res!905483) (not e!772302))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-fun lt!600144 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1361329 (= res!905483 (and (not (= from!3120 i!1404)) lt!600144))))

(declare-datatypes ((Unit!44868 0))(
  ( (Unit!44869) )
))
(declare-fun lt!600148 () Unit!44868)

(declare-fun e!772303 () Unit!44868)

(assert (=> b!1361329 (= lt!600148 e!772303)))

(declare-fun c!127364 () Bool)

(assert (=> b!1361329 (= c!127364 lt!600144)))

(declare-datatypes ((array!92600 0))(
  ( (array!92601 (arr!44736 (Array (_ BitVec 32) (_ BitVec 64))) (size!45286 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92600)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361329 (= lt!600144 (validKeyInArray!0 (select (arr!44736 a!3742) from!3120)))))

(declare-fun b!1361330 () Bool)

(declare-fun res!905488 () Bool)

(assert (=> b!1361330 (=> (not res!905488) (not e!772300))))

(assert (=> b!1361330 (= res!905488 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45286 a!3742)))))

(declare-fun res!905489 () Bool)

(assert (=> start!114814 (=> (not res!905489) (not e!772300))))

(assert (=> start!114814 (= res!905489 (and (bvslt (size!45286 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45286 a!3742))))))

(assert (=> start!114814 e!772300))

(assert (=> start!114814 true))

(declare-fun array_inv!33764 (array!92600) Bool)

(assert (=> start!114814 (array_inv!33764 a!3742)))

(declare-fun b!1361331 () Bool)

(declare-fun res!905491 () Bool)

(assert (=> b!1361331 (=> (not res!905491) (not e!772300))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1361331 (= res!905491 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361332 () Bool)

(declare-fun res!905493 () Bool)

(declare-fun e!772299 () Bool)

(assert (=> b!1361332 (=> (not res!905493) (not e!772299))))

(declare-datatypes ((List!31777 0))(
  ( (Nil!31774) (Cons!31773 (h!32982 (_ BitVec 64)) (t!46459 List!31777)) )
))
(declare-fun lt!600147 () List!31777)

(declare-fun noDuplicate!2343 (List!31777) Bool)

(assert (=> b!1361332 (= res!905493 (noDuplicate!2343 lt!600147))))

(declare-fun b!1361333 () Bool)

(assert (=> b!1361333 (= e!772302 e!772299)))

(declare-fun res!905492 () Bool)

(assert (=> b!1361333 (=> (not res!905492) (not e!772299))))

(assert (=> b!1361333 (= res!905492 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun acc!759 () List!31777)

(declare-fun $colon$colon!891 (List!31777 (_ BitVec 64)) List!31777)

(assert (=> b!1361333 (= lt!600147 ($colon$colon!891 acc!759 (select (arr!44736 a!3742) from!3120)))))

(declare-fun b!1361334 () Bool)

(declare-fun res!905486 () Bool)

(assert (=> b!1361334 (=> (not res!905486) (not e!772300))))

(declare-fun arrayNoDuplicates!0 (array!92600 (_ BitVec 32) List!31777) Bool)

(assert (=> b!1361334 (= res!905486 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31774))))

(declare-fun b!1361335 () Bool)

(declare-fun res!905484 () Bool)

(assert (=> b!1361335 (=> (not res!905484) (not e!772300))))

(declare-fun contains!9486 (List!31777 (_ BitVec 64)) Bool)

(assert (=> b!1361335 (= res!905484 (not (contains!9486 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361336 () Bool)

(declare-fun Unit!44870 () Unit!44868)

(assert (=> b!1361336 (= e!772303 Unit!44870)))

(declare-fun b!1361337 () Bool)

(declare-fun res!905485 () Bool)

(assert (=> b!1361337 (=> (not res!905485) (not e!772300))))

(assert (=> b!1361337 (= res!905485 (noDuplicate!2343 acc!759))))

(declare-fun b!1361338 () Bool)

(declare-fun res!905490 () Bool)

(assert (=> b!1361338 (=> (not res!905490) (not e!772299))))

(assert (=> b!1361338 (= res!905490 (not (contains!9486 lt!600147 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361339 () Bool)

(declare-fun res!905487 () Bool)

(assert (=> b!1361339 (=> (not res!905487) (not e!772300))))

(assert (=> b!1361339 (= res!905487 (not (contains!9486 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361340 () Bool)

(declare-fun res!905481 () Bool)

(assert (=> b!1361340 (=> (not res!905481) (not e!772300))))

(assert (=> b!1361340 (= res!905481 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45286 a!3742))))))

(declare-fun b!1361341 () Bool)

(assert (=> b!1361341 (= e!772299 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600147)))))

(declare-fun b!1361342 () Bool)

(declare-fun res!905482 () Bool)

(assert (=> b!1361342 (=> (not res!905482) (not e!772300))))

(assert (=> b!1361342 (= res!905482 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361343 () Bool)

(declare-fun lt!600146 () Unit!44868)

(assert (=> b!1361343 (= e!772303 lt!600146)))

(declare-fun lt!600145 () Unit!44868)

(declare-fun lemmaListSubSeqRefl!0 (List!31777) Unit!44868)

(assert (=> b!1361343 (= lt!600145 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!888 (List!31777 List!31777) Bool)

(assert (=> b!1361343 (subseq!888 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92600 List!31777 List!31777 (_ BitVec 32)) Unit!44868)

(assert (=> b!1361343 (= lt!600146 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!891 acc!759 (select (arr!44736 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361343 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361344 () Bool)

(declare-fun res!905494 () Bool)

(assert (=> b!1361344 (=> (not res!905494) (not e!772299))))

(assert (=> b!1361344 (= res!905494 (not (contains!9486 lt!600147 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114814 res!905489) b!1361337))

(assert (= (and b!1361337 res!905485) b!1361339))

(assert (= (and b!1361339 res!905487) b!1361335))

(assert (= (and b!1361335 res!905484) b!1361334))

(assert (= (and b!1361334 res!905486) b!1361342))

(assert (= (and b!1361342 res!905482) b!1361340))

(assert (= (and b!1361340 res!905481) b!1361331))

(assert (= (and b!1361331 res!905491) b!1361330))

(assert (= (and b!1361330 res!905488) b!1361329))

(assert (= (and b!1361329 c!127364) b!1361343))

(assert (= (and b!1361329 (not c!127364)) b!1361336))

(assert (= (and b!1361329 res!905483) b!1361333))

(assert (= (and b!1361333 res!905492) b!1361332))

(assert (= (and b!1361332 res!905493) b!1361338))

(assert (= (and b!1361338 res!905490) b!1361344))

(assert (= (and b!1361344 res!905494) b!1361341))

(declare-fun m!1246453 () Bool)

(assert (=> b!1361338 m!1246453))

(declare-fun m!1246455 () Bool)

(assert (=> b!1361337 m!1246455))

(declare-fun m!1246457 () Bool)

(assert (=> b!1361343 m!1246457))

(declare-fun m!1246459 () Bool)

(assert (=> b!1361343 m!1246459))

(declare-fun m!1246461 () Bool)

(assert (=> b!1361343 m!1246461))

(declare-fun m!1246463 () Bool)

(assert (=> b!1361343 m!1246463))

(declare-fun m!1246465 () Bool)

(assert (=> b!1361343 m!1246465))

(assert (=> b!1361343 m!1246459))

(assert (=> b!1361343 m!1246461))

(declare-fun m!1246467 () Bool)

(assert (=> b!1361343 m!1246467))

(declare-fun m!1246469 () Bool)

(assert (=> b!1361331 m!1246469))

(declare-fun m!1246471 () Bool)

(assert (=> b!1361335 m!1246471))

(declare-fun m!1246473 () Bool)

(assert (=> start!114814 m!1246473))

(declare-fun m!1246475 () Bool)

(assert (=> b!1361334 m!1246475))

(assert (=> b!1361333 m!1246459))

(assert (=> b!1361333 m!1246459))

(assert (=> b!1361333 m!1246461))

(declare-fun m!1246477 () Bool)

(assert (=> b!1361341 m!1246477))

(assert (=> b!1361329 m!1246459))

(assert (=> b!1361329 m!1246459))

(declare-fun m!1246479 () Bool)

(assert (=> b!1361329 m!1246479))

(declare-fun m!1246481 () Bool)

(assert (=> b!1361342 m!1246481))

(declare-fun m!1246483 () Bool)

(assert (=> b!1361332 m!1246483))

(declare-fun m!1246485 () Bool)

(assert (=> b!1361344 m!1246485))

(declare-fun m!1246487 () Bool)

(assert (=> b!1361339 m!1246487))

(check-sat (not b!1361344) (not b!1361334) (not b!1361329) (not start!114814) (not b!1361338) (not b!1361343) (not b!1361337) (not b!1361331) (not b!1361341) (not b!1361335) (not b!1361333) (not b!1361342) (not b!1361339) (not b!1361332))
(check-sat)
(get-model)

(declare-fun d!145839 () Bool)

(declare-fun res!905541 () Bool)

(declare-fun e!772323 () Bool)

(assert (=> d!145839 (=> res!905541 e!772323)))

(get-info :version)

(assert (=> d!145839 (= res!905541 ((_ is Nil!31774) acc!759))))

(assert (=> d!145839 (= (noDuplicate!2343 acc!759) e!772323)))

(declare-fun b!1361397 () Bool)

(declare-fun e!772324 () Bool)

(assert (=> b!1361397 (= e!772323 e!772324)))

(declare-fun res!905542 () Bool)

(assert (=> b!1361397 (=> (not res!905542) (not e!772324))))

(assert (=> b!1361397 (= res!905542 (not (contains!9486 (t!46459 acc!759) (h!32982 acc!759))))))

(declare-fun b!1361398 () Bool)

(assert (=> b!1361398 (= e!772324 (noDuplicate!2343 (t!46459 acc!759)))))

(assert (= (and d!145839 (not res!905541)) b!1361397))

(assert (= (and b!1361397 res!905542) b!1361398))

(declare-fun m!1246525 () Bool)

(assert (=> b!1361397 m!1246525))

(declare-fun m!1246527 () Bool)

(assert (=> b!1361398 m!1246527))

(assert (=> b!1361337 d!145839))

(declare-fun d!145841 () Bool)

(declare-fun lt!600166 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!696 (List!31777) (InoxSet (_ BitVec 64)))

(assert (=> d!145841 (= lt!600166 (select (content!696 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772329 () Bool)

(assert (=> d!145841 (= lt!600166 e!772329)))

(declare-fun res!905547 () Bool)

(assert (=> d!145841 (=> (not res!905547) (not e!772329))))

(assert (=> d!145841 (= res!905547 ((_ is Cons!31773) acc!759))))

(assert (=> d!145841 (= (contains!9486 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600166)))

(declare-fun b!1361403 () Bool)

(declare-fun e!772330 () Bool)

(assert (=> b!1361403 (= e!772329 e!772330)))

(declare-fun res!905548 () Bool)

(assert (=> b!1361403 (=> res!905548 e!772330)))

(assert (=> b!1361403 (= res!905548 (= (h!32982 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361404 () Bool)

(assert (=> b!1361404 (= e!772330 (contains!9486 (t!46459 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145841 res!905547) b!1361403))

(assert (= (and b!1361403 (not res!905548)) b!1361404))

(declare-fun m!1246529 () Bool)

(assert (=> d!145841 m!1246529))

(declare-fun m!1246531 () Bool)

(assert (=> d!145841 m!1246531))

(declare-fun m!1246533 () Bool)

(assert (=> b!1361404 m!1246533))

(assert (=> b!1361339 d!145841))

(declare-fun d!145843 () Bool)

(assert (=> d!145843 (= (array_inv!33764 a!3742) (bvsge (size!45286 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114814 d!145843))

(declare-fun d!145845 () Bool)

(declare-fun lt!600167 () Bool)

(assert (=> d!145845 (= lt!600167 (select (content!696 lt!600147) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772331 () Bool)

(assert (=> d!145845 (= lt!600167 e!772331)))

(declare-fun res!905549 () Bool)

(assert (=> d!145845 (=> (not res!905549) (not e!772331))))

(assert (=> d!145845 (= res!905549 ((_ is Cons!31773) lt!600147))))

(assert (=> d!145845 (= (contains!9486 lt!600147 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600167)))

(declare-fun b!1361405 () Bool)

(declare-fun e!772332 () Bool)

(assert (=> b!1361405 (= e!772331 e!772332)))

(declare-fun res!905550 () Bool)

(assert (=> b!1361405 (=> res!905550 e!772332)))

(assert (=> b!1361405 (= res!905550 (= (h!32982 lt!600147) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361406 () Bool)

(assert (=> b!1361406 (= e!772332 (contains!9486 (t!46459 lt!600147) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145845 res!905549) b!1361405))

(assert (= (and b!1361405 (not res!905550)) b!1361406))

(declare-fun m!1246535 () Bool)

(assert (=> d!145845 m!1246535))

(declare-fun m!1246537 () Bool)

(assert (=> d!145845 m!1246537))

(declare-fun m!1246539 () Bool)

(assert (=> b!1361406 m!1246539))

(assert (=> b!1361338 d!145845))

(declare-fun d!145847 () Bool)

(assert (=> d!145847 (= (validKeyInArray!0 (select (arr!44736 a!3742) from!3120)) (and (not (= (select (arr!44736 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44736 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361329 d!145847))

(declare-fun d!145849 () Bool)

(assert (=> d!145849 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361331 d!145849))

(declare-fun d!145851 () Bool)

(declare-fun res!905571 () Bool)

(declare-fun e!772358 () Bool)

(assert (=> d!145851 (=> res!905571 e!772358)))

(assert (=> d!145851 (= res!905571 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45286 a!3742)))))

(assert (=> d!145851 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600147) e!772358)))

(declare-fun b!1361437 () Bool)

(declare-fun e!772359 () Bool)

(declare-fun call!65364 () Bool)

(assert (=> b!1361437 (= e!772359 call!65364)))

(declare-fun b!1361438 () Bool)

(declare-fun e!772360 () Bool)

(assert (=> b!1361438 (= e!772360 (contains!9486 lt!600147 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361439 () Bool)

(assert (=> b!1361439 (= e!772359 call!65364)))

(declare-fun b!1361440 () Bool)

(declare-fun e!772357 () Bool)

(assert (=> b!1361440 (= e!772358 e!772357)))

(declare-fun res!905570 () Bool)

(assert (=> b!1361440 (=> (not res!905570) (not e!772357))))

(assert (=> b!1361440 (= res!905570 (not e!772360))))

(declare-fun res!905569 () Bool)

(assert (=> b!1361440 (=> (not res!905569) (not e!772360))))

(assert (=> b!1361440 (= res!905569 (validKeyInArray!0 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65361 () Bool)

(declare-fun c!127374 () Bool)

(assert (=> bm!65361 (= call!65364 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127374 (Cons!31773 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600147) lt!600147)))))

(declare-fun b!1361441 () Bool)

(assert (=> b!1361441 (= e!772357 e!772359)))

(assert (=> b!1361441 (= c!127374 (validKeyInArray!0 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145851 (not res!905571)) b!1361440))

(assert (= (and b!1361440 res!905569) b!1361438))

(assert (= (and b!1361440 res!905570) b!1361441))

(assert (= (and b!1361441 c!127374) b!1361437))

(assert (= (and b!1361441 (not c!127374)) b!1361439))

(assert (= (or b!1361437 b!1361439) bm!65361))

(declare-fun m!1246541 () Bool)

(assert (=> b!1361438 m!1246541))

(assert (=> b!1361438 m!1246541))

(declare-fun m!1246543 () Bool)

(assert (=> b!1361438 m!1246543))

(assert (=> b!1361440 m!1246541))

(assert (=> b!1361440 m!1246541))

(declare-fun m!1246545 () Bool)

(assert (=> b!1361440 m!1246545))

(assert (=> bm!65361 m!1246541))

(declare-fun m!1246547 () Bool)

(assert (=> bm!65361 m!1246547))

(assert (=> b!1361441 m!1246541))

(assert (=> b!1361441 m!1246541))

(assert (=> b!1361441 m!1246545))

(assert (=> b!1361341 d!145851))

(declare-fun d!145857 () Bool)

(assert (=> d!145857 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600170 () Unit!44868)

(declare-fun choose!80 (array!92600 List!31777 List!31777 (_ BitVec 32)) Unit!44868)

(assert (=> d!145857 (= lt!600170 (choose!80 a!3742 ($colon$colon!891 acc!759 (select (arr!44736 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145857 (bvslt (size!45286 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145857 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!891 acc!759 (select (arr!44736 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600170)))

(declare-fun bs!39039 () Bool)

(assert (= bs!39039 d!145857))

(assert (=> bs!39039 m!1246465))

(assert (=> bs!39039 m!1246461))

(declare-fun m!1246565 () Bool)

(assert (=> bs!39039 m!1246565))

(assert (=> b!1361343 d!145857))

(declare-fun b!1361477 () Bool)

(declare-fun e!772395 () Bool)

(declare-fun e!772394 () Bool)

(assert (=> b!1361477 (= e!772395 e!772394)))

(declare-fun res!905601 () Bool)

(assert (=> b!1361477 (=> (not res!905601) (not e!772394))))

(assert (=> b!1361477 (= res!905601 ((_ is Cons!31773) acc!759))))

(declare-fun b!1361479 () Bool)

(declare-fun e!772393 () Bool)

(assert (=> b!1361479 (= e!772393 (subseq!888 (t!46459 acc!759) (t!46459 acc!759)))))

(declare-fun b!1361478 () Bool)

(declare-fun e!772396 () Bool)

(assert (=> b!1361478 (= e!772394 e!772396)))

(declare-fun res!905602 () Bool)

(assert (=> b!1361478 (=> res!905602 e!772396)))

(assert (=> b!1361478 (= res!905602 e!772393)))

(declare-fun res!905603 () Bool)

(assert (=> b!1361478 (=> (not res!905603) (not e!772393))))

(assert (=> b!1361478 (= res!905603 (= (h!32982 acc!759) (h!32982 acc!759)))))

(declare-fun b!1361480 () Bool)

(assert (=> b!1361480 (= e!772396 (subseq!888 acc!759 (t!46459 acc!759)))))

(declare-fun d!145861 () Bool)

(declare-fun res!905604 () Bool)

(assert (=> d!145861 (=> res!905604 e!772395)))

(assert (=> d!145861 (= res!905604 ((_ is Nil!31774) acc!759))))

(assert (=> d!145861 (= (subseq!888 acc!759 acc!759) e!772395)))

(assert (= (and d!145861 (not res!905604)) b!1361477))

(assert (= (and b!1361477 res!905601) b!1361478))

(assert (= (and b!1361478 res!905603) b!1361479))

(assert (= (and b!1361478 (not res!905602)) b!1361480))

(declare-fun m!1246577 () Bool)

(assert (=> b!1361479 m!1246577))

(declare-fun m!1246579 () Bool)

(assert (=> b!1361480 m!1246579))

(assert (=> b!1361343 d!145861))

(declare-fun d!145869 () Bool)

(declare-fun res!905609 () Bool)

(declare-fun e!772400 () Bool)

(assert (=> d!145869 (=> res!905609 e!772400)))

(assert (=> d!145869 (= res!905609 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45286 a!3742)))))

(assert (=> d!145869 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772400)))

(declare-fun b!1361483 () Bool)

(declare-fun e!772401 () Bool)

(declare-fun call!65368 () Bool)

(assert (=> b!1361483 (= e!772401 call!65368)))

(declare-fun e!772402 () Bool)

(declare-fun b!1361484 () Bool)

(assert (=> b!1361484 (= e!772402 (contains!9486 acc!759 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361485 () Bool)

(assert (=> b!1361485 (= e!772401 call!65368)))

(declare-fun b!1361486 () Bool)

(declare-fun e!772399 () Bool)

(assert (=> b!1361486 (= e!772400 e!772399)))

(declare-fun res!905608 () Bool)

(assert (=> b!1361486 (=> (not res!905608) (not e!772399))))

(assert (=> b!1361486 (= res!905608 (not e!772402))))

(declare-fun res!905607 () Bool)

(assert (=> b!1361486 (=> (not res!905607) (not e!772402))))

(assert (=> b!1361486 (= res!905607 (validKeyInArray!0 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65365 () Bool)

(declare-fun c!127378 () Bool)

(assert (=> bm!65365 (= call!65368 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127378 (Cons!31773 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1361487 () Bool)

(assert (=> b!1361487 (= e!772399 e!772401)))

(assert (=> b!1361487 (= c!127378 (validKeyInArray!0 (select (arr!44736 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145869 (not res!905609)) b!1361486))

(assert (= (and b!1361486 res!905607) b!1361484))

(assert (= (and b!1361486 res!905608) b!1361487))

(assert (= (and b!1361487 c!127378) b!1361483))

(assert (= (and b!1361487 (not c!127378)) b!1361485))

(assert (= (or b!1361483 b!1361485) bm!65365))

(assert (=> b!1361484 m!1246541))

(assert (=> b!1361484 m!1246541))

(declare-fun m!1246585 () Bool)

(assert (=> b!1361484 m!1246585))

(assert (=> b!1361486 m!1246541))

(assert (=> b!1361486 m!1246541))

(assert (=> b!1361486 m!1246545))

(assert (=> bm!65365 m!1246541))

(declare-fun m!1246587 () Bool)

(assert (=> bm!65365 m!1246587))

(assert (=> b!1361487 m!1246541))

(assert (=> b!1361487 m!1246541))

(assert (=> b!1361487 m!1246545))

(assert (=> b!1361343 d!145869))

(declare-fun d!145873 () Bool)

(assert (=> d!145873 (= ($colon$colon!891 acc!759 (select (arr!44736 a!3742) from!3120)) (Cons!31773 (select (arr!44736 a!3742) from!3120) acc!759))))

(assert (=> b!1361343 d!145873))

(declare-fun d!145877 () Bool)

(assert (=> d!145877 (subseq!888 acc!759 acc!759)))

(declare-fun lt!600178 () Unit!44868)

(declare-fun choose!36 (List!31777) Unit!44868)

(assert (=> d!145877 (= lt!600178 (choose!36 acc!759))))

(assert (=> d!145877 (= (lemmaListSubSeqRefl!0 acc!759) lt!600178)))

(declare-fun bs!39041 () Bool)

(assert (= bs!39041 d!145877))

(assert (=> bs!39041 m!1246467))

(declare-fun m!1246597 () Bool)

(assert (=> bs!39041 m!1246597))

(assert (=> b!1361343 d!145877))

(declare-fun d!145883 () Bool)

(declare-fun res!905621 () Bool)

(declare-fun e!772415 () Bool)

(assert (=> d!145883 (=> res!905621 e!772415)))

(assert (=> d!145883 (= res!905621 ((_ is Nil!31774) lt!600147))))

(assert (=> d!145883 (= (noDuplicate!2343 lt!600147) e!772415)))

(declare-fun b!1361501 () Bool)

(declare-fun e!772416 () Bool)

(assert (=> b!1361501 (= e!772415 e!772416)))

(declare-fun res!905622 () Bool)

(assert (=> b!1361501 (=> (not res!905622) (not e!772416))))

(assert (=> b!1361501 (= res!905622 (not (contains!9486 (t!46459 lt!600147) (h!32982 lt!600147))))))

(declare-fun b!1361502 () Bool)

(assert (=> b!1361502 (= e!772416 (noDuplicate!2343 (t!46459 lt!600147)))))

(assert (= (and d!145883 (not res!905621)) b!1361501))

(assert (= (and b!1361501 res!905622) b!1361502))

(declare-fun m!1246599 () Bool)

(assert (=> b!1361501 m!1246599))

(declare-fun m!1246601 () Bool)

(assert (=> b!1361502 m!1246601))

(assert (=> b!1361332 d!145883))

(declare-fun d!145885 () Bool)

(declare-fun res!905625 () Bool)

(declare-fun e!772418 () Bool)

(assert (=> d!145885 (=> res!905625 e!772418)))

(assert (=> d!145885 (= res!905625 (bvsge from!3120 (size!45286 a!3742)))))

(assert (=> d!145885 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772418)))

(declare-fun b!1361503 () Bool)

(declare-fun e!772419 () Bool)

(declare-fun call!65370 () Bool)

(assert (=> b!1361503 (= e!772419 call!65370)))

(declare-fun e!772420 () Bool)

(declare-fun b!1361504 () Bool)

(assert (=> b!1361504 (= e!772420 (contains!9486 acc!759 (select (arr!44736 a!3742) from!3120)))))

(declare-fun b!1361505 () Bool)

(assert (=> b!1361505 (= e!772419 call!65370)))

(declare-fun b!1361506 () Bool)

(declare-fun e!772417 () Bool)

(assert (=> b!1361506 (= e!772418 e!772417)))

(declare-fun res!905624 () Bool)

(assert (=> b!1361506 (=> (not res!905624) (not e!772417))))

(assert (=> b!1361506 (= res!905624 (not e!772420))))

(declare-fun res!905623 () Bool)

(assert (=> b!1361506 (=> (not res!905623) (not e!772420))))

(assert (=> b!1361506 (= res!905623 (validKeyInArray!0 (select (arr!44736 a!3742) from!3120)))))

(declare-fun c!127380 () Bool)

(declare-fun bm!65367 () Bool)

(assert (=> bm!65367 (= call!65370 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127380 (Cons!31773 (select (arr!44736 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1361507 () Bool)

(assert (=> b!1361507 (= e!772417 e!772419)))

(assert (=> b!1361507 (= c!127380 (validKeyInArray!0 (select (arr!44736 a!3742) from!3120)))))

(assert (= (and d!145885 (not res!905625)) b!1361506))

(assert (= (and b!1361506 res!905623) b!1361504))

(assert (= (and b!1361506 res!905624) b!1361507))

(assert (= (and b!1361507 c!127380) b!1361503))

(assert (= (and b!1361507 (not c!127380)) b!1361505))

(assert (= (or b!1361503 b!1361505) bm!65367))

(assert (=> b!1361504 m!1246459))

(assert (=> b!1361504 m!1246459))

(declare-fun m!1246603 () Bool)

(assert (=> b!1361504 m!1246603))

(assert (=> b!1361506 m!1246459))

(assert (=> b!1361506 m!1246459))

(assert (=> b!1361506 m!1246479))

(assert (=> bm!65367 m!1246459))

(declare-fun m!1246611 () Bool)

(assert (=> bm!65367 m!1246611))

(assert (=> b!1361507 m!1246459))

(assert (=> b!1361507 m!1246459))

(assert (=> b!1361507 m!1246479))

(assert (=> b!1361342 d!145885))

(declare-fun d!145891 () Bool)

(declare-fun lt!600183 () Bool)

(assert (=> d!145891 (= lt!600183 (select (content!696 lt!600147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772425 () Bool)

(assert (=> d!145891 (= lt!600183 e!772425)))

(declare-fun res!905630 () Bool)

(assert (=> d!145891 (=> (not res!905630) (not e!772425))))

(assert (=> d!145891 (= res!905630 ((_ is Cons!31773) lt!600147))))

(assert (=> d!145891 (= (contains!9486 lt!600147 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600183)))

(declare-fun b!1361512 () Bool)

(declare-fun e!772426 () Bool)

(assert (=> b!1361512 (= e!772425 e!772426)))

(declare-fun res!905631 () Bool)

(assert (=> b!1361512 (=> res!905631 e!772426)))

(assert (=> b!1361512 (= res!905631 (= (h!32982 lt!600147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361513 () Bool)

(assert (=> b!1361513 (= e!772426 (contains!9486 (t!46459 lt!600147) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145891 res!905630) b!1361512))

(assert (= (and b!1361512 (not res!905631)) b!1361513))

(assert (=> d!145891 m!1246535))

(declare-fun m!1246619 () Bool)

(assert (=> d!145891 m!1246619))

(declare-fun m!1246621 () Bool)

(assert (=> b!1361513 m!1246621))

(assert (=> b!1361344 d!145891))

(assert (=> b!1361333 d!145873))

(declare-fun d!145895 () Bool)

(declare-fun lt!600184 () Bool)

(assert (=> d!145895 (= lt!600184 (select (content!696 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772427 () Bool)

(assert (=> d!145895 (= lt!600184 e!772427)))

(declare-fun res!905632 () Bool)

(assert (=> d!145895 (=> (not res!905632) (not e!772427))))

(assert (=> d!145895 (= res!905632 ((_ is Cons!31773) acc!759))))

(assert (=> d!145895 (= (contains!9486 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600184)))

(declare-fun b!1361514 () Bool)

(declare-fun e!772428 () Bool)

(assert (=> b!1361514 (= e!772427 e!772428)))

(declare-fun res!905633 () Bool)

(assert (=> b!1361514 (=> res!905633 e!772428)))

(assert (=> b!1361514 (= res!905633 (= (h!32982 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361515 () Bool)

(assert (=> b!1361515 (= e!772428 (contains!9486 (t!46459 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145895 res!905632) b!1361514))

(assert (= (and b!1361514 (not res!905633)) b!1361515))

(assert (=> d!145895 m!1246529))

(declare-fun m!1246623 () Bool)

(assert (=> d!145895 m!1246623))

(declare-fun m!1246625 () Bool)

(assert (=> b!1361515 m!1246625))

(assert (=> b!1361335 d!145895))

(declare-fun d!145897 () Bool)

(declare-fun res!905636 () Bool)

(declare-fun e!772430 () Bool)

(assert (=> d!145897 (=> res!905636 e!772430)))

(assert (=> d!145897 (= res!905636 (bvsge #b00000000000000000000000000000000 (size!45286 a!3742)))))

(assert (=> d!145897 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31774) e!772430)))

(declare-fun b!1361516 () Bool)

(declare-fun e!772431 () Bool)

(declare-fun call!65371 () Bool)

(assert (=> b!1361516 (= e!772431 call!65371)))

(declare-fun b!1361517 () Bool)

(declare-fun e!772432 () Bool)

(assert (=> b!1361517 (= e!772432 (contains!9486 Nil!31774 (select (arr!44736 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361518 () Bool)

(assert (=> b!1361518 (= e!772431 call!65371)))

(declare-fun b!1361519 () Bool)

(declare-fun e!772429 () Bool)

(assert (=> b!1361519 (= e!772430 e!772429)))

(declare-fun res!905635 () Bool)

(assert (=> b!1361519 (=> (not res!905635) (not e!772429))))

(assert (=> b!1361519 (= res!905635 (not e!772432))))

(declare-fun res!905634 () Bool)

(assert (=> b!1361519 (=> (not res!905634) (not e!772432))))

(assert (=> b!1361519 (= res!905634 (validKeyInArray!0 (select (arr!44736 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65368 () Bool)

(declare-fun c!127381 () Bool)

(assert (=> bm!65368 (= call!65371 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127381 (Cons!31773 (select (arr!44736 a!3742) #b00000000000000000000000000000000) Nil!31774) Nil!31774)))))

(declare-fun b!1361520 () Bool)

(assert (=> b!1361520 (= e!772429 e!772431)))

(assert (=> b!1361520 (= c!127381 (validKeyInArray!0 (select (arr!44736 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145897 (not res!905636)) b!1361519))

(assert (= (and b!1361519 res!905634) b!1361517))

(assert (= (and b!1361519 res!905635) b!1361520))

(assert (= (and b!1361520 c!127381) b!1361516))

(assert (= (and b!1361520 (not c!127381)) b!1361518))

(assert (= (or b!1361516 b!1361518) bm!65368))

(declare-fun m!1246627 () Bool)

(assert (=> b!1361517 m!1246627))

(assert (=> b!1361517 m!1246627))

(declare-fun m!1246629 () Bool)

(assert (=> b!1361517 m!1246629))

(assert (=> b!1361519 m!1246627))

(assert (=> b!1361519 m!1246627))

(declare-fun m!1246635 () Bool)

(assert (=> b!1361519 m!1246635))

(assert (=> bm!65368 m!1246627))

(declare-fun m!1246639 () Bool)

(assert (=> bm!65368 m!1246639))

(assert (=> b!1361520 m!1246627))

(assert (=> b!1361520 m!1246627))

(assert (=> b!1361520 m!1246635))

(assert (=> b!1361334 d!145897))

(check-sat (not b!1361513) (not d!145841) (not d!145895) (not b!1361506) (not d!145891) (not b!1361507) (not b!1361398) (not b!1361504) (not d!145877) (not b!1361397) (not b!1361502) (not b!1361406) (not b!1361517) (not b!1361487) (not b!1361441) (not bm!65368) (not b!1361440) (not b!1361501) (not b!1361404) (not bm!65365) (not b!1361519) (not b!1361486) (not d!145857) (not b!1361484) (not bm!65361) (not bm!65367) (not b!1361438) (not b!1361520) (not b!1361479) (not d!145845) (not b!1361480) (not b!1361515))
(check-sat)
