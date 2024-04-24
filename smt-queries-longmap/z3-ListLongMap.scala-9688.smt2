; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114634 () Bool)

(assert start!114634)

(declare-fun b!1359434 () Bool)

(declare-fun res!903344 () Bool)

(declare-fun e!771662 () Bool)

(assert (=> b!1359434 (=> (not res!903344) (not e!771662))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92572 0))(
  ( (array!92573 (arr!44725 (Array (_ BitVec 32) (_ BitVec 64))) (size!45276 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92572)

(assert (=> b!1359434 (= res!903344 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45276 a!3742)))))

(declare-fun b!1359435 () Bool)

(declare-fun res!903351 () Bool)

(declare-fun e!771664 () Bool)

(assert (=> b!1359435 (=> res!903351 e!771664)))

(declare-datatypes ((List!31753 0))(
  ( (Nil!31750) (Cons!31749 (h!32967 (_ BitVec 64)) (t!46412 List!31753)) )
))
(declare-fun lt!599757 () List!31753)

(declare-fun contains!9465 (List!31753 (_ BitVec 64)) Bool)

(assert (=> b!1359435 (= res!903351 (contains!9465 lt!599757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359436 () Bool)

(declare-fun res!903337 () Bool)

(assert (=> b!1359436 (=> (not res!903337) (not e!771662))))

(declare-fun acc!759 () List!31753)

(assert (=> b!1359436 (= res!903337 (not (contains!9465 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359437 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92572 (_ BitVec 32) List!31753) Bool)

(assert (=> b!1359437 (= e!771664 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599757))))

(declare-datatypes ((Unit!44618 0))(
  ( (Unit!44619) )
))
(declare-fun lt!599756 () Unit!44618)

(declare-fun noDuplicateSubseq!134 (List!31753 List!31753) Unit!44618)

(assert (=> b!1359437 (= lt!599756 (noDuplicateSubseq!134 acc!759 lt!599757))))

(declare-fun b!1359438 () Bool)

(declare-fun res!903341 () Bool)

(assert (=> b!1359438 (=> (not res!903341) (not e!771662))))

(declare-fun noDuplicate!2296 (List!31753) Bool)

(assert (=> b!1359438 (= res!903341 (noDuplicate!2296 acc!759))))

(declare-fun b!1359439 () Bool)

(declare-fun res!903345 () Bool)

(assert (=> b!1359439 (=> res!903345 e!771664)))

(assert (=> b!1359439 (= res!903345 (contains!9465 lt!599757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359440 () Bool)

(declare-fun res!903338 () Bool)

(assert (=> b!1359440 (=> res!903338 e!771664)))

(declare-fun subseq!824 (List!31753 List!31753) Bool)

(assert (=> b!1359440 (= res!903338 (not (subseq!824 acc!759 lt!599757)))))

(declare-fun b!1359441 () Bool)

(declare-fun res!903347 () Bool)

(assert (=> b!1359441 (=> (not res!903347) (not e!771662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359441 (= res!903347 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1359442 () Bool)

(declare-fun res!903346 () Bool)

(assert (=> b!1359442 (=> (not res!903346) (not e!771662))))

(assert (=> b!1359442 (= res!903346 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359443 () Bool)

(declare-fun res!903350 () Bool)

(assert (=> b!1359443 (=> (not res!903350) (not e!771662))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359443 (= res!903350 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45276 a!3742))))))

(declare-fun b!1359444 () Bool)

(declare-fun res!903339 () Bool)

(assert (=> b!1359444 (=> (not res!903339) (not e!771662))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1359444 (= res!903339 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!903349 () Bool)

(assert (=> start!114634 (=> (not res!903349) (not e!771662))))

(assert (=> start!114634 (= res!903349 (and (bvslt (size!45276 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45276 a!3742))))))

(assert (=> start!114634 e!771662))

(assert (=> start!114634 true))

(declare-fun array_inv!34006 (array!92572) Bool)

(assert (=> start!114634 (array_inv!34006 a!3742)))

(declare-fun b!1359445 () Bool)

(declare-fun res!903343 () Bool)

(assert (=> b!1359445 (=> (not res!903343) (not e!771662))))

(assert (=> b!1359445 (= res!903343 (not (contains!9465 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359446 () Bool)

(assert (=> b!1359446 (= e!771662 (not e!771664))))

(declare-fun res!903342 () Bool)

(assert (=> b!1359446 (=> res!903342 e!771664)))

(assert (=> b!1359446 (= res!903342 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!826 (List!31753 (_ BitVec 64)) List!31753)

(assert (=> b!1359446 (= lt!599757 ($colon$colon!826 acc!759 (select (arr!44725 a!3742) from!3120)))))

(assert (=> b!1359446 (subseq!824 acc!759 acc!759)))

(declare-fun lt!599755 () Unit!44618)

(declare-fun lemmaListSubSeqRefl!0 (List!31753) Unit!44618)

(assert (=> b!1359446 (= lt!599755 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1359447 () Bool)

(declare-fun res!903348 () Bool)

(assert (=> b!1359447 (=> res!903348 e!771664)))

(assert (=> b!1359447 (= res!903348 (not (noDuplicate!2296 lt!599757)))))

(declare-fun b!1359448 () Bool)

(declare-fun res!903340 () Bool)

(assert (=> b!1359448 (=> (not res!903340) (not e!771662))))

(assert (=> b!1359448 (= res!903340 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31750))))

(assert (= (and start!114634 res!903349) b!1359438))

(assert (= (and b!1359438 res!903341) b!1359436))

(assert (= (and b!1359436 res!903337) b!1359445))

(assert (= (and b!1359445 res!903343) b!1359448))

(assert (= (and b!1359448 res!903340) b!1359442))

(assert (= (and b!1359442 res!903346) b!1359443))

(assert (= (and b!1359443 res!903350) b!1359444))

(assert (= (and b!1359444 res!903339) b!1359434))

(assert (= (and b!1359434 res!903344) b!1359441))

(assert (= (and b!1359441 res!903347) b!1359446))

(assert (= (and b!1359446 (not res!903342)) b!1359447))

(assert (= (and b!1359447 (not res!903348)) b!1359435))

(assert (= (and b!1359435 (not res!903351)) b!1359439))

(assert (= (and b!1359439 (not res!903345)) b!1359440))

(assert (= (and b!1359440 (not res!903338)) b!1359437))

(declare-fun m!1245343 () Bool)

(assert (=> b!1359444 m!1245343))

(declare-fun m!1245345 () Bool)

(assert (=> b!1359438 m!1245345))

(declare-fun m!1245347 () Bool)

(assert (=> b!1359447 m!1245347))

(declare-fun m!1245349 () Bool)

(assert (=> b!1359441 m!1245349))

(assert (=> b!1359441 m!1245349))

(declare-fun m!1245351 () Bool)

(assert (=> b!1359441 m!1245351))

(declare-fun m!1245353 () Bool)

(assert (=> b!1359436 m!1245353))

(declare-fun m!1245355 () Bool)

(assert (=> b!1359440 m!1245355))

(assert (=> b!1359446 m!1245349))

(assert (=> b!1359446 m!1245349))

(declare-fun m!1245357 () Bool)

(assert (=> b!1359446 m!1245357))

(declare-fun m!1245359 () Bool)

(assert (=> b!1359446 m!1245359))

(declare-fun m!1245361 () Bool)

(assert (=> b!1359446 m!1245361))

(declare-fun m!1245363 () Bool)

(assert (=> b!1359437 m!1245363))

(declare-fun m!1245365 () Bool)

(assert (=> b!1359437 m!1245365))

(declare-fun m!1245367 () Bool)

(assert (=> b!1359448 m!1245367))

(declare-fun m!1245369 () Bool)

(assert (=> b!1359442 m!1245369))

(declare-fun m!1245371 () Bool)

(assert (=> start!114634 m!1245371))

(declare-fun m!1245373 () Bool)

(assert (=> b!1359439 m!1245373))

(declare-fun m!1245375 () Bool)

(assert (=> b!1359435 m!1245375))

(declare-fun m!1245377 () Bool)

(assert (=> b!1359445 m!1245377))

(check-sat (not b!1359445) (not b!1359441) (not b!1359437) (not b!1359436) (not b!1359442) (not b!1359440) (not b!1359438) (not b!1359446) (not b!1359448) (not b!1359439) (not b!1359444) (not b!1359435) (not start!114634) (not b!1359447))
(check-sat)
(get-model)

(declare-fun e!771694 () Bool)

(declare-fun b!1359549 () Bool)

(assert (=> b!1359549 (= e!771694 (contains!9465 lt!599757 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359550 () Bool)

(declare-fun e!771691 () Bool)

(declare-fun e!771693 () Bool)

(assert (=> b!1359550 (= e!771691 e!771693)))

(declare-fun c!127498 () Bool)

(assert (=> b!1359550 (= c!127498 (validKeyInArray!0 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1359551 () Bool)

(declare-fun call!65344 () Bool)

(assert (=> b!1359551 (= e!771693 call!65344)))

(declare-fun d!145785 () Bool)

(declare-fun res!903448 () Bool)

(declare-fun e!771692 () Bool)

(assert (=> d!145785 (=> res!903448 e!771692)))

(assert (=> d!145785 (= res!903448 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45276 a!3742)))))

(assert (=> d!145785 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599757) e!771692)))

(declare-fun b!1359552 () Bool)

(assert (=> b!1359552 (= e!771693 call!65344)))

(declare-fun b!1359553 () Bool)

(assert (=> b!1359553 (= e!771692 e!771691)))

(declare-fun res!903450 () Bool)

(assert (=> b!1359553 (=> (not res!903450) (not e!771691))))

(assert (=> b!1359553 (= res!903450 (not e!771694))))

(declare-fun res!903449 () Bool)

(assert (=> b!1359553 (=> (not res!903449) (not e!771694))))

(assert (=> b!1359553 (= res!903449 (validKeyInArray!0 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65341 () Bool)

(assert (=> bm!65341 (= call!65344 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127498 (Cons!31749 (select (arr!44725 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!599757) lt!599757)))))

(assert (= (and d!145785 (not res!903448)) b!1359553))

(assert (= (and b!1359553 res!903449) b!1359549))

(assert (= (and b!1359553 res!903450) b!1359550))

(assert (= (and b!1359550 c!127498) b!1359551))

(assert (= (and b!1359550 (not c!127498)) b!1359552))

(assert (= (or b!1359551 b!1359552) bm!65341))

(declare-fun m!1245451 () Bool)

(assert (=> b!1359549 m!1245451))

(assert (=> b!1359549 m!1245451))

(declare-fun m!1245453 () Bool)

(assert (=> b!1359549 m!1245453))

(assert (=> b!1359550 m!1245451))

(assert (=> b!1359550 m!1245451))

(declare-fun m!1245455 () Bool)

(assert (=> b!1359550 m!1245455))

(assert (=> b!1359553 m!1245451))

(assert (=> b!1359553 m!1245451))

(assert (=> b!1359553 m!1245455))

(assert (=> bm!65341 m!1245451))

(declare-fun m!1245457 () Bool)

(assert (=> bm!65341 m!1245457))

(assert (=> b!1359437 d!145785))

(declare-fun d!145787 () Bool)

(assert (=> d!145787 (noDuplicate!2296 acc!759)))

(declare-fun lt!599778 () Unit!44618)

(declare-fun choose!1992 (List!31753 List!31753) Unit!44618)

(assert (=> d!145787 (= lt!599778 (choose!1992 acc!759 lt!599757))))

(declare-fun e!771697 () Bool)

(assert (=> d!145787 e!771697))

(declare-fun res!903453 () Bool)

(assert (=> d!145787 (=> (not res!903453) (not e!771697))))

(assert (=> d!145787 (= res!903453 (subseq!824 acc!759 lt!599757))))

(assert (=> d!145787 (= (noDuplicateSubseq!134 acc!759 lt!599757) lt!599778)))

(declare-fun b!1359556 () Bool)

(assert (=> b!1359556 (= e!771697 (noDuplicate!2296 lt!599757))))

(assert (= (and d!145787 res!903453) b!1359556))

(assert (=> d!145787 m!1245345))

(declare-fun m!1245459 () Bool)

(assert (=> d!145787 m!1245459))

(assert (=> d!145787 m!1245355))

(assert (=> b!1359556 m!1245347))

(assert (=> b!1359437 d!145787))

(declare-fun b!1359557 () Bool)

(declare-fun e!771701 () Bool)

(assert (=> b!1359557 (= e!771701 (contains!9465 Nil!31750 (select (arr!44725 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359558 () Bool)

(declare-fun e!771698 () Bool)

(declare-fun e!771700 () Bool)

(assert (=> b!1359558 (= e!771698 e!771700)))

(declare-fun c!127499 () Bool)

(assert (=> b!1359558 (= c!127499 (validKeyInArray!0 (select (arr!44725 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1359559 () Bool)

(declare-fun call!65345 () Bool)

(assert (=> b!1359559 (= e!771700 call!65345)))

(declare-fun d!145789 () Bool)

(declare-fun res!903454 () Bool)

(declare-fun e!771699 () Bool)

(assert (=> d!145789 (=> res!903454 e!771699)))

(assert (=> d!145789 (= res!903454 (bvsge #b00000000000000000000000000000000 (size!45276 a!3742)))))

(assert (=> d!145789 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31750) e!771699)))

(declare-fun b!1359560 () Bool)

(assert (=> b!1359560 (= e!771700 call!65345)))

(declare-fun b!1359561 () Bool)

(assert (=> b!1359561 (= e!771699 e!771698)))

(declare-fun res!903456 () Bool)

(assert (=> b!1359561 (=> (not res!903456) (not e!771698))))

(assert (=> b!1359561 (= res!903456 (not e!771701))))

(declare-fun res!903455 () Bool)

(assert (=> b!1359561 (=> (not res!903455) (not e!771701))))

(assert (=> b!1359561 (= res!903455 (validKeyInArray!0 (select (arr!44725 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65342 () Bool)

(assert (=> bm!65342 (= call!65345 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127499 (Cons!31749 (select (arr!44725 a!3742) #b00000000000000000000000000000000) Nil!31750) Nil!31750)))))

(assert (= (and d!145789 (not res!903454)) b!1359561))

(assert (= (and b!1359561 res!903455) b!1359557))

(assert (= (and b!1359561 res!903456) b!1359558))

(assert (= (and b!1359558 c!127499) b!1359559))

(assert (= (and b!1359558 (not c!127499)) b!1359560))

(assert (= (or b!1359559 b!1359560) bm!65342))

(declare-fun m!1245461 () Bool)

(assert (=> b!1359557 m!1245461))

(assert (=> b!1359557 m!1245461))

(declare-fun m!1245463 () Bool)

(assert (=> b!1359557 m!1245463))

(assert (=> b!1359558 m!1245461))

(assert (=> b!1359558 m!1245461))

(declare-fun m!1245465 () Bool)

(assert (=> b!1359558 m!1245465))

(assert (=> b!1359561 m!1245461))

(assert (=> b!1359561 m!1245461))

(assert (=> b!1359561 m!1245465))

(assert (=> bm!65342 m!1245461))

(declare-fun m!1245467 () Bool)

(assert (=> bm!65342 m!1245467))

(assert (=> b!1359448 d!145789))

(declare-fun d!145791 () Bool)

(declare-fun res!903461 () Bool)

(declare-fun e!771706 () Bool)

(assert (=> d!145791 (=> res!903461 e!771706)))

(get-info :version)

(assert (=> d!145791 (= res!903461 ((_ is Nil!31750) acc!759))))

(assert (=> d!145791 (= (noDuplicate!2296 acc!759) e!771706)))

(declare-fun b!1359566 () Bool)

(declare-fun e!771707 () Bool)

(assert (=> b!1359566 (= e!771706 e!771707)))

(declare-fun res!903462 () Bool)

(assert (=> b!1359566 (=> (not res!903462) (not e!771707))))

(assert (=> b!1359566 (= res!903462 (not (contains!9465 (t!46412 acc!759) (h!32967 acc!759))))))

(declare-fun b!1359567 () Bool)

(assert (=> b!1359567 (= e!771707 (noDuplicate!2296 (t!46412 acc!759)))))

(assert (= (and d!145791 (not res!903461)) b!1359566))

(assert (= (and b!1359566 res!903462) b!1359567))

(declare-fun m!1245469 () Bool)

(assert (=> b!1359566 m!1245469))

(declare-fun m!1245471 () Bool)

(assert (=> b!1359567 m!1245471))

(assert (=> b!1359438 d!145791))

(declare-fun d!145797 () Bool)

(assert (=> d!145797 (= (array_inv!34006 a!3742) (bvsge (size!45276 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114634 d!145797))

(declare-fun d!145801 () Bool)

(declare-fun lt!599783 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!682 (List!31753) (InoxSet (_ BitVec 64)))

(assert (=> d!145801 (= lt!599783 (select (content!682 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771722 () Bool)

(assert (=> d!145801 (= lt!599783 e!771722)))

(declare-fun res!903478 () Bool)

(assert (=> d!145801 (=> (not res!903478) (not e!771722))))

(assert (=> d!145801 (= res!903478 ((_ is Cons!31749) acc!759))))

(assert (=> d!145801 (= (contains!9465 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599783)))

(declare-fun b!1359582 () Bool)

(declare-fun e!771723 () Bool)

(assert (=> b!1359582 (= e!771722 e!771723)))

(declare-fun res!903477 () Bool)

(assert (=> b!1359582 (=> res!903477 e!771723)))

(assert (=> b!1359582 (= res!903477 (= (h!32967 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359583 () Bool)

(assert (=> b!1359583 (= e!771723 (contains!9465 (t!46412 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145801 res!903478) b!1359582))

(assert (= (and b!1359582 (not res!903477)) b!1359583))

(declare-fun m!1245477 () Bool)

(assert (=> d!145801 m!1245477))

(declare-fun m!1245479 () Bool)

(assert (=> d!145801 m!1245479))

(declare-fun m!1245481 () Bool)

(assert (=> b!1359583 m!1245481))

(assert (=> b!1359436 d!145801))

(declare-fun d!145805 () Bool)

(declare-fun res!903479 () Bool)

(declare-fun e!771724 () Bool)

(assert (=> d!145805 (=> res!903479 e!771724)))

(assert (=> d!145805 (= res!903479 ((_ is Nil!31750) lt!599757))))

(assert (=> d!145805 (= (noDuplicate!2296 lt!599757) e!771724)))

(declare-fun b!1359584 () Bool)

(declare-fun e!771725 () Bool)

(assert (=> b!1359584 (= e!771724 e!771725)))

(declare-fun res!903480 () Bool)

(assert (=> b!1359584 (=> (not res!903480) (not e!771725))))

(assert (=> b!1359584 (= res!903480 (not (contains!9465 (t!46412 lt!599757) (h!32967 lt!599757))))))

(declare-fun b!1359585 () Bool)

(assert (=> b!1359585 (= e!771725 (noDuplicate!2296 (t!46412 lt!599757)))))

(assert (= (and d!145805 (not res!903479)) b!1359584))

(assert (= (and b!1359584 res!903480) b!1359585))

(declare-fun m!1245483 () Bool)

(assert (=> b!1359584 m!1245483))

(declare-fun m!1245485 () Bool)

(assert (=> b!1359585 m!1245485))

(assert (=> b!1359447 d!145805))

(declare-fun d!145807 () Bool)

(declare-fun lt!599784 () Bool)

(assert (=> d!145807 (= lt!599784 (select (content!682 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771726 () Bool)

(assert (=> d!145807 (= lt!599784 e!771726)))

(declare-fun res!903482 () Bool)

(assert (=> d!145807 (=> (not res!903482) (not e!771726))))

(assert (=> d!145807 (= res!903482 ((_ is Cons!31749) acc!759))))

(assert (=> d!145807 (= (contains!9465 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599784)))

(declare-fun b!1359586 () Bool)

(declare-fun e!771727 () Bool)

(assert (=> b!1359586 (= e!771726 e!771727)))

(declare-fun res!903481 () Bool)

(assert (=> b!1359586 (=> res!903481 e!771727)))

(assert (=> b!1359586 (= res!903481 (= (h!32967 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359587 () Bool)

(assert (=> b!1359587 (= e!771727 (contains!9465 (t!46412 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145807 res!903482) b!1359586))

(assert (= (and b!1359586 (not res!903481)) b!1359587))

(assert (=> d!145807 m!1245477))

(declare-fun m!1245487 () Bool)

(assert (=> d!145807 m!1245487))

(declare-fun m!1245489 () Bool)

(assert (=> b!1359587 m!1245489))

(assert (=> b!1359445 d!145807))

(declare-fun d!145809 () Bool)

(declare-fun lt!599785 () Bool)

(assert (=> d!145809 (= lt!599785 (select (content!682 lt!599757) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771728 () Bool)

(assert (=> d!145809 (= lt!599785 e!771728)))

(declare-fun res!903484 () Bool)

(assert (=> d!145809 (=> (not res!903484) (not e!771728))))

(assert (=> d!145809 (= res!903484 ((_ is Cons!31749) lt!599757))))

(assert (=> d!145809 (= (contains!9465 lt!599757 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599785)))

(declare-fun b!1359588 () Bool)

(declare-fun e!771729 () Bool)

(assert (=> b!1359588 (= e!771728 e!771729)))

(declare-fun res!903483 () Bool)

(assert (=> b!1359588 (=> res!903483 e!771729)))

(assert (=> b!1359588 (= res!903483 (= (h!32967 lt!599757) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359589 () Bool)

(assert (=> b!1359589 (= e!771729 (contains!9465 (t!46412 lt!599757) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145809 res!903484) b!1359588))

(assert (= (and b!1359588 (not res!903483)) b!1359589))

(declare-fun m!1245491 () Bool)

(assert (=> d!145809 m!1245491))

(declare-fun m!1245493 () Bool)

(assert (=> d!145809 m!1245493))

(declare-fun m!1245495 () Bool)

(assert (=> b!1359589 m!1245495))

(assert (=> b!1359435 d!145809))

(declare-fun d!145811 () Bool)

(assert (=> d!145811 (= ($colon$colon!826 acc!759 (select (arr!44725 a!3742) from!3120)) (Cons!31749 (select (arr!44725 a!3742) from!3120) acc!759))))

(assert (=> b!1359446 d!145811))

(declare-fun b!1359611 () Bool)

(declare-fun e!771752 () Bool)

(declare-fun e!771751 () Bool)

(assert (=> b!1359611 (= e!771752 e!771751)))

(declare-fun res!903508 () Bool)

(assert (=> b!1359611 (=> res!903508 e!771751)))

(declare-fun e!771750 () Bool)

(assert (=> b!1359611 (= res!903508 e!771750)))

(declare-fun res!903506 () Bool)

(assert (=> b!1359611 (=> (not res!903506) (not e!771750))))

(assert (=> b!1359611 (= res!903506 (= (h!32967 acc!759) (h!32967 acc!759)))))

(declare-fun d!145815 () Bool)

(declare-fun res!903507 () Bool)

(declare-fun e!771753 () Bool)

(assert (=> d!145815 (=> res!903507 e!771753)))

(assert (=> d!145815 (= res!903507 ((_ is Nil!31750) acc!759))))

(assert (=> d!145815 (= (subseq!824 acc!759 acc!759) e!771753)))

(declare-fun b!1359610 () Bool)

(assert (=> b!1359610 (= e!771753 e!771752)))

(declare-fun res!903505 () Bool)

(assert (=> b!1359610 (=> (not res!903505) (not e!771752))))

(assert (=> b!1359610 (= res!903505 ((_ is Cons!31749) acc!759))))

(declare-fun b!1359612 () Bool)

(assert (=> b!1359612 (= e!771750 (subseq!824 (t!46412 acc!759) (t!46412 acc!759)))))

(declare-fun b!1359613 () Bool)

(assert (=> b!1359613 (= e!771751 (subseq!824 acc!759 (t!46412 acc!759)))))

(assert (= (and d!145815 (not res!903507)) b!1359610))

(assert (= (and b!1359610 res!903505) b!1359611))

(assert (= (and b!1359611 res!903506) b!1359612))

(assert (= (and b!1359611 (not res!903508)) b!1359613))

(declare-fun m!1245519 () Bool)

(assert (=> b!1359612 m!1245519))

(declare-fun m!1245521 () Bool)

(assert (=> b!1359613 m!1245521))

(assert (=> b!1359446 d!145815))

(declare-fun d!145823 () Bool)

(assert (=> d!145823 (subseq!824 acc!759 acc!759)))

(declare-fun lt!599793 () Unit!44618)

(declare-fun choose!36 (List!31753) Unit!44618)

(assert (=> d!145823 (= lt!599793 (choose!36 acc!759))))

(assert (=> d!145823 (= (lemmaListSubSeqRefl!0 acc!759) lt!599793)))

(declare-fun bs!38965 () Bool)

(assert (= bs!38965 d!145823))

(assert (=> bs!38965 m!1245359))

(declare-fun m!1245523 () Bool)

(assert (=> bs!38965 m!1245523))

(assert (=> b!1359446 d!145823))

(declare-fun d!145825 () Bool)

(assert (=> d!145825 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359444 d!145825))

(declare-fun d!145827 () Bool)

(assert (=> d!145827 (= (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)) (and (not (= (select (arr!44725 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44725 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1359441 d!145827))

(declare-fun e!771765 () Bool)

(declare-fun b!1359624 () Bool)

(assert (=> b!1359624 (= e!771765 (contains!9465 acc!759 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1359625 () Bool)

(declare-fun e!771762 () Bool)

(declare-fun e!771764 () Bool)

(assert (=> b!1359625 (= e!771762 e!771764)))

(declare-fun c!127502 () Bool)

(assert (=> b!1359625 (= c!127502 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(declare-fun b!1359626 () Bool)

(declare-fun call!65348 () Bool)

(assert (=> b!1359626 (= e!771764 call!65348)))

(declare-fun d!145829 () Bool)

(declare-fun res!903515 () Bool)

(declare-fun e!771763 () Bool)

(assert (=> d!145829 (=> res!903515 e!771763)))

(assert (=> d!145829 (= res!903515 (bvsge from!3120 (size!45276 a!3742)))))

(assert (=> d!145829 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771763)))

(declare-fun b!1359627 () Bool)

(assert (=> b!1359627 (= e!771764 call!65348)))

(declare-fun b!1359628 () Bool)

(assert (=> b!1359628 (= e!771763 e!771762)))

(declare-fun res!903517 () Bool)

(assert (=> b!1359628 (=> (not res!903517) (not e!771762))))

(assert (=> b!1359628 (= res!903517 (not e!771765))))

(declare-fun res!903516 () Bool)

(assert (=> b!1359628 (=> (not res!903516) (not e!771765))))

(assert (=> b!1359628 (= res!903516 (validKeyInArray!0 (select (arr!44725 a!3742) from!3120)))))

(declare-fun bm!65345 () Bool)

(assert (=> bm!65345 (= call!65348 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127502 (Cons!31749 (select (arr!44725 a!3742) from!3120) acc!759) acc!759)))))

(assert (= (and d!145829 (not res!903515)) b!1359628))

(assert (= (and b!1359628 res!903516) b!1359624))

(assert (= (and b!1359628 res!903517) b!1359625))

(assert (= (and b!1359625 c!127502) b!1359626))

(assert (= (and b!1359625 (not c!127502)) b!1359627))

(assert (= (or b!1359626 b!1359627) bm!65345))

(assert (=> b!1359624 m!1245349))

(assert (=> b!1359624 m!1245349))

(declare-fun m!1245525 () Bool)

(assert (=> b!1359624 m!1245525))

(assert (=> b!1359625 m!1245349))

(assert (=> b!1359625 m!1245349))

(assert (=> b!1359625 m!1245351))

(assert (=> b!1359628 m!1245349))

(assert (=> b!1359628 m!1245349))

(assert (=> b!1359628 m!1245351))

(assert (=> bm!65345 m!1245349))

(declare-fun m!1245527 () Bool)

(assert (=> bm!65345 m!1245527))

(assert (=> b!1359442 d!145829))

(declare-fun b!1359630 () Bool)

(declare-fun e!771768 () Bool)

(declare-fun e!771767 () Bool)

(assert (=> b!1359630 (= e!771768 e!771767)))

(declare-fun res!903521 () Bool)

(assert (=> b!1359630 (=> res!903521 e!771767)))

(declare-fun e!771766 () Bool)

(assert (=> b!1359630 (= res!903521 e!771766)))

(declare-fun res!903519 () Bool)

(assert (=> b!1359630 (=> (not res!903519) (not e!771766))))

(assert (=> b!1359630 (= res!903519 (= (h!32967 acc!759) (h!32967 lt!599757)))))

(declare-fun d!145831 () Bool)

(declare-fun res!903520 () Bool)

(declare-fun e!771769 () Bool)

(assert (=> d!145831 (=> res!903520 e!771769)))

(assert (=> d!145831 (= res!903520 ((_ is Nil!31750) acc!759))))

(assert (=> d!145831 (= (subseq!824 acc!759 lt!599757) e!771769)))

(declare-fun b!1359629 () Bool)

(assert (=> b!1359629 (= e!771769 e!771768)))

(declare-fun res!903518 () Bool)

(assert (=> b!1359629 (=> (not res!903518) (not e!771768))))

(assert (=> b!1359629 (= res!903518 ((_ is Cons!31749) lt!599757))))

(declare-fun b!1359631 () Bool)

(assert (=> b!1359631 (= e!771766 (subseq!824 (t!46412 acc!759) (t!46412 lt!599757)))))

(declare-fun b!1359632 () Bool)

(assert (=> b!1359632 (= e!771767 (subseq!824 acc!759 (t!46412 lt!599757)))))

(assert (= (and d!145831 (not res!903520)) b!1359629))

(assert (= (and b!1359629 res!903518) b!1359630))

(assert (= (and b!1359630 res!903519) b!1359631))

(assert (= (and b!1359630 (not res!903521)) b!1359632))

(declare-fun m!1245529 () Bool)

(assert (=> b!1359631 m!1245529))

(declare-fun m!1245531 () Bool)

(assert (=> b!1359632 m!1245531))

(assert (=> b!1359440 d!145831))

(declare-fun d!145833 () Bool)

(declare-fun lt!599794 () Bool)

(assert (=> d!145833 (= lt!599794 (select (content!682 lt!599757) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771770 () Bool)

(assert (=> d!145833 (= lt!599794 e!771770)))

(declare-fun res!903523 () Bool)

(assert (=> d!145833 (=> (not res!903523) (not e!771770))))

(assert (=> d!145833 (= res!903523 ((_ is Cons!31749) lt!599757))))

(assert (=> d!145833 (= (contains!9465 lt!599757 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599794)))

(declare-fun b!1359633 () Bool)

(declare-fun e!771771 () Bool)

(assert (=> b!1359633 (= e!771770 e!771771)))

(declare-fun res!903522 () Bool)

(assert (=> b!1359633 (=> res!903522 e!771771)))

(assert (=> b!1359633 (= res!903522 (= (h!32967 lt!599757) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1359634 () Bool)

(assert (=> b!1359634 (= e!771771 (contains!9465 (t!46412 lt!599757) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145833 res!903523) b!1359633))

(assert (= (and b!1359633 (not res!903522)) b!1359634))

(assert (=> d!145833 m!1245491))

(declare-fun m!1245533 () Bool)

(assert (=> d!145833 m!1245533))

(declare-fun m!1245535 () Bool)

(assert (=> b!1359634 m!1245535))

(assert (=> b!1359439 d!145833))

(check-sat (not b!1359632) (not b!1359612) (not bm!65342) (not b!1359556) (not b!1359553) (not b!1359634) (not b!1359628) (not d!145823) (not d!145807) (not b!1359625) (not d!145787) (not b!1359587) (not d!145833) (not b!1359613) (not b!1359550) (not b!1359631) (not b!1359557) (not bm!65345) (not d!145809) (not b!1359558) (not b!1359584) (not b!1359624) (not b!1359583) (not b!1359589) (not d!145801) (not b!1359585) (not b!1359549) (not b!1359567) (not b!1359561) (not b!1359566) (not bm!65341))
(check-sat)
