; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114812 () Bool)

(assert start!114812)

(declare-fun b!1361281 () Bool)

(declare-fun res!905448 () Bool)

(declare-fun e!772288 () Bool)

(assert (=> b!1361281 (=> (not res!905448) (not e!772288))))

(declare-datatypes ((List!31776 0))(
  ( (Nil!31773) (Cons!31772 (h!32981 (_ BitVec 64)) (t!46458 List!31776)) )
))
(declare-fun acc!759 () List!31776)

(declare-datatypes ((array!92598 0))(
  ( (array!92599 (arr!44735 (Array (_ BitVec 32) (_ BitVec 64))) (size!45285 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92598)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92598 (_ BitVec 32) List!31776) Bool)

(assert (=> b!1361281 (= res!905448 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361282 () Bool)

(declare-fun res!905441 () Bool)

(assert (=> b!1361282 (=> (not res!905441) (not e!772288))))

(declare-fun contains!9485 (List!31776 (_ BitVec 64)) Bool)

(assert (=> b!1361282 (= res!905441 (not (contains!9485 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361283 () Bool)

(declare-fun res!905440 () Bool)

(assert (=> b!1361283 (=> (not res!905440) (not e!772288))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361283 (= res!905440 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361284 () Bool)

(declare-fun res!905439 () Bool)

(assert (=> b!1361284 (=> (not res!905439) (not e!772288))))

(declare-fun noDuplicate!2342 (List!31776) Bool)

(assert (=> b!1361284 (= res!905439 (noDuplicate!2342 acc!759))))

(declare-fun b!1361285 () Bool)

(declare-fun res!905447 () Bool)

(assert (=> b!1361285 (=> (not res!905447) (not e!772288))))

(assert (=> b!1361285 (= res!905447 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45285 a!3742)))))

(declare-fun b!1361287 () Bool)

(declare-fun res!905451 () Bool)

(declare-fun e!772286 () Bool)

(assert (=> b!1361287 (=> (not res!905451) (not e!772286))))

(declare-fun lt!600132 () List!31776)

(assert (=> b!1361287 (= res!905451 (noDuplicate!2342 lt!600132))))

(declare-fun b!1361288 () Bool)

(declare-fun res!905452 () Bool)

(assert (=> b!1361288 (=> (not res!905452) (not e!772288))))

(assert (=> b!1361288 (= res!905452 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31773))))

(declare-fun b!1361289 () Bool)

(declare-fun res!905442 () Bool)

(assert (=> b!1361289 (=> (not res!905442) (not e!772286))))

(assert (=> b!1361289 (= res!905442 (not (contains!9485 lt!600132 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361290 () Bool)

(declare-fun e!772287 () Bool)

(assert (=> b!1361290 (= e!772288 e!772287)))

(declare-fun res!905444 () Bool)

(assert (=> b!1361290 (=> (not res!905444) (not e!772287))))

(declare-fun lt!600129 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361290 (= res!905444 (and (not (= from!3120 i!1404)) lt!600129))))

(declare-datatypes ((Unit!44865 0))(
  ( (Unit!44866) )
))
(declare-fun lt!600130 () Unit!44865)

(declare-fun e!772284 () Unit!44865)

(assert (=> b!1361290 (= lt!600130 e!772284)))

(declare-fun c!127361 () Bool)

(assert (=> b!1361290 (= c!127361 lt!600129)))

(assert (=> b!1361290 (= lt!600129 (validKeyInArray!0 (select (arr!44735 a!3742) from!3120)))))

(declare-fun b!1361291 () Bool)

(declare-fun res!905449 () Bool)

(assert (=> b!1361291 (=> (not res!905449) (not e!772288))))

(assert (=> b!1361291 (= res!905449 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45285 a!3742))))))

(declare-fun b!1361292 () Bool)

(declare-fun res!905445 () Bool)

(assert (=> b!1361292 (=> (not res!905445) (not e!772286))))

(assert (=> b!1361292 (= res!905445 (not (contains!9485 lt!600132 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361293 () Bool)

(declare-fun Unit!44867 () Unit!44865)

(assert (=> b!1361293 (= e!772284 Unit!44867)))

(declare-fun b!1361294 () Bool)

(assert (=> b!1361294 (= e!772287 e!772286)))

(declare-fun res!905450 () Bool)

(assert (=> b!1361294 (=> (not res!905450) (not e!772286))))

(assert (=> b!1361294 (= res!905450 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!890 (List!31776 (_ BitVec 64)) List!31776)

(assert (=> b!1361294 (= lt!600132 ($colon$colon!890 acc!759 (select (arr!44735 a!3742) from!3120)))))

(declare-fun b!1361286 () Bool)

(assert (=> b!1361286 (= e!772286 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600132)))))

(declare-fun res!905443 () Bool)

(assert (=> start!114812 (=> (not res!905443) (not e!772288))))

(assert (=> start!114812 (= res!905443 (and (bvslt (size!45285 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45285 a!3742))))))

(assert (=> start!114812 e!772288))

(assert (=> start!114812 true))

(declare-fun array_inv!33763 (array!92598) Bool)

(assert (=> start!114812 (array_inv!33763 a!3742)))

(declare-fun b!1361295 () Bool)

(declare-fun res!905446 () Bool)

(assert (=> b!1361295 (=> (not res!905446) (not e!772288))))

(assert (=> b!1361295 (= res!905446 (not (contains!9485 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361296 () Bool)

(declare-fun lt!600131 () Unit!44865)

(assert (=> b!1361296 (= e!772284 lt!600131)))

(declare-fun lt!600133 () Unit!44865)

(declare-fun lemmaListSubSeqRefl!0 (List!31776) Unit!44865)

(assert (=> b!1361296 (= lt!600133 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!887 (List!31776 List!31776) Bool)

(assert (=> b!1361296 (subseq!887 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92598 List!31776 List!31776 (_ BitVec 32)) Unit!44865)

(assert (=> b!1361296 (= lt!600131 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!890 acc!759 (select (arr!44735 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361296 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(assert (= (and start!114812 res!905443) b!1361284))

(assert (= (and b!1361284 res!905439) b!1361282))

(assert (= (and b!1361282 res!905441) b!1361295))

(assert (= (and b!1361295 res!905446) b!1361288))

(assert (= (and b!1361288 res!905452) b!1361281))

(assert (= (and b!1361281 res!905448) b!1361291))

(assert (= (and b!1361291 res!905449) b!1361283))

(assert (= (and b!1361283 res!905440) b!1361285))

(assert (= (and b!1361285 res!905447) b!1361290))

(assert (= (and b!1361290 c!127361) b!1361296))

(assert (= (and b!1361290 (not c!127361)) b!1361293))

(assert (= (and b!1361290 res!905444) b!1361294))

(assert (= (and b!1361294 res!905450) b!1361287))

(assert (= (and b!1361287 res!905451) b!1361289))

(assert (= (and b!1361289 res!905442) b!1361292))

(assert (= (and b!1361292 res!905445) b!1361286))

(declare-fun m!1246417 () Bool)

(assert (=> b!1361282 m!1246417))

(declare-fun m!1246419 () Bool)

(assert (=> start!114812 m!1246419))

(declare-fun m!1246421 () Bool)

(assert (=> b!1361289 m!1246421))

(declare-fun m!1246423 () Bool)

(assert (=> b!1361283 m!1246423))

(declare-fun m!1246425 () Bool)

(assert (=> b!1361290 m!1246425))

(assert (=> b!1361290 m!1246425))

(declare-fun m!1246427 () Bool)

(assert (=> b!1361290 m!1246427))

(declare-fun m!1246429 () Bool)

(assert (=> b!1361296 m!1246429))

(assert (=> b!1361296 m!1246425))

(declare-fun m!1246431 () Bool)

(assert (=> b!1361296 m!1246431))

(declare-fun m!1246433 () Bool)

(assert (=> b!1361296 m!1246433))

(declare-fun m!1246435 () Bool)

(assert (=> b!1361296 m!1246435))

(assert (=> b!1361296 m!1246425))

(assert (=> b!1361296 m!1246431))

(declare-fun m!1246437 () Bool)

(assert (=> b!1361296 m!1246437))

(declare-fun m!1246439 () Bool)

(assert (=> b!1361292 m!1246439))

(declare-fun m!1246441 () Bool)

(assert (=> b!1361295 m!1246441))

(declare-fun m!1246443 () Bool)

(assert (=> b!1361284 m!1246443))

(declare-fun m!1246445 () Bool)

(assert (=> b!1361288 m!1246445))

(declare-fun m!1246447 () Bool)

(assert (=> b!1361281 m!1246447))

(declare-fun m!1246449 () Bool)

(assert (=> b!1361287 m!1246449))

(assert (=> b!1361294 m!1246425))

(assert (=> b!1361294 m!1246425))

(assert (=> b!1361294 m!1246431))

(declare-fun m!1246451 () Bool)

(assert (=> b!1361286 m!1246451))

(push 1)

(assert (not b!1361282))

(assert (not b!1361281))

(assert (not b!1361287))

(assert (not b!1361294))

(assert (not start!114812))

(assert (not b!1361292))

(assert (not b!1361283))

(assert (not b!1361290))

(assert (not b!1361286))

(assert (not b!1361284))

(assert (not b!1361289))

(assert (not b!1361295))

(assert (not b!1361288))

(assert (not b!1361296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1361442 () Bool)

(declare-fun e!772362 () Bool)

(declare-fun e!772361 () Bool)

(assert (=> b!1361442 (= e!772362 e!772361)))

(declare-fun c!127375 () Bool)

(assert (=> b!1361442 (= c!127375 (validKeyInArray!0 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361443 () Bool)

(declare-fun call!65365 () Bool)

(assert (=> b!1361443 (= e!772361 call!65365)))

(declare-fun b!1361444 () Bool)

(declare-fun e!772364 () Bool)

(assert (=> b!1361444 (= e!772364 (contains!9485 lt!600132 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361445 () Bool)

(assert (=> b!1361445 (= e!772361 call!65365)))

(declare-fun bm!65362 () Bool)

(assert (=> bm!65362 (= call!65365 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127375 (Cons!31772 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!600132) lt!600132)))))

(declare-fun d!145855 () Bool)

(declare-fun res!905573 () Bool)

(declare-fun e!772363 () Bool)

(assert (=> d!145855 (=> res!905573 e!772363)))

(assert (=> d!145855 (= res!905573 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45285 a!3742)))))

(assert (=> d!145855 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600132) e!772363)))

(declare-fun b!1361446 () Bool)

(assert (=> b!1361446 (= e!772363 e!772362)))

(declare-fun res!905572 () Bool)

(assert (=> b!1361446 (=> (not res!905572) (not e!772362))))

(assert (=> b!1361446 (= res!905572 (not e!772364))))

(declare-fun res!905574 () Bool)

(assert (=> b!1361446 (=> (not res!905574) (not e!772364))))

(assert (=> b!1361446 (= res!905574 (validKeyInArray!0 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145855 (not res!905573)) b!1361446))

(assert (= (and b!1361446 res!905574) b!1361444))

(assert (= (and b!1361446 res!905572) b!1361442))

(assert (= (and b!1361442 c!127375) b!1361443))

(assert (= (and b!1361442 (not c!127375)) b!1361445))

(assert (= (or b!1361443 b!1361445) bm!65362))

(declare-fun m!1246549 () Bool)

(assert (=> b!1361442 m!1246549))

(assert (=> b!1361442 m!1246549))

(declare-fun m!1246551 () Bool)

(assert (=> b!1361442 m!1246551))

(assert (=> b!1361444 m!1246549))

(assert (=> b!1361444 m!1246549))

(declare-fun m!1246553 () Bool)

(assert (=> b!1361444 m!1246553))

(assert (=> bm!65362 m!1246549))

(declare-fun m!1246555 () Bool)

(assert (=> bm!65362 m!1246555))

(assert (=> b!1361446 m!1246549))

(assert (=> b!1361446 m!1246549))

(assert (=> b!1361446 m!1246551))

(assert (=> b!1361286 d!145855))

(declare-fun d!145859 () Bool)

(assert (=> d!145859 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600173 () Unit!44865)

(declare-fun choose!80 (array!92598 List!31776 List!31776 (_ BitVec 32)) Unit!44865)

(assert (=> d!145859 (= lt!600173 (choose!80 a!3742 ($colon$colon!890 acc!759 (select (arr!44735 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145859 (bvslt (size!45285 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145859 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!890 acc!759 (select (arr!44735 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600173)))

(declare-fun bs!39040 () Bool)

(assert (= bs!39040 d!145859))

(assert (=> bs!39040 m!1246435))

(assert (=> bs!39040 m!1246431))

(declare-fun m!1246571 () Bool)

(assert (=> bs!39040 m!1246571))

(assert (=> b!1361296 d!145859))

(declare-fun b!1361489 () Bool)

(declare-fun e!772406 () Bool)

(declare-fun e!772403 () Bool)

(assert (=> b!1361489 (= e!772406 e!772403)))

(declare-fun res!905613 () Bool)

(assert (=> b!1361489 (=> res!905613 e!772403)))

(declare-fun e!772405 () Bool)

(assert (=> b!1361489 (= res!905613 e!772405)))

(declare-fun res!905610 () Bool)

(assert (=> b!1361489 (=> (not res!905610) (not e!772405))))

(assert (=> b!1361489 (= res!905610 (= (h!32981 acc!759) (h!32981 acc!759)))))

(declare-fun d!145865 () Bool)

(declare-fun res!905611 () Bool)

(declare-fun e!772404 () Bool)

(assert (=> d!145865 (=> res!905611 e!772404)))

(assert (=> d!145865 (= res!905611 (is-Nil!31773 acc!759))))

(assert (=> d!145865 (= (subseq!887 acc!759 acc!759) e!772404)))

(declare-fun b!1361488 () Bool)

(assert (=> b!1361488 (= e!772404 e!772406)))

(declare-fun res!905612 () Bool)

(assert (=> b!1361488 (=> (not res!905612) (not e!772406))))

(assert (=> b!1361488 (= res!905612 (is-Cons!31772 acc!759))))

(declare-fun b!1361491 () Bool)

(assert (=> b!1361491 (= e!772403 (subseq!887 acc!759 (t!46458 acc!759)))))

(declare-fun b!1361490 () Bool)

(assert (=> b!1361490 (= e!772405 (subseq!887 (t!46458 acc!759) (t!46458 acc!759)))))

(assert (= (and d!145865 (not res!905611)) b!1361488))

(assert (= (and b!1361488 res!905612) b!1361489))

(assert (= (and b!1361489 res!905610) b!1361490))

(assert (= (and b!1361489 (not res!905613)) b!1361491))

(declare-fun m!1246589 () Bool)

(assert (=> b!1361491 m!1246589))

(declare-fun m!1246591 () Bool)

(assert (=> b!1361490 m!1246591))

(assert (=> b!1361296 d!145865))

(declare-fun b!1361492 () Bool)

(declare-fun e!772408 () Bool)

(declare-fun e!772407 () Bool)

(assert (=> b!1361492 (= e!772408 e!772407)))

(declare-fun c!127379 () Bool)

(assert (=> b!1361492 (= c!127379 (validKeyInArray!0 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361493 () Bool)

(declare-fun call!65369 () Bool)

(assert (=> b!1361493 (= e!772407 call!65369)))

(declare-fun b!1361494 () Bool)

(declare-fun e!772410 () Bool)

(assert (=> b!1361494 (= e!772410 (contains!9485 acc!759 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361495 () Bool)

(assert (=> b!1361495 (= e!772407 call!65369)))

(declare-fun bm!65366 () Bool)

(assert (=> bm!65366 (= call!65369 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127379 (Cons!31772 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun d!145875 () Bool)

(declare-fun res!905615 () Bool)

(declare-fun e!772409 () Bool)

(assert (=> d!145875 (=> res!905615 e!772409)))

(assert (=> d!145875 (= res!905615 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45285 a!3742)))))

(assert (=> d!145875 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772409)))

(declare-fun b!1361496 () Bool)

(assert (=> b!1361496 (= e!772409 e!772408)))

(declare-fun res!905614 () Bool)

(assert (=> b!1361496 (=> (not res!905614) (not e!772408))))

(assert (=> b!1361496 (= res!905614 (not e!772410))))

(declare-fun res!905616 () Bool)

(assert (=> b!1361496 (=> (not res!905616) (not e!772410))))

(assert (=> b!1361496 (= res!905616 (validKeyInArray!0 (select (arr!44735 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145875 (not res!905615)) b!1361496))

(assert (= (and b!1361496 res!905616) b!1361494))

(assert (= (and b!1361496 res!905614) b!1361492))

(assert (= (and b!1361492 c!127379) b!1361493))

(assert (= (and b!1361492 (not c!127379)) b!1361495))

(assert (= (or b!1361493 b!1361495) bm!65366))

(assert (=> b!1361492 m!1246549))

(assert (=> b!1361492 m!1246549))

(assert (=> b!1361492 m!1246551))

(assert (=> b!1361494 m!1246549))

(assert (=> b!1361494 m!1246549))

(declare-fun m!1246593 () Bool)

(assert (=> b!1361494 m!1246593))

(assert (=> bm!65366 m!1246549))

(declare-fun m!1246595 () Bool)

(assert (=> bm!65366 m!1246595))

(assert (=> b!1361496 m!1246549))

(assert (=> b!1361496 m!1246549))

(assert (=> b!1361496 m!1246551))

(assert (=> b!1361296 d!145875))

(declare-fun d!145879 () Bool)

(assert (=> d!145879 (= ($colon$colon!890 acc!759 (select (arr!44735 a!3742) from!3120)) (Cons!31772 (select (arr!44735 a!3742) from!3120) acc!759))))

(assert (=> b!1361296 d!145879))

(declare-fun d!145881 () Bool)

(assert (=> d!145881 (subseq!887 acc!759 acc!759)))

(declare-fun lt!600182 () Unit!44865)

(declare-fun choose!36 (List!31776) Unit!44865)

(assert (=> d!145881 (= lt!600182 (choose!36 acc!759))))

(assert (=> d!145881 (= (lemmaListSubSeqRefl!0 acc!759) lt!600182)))

(declare-fun bs!39042 () Bool)

(assert (= bs!39042 d!145881))

(assert (=> bs!39042 m!1246437))

(declare-fun m!1246613 () Bool)

(assert (=> bs!39042 m!1246613))

(assert (=> b!1361296 d!145881))

(declare-fun d!145889 () Bool)

(declare-fun res!905643 () Bool)

(declare-fun e!772439 () Bool)

(assert (=> d!145889 (=> res!905643 e!772439)))

(assert (=> d!145889 (= res!905643 (is-Nil!31773 lt!600132))))

(assert (=> d!145889 (= (noDuplicate!2342 lt!600132) e!772439)))

(declare-fun b!1361527 () Bool)

(declare-fun e!772440 () Bool)

(assert (=> b!1361527 (= e!772439 e!772440)))

(declare-fun res!905644 () Bool)

(assert (=> b!1361527 (=> (not res!905644) (not e!772440))))

(assert (=> b!1361527 (= res!905644 (not (contains!9485 (t!46458 lt!600132) (h!32981 lt!600132))))))

(declare-fun b!1361528 () Bool)

(assert (=> b!1361528 (= e!772440 (noDuplicate!2342 (t!46458 lt!600132)))))

(assert (= (and d!145889 (not res!905643)) b!1361527))

(assert (= (and b!1361527 res!905644) b!1361528))

(declare-fun m!1246641 () Bool)

(assert (=> b!1361527 m!1246641))

(declare-fun m!1246643 () Bool)

(assert (=> b!1361528 m!1246643))

(assert (=> b!1361287 d!145889))

(declare-fun d!145905 () Bool)

(declare-fun lt!600191 () Bool)

(declare-fun content!697 (List!31776) (Set (_ BitVec 64)))

(assert (=> d!145905 (= lt!600191 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!697 lt!600132)))))

(declare-fun e!772446 () Bool)

(assert (=> d!145905 (= lt!600191 e!772446)))

(declare-fun res!905650 () Bool)

(assert (=> d!145905 (=> (not res!905650) (not e!772446))))

(assert (=> d!145905 (= res!905650 (is-Cons!31772 lt!600132))))

(assert (=> d!145905 (= (contains!9485 lt!600132 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600191)))

(declare-fun b!1361533 () Bool)

(declare-fun e!772445 () Bool)

(assert (=> b!1361533 (= e!772446 e!772445)))

(declare-fun res!905649 () Bool)

(assert (=> b!1361533 (=> res!905649 e!772445)))

(assert (=> b!1361533 (= res!905649 (= (h!32981 lt!600132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361534 () Bool)

(assert (=> b!1361534 (= e!772445 (contains!9485 (t!46458 lt!600132) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145905 res!905650) b!1361533))

(assert (= (and b!1361533 (not res!905649)) b!1361534))

(declare-fun m!1246647 () Bool)

(assert (=> d!145905 m!1246647))

(declare-fun m!1246649 () Bool)

(assert (=> d!145905 m!1246649))

(declare-fun m!1246651 () Bool)

(assert (=> b!1361534 m!1246651))

(assert (=> b!1361289 d!145905))

(declare-fun b!1361535 () Bool)

(declare-fun e!772448 () Bool)

(declare-fun e!772447 () Bool)

(assert (=> b!1361535 (= e!772448 e!772447)))

(declare-fun c!127382 () Bool)

(assert (=> b!1361535 (= c!127382 (validKeyInArray!0 (select (arr!44735 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361536 () Bool)

(declare-fun call!65372 () Bool)

(assert (=> b!1361536 (= e!772447 call!65372)))

(declare-fun b!1361537 () Bool)

(declare-fun e!772450 () Bool)

(assert (=> b!1361537 (= e!772450 (contains!9485 Nil!31773 (select (arr!44735 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361538 () Bool)

(assert (=> b!1361538 (= e!772447 call!65372)))

(declare-fun bm!65369 () Bool)

(assert (=> bm!65369 (= call!65372 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127382 (Cons!31772 (select (arr!44735 a!3742) #b00000000000000000000000000000000) Nil!31773) Nil!31773)))))

(declare-fun d!145909 () Bool)

(declare-fun res!905652 () Bool)

(declare-fun e!772449 () Bool)

(assert (=> d!145909 (=> res!905652 e!772449)))

(assert (=> d!145909 (= res!905652 (bvsge #b00000000000000000000000000000000 (size!45285 a!3742)))))

(assert (=> d!145909 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31773) e!772449)))

(declare-fun b!1361539 () Bool)

(assert (=> b!1361539 (= e!772449 e!772448)))

(declare-fun res!905651 () Bool)

(assert (=> b!1361539 (=> (not res!905651) (not e!772448))))

(assert (=> b!1361539 (= res!905651 (not e!772450))))

(declare-fun res!905653 () Bool)

(assert (=> b!1361539 (=> (not res!905653) (not e!772450))))

(assert (=> b!1361539 (= res!905653 (validKeyInArray!0 (select (arr!44735 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145909 (not res!905652)) b!1361539))

(assert (= (and b!1361539 res!905653) b!1361537))

(assert (= (and b!1361539 res!905651) b!1361535))

(assert (= (and b!1361535 c!127382) b!1361536))

(assert (= (and b!1361535 (not c!127382)) b!1361538))

(assert (= (or b!1361536 b!1361538) bm!65369))

(declare-fun m!1246653 () Bool)

(assert (=> b!1361535 m!1246653))

(assert (=> b!1361535 m!1246653))

(declare-fun m!1246655 () Bool)

(assert (=> b!1361535 m!1246655))

(assert (=> b!1361537 m!1246653))

(assert (=> b!1361537 m!1246653))

(declare-fun m!1246657 () Bool)

(assert (=> b!1361537 m!1246657))

(assert (=> bm!65369 m!1246653))

(declare-fun m!1246659 () Bool)

(assert (=> bm!65369 m!1246659))

(assert (=> b!1361539 m!1246653))

(assert (=> b!1361539 m!1246653))

(assert (=> b!1361539 m!1246655))

(assert (=> b!1361288 d!145909))

(declare-fun d!145911 () Bool)

(assert (=> d!145911 (= (array_inv!33763 a!3742) (bvsge (size!45285 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114812 d!145911))

(declare-fun d!145913 () Bool)

(assert (=> d!145913 (= (validKeyInArray!0 (select (arr!44735 a!3742) from!3120)) (and (not (= (select (arr!44735 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44735 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361290 d!145913))

(declare-fun b!1361548 () Bool)

(declare-fun e!772460 () Bool)

(declare-fun e!772459 () Bool)

(assert (=> b!1361548 (= e!772460 e!772459)))

(declare-fun c!127383 () Bool)

(assert (=> b!1361548 (= c!127383 (validKeyInArray!0 (select (arr!44735 a!3742) from!3120)))))

(declare-fun b!1361549 () Bool)

(declare-fun call!65373 () Bool)

(assert (=> b!1361549 (= e!772459 call!65373)))

(declare-fun e!772462 () Bool)

(declare-fun b!1361550 () Bool)

(assert (=> b!1361550 (= e!772462 (contains!9485 acc!759 (select (arr!44735 a!3742) from!3120)))))

(declare-fun b!1361551 () Bool)

(assert (=> b!1361551 (= e!772459 call!65373)))

(declare-fun bm!65370 () Bool)

(assert (=> bm!65370 (= call!65373 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127383 (Cons!31772 (select (arr!44735 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!145915 () Bool)

(declare-fun res!905663 () Bool)

(declare-fun e!772461 () Bool)

(assert (=> d!145915 (=> res!905663 e!772461)))

(assert (=> d!145915 (= res!905663 (bvsge from!3120 (size!45285 a!3742)))))

(assert (=> d!145915 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772461)))

(declare-fun b!1361552 () Bool)

(assert (=> b!1361552 (= e!772461 e!772460)))

(declare-fun res!905662 () Bool)

(assert (=> b!1361552 (=> (not res!905662) (not e!772460))))

(assert (=> b!1361552 (= res!905662 (not e!772462))))

(declare-fun res!905664 () Bool)

(assert (=> b!1361552 (=> (not res!905664) (not e!772462))))

(assert (=> b!1361552 (= res!905664 (validKeyInArray!0 (select (arr!44735 a!3742) from!3120)))))

(assert (= (and d!145915 (not res!905663)) b!1361552))

(assert (= (and b!1361552 res!905664) b!1361550))

(assert (= (and b!1361552 res!905662) b!1361548))

(assert (= (and b!1361548 c!127383) b!1361549))

(assert (= (and b!1361548 (not c!127383)) b!1361551))

(assert (= (or b!1361549 b!1361551) bm!65370))

(assert (=> b!1361548 m!1246425))

(assert (=> b!1361548 m!1246425))

(assert (=> b!1361548 m!1246427))

(assert (=> b!1361550 m!1246425))

(assert (=> b!1361550 m!1246425))

(declare-fun m!1246661 () Bool)

(assert (=> b!1361550 m!1246661))

(assert (=> bm!65370 m!1246425))

(declare-fun m!1246663 () Bool)

(assert (=> bm!65370 m!1246663))

(assert (=> b!1361552 m!1246425))

(assert (=> b!1361552 m!1246425))

(assert (=> b!1361552 m!1246427))

(assert (=> b!1361281 d!145915))

(declare-fun d!145917 () Bool)

(declare-fun lt!600192 () Bool)

(assert (=> d!145917 (= lt!600192 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!697 acc!759)))))

(declare-fun e!772468 () Bool)

(assert (=> d!145917 (= lt!600192 e!772468)))

(declare-fun res!905670 () Bool)

(assert (=> d!145917 (=> (not res!905670) (not e!772468))))

(assert (=> d!145917 (= res!905670 (is-Cons!31772 acc!759))))

(assert (=> d!145917 (= (contains!9485 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600192)))

(declare-fun b!1361557 () Bool)

(declare-fun e!772467 () Bool)

(assert (=> b!1361557 (= e!772468 e!772467)))

(declare-fun res!905669 () Bool)

(assert (=> b!1361557 (=> res!905669 e!772467)))

(assert (=> b!1361557 (= res!905669 (= (h!32981 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361558 () Bool)

(assert (=> b!1361558 (= e!772467 (contains!9485 (t!46458 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145917 res!905670) b!1361557))

(assert (= (and b!1361557 (not res!905669)) b!1361558))

(declare-fun m!1246669 () Bool)

(assert (=> d!145917 m!1246669))

(declare-fun m!1246671 () Bool)

(assert (=> d!145917 m!1246671))

(declare-fun m!1246673 () Bool)

(assert (=> b!1361558 m!1246673))

(assert (=> b!1361282 d!145917))

