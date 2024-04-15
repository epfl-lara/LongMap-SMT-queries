; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62830 () Bool)

(assert start!62830)

(declare-fun b!708468 () Bool)

(declare-fun res!472254 () Bool)

(declare-fun e!398710 () Bool)

(assert (=> b!708468 (=> (not res!472254) (not e!398710))))

(declare-datatypes ((array!40359 0))(
  ( (array!40360 (arr!19331 (Array (_ BitVec 32) (_ BitVec 64))) (size!19720 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40359)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708468 (= res!472254 (validKeyInArray!0 (select (arr!19331 a!3591) from!2969)))))

(declare-fun b!708469 () Bool)

(declare-fun res!472235 () Bool)

(assert (=> b!708469 (=> (not res!472235) (not e!398710))))

(declare-datatypes ((List!13411 0))(
  ( (Nil!13408) (Cons!13407 (h!14452 (_ BitVec 64)) (t!19693 List!13411)) )
))
(declare-fun newAcc!49 () List!13411)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3933 (List!13411 (_ BitVec 64)) Bool)

(assert (=> b!708469 (= res!472235 (contains!3933 newAcc!49 k0!2824))))

(declare-fun b!708470 () Bool)

(declare-fun res!472236 () Bool)

(assert (=> b!708470 (=> (not res!472236) (not e!398710))))

(assert (=> b!708470 (= res!472236 (not (contains!3933 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708471 () Bool)

(declare-fun res!472245 () Bool)

(declare-fun e!398708 () Bool)

(assert (=> b!708471 (=> (not res!472245) (not e!398708))))

(declare-fun lt!317897 () List!13411)

(assert (=> b!708471 (= res!472245 (not (contains!3933 lt!317897 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708472 () Bool)

(declare-fun res!472239 () Bool)

(assert (=> b!708472 (=> (not res!472239) (not e!398710))))

(declare-fun arrayContainsKey!0 (array!40359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708472 (= res!472239 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!708473 () Bool)

(declare-fun res!472241 () Bool)

(assert (=> b!708473 (=> (not res!472241) (not e!398710))))

(declare-fun acc!652 () List!13411)

(assert (=> b!708473 (= res!472241 (not (contains!3933 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708474 () Bool)

(declare-fun res!472237 () Bool)

(assert (=> b!708474 (=> (not res!472237) (not e!398710))))

(declare-fun noDuplicate!1202 (List!13411) Bool)

(assert (=> b!708474 (= res!472237 (noDuplicate!1202 newAcc!49))))

(declare-fun res!472249 () Bool)

(assert (=> start!62830 (=> (not res!472249) (not e!398710))))

(assert (=> start!62830 (= res!472249 (and (bvslt (size!19720 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19720 a!3591))))))

(assert (=> start!62830 e!398710))

(assert (=> start!62830 true))

(declare-fun array_inv!15214 (array!40359) Bool)

(assert (=> start!62830 (array_inv!15214 a!3591)))

(declare-fun b!708475 () Bool)

(declare-fun res!472252 () Bool)

(assert (=> b!708475 (=> (not res!472252) (not e!398710))))

(declare-fun -!360 (List!13411 (_ BitVec 64)) List!13411)

(assert (=> b!708475 (= res!472252 (= (-!360 newAcc!49 k0!2824) acc!652))))

(declare-fun b!708476 () Bool)

(assert (=> b!708476 (= e!398708 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!708477 () Bool)

(declare-fun res!472240 () Bool)

(assert (=> b!708477 (=> (not res!472240) (not e!398710))))

(declare-fun arrayNoDuplicates!0 (array!40359 (_ BitVec 32) List!13411) Bool)

(assert (=> b!708477 (= res!472240 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708478 () Bool)

(declare-fun res!472234 () Bool)

(assert (=> b!708478 (=> (not res!472234) (not e!398708))))

(assert (=> b!708478 (= res!472234 (noDuplicate!1202 lt!317897))))

(declare-fun b!708479 () Bool)

(declare-fun res!472253 () Bool)

(assert (=> b!708479 (=> (not res!472253) (not e!398710))))

(declare-fun subseq!395 (List!13411 List!13411) Bool)

(assert (=> b!708479 (= res!472253 (subseq!395 acc!652 newAcc!49))))

(declare-fun b!708480 () Bool)

(declare-fun res!472244 () Bool)

(assert (=> b!708480 (=> (not res!472244) (not e!398710))))

(assert (=> b!708480 (= res!472244 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19720 a!3591)))))

(declare-fun b!708481 () Bool)

(declare-fun res!472250 () Bool)

(assert (=> b!708481 (=> (not res!472250) (not e!398710))))

(assert (=> b!708481 (= res!472250 (noDuplicate!1202 acc!652))))

(declare-fun b!708482 () Bool)

(declare-fun res!472251 () Bool)

(assert (=> b!708482 (=> (not res!472251) (not e!398710))))

(assert (=> b!708482 (= res!472251 (not (contains!3933 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708483 () Bool)

(declare-fun res!472248 () Bool)

(assert (=> b!708483 (=> (not res!472248) (not e!398708))))

(assert (=> b!708483 (= res!472248 (not (contains!3933 lt!317897 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708484 () Bool)

(declare-fun res!472238 () Bool)

(assert (=> b!708484 (=> (not res!472238) (not e!398710))))

(assert (=> b!708484 (= res!472238 (not (contains!3933 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708485 () Bool)

(declare-fun res!472242 () Bool)

(assert (=> b!708485 (=> (not res!472242) (not e!398708))))

(declare-fun $colon$colon!505 (List!13411 (_ BitVec 64)) List!13411)

(assert (=> b!708485 (= res!472242 (noDuplicate!1202 ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969))))))

(declare-fun b!708486 () Bool)

(declare-fun res!472243 () Bool)

(assert (=> b!708486 (=> (not res!472243) (not e!398710))))

(assert (=> b!708486 (= res!472243 (validKeyInArray!0 k0!2824))))

(declare-fun b!708487 () Bool)

(declare-fun res!472246 () Bool)

(assert (=> b!708487 (=> (not res!472246) (not e!398710))))

(assert (=> b!708487 (= res!472246 (not (contains!3933 acc!652 k0!2824)))))

(declare-fun b!708488 () Bool)

(assert (=> b!708488 (= e!398710 e!398708)))

(declare-fun res!472247 () Bool)

(assert (=> b!708488 (=> (not res!472247) (not e!398708))))

(assert (=> b!708488 (= res!472247 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708488 (= lt!317897 ($colon$colon!505 acc!652 (select (arr!19331 a!3591) from!2969)))))

(assert (= (and start!62830 res!472249) b!708481))

(assert (= (and b!708481 res!472250) b!708474))

(assert (= (and b!708474 res!472237) b!708473))

(assert (= (and b!708473 res!472241) b!708484))

(assert (= (and b!708484 res!472238) b!708472))

(assert (= (and b!708472 res!472239) b!708487))

(assert (= (and b!708487 res!472246) b!708486))

(assert (= (and b!708486 res!472243) b!708477))

(assert (= (and b!708477 res!472240) b!708479))

(assert (= (and b!708479 res!472253) b!708469))

(assert (= (and b!708469 res!472235) b!708475))

(assert (= (and b!708475 res!472252) b!708470))

(assert (= (and b!708470 res!472236) b!708482))

(assert (= (and b!708482 res!472251) b!708480))

(assert (= (and b!708480 res!472244) b!708468))

(assert (= (and b!708468 res!472254) b!708488))

(assert (= (and b!708488 res!472247) b!708478))

(assert (= (and b!708478 res!472234) b!708485))

(assert (= (and b!708485 res!472242) b!708483))

(assert (= (and b!708483 res!472248) b!708471))

(assert (= (and b!708471 res!472245) b!708476))

(declare-fun m!665379 () Bool)

(assert (=> b!708469 m!665379))

(declare-fun m!665381 () Bool)

(assert (=> b!708475 m!665381))

(declare-fun m!665383 () Bool)

(assert (=> b!708486 m!665383))

(declare-fun m!665385 () Bool)

(assert (=> b!708473 m!665385))

(declare-fun m!665387 () Bool)

(assert (=> b!708474 m!665387))

(declare-fun m!665389 () Bool)

(assert (=> b!708487 m!665389))

(declare-fun m!665391 () Bool)

(assert (=> b!708483 m!665391))

(declare-fun m!665393 () Bool)

(assert (=> b!708485 m!665393))

(assert (=> b!708485 m!665393))

(declare-fun m!665395 () Bool)

(assert (=> b!708485 m!665395))

(assert (=> b!708485 m!665395))

(declare-fun m!665397 () Bool)

(assert (=> b!708485 m!665397))

(declare-fun m!665399 () Bool)

(assert (=> b!708478 m!665399))

(assert (=> b!708488 m!665393))

(assert (=> b!708488 m!665393))

(declare-fun m!665401 () Bool)

(assert (=> b!708488 m!665401))

(declare-fun m!665403 () Bool)

(assert (=> b!708482 m!665403))

(declare-fun m!665405 () Bool)

(assert (=> b!708471 m!665405))

(assert (=> b!708468 m!665393))

(assert (=> b!708468 m!665393))

(declare-fun m!665407 () Bool)

(assert (=> b!708468 m!665407))

(declare-fun m!665409 () Bool)

(assert (=> b!708472 m!665409))

(declare-fun m!665411 () Bool)

(assert (=> b!708484 m!665411))

(declare-fun m!665413 () Bool)

(assert (=> start!62830 m!665413))

(declare-fun m!665415 () Bool)

(assert (=> b!708477 m!665415))

(declare-fun m!665417 () Bool)

(assert (=> b!708470 m!665417))

(declare-fun m!665419 () Bool)

(assert (=> b!708481 m!665419))

(declare-fun m!665421 () Bool)

(assert (=> b!708479 m!665421))

(declare-fun m!665423 () Bool)

(assert (=> b!708476 m!665423))

(check-sat (not b!708488) (not b!708484) (not b!708482) (not b!708469) (not b!708470) (not b!708477) (not b!708476) (not b!708468) (not start!62830) (not b!708475) (not b!708479) (not b!708478) (not b!708474) (not b!708487) (not b!708483) (not b!708471) (not b!708473) (not b!708486) (not b!708472) (not b!708481) (not b!708485))
(check-sat)
(get-model)

(declare-fun d!96725 () Bool)

(declare-fun lt!317906 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!340 (List!13411) (InoxSet (_ BitVec 64)))

(assert (=> d!96725 (= lt!317906 (select (content!340 acc!652) k0!2824))))

(declare-fun e!398734 () Bool)

(assert (=> d!96725 (= lt!317906 e!398734)))

(declare-fun res!472386 () Bool)

(assert (=> d!96725 (=> (not res!472386) (not e!398734))))

(get-info :version)

(assert (=> d!96725 (= res!472386 ((_ is Cons!13407) acc!652))))

(assert (=> d!96725 (= (contains!3933 acc!652 k0!2824) lt!317906)))

(declare-fun b!708619 () Bool)

(declare-fun e!398733 () Bool)

(assert (=> b!708619 (= e!398734 e!398733)))

(declare-fun res!472385 () Bool)

(assert (=> b!708619 (=> res!472385 e!398733)))

(assert (=> b!708619 (= res!472385 (= (h!14452 acc!652) k0!2824))))

(declare-fun b!708620 () Bool)

(assert (=> b!708620 (= e!398733 (contains!3933 (t!19693 acc!652) k0!2824))))

(assert (= (and d!96725 res!472386) b!708619))

(assert (= (and b!708619 (not res!472385)) b!708620))

(declare-fun m!665517 () Bool)

(assert (=> d!96725 m!665517))

(declare-fun m!665519 () Bool)

(assert (=> d!96725 m!665519))

(declare-fun m!665521 () Bool)

(assert (=> b!708620 m!665521))

(assert (=> b!708487 d!96725))

(declare-fun d!96727 () Bool)

(declare-fun res!472391 () Bool)

(declare-fun e!398739 () Bool)

(assert (=> d!96727 (=> res!472391 e!398739)))

(assert (=> d!96727 (= res!472391 (= (select (arr!19331 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!96727 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!398739)))

(declare-fun b!708625 () Bool)

(declare-fun e!398740 () Bool)

(assert (=> b!708625 (= e!398739 e!398740)))

(declare-fun res!472392 () Bool)

(assert (=> b!708625 (=> (not res!472392) (not e!398740))))

(assert (=> b!708625 (= res!472392 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19720 a!3591)))))

(declare-fun b!708626 () Bool)

(assert (=> b!708626 (= e!398740 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96727 (not res!472391)) b!708625))

(assert (= (and b!708625 res!472392) b!708626))

(declare-fun m!665523 () Bool)

(assert (=> d!96727 m!665523))

(declare-fun m!665525 () Bool)

(assert (=> b!708626 m!665525))

(assert (=> b!708476 d!96727))

(declare-fun d!96731 () Bool)

(declare-fun res!472401 () Bool)

(declare-fun e!398749 () Bool)

(assert (=> d!96731 (=> res!472401 e!398749)))

(assert (=> d!96731 (= res!472401 ((_ is Nil!13408) lt!317897))))

(assert (=> d!96731 (= (noDuplicate!1202 lt!317897) e!398749)))

(declare-fun b!708635 () Bool)

(declare-fun e!398750 () Bool)

(assert (=> b!708635 (= e!398749 e!398750)))

(declare-fun res!472402 () Bool)

(assert (=> b!708635 (=> (not res!472402) (not e!398750))))

(assert (=> b!708635 (= res!472402 (not (contains!3933 (t!19693 lt!317897) (h!14452 lt!317897))))))

(declare-fun b!708636 () Bool)

(assert (=> b!708636 (= e!398750 (noDuplicate!1202 (t!19693 lt!317897)))))

(assert (= (and d!96731 (not res!472401)) b!708635))

(assert (= (and b!708635 res!472402) b!708636))

(declare-fun m!665527 () Bool)

(assert (=> b!708635 m!665527))

(declare-fun m!665529 () Bool)

(assert (=> b!708636 m!665529))

(assert (=> b!708478 d!96731))

(declare-fun d!96733 () Bool)

(assert (=> d!96733 (= (array_inv!15214 a!3591) (bvsge (size!19720 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62830 d!96733))

(declare-fun d!96735 () Bool)

(assert (=> d!96735 (= ($colon$colon!505 acc!652 (select (arr!19331 a!3591) from!2969)) (Cons!13407 (select (arr!19331 a!3591) from!2969) acc!652))))

(assert (=> b!708488 d!96735))

(declare-fun b!708667 () Bool)

(declare-fun e!398777 () Bool)

(declare-fun call!34392 () Bool)

(assert (=> b!708667 (= e!398777 call!34392)))

(declare-fun b!708668 () Bool)

(declare-fun e!398778 () Bool)

(assert (=> b!708668 (= e!398778 e!398777)))

(declare-fun c!78490 () Bool)

(assert (=> b!708668 (= c!78490 (validKeyInArray!0 (select (arr!19331 a!3591) from!2969)))))

(declare-fun d!96739 () Bool)

(declare-fun res!472422 () Bool)

(declare-fun e!398779 () Bool)

(assert (=> d!96739 (=> res!472422 e!398779)))

(assert (=> d!96739 (= res!472422 (bvsge from!2969 (size!19720 a!3591)))))

(assert (=> d!96739 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398779)))

(declare-fun b!708669 () Bool)

(assert (=> b!708669 (= e!398777 call!34392)))

(declare-fun bm!34389 () Bool)

(assert (=> bm!34389 (= call!34392 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78490 (Cons!13407 (select (arr!19331 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!708670 () Bool)

(assert (=> b!708670 (= e!398779 e!398778)))

(declare-fun res!472421 () Bool)

(assert (=> b!708670 (=> (not res!472421) (not e!398778))))

(declare-fun e!398776 () Bool)

(assert (=> b!708670 (= res!472421 (not e!398776))))

(declare-fun res!472423 () Bool)

(assert (=> b!708670 (=> (not res!472423) (not e!398776))))

(assert (=> b!708670 (= res!472423 (validKeyInArray!0 (select (arr!19331 a!3591) from!2969)))))

(declare-fun b!708671 () Bool)

(assert (=> b!708671 (= e!398776 (contains!3933 acc!652 (select (arr!19331 a!3591) from!2969)))))

(assert (= (and d!96739 (not res!472422)) b!708670))

(assert (= (and b!708670 res!472423) b!708671))

(assert (= (and b!708670 res!472421) b!708668))

(assert (= (and b!708668 c!78490) b!708667))

(assert (= (and b!708668 (not c!78490)) b!708669))

(assert (= (or b!708667 b!708669) bm!34389))

(assert (=> b!708668 m!665393))

(assert (=> b!708668 m!665393))

(assert (=> b!708668 m!665407))

(assert (=> bm!34389 m!665393))

(declare-fun m!665547 () Bool)

(assert (=> bm!34389 m!665547))

(assert (=> b!708670 m!665393))

(assert (=> b!708670 m!665393))

(assert (=> b!708670 m!665407))

(assert (=> b!708671 m!665393))

(assert (=> b!708671 m!665393))

(declare-fun m!665549 () Bool)

(assert (=> b!708671 m!665549))

(assert (=> b!708477 d!96739))

(declare-fun b!708710 () Bool)

(declare-fun e!398809 () Bool)

(assert (=> b!708710 (= e!398809 (subseq!395 acc!652 (t!19693 newAcc!49)))))

(declare-fun b!708707 () Bool)

(declare-fun e!398810 () Bool)

(assert (=> b!708707 (= e!398810 e!398809)))

(declare-fun res!472450 () Bool)

(assert (=> b!708707 (=> res!472450 e!398809)))

(declare-fun e!398812 () Bool)

(assert (=> b!708707 (= res!472450 e!398812)))

(declare-fun res!472453 () Bool)

(assert (=> b!708707 (=> (not res!472453) (not e!398812))))

(assert (=> b!708707 (= res!472453 (= (h!14452 acc!652) (h!14452 newAcc!49)))))

(declare-fun b!708705 () Bool)

(declare-fun e!398811 () Bool)

(assert (=> b!708705 (= e!398811 e!398810)))

(declare-fun res!472452 () Bool)

(assert (=> b!708705 (=> (not res!472452) (not e!398810))))

(assert (=> b!708705 (= res!472452 ((_ is Cons!13407) newAcc!49))))

(declare-fun b!708709 () Bool)

(assert (=> b!708709 (= e!398812 (subseq!395 (t!19693 acc!652) (t!19693 newAcc!49)))))

(declare-fun d!96751 () Bool)

(declare-fun res!472449 () Bool)

(assert (=> d!96751 (=> res!472449 e!398811)))

(assert (=> d!96751 (= res!472449 ((_ is Nil!13408) acc!652))))

(assert (=> d!96751 (= (subseq!395 acc!652 newAcc!49) e!398811)))

(assert (= (and d!96751 (not res!472449)) b!708705))

(assert (= (and b!708705 res!472452) b!708707))

(assert (= (and b!708707 res!472453) b!708709))

(assert (= (and b!708707 (not res!472450)) b!708710))

(declare-fun m!665583 () Bool)

(assert (=> b!708710 m!665583))

(declare-fun m!665585 () Bool)

(assert (=> b!708709 m!665585))

(assert (=> b!708479 d!96751))

(declare-fun d!96763 () Bool)

(assert (=> d!96763 (= (validKeyInArray!0 (select (arr!19331 a!3591) from!2969)) (and (not (= (select (arr!19331 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19331 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708468 d!96763))

(declare-fun d!96765 () Bool)

(declare-fun lt!317920 () Bool)

(assert (=> d!96765 (= lt!317920 (select (content!340 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398816 () Bool)

(assert (=> d!96765 (= lt!317920 e!398816)))

(declare-fun res!472456 () Bool)

(assert (=> d!96765 (=> (not res!472456) (not e!398816))))

(assert (=> d!96765 (= res!472456 ((_ is Cons!13407) newAcc!49))))

(assert (=> d!96765 (= (contains!3933 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317920)))

(declare-fun b!708711 () Bool)

(declare-fun e!398815 () Bool)

(assert (=> b!708711 (= e!398816 e!398815)))

(declare-fun res!472455 () Bool)

(assert (=> b!708711 (=> res!472455 e!398815)))

(assert (=> b!708711 (= res!472455 (= (h!14452 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708712 () Bool)

(assert (=> b!708712 (= e!398815 (contains!3933 (t!19693 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96765 res!472456) b!708711))

(assert (= (and b!708711 (not res!472455)) b!708712))

(declare-fun m!665587 () Bool)

(assert (=> d!96765 m!665587))

(declare-fun m!665589 () Bool)

(assert (=> d!96765 m!665589))

(declare-fun m!665591 () Bool)

(assert (=> b!708712 m!665591))

(assert (=> b!708470 d!96765))

(declare-fun d!96767 () Bool)

(declare-fun lt!317921 () Bool)

(assert (=> d!96767 (= lt!317921 (select (content!340 newAcc!49) k0!2824))))

(declare-fun e!398822 () Bool)

(assert (=> d!96767 (= lt!317921 e!398822)))

(declare-fun res!472462 () Bool)

(assert (=> d!96767 (=> (not res!472462) (not e!398822))))

(assert (=> d!96767 (= res!472462 ((_ is Cons!13407) newAcc!49))))

(assert (=> d!96767 (= (contains!3933 newAcc!49 k0!2824) lt!317921)))

(declare-fun b!708715 () Bool)

(declare-fun e!398821 () Bool)

(assert (=> b!708715 (= e!398822 e!398821)))

(declare-fun res!472461 () Bool)

(assert (=> b!708715 (=> res!472461 e!398821)))

(assert (=> b!708715 (= res!472461 (= (h!14452 newAcc!49) k0!2824))))

(declare-fun b!708716 () Bool)

(assert (=> b!708716 (= e!398821 (contains!3933 (t!19693 newAcc!49) k0!2824))))

(assert (= (and d!96767 res!472462) b!708715))

(assert (= (and b!708715 (not res!472461)) b!708716))

(assert (=> d!96767 m!665587))

(declare-fun m!665593 () Bool)

(assert (=> d!96767 m!665593))

(declare-fun m!665595 () Bool)

(assert (=> b!708716 m!665595))

(assert (=> b!708469 d!96767))

(declare-fun d!96769 () Bool)

(declare-fun lt!317922 () Bool)

(assert (=> d!96769 (= lt!317922 (select (content!340 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398824 () Bool)

(assert (=> d!96769 (= lt!317922 e!398824)))

(declare-fun res!472464 () Bool)

(assert (=> d!96769 (=> (not res!472464) (not e!398824))))

(assert (=> d!96769 (= res!472464 ((_ is Cons!13407) newAcc!49))))

(assert (=> d!96769 (= (contains!3933 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317922)))

(declare-fun b!708719 () Bool)

(declare-fun e!398823 () Bool)

(assert (=> b!708719 (= e!398824 e!398823)))

(declare-fun res!472463 () Bool)

(assert (=> b!708719 (=> res!472463 e!398823)))

(assert (=> b!708719 (= res!472463 (= (h!14452 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708720 () Bool)

(assert (=> b!708720 (= e!398823 (contains!3933 (t!19693 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96769 res!472464) b!708719))

(assert (= (and b!708719 (not res!472463)) b!708720))

(assert (=> d!96769 m!665587))

(declare-fun m!665597 () Bool)

(assert (=> d!96769 m!665597))

(declare-fun m!665599 () Bool)

(assert (=> b!708720 m!665599))

(assert (=> b!708482 d!96769))

(declare-fun d!96771 () Bool)

(declare-fun lt!317923 () Bool)

(assert (=> d!96771 (= lt!317923 (select (content!340 lt!317897) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398830 () Bool)

(assert (=> d!96771 (= lt!317923 e!398830)))

(declare-fun res!472469 () Bool)

(assert (=> d!96771 (=> (not res!472469) (not e!398830))))

(assert (=> d!96771 (= res!472469 ((_ is Cons!13407) lt!317897))))

(assert (=> d!96771 (= (contains!3933 lt!317897 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317923)))

(declare-fun b!708726 () Bool)

(declare-fun e!398829 () Bool)

(assert (=> b!708726 (= e!398830 e!398829)))

(declare-fun res!472468 () Bool)

(assert (=> b!708726 (=> res!472468 e!398829)))

(assert (=> b!708726 (= res!472468 (= (h!14452 lt!317897) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708727 () Bool)

(assert (=> b!708727 (= e!398829 (contains!3933 (t!19693 lt!317897) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96771 res!472469) b!708726))

(assert (= (and b!708726 (not res!472468)) b!708727))

(declare-fun m!665601 () Bool)

(assert (=> d!96771 m!665601))

(declare-fun m!665603 () Bool)

(assert (=> d!96771 m!665603))

(declare-fun m!665605 () Bool)

(assert (=> b!708727 m!665605))

(assert (=> b!708471 d!96771))

(declare-fun d!96773 () Bool)

(declare-fun res!472472 () Bool)

(declare-fun e!398833 () Bool)

(assert (=> d!96773 (=> res!472472 e!398833)))

(assert (=> d!96773 (= res!472472 ((_ is Nil!13408) acc!652))))

(assert (=> d!96773 (= (noDuplicate!1202 acc!652) e!398833)))

(declare-fun b!708730 () Bool)

(declare-fun e!398834 () Bool)

(assert (=> b!708730 (= e!398833 e!398834)))

(declare-fun res!472473 () Bool)

(assert (=> b!708730 (=> (not res!472473) (not e!398834))))

(assert (=> b!708730 (= res!472473 (not (contains!3933 (t!19693 acc!652) (h!14452 acc!652))))))

(declare-fun b!708731 () Bool)

(assert (=> b!708731 (= e!398834 (noDuplicate!1202 (t!19693 acc!652)))))

(assert (= (and d!96773 (not res!472472)) b!708730))

(assert (= (and b!708730 res!472473) b!708731))

(declare-fun m!665613 () Bool)

(assert (=> b!708730 m!665613))

(declare-fun m!665615 () Bool)

(assert (=> b!708731 m!665615))

(assert (=> b!708481 d!96773))

(declare-fun d!96777 () Bool)

(declare-fun lt!317924 () Bool)

(assert (=> d!96777 (= lt!317924 (select (content!340 lt!317897) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398836 () Bool)

(assert (=> d!96777 (= lt!317924 e!398836)))

(declare-fun res!472475 () Bool)

(assert (=> d!96777 (=> (not res!472475) (not e!398836))))

(assert (=> d!96777 (= res!472475 ((_ is Cons!13407) lt!317897))))

(assert (=> d!96777 (= (contains!3933 lt!317897 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317924)))

(declare-fun b!708732 () Bool)

(declare-fun e!398835 () Bool)

(assert (=> b!708732 (= e!398836 e!398835)))

(declare-fun res!472474 () Bool)

(assert (=> b!708732 (=> res!472474 e!398835)))

(assert (=> b!708732 (= res!472474 (= (h!14452 lt!317897) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708733 () Bool)

(assert (=> b!708733 (= e!398835 (contains!3933 (t!19693 lt!317897) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96777 res!472475) b!708732))

(assert (= (and b!708732 (not res!472474)) b!708733))

(assert (=> d!96777 m!665601))

(declare-fun m!665619 () Bool)

(assert (=> d!96777 m!665619))

(declare-fun m!665621 () Bool)

(assert (=> b!708733 m!665621))

(assert (=> b!708483 d!96777))

(declare-fun d!96783 () Bool)

(declare-fun res!472476 () Bool)

(declare-fun e!398837 () Bool)

(assert (=> d!96783 (=> res!472476 e!398837)))

(assert (=> d!96783 (= res!472476 (= (select (arr!19331 a!3591) from!2969) k0!2824))))

(assert (=> d!96783 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398837)))

(declare-fun b!708734 () Bool)

(declare-fun e!398838 () Bool)

(assert (=> b!708734 (= e!398837 e!398838)))

(declare-fun res!472477 () Bool)

(assert (=> b!708734 (=> (not res!472477) (not e!398838))))

(assert (=> b!708734 (= res!472477 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19720 a!3591)))))

(declare-fun b!708735 () Bool)

(assert (=> b!708735 (= e!398838 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96783 (not res!472476)) b!708734))

(assert (= (and b!708734 res!472477) b!708735))

(assert (=> d!96783 m!665393))

(declare-fun m!665623 () Bool)

(assert (=> b!708735 m!665623))

(assert (=> b!708472 d!96783))

(declare-fun d!96785 () Bool)

(declare-fun res!472478 () Bool)

(declare-fun e!398839 () Bool)

(assert (=> d!96785 (=> res!472478 e!398839)))

(assert (=> d!96785 (= res!472478 ((_ is Nil!13408) newAcc!49))))

(assert (=> d!96785 (= (noDuplicate!1202 newAcc!49) e!398839)))

(declare-fun b!708736 () Bool)

(declare-fun e!398840 () Bool)

(assert (=> b!708736 (= e!398839 e!398840)))

(declare-fun res!472479 () Bool)

(assert (=> b!708736 (=> (not res!472479) (not e!398840))))

(assert (=> b!708736 (= res!472479 (not (contains!3933 (t!19693 newAcc!49) (h!14452 newAcc!49))))))

(declare-fun b!708737 () Bool)

(assert (=> b!708737 (= e!398840 (noDuplicate!1202 (t!19693 newAcc!49)))))

(assert (= (and d!96785 (not res!472478)) b!708736))

(assert (= (and b!708736 res!472479) b!708737))

(declare-fun m!665625 () Bool)

(assert (=> b!708736 m!665625))

(declare-fun m!665627 () Bool)

(assert (=> b!708737 m!665627))

(assert (=> b!708474 d!96785))

(declare-fun d!96787 () Bool)

(declare-fun lt!317925 () Bool)

(assert (=> d!96787 (= lt!317925 (select (content!340 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398842 () Bool)

(assert (=> d!96787 (= lt!317925 e!398842)))

(declare-fun res!472481 () Bool)

(assert (=> d!96787 (=> (not res!472481) (not e!398842))))

(assert (=> d!96787 (= res!472481 ((_ is Cons!13407) acc!652))))

(assert (=> d!96787 (= (contains!3933 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317925)))

(declare-fun b!708738 () Bool)

(declare-fun e!398841 () Bool)

(assert (=> b!708738 (= e!398842 e!398841)))

(declare-fun res!472480 () Bool)

(assert (=> b!708738 (=> res!472480 e!398841)))

(assert (=> b!708738 (= res!472480 (= (h!14452 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708739 () Bool)

(assert (=> b!708739 (= e!398841 (contains!3933 (t!19693 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96787 res!472481) b!708738))

(assert (= (and b!708738 (not res!472480)) b!708739))

(assert (=> d!96787 m!665517))

(declare-fun m!665629 () Bool)

(assert (=> d!96787 m!665629))

(declare-fun m!665631 () Bool)

(assert (=> b!708739 m!665631))

(assert (=> b!708484 d!96787))

(declare-fun d!96789 () Bool)

(declare-fun lt!317926 () Bool)

(assert (=> d!96789 (= lt!317926 (select (content!340 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398848 () Bool)

(assert (=> d!96789 (= lt!317926 e!398848)))

(declare-fun res!472487 () Bool)

(assert (=> d!96789 (=> (not res!472487) (not e!398848))))

(assert (=> d!96789 (= res!472487 ((_ is Cons!13407) acc!652))))

(assert (=> d!96789 (= (contains!3933 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317926)))

(declare-fun b!708744 () Bool)

(declare-fun e!398847 () Bool)

(assert (=> b!708744 (= e!398848 e!398847)))

(declare-fun res!472486 () Bool)

(assert (=> b!708744 (=> res!472486 e!398847)))

(assert (=> b!708744 (= res!472486 (= (h!14452 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708745 () Bool)

(assert (=> b!708745 (= e!398847 (contains!3933 (t!19693 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96789 res!472487) b!708744))

(assert (= (and b!708744 (not res!472486)) b!708745))

(assert (=> d!96789 m!665517))

(declare-fun m!665633 () Bool)

(assert (=> d!96789 m!665633))

(declare-fun m!665635 () Bool)

(assert (=> b!708745 m!665635))

(assert (=> b!708473 d!96789))

(declare-fun d!96791 () Bool)

(assert (=> d!96791 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708486 d!96791))

(declare-fun b!708796 () Bool)

(declare-fun e!398895 () List!13411)

(assert (=> b!708796 (= e!398895 Nil!13408)))

(declare-fun e!398894 () Bool)

(declare-fun b!708797 () Bool)

(declare-fun lt!317931 () List!13411)

(assert (=> b!708797 (= e!398894 (= (content!340 lt!317931) ((_ map and) (content!340 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!708798 () Bool)

(declare-fun e!398896 () List!13411)

(declare-fun call!34399 () List!13411)

(assert (=> b!708798 (= e!398896 call!34399)))

(declare-fun b!708799 () Bool)

(assert (=> b!708799 (= e!398895 e!398896)))

(declare-fun c!78502 () Bool)

(assert (=> b!708799 (= c!78502 (= k0!2824 (h!14452 newAcc!49)))))

(declare-fun d!96793 () Bool)

(assert (=> d!96793 e!398894))

(declare-fun res!472526 () Bool)

(assert (=> d!96793 (=> (not res!472526) (not e!398894))))

(declare-fun size!19724 (List!13411) Int)

(assert (=> d!96793 (= res!472526 (<= (size!19724 lt!317931) (size!19724 newAcc!49)))))

(assert (=> d!96793 (= lt!317931 e!398895)))

(declare-fun c!78503 () Bool)

(assert (=> d!96793 (= c!78503 ((_ is Cons!13407) newAcc!49))))

(assert (=> d!96793 (= (-!360 newAcc!49 k0!2824) lt!317931)))

(declare-fun bm!34396 () Bool)

(assert (=> bm!34396 (= call!34399 (-!360 (t!19693 newAcc!49) k0!2824))))

(declare-fun b!708800 () Bool)

(assert (=> b!708800 (= e!398896 (Cons!13407 (h!14452 newAcc!49) call!34399))))

(assert (= (and d!96793 c!78503) b!708799))

(assert (= (and d!96793 (not c!78503)) b!708796))

(assert (= (and b!708799 c!78502) b!708798))

(assert (= (and b!708799 (not c!78502)) b!708800))

(assert (= (or b!708798 b!708800) bm!34396))

(assert (= (and d!96793 res!472526) b!708797))

(declare-fun m!665667 () Bool)

(assert (=> b!708797 m!665667))

(assert (=> b!708797 m!665587))

(declare-fun m!665669 () Bool)

(assert (=> b!708797 m!665669))

(declare-fun m!665673 () Bool)

(assert (=> d!96793 m!665673))

(declare-fun m!665675 () Bool)

(assert (=> d!96793 m!665675))

(declare-fun m!665679 () Bool)

(assert (=> bm!34396 m!665679))

(assert (=> b!708475 d!96793))

(declare-fun d!96817 () Bool)

(declare-fun res!472531 () Bool)

(declare-fun e!398901 () Bool)

(assert (=> d!96817 (=> res!472531 e!398901)))

(assert (=> d!96817 (= res!472531 ((_ is Nil!13408) ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969))))))

(assert (=> d!96817 (= (noDuplicate!1202 ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969))) e!398901)))

(declare-fun b!708805 () Bool)

(declare-fun e!398902 () Bool)

(assert (=> b!708805 (= e!398901 e!398902)))

(declare-fun res!472532 () Bool)

(assert (=> b!708805 (=> (not res!472532) (not e!398902))))

(assert (=> b!708805 (= res!472532 (not (contains!3933 (t!19693 ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969))) (h!14452 ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969))))))))

(declare-fun b!708806 () Bool)

(assert (=> b!708806 (= e!398902 (noDuplicate!1202 (t!19693 ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969)))))))

(assert (= (and d!96817 (not res!472531)) b!708805))

(assert (= (and b!708805 res!472532) b!708806))

(declare-fun m!665685 () Bool)

(assert (=> b!708805 m!665685))

(declare-fun m!665687 () Bool)

(assert (=> b!708806 m!665687))

(assert (=> b!708485 d!96817))

(declare-fun d!96821 () Bool)

(assert (=> d!96821 (= ($colon$colon!505 newAcc!49 (select (arr!19331 a!3591) from!2969)) (Cons!13407 (select (arr!19331 a!3591) from!2969) newAcc!49))))

(assert (=> b!708485 d!96821))

(check-sat (not b!708739) (not d!96789) (not b!708731) (not b!708737) (not d!96787) (not d!96771) (not d!96725) (not b!708620) (not b!708797) (not bm!34396) (not b!708745) (not b!708709) (not d!96777) (not bm!34389) (not d!96765) (not b!708805) (not b!708671) (not b!708710) (not d!96793) (not b!708730) (not b!708735) (not b!708733) (not b!708670) (not b!708635) (not d!96767) (not b!708727) (not b!708720) (not b!708716) (not b!708736) (not d!96769) (not b!708806) (not b!708712) (not b!708668) (not b!708626) (not b!708636))
(check-sat)
