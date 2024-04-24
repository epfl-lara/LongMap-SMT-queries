; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92916 () Bool)

(assert start!92916)

(declare-fun b!1054610 () Bool)

(declare-fun e!599023 () Bool)

(declare-fun e!599022 () Bool)

(assert (=> b!1054610 (= e!599023 e!599022)))

(declare-fun res!702861 () Bool)

(assert (=> b!1054610 (=> (not res!702861) (not e!599022))))

(declare-datatypes ((array!66478 0))(
  ( (array!66479 (arr!31969 (Array (_ BitVec 32) (_ BitVec 64))) (size!32506 (_ BitVec 32))) )
))
(declare-fun lt!465629 () array!66478)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054610 (= res!702861 (arrayContainsKey!0 lt!465629 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66478)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054610 (= lt!465629 (array!66479 (store (arr!31969 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32506 a!3488)))))

(declare-fun lt!465628 () (_ BitVec 32))

(declare-fun b!1054611 () Bool)

(assert (=> b!1054611 (= e!599022 (and (not (= lt!465628 i!1381)) (not (= (select (store (arr!31969 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465628) k0!2747))))))

(declare-fun arrayScanForKey!0 (array!66478 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054611 (= lt!465628 (arrayScanForKey!0 lt!465629 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054612 () Bool)

(declare-fun res!702859 () Bool)

(assert (=> b!1054612 (=> (not res!702859) (not e!599023))))

(assert (=> b!1054612 (= res!702859 (= (select (arr!31969 a!3488) i!1381) k0!2747))))

(declare-fun b!1054614 () Bool)

(declare-fun res!702860 () Bool)

(assert (=> b!1054614 (=> (not res!702860) (not e!599023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054614 (= res!702860 (validKeyInArray!0 k0!2747))))

(declare-fun res!702862 () Bool)

(assert (=> start!92916 (=> (not res!702862) (not e!599023))))

(assert (=> start!92916 (= res!702862 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32506 a!3488)) (bvslt (size!32506 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92916 e!599023))

(assert (=> start!92916 true))

(declare-fun array_inv!24751 (array!66478) Bool)

(assert (=> start!92916 (array_inv!24751 a!3488)))

(declare-fun b!1054613 () Bool)

(declare-fun res!702863 () Bool)

(assert (=> b!1054613 (=> (not res!702863) (not e!599023))))

(declare-datatypes ((List!22251 0))(
  ( (Nil!22248) (Cons!22247 (h!23465 (_ BitVec 64)) (t!31550 List!22251)) )
))
(declare-fun arrayNoDuplicates!0 (array!66478 (_ BitVec 32) List!22251) Bool)

(assert (=> b!1054613 (= res!702863 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22248))))

(assert (= (and start!92916 res!702862) b!1054613))

(assert (= (and b!1054613 res!702863) b!1054614))

(assert (= (and b!1054614 res!702860) b!1054612))

(assert (= (and b!1054612 res!702859) b!1054610))

(assert (= (and b!1054610 res!702861) b!1054611))

(declare-fun m!975287 () Bool)

(assert (=> b!1054612 m!975287))

(declare-fun m!975289 () Bool)

(assert (=> b!1054611 m!975289))

(declare-fun m!975291 () Bool)

(assert (=> b!1054611 m!975291))

(declare-fun m!975293 () Bool)

(assert (=> b!1054611 m!975293))

(declare-fun m!975295 () Bool)

(assert (=> start!92916 m!975295))

(declare-fun m!975297 () Bool)

(assert (=> b!1054614 m!975297))

(declare-fun m!975299 () Bool)

(assert (=> b!1054613 m!975299))

(declare-fun m!975301 () Bool)

(assert (=> b!1054610 m!975301))

(assert (=> b!1054610 m!975289))

(check-sat (not b!1054614) (not start!92916) (not b!1054613) (not b!1054611) (not b!1054610))
(check-sat)
(get-model)

(declare-fun d!128333 () Bool)

(assert (=> d!128333 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1054614 d!128333))

(declare-fun b!1054661 () Bool)

(declare-fun e!599058 () Bool)

(declare-fun e!599056 () Bool)

(assert (=> b!1054661 (= e!599058 e!599056)))

(declare-fun c!107345 () Bool)

(assert (=> b!1054661 (= c!107345 (validKeyInArray!0 (select (arr!31969 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128335 () Bool)

(declare-fun res!702908 () Bool)

(declare-fun e!599059 () Bool)

(assert (=> d!128335 (=> res!702908 e!599059)))

(assert (=> d!128335 (= res!702908 (bvsge #b00000000000000000000000000000000 (size!32506 a!3488)))))

(assert (=> d!128335 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22248) e!599059)))

(declare-fun bm!44807 () Bool)

(declare-fun call!44810 () Bool)

(assert (=> bm!44807 (= call!44810 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107345 (Cons!22247 (select (arr!31969 a!3488) #b00000000000000000000000000000000) Nil!22248) Nil!22248)))))

(declare-fun b!1054662 () Bool)

(declare-fun e!599057 () Bool)

(declare-fun contains!6191 (List!22251 (_ BitVec 64)) Bool)

(assert (=> b!1054662 (= e!599057 (contains!6191 Nil!22248 (select (arr!31969 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1054663 () Bool)

(assert (=> b!1054663 (= e!599056 call!44810)))

(declare-fun b!1054664 () Bool)

(assert (=> b!1054664 (= e!599056 call!44810)))

(declare-fun b!1054665 () Bool)

(assert (=> b!1054665 (= e!599059 e!599058)))

(declare-fun res!702906 () Bool)

(assert (=> b!1054665 (=> (not res!702906) (not e!599058))))

(assert (=> b!1054665 (= res!702906 (not e!599057))))

(declare-fun res!702907 () Bool)

(assert (=> b!1054665 (=> (not res!702907) (not e!599057))))

(assert (=> b!1054665 (= res!702907 (validKeyInArray!0 (select (arr!31969 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128335 (not res!702908)) b!1054665))

(assert (= (and b!1054665 res!702907) b!1054662))

(assert (= (and b!1054665 res!702906) b!1054661))

(assert (= (and b!1054661 c!107345) b!1054664))

(assert (= (and b!1054661 (not c!107345)) b!1054663))

(assert (= (or b!1054664 b!1054663) bm!44807))

(declare-fun m!975339 () Bool)

(assert (=> b!1054661 m!975339))

(assert (=> b!1054661 m!975339))

(declare-fun m!975341 () Bool)

(assert (=> b!1054661 m!975341))

(assert (=> bm!44807 m!975339))

(declare-fun m!975343 () Bool)

(assert (=> bm!44807 m!975343))

(assert (=> b!1054662 m!975339))

(assert (=> b!1054662 m!975339))

(declare-fun m!975345 () Bool)

(assert (=> b!1054662 m!975345))

(assert (=> b!1054665 m!975339))

(assert (=> b!1054665 m!975339))

(assert (=> b!1054665 m!975341))

(assert (=> b!1054613 d!128335))

(declare-fun d!128345 () Bool)

(assert (=> d!128345 (= (array_inv!24751 a!3488) (bvsge (size!32506 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92916 d!128345))

(declare-fun d!128349 () Bool)

(declare-fun lt!465649 () (_ BitVec 32))

(assert (=> d!128349 (and (or (bvslt lt!465649 #b00000000000000000000000000000000) (bvsge lt!465649 (size!32506 lt!465629)) (and (bvsge lt!465649 #b00000000000000000000000000000000) (bvslt lt!465649 (size!32506 lt!465629)))) (bvsge lt!465649 #b00000000000000000000000000000000) (bvslt lt!465649 (size!32506 lt!465629)) (= (select (arr!31969 lt!465629) lt!465649) k0!2747))))

(declare-fun e!599075 () (_ BitVec 32))

(assert (=> d!128349 (= lt!465649 e!599075)))

(declare-fun c!107355 () Bool)

(assert (=> d!128349 (= c!107355 (= (select (arr!31969 lt!465629) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128349 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32506 lt!465629)) (bvslt (size!32506 lt!465629) #b01111111111111111111111111111111))))

(assert (=> d!128349 (= (arrayScanForKey!0 lt!465629 k0!2747 #b00000000000000000000000000000000) lt!465649)))

(declare-fun b!1054690 () Bool)

(assert (=> b!1054690 (= e!599075 #b00000000000000000000000000000000)))

(declare-fun b!1054691 () Bool)

(assert (=> b!1054691 (= e!599075 (arrayScanForKey!0 lt!465629 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128349 c!107355) b!1054690))

(assert (= (and d!128349 (not c!107355)) b!1054691))

(declare-fun m!975353 () Bool)

(assert (=> d!128349 m!975353))

(declare-fun m!975357 () Bool)

(assert (=> d!128349 m!975357))

(declare-fun m!975359 () Bool)

(assert (=> b!1054691 m!975359))

(assert (=> b!1054611 d!128349))

(declare-fun d!128353 () Bool)

(declare-fun res!702922 () Bool)

(declare-fun e!599085 () Bool)

(assert (=> d!128353 (=> res!702922 e!599085)))

(assert (=> d!128353 (= res!702922 (= (select (arr!31969 lt!465629) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128353 (= (arrayContainsKey!0 lt!465629 k0!2747 #b00000000000000000000000000000000) e!599085)))

(declare-fun b!1054703 () Bool)

(declare-fun e!599086 () Bool)

(assert (=> b!1054703 (= e!599085 e!599086)))

(declare-fun res!702923 () Bool)

(assert (=> b!1054703 (=> (not res!702923) (not e!599086))))

(assert (=> b!1054703 (= res!702923 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32506 lt!465629)))))

(declare-fun b!1054704 () Bool)

(assert (=> b!1054704 (= e!599086 (arrayContainsKey!0 lt!465629 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128353 (not res!702922)) b!1054703))

(assert (= (and b!1054703 res!702923) b!1054704))

(assert (=> d!128353 m!975357))

(declare-fun m!975371 () Bool)

(assert (=> b!1054704 m!975371))

(assert (=> b!1054610 d!128353))

(check-sat (not b!1054662) (not b!1054704) (not bm!44807) (not b!1054691) (not b!1054665) (not b!1054661))
(check-sat)
