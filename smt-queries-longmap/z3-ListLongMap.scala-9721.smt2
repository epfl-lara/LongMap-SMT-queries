; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115222 () Bool)

(assert start!115222)

(declare-fun b!1364468 () Bool)

(declare-fun res!907547 () Bool)

(declare-fun e!773929 () Bool)

(assert (=> b!1364468 (=> (not res!907547) (not e!773929))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92791 0))(
  ( (array!92792 (arr!44824 (Array (_ BitVec 32) (_ BitVec 64))) (size!45375 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92791)

(assert (=> b!1364468 (= res!907547 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45375 a!3742))))))

(declare-fun res!907550 () Bool)

(assert (=> start!115222 (=> (not res!907550) (not e!773929))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!115222 (= res!907550 (and (bvslt (size!45375 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45375 a!3742))))))

(assert (=> start!115222 e!773929))

(assert (=> start!115222 true))

(declare-fun array_inv!34105 (array!92791) Bool)

(assert (=> start!115222 (array_inv!34105 a!3742)))

(declare-fun b!1364469 () Bool)

(declare-fun res!907545 () Bool)

(assert (=> b!1364469 (=> (not res!907545) (not e!773929))))

(declare-datatypes ((List!31852 0))(
  ( (Nil!31849) (Cons!31848 (h!33066 (_ BitVec 64)) (t!46532 List!31852)) )
))
(declare-fun acc!759 () List!31852)

(declare-fun arrayNoDuplicates!0 (array!92791 (_ BitVec 32) List!31852) Bool)

