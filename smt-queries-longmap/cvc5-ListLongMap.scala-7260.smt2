; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92682 () Bool)

(assert start!92682)

(declare-fun b!1053295 () Bool)

(declare-fun e!598178 () Bool)

(declare-fun e!598179 () Bool)

(assert (=> b!1053295 (= e!598178 e!598179)))

(declare-fun res!702351 () Bool)

(assert (=> b!1053295 (=> (not res!702351) (not e!598179))))

(declare-datatypes ((array!66429 0))(
  ( (array!66430 (arr!31951 (Array (_ BitVec 32) (_ BitVec 64))) (size!32487 (_ BitVec 32))) )
))
(declare-fun lt!465114 () array!66429)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053295 (= res!702351 (arrayContainsKey!0 lt!465114 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66429)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053295 (= lt!465114 (array!66430 (store (arr!31951 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32487 a!3488)))))

(declare-fun b!1053296 () Bool)

(declare-fun res!702350 () Bool)

(assert (=> b!1053296 (=> (not res!702350) (not e!598178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053296 (= res!702350 (validKeyInArray!0 k!2747))))

(declare-fun b!1053297 () Bool)

(declare-fun lt!465113 () (_ BitVec 32))

(assert (=> b!1053297 (= e!598179 (and (not (= lt!465113 i!1381)) (not (= (select (store (arr!31951 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465113) k!2747))))))

(declare-fun arrayScanForKey!0 (array!66429 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053297 (= lt!465113 (arrayScanForKey!0 lt!465114 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053298 () Bool)

(declare-fun res!702349 () Bool)

(assert (=> b!1053298 (=> (not res!702349) (not e!598178))))

(declare-datatypes ((List!22263 0))(
  ( (Nil!22260) (Cons!22259 (h!23468 (_ BitVec 64)) (t!31570 List!22263)) )
))
(declare-fun arrayNoDuplicates!0 (array!66429 (_ BitVec 32) List!22263) Bool)

(assert (=> b!1053298 (= res!702349 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22260))))

(declare-fun b!1053299 () Bool)

(declare-fun res!702353 () Bool)

(assert (=> b!1053299 (=> (not res!702353) (not e!598178))))

(assert (=> b!1053299 (= res!702353 (= (select (arr!31951 a!3488) i!1381) k!2747))))

(declare-fun res!702352 () Bool)

(assert (=> start!92682 (=> (not res!702352) (not e!598178))))

(assert (=> start!92682 (= res!702352 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32487 a!3488)) (bvslt (size!32487 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92682 e!598178))

(assert (=> start!92682 true))

(declare-fun array_inv!24731 (array!66429) Bool)

(assert (=> start!92682 (array_inv!24731 a!3488)))

(assert (= (and start!92682 res!702352) b!1053298))

(assert (= (and b!1053298 res!702349) b!1053296))

(assert (= (and b!1053296 res!702350) b!1053299))

(assert (= (and b!1053299 res!702353) b!1053295))

(assert (= (and b!1053295 res!702351) b!1053297))

(declare-fun m!973619 () Bool)

(assert (=> b!1053297 m!973619))

(declare-fun m!973621 () Bool)

(assert (=> b!1053297 m!973621))

(declare-fun m!973623 () Bool)

(assert (=> b!1053297 m!973623))

(declare-fun m!973625 () Bool)

(assert (=> start!92682 m!973625))

(declare-fun m!973627 () Bool)

(assert (=> b!1053295 m!973627))

(assert (=> b!1053295 m!973619))

(declare-fun m!973629 () Bool)

(assert (=> b!1053299 m!973629))

(declare-fun m!973631 () Bool)

(assert (=> b!1053296 m!973631))

(declare-fun m!973633 () Bool)

(assert (=> b!1053298 m!973633))

(push 1)

(assert (not b!1053297))

(assert (not start!92682))

(assert (not b!1053298))

(assert (not b!1053296))

(assert (not b!1053295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1053340 () Bool)

(declare-fun e!598210 () Bool)

(declare-fun contains!6165 (List!22263 (_ BitVec 64)) Bool)

(assert (=> b!1053340 (= e!598210 (contains!6165 Nil!22260 (select (arr!31951 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053341 () Bool)

(declare-fun e!598209 () Bool)

(declare-fun e!598208 () Bool)

(assert (=> b!1053341 (= e!598209 e!598208)))

(declare-fun res!702391 () Bool)

(assert (=> b!1053341 (=> (not res!702391) (not e!598208))))

(assert (=> b!1053341 (= res!702391 (not e!598210))))

(declare-fun res!702390 () Bool)

(assert (=> b!1053341 (=> (not res!702390) (not e!598210))))

(assert (=> b!1053341 (= res!702390 (validKeyInArray!0 (select (arr!31951 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053342 () Bool)

(declare-fun e!598207 () Bool)

(declare-fun call!44743 () Bool)

(assert (=> b!1053342 (= e!598207 call!44743)))

(declare-fun b!1053343 () Bool)

(assert (=> b!1053343 (= e!598208 e!598207)))

(declare-fun c!106935 () Bool)

(assert (=> b!1053343 (= c!106935 (validKeyInArray!0 (select (arr!31951 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127871 () Bool)

(declare-fun res!702392 () Bool)

(assert (=> d!127871 (=> res!702392 e!598209)))

(assert (=> d!127871 (= res!702392 (bvsge #b00000000000000000000000000000000 (size!32487 a!3488)))))

(assert (=> d!127871 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22260) e!598209)))

(declare-fun b!1053344 () Bool)

(assert (=> b!1053344 (= e!598207 call!44743)))

(declare-fun bm!44740 () Bool)

(assert (=> bm!44740 (= call!44743 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106935 (Cons!22259 (select (arr!31951 a!3488) #b00000000000000000000000000000000) Nil!22260) Nil!22260)))))

(assert (= (and d!127871 (not res!702392)) b!1053341))

(assert (= (and b!1053341 res!702390) b!1053340))

(assert (= (and b!1053341 res!702391) b!1053343))

(assert (= (and b!1053343 c!106935) b!1053344))

(assert (= (and b!1053343 (not c!106935)) b!1053342))

(assert (= (or b!1053344 b!1053342) bm!44740))

(declare-fun m!973667 () Bool)

(assert (=> b!1053340 m!973667))

(assert (=> b!1053340 m!973667))

(declare-fun m!973669 () Bool)

(assert (=> b!1053340 m!973669))

(assert (=> b!1053341 m!973667))

(assert (=> b!1053341 m!973667))

(declare-fun m!973671 () Bool)

(assert (=> b!1053341 m!973671))

(assert (=> b!1053343 m!973667))

(assert (=> b!1053343 m!973667))

(assert (=> b!1053343 m!973671))

(assert (=> bm!44740 m!973667))

(declare-fun m!973673 () Bool)

(assert (=> bm!44740 m!973673))

(assert (=> b!1053298 d!127871))

(declare-fun d!127877 () Bool)

(assert (=> d!127877 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053296 d!127877))

(declare-fun d!127879 () Bool)

(assert (=> d!127879 (= (array_inv!24731 a!3488) (bvsge (size!32487 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92682 d!127879))

(declare-fun d!127881 () Bool)

(declare-fun lt!465132 () (_ BitVec 32))

(assert (=> d!127881 (and (or (bvslt lt!465132 #b00000000000000000000000000000000) (bvsge lt!465132 (size!32487 lt!465114)) (and (bvsge lt!465132 #b00000000000000000000000000000000) (bvslt lt!465132 (size!32487 lt!465114)))) (bvsge lt!465132 #b00000000000000000000000000000000) (bvslt lt!465132 (size!32487 lt!465114)) (= (select (arr!31951 lt!465114) lt!465132) k!2747))))

(declare-fun e!598216 () (_ BitVec 32))

(assert (=> d!127881 (= lt!465132 e!598216)))

(declare-fun c!106941 () Bool)

(assert (=> d!127881 (= c!106941 (= (select (arr!31951 lt!465114) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32487 lt!465114)) (bvslt (size!32487 lt!465114) #b01111111111111111111111111111111))))

(assert (=> d!127881 (= (arrayScanForKey!0 lt!465114 k!2747 #b00000000000000000000000000000000) lt!465132)))

(declare-fun b!1053355 () Bool)

(assert (=> b!1053355 (= e!598216 #b00000000000000000000000000000000)))

(declare-fun b!1053356 () Bool)

(assert (=> b!1053356 (= e!598216 (arrayScanForKey!0 lt!465114 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127881 c!106941) b!1053355))

(assert (= (and d!127881 (not c!106941)) b!1053356))

(declare-fun m!973681 () Bool)

(assert (=> d!127881 m!973681))

(declare-fun m!973683 () Bool)

(assert (=> d!127881 m!973683))

(declare-fun m!973685 () Bool)

(assert (=> b!1053356 m!973685))

(assert (=> b!1053297 d!127881))

(declare-fun d!127891 () Bool)

(declare-fun res!702403 () Bool)

(declare-fun e!598227 () Bool)

(assert (=> d!127891 (=> res!702403 e!598227)))

(assert (=> d!127891 (= res!702403 (= (select (arr!31951 lt!465114) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127891 (= (arrayContainsKey!0 lt!465114 k!2747 #b00000000000000000000000000000000) e!598227)))

(declare-fun b!1053367 () Bool)

(declare-fun e!598228 () Bool)

(assert (=> b!1053367 (= e!598227 e!598228)))

(declare-fun res!702404 () Bool)

(assert (=> b!1053367 (=> (not res!702404) (not e!598228))))

(assert (=> b!1053367 (= res!702404 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32487 lt!465114)))))

(declare-fun b!1053368 () Bool)

(assert (=> b!1053368 (= e!598228 (arrayContainsKey!0 lt!465114 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127891 (not res!702403)) b!1053367))

(assert (= (and b!1053367 res!702404) b!1053368))

(assert (=> d!127891 m!973683))

(declare-fun m!973689 () Bool)

(assert (=> b!1053368 m!973689))

(assert (=> b!1053295 d!127891))

(push 1)

(assert (not b!1053340))

(assert (not b!1053343))

(assert (not bm!44740))

(assert (not b!1053341))

(assert (not b!1053368))

(assert (not b!1053356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

