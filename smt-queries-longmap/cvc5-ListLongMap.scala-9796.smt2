; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116300 () Bool)

(assert start!116300)

(declare-fun b!1372992 () Bool)

(declare-fun res!916261 () Bool)

(declare-fun e!777749 () Bool)

(assert (=> b!1372992 (=> (not res!916261) (not e!777749))))

(declare-datatypes ((List!32037 0))(
  ( (Nil!32034) (Cons!32033 (h!33242 (_ BitVec 64)) (t!46731 List!32037)) )
))
(declare-fun acc!866 () List!32037)

(declare-fun contains!9719 (List!32037 (_ BitVec 64)) Bool)

(assert (=> b!1372992 (= res!916261 (not (contains!9719 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372993 () Bool)

(declare-fun res!916265 () Bool)

(assert (=> b!1372993 (=> (not res!916265) (not e!777749))))

(declare-fun noDuplicate!2576 (List!32037) Bool)

(assert (=> b!1372993 (= res!916265 (noDuplicate!2576 acc!866))))

(declare-fun b!1372994 () Bool)

(declare-fun e!777750 () Bool)

(assert (=> b!1372994 (= e!777749 e!777750)))

(declare-fun res!916260 () Bool)

(assert (=> b!1372994 (=> (not res!916260) (not e!777750))))

(declare-datatypes ((array!93117 0))(
  ( (array!93118 (arr!44969 (Array (_ BitVec 32) (_ BitVec 64))) (size!45519 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93117)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93117 (_ BitVec 32) List!32037) Bool)

(assert (=> b!1372994 (= res!916260 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45375 0))(
  ( (Unit!45376) )
))
(declare-fun lt!602992 () Unit!45375)

(declare-fun newAcc!98 () List!32037)

(declare-fun noDuplicateSubseq!308 (List!32037 List!32037) Unit!45375)

(assert (=> b!1372994 (= lt!602992 (noDuplicateSubseq!308 newAcc!98 acc!866))))

(declare-fun b!1372995 () Bool)

(declare-fun res!916266 () Bool)

(assert (=> b!1372995 (=> (not res!916266) (not e!777750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1372995 (= res!916266 (not (validKeyInArray!0 (select (arr!44969 a!3861) from!3239))))))

(declare-fun b!1372996 () Bool)

(declare-fun res!916268 () Bool)

(assert (=> b!1372996 (=> (not res!916268) (not e!777750))))

(assert (=> b!1372996 (= res!916268 (bvslt from!3239 (size!45519 a!3861)))))

(declare-fun b!1372997 () Bool)

(declare-fun res!916267 () Bool)

(assert (=> b!1372997 (=> (not res!916267) (not e!777749))))

(assert (=> b!1372997 (= res!916267 (not (contains!9719 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372999 () Bool)

(declare-fun res!916269 () Bool)

(assert (=> b!1372999 (=> (not res!916269) (not e!777750))))

(assert (=> b!1372999 (= res!916269 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1373000 () Bool)

(declare-fun res!916262 () Bool)

(assert (=> b!1373000 (=> (not res!916262) (not e!777749))))

(assert (=> b!1373000 (= res!916262 (not (contains!9719 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373001 () Bool)

(assert (=> b!1373001 (= e!777750 (not (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866)))))

(declare-fun b!1373002 () Bool)

(declare-fun res!916263 () Bool)

(assert (=> b!1373002 (=> (not res!916263) (not e!777749))))

(declare-fun subseq!1121 (List!32037 List!32037) Bool)

(assert (=> b!1373002 (= res!916263 (subseq!1121 newAcc!98 acc!866))))

(declare-fun res!916270 () Bool)

(assert (=> start!116300 (=> (not res!916270) (not e!777749))))

(assert (=> start!116300 (= res!916270 (and (bvslt (size!45519 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45519 a!3861))))))

(assert (=> start!116300 e!777749))

(declare-fun array_inv!33997 (array!93117) Bool)

(assert (=> start!116300 (array_inv!33997 a!3861)))

(assert (=> start!116300 true))

(declare-fun b!1372998 () Bool)

(declare-fun res!916264 () Bool)

(assert (=> b!1372998 (=> (not res!916264) (not e!777749))))

(assert (=> b!1372998 (= res!916264 (not (contains!9719 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116300 res!916270) b!1372993))

(assert (= (and b!1372993 res!916265) b!1372992))

(assert (= (and b!1372992 res!916261) b!1372998))

(assert (= (and b!1372998 res!916264) b!1373000))

(assert (= (and b!1373000 res!916262) b!1372997))

(assert (= (and b!1372997 res!916267) b!1373002))

(assert (= (and b!1373002 res!916263) b!1372994))

(assert (= (and b!1372994 res!916260) b!1372996))

(assert (= (and b!1372996 res!916268) b!1372995))

(assert (= (and b!1372995 res!916266) b!1372999))

(assert (= (and b!1372999 res!916269) b!1373001))

(declare-fun m!1256341 () Bool)

(assert (=> b!1372992 m!1256341))

(declare-fun m!1256343 () Bool)

(assert (=> b!1372995 m!1256343))

(assert (=> b!1372995 m!1256343))

(declare-fun m!1256345 () Bool)

(assert (=> b!1372995 m!1256345))

(declare-fun m!1256347 () Bool)

(assert (=> b!1372998 m!1256347))

(declare-fun m!1256349 () Bool)

(assert (=> start!116300 m!1256349))

(declare-fun m!1256351 () Bool)

(assert (=> b!1372993 m!1256351))

(declare-fun m!1256353 () Bool)

(assert (=> b!1372997 m!1256353))

(declare-fun m!1256355 () Bool)

(assert (=> b!1373001 m!1256355))

(declare-fun m!1256357 () Bool)

(assert (=> b!1372994 m!1256357))

(declare-fun m!1256359 () Bool)

(assert (=> b!1372994 m!1256359))

(declare-fun m!1256361 () Bool)

(assert (=> b!1373002 m!1256361))

(declare-fun m!1256363 () Bool)

(assert (=> b!1373000 m!1256363))

(push 1)

(assert (not b!1373001))

(assert (not b!1372993))

(assert (not b!1372995))

(assert (not b!1372997))

(assert (not b!1372994))

(assert (not b!1373000))

(assert (not b!1373002))

(assert (not b!1372992))

(assert (not b!1372998))

(assert (not start!116300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147887 () Bool)

(declare-fun res!916350 () Bool)

(declare-fun e!777786 () Bool)

(assert (=> d!147887 (=> res!916350 e!777786)))

(assert (=> d!147887 (= res!916350 (is-Nil!32034 acc!866))))

(assert (=> d!147887 (= (noDuplicate!2576 acc!866) e!777786)))

(declare-fun b!1373088 () Bool)

(declare-fun e!777787 () Bool)

(assert (=> b!1373088 (= e!777786 e!777787)))

(declare-fun res!916351 () Bool)

(assert (=> b!1373088 (=> (not res!916351) (not e!777787))))

(assert (=> b!1373088 (= res!916351 (not (contains!9719 (t!46731 acc!866) (h!33242 acc!866))))))

(declare-fun b!1373089 () Bool)

(assert (=> b!1373089 (= e!777787 (noDuplicate!2576 (t!46731 acc!866)))))

(assert (= (and d!147887 (not res!916350)) b!1373088))

(assert (= (and b!1373088 res!916351) b!1373089))

(declare-fun m!1256417 () Bool)

(assert (=> b!1373088 m!1256417))

(declare-fun m!1256419 () Bool)

(assert (=> b!1373089 m!1256419))

(assert (=> b!1372993 d!147887))

(declare-fun d!147893 () Bool)

(declare-fun lt!603007 () Bool)

(declare-fun content!748 (List!32037) (Set (_ BitVec 64)))

(assert (=> d!147893 (= lt!603007 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!748 acc!866)))))

(declare-fun e!777801 () Bool)

(assert (=> d!147893 (= lt!603007 e!777801)))

(declare-fun res!916365 () Bool)

(assert (=> d!147893 (=> (not res!916365) (not e!777801))))

(assert (=> d!147893 (= res!916365 (is-Cons!32033 acc!866))))

(assert (=> d!147893 (= (contains!9719 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603007)))

(declare-fun b!1373103 () Bool)

(declare-fun e!777802 () Bool)

(assert (=> b!1373103 (= e!777801 e!777802)))

(declare-fun res!916366 () Bool)

(assert (=> b!1373103 (=> res!916366 e!777802)))

(assert (=> b!1373103 (= res!916366 (= (h!33242 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373104 () Bool)

(assert (=> b!1373104 (= e!777802 (contains!9719 (t!46731 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147893 res!916365) b!1373103))

(assert (= (and b!1373103 (not res!916366)) b!1373104))

(declare-fun m!1256427 () Bool)

(assert (=> d!147893 m!1256427))

(declare-fun m!1256431 () Bool)

(assert (=> d!147893 m!1256431))

(declare-fun m!1256435 () Bool)

(assert (=> b!1373104 m!1256435))

(assert (=> b!1372998 d!147893))

(declare-fun d!147899 () Bool)

(assert (=> d!147899 (= (array_inv!33997 a!3861) (bvsge (size!45519 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116300 d!147899))

(declare-fun b!1373141 () Bool)

(declare-fun e!777837 () Bool)

(declare-fun e!777839 () Bool)

(assert (=> b!1373141 (= e!777837 e!777839)))

(declare-fun c!127811 () Bool)

(assert (=> b!1373141 (= c!127811 (validKeyInArray!0 (select (arr!44969 a!3861) from!3239)))))

(declare-fun d!147901 () Bool)

(declare-fun res!916400 () Bool)

(declare-fun e!777838 () Bool)

(assert (=> d!147901 (=> res!916400 e!777838)))

(assert (=> d!147901 (= res!916400 (bvsge from!3239 (size!45519 a!3861)))))

(assert (=> d!147901 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777838)))

(declare-fun bm!65603 () Bool)

(declare-fun call!65606 () Bool)

(assert (=> bm!65603 (= call!65606 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127811 (Cons!32033 (select (arr!44969 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1373142 () Bool)

(assert (=> b!1373142 (= e!777839 call!65606)))

(declare-fun b!1373143 () Bool)

(assert (=> b!1373143 (= e!777839 call!65606)))

(declare-fun b!1373144 () Bool)

(declare-fun e!777840 () Bool)

(assert (=> b!1373144 (= e!777840 (contains!9719 acc!866 (select (arr!44969 a!3861) from!3239)))))

(declare-fun b!1373145 () Bool)

(assert (=> b!1373145 (= e!777838 e!777837)))

(declare-fun res!916401 () Bool)

(assert (=> b!1373145 (=> (not res!916401) (not e!777837))))

(assert (=> b!1373145 (= res!916401 (not e!777840))))

(declare-fun res!916399 () Bool)

(assert (=> b!1373145 (=> (not res!916399) (not e!777840))))

(assert (=> b!1373145 (= res!916399 (validKeyInArray!0 (select (arr!44969 a!3861) from!3239)))))

(assert (= (and d!147901 (not res!916400)) b!1373145))

(assert (= (and b!1373145 res!916399) b!1373144))

(assert (= (and b!1373145 res!916401) b!1373141))

(assert (= (and b!1373141 c!127811) b!1373142))

(assert (= (and b!1373141 (not c!127811)) b!1373143))

(assert (= (or b!1373142 b!1373143) bm!65603))

(assert (=> b!1373141 m!1256343))

(assert (=> b!1373141 m!1256343))

(assert (=> b!1373141 m!1256345))

(assert (=> bm!65603 m!1256343))

(declare-fun m!1256447 () Bool)

(assert (=> bm!65603 m!1256447))

(assert (=> b!1373144 m!1256343))

(assert (=> b!1373144 m!1256343))

(declare-fun m!1256449 () Bool)

(assert (=> b!1373144 m!1256449))

(assert (=> b!1373145 m!1256343))

(assert (=> b!1373145 m!1256343))

(assert (=> b!1373145 m!1256345))

(assert (=> b!1372994 d!147901))

(declare-fun d!147911 () Bool)

(assert (=> d!147911 (noDuplicate!2576 newAcc!98)))

(declare-fun lt!603013 () Unit!45375)

(declare-fun choose!2023 (List!32037 List!32037) Unit!45375)

(assert (=> d!147911 (= lt!603013 (choose!2023 newAcc!98 acc!866))))

(declare-fun e!777863 () Bool)

(assert (=> d!147911 e!777863))

(declare-fun res!916421 () Bool)

(assert (=> d!147911 (=> (not res!916421) (not e!777863))))

(assert (=> d!147911 (= res!916421 (subseq!1121 newAcc!98 acc!866))))

(assert (=> d!147911 (= (noDuplicateSubseq!308 newAcc!98 acc!866) lt!603013)))

(declare-fun b!1373171 () Bool)

(assert (=> b!1373171 (= e!777863 (noDuplicate!2576 acc!866))))

(assert (= (and d!147911 res!916421) b!1373171))

(declare-fun m!1256463 () Bool)

(assert (=> d!147911 m!1256463))

(declare-fun m!1256465 () Bool)

(assert (=> d!147911 m!1256465))

(assert (=> d!147911 m!1256361))

(assert (=> b!1373171 m!1256351))

(assert (=> b!1372994 d!147911))

(declare-fun d!147917 () Bool)

(assert (=> d!147917 (= (validKeyInArray!0 (select (arr!44969 a!3861) from!3239)) (and (not (= (select (arr!44969 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44969 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1372995 d!147917))

(declare-fun d!147919 () Bool)

(declare-fun lt!603014 () Bool)

(assert (=> d!147919 (= lt!603014 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!748 newAcc!98)))))

(declare-fun e!777870 () Bool)

(assert (=> d!147919 (= lt!603014 e!777870)))

(declare-fun res!916427 () Bool)

(assert (=> d!147919 (=> (not res!916427) (not e!777870))))

(assert (=> d!147919 (= res!916427 (is-Cons!32033 newAcc!98))))

(assert (=> d!147919 (= (contains!9719 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603014)))

(declare-fun b!1373179 () Bool)

(declare-fun e!777871 () Bool)

(assert (=> b!1373179 (= e!777870 e!777871)))

(declare-fun res!916428 () Bool)

(assert (=> b!1373179 (=> res!916428 e!777871)))

(assert (=> b!1373179 (= res!916428 (= (h!33242 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373180 () Bool)

(assert (=> b!1373180 (= e!777871 (contains!9719 (t!46731 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147919 res!916427) b!1373179))

(assert (= (and b!1373179 (not res!916428)) b!1373180))

(declare-fun m!1256477 () Bool)

(assert (=> d!147919 m!1256477))

(declare-fun m!1256479 () Bool)

(assert (=> d!147919 m!1256479))

(declare-fun m!1256481 () Bool)

(assert (=> b!1373180 m!1256481))

(assert (=> b!1373000 d!147919))

(declare-fun b!1373185 () Bool)

(declare-fun e!777876 () Bool)

(declare-fun e!777878 () Bool)

(assert (=> b!1373185 (= e!777876 e!777878)))

(declare-fun c!127816 () Bool)

(assert (=> b!1373185 (= c!127816 (validKeyInArray!0 (select (arr!44969 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147923 () Bool)

(declare-fun res!916434 () Bool)

(declare-fun e!777877 () Bool)

(assert (=> d!147923 (=> res!916434 e!777877)))

(assert (=> d!147923 (= res!916434 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45519 a!3861)))))

(assert (=> d!147923 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!777877)))

(declare-fun call!65611 () Bool)

(declare-fun bm!65608 () Bool)

(assert (=> bm!65608 (= call!65611 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127816 (Cons!32033 (select (arr!44969 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun b!1373186 () Bool)

(assert (=> b!1373186 (= e!777878 call!65611)))

(declare-fun b!1373187 () Bool)

(assert (=> b!1373187 (= e!777878 call!65611)))

(declare-fun e!777879 () Bool)

(declare-fun b!1373188 () Bool)

(assert (=> b!1373188 (= e!777879 (contains!9719 acc!866 (select (arr!44969 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1373189 () Bool)

(assert (=> b!1373189 (= e!777877 e!777876)))

(declare-fun res!916435 () Bool)

(assert (=> b!1373189 (=> (not res!916435) (not e!777876))))

(assert (=> b!1373189 (= res!916435 (not e!777879))))

(declare-fun res!916433 () Bool)

(assert (=> b!1373189 (=> (not res!916433) (not e!777879))))

(assert (=> b!1373189 (= res!916433 (validKeyInArray!0 (select (arr!44969 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147923 (not res!916434)) b!1373189))

(assert (= (and b!1373189 res!916433) b!1373188))

(assert (= (and b!1373189 res!916435) b!1373185))

(assert (= (and b!1373185 c!127816) b!1373186))

(assert (= (and b!1373185 (not c!127816)) b!1373187))

(assert (= (or b!1373186 b!1373187) bm!65608))

(declare-fun m!1256495 () Bool)

(assert (=> b!1373185 m!1256495))

(assert (=> b!1373185 m!1256495))

(declare-fun m!1256497 () Bool)

(assert (=> b!1373185 m!1256497))

(assert (=> bm!65608 m!1256495))

(declare-fun m!1256499 () Bool)

(assert (=> bm!65608 m!1256499))

(assert (=> b!1373188 m!1256495))

(assert (=> b!1373188 m!1256495))

(declare-fun m!1256501 () Bool)

(assert (=> b!1373188 m!1256501))

(assert (=> b!1373189 m!1256495))

(assert (=> b!1373189 m!1256495))

(assert (=> b!1373189 m!1256497))

(assert (=> b!1373001 d!147923))

(declare-fun d!147933 () Bool)

(declare-fun lt!603018 () Bool)

(assert (=> d!147933 (= lt!603018 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!748 newAcc!98)))))

(declare-fun e!777882 () Bool)

(assert (=> d!147933 (= lt!603018 e!777882)))

(declare-fun res!916438 () Bool)

(assert (=> d!147933 (=> (not res!916438) (not e!777882))))

(assert (=> d!147933 (= res!916438 (is-Cons!32033 newAcc!98))))

(assert (=> d!147933 (= (contains!9719 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603018)))

(declare-fun b!1373192 () Bool)

(declare-fun e!777883 () Bool)

(assert (=> b!1373192 (= e!777882 e!777883)))

(declare-fun res!916439 () Bool)

(assert (=> b!1373192 (=> res!916439 e!777883)))

(assert (=> b!1373192 (= res!916439 (= (h!33242 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373193 () Bool)

(assert (=> b!1373193 (= e!777883 (contains!9719 (t!46731 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147933 res!916438) b!1373192))

(assert (= (and b!1373192 (not res!916439)) b!1373193))

(assert (=> d!147933 m!1256477))

(declare-fun m!1256509 () Bool)

(assert (=> d!147933 m!1256509))

(declare-fun m!1256511 () Bool)

(assert (=> b!1373193 m!1256511))

(assert (=> b!1372997 d!147933))

(declare-fun d!147937 () Bool)

(declare-fun res!916465 () Bool)

(declare-fun e!777909 () Bool)

(assert (=> d!147937 (=> res!916465 e!777909)))

