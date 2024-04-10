; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92648 () Bool)

(assert start!92648)

(declare-fun b!1053184 () Bool)

(declare-fun res!702276 () Bool)

(declare-fun e!598099 () Bool)

(assert (=> b!1053184 (=> (not res!702276) (not e!598099))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053184 (= res!702276 (validKeyInArray!0 k0!2747))))

(declare-datatypes ((array!66422 0))(
  ( (array!66423 (arr!31949 (Array (_ BitVec 32) (_ BitVec 64))) (size!32485 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66422)

(declare-fun b!1053185 () Bool)

(declare-fun lt!465093 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun e!598098 () Bool)

(assert (=> b!1053185 (= e!598098 (and (not (= lt!465093 i!1381)) (or (bvslt lt!465093 #b00000000000000000000000000000000) (bvsge lt!465093 (size!32485 a!3488)))))))

(declare-fun lt!465092 () array!66422)

(declare-fun arrayScanForKey!0 (array!66422 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053185 (= lt!465093 (arrayScanForKey!0 lt!465092 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!702275 () Bool)

(assert (=> start!92648 (=> (not res!702275) (not e!598099))))

(assert (=> start!92648 (= res!702275 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32485 a!3488)) (bvslt (size!32485 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92648 e!598099))

(assert (=> start!92648 true))

(declare-fun array_inv!24729 (array!66422) Bool)

(assert (=> start!92648 (array_inv!24729 a!3488)))

(declare-fun b!1053186 () Bool)

(declare-fun res!702277 () Bool)

(assert (=> b!1053186 (=> (not res!702277) (not e!598099))))

(assert (=> b!1053186 (= res!702277 (= (select (arr!31949 a!3488) i!1381) k0!2747))))

(declare-fun b!1053187 () Bool)

(assert (=> b!1053187 (= e!598099 e!598098)))

(declare-fun res!702278 () Bool)

(assert (=> b!1053187 (=> (not res!702278) (not e!598098))))

(declare-fun arrayContainsKey!0 (array!66422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053187 (= res!702278 (arrayContainsKey!0 lt!465092 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053187 (= lt!465092 (array!66423 (store (arr!31949 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32485 a!3488)))))

(declare-fun b!1053188 () Bool)

(declare-fun res!702274 () Bool)

(assert (=> b!1053188 (=> (not res!702274) (not e!598099))))

(declare-datatypes ((List!22261 0))(
  ( (Nil!22258) (Cons!22257 (h!23466 (_ BitVec 64)) (t!31568 List!22261)) )
))
(declare-fun arrayNoDuplicates!0 (array!66422 (_ BitVec 32) List!22261) Bool)

(assert (=> b!1053188 (= res!702274 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22258))))

(assert (= (and start!92648 res!702275) b!1053188))

(assert (= (and b!1053188 res!702274) b!1053184))

(assert (= (and b!1053184 res!702276) b!1053186))

(assert (= (and b!1053186 res!702277) b!1053187))

(assert (= (and b!1053187 res!702278) b!1053185))

(declare-fun m!973543 () Bool)

(assert (=> b!1053185 m!973543))

(declare-fun m!973545 () Bool)

(assert (=> b!1053186 m!973545))

(declare-fun m!973547 () Bool)

(assert (=> start!92648 m!973547))

(declare-fun m!973549 () Bool)

(assert (=> b!1053188 m!973549))

(declare-fun m!973551 () Bool)

(assert (=> b!1053187 m!973551))

(declare-fun m!973553 () Bool)

(assert (=> b!1053187 m!973553))

(declare-fun m!973555 () Bool)

(assert (=> b!1053184 m!973555))

(check-sat (not b!1053188) (not b!1053187) (not b!1053185) (not b!1053184) (not start!92648))
(check-sat)
(get-model)

(declare-fun d!127843 () Bool)

(declare-fun res!702313 () Bool)

(declare-fun e!598136 () Bool)

(assert (=> d!127843 (=> res!702313 e!598136)))

(assert (=> d!127843 (= res!702313 (= (select (arr!31949 lt!465092) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127843 (= (arrayContainsKey!0 lt!465092 k0!2747 #b00000000000000000000000000000000) e!598136)))

(declare-fun b!1053239 () Bool)

(declare-fun e!598137 () Bool)

(assert (=> b!1053239 (= e!598136 e!598137)))

(declare-fun res!702314 () Bool)

(assert (=> b!1053239 (=> (not res!702314) (not e!598137))))

(assert (=> b!1053239 (= res!702314 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32485 lt!465092)))))

(declare-fun b!1053240 () Bool)

(assert (=> b!1053240 (= e!598137 (arrayContainsKey!0 lt!465092 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127843 (not res!702313)) b!1053239))

(assert (= (and b!1053239 res!702314) b!1053240))

(declare-fun m!973585 () Bool)

(assert (=> d!127843 m!973585))

(declare-fun m!973587 () Bool)

(assert (=> b!1053240 m!973587))

(assert (=> b!1053187 d!127843))

(declare-fun d!127851 () Bool)

(declare-fun lt!465108 () (_ BitVec 32))

(assert (=> d!127851 (and (or (bvslt lt!465108 #b00000000000000000000000000000000) (bvsge lt!465108 (size!32485 lt!465092)) (and (bvsge lt!465108 #b00000000000000000000000000000000) (bvslt lt!465108 (size!32485 lt!465092)))) (bvsge lt!465108 #b00000000000000000000000000000000) (bvslt lt!465108 (size!32485 lt!465092)) (= (select (arr!31949 lt!465092) lt!465108) k0!2747))))

(declare-fun e!598159 () (_ BitVec 32))

(assert (=> d!127851 (= lt!465108 e!598159)))

(declare-fun c!106929 () Bool)

(assert (=> d!127851 (= c!106929 (= (select (arr!31949 lt!465092) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127851 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32485 lt!465092)) (bvslt (size!32485 lt!465092) #b01111111111111111111111111111111))))

(assert (=> d!127851 (= (arrayScanForKey!0 lt!465092 k0!2747 #b00000000000000000000000000000000) lt!465108)))

(declare-fun b!1053268 () Bool)

(assert (=> b!1053268 (= e!598159 #b00000000000000000000000000000000)))

(declare-fun b!1053269 () Bool)

(assert (=> b!1053269 (= e!598159 (arrayScanForKey!0 lt!465092 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127851 c!106929) b!1053268))

(assert (= (and d!127851 (not c!106929)) b!1053269))

(declare-fun m!973607 () Bool)

(assert (=> d!127851 m!973607))

(assert (=> d!127851 m!973585))

(declare-fun m!973609 () Bool)

(assert (=> b!1053269 m!973609))

(assert (=> b!1053185 d!127851))

(declare-fun d!127863 () Bool)

(assert (=> d!127863 (= (array_inv!24729 a!3488) (bvsge (size!32485 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92648 d!127863))

(declare-fun d!127865 () Bool)

(assert (=> d!127865 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053184 d!127865))

(declare-fun bm!44737 () Bool)

(declare-fun call!44740 () Bool)

(declare-fun c!106932 () Bool)

(assert (=> bm!44737 (= call!44740 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106932 (Cons!22257 (select (arr!31949 a!3488) #b00000000000000000000000000000000) Nil!22258) Nil!22258)))))

(declare-fun b!1053280 () Bool)

(declare-fun e!598171 () Bool)

(declare-fun contains!6164 (List!22261 (_ BitVec 64)) Bool)

(assert (=> b!1053280 (= e!598171 (contains!6164 Nil!22258 (select (arr!31949 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127867 () Bool)

(declare-fun res!702338 () Bool)

(declare-fun e!598168 () Bool)

(assert (=> d!127867 (=> res!702338 e!598168)))

(assert (=> d!127867 (= res!702338 (bvsge #b00000000000000000000000000000000 (size!32485 a!3488)))))

(assert (=> d!127867 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22258) e!598168)))

(declare-fun b!1053281 () Bool)

(declare-fun e!598169 () Bool)

(declare-fun e!598170 () Bool)

(assert (=> b!1053281 (= e!598169 e!598170)))

(assert (=> b!1053281 (= c!106932 (validKeyInArray!0 (select (arr!31949 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053282 () Bool)

(assert (=> b!1053282 (= e!598170 call!44740)))

(declare-fun b!1053283 () Bool)

(assert (=> b!1053283 (= e!598170 call!44740)))

(declare-fun b!1053284 () Bool)

(assert (=> b!1053284 (= e!598168 e!598169)))

(declare-fun res!702337 () Bool)

(assert (=> b!1053284 (=> (not res!702337) (not e!598169))))

(assert (=> b!1053284 (= res!702337 (not e!598171))))

(declare-fun res!702336 () Bool)

(assert (=> b!1053284 (=> (not res!702336) (not e!598171))))

(assert (=> b!1053284 (= res!702336 (validKeyInArray!0 (select (arr!31949 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127867 (not res!702338)) b!1053284))

(assert (= (and b!1053284 res!702336) b!1053280))

(assert (= (and b!1053284 res!702337) b!1053281))

(assert (= (and b!1053281 c!106932) b!1053283))

(assert (= (and b!1053281 (not c!106932)) b!1053282))

(assert (= (or b!1053283 b!1053282) bm!44737))

(declare-fun m!973611 () Bool)

(assert (=> bm!44737 m!973611))

(declare-fun m!973613 () Bool)

(assert (=> bm!44737 m!973613))

(assert (=> b!1053280 m!973611))

(assert (=> b!1053280 m!973611))

(declare-fun m!973615 () Bool)

(assert (=> b!1053280 m!973615))

(assert (=> b!1053281 m!973611))

(assert (=> b!1053281 m!973611))

(declare-fun m!973617 () Bool)

(assert (=> b!1053281 m!973617))

(assert (=> b!1053284 m!973611))

(assert (=> b!1053284 m!973611))

(assert (=> b!1053284 m!973617))

(assert (=> b!1053188 d!127867))

(check-sat (not b!1053280) (not b!1053284) (not bm!44737) (not b!1053240) (not b!1053281) (not b!1053269))
(check-sat)