(assert (=> b!1364469 (= res!907545 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364470 () Bool)

(declare-fun res!907553 () Bool)

(assert (=> b!1364470 (=> (not res!907553) (not e!773929))))

(declare-fun contains!9564 (List!31852 (_ BitVec 64)) Bool)

(assert (=> b!1364470 (= res!907553 (not (contains!9564 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364471 () Bool)

(declare-fun res!907552 () Bool)

(assert (=> b!1364471 (=> (not res!907552) (not e!773929))))

(declare-fun noDuplicate!2395 (List!31852) Bool)

(assert (=> b!1364471 (= res!907552 (noDuplicate!2395 acc!759))))

(declare-fun b!1364472 () Bool)

(declare-datatypes ((Unit!44912 0))(
  ( (Unit!44913) )
))
(declare-fun e!773928 () Unit!44912)

(declare-fun lt!601170 () Unit!44912)

(assert (=> b!1364472 (= e!773928 lt!601170)))

(declare-fun lt!601171 () Unit!44912)

(declare-fun lemmaListSubSeqRefl!0 (List!31852) Unit!44912)

(assert (=> b!1364472 (= lt!601171 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!923 (List!31852 List!31852) Bool)

(assert (=> b!1364472 (subseq!923 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92791 List!31852 List!31852 (_ BitVec 32)) Unit!44912)

(declare-fun $colon$colon!925 (List!31852 (_ BitVec 64)) List!31852)

(assert (=> b!1364472 (= lt!601170 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!925 acc!759 (select (arr!44824 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1364472 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1364473 () Bool)

(declare-fun e!773926 () Bool)

(assert (=> b!1364473 (= e!773929 e!773926)))

(declare-fun res!907548 () Bool)

(assert (=> b!1364473 (=> (not res!907548) (not e!773926))))

(declare-fun lt!601173 () Bool)

(assert (=> b!1364473 (= res!907548 (and (not (= from!3120 i!1404)) (not lt!601173) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!601172 () Unit!44912)

(assert (=> b!1364473 (= lt!601172 e!773928)))

(declare-fun c!127909 () Bool)

(assert (=> b!1364473 (= c!127909 lt!601173)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364473 (= lt!601173 (validKeyInArray!0 (select (arr!44824 a!3742) from!3120)))))

(declare-fun b!1364474 () Bool)

(declare-fun res!907546 () Bool)

(assert (=> b!1364474 (=> (not res!907546) (not e!773929))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1364474 (= res!907546 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364475 () Bool)

(declare-fun res!907549 () Bool)

(assert (=> b!1364475 (=> (not res!907549) (not e!773929))))

(assert (=> b!1364475 (= res!907549 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31849))))

(declare-fun b!1364476 () Bool)

(declare-fun res!907554 () Bool)

(assert (=> b!1364476 (=> (not res!907554) (not e!773929))))

(assert (=> b!1364476 (= res!907554 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45375 a!3742)))))

(declare-fun b!1364477 () Bool)

(declare-fun Unit!44914 () Unit!44912)

(assert (=> b!1364477 (= e!773928 Unit!44914)))

(declare-fun b!1364478 () Bool)

(declare-fun res!907551 () Bool)

(assert (=> b!1364478 (=> (not res!907551) (not e!773929))))

(assert (=> b!1364478 (= res!907551 (not (contains!9564 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364479 () Bool)

(assert (=> b!1364479 (= e!773926 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(assert (= (and start!115222 res!907550) b!1364471))

(assert (= (and b!1364471 res!907552) b!1364470))

(assert (= (and b!1364470 res!907553) b!1364478))

(assert (= (and b!1364478 res!907551) b!1364475))

(assert (= (and b!1364475 res!907549) b!1364469))

(assert (= (and b!1364469 res!907545) b!1364468))

(assert (= (and b!1364468 res!907547) b!1364474))

(assert (= (and b!1364474 res!907546) b!1364476))

(assert (= (and b!1364476 res!907554) b!1364473))

(assert (= (and b!1364473 c!127909) b!1364472))

(assert (= (and b!1364473 (not c!127909)) b!1364477))

(assert (= (and b!1364473 res!907548) b!1364479))

(declare-fun m!1249627 () Bool)

(assert (=> b!1364472 m!1249627))

(declare-fun m!1249629 () Bool)

(assert (=> b!1364472 m!1249629))

(declare-fun m!1249631 () Bool)

(assert (=> b!1364472 m!1249631))

(declare-fun m!1249633 () Bool)

(assert (=> b!1364472 m!1249633))

(declare-fun m!1249635 () Bool)

(assert (=> b!1364472 m!1249635))

(assert (=> b!1364472 m!1249629))

(assert (=> b!1364472 m!1249631))

(declare-fun m!1249637 () Bool)

(assert (=> b!1364472 m!1249637))

(declare-fun m!1249639 () Bool)

(assert (=> b!1364475 m!1249639))

(declare-fun m!1249641 () Bool)

(assert (=> b!1364470 m!1249641))

(declare-fun m!1249643 () Bool)

(assert (=> b!1364471 m!1249643))

(declare-fun m!1249645 () Bool)

(assert (=> start!115222 m!1249645))

(assert (=> b!1364473 m!1249629))

(assert (=> b!1364473 m!1249629))

(declare-fun m!1249647 () Bool)

(assert (=> b!1364473 m!1249647))

(declare-fun m!1249649 () Bool)

(assert (=> b!1364478 m!1249649))

(declare-fun m!1249651 () Bool)

(assert (=> b!1364474 m!1249651))

(declare-fun m!1249653 () Bool)

(assert (=> b!1364469 m!1249653))

(assert (=> b!1364479 m!1249635))

(check-sat (not b!1364472) (not b!1364470) (not b!1364478) (not b!1364479) (not b!1364473) (not b!1364469) (not b!1364471) (not b!1364474) (not b!1364475) (not start!115222))
(check-sat)
(get-model)

(declare-fun b!1364562 () Bool)

(declare-fun e!773962 () Bool)

(assert (=> b!1364562 (= e!773962 (contains!9564 Nil!31849 (select (arr!44824 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364563 () Bool)

(declare-fun e!773965 () Bool)

(declare-fun call!65467 () Bool)

(assert (=> b!1364563 (= e!773965 call!65467)))

(declare-fun d!146529 () Bool)

(declare-fun res!907622 () Bool)

(declare-fun e!773964 () Bool)

(assert (=> d!146529 (=> res!907622 e!773964)))

(assert (=> d!146529 (= res!907622 (bvsge #b00000000000000000000000000000000 (size!45375 a!3742)))))

(assert (=> d!146529 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31849) e!773964)))

(declare-fun b!1364564 () Bool)

(declare-fun e!773963 () Bool)

(assert (=> b!1364564 (= e!773964 e!773963)))

(declare-fun res!907623 () Bool)

(assert (=> b!1364564 (=> (not res!907623) (not e!773963))))

(assert (=> b!1364564 (= res!907623 (not e!773962))))

(declare-fun res!907621 () Bool)

(assert (=> b!1364564 (=> (not res!907621) (not e!773962))))

(assert (=> b!1364564 (= res!907621 (validKeyInArray!0 (select (arr!44824 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65464 () Bool)

(declare-fun c!127918 () Bool)

(assert (=> bm!65464 (= call!65467 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127918 (Cons!31848 (select (arr!44824 a!3742) #b00000000000000000000000000000000) Nil!31849) Nil!31849)))))

(declare-fun b!1364565 () Bool)

(assert (=> b!1364565 (= e!773963 e!773965)))

(assert (=> b!1364565 (= c!127918 (validKeyInArray!0 (select (arr!44824 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364566 () Bool)

(assert (=> b!1364566 (= e!773965 call!65467)))

(assert (= (and d!146529 (not res!907622)) b!1364564))

(assert (= (and b!1364564 res!907621) b!1364562))

(assert (= (and b!1364564 res!907623) b!1364565))

(assert (= (and b!1364565 c!127918) b!1364563))

(assert (= (and b!1364565 (not c!127918)) b!1364566))

(assert (= (or b!1364563 b!1364566) bm!65464))

(declare-fun m!1249711 () Bool)

(assert (=> b!1364562 m!1249711))

(assert (=> b!1364562 m!1249711))

(declare-fun m!1249713 () Bool)

(assert (=> b!1364562 m!1249713))

(assert (=> b!1364564 m!1249711))

(assert (=> b!1364564 m!1249711))

(declare-fun m!1249715 () Bool)

(assert (=> b!1364564 m!1249715))

(assert (=> bm!65464 m!1249711))

(declare-fun m!1249717 () Bool)

(assert (=> bm!65464 m!1249717))

(assert (=> b!1364565 m!1249711))

(assert (=> b!1364565 m!1249711))

(assert (=> b!1364565 m!1249715))

(assert (=> b!1364475 d!146529))

(declare-fun d!146531 () Bool)

(declare-fun lt!601200 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!700 (List!31852) (InoxSet (_ BitVec 64)))

(assert (=> d!146531 (= lt!601200 (select (content!700 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773971 () Bool)

(assert (=> d!146531 (= lt!601200 e!773971)))

(declare-fun res!907628 () Bool)

(assert (=> d!146531 (=> (not res!907628) (not e!773971))))

(get-info :version)

(assert (=> d!146531 (= res!907628 ((_ is Cons!31848) acc!759))))

(assert (=> d!146531 (= (contains!9564 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601200)))

(declare-fun b!1364571 () Bool)

(declare-fun e!773970 () Bool)

(assert (=> b!1364571 (= e!773971 e!773970)))

(declare-fun res!907629 () Bool)

(assert (=> b!1364571 (=> res!907629 e!773970)))

(assert (=> b!1364571 (= res!907629 (= (h!33066 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364572 () Bool)

(assert (=> b!1364572 (= e!773970 (contains!9564 (t!46532 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146531 res!907628) b!1364571))

(assert (= (and b!1364571 (not res!907629)) b!1364572))

(declare-fun m!1249719 () Bool)

(assert (=> d!146531 m!1249719))

(declare-fun m!1249721 () Bool)

(assert (=> d!146531 m!1249721))

(declare-fun m!1249723 () Bool)

(assert (=> b!1364572 m!1249723))

(assert (=> b!1364470 d!146531))

(declare-fun b!1364573 () Bool)

(declare-fun e!773972 () Bool)

(assert (=> b!1364573 (= e!773972 (contains!9564 acc!759 (select (arr!44824 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364574 () Bool)

(declare-fun e!773975 () Bool)

(declare-fun call!65468 () Bool)

(assert (=> b!1364574 (= e!773975 call!65468)))

(declare-fun d!146537 () Bool)

(declare-fun res!907631 () Bool)

(declare-fun e!773974 () Bool)

(assert (=> d!146537 (=> res!907631 e!773974)))

(assert (=> d!146537 (= res!907631 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45375 a!3742)))))

(assert (=> d!146537 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773974)))

(declare-fun b!1364575 () Bool)

(declare-fun e!773973 () Bool)

(assert (=> b!1364575 (= e!773974 e!773973)))

(declare-fun res!907632 () Bool)

(assert (=> b!1364575 (=> (not res!907632) (not e!773973))))

(assert (=> b!1364575 (= res!907632 (not e!773972))))

(declare-fun res!907630 () Bool)

(assert (=> b!1364575 (=> (not res!907630) (not e!773972))))

(assert (=> b!1364575 (= res!907630 (validKeyInArray!0 (select (arr!44824 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun c!127919 () Bool)

(declare-fun bm!65465 () Bool)

(assert (=> bm!65465 (= call!65468 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127919 (Cons!31848 (select (arr!44824 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1364576 () Bool)

(assert (=> b!1364576 (= e!773973 e!773975)))

(assert (=> b!1364576 (= c!127919 (validKeyInArray!0 (select (arr!44824 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1364577 () Bool)

(assert (=> b!1364577 (= e!773975 call!65468)))

(assert (= (and d!146537 (not res!907631)) b!1364575))

(assert (= (and b!1364575 res!907630) b!1364573))

(assert (= (and b!1364575 res!907632) b!1364576))

(assert (= (and b!1364576 c!127919) b!1364574))

(assert (= (and b!1364576 (not c!127919)) b!1364577))

(assert (= (or b!1364574 b!1364577) bm!65465))

(declare-fun m!1249725 () Bool)

(assert (=> b!1364573 m!1249725))

(assert (=> b!1364573 m!1249725))

(declare-fun m!1249727 () Bool)

(assert (=> b!1364573 m!1249727))

(assert (=> b!1364575 m!1249725))

(assert (=> b!1364575 m!1249725))

(declare-fun m!1249729 () Bool)

(assert (=> b!1364575 m!1249729))

(assert (=> bm!65465 m!1249725))

(declare-fun m!1249731 () Bool)

(assert (=> bm!65465 m!1249731))

(assert (=> b!1364576 m!1249725))

(assert (=> b!1364576 m!1249725))

(assert (=> b!1364576 m!1249729))

(assert (=> b!1364479 d!146537))

(declare-fun d!146541 () Bool)

(assert (=> d!146541 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1364474 d!146541))

(declare-fun e!773976 () Bool)

(declare-fun b!1364578 () Bool)

(assert (=> b!1364578 (= e!773976 (contains!9564 acc!759 (select (arr!44824 a!3742) from!3120)))))

(declare-fun b!1364579 () Bool)

(declare-fun e!773979 () Bool)

(declare-fun call!65469 () Bool)

(assert (=> b!1364579 (= e!773979 call!65469)))

(declare-fun d!146543 () Bool)

(declare-fun res!907634 () Bool)

(declare-fun e!773978 () Bool)

(assert (=> d!146543 (=> res!907634 e!773978)))

(assert (=> d!146543 (= res!907634 (bvsge from!3120 (size!45375 a!3742)))))

(assert (=> d!146543 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773978)))

(declare-fun b!1364580 () Bool)

(declare-fun e!773977 () Bool)

(assert (=> b!1364580 (= e!773978 e!773977)))

(declare-fun res!907635 () Bool)

(assert (=> b!1364580 (=> (not res!907635) (not e!773977))))

(assert (=> b!1364580 (= res!907635 (not e!773976))))

(declare-fun res!907633 () Bool)

(assert (=> b!1364580 (=> (not res!907633) (not e!773976))))

(assert (=> b!1364580 (= res!907633 (validKeyInArray!0 (select (arr!44824 a!3742) from!3120)))))

(declare-fun bm!65466 () Bool)

(declare-fun c!127920 () Bool)

(assert (=> bm!65466 (= call!65469 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127920 (Cons!31848 (select (arr!44824 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1364581 () Bool)

(assert (=> b!1364581 (= e!773977 e!773979)))

(assert (=> b!1364581 (= c!127920 (validKeyInArray!0 (select (arr!44824 a!3742) from!3120)))))

(declare-fun b!1364582 () Bool)

(assert (=> b!1364582 (= e!773979 call!65469)))

(assert (= (and d!146543 (not res!907634)) b!1364580))

(assert (= (and b!1364580 res!907633) b!1364578))

(assert (= (and b!1364580 res!907635) b!1364581))

(assert (= (and b!1364581 c!127920) b!1364579))

(assert (= (and b!1364581 (not c!127920)) b!1364582))

(assert (= (or b!1364579 b!1364582) bm!65466))

(assert (=> b!1364578 m!1249629))

(assert (=> b!1364578 m!1249629))

(declare-fun m!1249735 () Bool)

(assert (=> b!1364578 m!1249735))

(assert (=> b!1364580 m!1249629))

(assert (=> b!1364580 m!1249629))

(assert (=> b!1364580 m!1249647))

(assert (=> bm!65466 m!1249629))

(declare-fun m!1249737 () Bool)

(assert (=> bm!65466 m!1249737))

(assert (=> b!1364581 m!1249629))

(assert (=> b!1364581 m!1249629))

(assert (=> b!1364581 m!1249647))

(assert (=> b!1364469 d!146543))

(declare-fun d!146547 () Bool)

(assert (=> d!146547 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!601206 () Unit!44912)

(declare-fun choose!80 (array!92791 List!31852 List!31852 (_ BitVec 32)) Unit!44912)

(assert (=> d!146547 (= lt!601206 (choose!80 a!3742 ($colon$colon!925 acc!759 (select (arr!44824 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146547 (bvslt (size!45375 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146547 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!925 acc!759 (select (arr!44824 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!601206)))

(declare-fun bs!39104 () Bool)

(assert (= bs!39104 d!146547))

(assert (=> bs!39104 m!1249635))

(assert (=> bs!39104 m!1249631))

(declare-fun m!1249743 () Bool)

(assert (=> bs!39104 m!1249743))

(assert (=> b!1364472 d!146547))

(declare-fun b!1364644 () Bool)

(declare-fun e!774032 () Bool)

(assert (=> b!1364644 (= e!774032 (subseq!923 (t!46532 acc!759) (t!46532 acc!759)))))

(declare-fun b!1364645 () Bool)

(declare-fun e!774033 () Bool)

(assert (=> b!1364645 (= e!774033 (subseq!923 acc!759 (t!46532 acc!759)))))

(declare-fun b!1364643 () Bool)

(declare-fun e!774035 () Bool)

(assert (=> b!1364643 (= e!774035 e!774033)))

(declare-fun res!907683 () Bool)

(assert (=> b!1364643 (=> res!907683 e!774033)))

(assert (=> b!1364643 (= res!907683 e!774032)))

(declare-fun res!907681 () Bool)

(assert (=> b!1364643 (=> (not res!907681) (not e!774032))))

(assert (=> b!1364643 (= res!907681 (= (h!33066 acc!759) (h!33066 acc!759)))))

(declare-fun d!146551 () Bool)

(declare-fun res!907684 () Bool)

(declare-fun e!774034 () Bool)

(assert (=> d!146551 (=> res!907684 e!774034)))

(assert (=> d!146551 (= res!907684 ((_ is Nil!31849) acc!759))))

(assert (=> d!146551 (= (subseq!923 acc!759 acc!759) e!774034)))

(declare-fun b!1364642 () Bool)

(assert (=> b!1364642 (= e!774034 e!774035)))

(declare-fun res!907682 () Bool)

(assert (=> b!1364642 (=> (not res!907682) (not e!774035))))

(assert (=> b!1364642 (= res!907682 ((_ is Cons!31848) acc!759))))

(assert (= (and d!146551 (not res!907684)) b!1364642))

(assert (= (and b!1364642 res!907682) b!1364643))

(assert (= (and b!1364643 res!907681) b!1364644))

(assert (= (and b!1364643 (not res!907683)) b!1364645))

(declare-fun m!1249769 () Bool)

(assert (=> b!1364644 m!1249769))

(declare-fun m!1249771 () Bool)

(assert (=> b!1364645 m!1249771))

(assert (=> b!1364472 d!146551))

(assert (=> b!1364472 d!146537))

(declare-fun d!146563 () Bool)

(assert (=> d!146563 (= ($colon$colon!925 acc!759 (select (arr!44824 a!3742) from!3120)) (Cons!31848 (select (arr!44824 a!3742) from!3120) acc!759))))

(assert (=> b!1364472 d!146563))

(declare-fun d!146567 () Bool)

(assert (=> d!146567 (subseq!923 acc!759 acc!759)))

(declare-fun lt!601212 () Unit!44912)

(declare-fun choose!36 (List!31852) Unit!44912)

(assert (=> d!146567 (= lt!601212 (choose!36 acc!759))))

(assert (=> d!146567 (= (lemmaListSubSeqRefl!0 acc!759) lt!601212)))

(declare-fun bs!39106 () Bool)

(assert (= bs!39106 d!146567))

(assert (=> bs!39106 m!1249637))

(declare-fun m!1249783 () Bool)

(assert (=> bs!39106 m!1249783))

(assert (=> b!1364472 d!146567))

(declare-fun d!146573 () Bool)

(declare-fun lt!601213 () Bool)

(assert (=> d!146573 (= lt!601213 (select (content!700 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774043 () Bool)

(assert (=> d!146573 (= lt!601213 e!774043)))

(declare-fun res!907690 () Bool)

(assert (=> d!146573 (=> (not res!907690) (not e!774043))))

(assert (=> d!146573 (= res!907690 ((_ is Cons!31848) acc!759))))

(assert (=> d!146573 (= (contains!9564 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601213)))

(declare-fun b!1364653 () Bool)

(declare-fun e!774042 () Bool)

(assert (=> b!1364653 (= e!774043 e!774042)))

(declare-fun res!907691 () Bool)

(assert (=> b!1364653 (=> res!907691 e!774042)))

(assert (=> b!1364653 (= res!907691 (= (h!33066 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364654 () Bool)

(assert (=> b!1364654 (= e!774042 (contains!9564 (t!46532 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146573 res!907690) b!1364653))

(assert (= (and b!1364653 (not res!907691)) b!1364654))

(assert (=> d!146573 m!1249719))

(declare-fun m!1249785 () Bool)

(assert (=> d!146573 m!1249785))

(declare-fun m!1249787 () Bool)

(assert (=> b!1364654 m!1249787))

(assert (=> b!1364478 d!146573))

(declare-fun d!146575 () Bool)

(assert (=> d!146575 (= (validKeyInArray!0 (select (arr!44824 a!3742) from!3120)) (and (not (= (select (arr!44824 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44824 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1364473 d!146575))

(declare-fun d!146577 () Bool)

(declare-fun res!907705 () Bool)

(declare-fun e!774058 () Bool)

(assert (=> d!146577 (=> res!907705 e!774058)))

(assert (=> d!146577 (= res!907705 ((_ is Nil!31849) acc!759))))

(assert (=> d!146577 (= (noDuplicate!2395 acc!759) e!774058)))

(declare-fun b!1364670 () Bool)

(declare-fun e!774059 () Bool)

(assert (=> b!1364670 (= e!774058 e!774059)))

(declare-fun res!907706 () Bool)

(assert (=> b!1364670 (=> (not res!907706) (not e!774059))))

(assert (=> b!1364670 (= res!907706 (not (contains!9564 (t!46532 acc!759) (h!33066 acc!759))))))

(declare-fun b!1364671 () Bool)

(assert (=> b!1364671 (= e!774059 (noDuplicate!2395 (t!46532 acc!759)))))

(assert (= (and d!146577 (not res!907705)) b!1364670))

(assert (= (and b!1364670 res!907706) b!1364671))

(declare-fun m!1249809 () Bool)

(assert (=> b!1364670 m!1249809))

(declare-fun m!1249811 () Bool)

(assert (=> b!1364671 m!1249811))

(assert (=> b!1364471 d!146577))

(declare-fun d!146589 () Bool)

(assert (=> d!146589 (= (array_inv!34105 a!3742) (bvsge (size!45375 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115222 d!146589))

(check-sat (not b!1364575) (not b!1364576) (not d!146531) (not d!146573) (not b!1364565) (not b!1364654) (not b!1364578) (not b!1364564) (not b!1364573) (not b!1364572) (not b!1364671) (not b!1364580) (not d!146547) (not d!146567) (not b!1364581) (not bm!65465) (not b!1364644) (not bm!65466) (not b!1364670) (not b!1364562) (not bm!65464) (not b!1364645))
(check-sat)
