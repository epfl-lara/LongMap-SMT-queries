; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92644 () Bool)

(assert start!92644)

(declare-fun b!1053018 () Bool)

(declare-fun res!702192 () Bool)

(declare-fun e!597999 () Bool)

(assert (=> b!1053018 (=> (not res!702192) (not e!597999))))

(declare-datatypes ((array!66359 0))(
  ( (array!66360 (arr!31917 (Array (_ BitVec 32) (_ BitVec 64))) (size!32455 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66359)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053018 (= res!702192 (= (select (arr!31917 a!3488) i!1381) k0!2747))))

(declare-fun b!1053019 () Bool)

(declare-fun res!702194 () Bool)

(assert (=> b!1053019 (=> (not res!702194) (not e!597999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053019 (= res!702194 (validKeyInArray!0 k0!2747))))

(declare-fun e!597997 () Bool)

(declare-fun lt!464887 () (_ BitVec 32))

(declare-fun b!1053020 () Bool)

(assert (=> b!1053020 (= e!597997 (and (not (= lt!464887 i!1381)) (or (bvslt lt!464887 #b00000000000000000000000000000000) (bvsge lt!464887 (size!32455 a!3488)))))))

(declare-fun lt!464886 () array!66359)

(declare-fun arrayScanForKey!0 (array!66359 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053020 (= lt!464887 (arrayScanForKey!0 lt!464886 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053021 () Bool)

(assert (=> b!1053021 (= e!597999 e!597997)))

(declare-fun res!702193 () Bool)

(assert (=> b!1053021 (=> (not res!702193) (not e!597997))))

(declare-fun arrayContainsKey!0 (array!66359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053021 (= res!702193 (arrayContainsKey!0 lt!464886 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053021 (= lt!464886 (array!66360 (store (arr!31917 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32455 a!3488)))))

(declare-fun res!702195 () Bool)

(assert (=> start!92644 (=> (not res!702195) (not e!597999))))

(assert (=> start!92644 (= res!702195 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32455 a!3488)) (bvslt (size!32455 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92644 e!597999))

(assert (=> start!92644 true))

(declare-fun array_inv!24700 (array!66359) Bool)

(assert (=> start!92644 (array_inv!24700 a!3488)))

(declare-fun b!1053022 () Bool)

(declare-fun res!702196 () Bool)

(assert (=> b!1053022 (=> (not res!702196) (not e!597999))))

(declare-datatypes ((List!22288 0))(
  ( (Nil!22285) (Cons!22284 (h!23493 (_ BitVec 64)) (t!31586 List!22288)) )
))
(declare-fun arrayNoDuplicates!0 (array!66359 (_ BitVec 32) List!22288) Bool)

(assert (=> b!1053022 (= res!702196 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22285))))

(assert (= (and start!92644 res!702195) b!1053022))

(assert (= (and b!1053022 res!702196) b!1053019))

(assert (= (and b!1053019 res!702194) b!1053018))

(assert (= (and b!1053018 res!702192) b!1053021))

(assert (= (and b!1053021 res!702193) b!1053020))

(declare-fun m!972913 () Bool)

(assert (=> start!92644 m!972913))

(declare-fun m!972915 () Bool)

(assert (=> b!1053020 m!972915))

(declare-fun m!972917 () Bool)

(assert (=> b!1053019 m!972917))

(declare-fun m!972919 () Bool)

(assert (=> b!1053018 m!972919))

(declare-fun m!972921 () Bool)

(assert (=> b!1053022 m!972921))

(declare-fun m!972923 () Bool)

(assert (=> b!1053021 m!972923))

(declare-fun m!972925 () Bool)

(assert (=> b!1053021 m!972925))

(check-sat (not start!92644) (not b!1053019) (not b!1053022) (not b!1053021) (not b!1053020))
(check-sat)
(get-model)

(declare-fun d!127689 () Bool)

(assert (=> d!127689 (= (array_inv!24700 a!3488) (bvsge (size!32455 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92644 d!127689))

(declare-fun d!127691 () Bool)

(declare-fun lt!464902 () (_ BitVec 32))

(assert (=> d!127691 (and (or (bvslt lt!464902 #b00000000000000000000000000000000) (bvsge lt!464902 (size!32455 lt!464886)) (and (bvsge lt!464902 #b00000000000000000000000000000000) (bvslt lt!464902 (size!32455 lt!464886)))) (bvsge lt!464902 #b00000000000000000000000000000000) (bvslt lt!464902 (size!32455 lt!464886)) (= (select (arr!31917 lt!464886) lt!464902) k0!2747))))

(declare-fun e!598020 () (_ BitVec 32))

(assert (=> d!127691 (= lt!464902 e!598020)))

(declare-fun c!106878 () Bool)

(assert (=> d!127691 (= c!106878 (= (select (arr!31917 lt!464886) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32455 lt!464886)) (bvslt (size!32455 lt!464886) #b01111111111111111111111111111111))))

(assert (=> d!127691 (= (arrayScanForKey!0 lt!464886 k0!2747 #b00000000000000000000000000000000) lt!464902)))

(declare-fun b!1053057 () Bool)

(assert (=> b!1053057 (= e!598020 #b00000000000000000000000000000000)))

(declare-fun b!1053058 () Bool)

(assert (=> b!1053058 (= e!598020 (arrayScanForKey!0 lt!464886 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127691 c!106878) b!1053057))

(assert (= (and d!127691 (not c!106878)) b!1053058))

(declare-fun m!972955 () Bool)

(assert (=> d!127691 m!972955))

(declare-fun m!972957 () Bool)

(assert (=> d!127691 m!972957))

(declare-fun m!972959 () Bool)

(assert (=> b!1053058 m!972959))

(assert (=> b!1053020 d!127691))

(declare-fun d!127697 () Bool)

(assert (=> d!127697 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053019 d!127697))

(declare-fun d!127699 () Bool)

(declare-fun res!702247 () Bool)

(declare-fun e!598044 () Bool)

(assert (=> d!127699 (=> res!702247 e!598044)))

(assert (=> d!127699 (= res!702247 (bvsge #b00000000000000000000000000000000 (size!32455 a!3488)))))

(assert (=> d!127699 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22285) e!598044)))

(declare-fun bm!44708 () Bool)

(declare-fun call!44711 () Bool)

(declare-fun c!106884 () Bool)

(assert (=> bm!44708 (= call!44711 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106884 (Cons!22284 (select (arr!31917 a!3488) #b00000000000000000000000000000000) Nil!22285) Nil!22285)))))

(declare-fun b!1053087 () Bool)

(declare-fun e!598046 () Bool)

(assert (=> b!1053087 (= e!598044 e!598046)))

(declare-fun res!702245 () Bool)

(assert (=> b!1053087 (=> (not res!702245) (not e!598046))))

(declare-fun e!598045 () Bool)

(assert (=> b!1053087 (= res!702245 (not e!598045))))

(declare-fun res!702246 () Bool)

(assert (=> b!1053087 (=> (not res!702246) (not e!598045))))

(assert (=> b!1053087 (= res!702246 (validKeyInArray!0 (select (arr!31917 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053088 () Bool)

(declare-fun e!598047 () Bool)

(assert (=> b!1053088 (= e!598047 call!44711)))

(declare-fun b!1053089 () Bool)

(assert (=> b!1053089 (= e!598047 call!44711)))

(declare-fun b!1053090 () Bool)

(assert (=> b!1053090 (= e!598046 e!598047)))

(assert (=> b!1053090 (= c!106884 (validKeyInArray!0 (select (arr!31917 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053091 () Bool)

(declare-fun contains!6136 (List!22288 (_ BitVec 64)) Bool)

(assert (=> b!1053091 (= e!598045 (contains!6136 Nil!22285 (select (arr!31917 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!127699 (not res!702247)) b!1053087))

(assert (= (and b!1053087 res!702246) b!1053091))

(assert (= (and b!1053087 res!702245) b!1053090))

(assert (= (and b!1053090 c!106884) b!1053088))

(assert (= (and b!1053090 (not c!106884)) b!1053089))

(assert (= (or b!1053088 b!1053089) bm!44708))

(declare-fun m!972973 () Bool)

(assert (=> bm!44708 m!972973))

(declare-fun m!972975 () Bool)

(assert (=> bm!44708 m!972975))

(assert (=> b!1053087 m!972973))

(assert (=> b!1053087 m!972973))

(declare-fun m!972977 () Bool)

(assert (=> b!1053087 m!972977))

(assert (=> b!1053090 m!972973))

(assert (=> b!1053090 m!972973))

(assert (=> b!1053090 m!972977))

(assert (=> b!1053091 m!972973))

(assert (=> b!1053091 m!972973))

(declare-fun m!972979 () Bool)

(assert (=> b!1053091 m!972979))

(assert (=> b!1053022 d!127699))

(declare-fun d!127711 () Bool)

(declare-fun res!702256 () Bool)

(declare-fun e!598059 () Bool)

(assert (=> d!127711 (=> res!702256 e!598059)))

(assert (=> d!127711 (= res!702256 (= (select (arr!31917 lt!464886) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127711 (= (arrayContainsKey!0 lt!464886 k0!2747 #b00000000000000000000000000000000) e!598059)))

(declare-fun b!1053104 () Bool)

(declare-fun e!598062 () Bool)

(assert (=> b!1053104 (= e!598059 e!598062)))

(declare-fun res!702257 () Bool)

(assert (=> b!1053104 (=> (not res!702257) (not e!598062))))

(assert (=> b!1053104 (= res!702257 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32455 lt!464886)))))

(declare-fun b!1053105 () Bool)

(assert (=> b!1053105 (= e!598062 (arrayContainsKey!0 lt!464886 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127711 (not res!702256)) b!1053104))

(assert (= (and b!1053104 res!702257) b!1053105))

(assert (=> d!127711 m!972957))

(declare-fun m!972985 () Bool)

(assert (=> b!1053105 m!972985))

(assert (=> b!1053021 d!127711))

(check-sat (not b!1053090) (not b!1053091) (not bm!44708) (not b!1053058) (not b!1053105) (not b!1053087))
(check-sat)
