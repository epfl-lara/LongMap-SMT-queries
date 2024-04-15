; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63430 () Bool)

(assert start!63430)

(declare-fun b!714324 () Bool)

(declare-fun res!477535 () Bool)

(declare-fun e!401394 () Bool)

(assert (=> b!714324 (=> (not res!477535) (not e!401394))))

(declare-datatypes ((array!40500 0))(
  ( (array!40501 (arr!19388 (Array (_ BitVec 32) (_ BitVec 64))) (size!19802 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40500)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714324 (= res!477535 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714325 () Bool)

(declare-fun res!477533 () Bool)

(assert (=> b!714325 (=> (not res!477533) (not e!401394))))

(assert (=> b!714325 (= res!477533 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714326 () Bool)

(declare-fun res!477530 () Bool)

(assert (=> b!714326 (=> (not res!477530) (not e!401394))))

(declare-datatypes ((List!13468 0))(
  ( (Nil!13465) (Cons!13464 (h!14509 (_ BitVec 64)) (t!19774 List!13468)) )
))
(declare-fun newAcc!49 () List!13468)

(declare-fun noDuplicate!1259 (List!13468) Bool)

(assert (=> b!714326 (= res!477530 (noDuplicate!1259 newAcc!49))))

(declare-fun b!714327 () Bool)

(declare-fun res!477525 () Bool)

(assert (=> b!714327 (=> (not res!477525) (not e!401394))))

(declare-fun acc!652 () List!13468)

(assert (=> b!714327 (= res!477525 (noDuplicate!1259 acc!652))))

(declare-fun b!714328 () Bool)

(declare-fun res!477528 () Bool)

(assert (=> b!714328 (=> (not res!477528) (not e!401394))))

(declare-fun contains!3990 (List!13468 (_ BitVec 64)) Bool)

(assert (=> b!714328 (= res!477528 (not (contains!3990 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!477532 () Bool)

(assert (=> start!63430 (=> (not res!477532) (not e!401394))))

(assert (=> start!63430 (= res!477532 (and (bvslt (size!19802 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19802 a!3591))))))

(assert (=> start!63430 e!401394))

(assert (=> start!63430 true))

(declare-fun array_inv!15271 (array!40500) Bool)

(assert (=> start!63430 (array_inv!15271 a!3591)))

(declare-fun b!714329 () Bool)

(declare-fun res!477531 () Bool)

(assert (=> b!714329 (=> (not res!477531) (not e!401394))))

(declare-fun -!417 (List!13468 (_ BitVec 64)) List!13468)

(assert (=> b!714329 (= res!477531 (= (-!417 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714330 () Bool)

(declare-fun res!477521 () Bool)

(assert (=> b!714330 (=> (not res!477521) (not e!401394))))

(assert (=> b!714330 (= res!477521 (not (contains!3990 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714331 () Bool)

(declare-fun res!477529 () Bool)

(assert (=> b!714331 (=> (not res!477529) (not e!401394))))

(declare-fun subseq!452 (List!13468 List!13468) Bool)

(assert (=> b!714331 (= res!477529 (subseq!452 acc!652 newAcc!49))))

(declare-fun b!714332 () Bool)

(declare-fun res!477527 () Bool)

(assert (=> b!714332 (=> (not res!477527) (not e!401394))))

(assert (=> b!714332 (= res!477527 (not (contains!3990 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714333 () Bool)

(declare-fun res!477536 () Bool)

(assert (=> b!714333 (=> (not res!477536) (not e!401394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714333 (= res!477536 (validKeyInArray!0 k0!2824))))

(declare-fun b!714334 () Bool)

(declare-fun res!477534 () Bool)

(assert (=> b!714334 (=> (not res!477534) (not e!401394))))

(assert (=> b!714334 (= res!477534 (not (validKeyInArray!0 (select (arr!19388 a!3591) from!2969))))))

(declare-fun b!714335 () Bool)

(declare-fun res!477524 () Bool)

(assert (=> b!714335 (=> (not res!477524) (not e!401394))))

(assert (=> b!714335 (= res!477524 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714336 () Bool)

(declare-fun res!477523 () Bool)

(assert (=> b!714336 (=> (not res!477523) (not e!401394))))

(assert (=> b!714336 (= res!477523 (not (contains!3990 acc!652 k0!2824)))))

(declare-fun b!714337 () Bool)

(declare-fun res!477537 () Bool)

(assert (=> b!714337 (=> (not res!477537) (not e!401394))))

(assert (=> b!714337 (= res!477537 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19802 a!3591)))))

(declare-fun b!714338 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40500 (_ BitVec 32) List!13468) Bool)

(assert (=> b!714338 (= e!401394 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652)))))

(declare-fun b!714339 () Bool)

(declare-fun res!477520 () Bool)

(assert (=> b!714339 (=> (not res!477520) (not e!401394))))

(assert (=> b!714339 (= res!477520 (contains!3990 newAcc!49 k0!2824))))

(declare-fun b!714340 () Bool)

(declare-fun res!477526 () Bool)

(assert (=> b!714340 (=> (not res!477526) (not e!401394))))

(assert (=> b!714340 (= res!477526 (not (contains!3990 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714341 () Bool)

(declare-fun res!477522 () Bool)

(assert (=> b!714341 (=> (not res!477522) (not e!401394))))

(assert (=> b!714341 (= res!477522 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!63430 res!477532) b!714327))

(assert (= (and b!714327 res!477525) b!714326))

(assert (= (and b!714326 res!477530) b!714328))

(assert (= (and b!714328 res!477528) b!714330))

(assert (= (and b!714330 res!477521) b!714324))

(assert (= (and b!714324 res!477535) b!714336))

(assert (= (and b!714336 res!477523) b!714333))

(assert (= (and b!714333 res!477536) b!714341))

(assert (= (and b!714341 res!477522) b!714331))

(assert (= (and b!714331 res!477529) b!714339))

(assert (= (and b!714339 res!477520) b!714329))

(assert (= (and b!714329 res!477531) b!714332))

(assert (= (and b!714332 res!477527) b!714340))

(assert (= (and b!714340 res!477526) b!714337))

(assert (= (and b!714337 res!477537) b!714334))

(assert (= (and b!714334 res!477534) b!714325))

(assert (= (and b!714325 res!477533) b!714335))

(assert (= (and b!714335 res!477524) b!714338))

(declare-fun m!670311 () Bool)

(assert (=> b!714334 m!670311))

(assert (=> b!714334 m!670311))

(declare-fun m!670313 () Bool)

(assert (=> b!714334 m!670313))

(declare-fun m!670315 () Bool)

(assert (=> b!714335 m!670315))

(declare-fun m!670317 () Bool)

(assert (=> b!714333 m!670317))

(declare-fun m!670319 () Bool)

(assert (=> b!714332 m!670319))

(declare-fun m!670321 () Bool)

(assert (=> b!714338 m!670321))

(declare-fun m!670323 () Bool)

(assert (=> start!63430 m!670323))

(declare-fun m!670325 () Bool)

(assert (=> b!714336 m!670325))

(declare-fun m!670327 () Bool)

(assert (=> b!714340 m!670327))

(declare-fun m!670329 () Bool)

(assert (=> b!714327 m!670329))

(declare-fun m!670331 () Bool)

(assert (=> b!714331 m!670331))

(declare-fun m!670333 () Bool)

(assert (=> b!714339 m!670333))

(declare-fun m!670335 () Bool)

(assert (=> b!714324 m!670335))

(declare-fun m!670337 () Bool)

(assert (=> b!714330 m!670337))

(declare-fun m!670339 () Bool)

(assert (=> b!714328 m!670339))

(declare-fun m!670341 () Bool)

(assert (=> b!714329 m!670341))

(declare-fun m!670343 () Bool)

(assert (=> b!714326 m!670343))

(declare-fun m!670345 () Bool)

(assert (=> b!714341 m!670345))

(check-sat (not b!714328) (not b!714329) (not b!714335) (not b!714333) (not start!63430) (not b!714330) (not b!714331) (not b!714338) (not b!714336) (not b!714332) (not b!714326) (not b!714340) (not b!714339) (not b!714324) (not b!714334) (not b!714341) (not b!714327))
(check-sat)
(get-model)

(declare-fun e!401416 () Bool)

(declare-fun b!714460 () Bool)

(assert (=> b!714460 (= e!401416 (contains!3990 acc!652 (select (arr!19388 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714461 () Bool)

(declare-fun e!401418 () Bool)

(declare-fun e!401417 () Bool)

(assert (=> b!714461 (= e!401418 e!401417)))

(declare-fun c!78771 () Bool)

(assert (=> b!714461 (= c!78771 (validKeyInArray!0 (select (arr!19388 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714462 () Bool)

(declare-fun e!401419 () Bool)

(assert (=> b!714462 (= e!401419 e!401418)))

(declare-fun res!477654 () Bool)

(assert (=> b!714462 (=> (not res!477654) (not e!401418))))

(assert (=> b!714462 (= res!477654 (not e!401416))))

(declare-fun res!477652 () Bool)

(assert (=> b!714462 (=> (not res!477652) (not e!401416))))

(assert (=> b!714462 (= res!477652 (validKeyInArray!0 (select (arr!19388 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714463 () Bool)

(declare-fun call!34585 () Bool)

(assert (=> b!714463 (= e!401417 call!34585)))

(declare-fun bm!34582 () Bool)

(assert (=> bm!34582 (= call!34585 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78771 (Cons!13464 (select (arr!19388 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun b!714464 () Bool)

(assert (=> b!714464 (= e!401417 call!34585)))

(declare-fun d!98107 () Bool)

(declare-fun res!477653 () Bool)

(assert (=> d!98107 (=> res!477653 e!401419)))

(assert (=> d!98107 (= res!477653 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19802 a!3591)))))

(assert (=> d!98107 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!401419)))

(assert (= (and d!98107 (not res!477653)) b!714462))

(assert (= (and b!714462 res!477652) b!714460))

(assert (= (and b!714462 res!477654) b!714461))

(assert (= (and b!714461 c!78771) b!714464))

(assert (= (and b!714461 (not c!78771)) b!714463))

(assert (= (or b!714464 b!714463) bm!34582))

(declare-fun m!670419 () Bool)

(assert (=> b!714460 m!670419))

(assert (=> b!714460 m!670419))

(declare-fun m!670421 () Bool)

(assert (=> b!714460 m!670421))

(assert (=> b!714461 m!670419))

(assert (=> b!714461 m!670419))

(declare-fun m!670423 () Bool)

(assert (=> b!714461 m!670423))

(assert (=> b!714462 m!670419))

(assert (=> b!714462 m!670419))

(assert (=> b!714462 m!670423))

(assert (=> bm!34582 m!670419))

(declare-fun m!670425 () Bool)

(assert (=> bm!34582 m!670425))

(assert (=> b!714338 d!98107))

(declare-fun d!98109 () Bool)

(declare-fun res!477659 () Bool)

(declare-fun e!401424 () Bool)

(assert (=> d!98109 (=> res!477659 e!401424)))

(get-info :version)

(assert (=> d!98109 (= res!477659 ((_ is Nil!13465) acc!652))))

(assert (=> d!98109 (= (noDuplicate!1259 acc!652) e!401424)))

(declare-fun b!714469 () Bool)

(declare-fun e!401425 () Bool)

(assert (=> b!714469 (= e!401424 e!401425)))

(declare-fun res!477660 () Bool)

(assert (=> b!714469 (=> (not res!477660) (not e!401425))))

(assert (=> b!714469 (= res!477660 (not (contains!3990 (t!19774 acc!652) (h!14509 acc!652))))))

(declare-fun b!714470 () Bool)

(assert (=> b!714470 (= e!401425 (noDuplicate!1259 (t!19774 acc!652)))))

(assert (= (and d!98109 (not res!477659)) b!714469))

(assert (= (and b!714469 res!477660) b!714470))

(declare-fun m!670427 () Bool)

(assert (=> b!714469 m!670427))

(declare-fun m!670429 () Bool)

(assert (=> b!714470 m!670429))

(assert (=> b!714327 d!98109))

(declare-fun d!98113 () Bool)

(declare-fun e!401461 () Bool)

(assert (=> d!98113 e!401461))

(declare-fun res!477689 () Bool)

(assert (=> d!98113 (=> (not res!477689) (not e!401461))))

(declare-fun lt!318534 () List!13468)

(declare-fun size!19805 (List!13468) Int)

(assert (=> d!98113 (= res!477689 (<= (size!19805 lt!318534) (size!19805 newAcc!49)))))

(declare-fun e!401460 () List!13468)

(assert (=> d!98113 (= lt!318534 e!401460)))

(declare-fun c!78777 () Bool)

(assert (=> d!98113 (= c!78777 ((_ is Cons!13464) newAcc!49))))

(assert (=> d!98113 (= (-!417 newAcc!49 k0!2824) lt!318534)))

(declare-fun b!714507 () Bool)

(declare-fun e!401459 () List!13468)

(declare-fun call!34588 () List!13468)

(assert (=> b!714507 (= e!401459 call!34588)))

(declare-fun b!714508 () Bool)

(assert (=> b!714508 (= e!401459 (Cons!13464 (h!14509 newAcc!49) call!34588))))

(declare-fun b!714509 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!368 (List!13468) (InoxSet (_ BitVec 64)))

(assert (=> b!714509 (= e!401461 (= (content!368 lt!318534) ((_ map and) (content!368 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!714510 () Bool)

(assert (=> b!714510 (= e!401460 e!401459)))

(declare-fun c!78776 () Bool)

(assert (=> b!714510 (= c!78776 (= k0!2824 (h!14509 newAcc!49)))))

(declare-fun b!714511 () Bool)

(assert (=> b!714511 (= e!401460 Nil!13465)))

(declare-fun bm!34585 () Bool)

(assert (=> bm!34585 (= call!34588 (-!417 (t!19774 newAcc!49) k0!2824))))

(assert (= (and d!98113 c!78777) b!714510))

(assert (= (and d!98113 (not c!78777)) b!714511))

(assert (= (and b!714510 c!78776) b!714507))

(assert (= (and b!714510 (not c!78776)) b!714508))

(assert (= (or b!714507 b!714508) bm!34585))

(assert (= (and d!98113 res!477689) b!714509))

(declare-fun m!670451 () Bool)

(assert (=> d!98113 m!670451))

(declare-fun m!670453 () Bool)

(assert (=> d!98113 m!670453))

(declare-fun m!670455 () Bool)

(assert (=> b!714509 m!670455))

(declare-fun m!670457 () Bool)

(assert (=> b!714509 m!670457))

(declare-fun m!670459 () Bool)

(assert (=> b!714509 m!670459))

(declare-fun m!670461 () Bool)

(assert (=> bm!34585 m!670461))

(assert (=> b!714329 d!98113))

(declare-fun d!98127 () Bool)

(declare-fun lt!318537 () Bool)

(assert (=> d!98127 (= lt!318537 (select (content!368 newAcc!49) k0!2824))))

(declare-fun e!401474 () Bool)

(assert (=> d!98127 (= lt!318537 e!401474)))

(declare-fun res!477702 () Bool)

(assert (=> d!98127 (=> (not res!477702) (not e!401474))))

(assert (=> d!98127 (= res!477702 ((_ is Cons!13464) newAcc!49))))

(assert (=> d!98127 (= (contains!3990 newAcc!49 k0!2824) lt!318537)))

(declare-fun b!714524 () Bool)

(declare-fun e!401475 () Bool)

(assert (=> b!714524 (= e!401474 e!401475)))

(declare-fun res!477703 () Bool)

(assert (=> b!714524 (=> res!477703 e!401475)))

(assert (=> b!714524 (= res!477703 (= (h!14509 newAcc!49) k0!2824))))

(declare-fun b!714525 () Bool)

(assert (=> b!714525 (= e!401475 (contains!3990 (t!19774 newAcc!49) k0!2824))))

(assert (= (and d!98127 res!477702) b!714524))

(assert (= (and b!714524 (not res!477703)) b!714525))

(assert (=> d!98127 m!670457))

(declare-fun m!670473 () Bool)

(assert (=> d!98127 m!670473))

(declare-fun m!670475 () Bool)

(assert (=> b!714525 m!670475))

(assert (=> b!714339 d!98127))

(declare-fun d!98139 () Bool)

(declare-fun lt!318538 () Bool)

(assert (=> d!98139 (= lt!318538 (select (content!368 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401476 () Bool)

(assert (=> d!98139 (= lt!318538 e!401476)))

(declare-fun res!477704 () Bool)

(assert (=> d!98139 (=> (not res!477704) (not e!401476))))

(assert (=> d!98139 (= res!477704 ((_ is Cons!13464) acc!652))))

(assert (=> d!98139 (= (contains!3990 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318538)))

(declare-fun b!714526 () Bool)

(declare-fun e!401477 () Bool)

(assert (=> b!714526 (= e!401476 e!401477)))

(declare-fun res!477705 () Bool)

(assert (=> b!714526 (=> res!477705 e!401477)))

(assert (=> b!714526 (= res!477705 (= (h!14509 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714527 () Bool)

(assert (=> b!714527 (= e!401477 (contains!3990 (t!19774 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98139 res!477704) b!714526))

(assert (= (and b!714526 (not res!477705)) b!714527))

(declare-fun m!670477 () Bool)

(assert (=> d!98139 m!670477))

(declare-fun m!670479 () Bool)

(assert (=> d!98139 m!670479))

(declare-fun m!670481 () Bool)

(assert (=> b!714527 m!670481))

(assert (=> b!714328 d!98139))

(declare-fun d!98141 () Bool)

(declare-fun res!477728 () Bool)

(declare-fun e!401500 () Bool)

(assert (=> d!98141 (=> res!477728 e!401500)))

(assert (=> d!98141 (= res!477728 (= (select (arr!19388 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98141 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401500)))

(declare-fun b!714550 () Bool)

(declare-fun e!401501 () Bool)

(assert (=> b!714550 (= e!401500 e!401501)))

(declare-fun res!477729 () Bool)

(assert (=> b!714550 (=> (not res!477729) (not e!401501))))

(assert (=> b!714550 (= res!477729 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19802 a!3591)))))

(declare-fun b!714551 () Bool)

(assert (=> b!714551 (= e!401501 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98141 (not res!477728)) b!714550))

(assert (= (and b!714550 res!477729) b!714551))

(assert (=> d!98141 m!670419))

(declare-fun m!670493 () Bool)

(assert (=> b!714551 m!670493))

(assert (=> b!714335 d!98141))

(declare-fun d!98147 () Bool)

(declare-fun res!477730 () Bool)

(declare-fun e!401502 () Bool)

(assert (=> d!98147 (=> res!477730 e!401502)))

(assert (=> d!98147 (= res!477730 (= (select (arr!19388 a!3591) from!2969) k0!2824))))

(assert (=> d!98147 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401502)))

(declare-fun b!714552 () Bool)

(declare-fun e!401503 () Bool)

(assert (=> b!714552 (= e!401502 e!401503)))

(declare-fun res!477731 () Bool)

(assert (=> b!714552 (=> (not res!477731) (not e!401503))))

(assert (=> b!714552 (= res!477731 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19802 a!3591)))))

(declare-fun b!714553 () Bool)

(assert (=> b!714553 (= e!401503 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98147 (not res!477730)) b!714552))

(assert (= (and b!714552 res!477731) b!714553))

(assert (=> d!98147 m!670311))

(declare-fun m!670495 () Bool)

(assert (=> b!714553 m!670495))

(assert (=> b!714324 d!98147))

(declare-fun d!98150 () Bool)

(declare-fun res!477732 () Bool)

(declare-fun e!401504 () Bool)

(assert (=> d!98150 (=> res!477732 e!401504)))

(assert (=> d!98150 (= res!477732 ((_ is Nil!13465) newAcc!49))))

(assert (=> d!98150 (= (noDuplicate!1259 newAcc!49) e!401504)))

(declare-fun b!714554 () Bool)

(declare-fun e!401505 () Bool)

(assert (=> b!714554 (= e!401504 e!401505)))

(declare-fun res!477733 () Bool)

(assert (=> b!714554 (=> (not res!477733) (not e!401505))))

(assert (=> b!714554 (= res!477733 (not (contains!3990 (t!19774 newAcc!49) (h!14509 newAcc!49))))))

(declare-fun b!714555 () Bool)

(assert (=> b!714555 (= e!401505 (noDuplicate!1259 (t!19774 newAcc!49)))))

(assert (= (and d!98150 (not res!477732)) b!714554))

(assert (= (and b!714554 res!477733) b!714555))

(declare-fun m!670497 () Bool)

(assert (=> b!714554 m!670497))

(declare-fun m!670499 () Bool)

(assert (=> b!714555 m!670499))

(assert (=> b!714326 d!98150))

(declare-fun d!98155 () Bool)

(declare-fun lt!318542 () Bool)

(assert (=> d!98155 (= lt!318542 (select (content!368 acc!652) k0!2824))))

(declare-fun e!401508 () Bool)

(assert (=> d!98155 (= lt!318542 e!401508)))

(declare-fun res!477736 () Bool)

(assert (=> d!98155 (=> (not res!477736) (not e!401508))))

(assert (=> d!98155 (= res!477736 ((_ is Cons!13464) acc!652))))

(assert (=> d!98155 (= (contains!3990 acc!652 k0!2824) lt!318542)))

(declare-fun b!714558 () Bool)

(declare-fun e!401509 () Bool)

(assert (=> b!714558 (= e!401508 e!401509)))

(declare-fun res!477737 () Bool)

(assert (=> b!714558 (=> res!477737 e!401509)))

(assert (=> b!714558 (= res!477737 (= (h!14509 acc!652) k0!2824))))

(declare-fun b!714559 () Bool)

(assert (=> b!714559 (= e!401509 (contains!3990 (t!19774 acc!652) k0!2824))))

(assert (= (and d!98155 res!477736) b!714558))

(assert (= (and b!714558 (not res!477737)) b!714559))

(assert (=> d!98155 m!670477))

(declare-fun m!670505 () Bool)

(assert (=> d!98155 m!670505))

(declare-fun m!670507 () Bool)

(assert (=> b!714559 m!670507))

(assert (=> b!714336 d!98155))

(declare-fun d!98159 () Bool)

(assert (=> d!98159 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714333 d!98159))

(declare-fun d!98165 () Bool)

(declare-fun lt!318546 () Bool)

(assert (=> d!98165 (= lt!318546 (select (content!368 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401522 () Bool)

(assert (=> d!98165 (= lt!318546 e!401522)))

(declare-fun res!477750 () Bool)

(assert (=> d!98165 (=> (not res!477750) (not e!401522))))

(assert (=> d!98165 (= res!477750 ((_ is Cons!13464) newAcc!49))))

(assert (=> d!98165 (= (contains!3990 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318546)))

(declare-fun b!714570 () Bool)

(declare-fun e!401523 () Bool)

(assert (=> b!714570 (= e!401522 e!401523)))

(declare-fun res!477751 () Bool)

(assert (=> b!714570 (=> res!477751 e!401523)))

(assert (=> b!714570 (= res!477751 (= (h!14509 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714571 () Bool)

(assert (=> b!714571 (= e!401523 (contains!3990 (t!19774 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98165 res!477750) b!714570))

(assert (= (and b!714570 (not res!477751)) b!714571))

(assert (=> d!98165 m!670457))

(declare-fun m!670521 () Bool)

(assert (=> d!98165 m!670521))

(declare-fun m!670523 () Bool)

(assert (=> b!714571 m!670523))

(assert (=> b!714332 d!98165))

(declare-fun d!98169 () Bool)

(assert (=> d!98169 (= (validKeyInArray!0 (select (arr!19388 a!3591) from!2969)) (and (not (= (select (arr!19388 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19388 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714334 d!98169))

(declare-fun d!98171 () Bool)

(assert (=> d!98171 (= (array_inv!15271 a!3591) (bvsge (size!19802 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63430 d!98171))

(declare-fun e!401526 () Bool)

(declare-fun b!714578 () Bool)

(assert (=> b!714578 (= e!401526 (contains!3990 acc!652 (select (arr!19388 a!3591) from!2969)))))

(declare-fun b!714579 () Bool)

(declare-fun e!401528 () Bool)

(declare-fun e!401527 () Bool)

(assert (=> b!714579 (= e!401528 e!401527)))

(declare-fun c!78780 () Bool)

(assert (=> b!714579 (= c!78780 (validKeyInArray!0 (select (arr!19388 a!3591) from!2969)))))

(declare-fun b!714580 () Bool)

(declare-fun e!401529 () Bool)

(assert (=> b!714580 (= e!401529 e!401528)))

(declare-fun res!477754 () Bool)

(assert (=> b!714580 (=> (not res!477754) (not e!401528))))

(assert (=> b!714580 (= res!477754 (not e!401526))))

(declare-fun res!477752 () Bool)

(assert (=> b!714580 (=> (not res!477752) (not e!401526))))

(assert (=> b!714580 (= res!477752 (validKeyInArray!0 (select (arr!19388 a!3591) from!2969)))))

(declare-fun b!714581 () Bool)

(declare-fun call!34591 () Bool)

(assert (=> b!714581 (= e!401527 call!34591)))

(declare-fun bm!34588 () Bool)

(assert (=> bm!34588 (= call!34591 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78780 (Cons!13464 (select (arr!19388 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!714582 () Bool)

(assert (=> b!714582 (= e!401527 call!34591)))

(declare-fun d!98173 () Bool)

(declare-fun res!477753 () Bool)

(assert (=> d!98173 (=> res!477753 e!401529)))

(assert (=> d!98173 (= res!477753 (bvsge from!2969 (size!19802 a!3591)))))

(assert (=> d!98173 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401529)))

(assert (= (and d!98173 (not res!477753)) b!714580))

(assert (= (and b!714580 res!477752) b!714578))

(assert (= (and b!714580 res!477754) b!714579))

(assert (= (and b!714579 c!78780) b!714582))

(assert (= (and b!714579 (not c!78780)) b!714581))

(assert (= (or b!714582 b!714581) bm!34588))

(assert (=> b!714578 m!670311))

(assert (=> b!714578 m!670311))

(declare-fun m!670525 () Bool)

(assert (=> b!714578 m!670525))

(assert (=> b!714579 m!670311))

(assert (=> b!714579 m!670311))

(assert (=> b!714579 m!670313))

(assert (=> b!714580 m!670311))

(assert (=> b!714580 m!670311))

(assert (=> b!714580 m!670313))

(assert (=> bm!34588 m!670311))

(declare-fun m!670527 () Bool)

(assert (=> bm!34588 m!670527))

(assert (=> b!714341 d!98173))

(declare-fun d!98175 () Bool)

(declare-fun lt!318547 () Bool)

(assert (=> d!98175 (= lt!318547 (select (content!368 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401530 () Bool)

(assert (=> d!98175 (= lt!318547 e!401530)))

(declare-fun res!477755 () Bool)

(assert (=> d!98175 (=> (not res!477755) (not e!401530))))

(assert (=> d!98175 (= res!477755 ((_ is Cons!13464) acc!652))))

(assert (=> d!98175 (= (contains!3990 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318547)))

(declare-fun b!714583 () Bool)

(declare-fun e!401531 () Bool)

(assert (=> b!714583 (= e!401530 e!401531)))

(declare-fun res!477756 () Bool)

(assert (=> b!714583 (=> res!477756 e!401531)))

(assert (=> b!714583 (= res!477756 (= (h!14509 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714584 () Bool)

(assert (=> b!714584 (= e!401531 (contains!3990 (t!19774 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98175 res!477755) b!714583))

(assert (= (and b!714583 (not res!477756)) b!714584))

(assert (=> d!98175 m!670477))

(declare-fun m!670529 () Bool)

(assert (=> d!98175 m!670529))

(declare-fun m!670531 () Bool)

(assert (=> b!714584 m!670531))

(assert (=> b!714330 d!98175))

(declare-fun d!98177 () Bool)

(declare-fun lt!318548 () Bool)

(assert (=> d!98177 (= lt!318548 (select (content!368 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401532 () Bool)

(assert (=> d!98177 (= lt!318548 e!401532)))

(declare-fun res!477757 () Bool)

(assert (=> d!98177 (=> (not res!477757) (not e!401532))))

(assert (=> d!98177 (= res!477757 ((_ is Cons!13464) newAcc!49))))

(assert (=> d!98177 (= (contains!3990 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318548)))

(declare-fun b!714585 () Bool)

(declare-fun e!401533 () Bool)

(assert (=> b!714585 (= e!401532 e!401533)))

(declare-fun res!477758 () Bool)

(assert (=> b!714585 (=> res!477758 e!401533)))

(assert (=> b!714585 (= res!477758 (= (h!14509 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714586 () Bool)

(assert (=> b!714586 (= e!401533 (contains!3990 (t!19774 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98177 res!477757) b!714585))

(assert (= (and b!714585 (not res!477758)) b!714586))

(assert (=> d!98177 m!670457))

(declare-fun m!670533 () Bool)

(assert (=> d!98177 m!670533))

(declare-fun m!670535 () Bool)

(assert (=> b!714586 m!670535))

(assert (=> b!714340 d!98177))

(declare-fun b!714633 () Bool)

(declare-fun e!401572 () Bool)

(assert (=> b!714633 (= e!401572 (subseq!452 acc!652 (t!19774 newAcc!49)))))

(declare-fun b!714632 () Bool)

(declare-fun e!401574 () Bool)

(assert (=> b!714632 (= e!401574 (subseq!452 (t!19774 acc!652) (t!19774 newAcc!49)))))

(declare-fun d!98179 () Bool)

(declare-fun res!477794 () Bool)

(declare-fun e!401575 () Bool)

(assert (=> d!98179 (=> res!477794 e!401575)))

(assert (=> d!98179 (= res!477794 ((_ is Nil!13465) acc!652))))

(assert (=> d!98179 (= (subseq!452 acc!652 newAcc!49) e!401575)))

(declare-fun b!714631 () Bool)

(declare-fun e!401573 () Bool)

(assert (=> b!714631 (= e!401573 e!401572)))

(declare-fun res!477795 () Bool)

(assert (=> b!714631 (=> res!477795 e!401572)))

(assert (=> b!714631 (= res!477795 e!401574)))

(declare-fun res!477792 () Bool)

(assert (=> b!714631 (=> (not res!477792) (not e!401574))))

(assert (=> b!714631 (= res!477792 (= (h!14509 acc!652) (h!14509 newAcc!49)))))

(declare-fun b!714630 () Bool)

(assert (=> b!714630 (= e!401575 e!401573)))

(declare-fun res!477793 () Bool)

(assert (=> b!714630 (=> (not res!477793) (not e!401573))))

(assert (=> b!714630 (= res!477793 ((_ is Cons!13464) newAcc!49))))

(assert (= (and d!98179 (not res!477794)) b!714630))

(assert (= (and b!714630 res!477793) b!714631))

(assert (= (and b!714631 res!477792) b!714632))

(assert (= (and b!714631 (not res!477795)) b!714633))

(declare-fun m!670573 () Bool)

(assert (=> b!714633 m!670573))

(declare-fun m!670575 () Bool)

(assert (=> b!714632 m!670575))

(assert (=> b!714331 d!98179))

(check-sat (not b!714580) (not bm!34582) (not d!98175) (not b!714460) (not b!714579) (not b!714584) (not b!714461) (not b!714633) (not b!714586) (not b!714559) (not b!714462) (not d!98113) (not b!714469) (not b!714525) (not bm!34588) (not b!714554) (not d!98165) (not bm!34585) (not d!98127) (not b!714551) (not b!714470) (not d!98177) (not b!714571) (not b!714578) (not b!714509) (not d!98139) (not b!714632) (not d!98155) (not b!714555) (not b!714553) (not b!714527))
(check-sat)
