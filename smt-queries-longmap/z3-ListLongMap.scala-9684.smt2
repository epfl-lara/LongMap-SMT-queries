; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114466 () Bool)

(assert start!114466)

(declare-fun b!1358499 () Bool)

(declare-fun res!902483 () Bool)

(declare-fun e!771115 () Bool)

(assert (=> b!1358499 (=> (not res!902483) (not e!771115))))

(declare-datatypes ((List!31741 0))(
  ( (Nil!31738) (Cons!31737 (h!32955 (_ BitVec 64)) (t!46391 List!31741)) )
))
(declare-fun acc!759 () List!31741)

(declare-fun contains!9453 (List!31741 (_ BitVec 64)) Bool)

(assert (=> b!1358499 (= res!902483 (not (contains!9453 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!902474 () Bool)

(assert (=> start!114466 (=> (not res!902474) (not e!771115))))

(declare-datatypes ((array!92539 0))(
  ( (array!92540 (arr!44713 (Array (_ BitVec 32) (_ BitVec 64))) (size!45264 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92539)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114466 (= res!902474 (and (bvslt (size!45264 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45264 a!3742))))))

(assert (=> start!114466 e!771115))

(assert (=> start!114466 true))

(declare-fun array_inv!33994 (array!92539) Bool)

(assert (=> start!114466 (array_inv!33994 a!3742)))

(declare-fun b!1358500 () Bool)

(declare-fun res!902476 () Bool)

(assert (=> b!1358500 (=> (not res!902476) (not e!771115))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358500 (= res!902476 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45264 a!3742))))))

(declare-fun b!1358501 () Bool)

(declare-fun res!902477 () Bool)

(assert (=> b!1358501 (=> (not res!902477) (not e!771115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358501 (= res!902477 (validKeyInArray!0 (select (arr!44713 a!3742) from!3120)))))

(declare-fun b!1358502 () Bool)

(declare-fun res!902481 () Bool)

(assert (=> b!1358502 (=> (not res!902481) (not e!771115))))

(declare-fun arrayNoDuplicates!0 (array!92539 (_ BitVec 32) List!31741) Bool)

(assert (=> b!1358502 (= res!902481 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31738))))

(declare-fun b!1358503 () Bool)

(declare-fun e!771113 () Bool)

(declare-fun noDuplicate!2284 (List!31741) Bool)

(declare-fun $colon$colon!814 (List!31741 (_ BitVec 64)) List!31741)

(assert (=> b!1358503 (= e!771113 (noDuplicate!2284 ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120))))))

(declare-fun b!1358504 () Bool)

(declare-fun res!902478 () Bool)

(assert (=> b!1358504 (=> (not res!902478) (not e!771115))))

(assert (=> b!1358504 (= res!902478 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45264 a!3742)))))

(declare-fun b!1358505 () Bool)

(declare-fun res!902484 () Bool)

(assert (=> b!1358505 (=> (not res!902484) (not e!771115))))

