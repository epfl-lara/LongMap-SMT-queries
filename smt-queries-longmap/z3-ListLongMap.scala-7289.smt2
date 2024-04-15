; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93124 () Bool)

(assert start!93124)

(declare-fun b!1056186 () Bool)

(declare-fun e!600429 () Bool)

(declare-fun e!600425 () Bool)

(assert (=> b!1056186 (= e!600429 e!600425)))

(declare-fun res!705055 () Bool)

(assert (=> b!1056186 (=> (not res!705055) (not e!600425))))

(declare-fun lt!465888 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056186 (= res!705055 (not (= lt!465888 i!1381)))))

(declare-datatypes ((array!66563 0))(
  ( (array!66564 (arr!32007 (Array (_ BitVec 32) (_ BitVec 64))) (size!32545 (_ BitVec 32))) )
))
(declare-fun lt!465889 () array!66563)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66563 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056186 (= lt!465888 (arrayScanForKey!0 lt!465889 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056187 () Bool)

(declare-fun e!600427 () Bool)

(declare-fun e!600428 () Bool)

(assert (=> b!1056187 (= e!600427 e!600428)))

(declare-fun res!705053 () Bool)

(assert (=> b!1056187 (=> res!705053 e!600428)))

(assert (=> b!1056187 (= res!705053 (or (bvsgt lt!465888 i!1381) (bvsle i!1381 lt!465888)))))

(declare-fun b!1056188 () Bool)

(declare-fun a!3488 () array!66563)

(assert (=> b!1056188 (= e!600425 (not (or (bvsgt lt!465888 i!1381) (bvsle i!1381 lt!465888) (bvsgt #b00000000000000000000000000000000 (size!32545 a!3488)) (and (bvsge lt!465888 #b00000000000000000000000000000000) (bvsle lt!465888 (size!32545 a!3488))))))))

(assert (=> b!1056188 e!600427))

(declare-fun res!705048 () Bool)

(assert (=> b!1056188 (=> (not res!705048) (not e!600427))))

(assert (=> b!1056188 (= res!705048 (= (select (store (arr!32007 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465888) k0!2747))))

(declare-fun b!1056189 () Bool)

(declare-fun res!705051 () Bool)

(declare-fun e!600426 () Bool)

(assert (=> b!1056189 (=> (not res!705051) (not e!600426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056189 (= res!705051 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056190 () Bool)

(declare-fun res!705052 () Bool)

(assert (=> b!1056190 (=> (not res!705052) (not e!600426))))

(assert (=> b!1056190 (= res!705052 (= (select (arr!32007 a!3488) i!1381) k0!2747))))

(declare-fun b!1056191 () Bool)

(declare-fun res!705049 () Bool)

(assert (=> b!1056191 (=> (not res!705049) (not e!600426))))

(declare-datatypes ((List!22378 0))(
  ( (Nil!22375) (Cons!22374 (h!23583 (_ BitVec 64)) (t!31676 List!22378)) )
))
(declare-fun arrayNoDuplicates!0 (array!66563 (_ BitVec 32) List!22378) Bool)

(assert (=> b!1056191 (= res!705049 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22375))))

(declare-fun b!1056192 () Bool)

(declare-fun arrayContainsKey!0 (array!66563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056192 (= e!600428 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056193 () Bool)

(assert (=> b!1056193 (= e!600426 e!600429)))

(declare-fun res!705054 () Bool)

(assert (=> b!1056193 (=> (not res!705054) (not e!600429))))

(assert (=> b!1056193 (= res!705054 (arrayContainsKey!0 lt!465889 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056193 (= lt!465889 (array!66564 (store (arr!32007 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32545 a!3488)))))

(declare-fun res!705050 () Bool)

(assert (=> start!93124 (=> (not res!705050) (not e!600426))))

(assert (=> start!93124 (= res!705050 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32545 a!3488)) (bvslt (size!32545 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93124 e!600426))

(assert (=> start!93124 true))

(declare-fun array_inv!24790 (array!66563) Bool)

(assert (=> start!93124 (array_inv!24790 a!3488)))

(assert (= (and start!93124 res!705050) b!1056191))

(assert (= (and b!1056191 res!705049) b!1056189))

(assert (= (and b!1056189 res!705051) b!1056190))

(assert (= (and b!1056190 res!705052) b!1056193))

(assert (= (and b!1056193 res!705054) b!1056186))

(assert (= (and b!1056186 res!705055) b!1056188))

(assert (= (and b!1056188 res!705048) b!1056187))

(assert (= (and b!1056187 (not res!705053)) b!1056192))

(declare-fun m!975599 () Bool)

(assert (=> b!1056186 m!975599))

(declare-fun m!975601 () Bool)

(assert (=> b!1056191 m!975601))

(declare-fun m!975603 () Bool)

(assert (=> b!1056193 m!975603))

(declare-fun m!975605 () Bool)

(assert (=> b!1056193 m!975605))

(assert (=> b!1056188 m!975605))

(declare-fun m!975607 () Bool)

(assert (=> b!1056188 m!975607))

(declare-fun m!975609 () Bool)

(assert (=> b!1056190 m!975609))

(declare-fun m!975611 () Bool)

(assert (=> b!1056189 m!975611))

(declare-fun m!975613 () Bool)

(assert (=> start!93124 m!975613))

(declare-fun m!975615 () Bool)

(assert (=> b!1056192 m!975615))

(check-sat (not b!1056189) (not b!1056191) (not start!93124) (not b!1056192) (not b!1056193) (not b!1056186))
(check-sat)
(get-model)

(declare-fun d!128133 () Bool)

(assert (=> d!128133 (= (array_inv!24790 a!3488) (bvsge (size!32545 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93124 d!128133))

(declare-fun d!128135 () Bool)

(assert (=> d!128135 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056189 d!128135))

(declare-fun d!128137 () Bool)

(declare-fun res!705108 () Bool)

(declare-fun e!600470 () Bool)

(assert (=> d!128137 (=> res!705108 e!600470)))

(assert (=> d!128137 (= res!705108 (= (select (arr!32007 lt!465889) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128137 (= (arrayContainsKey!0 lt!465889 k0!2747 #b00000000000000000000000000000000) e!600470)))

(declare-fun b!1056246 () Bool)

(declare-fun e!600471 () Bool)

(assert (=> b!1056246 (= e!600470 e!600471)))

(declare-fun res!705109 () Bool)

(assert (=> b!1056246 (=> (not res!705109) (not e!600471))))

(assert (=> b!1056246 (= res!705109 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32545 lt!465889)))))

(declare-fun b!1056247 () Bool)

(assert (=> b!1056247 (= e!600471 (arrayContainsKey!0 lt!465889 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128137 (not res!705108)) b!1056246))

(assert (= (and b!1056246 res!705109) b!1056247))

(declare-fun m!975653 () Bool)

(assert (=> d!128137 m!975653))

(declare-fun m!975655 () Bool)

(assert (=> b!1056247 m!975655))

(assert (=> b!1056193 d!128137))

(declare-fun b!1056258 () Bool)

(declare-fun e!600483 () Bool)

(declare-fun call!44795 () Bool)

(assert (=> b!1056258 (= e!600483 call!44795)))

(declare-fun d!128139 () Bool)

(declare-fun res!705117 () Bool)

(declare-fun e!600482 () Bool)

(assert (=> d!128139 (=> res!705117 e!600482)))

(assert (=> d!128139 (= res!705117 (bvsge #b00000000000000000000000000000000 (size!32545 a!3488)))))

(assert (=> d!128139 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22375) e!600482)))

(declare-fun bm!44792 () Bool)

(declare-fun c!107034 () Bool)

(assert (=> bm!44792 (= call!44795 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107034 (Cons!22374 (select (arr!32007 a!3488) #b00000000000000000000000000000000) Nil!22375) Nil!22375)))))

(declare-fun b!1056259 () Bool)

(declare-fun e!600481 () Bool)

(declare-fun contains!6161 (List!22378 (_ BitVec 64)) Bool)

(assert (=> b!1056259 (= e!600481 (contains!6161 Nil!22375 (select (arr!32007 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056260 () Bool)

(assert (=> b!1056260 (= e!600483 call!44795)))

(declare-fun b!1056261 () Bool)

(declare-fun e!600480 () Bool)

(assert (=> b!1056261 (= e!600480 e!600483)))

(assert (=> b!1056261 (= c!107034 (validKeyInArray!0 (select (arr!32007 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056262 () Bool)

(assert (=> b!1056262 (= e!600482 e!600480)))

(declare-fun res!705116 () Bool)

(assert (=> b!1056262 (=> (not res!705116) (not e!600480))))

(assert (=> b!1056262 (= res!705116 (not e!600481))))

(declare-fun res!705118 () Bool)

(assert (=> b!1056262 (=> (not res!705118) (not e!600481))))

(assert (=> b!1056262 (= res!705118 (validKeyInArray!0 (select (arr!32007 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128139 (not res!705117)) b!1056262))

(assert (= (and b!1056262 res!705118) b!1056259))

(assert (= (and b!1056262 res!705116) b!1056261))

(assert (= (and b!1056261 c!107034) b!1056258))

(assert (= (and b!1056261 (not c!107034)) b!1056260))

(assert (= (or b!1056258 b!1056260) bm!44792))

(declare-fun m!975657 () Bool)

(assert (=> bm!44792 m!975657))

(declare-fun m!975659 () Bool)

(assert (=> bm!44792 m!975659))

(assert (=> b!1056259 m!975657))

(assert (=> b!1056259 m!975657))

(declare-fun m!975661 () Bool)

(assert (=> b!1056259 m!975661))

(assert (=> b!1056261 m!975657))

(assert (=> b!1056261 m!975657))

(declare-fun m!975663 () Bool)

(assert (=> b!1056261 m!975663))

(assert (=> b!1056262 m!975657))

(assert (=> b!1056262 m!975657))

(assert (=> b!1056262 m!975663))

(assert (=> b!1056191 d!128139))

(declare-fun d!128141 () Bool)

(declare-fun lt!465904 () (_ BitVec 32))

(assert (=> d!128141 (and (or (bvslt lt!465904 #b00000000000000000000000000000000) (bvsge lt!465904 (size!32545 lt!465889)) (and (bvsge lt!465904 #b00000000000000000000000000000000) (bvslt lt!465904 (size!32545 lt!465889)))) (bvsge lt!465904 #b00000000000000000000000000000000) (bvslt lt!465904 (size!32545 lt!465889)) (= (select (arr!32007 lt!465889) lt!465904) k0!2747))))

(declare-fun e!600494 () (_ BitVec 32))

(assert (=> d!128141 (= lt!465904 e!600494)))

(declare-fun c!107037 () Bool)

(assert (=> d!128141 (= c!107037 (= (select (arr!32007 lt!465889) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128141 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32545 lt!465889)) (bvslt (size!32545 lt!465889) #b01111111111111111111111111111111))))

(assert (=> d!128141 (= (arrayScanForKey!0 lt!465889 k0!2747 #b00000000000000000000000000000000) lt!465904)))

(declare-fun b!1056275 () Bool)

(assert (=> b!1056275 (= e!600494 #b00000000000000000000000000000000)))

(declare-fun b!1056276 () Bool)

(assert (=> b!1056276 (= e!600494 (arrayScanForKey!0 lt!465889 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128141 c!107037) b!1056275))

(assert (= (and d!128141 (not c!107037)) b!1056276))

(declare-fun m!975671 () Bool)

(assert (=> d!128141 m!975671))

(assert (=> d!128141 m!975653))

(declare-fun m!975673 () Bool)

(assert (=> b!1056276 m!975673))

(assert (=> b!1056186 d!128141))

(declare-fun d!128151 () Bool)

(declare-fun res!705127 () Bool)

(declare-fun e!600495 () Bool)

(assert (=> d!128151 (=> res!705127 e!600495)))

(assert (=> d!128151 (= res!705127 (= (select (arr!32007 a!3488) i!1381) k0!2747))))

(assert (=> d!128151 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!600495)))

(declare-fun b!1056277 () Bool)

(declare-fun e!600496 () Bool)

(assert (=> b!1056277 (= e!600495 e!600496)))

(declare-fun res!705128 () Bool)

(assert (=> b!1056277 (=> (not res!705128) (not e!600496))))

(assert (=> b!1056277 (= res!705128 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32545 a!3488)))))

(declare-fun b!1056278 () Bool)

(assert (=> b!1056278 (= e!600496 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128151 (not res!705127)) b!1056277))

(assert (= (and b!1056277 res!705128) b!1056278))

(assert (=> d!128151 m!975609))

(declare-fun m!975675 () Bool)

(assert (=> b!1056278 m!975675))

(assert (=> b!1056192 d!128151))

(check-sat (not bm!44792) (not b!1056276) (not b!1056261) (not b!1056262) (not b!1056278) (not b!1056247) (not b!1056259))
(check-sat)
