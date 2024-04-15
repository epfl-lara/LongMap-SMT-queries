; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92716 () Bool)

(assert start!92716)

(declare-fun b!1053274 () Bool)

(declare-fun res!702377 () Bool)

(declare-fun e!598181 () Bool)

(assert (=> b!1053274 (=> (not res!702377) (not e!598181))))

(declare-datatypes ((array!66377 0))(
  ( (array!66378 (arr!31923 (Array (_ BitVec 32) (_ BitVec 64))) (size!32461 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66377)

(declare-datatypes ((List!22294 0))(
  ( (Nil!22291) (Cons!22290 (h!23499 (_ BitVec 64)) (t!31592 List!22294)) )
))
(declare-fun arrayNoDuplicates!0 (array!66377 (_ BitVec 32) List!22294) Bool)

(assert (=> b!1053274 (= res!702377 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22291))))

(declare-fun b!1053275 () Bool)

(declare-fun e!598182 () Bool)

(declare-fun e!598184 () Bool)

(assert (=> b!1053275 (= e!598182 (not e!598184))))

(declare-fun res!702376 () Bool)

(assert (=> b!1053275 (=> res!702376 e!598184)))

(declare-fun lt!464941 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053275 (= res!702376 (bvsle lt!464941 i!1381))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1053275 (= (select (store (arr!31923 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464941) k0!2747)))

(declare-fun b!1053276 () Bool)

(declare-fun e!598185 () Bool)

(assert (=> b!1053276 (= e!598185 e!598182)))

(declare-fun res!702382 () Bool)

(assert (=> b!1053276 (=> (not res!702382) (not e!598182))))

(assert (=> b!1053276 (= res!702382 (not (= lt!464941 i!1381)))))

(declare-fun lt!464940 () array!66377)

(declare-fun arrayScanForKey!0 (array!66377 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053276 (= lt!464941 (arrayScanForKey!0 lt!464940 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053277 () Bool)

(declare-fun res!702380 () Bool)

(assert (=> b!1053277 (=> (not res!702380) (not e!598181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053277 (= res!702380 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053278 () Bool)

(declare-fun res!702378 () Bool)

(assert (=> b!1053278 (=> (not res!702378) (not e!598181))))

(assert (=> b!1053278 (= res!702378 (= (select (arr!31923 a!3488) i!1381) k0!2747))))

(declare-fun res!702379 () Bool)

(assert (=> start!92716 (=> (not res!702379) (not e!598181))))

(assert (=> start!92716 (= res!702379 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32461 a!3488)) (bvslt (size!32461 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92716 e!598181))

(assert (=> start!92716 true))

(declare-fun array_inv!24706 (array!66377) Bool)

(assert (=> start!92716 (array_inv!24706 a!3488)))

(declare-fun b!1053279 () Bool)

(declare-fun arrayContainsKey!0 (array!66377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053279 (= e!598184 (arrayContainsKey!0 a!3488 k0!2747 lt!464941))))

(declare-fun b!1053280 () Bool)

(assert (=> b!1053280 (= e!598181 e!598185)))

(declare-fun res!702381 () Bool)

(assert (=> b!1053280 (=> (not res!702381) (not e!598185))))

(assert (=> b!1053280 (= res!702381 (arrayContainsKey!0 lt!464940 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053280 (= lt!464940 (array!66378 (store (arr!31923 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32461 a!3488)))))

(assert (= (and start!92716 res!702379) b!1053274))

(assert (= (and b!1053274 res!702377) b!1053277))

(assert (= (and b!1053277 res!702380) b!1053278))

(assert (= (and b!1053278 res!702378) b!1053280))

(assert (= (and b!1053280 res!702381) b!1053276))

(assert (= (and b!1053276 res!702382) b!1053275))

(assert (= (and b!1053275 (not res!702376)) b!1053279))

(declare-fun m!973099 () Bool)

(assert (=> b!1053275 m!973099))

(declare-fun m!973101 () Bool)

(assert (=> b!1053275 m!973101))

(declare-fun m!973103 () Bool)

(assert (=> b!1053279 m!973103))

(declare-fun m!973105 () Bool)

(assert (=> b!1053277 m!973105))

(declare-fun m!973107 () Bool)

(assert (=> b!1053278 m!973107))

(declare-fun m!973109 () Bool)

(assert (=> b!1053280 m!973109))

(assert (=> b!1053280 m!973099))

(declare-fun m!973111 () Bool)

(assert (=> start!92716 m!973111))

(declare-fun m!973113 () Bool)

(assert (=> b!1053276 m!973113))

(declare-fun m!973115 () Bool)

(assert (=> b!1053274 m!973115))

(check-sat (not b!1053274) (not b!1053279) (not b!1053280) (not b!1053276) (not start!92716) (not b!1053277))
(check-sat)
(get-model)

(declare-fun d!127753 () Bool)

(declare-fun res!702431 () Bool)

(declare-fun e!598225 () Bool)

(assert (=> d!127753 (=> res!702431 e!598225)))

(assert (=> d!127753 (= res!702431 (bvsge #b00000000000000000000000000000000 (size!32461 a!3488)))))

(assert (=> d!127753 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22291) e!598225)))

(declare-fun b!1053333 () Bool)

(declare-fun e!598224 () Bool)

(declare-fun call!44729 () Bool)

(assert (=> b!1053333 (= e!598224 call!44729)))

(declare-fun bm!44726 () Bool)

(declare-fun c!106914 () Bool)

(assert (=> bm!44726 (= call!44729 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106914 (Cons!22290 (select (arr!31923 a!3488) #b00000000000000000000000000000000) Nil!22291) Nil!22291)))))

(declare-fun b!1053334 () Bool)

(assert (=> b!1053334 (= e!598224 call!44729)))

(declare-fun b!1053335 () Bool)

(declare-fun e!598226 () Bool)

(assert (=> b!1053335 (= e!598225 e!598226)))

(declare-fun res!702433 () Bool)

(assert (=> b!1053335 (=> (not res!702433) (not e!598226))))

(declare-fun e!598227 () Bool)

(assert (=> b!1053335 (= res!702433 (not e!598227))))

(declare-fun res!702432 () Bool)

(assert (=> b!1053335 (=> (not res!702432) (not e!598227))))

(assert (=> b!1053335 (= res!702432 (validKeyInArray!0 (select (arr!31923 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053336 () Bool)

(assert (=> b!1053336 (= e!598226 e!598224)))

(assert (=> b!1053336 (= c!106914 (validKeyInArray!0 (select (arr!31923 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053337 () Bool)

(declare-fun contains!6142 (List!22294 (_ BitVec 64)) Bool)

(assert (=> b!1053337 (= e!598227 (contains!6142 Nil!22291 (select (arr!31923 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127753 (not res!702431)) b!1053335))

(assert (= (and b!1053335 res!702432) b!1053337))

(assert (= (and b!1053335 res!702433) b!1053336))

(assert (= (and b!1053336 c!106914) b!1053334))

(assert (= (and b!1053336 (not c!106914)) b!1053333))

(assert (= (or b!1053334 b!1053333) bm!44726))

(declare-fun m!973153 () Bool)

(assert (=> bm!44726 m!973153))

(declare-fun m!973155 () Bool)

(assert (=> bm!44726 m!973155))

(assert (=> b!1053335 m!973153))

(assert (=> b!1053335 m!973153))

(declare-fun m!973157 () Bool)

(assert (=> b!1053335 m!973157))

(assert (=> b!1053336 m!973153))

(assert (=> b!1053336 m!973153))

(assert (=> b!1053336 m!973157))

(assert (=> b!1053337 m!973153))

(assert (=> b!1053337 m!973153))

(declare-fun m!973159 () Bool)

(assert (=> b!1053337 m!973159))

(assert (=> b!1053274 d!127753))

(declare-fun d!127755 () Bool)

(declare-fun res!702438 () Bool)

(declare-fun e!598232 () Bool)

(assert (=> d!127755 (=> res!702438 e!598232)))

(assert (=> d!127755 (= res!702438 (= (select (arr!31923 a!3488) lt!464941) k0!2747))))

(assert (=> d!127755 (= (arrayContainsKey!0 a!3488 k0!2747 lt!464941) e!598232)))

(declare-fun b!1053342 () Bool)

(declare-fun e!598233 () Bool)

(assert (=> b!1053342 (= e!598232 e!598233)))

(declare-fun res!702439 () Bool)

(assert (=> b!1053342 (=> (not res!702439) (not e!598233))))

(assert (=> b!1053342 (= res!702439 (bvslt (bvadd lt!464941 #b00000000000000000000000000000001) (size!32461 a!3488)))))

(declare-fun b!1053343 () Bool)

(assert (=> b!1053343 (= e!598233 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!464941 #b00000000000000000000000000000001)))))

(assert (= (and d!127755 (not res!702438)) b!1053342))

(assert (= (and b!1053342 res!702439) b!1053343))

(declare-fun m!973161 () Bool)

(assert (=> d!127755 m!973161))

(declare-fun m!973163 () Bool)

(assert (=> b!1053343 m!973163))

(assert (=> b!1053279 d!127755))

(declare-fun d!127763 () Bool)

(declare-fun res!702440 () Bool)

(declare-fun e!598234 () Bool)

(assert (=> d!127763 (=> res!702440 e!598234)))

(assert (=> d!127763 (= res!702440 (= (select (arr!31923 lt!464940) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127763 (= (arrayContainsKey!0 lt!464940 k0!2747 #b00000000000000000000000000000000) e!598234)))

(declare-fun b!1053344 () Bool)

(declare-fun e!598235 () Bool)

(assert (=> b!1053344 (= e!598234 e!598235)))

(declare-fun res!702441 () Bool)

(assert (=> b!1053344 (=> (not res!702441) (not e!598235))))

(assert (=> b!1053344 (= res!702441 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32461 lt!464940)))))

(declare-fun b!1053345 () Bool)

(assert (=> b!1053345 (= e!598235 (arrayContainsKey!0 lt!464940 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127763 (not res!702440)) b!1053344))

(assert (= (and b!1053344 res!702441) b!1053345))

(declare-fun m!973165 () Bool)

(assert (=> d!127763 m!973165))

(declare-fun m!973167 () Bool)

(assert (=> b!1053345 m!973167))

(assert (=> b!1053280 d!127763))

(declare-fun d!127765 () Bool)

(assert (=> d!127765 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053277 d!127765))

(declare-fun d!127767 () Bool)

(declare-fun lt!464956 () (_ BitVec 32))

(assert (=> d!127767 (and (or (bvslt lt!464956 #b00000000000000000000000000000000) (bvsge lt!464956 (size!32461 lt!464940)) (and (bvsge lt!464956 #b00000000000000000000000000000000) (bvslt lt!464956 (size!32461 lt!464940)))) (bvsge lt!464956 #b00000000000000000000000000000000) (bvslt lt!464956 (size!32461 lt!464940)) (= (select (arr!31923 lt!464940) lt!464956) k0!2747))))

(declare-fun e!598246 () (_ BitVec 32))

(assert (=> d!127767 (= lt!464956 e!598246)))

(declare-fun c!106917 () Bool)

(assert (=> d!127767 (= c!106917 (= (select (arr!31923 lt!464940) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127767 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32461 lt!464940)) (bvslt (size!32461 lt!464940) #b01111111111111111111111111111111))))

(assert (=> d!127767 (= (arrayScanForKey!0 lt!464940 k0!2747 #b00000000000000000000000000000000) lt!464956)))

(declare-fun b!1053358 () Bool)

(assert (=> b!1053358 (= e!598246 #b00000000000000000000000000000000)))

(declare-fun b!1053359 () Bool)

(assert (=> b!1053359 (= e!598246 (arrayScanForKey!0 lt!464940 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127767 c!106917) b!1053358))

(assert (= (and d!127767 (not c!106917)) b!1053359))

(declare-fun m!973177 () Bool)

(assert (=> d!127767 m!973177))

(assert (=> d!127767 m!973165))

(declare-fun m!973179 () Bool)

(assert (=> b!1053359 m!973179))

(assert (=> b!1053276 d!127767))

(declare-fun d!127777 () Bool)

(assert (=> d!127777 (= (array_inv!24706 a!3488) (bvsge (size!32461 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92716 d!127777))

(check-sat (not b!1053336) (not b!1053345) (not b!1053335) (not b!1053337) (not b!1053359) (not b!1053343) (not bm!44726))
(check-sat)
