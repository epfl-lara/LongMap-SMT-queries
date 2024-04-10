; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114298 () Bool)

(assert start!114298)

(declare-fun b!1357486 () Bool)

(declare-fun res!902225 () Bool)

(declare-fun e!770444 () Bool)

(assert (=> b!1357486 (=> (not res!902225) (not e!770444))))

(declare-datatypes ((List!31705 0))(
  ( (Nil!31702) (Cons!31701 (h!32910 (_ BitVec 64)) (t!46366 List!31705)) )
))
(declare-fun acc!759 () List!31705)

(declare-fun contains!9414 (List!31705 (_ BitVec 64)) Bool)

(assert (=> b!1357486 (= res!902225 (not (contains!9414 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357487 () Bool)

(declare-fun res!902229 () Bool)

(assert (=> b!1357487 (=> (not res!902229) (not e!770444))))

(assert (=> b!1357487 (= res!902229 (not (contains!9414 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357488 () Bool)

(declare-fun e!770446 () Bool)

(assert (=> b!1357488 (= e!770444 (not e!770446))))

(declare-fun res!902220 () Bool)

(assert (=> b!1357488 (=> res!902220 e!770446)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357488 (= res!902220 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((array!92435 0))(
  ( (array!92436 (arr!44664 (Array (_ BitVec 32) (_ BitVec 64))) (size!45214 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92435)

(declare-fun lt!599167 () List!31705)

(declare-fun $colon$colon!819 (List!31705 (_ BitVec 64)) List!31705)

(assert (=> b!1357488 (= lt!599167 ($colon$colon!819 acc!759 (select (arr!44664 a!3742) from!3120)))))

(declare-fun subseq!816 (List!31705 List!31705) Bool)

(assert (=> b!1357488 (subseq!816 acc!759 acc!759)))

(declare-datatypes ((Unit!44663 0))(
  ( (Unit!44664) )
))
(declare-fun lt!599166 () Unit!44663)

(declare-fun lemmaListSubSeqRefl!0 (List!31705) Unit!44663)

(assert (=> b!1357488 (= lt!599166 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357489 () Bool)

(declare-fun res!902228 () Bool)

(assert (=> b!1357489 (=> res!902228 e!770446)))

(declare-fun noDuplicate!2271 (List!31705) Bool)

(assert (=> b!1357489 (= res!902228 (not (noDuplicate!2271 lt!599167)))))

(declare-fun b!1357490 () Bool)

(declare-fun res!902222 () Bool)

(assert (=> b!1357490 (=> (not res!902222) (not e!770444))))

(declare-fun arrayNoDuplicates!0 (array!92435 (_ BitVec 32) List!31705) Bool)

(assert (=> b!1357490 (= res!902222 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31702))))

(declare-fun b!1357491 () Bool)

(declare-fun res!902218 () Bool)

(assert (=> b!1357491 (=> (not res!902218) (not e!770444))))

(assert (=> b!1357491 (= res!902218 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45214 a!3742)))))

(declare-fun b!1357492 () Bool)

(declare-fun e!770443 () Bool)

(assert (=> b!1357492 (= e!770443 (not (contains!9414 lt!599167 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357493 () Bool)

(assert (=> b!1357493 (= e!770446 e!770443)))

(declare-fun res!902224 () Bool)

(assert (=> b!1357493 (=> (not res!902224) (not e!770443))))

(assert (=> b!1357493 (= res!902224 (not (contains!9414 lt!599167 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357494 () Bool)

(declare-fun res!902230 () Bool)

(assert (=> b!1357494 (=> (not res!902230) (not e!770444))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357494 (= res!902230 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357496 () Bool)

(declare-fun res!902227 () Bool)

(assert (=> b!1357496 (=> (not res!902227) (not e!770444))))

(assert (=> b!1357496 (= res!902227 (validKeyInArray!0 (select (arr!44664 a!3742) from!3120)))))

(declare-fun b!1357497 () Bool)

(declare-fun res!902221 () Bool)

(assert (=> b!1357497 (=> (not res!902221) (not e!770444))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357497 (= res!902221 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45214 a!3742))))))

(declare-fun b!1357498 () Bool)

(declare-fun res!902219 () Bool)

(assert (=> b!1357498 (=> (not res!902219) (not e!770444))))

(assert (=> b!1357498 (= res!902219 (noDuplicate!2271 acc!759))))

(declare-fun res!902223 () Bool)

(assert (=> start!114298 (=> (not res!902223) (not e!770444))))

(assert (=> start!114298 (= res!902223 (and (bvslt (size!45214 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45214 a!3742))))))

(assert (=> start!114298 e!770444))

(assert (=> start!114298 true))

(declare-fun array_inv!33692 (array!92435) Bool)

(assert (=> start!114298 (array_inv!33692 a!3742)))

(declare-fun b!1357495 () Bool)

(declare-fun res!902226 () Bool)

(assert (=> b!1357495 (=> (not res!902226) (not e!770444))))

(assert (=> b!1357495 (= res!902226 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114298 res!902223) b!1357498))

(assert (= (and b!1357498 res!902219) b!1357487))

(assert (= (and b!1357487 res!902229) b!1357486))

(assert (= (and b!1357486 res!902225) b!1357490))

(assert (= (and b!1357490 res!902222) b!1357495))

(assert (= (and b!1357495 res!902226) b!1357497))

(assert (= (and b!1357497 res!902221) b!1357494))

(assert (= (and b!1357494 res!902230) b!1357491))

(assert (= (and b!1357491 res!902218) b!1357496))

(assert (= (and b!1357496 res!902227) b!1357488))

(assert (= (and b!1357488 (not res!902220)) b!1357489))

(assert (= (and b!1357489 (not res!902228)) b!1357493))

(assert (= (and b!1357493 res!902224) b!1357492))

(declare-fun m!1243213 () Bool)

(assert (=> b!1357492 m!1243213))

(declare-fun m!1243215 () Bool)

(assert (=> b!1357486 m!1243215))

(declare-fun m!1243217 () Bool)

(assert (=> b!1357488 m!1243217))

(assert (=> b!1357488 m!1243217))

(declare-fun m!1243219 () Bool)

(assert (=> b!1357488 m!1243219))

(declare-fun m!1243221 () Bool)

(assert (=> b!1357488 m!1243221))

(declare-fun m!1243223 () Bool)

(assert (=> b!1357488 m!1243223))

(declare-fun m!1243225 () Bool)

(assert (=> b!1357495 m!1243225))

(declare-fun m!1243227 () Bool)

(assert (=> b!1357494 m!1243227))

(declare-fun m!1243229 () Bool)

(assert (=> b!1357490 m!1243229))

(declare-fun m!1243231 () Bool)

(assert (=> b!1357487 m!1243231))

(declare-fun m!1243233 () Bool)

(assert (=> b!1357489 m!1243233))

(assert (=> b!1357496 m!1243217))

(assert (=> b!1357496 m!1243217))

(declare-fun m!1243235 () Bool)

(assert (=> b!1357496 m!1243235))

(declare-fun m!1243237 () Bool)

(assert (=> b!1357493 m!1243237))

(declare-fun m!1243239 () Bool)

(assert (=> start!114298 m!1243239))

(declare-fun m!1243241 () Bool)

(assert (=> b!1357498 m!1243241))

(check-sat (not start!114298) (not b!1357490) (not b!1357493) (not b!1357488) (not b!1357495) (not b!1357487) (not b!1357492) (not b!1357496) (not b!1357486) (not b!1357489) (not b!1357498) (not b!1357494))
(check-sat)
(get-model)

(declare-fun b!1357548 () Bool)

(declare-fun e!770468 () Bool)

(declare-fun e!770467 () Bool)

(assert (=> b!1357548 (= e!770468 e!770467)))

(declare-fun res!902277 () Bool)

(assert (=> b!1357548 (=> (not res!902277) (not e!770467))))

(declare-fun e!770469 () Bool)

(assert (=> b!1357548 (= res!902277 (not e!770469))))

(declare-fun res!902278 () Bool)

(assert (=> b!1357548 (=> (not res!902278) (not e!770469))))

(assert (=> b!1357548 (= res!902278 (validKeyInArray!0 (select (arr!44664 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357550 () Bool)

(declare-fun e!770470 () Bool)

(declare-fun call!65255 () Bool)

(assert (=> b!1357550 (= e!770470 call!65255)))

(declare-fun bm!65252 () Bool)

(declare-fun c!127076 () Bool)

(assert (=> bm!65252 (= call!65255 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127076 (Cons!31701 (select (arr!44664 a!3742) #b00000000000000000000000000000000) Nil!31702) Nil!31702)))))

(declare-fun b!1357551 () Bool)

(assert (=> b!1357551 (= e!770470 call!65255)))

(declare-fun b!1357552 () Bool)

(assert (=> b!1357552 (= e!770469 (contains!9414 Nil!31702 (select (arr!44664 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357549 () Bool)

(assert (=> b!1357549 (= e!770467 e!770470)))

(assert (=> b!1357549 (= c!127076 (validKeyInArray!0 (select (arr!44664 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145161 () Bool)

(declare-fun res!902276 () Bool)

(assert (=> d!145161 (=> res!902276 e!770468)))

(assert (=> d!145161 (= res!902276 (bvsge #b00000000000000000000000000000000 (size!45214 a!3742)))))

(assert (=> d!145161 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31702) e!770468)))

(assert (= (and d!145161 (not res!902276)) b!1357548))

(assert (= (and b!1357548 res!902278) b!1357552))

(assert (= (and b!1357548 res!902277) b!1357549))

(assert (= (and b!1357549 c!127076) b!1357550))

(assert (= (and b!1357549 (not c!127076)) b!1357551))

(assert (= (or b!1357550 b!1357551) bm!65252))

(declare-fun m!1243273 () Bool)

(assert (=> b!1357548 m!1243273))

(assert (=> b!1357548 m!1243273))

(declare-fun m!1243275 () Bool)

(assert (=> b!1357548 m!1243275))

(assert (=> bm!65252 m!1243273))

(declare-fun m!1243277 () Bool)

(assert (=> bm!65252 m!1243277))

(assert (=> b!1357552 m!1243273))

(assert (=> b!1357552 m!1243273))

(declare-fun m!1243279 () Bool)

(assert (=> b!1357552 m!1243279))

(assert (=> b!1357549 m!1243273))

(assert (=> b!1357549 m!1243273))

(assert (=> b!1357549 m!1243275))

(assert (=> b!1357490 d!145161))

(declare-fun d!145163 () Bool)

(assert (=> d!145163 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357494 d!145163))

(declare-fun d!145165 () Bool)

(declare-fun lt!599176 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!676 (List!31705) (InoxSet (_ BitVec 64)))

(assert (=> d!145165 (= lt!599176 (select (content!676 lt!599167) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770475 () Bool)

(assert (=> d!145165 (= lt!599176 e!770475)))

(declare-fun res!902284 () Bool)

(assert (=> d!145165 (=> (not res!902284) (not e!770475))))

(get-info :version)

(assert (=> d!145165 (= res!902284 ((_ is Cons!31701) lt!599167))))

(assert (=> d!145165 (= (contains!9414 lt!599167 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599176)))

(declare-fun b!1357557 () Bool)

(declare-fun e!770476 () Bool)

(assert (=> b!1357557 (= e!770475 e!770476)))

(declare-fun res!902283 () Bool)

(assert (=> b!1357557 (=> res!902283 e!770476)))

(assert (=> b!1357557 (= res!902283 (= (h!32910 lt!599167) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357558 () Bool)

(assert (=> b!1357558 (= e!770476 (contains!9414 (t!46366 lt!599167) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145165 res!902284) b!1357557))

(assert (= (and b!1357557 (not res!902283)) b!1357558))

(declare-fun m!1243281 () Bool)

(assert (=> d!145165 m!1243281))

(declare-fun m!1243283 () Bool)

(assert (=> d!145165 m!1243283))

(declare-fun m!1243285 () Bool)

(assert (=> b!1357558 m!1243285))

(assert (=> b!1357492 d!145165))

(declare-fun d!145167 () Bool)

(declare-fun lt!599177 () Bool)

(assert (=> d!145167 (= lt!599177 (select (content!676 lt!599167) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770477 () Bool)

(assert (=> d!145167 (= lt!599177 e!770477)))

(declare-fun res!902286 () Bool)

(assert (=> d!145167 (=> (not res!902286) (not e!770477))))

(assert (=> d!145167 (= res!902286 ((_ is Cons!31701) lt!599167))))

(assert (=> d!145167 (= (contains!9414 lt!599167 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599177)))

(declare-fun b!1357559 () Bool)

(declare-fun e!770478 () Bool)

(assert (=> b!1357559 (= e!770477 e!770478)))

(declare-fun res!902285 () Bool)

(assert (=> b!1357559 (=> res!902285 e!770478)))

(assert (=> b!1357559 (= res!902285 (= (h!32910 lt!599167) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357560 () Bool)

(assert (=> b!1357560 (= e!770478 (contains!9414 (t!46366 lt!599167) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145167 res!902286) b!1357559))

(assert (= (and b!1357559 (not res!902285)) b!1357560))

(assert (=> d!145167 m!1243281))

(declare-fun m!1243287 () Bool)

(assert (=> d!145167 m!1243287))

(declare-fun m!1243289 () Bool)

(assert (=> b!1357560 m!1243289))

(assert (=> b!1357493 d!145167))

(declare-fun d!145169 () Bool)

(assert (=> d!145169 (= (validKeyInArray!0 (select (arr!44664 a!3742) from!3120)) (and (not (= (select (arr!44664 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44664 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357496 d!145169))

(declare-fun d!145171 () Bool)

(declare-fun lt!599178 () Bool)

(assert (=> d!145171 (= lt!599178 (select (content!676 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770479 () Bool)

(assert (=> d!145171 (= lt!599178 e!770479)))

(declare-fun res!902288 () Bool)

(assert (=> d!145171 (=> (not res!902288) (not e!770479))))

(assert (=> d!145171 (= res!902288 ((_ is Cons!31701) acc!759))))

(assert (=> d!145171 (= (contains!9414 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599178)))

(declare-fun b!1357561 () Bool)

(declare-fun e!770480 () Bool)

(assert (=> b!1357561 (= e!770479 e!770480)))

(declare-fun res!902287 () Bool)

(assert (=> b!1357561 (=> res!902287 e!770480)))

(assert (=> b!1357561 (= res!902287 (= (h!32910 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357562 () Bool)

(assert (=> b!1357562 (= e!770480 (contains!9414 (t!46366 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145171 res!902288) b!1357561))

(assert (= (and b!1357561 (not res!902287)) b!1357562))

(declare-fun m!1243291 () Bool)

(assert (=> d!145171 m!1243291))

(declare-fun m!1243293 () Bool)

(assert (=> d!145171 m!1243293))

(declare-fun m!1243295 () Bool)

(assert (=> b!1357562 m!1243295))

(assert (=> b!1357486 d!145171))

(declare-fun b!1357563 () Bool)

(declare-fun e!770482 () Bool)

(declare-fun e!770481 () Bool)

(assert (=> b!1357563 (= e!770482 e!770481)))

(declare-fun res!902290 () Bool)

(assert (=> b!1357563 (=> (not res!902290) (not e!770481))))

(declare-fun e!770483 () Bool)

(assert (=> b!1357563 (= res!902290 (not e!770483))))

(declare-fun res!902291 () Bool)

(assert (=> b!1357563 (=> (not res!902291) (not e!770483))))

(assert (=> b!1357563 (= res!902291 (validKeyInArray!0 (select (arr!44664 a!3742) from!3120)))))

(declare-fun b!1357565 () Bool)

(declare-fun e!770484 () Bool)

(declare-fun call!65256 () Bool)

(assert (=> b!1357565 (= e!770484 call!65256)))

(declare-fun c!127077 () Bool)

(declare-fun bm!65253 () Bool)

(assert (=> bm!65253 (= call!65256 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127077 (Cons!31701 (select (arr!44664 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1357566 () Bool)

(assert (=> b!1357566 (= e!770484 call!65256)))

(declare-fun b!1357567 () Bool)

(assert (=> b!1357567 (= e!770483 (contains!9414 acc!759 (select (arr!44664 a!3742) from!3120)))))

(declare-fun b!1357564 () Bool)

(assert (=> b!1357564 (= e!770481 e!770484)))

(assert (=> b!1357564 (= c!127077 (validKeyInArray!0 (select (arr!44664 a!3742) from!3120)))))

(declare-fun d!145173 () Bool)

(declare-fun res!902289 () Bool)

(assert (=> d!145173 (=> res!902289 e!770482)))

(assert (=> d!145173 (= res!902289 (bvsge from!3120 (size!45214 a!3742)))))

(assert (=> d!145173 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770482)))

(assert (= (and d!145173 (not res!902289)) b!1357563))

(assert (= (and b!1357563 res!902291) b!1357567))

(assert (= (and b!1357563 res!902290) b!1357564))

(assert (= (and b!1357564 c!127077) b!1357565))

(assert (= (and b!1357564 (not c!127077)) b!1357566))

(assert (= (or b!1357565 b!1357566) bm!65253))

(assert (=> b!1357563 m!1243217))

(assert (=> b!1357563 m!1243217))

(assert (=> b!1357563 m!1243235))

(assert (=> bm!65253 m!1243217))

(declare-fun m!1243297 () Bool)

(assert (=> bm!65253 m!1243297))

(assert (=> b!1357567 m!1243217))

(assert (=> b!1357567 m!1243217))

(declare-fun m!1243299 () Bool)

(assert (=> b!1357567 m!1243299))

(assert (=> b!1357564 m!1243217))

(assert (=> b!1357564 m!1243217))

(assert (=> b!1357564 m!1243235))

(assert (=> b!1357495 d!145173))

(declare-fun d!145177 () Bool)

(assert (=> d!145177 (= ($colon$colon!819 acc!759 (select (arr!44664 a!3742) from!3120)) (Cons!31701 (select (arr!44664 a!3742) from!3120) acc!759))))

(assert (=> b!1357488 d!145177))

(declare-fun d!145179 () Bool)

(declare-fun res!902315 () Bool)

(declare-fun e!770507 () Bool)

(assert (=> d!145179 (=> res!902315 e!770507)))

(assert (=> d!145179 (= res!902315 ((_ is Nil!31702) acc!759))))

(assert (=> d!145179 (= (subseq!816 acc!759 acc!759) e!770507)))

(declare-fun b!1357589 () Bool)

(declare-fun e!770504 () Bool)

(declare-fun e!770505 () Bool)

(assert (=> b!1357589 (= e!770504 e!770505)))

(declare-fun res!902313 () Bool)

(assert (=> b!1357589 (=> res!902313 e!770505)))

(declare-fun e!770508 () Bool)

(assert (=> b!1357589 (= res!902313 e!770508)))

(declare-fun res!902312 () Bool)

(assert (=> b!1357589 (=> (not res!902312) (not e!770508))))

(assert (=> b!1357589 (= res!902312 (= (h!32910 acc!759) (h!32910 acc!759)))))

(declare-fun b!1357590 () Bool)

(assert (=> b!1357590 (= e!770508 (subseq!816 (t!46366 acc!759) (t!46366 acc!759)))))

(declare-fun b!1357588 () Bool)

(assert (=> b!1357588 (= e!770507 e!770504)))

(declare-fun res!902314 () Bool)

(assert (=> b!1357588 (=> (not res!902314) (not e!770504))))

(assert (=> b!1357588 (= res!902314 ((_ is Cons!31701) acc!759))))

(declare-fun b!1357591 () Bool)

(assert (=> b!1357591 (= e!770505 (subseq!816 acc!759 (t!46366 acc!759)))))

(assert (= (and d!145179 (not res!902315)) b!1357588))

(assert (= (and b!1357588 res!902314) b!1357589))

(assert (= (and b!1357589 res!902312) b!1357590))

(assert (= (and b!1357589 (not res!902313)) b!1357591))

(declare-fun m!1243311 () Bool)

(assert (=> b!1357590 m!1243311))

(declare-fun m!1243313 () Bool)

(assert (=> b!1357591 m!1243313))

(assert (=> b!1357488 d!145179))

(declare-fun d!145189 () Bool)

(assert (=> d!145189 (subseq!816 acc!759 acc!759)))

(declare-fun lt!599184 () Unit!44663)

(declare-fun choose!36 (List!31705) Unit!44663)

(assert (=> d!145189 (= lt!599184 (choose!36 acc!759))))

(assert (=> d!145189 (= (lemmaListSubSeqRefl!0 acc!759) lt!599184)))

(declare-fun bs!38934 () Bool)

(assert (= bs!38934 d!145189))

(assert (=> bs!38934 m!1243221))

(declare-fun m!1243319 () Bool)

(assert (=> bs!38934 m!1243319))

(assert (=> b!1357488 d!145189))

(declare-fun d!145193 () Bool)

(declare-fun res!902340 () Bool)

(declare-fun e!770533 () Bool)

(assert (=> d!145193 (=> res!902340 e!770533)))

(assert (=> d!145193 (= res!902340 ((_ is Nil!31702) lt!599167))))

(assert (=> d!145193 (= (noDuplicate!2271 lt!599167) e!770533)))

(declare-fun b!1357618 () Bool)

(declare-fun e!770534 () Bool)

(assert (=> b!1357618 (= e!770533 e!770534)))

(declare-fun res!902341 () Bool)

(assert (=> b!1357618 (=> (not res!902341) (not e!770534))))

(assert (=> b!1357618 (= res!902341 (not (contains!9414 (t!46366 lt!599167) (h!32910 lt!599167))))))

(declare-fun b!1357619 () Bool)

(assert (=> b!1357619 (= e!770534 (noDuplicate!2271 (t!46366 lt!599167)))))

(assert (= (and d!145193 (not res!902340)) b!1357618))

(assert (= (and b!1357618 res!902341) b!1357619))

(declare-fun m!1243325 () Bool)

(assert (=> b!1357618 m!1243325))

(declare-fun m!1243327 () Bool)

(assert (=> b!1357619 m!1243327))

(assert (=> b!1357489 d!145193))

(declare-fun d!145197 () Bool)

(declare-fun lt!599187 () Bool)

(assert (=> d!145197 (= lt!599187 (select (content!676 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770537 () Bool)

(assert (=> d!145197 (= lt!599187 e!770537)))

(declare-fun res!902343 () Bool)

(assert (=> d!145197 (=> (not res!902343) (not e!770537))))

(assert (=> d!145197 (= res!902343 ((_ is Cons!31701) acc!759))))

(assert (=> d!145197 (= (contains!9414 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599187)))

(declare-fun b!1357622 () Bool)

(declare-fun e!770538 () Bool)

(assert (=> b!1357622 (= e!770537 e!770538)))

(declare-fun res!902342 () Bool)

(assert (=> b!1357622 (=> res!902342 e!770538)))

(assert (=> b!1357622 (= res!902342 (= (h!32910 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357623 () Bool)

(assert (=> b!1357623 (= e!770538 (contains!9414 (t!46366 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145197 res!902343) b!1357622))

(assert (= (and b!1357622 (not res!902342)) b!1357623))

(assert (=> d!145197 m!1243291))

(declare-fun m!1243329 () Bool)

(assert (=> d!145197 m!1243329))

(declare-fun m!1243331 () Bool)

(assert (=> b!1357623 m!1243331))

(assert (=> b!1357487 d!145197))

(declare-fun d!145199 () Bool)

(assert (=> d!145199 (= (array_inv!33692 a!3742) (bvsge (size!45214 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114298 d!145199))

(declare-fun d!145205 () Bool)

(declare-fun res!902346 () Bool)

(declare-fun e!770541 () Bool)

(assert (=> d!145205 (=> res!902346 e!770541)))

(assert (=> d!145205 (= res!902346 ((_ is Nil!31702) acc!759))))

(assert (=> d!145205 (= (noDuplicate!2271 acc!759) e!770541)))

(declare-fun b!1357626 () Bool)

(declare-fun e!770542 () Bool)

(assert (=> b!1357626 (= e!770541 e!770542)))

(declare-fun res!902347 () Bool)

(assert (=> b!1357626 (=> (not res!902347) (not e!770542))))

(assert (=> b!1357626 (= res!902347 (not (contains!9414 (t!46366 acc!759) (h!32910 acc!759))))))

(declare-fun b!1357627 () Bool)

(assert (=> b!1357627 (= e!770542 (noDuplicate!2271 (t!46366 acc!759)))))

(assert (= (and d!145205 (not res!902346)) b!1357626))

(assert (= (and b!1357626 res!902347) b!1357627))

(declare-fun m!1243341 () Bool)

(assert (=> b!1357626 m!1243341))

(declare-fun m!1243343 () Bool)

(assert (=> b!1357627 m!1243343))

(assert (=> b!1357498 d!145205))

(check-sat (not d!145171) (not b!1357564) (not bm!65252) (not b!1357560) (not b!1357618) (not d!145197) (not d!145189) (not b!1357627) (not d!145165) (not b!1357626) (not b!1357552) (not d!145167) (not b!1357563) (not b!1357549) (not b!1357567) (not b!1357619) (not b!1357590) (not bm!65253) (not b!1357548) (not b!1357562) (not b!1357623) (not b!1357558) (not b!1357591))
(check-sat)