(assert (=> b!1358505 (= res!902484 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358506 () Bool)

(declare-fun res!902475 () Bool)

(assert (=> b!1358506 (=> (not res!902475) (not e!771115))))

(assert (=> b!1358506 (= res!902475 (not (contains!9453 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358507 () Bool)

(assert (=> b!1358507 (= e!771115 (not e!771113))))

(declare-fun res!902479 () Bool)

(assert (=> b!1358507 (=> res!902479 e!771113)))

(assert (=> b!1358507 (= res!902479 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun subseq!812 (List!31741 List!31741) Bool)

(assert (=> b!1358507 (subseq!812 acc!759 acc!759)))

(declare-datatypes ((Unit!44594 0))(
  ( (Unit!44595) )
))
(declare-fun lt!599604 () Unit!44594)

(declare-fun lemmaListSubSeqRefl!0 (List!31741) Unit!44594)

(assert (=> b!1358507 (= lt!599604 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358508 () Bool)

(declare-fun res!902480 () Bool)

(assert (=> b!1358508 (=> (not res!902480) (not e!771115))))

(assert (=> b!1358508 (= res!902480 (noDuplicate!2284 acc!759))))

(declare-fun b!1358509 () Bool)

(declare-fun res!902482 () Bool)

(assert (=> b!1358509 (=> (not res!902482) (not e!771115))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358509 (= res!902482 (not (validKeyInArray!0 l!3587)))))

(assert (= (and start!114466 res!902474) b!1358508))

(assert (= (and b!1358508 res!902480) b!1358506))

(assert (= (and b!1358506 res!902475) b!1358499))

(assert (= (and b!1358499 res!902483) b!1358502))

(assert (= (and b!1358502 res!902481) b!1358505))

(assert (= (and b!1358505 res!902484) b!1358500))

(assert (= (and b!1358500 res!902476) b!1358509))

(assert (= (and b!1358509 res!902482) b!1358504))

(assert (= (and b!1358504 res!902478) b!1358501))

(assert (= (and b!1358501 res!902477) b!1358507))

(assert (= (and b!1358507 (not res!902479)) b!1358503))

(declare-fun m!1244593 () Bool)

(assert (=> b!1358506 m!1244593))

(declare-fun m!1244595 () Bool)

(assert (=> b!1358508 m!1244595))

(declare-fun m!1244597 () Bool)

(assert (=> b!1358507 m!1244597))

(declare-fun m!1244599 () Bool)

(assert (=> b!1358507 m!1244599))

(declare-fun m!1244601 () Bool)

(assert (=> b!1358503 m!1244601))

(assert (=> b!1358503 m!1244601))

(declare-fun m!1244603 () Bool)

(assert (=> b!1358503 m!1244603))

(assert (=> b!1358503 m!1244603))

(declare-fun m!1244605 () Bool)

(assert (=> b!1358503 m!1244605))

(declare-fun m!1244607 () Bool)

(assert (=> b!1358505 m!1244607))

(declare-fun m!1244609 () Bool)

(assert (=> start!114466 m!1244609))

(declare-fun m!1244611 () Bool)

(assert (=> b!1358502 m!1244611))

(declare-fun m!1244613 () Bool)

(assert (=> b!1358499 m!1244613))

(assert (=> b!1358501 m!1244601))

(assert (=> b!1358501 m!1244601))

(declare-fun m!1244615 () Bool)

(assert (=> b!1358501 m!1244615))

(declare-fun m!1244617 () Bool)

(assert (=> b!1358509 m!1244617))

(check-sat (not b!1358501) (not b!1358507) (not b!1358503) (not b!1358509) (not b!1358502) (not start!114466) (not b!1358508) (not b!1358505) (not b!1358499) (not b!1358506))
(check-sat)
(get-model)

(declare-fun b!1358587 () Bool)

(declare-fun e!771143 () Bool)

(assert (=> b!1358587 (= e!771143 (subseq!812 acc!759 (t!46391 acc!759)))))

(declare-fun d!145531 () Bool)

(declare-fun res!902561 () Bool)

(declare-fun e!771145 () Bool)

(assert (=> d!145531 (=> res!902561 e!771145)))

(get-info :version)

(assert (=> d!145531 (= res!902561 ((_ is Nil!31738) acc!759))))

(assert (=> d!145531 (= (subseq!812 acc!759 acc!759) e!771145)))

(declare-fun b!1358584 () Bool)

(declare-fun e!771142 () Bool)

(assert (=> b!1358584 (= e!771145 e!771142)))

(declare-fun res!902562 () Bool)

(assert (=> b!1358584 (=> (not res!902562) (not e!771142))))

(assert (=> b!1358584 (= res!902562 ((_ is Cons!31737) acc!759))))

(declare-fun b!1358586 () Bool)

(declare-fun e!771144 () Bool)

(assert (=> b!1358586 (= e!771144 (subseq!812 (t!46391 acc!759) (t!46391 acc!759)))))

(declare-fun b!1358585 () Bool)

(assert (=> b!1358585 (= e!771142 e!771143)))

(declare-fun res!902560 () Bool)

(assert (=> b!1358585 (=> res!902560 e!771143)))

(assert (=> b!1358585 (= res!902560 e!771144)))

(declare-fun res!902559 () Bool)

(assert (=> b!1358585 (=> (not res!902559) (not e!771144))))

(assert (=> b!1358585 (= res!902559 (= (h!32955 acc!759) (h!32955 acc!759)))))

(assert (= (and d!145531 (not res!902561)) b!1358584))

(assert (= (and b!1358584 res!902562) b!1358585))

(assert (= (and b!1358585 res!902559) b!1358586))

(assert (= (and b!1358585 (not res!902560)) b!1358587))

(declare-fun m!1244671 () Bool)

(assert (=> b!1358587 m!1244671))

(declare-fun m!1244673 () Bool)

(assert (=> b!1358586 m!1244673))

(assert (=> b!1358507 d!145531))

(declare-fun d!145533 () Bool)

(assert (=> d!145533 (subseq!812 acc!759 acc!759)))

(declare-fun lt!599613 () Unit!44594)

(declare-fun choose!36 (List!31741) Unit!44594)

(assert (=> d!145533 (= lt!599613 (choose!36 acc!759))))

(assert (=> d!145533 (= (lemmaListSubSeqRefl!0 acc!759) lt!599613)))

(declare-fun bs!38944 () Bool)

(assert (= bs!38944 d!145533))

(assert (=> bs!38944 m!1244597))

(declare-fun m!1244675 () Bool)

(assert (=> bs!38944 m!1244675))

(assert (=> b!1358507 d!145533))

(declare-fun bm!65305 () Bool)

(declare-fun call!65308 () Bool)

(declare-fun c!127462 () Bool)

(assert (=> bm!65305 (= call!65308 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127462 (Cons!31737 (select (arr!44713 a!3742) #b00000000000000000000000000000000) Nil!31738) Nil!31738)))))

(declare-fun b!1358598 () Bool)

(declare-fun e!771157 () Bool)

(declare-fun e!771156 () Bool)

(assert (=> b!1358598 (= e!771157 e!771156)))

(declare-fun res!902571 () Bool)

(assert (=> b!1358598 (=> (not res!902571) (not e!771156))))

(declare-fun e!771154 () Bool)

(assert (=> b!1358598 (= res!902571 (not e!771154))))

(declare-fun res!902569 () Bool)

(assert (=> b!1358598 (=> (not res!902569) (not e!771154))))

(assert (=> b!1358598 (= res!902569 (validKeyInArray!0 (select (arr!44713 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358599 () Bool)

(declare-fun e!771155 () Bool)

(assert (=> b!1358599 (= e!771155 call!65308)))

(declare-fun b!1358600 () Bool)

(assert (=> b!1358600 (= e!771156 e!771155)))

(assert (=> b!1358600 (= c!127462 (validKeyInArray!0 (select (arr!44713 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145535 () Bool)

(declare-fun res!902570 () Bool)

(assert (=> d!145535 (=> res!902570 e!771157)))

(assert (=> d!145535 (= res!902570 (bvsge #b00000000000000000000000000000000 (size!45264 a!3742)))))

(assert (=> d!145535 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31738) e!771157)))

(declare-fun b!1358601 () Bool)

(assert (=> b!1358601 (= e!771154 (contains!9453 Nil!31738 (select (arr!44713 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358602 () Bool)

(assert (=> b!1358602 (= e!771155 call!65308)))

(assert (= (and d!145535 (not res!902570)) b!1358598))

(assert (= (and b!1358598 res!902569) b!1358601))

(assert (= (and b!1358598 res!902571) b!1358600))

(assert (= (and b!1358600 c!127462) b!1358602))

(assert (= (and b!1358600 (not c!127462)) b!1358599))

(assert (= (or b!1358602 b!1358599) bm!65305))

(declare-fun m!1244677 () Bool)

(assert (=> bm!65305 m!1244677))

(declare-fun m!1244679 () Bool)

(assert (=> bm!65305 m!1244679))

(assert (=> b!1358598 m!1244677))

(assert (=> b!1358598 m!1244677))

(declare-fun m!1244681 () Bool)

(assert (=> b!1358598 m!1244681))

(assert (=> b!1358600 m!1244677))

(assert (=> b!1358600 m!1244677))

(assert (=> b!1358600 m!1244681))

(assert (=> b!1358601 m!1244677))

(assert (=> b!1358601 m!1244677))

(declare-fun m!1244683 () Bool)

(assert (=> b!1358601 m!1244683))

(assert (=> b!1358502 d!145535))

(declare-fun d!145543 () Bool)

(declare-fun res!902588 () Bool)

(declare-fun e!771178 () Bool)

(assert (=> d!145543 (=> res!902588 e!771178)))

(assert (=> d!145543 (= res!902588 ((_ is Nil!31738) acc!759))))

(assert (=> d!145543 (= (noDuplicate!2284 acc!759) e!771178)))

(declare-fun b!1358627 () Bool)

(declare-fun e!771179 () Bool)

(assert (=> b!1358627 (= e!771178 e!771179)))

(declare-fun res!902589 () Bool)

(assert (=> b!1358627 (=> (not res!902589) (not e!771179))))

(assert (=> b!1358627 (= res!902589 (not (contains!9453 (t!46391 acc!759) (h!32955 acc!759))))))

(declare-fun b!1358628 () Bool)

(assert (=> b!1358628 (= e!771179 (noDuplicate!2284 (t!46391 acc!759)))))

(assert (= (and d!145543 (not res!902588)) b!1358627))

(assert (= (and b!1358627 res!902589) b!1358628))

(declare-fun m!1244685 () Bool)

(assert (=> b!1358627 m!1244685))

(declare-fun m!1244687 () Bool)

(assert (=> b!1358628 m!1244687))

(assert (=> b!1358508 d!145543))

(declare-fun d!145545 () Bool)

(declare-fun res!902590 () Bool)

(declare-fun e!771180 () Bool)

(assert (=> d!145545 (=> res!902590 e!771180)))

(assert (=> d!145545 (= res!902590 ((_ is Nil!31738) ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120))))))

(assert (=> d!145545 (= (noDuplicate!2284 ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120))) e!771180)))

(declare-fun b!1358629 () Bool)

(declare-fun e!771181 () Bool)

(assert (=> b!1358629 (= e!771180 e!771181)))

(declare-fun res!902591 () Bool)

(assert (=> b!1358629 (=> (not res!902591) (not e!771181))))

(assert (=> b!1358629 (= res!902591 (not (contains!9453 (t!46391 ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120))) (h!32955 ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120))))))))

(declare-fun b!1358630 () Bool)

(assert (=> b!1358630 (= e!771181 (noDuplicate!2284 (t!46391 ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120)))))))

(assert (= (and d!145545 (not res!902590)) b!1358629))

(assert (= (and b!1358629 res!902591) b!1358630))

(declare-fun m!1244689 () Bool)

(assert (=> b!1358629 m!1244689))

(declare-fun m!1244691 () Bool)

(assert (=> b!1358630 m!1244691))

(assert (=> b!1358503 d!145545))

(declare-fun d!145547 () Bool)

(assert (=> d!145547 (= ($colon$colon!814 acc!759 (select (arr!44713 a!3742) from!3120)) (Cons!31737 (select (arr!44713 a!3742) from!3120) acc!759))))

(assert (=> b!1358503 d!145547))

(declare-fun d!145549 () Bool)

(assert (=> d!145549 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358509 d!145549))

(declare-fun d!145553 () Bool)

(declare-fun lt!599619 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!673 (List!31741) (InoxSet (_ BitVec 64)))

(assert (=> d!145553 (= lt!599619 (select (content!673 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771211 () Bool)

(assert (=> d!145553 (= lt!599619 e!771211)))

(declare-fun res!902617 () Bool)

(assert (=> d!145553 (=> (not res!902617) (not e!771211))))

(assert (=> d!145553 (= res!902617 ((_ is Cons!31737) acc!759))))

(assert (=> d!145553 (= (contains!9453 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599619)))

(declare-fun b!1358662 () Bool)

(declare-fun e!771210 () Bool)

(assert (=> b!1358662 (= e!771211 e!771210)))

(declare-fun res!902618 () Bool)

(assert (=> b!1358662 (=> res!902618 e!771210)))

(assert (=> b!1358662 (= res!902618 (= (h!32955 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358663 () Bool)

(assert (=> b!1358663 (= e!771210 (contains!9453 (t!46391 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145553 res!902617) b!1358662))

(assert (= (and b!1358662 (not res!902618)) b!1358663))

(declare-fun m!1244719 () Bool)

(assert (=> d!145553 m!1244719))

(declare-fun m!1244721 () Bool)

(assert (=> d!145553 m!1244721))

(declare-fun m!1244723 () Bool)

(assert (=> b!1358663 m!1244723))

(assert (=> b!1358499 d!145553))

(declare-fun bm!65313 () Bool)

(declare-fun c!127470 () Bool)

(declare-fun call!65316 () Bool)

(assert (=> bm!65313 (= call!65316 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127470 (Cons!31737 (select (arr!44713 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1358666 () Bool)

(declare-fun e!771217 () Bool)

(declare-fun e!771216 () Bool)

(assert (=> b!1358666 (= e!771217 e!771216)))

(declare-fun res!902623 () Bool)

(assert (=> b!1358666 (=> (not res!902623) (not e!771216))))

(declare-fun e!771214 () Bool)

(assert (=> b!1358666 (= res!902623 (not e!771214))))

(declare-fun res!902621 () Bool)

(assert (=> b!1358666 (=> (not res!902621) (not e!771214))))

(assert (=> b!1358666 (= res!902621 (validKeyInArray!0 (select (arr!44713 a!3742) from!3120)))))

(declare-fun b!1358667 () Bool)

(declare-fun e!771215 () Bool)

(assert (=> b!1358667 (= e!771215 call!65316)))

(declare-fun b!1358668 () Bool)

(assert (=> b!1358668 (= e!771216 e!771215)))

(assert (=> b!1358668 (= c!127470 (validKeyInArray!0 (select (arr!44713 a!3742) from!3120)))))

(declare-fun d!145565 () Bool)

(declare-fun res!902622 () Bool)

(assert (=> d!145565 (=> res!902622 e!771217)))

(assert (=> d!145565 (= res!902622 (bvsge from!3120 (size!45264 a!3742)))))

(assert (=> d!145565 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771217)))

(declare-fun b!1358669 () Bool)

(assert (=> b!1358669 (= e!771214 (contains!9453 acc!759 (select (arr!44713 a!3742) from!3120)))))

(declare-fun b!1358670 () Bool)

(assert (=> b!1358670 (= e!771215 call!65316)))

(assert (= (and d!145565 (not res!902622)) b!1358666))

(assert (= (and b!1358666 res!902621) b!1358669))

(assert (= (and b!1358666 res!902623) b!1358668))

(assert (= (and b!1358668 c!127470) b!1358670))

(assert (= (and b!1358668 (not c!127470)) b!1358667))

(assert (= (or b!1358670 b!1358667) bm!65313))

(assert (=> bm!65313 m!1244601))

(declare-fun m!1244729 () Bool)

(assert (=> bm!65313 m!1244729))

(assert (=> b!1358666 m!1244601))

(assert (=> b!1358666 m!1244601))

(assert (=> b!1358666 m!1244615))

(assert (=> b!1358668 m!1244601))

(assert (=> b!1358668 m!1244601))

(assert (=> b!1358668 m!1244615))

(assert (=> b!1358669 m!1244601))

(assert (=> b!1358669 m!1244601))

(declare-fun m!1244731 () Bool)

(assert (=> b!1358669 m!1244731))

(assert (=> b!1358505 d!145565))

(declare-fun d!145569 () Bool)

(assert (=> d!145569 (= (array_inv!33994 a!3742) (bvsge (size!45264 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114466 d!145569))

(declare-fun d!145571 () Bool)

(declare-fun lt!599624 () Bool)

(assert (=> d!145571 (= lt!599624 (select (content!673 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771225 () Bool)

(assert (=> d!145571 (= lt!599624 e!771225)))

(declare-fun res!902630 () Bool)

(assert (=> d!145571 (=> (not res!902630) (not e!771225))))

(assert (=> d!145571 (= res!902630 ((_ is Cons!31737) acc!759))))

(assert (=> d!145571 (= (contains!9453 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599624)))

(declare-fun b!1358677 () Bool)

(declare-fun e!771224 () Bool)

(assert (=> b!1358677 (= e!771225 e!771224)))

(declare-fun res!902631 () Bool)

(assert (=> b!1358677 (=> res!902631 e!771224)))

(assert (=> b!1358677 (= res!902631 (= (h!32955 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358678 () Bool)

(assert (=> b!1358678 (= e!771224 (contains!9453 (t!46391 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145571 res!902630) b!1358677))

(assert (= (and b!1358677 (not res!902631)) b!1358678))

(assert (=> d!145571 m!1244719))

(declare-fun m!1244743 () Bool)

(assert (=> d!145571 m!1244743))

(declare-fun m!1244745 () Bool)

(assert (=> b!1358678 m!1244745))

(assert (=> b!1358506 d!145571))

(declare-fun d!145577 () Bool)

(assert (=> d!145577 (= (validKeyInArray!0 (select (arr!44713 a!3742) from!3120)) (and (not (= (select (arr!44713 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44713 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358501 d!145577))

(check-sat (not b!1358598) (not d!145533) (not b!1358587) (not b!1358668) (not b!1358669) (not b!1358630) (not b!1358629) (not b!1358627) (not d!145571) (not b!1358666) (not b!1358601) (not b!1358600) (not b!1358678) (not bm!65305) (not b!1358586) (not d!145553) (not b!1358628) (not b!1358663) (not bm!65313))
(check-sat)
