; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92588 () Bool)

(assert start!92588)

(declare-fun b!1052986 () Bool)

(declare-datatypes ((array!66389 0))(
  ( (array!66390 (arr!31934 (Array (_ BitVec 32) (_ BitVec 64))) (size!32470 (_ BitVec 32))) )
))
(declare-fun lt!465024 () array!66389)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun e!597928 () Bool)

(declare-fun arrayScanForKey!0 (array!66389 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052986 (= e!597928 (= (arrayScanForKey!0 lt!465024 k0!2747 #b00000000000000000000000000000000) i!1381))))

(declare-fun res!702116 () Bool)

(declare-fun e!597926 () Bool)

(assert (=> start!92588 (=> (not res!702116) (not e!597926))))

(declare-fun a!3488 () array!66389)

(assert (=> start!92588 (= res!702116 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32470 a!3488)) (bvslt (size!32470 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92588 e!597926))

(assert (=> start!92588 true))

(declare-fun array_inv!24714 (array!66389) Bool)

(assert (=> start!92588 (array_inv!24714 a!3488)))

(declare-fun b!1052987 () Bool)

(declare-fun res!702115 () Bool)

(assert (=> b!1052987 (=> (not res!702115) (not e!597926))))

(assert (=> b!1052987 (= res!702115 (= (select (arr!31934 a!3488) i!1381) k0!2747))))

(declare-fun b!1052988 () Bool)

(declare-fun res!702113 () Bool)

(assert (=> b!1052988 (=> (not res!702113) (not e!597926))))

(declare-datatypes ((List!22246 0))(
  ( (Nil!22243) (Cons!22242 (h!23451 (_ BitVec 64)) (t!31553 List!22246)) )
))
(declare-fun arrayNoDuplicates!0 (array!66389 (_ BitVec 32) List!22246) Bool)

(assert (=> b!1052988 (= res!702113 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22243))))

(declare-fun b!1052989 () Bool)

(assert (=> b!1052989 (= e!597926 e!597928)))

(declare-fun res!702112 () Bool)

(assert (=> b!1052989 (=> (not res!702112) (not e!597928))))

(declare-fun arrayContainsKey!0 (array!66389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052989 (= res!702112 (arrayContainsKey!0 lt!465024 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052989 (= lt!465024 (array!66390 (store (arr!31934 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32470 a!3488)))))

(declare-fun b!1052990 () Bool)

(declare-fun res!702114 () Bool)

(assert (=> b!1052990 (=> (not res!702114) (not e!597926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052990 (= res!702114 (validKeyInArray!0 k0!2747))))

(assert (= (and start!92588 res!702116) b!1052988))

(assert (= (and b!1052988 res!702113) b!1052990))

(assert (= (and b!1052990 res!702114) b!1052987))

(assert (= (and b!1052987 res!702115) b!1052989))

(assert (= (and b!1052989 res!702112) b!1052986))

(declare-fun m!973375 () Bool)

(assert (=> b!1052990 m!973375))

(declare-fun m!973377 () Bool)

(assert (=> start!92588 m!973377))

(declare-fun m!973379 () Bool)

(assert (=> b!1052989 m!973379))

(declare-fun m!973381 () Bool)

(assert (=> b!1052989 m!973381))

(declare-fun m!973383 () Bool)

(assert (=> b!1052988 m!973383))

(declare-fun m!973385 () Bool)

(assert (=> b!1052987 m!973385))

(declare-fun m!973387 () Bool)

(assert (=> b!1052986 m!973387))

(check-sat (not b!1052986) (not start!92588) (not b!1052990) (not b!1052989) (not b!1052988))
(check-sat)
(get-model)

(declare-fun d!127799 () Bool)

(declare-fun res!702136 () Bool)

(declare-fun e!597942 () Bool)

(assert (=> d!127799 (=> res!702136 e!597942)))

(assert (=> d!127799 (= res!702136 (= (select (arr!31934 lt!465024) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127799 (= (arrayContainsKey!0 lt!465024 k0!2747 #b00000000000000000000000000000000) e!597942)))

(declare-fun b!1053010 () Bool)

(declare-fun e!597943 () Bool)

(assert (=> b!1053010 (= e!597942 e!597943)))

(declare-fun res!702137 () Bool)

(assert (=> b!1053010 (=> (not res!702137) (not e!597943))))

(assert (=> b!1053010 (= res!702137 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32470 lt!465024)))))

(declare-fun b!1053011 () Bool)

(assert (=> b!1053011 (= e!597943 (arrayContainsKey!0 lt!465024 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127799 (not res!702136)) b!1053010))

(assert (= (and b!1053010 res!702137) b!1053011))

(declare-fun m!973403 () Bool)

(assert (=> d!127799 m!973403))

(declare-fun m!973405 () Bool)

(assert (=> b!1053011 m!973405))

(assert (=> b!1052989 d!127799))

(declare-fun bm!44724 () Bool)

(declare-fun call!44727 () Bool)

(declare-fun c!106901 () Bool)

(assert (=> bm!44724 (= call!44727 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106901 (Cons!22242 (select (arr!31934 a!3488) #b00000000000000000000000000000000) Nil!22243) Nil!22243)))))

(declare-fun b!1053044 () Bool)

(declare-fun e!597974 () Bool)

(declare-fun e!597973 () Bool)

(assert (=> b!1053044 (= e!597974 e!597973)))

(assert (=> b!1053044 (= c!106901 (validKeyInArray!0 (select (arr!31934 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053045 () Bool)

(declare-fun e!597975 () Bool)

(assert (=> b!1053045 (= e!597975 e!597974)))

(declare-fun res!702164 () Bool)

(assert (=> b!1053045 (=> (not res!702164) (not e!597974))))

(declare-fun e!597972 () Bool)

(assert (=> b!1053045 (= res!702164 (not e!597972))))

(declare-fun res!702162 () Bool)

(assert (=> b!1053045 (=> (not res!702162) (not e!597972))))

(assert (=> b!1053045 (= res!702162 (validKeyInArray!0 (select (arr!31934 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!127805 () Bool)

(declare-fun res!702163 () Bool)

(assert (=> d!127805 (=> res!702163 e!597975)))

(assert (=> d!127805 (= res!702163 (bvsge #b00000000000000000000000000000000 (size!32470 a!3488)))))

(assert (=> d!127805 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22243) e!597975)))

(declare-fun b!1053046 () Bool)

(assert (=> b!1053046 (= e!597973 call!44727)))

(declare-fun b!1053047 () Bool)

(declare-fun contains!6160 (List!22246 (_ BitVec 64)) Bool)

(assert (=> b!1053047 (= e!597972 (contains!6160 Nil!22243 (select (arr!31934 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053048 () Bool)

(assert (=> b!1053048 (= e!597973 call!44727)))

(assert (= (and d!127805 (not res!702163)) b!1053045))

(assert (= (and b!1053045 res!702162) b!1053047))

(assert (= (and b!1053045 res!702164) b!1053044))

(assert (= (and b!1053044 c!106901) b!1053046))

(assert (= (and b!1053044 (not c!106901)) b!1053048))

(assert (= (or b!1053046 b!1053048) bm!44724))

(declare-fun m!973415 () Bool)

(assert (=> bm!44724 m!973415))

(declare-fun m!973417 () Bool)

(assert (=> bm!44724 m!973417))

(assert (=> b!1053044 m!973415))

(assert (=> b!1053044 m!973415))

(declare-fun m!973419 () Bool)

(assert (=> b!1053044 m!973419))

(assert (=> b!1053045 m!973415))

(assert (=> b!1053045 m!973415))

(assert (=> b!1053045 m!973419))

(assert (=> b!1053047 m!973415))

(assert (=> b!1053047 m!973415))

(declare-fun m!973421 () Bool)

(assert (=> b!1053047 m!973421))

(assert (=> b!1052988 d!127805))

(declare-fun d!127813 () Bool)

(declare-fun lt!465033 () (_ BitVec 32))

(assert (=> d!127813 (and (or (bvslt lt!465033 #b00000000000000000000000000000000) (bvsge lt!465033 (size!32470 lt!465024)) (and (bvsge lt!465033 #b00000000000000000000000000000000) (bvslt lt!465033 (size!32470 lt!465024)))) (bvsge lt!465033 #b00000000000000000000000000000000) (bvslt lt!465033 (size!32470 lt!465024)) (= (select (arr!31934 lt!465024) lt!465033) k0!2747))))

(declare-fun e!597985 () (_ BitVec 32))

(assert (=> d!127813 (= lt!465033 e!597985)))

(declare-fun c!106908 () Bool)

(assert (=> d!127813 (= c!106908 (= (select (arr!31934 lt!465024) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32470 lt!465024)) (bvslt (size!32470 lt!465024) #b01111111111111111111111111111111))))

(assert (=> d!127813 (= (arrayScanForKey!0 lt!465024 k0!2747 #b00000000000000000000000000000000) lt!465033)))

(declare-fun b!1053064 () Bool)

(assert (=> b!1053064 (= e!597985 #b00000000000000000000000000000000)))

(declare-fun b!1053065 () Bool)

(assert (=> b!1053065 (= e!597985 (arrayScanForKey!0 lt!465024 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127813 c!106908) b!1053064))

(assert (= (and d!127813 (not c!106908)) b!1053065))

(declare-fun m!973435 () Bool)

(assert (=> d!127813 m!973435))

(assert (=> d!127813 m!973403))

(declare-fun m!973437 () Bool)

(assert (=> b!1053065 m!973437))

(assert (=> b!1052986 d!127813))

(declare-fun d!127825 () Bool)

(assert (=> d!127825 (= (array_inv!24714 a!3488) (bvsge (size!32470 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92588 d!127825))

(declare-fun d!127827 () Bool)

(assert (=> d!127827 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1052990 d!127827))

(check-sat (not b!1053044) (not b!1053047) (not b!1053065) (not bm!44724) (not b!1053045) (not b!1053011))
(check-sat)
