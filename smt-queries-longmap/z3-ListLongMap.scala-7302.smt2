; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93314 () Bool)

(assert start!93314)

(declare-fun b!1057703 () Bool)

(declare-fun e!601584 () Bool)

(declare-fun e!601582 () Bool)

(assert (=> b!1057703 (= e!601584 e!601582)))

(declare-fun res!706364 () Bool)

(assert (=> b!1057703 (=> res!706364 e!601582)))

(declare-datatypes ((array!66713 0))(
  ( (array!66714 (arr!32078 (Array (_ BitVec 32) (_ BitVec 64))) (size!32614 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66713)

(declare-fun lt!466589 () (_ BitVec 32))

(declare-fun lt!466588 () (_ BitVec 32))

(assert (=> b!1057703 (= res!706364 (or (bvslt lt!466588 #b00000000000000000000000000000000) (bvsge lt!466589 (size!32614 a!3488)) (bvsge lt!466588 (size!32614 a!3488))))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057703 (arrayContainsKey!0 a!3488 k0!2747 lt!466589)))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((Unit!34678 0))(
  ( (Unit!34679) )
))
(declare-fun lt!466586 () Unit!34678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66713 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34678)

(assert (=> b!1057703 (= lt!466586 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466589))))

(assert (=> b!1057703 (= lt!466589 (bvadd #b00000000000000000000000000000001 lt!466588))))

(declare-datatypes ((List!22390 0))(
  ( (Nil!22387) (Cons!22386 (h!23595 (_ BitVec 64)) (t!31697 List!22390)) )
))
(declare-fun arrayNoDuplicates!0 (array!66713 (_ BitVec 32) List!22390) Bool)

(assert (=> b!1057703 (arrayNoDuplicates!0 a!3488 lt!466588 Nil!22387)))

(declare-fun lt!466587 () Unit!34678)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66713 (_ BitVec 32) (_ BitVec 32)) Unit!34678)

(assert (=> b!1057703 (= lt!466587 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466588))))

(declare-fun b!1057704 () Bool)

(declare-fun e!601588 () Bool)

(declare-fun e!601581 () Bool)

(assert (=> b!1057704 (= e!601588 e!601581)))

(declare-fun res!706370 () Bool)

(assert (=> b!1057704 (=> (not res!706370) (not e!601581))))

(assert (=> b!1057704 (= res!706370 (not (= lt!466588 i!1381)))))

(declare-fun lt!466590 () array!66713)

(declare-fun arrayScanForKey!0 (array!66713 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057704 (= lt!466588 (arrayScanForKey!0 lt!466590 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057705 () Bool)

(declare-fun noDuplicate!1558 (List!22390) Bool)

(assert (=> b!1057705 (= e!601582 (noDuplicate!1558 Nil!22387))))

(declare-fun b!1057706 () Bool)

(declare-fun res!706361 () Bool)

(declare-fun e!601585 () Bool)

(assert (=> b!1057706 (=> (not res!706361) (not e!601585))))

(assert (=> b!1057706 (= res!706361 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22387))))

(declare-fun b!1057707 () Bool)

(declare-fun res!706366 () Bool)

(assert (=> b!1057707 (=> (not res!706366) (not e!601585))))

(assert (=> b!1057707 (= res!706366 (= (select (arr!32078 a!3488) i!1381) k0!2747))))

(declare-fun b!1057708 () Bool)

(declare-fun e!601586 () Bool)

(declare-fun e!601583 () Bool)

(assert (=> b!1057708 (= e!601586 e!601583)))

(declare-fun res!706362 () Bool)

(assert (=> b!1057708 (=> res!706362 e!601583)))

(assert (=> b!1057708 (= res!706362 (or (bvsgt lt!466588 i!1381) (bvsle i!1381 lt!466588)))))

(declare-fun b!1057710 () Bool)

(assert (=> b!1057710 (= e!601585 e!601588)))

(declare-fun res!706365 () Bool)

(assert (=> b!1057710 (=> (not res!706365) (not e!601588))))

(assert (=> b!1057710 (= res!706365 (arrayContainsKey!0 lt!466590 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057710 (= lt!466590 (array!66714 (store (arr!32078 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32614 a!3488)))))

(declare-fun b!1057711 () Bool)

(assert (=> b!1057711 (= e!601583 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057712 () Bool)

(declare-fun res!706368 () Bool)

(assert (=> b!1057712 (=> (not res!706368) (not e!601585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057712 (= res!706368 (validKeyInArray!0 k0!2747))))

(declare-fun res!706367 () Bool)

(assert (=> start!93314 (=> (not res!706367) (not e!601585))))

(assert (=> start!93314 (= res!706367 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32614 a!3488)) (bvslt (size!32614 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93314 e!601585))

(assert (=> start!93314 true))

(declare-fun array_inv!24858 (array!66713) Bool)

(assert (=> start!93314 (array_inv!24858 a!3488)))

(declare-fun b!1057709 () Bool)

(assert (=> b!1057709 (= e!601581 (not e!601584))))

(declare-fun res!706369 () Bool)

(assert (=> b!1057709 (=> res!706369 e!601584)))

(assert (=> b!1057709 (= res!706369 (or (bvsgt lt!466588 i!1381) (bvsle i!1381 lt!466588)))))

(assert (=> b!1057709 e!601586))

(declare-fun res!706363 () Bool)

(assert (=> b!1057709 (=> (not res!706363) (not e!601586))))

(assert (=> b!1057709 (= res!706363 (= (select (store (arr!32078 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466588) k0!2747))))

(assert (= (and start!93314 res!706367) b!1057706))

(assert (= (and b!1057706 res!706361) b!1057712))

(assert (= (and b!1057712 res!706368) b!1057707))

(assert (= (and b!1057707 res!706366) b!1057710))

(assert (= (and b!1057710 res!706365) b!1057704))

(assert (= (and b!1057704 res!706370) b!1057709))

(assert (= (and b!1057709 res!706363) b!1057708))

(assert (= (and b!1057708 (not res!706362)) b!1057711))

(assert (= (and b!1057709 (not res!706369)) b!1057703))

(assert (= (and b!1057703 (not res!706364)) b!1057705))

(declare-fun m!977385 () Bool)

(assert (=> start!93314 m!977385))

(declare-fun m!977387 () Bool)

(assert (=> b!1057707 m!977387))

(declare-fun m!977389 () Bool)

(assert (=> b!1057710 m!977389))

(declare-fun m!977391 () Bool)

(assert (=> b!1057710 m!977391))

(declare-fun m!977393 () Bool)

(assert (=> b!1057712 m!977393))

(declare-fun m!977395 () Bool)

(assert (=> b!1057706 m!977395))

(assert (=> b!1057709 m!977391))

(declare-fun m!977397 () Bool)

(assert (=> b!1057709 m!977397))

(declare-fun m!977399 () Bool)

(assert (=> b!1057711 m!977399))

(declare-fun m!977401 () Bool)

(assert (=> b!1057704 m!977401))

(declare-fun m!977403 () Bool)

(assert (=> b!1057705 m!977403))

(declare-fun m!977405 () Bool)

(assert (=> b!1057703 m!977405))

(declare-fun m!977407 () Bool)

(assert (=> b!1057703 m!977407))

(declare-fun m!977409 () Bool)

(assert (=> b!1057703 m!977409))

(declare-fun m!977411 () Bool)

(assert (=> b!1057703 m!977411))

(check-sat (not b!1057706) (not b!1057704) (not b!1057710) (not start!93314) (not b!1057703) (not b!1057711) (not b!1057712) (not b!1057705))
(check-sat)
(get-model)

(declare-fun d!128453 () Bool)

(declare-fun lt!466608 () (_ BitVec 32))

(assert (=> d!128453 (and (or (bvslt lt!466608 #b00000000000000000000000000000000) (bvsge lt!466608 (size!32614 lt!466590)) (and (bvsge lt!466608 #b00000000000000000000000000000000) (bvslt lt!466608 (size!32614 lt!466590)))) (bvsge lt!466608 #b00000000000000000000000000000000) (bvslt lt!466608 (size!32614 lt!466590)) (= (select (arr!32078 lt!466590) lt!466608) k0!2747))))

(declare-fun e!601615 () (_ BitVec 32))

(assert (=> d!128453 (= lt!466608 e!601615)))

(declare-fun c!107133 () Bool)

(assert (=> d!128453 (= c!107133 (= (select (arr!32078 lt!466590) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32614 lt!466590)) (bvslt (size!32614 lt!466590) #b01111111111111111111111111111111))))

(assert (=> d!128453 (= (arrayScanForKey!0 lt!466590 k0!2747 #b00000000000000000000000000000000) lt!466608)))

(declare-fun b!1057747 () Bool)

(assert (=> b!1057747 (= e!601615 #b00000000000000000000000000000000)))

(declare-fun b!1057748 () Bool)

(assert (=> b!1057748 (= e!601615 (arrayScanForKey!0 lt!466590 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128453 c!107133) b!1057747))

(assert (= (and d!128453 (not c!107133)) b!1057748))

(declare-fun m!977441 () Bool)

(assert (=> d!128453 m!977441))

(declare-fun m!977443 () Bool)

(assert (=> d!128453 m!977443))

(declare-fun m!977445 () Bool)

(assert (=> b!1057748 m!977445))

(assert (=> b!1057704 d!128453))

(declare-fun d!128455 () Bool)

(assert (=> d!128455 (= (array_inv!24858 a!3488) (bvsge (size!32614 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93314 d!128455))

(declare-fun d!128457 () Bool)

(declare-fun res!706405 () Bool)

(declare-fun e!601620 () Bool)

(assert (=> d!128457 (=> res!706405 e!601620)))

(assert (=> d!128457 (= res!706405 (= (select (arr!32078 a!3488) lt!466589) k0!2747))))

(assert (=> d!128457 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466589) e!601620)))

(declare-fun b!1057753 () Bool)

(declare-fun e!601621 () Bool)

(assert (=> b!1057753 (= e!601620 e!601621)))

(declare-fun res!706406 () Bool)

(assert (=> b!1057753 (=> (not res!706406) (not e!601621))))

(assert (=> b!1057753 (= res!706406 (bvslt (bvadd lt!466589 #b00000000000000000000000000000001) (size!32614 a!3488)))))

(declare-fun b!1057754 () Bool)

(assert (=> b!1057754 (= e!601621 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466589 #b00000000000000000000000000000001)))))

(assert (= (and d!128457 (not res!706405)) b!1057753))

(assert (= (and b!1057753 res!706406) b!1057754))

(declare-fun m!977447 () Bool)

(assert (=> d!128457 m!977447))

(declare-fun m!977449 () Bool)

(assert (=> b!1057754 m!977449))

(assert (=> b!1057703 d!128457))

(declare-fun d!128459 () Bool)

(assert (=> d!128459 (arrayContainsKey!0 a!3488 k0!2747 lt!466589)))

(declare-fun lt!466611 () Unit!34678)

(declare-fun choose!114 (array!66713 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34678)

(assert (=> d!128459 (= lt!466611 (choose!114 a!3488 k0!2747 i!1381 lt!466589))))

(assert (=> d!128459 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128459 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466589) lt!466611)))

(declare-fun bs!31018 () Bool)

(assert (= bs!31018 d!128459))

(assert (=> bs!31018 m!977405))

(declare-fun m!977451 () Bool)

(assert (=> bs!31018 m!977451))

(assert (=> b!1057703 d!128459))

(declare-fun b!1057769 () Bool)

(declare-fun e!601635 () Bool)

(declare-fun call!44851 () Bool)

(assert (=> b!1057769 (= e!601635 call!44851)))

(declare-fun b!1057770 () Bool)

(declare-fun e!601632 () Bool)

(assert (=> b!1057770 (= e!601632 e!601635)))

(declare-fun c!107138 () Bool)

(assert (=> b!1057770 (= c!107138 (validKeyInArray!0 (select (arr!32078 a!3488) lt!466588)))))

(declare-fun b!1057771 () Bool)

(declare-fun e!601634 () Bool)

(assert (=> b!1057771 (= e!601634 e!601632)))

(declare-fun res!706415 () Bool)

(assert (=> b!1057771 (=> (not res!706415) (not e!601632))))

(declare-fun e!601633 () Bool)

(assert (=> b!1057771 (= res!706415 (not e!601633))))

(declare-fun res!706414 () Bool)

(assert (=> b!1057771 (=> (not res!706414) (not e!601633))))

(assert (=> b!1057771 (= res!706414 (validKeyInArray!0 (select (arr!32078 a!3488) lt!466588)))))

(declare-fun b!1057772 () Bool)

(declare-fun contains!6201 (List!22390 (_ BitVec 64)) Bool)

(assert (=> b!1057772 (= e!601633 (contains!6201 Nil!22387 (select (arr!32078 a!3488) lt!466588)))))

(declare-fun b!1057773 () Bool)

(assert (=> b!1057773 (= e!601635 call!44851)))

(declare-fun d!128461 () Bool)

(declare-fun res!706413 () Bool)

(assert (=> d!128461 (=> res!706413 e!601634)))

(assert (=> d!128461 (= res!706413 (bvsge lt!466588 (size!32614 a!3488)))))

(assert (=> d!128461 (= (arrayNoDuplicates!0 a!3488 lt!466588 Nil!22387) e!601634)))

(declare-fun bm!44848 () Bool)

(assert (=> bm!44848 (= call!44851 (arrayNoDuplicates!0 a!3488 (bvadd lt!466588 #b00000000000000000000000000000001) (ite c!107138 (Cons!22386 (select (arr!32078 a!3488) lt!466588) Nil!22387) Nil!22387)))))

(assert (= (and d!128461 (not res!706413)) b!1057771))

(assert (= (and b!1057771 res!706414) b!1057772))

(assert (= (and b!1057771 res!706415) b!1057770))

(assert (= (and b!1057770 c!107138) b!1057773))

(assert (= (and b!1057770 (not c!107138)) b!1057769))

(assert (= (or b!1057773 b!1057769) bm!44848))

(declare-fun m!977453 () Bool)

(assert (=> b!1057770 m!977453))

(assert (=> b!1057770 m!977453))

(declare-fun m!977455 () Bool)

(assert (=> b!1057770 m!977455))

(assert (=> b!1057771 m!977453))

(assert (=> b!1057771 m!977453))

(assert (=> b!1057771 m!977455))

(assert (=> b!1057772 m!977453))

(assert (=> b!1057772 m!977453))

(declare-fun m!977457 () Bool)

(assert (=> b!1057772 m!977457))

(assert (=> bm!44848 m!977453))

(declare-fun m!977459 () Bool)

(assert (=> bm!44848 m!977459))

(assert (=> b!1057703 d!128461))

(declare-fun d!128465 () Bool)

(assert (=> d!128465 (arrayNoDuplicates!0 a!3488 lt!466588 Nil!22387)))

(declare-fun lt!466617 () Unit!34678)

(declare-fun choose!39 (array!66713 (_ BitVec 32) (_ BitVec 32)) Unit!34678)

(assert (=> d!128465 (= lt!466617 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466588))))

(assert (=> d!128465 (bvslt (size!32614 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128465 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466588) lt!466617)))

(declare-fun bs!31019 () Bool)

(assert (= bs!31019 d!128465))

(assert (=> bs!31019 m!977409))

(declare-fun m!977467 () Bool)

(assert (=> bs!31019 m!977467))

(assert (=> b!1057703 d!128465))

(declare-fun d!128471 () Bool)

(declare-fun res!706432 () Bool)

(declare-fun e!601653 () Bool)

(assert (=> d!128471 (=> res!706432 e!601653)))

(get-info :version)

(assert (=> d!128471 (= res!706432 ((_ is Nil!22387) Nil!22387))))

(assert (=> d!128471 (= (noDuplicate!1558 Nil!22387) e!601653)))

(declare-fun b!1057792 () Bool)

(declare-fun e!601654 () Bool)

(assert (=> b!1057792 (= e!601653 e!601654)))

(declare-fun res!706433 () Bool)

(assert (=> b!1057792 (=> (not res!706433) (not e!601654))))

(assert (=> b!1057792 (= res!706433 (not (contains!6201 (t!31697 Nil!22387) (h!23595 Nil!22387))))))

(declare-fun b!1057793 () Bool)

(assert (=> b!1057793 (= e!601654 (noDuplicate!1558 (t!31697 Nil!22387)))))

(assert (= (and d!128471 (not res!706432)) b!1057792))

(assert (= (and b!1057792 res!706433) b!1057793))

(declare-fun m!977477 () Bool)

(assert (=> b!1057792 m!977477))

(declare-fun m!977479 () Bool)

(assert (=> b!1057793 m!977479))

(assert (=> b!1057705 d!128471))

(declare-fun d!128479 () Bool)

(declare-fun res!706436 () Bool)

(declare-fun e!601657 () Bool)

(assert (=> d!128479 (=> res!706436 e!601657)))

(assert (=> d!128479 (= res!706436 (= (select (arr!32078 lt!466590) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128479 (= (arrayContainsKey!0 lt!466590 k0!2747 #b00000000000000000000000000000000) e!601657)))

(declare-fun b!1057796 () Bool)

(declare-fun e!601658 () Bool)

(assert (=> b!1057796 (= e!601657 e!601658)))

(declare-fun res!706437 () Bool)

(assert (=> b!1057796 (=> (not res!706437) (not e!601658))))

(assert (=> b!1057796 (= res!706437 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32614 lt!466590)))))

(declare-fun b!1057797 () Bool)

(assert (=> b!1057797 (= e!601658 (arrayContainsKey!0 lt!466590 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128479 (not res!706436)) b!1057796))

(assert (= (and b!1057796 res!706437) b!1057797))

(assert (=> d!128479 m!977443))

(declare-fun m!977487 () Bool)

(assert (=> b!1057797 m!977487))

(assert (=> b!1057710 d!128479))

(declare-fun d!128485 () Bool)

(assert (=> d!128485 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057712 d!128485))

(declare-fun b!1057798 () Bool)

(declare-fun e!601662 () Bool)

(declare-fun call!44852 () Bool)

(assert (=> b!1057798 (= e!601662 call!44852)))

(declare-fun b!1057799 () Bool)

(declare-fun e!601659 () Bool)

(assert (=> b!1057799 (= e!601659 e!601662)))

(declare-fun c!107140 () Bool)

(assert (=> b!1057799 (= c!107140 (validKeyInArray!0 (select (arr!32078 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057800 () Bool)

(declare-fun e!601661 () Bool)

(assert (=> b!1057800 (= e!601661 e!601659)))

(declare-fun res!706440 () Bool)

(assert (=> b!1057800 (=> (not res!706440) (not e!601659))))

(declare-fun e!601660 () Bool)

(assert (=> b!1057800 (= res!706440 (not e!601660))))

(declare-fun res!706439 () Bool)

(assert (=> b!1057800 (=> (not res!706439) (not e!601660))))

(assert (=> b!1057800 (= res!706439 (validKeyInArray!0 (select (arr!32078 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057801 () Bool)

(assert (=> b!1057801 (= e!601660 (contains!6201 Nil!22387 (select (arr!32078 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057802 () Bool)

(assert (=> b!1057802 (= e!601662 call!44852)))

(declare-fun d!128487 () Bool)

(declare-fun res!706438 () Bool)

(assert (=> d!128487 (=> res!706438 e!601661)))

(assert (=> d!128487 (= res!706438 (bvsge #b00000000000000000000000000000000 (size!32614 a!3488)))))

(assert (=> d!128487 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22387) e!601661)))

(declare-fun bm!44849 () Bool)

(assert (=> bm!44849 (= call!44852 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107140 (Cons!22386 (select (arr!32078 a!3488) #b00000000000000000000000000000000) Nil!22387) Nil!22387)))))

(assert (= (and d!128487 (not res!706438)) b!1057800))

(assert (= (and b!1057800 res!706439) b!1057801))

(assert (= (and b!1057800 res!706440) b!1057799))

(assert (= (and b!1057799 c!107140) b!1057802))

(assert (= (and b!1057799 (not c!107140)) b!1057798))

(assert (= (or b!1057802 b!1057798) bm!44849))

(declare-fun m!977489 () Bool)

(assert (=> b!1057799 m!977489))

(assert (=> b!1057799 m!977489))

(declare-fun m!977491 () Bool)

(assert (=> b!1057799 m!977491))

(assert (=> b!1057800 m!977489))

(assert (=> b!1057800 m!977489))

(assert (=> b!1057800 m!977491))

(assert (=> b!1057801 m!977489))

(assert (=> b!1057801 m!977489))

(declare-fun m!977493 () Bool)

(assert (=> b!1057801 m!977493))

(assert (=> bm!44849 m!977489))

(declare-fun m!977495 () Bool)

(assert (=> bm!44849 m!977495))

(assert (=> b!1057706 d!128487))

(declare-fun d!128489 () Bool)

(declare-fun res!706441 () Bool)

(declare-fun e!601663 () Bool)

(assert (=> d!128489 (=> res!706441 e!601663)))

(assert (=> d!128489 (= res!706441 (= (select (arr!32078 a!3488) i!1381) k0!2747))))

(assert (=> d!128489 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601663)))

(declare-fun b!1057803 () Bool)

(declare-fun e!601664 () Bool)

(assert (=> b!1057803 (= e!601663 e!601664)))

(declare-fun res!706442 () Bool)

(assert (=> b!1057803 (=> (not res!706442) (not e!601664))))

(assert (=> b!1057803 (= res!706442 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32614 a!3488)))))

(declare-fun b!1057804 () Bool)

(assert (=> b!1057804 (= e!601664 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128489 (not res!706441)) b!1057803))

(assert (= (and b!1057803 res!706442) b!1057804))

(assert (=> d!128489 m!977387))

(declare-fun m!977499 () Bool)

(assert (=> b!1057804 m!977499))

(assert (=> b!1057711 d!128489))

(check-sat (not b!1057800) (not bm!44849) (not b!1057770) (not d!128465) (not b!1057748) (not b!1057797) (not b!1057793) (not bm!44848) (not b!1057804) (not b!1057772) (not b!1057799) (not b!1057792) (not d!128459) (not b!1057754) (not b!1057771) (not b!1057801))
(check-sat)
