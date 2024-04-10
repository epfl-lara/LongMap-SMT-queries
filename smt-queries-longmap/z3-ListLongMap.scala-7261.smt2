; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92720 () Bool)

(assert start!92720)

(declare-fun b!1053446 () Bool)

(declare-fun res!702466 () Bool)

(declare-fun e!598291 () Bool)

(assert (=> b!1053446 (=> (not res!702466) (not e!598291))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053446 (= res!702466 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053447 () Bool)

(declare-fun e!598287 () Bool)

(declare-fun e!598290 () Bool)

(assert (=> b!1053447 (= e!598287 (not e!598290))))

(declare-fun res!702467 () Bool)

(assert (=> b!1053447 (=> res!702467 e!598290)))

(declare-fun lt!465147 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053447 (= res!702467 (bvsle lt!465147 i!1381))))

(declare-datatypes ((array!66440 0))(
  ( (array!66441 (arr!31955 (Array (_ BitVec 32) (_ BitVec 64))) (size!32491 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66440)

(assert (=> b!1053447 (= (select (store (arr!31955 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465147) k0!2747)))

(declare-fun b!1053448 () Bool)

(declare-fun e!598288 () Bool)

(assert (=> b!1053448 (= e!598291 e!598288)))

(declare-fun res!702465 () Bool)

(assert (=> b!1053448 (=> (not res!702465) (not e!598288))))

(declare-fun lt!465146 () array!66440)

(declare-fun arrayContainsKey!0 (array!66440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053448 (= res!702465 (arrayContainsKey!0 lt!465146 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053448 (= lt!465146 (array!66441 (store (arr!31955 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32491 a!3488)))))

(declare-fun res!702470 () Bool)

(assert (=> start!92720 (=> (not res!702470) (not e!598291))))

(assert (=> start!92720 (= res!702470 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32491 a!3488)) (bvslt (size!32491 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92720 e!598291))

(assert (=> start!92720 true))

(declare-fun array_inv!24735 (array!66440) Bool)

(assert (=> start!92720 (array_inv!24735 a!3488)))

(declare-fun b!1053449 () Bool)

(assert (=> b!1053449 (= e!598290 (arrayContainsKey!0 a!3488 k0!2747 lt!465147))))

(declare-fun b!1053450 () Bool)

(declare-fun res!702468 () Bool)

(assert (=> b!1053450 (=> (not res!702468) (not e!598291))))

(assert (=> b!1053450 (= res!702468 (= (select (arr!31955 a!3488) i!1381) k0!2747))))

(declare-fun b!1053451 () Bool)

(assert (=> b!1053451 (= e!598288 e!598287)))

(declare-fun res!702464 () Bool)

(assert (=> b!1053451 (=> (not res!702464) (not e!598287))))

(assert (=> b!1053451 (= res!702464 (not (= lt!465147 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66440 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053451 (= lt!465147 (arrayScanForKey!0 lt!465146 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053452 () Bool)

(declare-fun res!702469 () Bool)

(assert (=> b!1053452 (=> (not res!702469) (not e!598291))))

(declare-datatypes ((List!22267 0))(
  ( (Nil!22264) (Cons!22263 (h!23472 (_ BitVec 64)) (t!31574 List!22267)) )
))
(declare-fun arrayNoDuplicates!0 (array!66440 (_ BitVec 32) List!22267) Bool)

(assert (=> b!1053452 (= res!702469 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22264))))

(assert (= (and start!92720 res!702470) b!1053452))

(assert (= (and b!1053452 res!702469) b!1053446))

(assert (= (and b!1053446 res!702466) b!1053450))

(assert (= (and b!1053450 res!702468) b!1053448))

(assert (= (and b!1053448 res!702465) b!1053451))

(assert (= (and b!1053451 res!702464) b!1053447))

(assert (= (and b!1053447 (not res!702467)) b!1053449))

(declare-fun m!973733 () Bool)

(assert (=> start!92720 m!973733))

(declare-fun m!973735 () Bool)

(assert (=> b!1053450 m!973735))

(declare-fun m!973737 () Bool)

(assert (=> b!1053451 m!973737))

(declare-fun m!973739 () Bool)

(assert (=> b!1053452 m!973739))

(declare-fun m!973741 () Bool)

(assert (=> b!1053449 m!973741))

(declare-fun m!973743 () Bool)

(assert (=> b!1053446 m!973743))

(declare-fun m!973745 () Bool)

(assert (=> b!1053448 m!973745))

(declare-fun m!973747 () Bool)

(assert (=> b!1053448 m!973747))

(assert (=> b!1053447 m!973747))

(declare-fun m!973749 () Bool)

(assert (=> b!1053447 m!973749))

(check-sat (not b!1053451) (not start!92720) (not b!1053452) (not b!1053448) (not b!1053449) (not b!1053446))
(check-sat)
(get-model)

(declare-fun d!127903 () Bool)

(assert (=> d!127903 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053446 d!127903))

(declare-fun d!127905 () Bool)

(declare-fun lt!465156 () (_ BitVec 32))

(assert (=> d!127905 (and (or (bvslt lt!465156 #b00000000000000000000000000000000) (bvsge lt!465156 (size!32491 lt!465146)) (and (bvsge lt!465156 #b00000000000000000000000000000000) (bvslt lt!465156 (size!32491 lt!465146)))) (bvsge lt!465156 #b00000000000000000000000000000000) (bvslt lt!465156 (size!32491 lt!465146)) (= (select (arr!31955 lt!465146) lt!465156) k0!2747))))

(declare-fun e!598309 () (_ BitVec 32))

(assert (=> d!127905 (= lt!465156 e!598309)))

(declare-fun c!106953 () Bool)

(assert (=> d!127905 (= c!106953 (= (select (arr!31955 lt!465146) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127905 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32491 lt!465146)) (bvslt (size!32491 lt!465146) #b01111111111111111111111111111111))))

(assert (=> d!127905 (= (arrayScanForKey!0 lt!465146 k0!2747 #b00000000000000000000000000000000) lt!465156)))

(declare-fun b!1053478 () Bool)

(assert (=> b!1053478 (= e!598309 #b00000000000000000000000000000000)))

(declare-fun b!1053479 () Bool)

(assert (=> b!1053479 (= e!598309 (arrayScanForKey!0 lt!465146 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127905 c!106953) b!1053478))

(assert (= (and d!127905 (not c!106953)) b!1053479))

(declare-fun m!973769 () Bool)

(assert (=> d!127905 m!973769))

(declare-fun m!973771 () Bool)

(assert (=> d!127905 m!973771))

(declare-fun m!973773 () Bool)

(assert (=> b!1053479 m!973773))

(assert (=> b!1053451 d!127905))

(declare-fun b!1053506 () Bool)

(declare-fun e!598334 () Bool)

(declare-fun contains!6168 (List!22267 (_ BitVec 64)) Bool)

(assert (=> b!1053506 (= e!598334 (contains!6168 Nil!22264 (select (arr!31955 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053507 () Bool)

(declare-fun e!598332 () Bool)

(declare-fun e!598333 () Bool)

(assert (=> b!1053507 (= e!598332 e!598333)))

(declare-fun res!702510 () Bool)

(assert (=> b!1053507 (=> (not res!702510) (not e!598333))))

(assert (=> b!1053507 (= res!702510 (not e!598334))))

(declare-fun res!702511 () Bool)

(assert (=> b!1053507 (=> (not res!702511) (not e!598334))))

(assert (=> b!1053507 (= res!702511 (validKeyInArray!0 (select (arr!31955 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053508 () Bool)

(declare-fun e!598335 () Bool)

(declare-fun call!44754 () Bool)

(assert (=> b!1053508 (= e!598335 call!44754)))

(declare-fun b!1053509 () Bool)

(assert (=> b!1053509 (= e!598335 call!44754)))

(declare-fun b!1053510 () Bool)

(assert (=> b!1053510 (= e!598333 e!598335)))

(declare-fun c!106958 () Bool)

(assert (=> b!1053510 (= c!106958 (validKeyInArray!0 (select (arr!31955 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44751 () Bool)

(assert (=> bm!44751 (= call!44754 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106958 (Cons!22263 (select (arr!31955 a!3488) #b00000000000000000000000000000000) Nil!22264) Nil!22264)))))

(declare-fun d!127909 () Bool)

(declare-fun res!702512 () Bool)

(assert (=> d!127909 (=> res!702512 e!598332)))

(assert (=> d!127909 (= res!702512 (bvsge #b00000000000000000000000000000000 (size!32491 a!3488)))))

(assert (=> d!127909 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22264) e!598332)))

(assert (= (and d!127909 (not res!702512)) b!1053507))

(assert (= (and b!1053507 res!702511) b!1053506))

(assert (= (and b!1053507 res!702510) b!1053510))

(assert (= (and b!1053510 c!106958) b!1053509))

(assert (= (and b!1053510 (not c!106958)) b!1053508))

(assert (= (or b!1053509 b!1053508) bm!44751))

(declare-fun m!973779 () Bool)

(assert (=> b!1053506 m!973779))

(assert (=> b!1053506 m!973779))

(declare-fun m!973781 () Bool)

(assert (=> b!1053506 m!973781))

(assert (=> b!1053507 m!973779))

(assert (=> b!1053507 m!973779))

(declare-fun m!973783 () Bool)

(assert (=> b!1053507 m!973783))

(assert (=> b!1053510 m!973779))

(assert (=> b!1053510 m!973779))

(assert (=> b!1053510 m!973783))

(assert (=> bm!44751 m!973779))

(declare-fun m!973785 () Bool)

(assert (=> bm!44751 m!973785))

(assert (=> b!1053452 d!127909))

(declare-fun d!127917 () Bool)

(declare-fun res!702522 () Bool)

(declare-fun e!598349 () Bool)

(assert (=> d!127917 (=> res!702522 e!598349)))

(assert (=> d!127917 (= res!702522 (= (select (arr!31955 lt!465146) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127917 (= (arrayContainsKey!0 lt!465146 k0!2747 #b00000000000000000000000000000000) e!598349)))

(declare-fun b!1053528 () Bool)

(declare-fun e!598350 () Bool)

(assert (=> b!1053528 (= e!598349 e!598350)))

(declare-fun res!702523 () Bool)

(assert (=> b!1053528 (=> (not res!702523) (not e!598350))))

(assert (=> b!1053528 (= res!702523 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32491 lt!465146)))))

(declare-fun b!1053529 () Bool)

(assert (=> b!1053529 (= e!598350 (arrayContainsKey!0 lt!465146 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127917 (not res!702522)) b!1053528))

(assert (= (and b!1053528 res!702523) b!1053529))

(assert (=> d!127917 m!973771))

(declare-fun m!973805 () Bool)

(assert (=> b!1053529 m!973805))

(assert (=> b!1053448 d!127917))

(declare-fun d!127925 () Bool)

(assert (=> d!127925 (= (array_inv!24735 a!3488) (bvsge (size!32491 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92720 d!127925))

(declare-fun d!127929 () Bool)

(declare-fun res!702528 () Bool)

(declare-fun e!598355 () Bool)

(assert (=> d!127929 (=> res!702528 e!598355)))

(assert (=> d!127929 (= res!702528 (= (select (arr!31955 a!3488) lt!465147) k0!2747))))

(assert (=> d!127929 (= (arrayContainsKey!0 a!3488 k0!2747 lt!465147) e!598355)))

(declare-fun b!1053534 () Bool)

(declare-fun e!598356 () Bool)

(assert (=> b!1053534 (= e!598355 e!598356)))

(declare-fun res!702529 () Bool)

(assert (=> b!1053534 (=> (not res!702529) (not e!598356))))

(assert (=> b!1053534 (= res!702529 (bvslt (bvadd lt!465147 #b00000000000000000000000000000001) (size!32491 a!3488)))))

(declare-fun b!1053535 () Bool)

(assert (=> b!1053535 (= e!598356 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!465147 #b00000000000000000000000000000001)))))

(assert (= (and d!127929 (not res!702528)) b!1053534))

(assert (= (and b!1053534 res!702529) b!1053535))

(declare-fun m!973807 () Bool)

(assert (=> d!127929 m!973807))

(declare-fun m!973809 () Bool)

(assert (=> b!1053535 m!973809))

(assert (=> b!1053449 d!127929))

(check-sat (not bm!44751) (not b!1053479) (not b!1053507) (not b!1053506) (not b!1053535) (not b!1053510) (not b!1053529))
(check-sat)
