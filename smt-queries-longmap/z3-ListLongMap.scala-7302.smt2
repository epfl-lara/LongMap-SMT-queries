; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93310 () Bool)

(assert start!93310)

(declare-fun b!1057523 () Bool)

(declare-fun e!601470 () Bool)

(declare-fun e!601466 () Bool)

(assert (=> b!1057523 (= e!601470 (not e!601466))))

(declare-fun res!706268 () Bool)

(assert (=> b!1057523 (=> res!706268 e!601466)))

(declare-fun lt!466375 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057523 (= res!706268 (or (bvsgt lt!466375 i!1381) (bvsle i!1381 lt!466375)))))

(declare-fun e!601472 () Bool)

(assert (=> b!1057523 e!601472))

(declare-fun res!706266 () Bool)

(assert (=> b!1057523 (=> (not res!706266) (not e!601472))))

(declare-datatypes ((array!66650 0))(
  ( (array!66651 (arr!32046 (Array (_ BitVec 32) (_ BitVec 64))) (size!32584 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66650)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1057523 (= res!706266 (= (select (store (arr!32046 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466375) k0!2747))))

(declare-fun b!1057524 () Bool)

(declare-fun e!601468 () Bool)

(assert (=> b!1057524 (= e!601472 e!601468)))

(declare-fun res!706264 () Bool)

(assert (=> b!1057524 (=> res!706264 e!601468)))

(assert (=> b!1057524 (= res!706264 (or (bvsgt lt!466375 i!1381) (bvsle i!1381 lt!466375)))))

(declare-fun b!1057525 () Bool)

(declare-fun res!706269 () Bool)

(declare-fun e!601469 () Bool)

(assert (=> b!1057525 (=> (not res!706269) (not e!601469))))

(assert (=> b!1057525 (= res!706269 (= (select (arr!32046 a!3488) i!1381) k0!2747))))

(declare-fun b!1057526 () Bool)

(declare-fun e!601471 () Bool)

(declare-datatypes ((List!22417 0))(
  ( (Nil!22414) (Cons!22413 (h!23622 (_ BitVec 64)) (t!31715 List!22417)) )
))
(declare-fun noDuplicate!1570 (List!22417) Bool)

(assert (=> b!1057526 (= e!601471 (noDuplicate!1570 Nil!22414))))

(declare-fun b!1057527 () Bool)

(declare-fun e!601473 () Bool)

(assert (=> b!1057527 (= e!601473 e!601470)))

(declare-fun res!706270 () Bool)

(assert (=> b!1057527 (=> (not res!706270) (not e!601470))))

(assert (=> b!1057527 (= res!706270 (not (= lt!466375 i!1381)))))

(declare-fun lt!466372 () array!66650)

(declare-fun arrayScanForKey!0 (array!66650 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057527 (= lt!466375 (arrayScanForKey!0 lt!466372 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057522 () Bool)

(declare-fun res!706272 () Bool)

(assert (=> b!1057522 (=> (not res!706272) (not e!601469))))

(declare-fun arrayNoDuplicates!0 (array!66650 (_ BitVec 32) List!22417) Bool)

(assert (=> b!1057522 (= res!706272 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22414))))

(declare-fun res!706273 () Bool)

(assert (=> start!93310 (=> (not res!706273) (not e!601469))))

(assert (=> start!93310 (= res!706273 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32584 a!3488)) (bvslt (size!32584 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93310 e!601469))

(assert (=> start!93310 true))

(declare-fun array_inv!24829 (array!66650) Bool)

(assert (=> start!93310 (array_inv!24829 a!3488)))

(declare-fun b!1057528 () Bool)

(declare-fun res!706265 () Bool)

(assert (=> b!1057528 (=> (not res!706265) (not e!601469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057528 (= res!706265 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057529 () Bool)

(assert (=> b!1057529 (= e!601466 e!601471)))

(declare-fun res!706267 () Bool)

(assert (=> b!1057529 (=> res!706267 e!601471)))

(declare-fun lt!466374 () (_ BitVec 32))

(assert (=> b!1057529 (= res!706267 (or (bvslt lt!466375 #b00000000000000000000000000000000) (bvsge lt!466374 (size!32584 a!3488)) (bvsge lt!466375 (size!32584 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057529 (arrayContainsKey!0 a!3488 k0!2747 lt!466374)))

(declare-datatypes ((Unit!34547 0))(
  ( (Unit!34548) )
))
(declare-fun lt!466371 () Unit!34547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34547)

(assert (=> b!1057529 (= lt!466371 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466374))))

(assert (=> b!1057529 (= lt!466374 (bvadd #b00000000000000000000000000000001 lt!466375))))

(assert (=> b!1057529 (arrayNoDuplicates!0 a!3488 lt!466375 Nil!22414)))

(declare-fun lt!466373 () Unit!34547)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66650 (_ BitVec 32) (_ BitVec 32)) Unit!34547)

(assert (=> b!1057529 (= lt!466373 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466375))))

(declare-fun b!1057530 () Bool)

(assert (=> b!1057530 (= e!601469 e!601473)))

(declare-fun res!706271 () Bool)

(assert (=> b!1057530 (=> (not res!706271) (not e!601473))))

(assert (=> b!1057530 (= res!706271 (arrayContainsKey!0 lt!466372 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057530 (= lt!466372 (array!66651 (store (arr!32046 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32584 a!3488)))))

(declare-fun b!1057531 () Bool)

(assert (=> b!1057531 (= e!601468 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(assert (= (and start!93310 res!706273) b!1057522))

(assert (= (and b!1057522 res!706272) b!1057528))

(assert (= (and b!1057528 res!706265) b!1057525))

(assert (= (and b!1057525 res!706269) b!1057530))

(assert (= (and b!1057530 res!706271) b!1057527))

(assert (= (and b!1057527 res!706270) b!1057523))

(assert (= (and b!1057523 res!706266) b!1057524))

(assert (= (and b!1057524 (not res!706264)) b!1057531))

(assert (= (and b!1057523 (not res!706268)) b!1057529))

(assert (= (and b!1057529 (not res!706267)) b!1057526))

(declare-fun m!976733 () Bool)

(assert (=> b!1057525 m!976733))

(declare-fun m!976735 () Bool)

(assert (=> b!1057527 m!976735))

(declare-fun m!976737 () Bool)

(assert (=> b!1057531 m!976737))

(declare-fun m!976739 () Bool)

(assert (=> start!93310 m!976739))

(declare-fun m!976741 () Bool)

(assert (=> b!1057528 m!976741))

(declare-fun m!976743 () Bool)

(assert (=> b!1057523 m!976743))

(declare-fun m!976745 () Bool)

(assert (=> b!1057523 m!976745))

(declare-fun m!976747 () Bool)

(assert (=> b!1057529 m!976747))

(declare-fun m!976749 () Bool)

(assert (=> b!1057529 m!976749))

(declare-fun m!976751 () Bool)

(assert (=> b!1057529 m!976751))

(declare-fun m!976753 () Bool)

(assert (=> b!1057529 m!976753))

(declare-fun m!976755 () Bool)

(assert (=> b!1057530 m!976755))

(assert (=> b!1057530 m!976743))

(declare-fun m!976757 () Bool)

(assert (=> b!1057522 m!976757))

(declare-fun m!976759 () Bool)

(assert (=> b!1057526 m!976759))

(check-sat (not b!1057531) (not b!1057522) (not b!1057530) (not b!1057526) (not b!1057529) (not b!1057528) (not start!93310) (not b!1057527))
(check-sat)
(get-model)

(declare-fun d!128303 () Bool)

(declare-fun res!706338 () Bool)

(declare-fun e!601526 () Bool)

(assert (=> d!128303 (=> res!706338 e!601526)))

(get-info :version)

(assert (=> d!128303 (= res!706338 ((_ is Nil!22414) Nil!22414))))

(assert (=> d!128303 (= (noDuplicate!1570 Nil!22414) e!601526)))

(declare-fun b!1057596 () Bool)

(declare-fun e!601527 () Bool)

(assert (=> b!1057596 (= e!601526 e!601527)))

(declare-fun res!706339 () Bool)

(assert (=> b!1057596 (=> (not res!706339) (not e!601527))))

(declare-fun contains!6169 (List!22417 (_ BitVec 64)) Bool)

(assert (=> b!1057596 (= res!706339 (not (contains!6169 (t!31715 Nil!22414) (h!23622 Nil!22414))))))

(declare-fun b!1057597 () Bool)

(assert (=> b!1057597 (= e!601527 (noDuplicate!1570 (t!31715 Nil!22414)))))

(assert (= (and d!128303 (not res!706338)) b!1057596))

(assert (= (and b!1057596 res!706339) b!1057597))

(declare-fun m!976817 () Bool)

(assert (=> b!1057596 m!976817))

(declare-fun m!976819 () Bool)

(assert (=> b!1057597 m!976819))

(assert (=> b!1057526 d!128303))

(declare-fun d!128305 () Bool)

(declare-fun res!706344 () Bool)

(declare-fun e!601532 () Bool)

(assert (=> d!128305 (=> res!706344 e!601532)))

(assert (=> d!128305 (= res!706344 (= (select (arr!32046 a!3488) i!1381) k0!2747))))

(assert (=> d!128305 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601532)))

(declare-fun b!1057602 () Bool)

(declare-fun e!601533 () Bool)

(assert (=> b!1057602 (= e!601532 e!601533)))

(declare-fun res!706345 () Bool)

(assert (=> b!1057602 (=> (not res!706345) (not e!601533))))

(assert (=> b!1057602 (= res!706345 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32584 a!3488)))))

(declare-fun b!1057603 () Bool)

(assert (=> b!1057603 (= e!601533 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128305 (not res!706344)) b!1057602))

(assert (= (and b!1057602 res!706345) b!1057603))

(assert (=> d!128305 m!976733))

(declare-fun m!976821 () Bool)

(assert (=> b!1057603 m!976821))

(assert (=> b!1057531 d!128305))

(declare-fun d!128307 () Bool)

(declare-fun res!706346 () Bool)

(declare-fun e!601534 () Bool)

(assert (=> d!128307 (=> res!706346 e!601534)))

(assert (=> d!128307 (= res!706346 (= (select (arr!32046 lt!466372) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128307 (= (arrayContainsKey!0 lt!466372 k0!2747 #b00000000000000000000000000000000) e!601534)))

(declare-fun b!1057604 () Bool)

(declare-fun e!601535 () Bool)

(assert (=> b!1057604 (= e!601534 e!601535)))

(declare-fun res!706347 () Bool)

(assert (=> b!1057604 (=> (not res!706347) (not e!601535))))

(assert (=> b!1057604 (= res!706347 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32584 lt!466372)))))

(declare-fun b!1057605 () Bool)

(assert (=> b!1057605 (= e!601535 (arrayContainsKey!0 lt!466372 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128307 (not res!706346)) b!1057604))

(assert (= (and b!1057604 res!706347) b!1057605))

(declare-fun m!976823 () Bool)

(assert (=> d!128307 m!976823))

(declare-fun m!976825 () Bool)

(assert (=> b!1057605 m!976825))

(assert (=> b!1057530 d!128307))

(declare-fun d!128309 () Bool)

(declare-fun res!706348 () Bool)

(declare-fun e!601536 () Bool)

(assert (=> d!128309 (=> res!706348 e!601536)))

(assert (=> d!128309 (= res!706348 (= (select (arr!32046 a!3488) lt!466374) k0!2747))))

(assert (=> d!128309 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466374) e!601536)))

(declare-fun b!1057606 () Bool)

(declare-fun e!601537 () Bool)

(assert (=> b!1057606 (= e!601536 e!601537)))

(declare-fun res!706349 () Bool)

(assert (=> b!1057606 (=> (not res!706349) (not e!601537))))

(assert (=> b!1057606 (= res!706349 (bvslt (bvadd lt!466374 #b00000000000000000000000000000001) (size!32584 a!3488)))))

(declare-fun b!1057607 () Bool)

(assert (=> b!1057607 (= e!601537 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466374 #b00000000000000000000000000000001)))))

(assert (= (and d!128309 (not res!706348)) b!1057606))

(assert (= (and b!1057606 res!706349) b!1057607))

(declare-fun m!976827 () Bool)

(assert (=> d!128309 m!976827))

(declare-fun m!976829 () Bool)

(assert (=> b!1057607 m!976829))

(assert (=> b!1057529 d!128309))

(declare-fun d!128311 () Bool)

(assert (=> d!128311 (arrayContainsKey!0 a!3488 k0!2747 lt!466374)))

(declare-fun lt!466408 () Unit!34547)

(declare-fun choose!114 (array!66650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34547)

(assert (=> d!128311 (= lt!466408 (choose!114 a!3488 k0!2747 i!1381 lt!466374))))

(assert (=> d!128311 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128311 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466374) lt!466408)))

(declare-fun bs!30989 () Bool)

(assert (= bs!30989 d!128311))

(assert (=> bs!30989 m!976747))

(declare-fun m!976831 () Bool)

(assert (=> bs!30989 m!976831))

(assert (=> b!1057529 d!128311))

(declare-fun b!1057628 () Bool)

(declare-fun e!601556 () Bool)

(declare-fun e!601554 () Bool)

(assert (=> b!1057628 (= e!601556 e!601554)))

(declare-fun c!107096 () Bool)

(assert (=> b!1057628 (= c!107096 (validKeyInArray!0 (select (arr!32046 a!3488) lt!466375)))))

(declare-fun b!1057629 () Bool)

(declare-fun e!601555 () Bool)

(assert (=> b!1057629 (= e!601555 e!601556)))

(declare-fun res!706362 () Bool)

(assert (=> b!1057629 (=> (not res!706362) (not e!601556))))

(declare-fun e!601557 () Bool)

(assert (=> b!1057629 (= res!706362 (not e!601557))))

(declare-fun res!706363 () Bool)

(assert (=> b!1057629 (=> (not res!706363) (not e!601557))))

(assert (=> b!1057629 (= res!706363 (validKeyInArray!0 (select (arr!32046 a!3488) lt!466375)))))

(declare-fun b!1057630 () Bool)

(assert (=> b!1057630 (= e!601557 (contains!6169 Nil!22414 (select (arr!32046 a!3488) lt!466375)))))

(declare-fun d!128313 () Bool)

(declare-fun res!706364 () Bool)

(assert (=> d!128313 (=> res!706364 e!601555)))

(assert (=> d!128313 (= res!706364 (bvsge lt!466375 (size!32584 a!3488)))))

(assert (=> d!128313 (= (arrayNoDuplicates!0 a!3488 lt!466375 Nil!22414) e!601555)))

(declare-fun call!44828 () Bool)

(declare-fun bm!44825 () Bool)

(assert (=> bm!44825 (= call!44828 (arrayNoDuplicates!0 a!3488 (bvadd lt!466375 #b00000000000000000000000000000001) (ite c!107096 (Cons!22413 (select (arr!32046 a!3488) lt!466375) Nil!22414) Nil!22414)))))

(declare-fun b!1057631 () Bool)

(assert (=> b!1057631 (= e!601554 call!44828)))

(declare-fun b!1057632 () Bool)

(assert (=> b!1057632 (= e!601554 call!44828)))

(assert (= (and d!128313 (not res!706364)) b!1057629))

(assert (= (and b!1057629 res!706363) b!1057630))

(assert (= (and b!1057629 res!706362) b!1057628))

(assert (= (and b!1057628 c!107096) b!1057632))

(assert (= (and b!1057628 (not c!107096)) b!1057631))

(assert (= (or b!1057632 b!1057631) bm!44825))

(declare-fun m!976833 () Bool)

(assert (=> b!1057628 m!976833))

(assert (=> b!1057628 m!976833))

(declare-fun m!976835 () Bool)

(assert (=> b!1057628 m!976835))

(assert (=> b!1057629 m!976833))

(assert (=> b!1057629 m!976833))

(assert (=> b!1057629 m!976835))

(assert (=> b!1057630 m!976833))

(assert (=> b!1057630 m!976833))

(declare-fun m!976837 () Bool)

(assert (=> b!1057630 m!976837))

(assert (=> bm!44825 m!976833))

(declare-fun m!976839 () Bool)

(assert (=> bm!44825 m!976839))

(assert (=> b!1057529 d!128313))

(declare-fun d!128317 () Bool)

(assert (=> d!128317 (arrayNoDuplicates!0 a!3488 lt!466375 Nil!22414)))

(declare-fun lt!466411 () Unit!34547)

(declare-fun choose!39 (array!66650 (_ BitVec 32) (_ BitVec 32)) Unit!34547)

(assert (=> d!128317 (= lt!466411 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466375))))

(assert (=> d!128317 (bvslt (size!32584 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128317 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466375) lt!466411)))

(declare-fun bs!30990 () Bool)

(assert (= bs!30990 d!128317))

(assert (=> bs!30990 m!976751))

(declare-fun m!976847 () Bool)

(assert (=> bs!30990 m!976847))

(assert (=> b!1057529 d!128317))

(declare-fun b!1057638 () Bool)

(declare-fun e!601564 () Bool)

(declare-fun e!601562 () Bool)

(assert (=> b!1057638 (= e!601564 e!601562)))

(declare-fun c!107098 () Bool)

(assert (=> b!1057638 (= c!107098 (validKeyInArray!0 (select (arr!32046 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057639 () Bool)

(declare-fun e!601563 () Bool)

(assert (=> b!1057639 (= e!601563 e!601564)))

(declare-fun res!706368 () Bool)

(assert (=> b!1057639 (=> (not res!706368) (not e!601564))))

(declare-fun e!601565 () Bool)

(assert (=> b!1057639 (= res!706368 (not e!601565))))

(declare-fun res!706369 () Bool)

(assert (=> b!1057639 (=> (not res!706369) (not e!601565))))

(assert (=> b!1057639 (= res!706369 (validKeyInArray!0 (select (arr!32046 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057640 () Bool)

(assert (=> b!1057640 (= e!601565 (contains!6169 Nil!22414 (select (arr!32046 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128319 () Bool)

(declare-fun res!706370 () Bool)

(assert (=> d!128319 (=> res!706370 e!601563)))

(assert (=> d!128319 (= res!706370 (bvsge #b00000000000000000000000000000000 (size!32584 a!3488)))))

(assert (=> d!128319 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22414) e!601563)))

(declare-fun bm!44829 () Bool)

(declare-fun call!44832 () Bool)

(assert (=> bm!44829 (= call!44832 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107098 (Cons!22413 (select (arr!32046 a!3488) #b00000000000000000000000000000000) Nil!22414) Nil!22414)))))

(declare-fun b!1057641 () Bool)

(assert (=> b!1057641 (= e!601562 call!44832)))

(declare-fun b!1057642 () Bool)

(assert (=> b!1057642 (= e!601562 call!44832)))

(assert (= (and d!128319 (not res!706370)) b!1057639))

(assert (= (and b!1057639 res!706369) b!1057640))

(assert (= (and b!1057639 res!706368) b!1057638))

(assert (= (and b!1057638 c!107098) b!1057642))

(assert (= (and b!1057638 (not c!107098)) b!1057641))

(assert (= (or b!1057642 b!1057641) bm!44829))

(declare-fun m!976851 () Bool)

(assert (=> b!1057638 m!976851))

(assert (=> b!1057638 m!976851))

(declare-fun m!976853 () Bool)

(assert (=> b!1057638 m!976853))

(assert (=> b!1057639 m!976851))

(assert (=> b!1057639 m!976851))

(assert (=> b!1057639 m!976853))

(assert (=> b!1057640 m!976851))

(assert (=> b!1057640 m!976851))

(declare-fun m!976855 () Bool)

(assert (=> b!1057640 m!976855))

(assert (=> bm!44829 m!976851))

(declare-fun m!976857 () Bool)

(assert (=> bm!44829 m!976857))

(assert (=> b!1057522 d!128319))

(declare-fun d!128323 () Bool)

(declare-fun lt!466419 () (_ BitVec 32))

(assert (=> d!128323 (and (or (bvslt lt!466419 #b00000000000000000000000000000000) (bvsge lt!466419 (size!32584 lt!466372)) (and (bvsge lt!466419 #b00000000000000000000000000000000) (bvslt lt!466419 (size!32584 lt!466372)))) (bvsge lt!466419 #b00000000000000000000000000000000) (bvslt lt!466419 (size!32584 lt!466372)) (= (select (arr!32046 lt!466372) lt!466419) k0!2747))))

(declare-fun e!601585 () (_ BitVec 32))

(assert (=> d!128323 (= lt!466419 e!601585)))

(declare-fun c!107106 () Bool)

(assert (=> d!128323 (= c!107106 (= (select (arr!32046 lt!466372) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32584 lt!466372)) (bvslt (size!32584 lt!466372) #b01111111111111111111111111111111))))

(assert (=> d!128323 (= (arrayScanForKey!0 lt!466372 k0!2747 #b00000000000000000000000000000000) lt!466419)))

(declare-fun b!1057669 () Bool)

(assert (=> b!1057669 (= e!601585 #b00000000000000000000000000000000)))

(declare-fun b!1057670 () Bool)

(assert (=> b!1057670 (= e!601585 (arrayScanForKey!0 lt!466372 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128323 c!107106) b!1057669))

(assert (= (and d!128323 (not c!107106)) b!1057670))

(declare-fun m!976871 () Bool)

(assert (=> d!128323 m!976871))

(assert (=> d!128323 m!976823))

(declare-fun m!976873 () Bool)

(assert (=> b!1057670 m!976873))

(assert (=> b!1057527 d!128323))

(declare-fun d!128335 () Bool)

(assert (=> d!128335 (= (array_inv!24829 a!3488) (bvsge (size!32584 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93310 d!128335))

(declare-fun d!128337 () Bool)

(assert (=> d!128337 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057528 d!128337))

(check-sat (not b!1057597) (not b!1057639) (not b!1057670) (not bm!44829) (not b!1057640) (not d!128311) (not b!1057596) (not d!128317) (not b!1057638) (not bm!44825) (not b!1057628) (not b!1057603) (not b!1057629) (not b!1057607) (not b!1057605) (not b!1057630))
(check-sat)
