; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92216 () Bool)

(assert start!92216)

(declare-fun b!1048293 () Bool)

(declare-fun e!594557 () Bool)

(declare-fun e!594556 () Bool)

(assert (=> b!1048293 (= e!594557 e!594556)))

(declare-fun res!697458 () Bool)

(assert (=> b!1048293 (=> (not res!697458) (not e!594556))))

(declare-fun lt!463167 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048293 (= res!697458 (not (= lt!463167 i!1381)))))

(declare-datatypes ((array!66044 0))(
  ( (array!66045 (arr!31763 (Array (_ BitVec 32) (_ BitVec 64))) (size!32299 (_ BitVec 32))) )
))
(declare-fun lt!463166 () array!66044)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66044 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048293 (= lt!463167 (arrayScanForKey!0 lt!463166 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048294 () Bool)

(declare-fun res!697456 () Bool)

(declare-fun e!594559 () Bool)

(assert (=> b!1048294 (=> (not res!697456) (not e!594559))))

(declare-fun a!3488 () array!66044)

(assert (=> b!1048294 (= res!697456 (= (select (arr!31763 a!3488) i!1381) k0!2747))))

(declare-fun b!1048295 () Bool)

(assert (=> b!1048295 (= e!594556 (not (or (bvsle lt!463167 i!1381) (bvslt lt!463167 #b00000000000000000000000000000000) (bvslt lt!463167 (size!32299 a!3488)))))))

(assert (=> b!1048295 (= (select (store (arr!31763 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463167) k0!2747)))

(declare-fun b!1048296 () Bool)

(declare-fun res!697457 () Bool)

(assert (=> b!1048296 (=> (not res!697457) (not e!594559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048296 (= res!697457 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048297 () Bool)

(declare-fun res!697460 () Bool)

(assert (=> b!1048297 (=> (not res!697460) (not e!594559))))

(declare-datatypes ((List!22075 0))(
  ( (Nil!22072) (Cons!22071 (h!23280 (_ BitVec 64)) (t!31382 List!22075)) )
))
(declare-fun arrayNoDuplicates!0 (array!66044 (_ BitVec 32) List!22075) Bool)

(assert (=> b!1048297 (= res!697460 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22072))))

(declare-fun res!697459 () Bool)

(assert (=> start!92216 (=> (not res!697459) (not e!594559))))

(assert (=> start!92216 (= res!697459 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32299 a!3488)) (bvslt (size!32299 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92216 e!594559))

(assert (=> start!92216 true))

(declare-fun array_inv!24543 (array!66044) Bool)

(assert (=> start!92216 (array_inv!24543 a!3488)))

(declare-fun b!1048298 () Bool)

(assert (=> b!1048298 (= e!594559 e!594557)))

(declare-fun res!697455 () Bool)

(assert (=> b!1048298 (=> (not res!697455) (not e!594557))))

(declare-fun arrayContainsKey!0 (array!66044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048298 (= res!697455 (arrayContainsKey!0 lt!463166 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048298 (= lt!463166 (array!66045 (store (arr!31763 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32299 a!3488)))))

(assert (= (and start!92216 res!697459) b!1048297))

(assert (= (and b!1048297 res!697460) b!1048296))

(assert (= (and b!1048296 res!697457) b!1048294))

(assert (= (and b!1048294 res!697456) b!1048298))

(assert (= (and b!1048298 res!697455) b!1048293))

(assert (= (and b!1048293 res!697458) b!1048295))

(declare-fun m!969303 () Bool)

(assert (=> b!1048298 m!969303))

(declare-fun m!969305 () Bool)

(assert (=> b!1048298 m!969305))

(declare-fun m!969307 () Bool)

(assert (=> b!1048293 m!969307))

(assert (=> b!1048295 m!969305))

(declare-fun m!969309 () Bool)

(assert (=> b!1048295 m!969309))

(declare-fun m!969311 () Bool)

(assert (=> b!1048296 m!969311))

(declare-fun m!969313 () Bool)

(assert (=> start!92216 m!969313))

(declare-fun m!969315 () Bool)

(assert (=> b!1048297 m!969315))

(declare-fun m!969317 () Bool)

(assert (=> b!1048294 m!969317))

(check-sat (not b!1048293) (not b!1048297) (not b!1048298) (not start!92216) (not b!1048296))
(check-sat)
(get-model)

(declare-fun d!127655 () Bool)

(assert (=> d!127655 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1048296 d!127655))

(declare-fun b!1048328 () Bool)

(declare-fun e!594582 () Bool)

(declare-fun call!44716 () Bool)

(assert (=> b!1048328 (= e!594582 call!44716)))

(declare-fun b!1048329 () Bool)

(declare-fun e!594580 () Bool)

(declare-fun e!594581 () Bool)

(assert (=> b!1048329 (= e!594580 e!594581)))

(declare-fun res!697486 () Bool)

(assert (=> b!1048329 (=> (not res!697486) (not e!594581))))

(declare-fun e!594583 () Bool)

(assert (=> b!1048329 (= res!697486 (not e!594583))))

(declare-fun res!697487 () Bool)

(assert (=> b!1048329 (=> (not res!697487) (not e!594583))))

(assert (=> b!1048329 (= res!697487 (validKeyInArray!0 (select (arr!31763 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048330 () Bool)

(assert (=> b!1048330 (= e!594581 e!594582)))

(declare-fun c!106881 () Bool)

(assert (=> b!1048330 (= c!106881 (validKeyInArray!0 (select (arr!31763 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1048331 () Bool)

(assert (=> b!1048331 (= e!594582 call!44716)))

(declare-fun bm!44713 () Bool)

(assert (=> bm!44713 (= call!44716 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106881 (Cons!22071 (select (arr!31763 a!3488) #b00000000000000000000000000000000) Nil!22072) Nil!22072)))))

(declare-fun b!1048327 () Bool)

(declare-fun contains!6103 (List!22075 (_ BitVec 64)) Bool)

(assert (=> b!1048327 (= e!594583 (contains!6103 Nil!22072 (select (arr!31763 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127657 () Bool)

(declare-fun res!697485 () Bool)

(assert (=> d!127657 (=> res!697485 e!594580)))

(assert (=> d!127657 (= res!697485 (bvsge #b00000000000000000000000000000000 (size!32299 a!3488)))))

(assert (=> d!127657 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22072) e!594580)))

(assert (= (and d!127657 (not res!697485)) b!1048329))

(assert (= (and b!1048329 res!697487) b!1048327))

(assert (= (and b!1048329 res!697486) b!1048330))

(assert (= (and b!1048330 c!106881) b!1048328))

(assert (= (and b!1048330 (not c!106881)) b!1048331))

(assert (= (or b!1048328 b!1048331) bm!44713))

(declare-fun m!969335 () Bool)

(assert (=> b!1048329 m!969335))

(assert (=> b!1048329 m!969335))

(declare-fun m!969337 () Bool)

(assert (=> b!1048329 m!969337))

(assert (=> b!1048330 m!969335))

(assert (=> b!1048330 m!969335))

(assert (=> b!1048330 m!969337))

(assert (=> bm!44713 m!969335))

(declare-fun m!969339 () Bool)

(assert (=> bm!44713 m!969339))

(assert (=> b!1048327 m!969335))

(assert (=> b!1048327 m!969335))

(declare-fun m!969341 () Bool)

(assert (=> b!1048327 m!969341))

(assert (=> b!1048297 d!127657))

(declare-fun d!127661 () Bool)

(assert (=> d!127661 (= (array_inv!24543 a!3488) (bvsge (size!32299 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92216 d!127661))

(declare-fun d!127663 () Bool)

(declare-fun lt!463176 () (_ BitVec 32))

(assert (=> d!127663 (and (or (bvslt lt!463176 #b00000000000000000000000000000000) (bvsge lt!463176 (size!32299 lt!463166)) (and (bvsge lt!463176 #b00000000000000000000000000000000) (bvslt lt!463176 (size!32299 lt!463166)))) (bvsge lt!463176 #b00000000000000000000000000000000) (bvslt lt!463176 (size!32299 lt!463166)) (= (select (arr!31763 lt!463166) lt!463176) k0!2747))))

(declare-fun e!594600 () (_ BitVec 32))

(assert (=> d!127663 (= lt!463176 e!594600)))

(declare-fun c!106886 () Bool)

(assert (=> d!127663 (= c!106886 (= (select (arr!31763 lt!463166) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127663 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32299 lt!463166)) (bvslt (size!32299 lt!463166) #b01111111111111111111111111111111))))

(assert (=> d!127663 (= (arrayScanForKey!0 lt!463166 k0!2747 #b00000000000000000000000000000000) lt!463176)))

(declare-fun b!1048352 () Bool)

(assert (=> b!1048352 (= e!594600 #b00000000000000000000000000000000)))

(declare-fun b!1048353 () Bool)

(assert (=> b!1048353 (= e!594600 (arrayScanForKey!0 lt!463166 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127663 c!106886) b!1048352))

(assert (= (and d!127663 (not c!106886)) b!1048353))

(declare-fun m!969347 () Bool)

(assert (=> d!127663 m!969347))

(declare-fun m!969349 () Bool)

(assert (=> d!127663 m!969349))

(declare-fun m!969351 () Bool)

(assert (=> b!1048353 m!969351))

(assert (=> b!1048293 d!127663))

(declare-fun d!127675 () Bool)

(declare-fun res!697513 () Bool)

(declare-fun e!594617 () Bool)

(assert (=> d!127675 (=> res!697513 e!594617)))

(assert (=> d!127675 (= res!697513 (= (select (arr!31763 lt!463166) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127675 (= (arrayContainsKey!0 lt!463166 k0!2747 #b00000000000000000000000000000000) e!594617)))

(declare-fun b!1048373 () Bool)

(declare-fun e!594618 () Bool)

(assert (=> b!1048373 (= e!594617 e!594618)))

(declare-fun res!697514 () Bool)

(assert (=> b!1048373 (=> (not res!697514) (not e!594618))))

(assert (=> b!1048373 (= res!697514 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32299 lt!463166)))))

(declare-fun b!1048374 () Bool)

(assert (=> b!1048374 (= e!594618 (arrayContainsKey!0 lt!463166 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127675 (not res!697513)) b!1048373))

(assert (= (and b!1048373 res!697514) b!1048374))

(assert (=> d!127675 m!969349))

(declare-fun m!969361 () Bool)

(assert (=> b!1048374 m!969361))

(assert (=> b!1048298 d!127675))

(check-sat (not b!1048353) (not b!1048327) (not b!1048330) (not b!1048374) (not b!1048329) (not bm!44713))
(check-sat)
