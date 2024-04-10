; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119442 () Bool)

(assert start!119442)

(declare-fun b!1392029 () Bool)

(declare-fun res!931751 () Bool)

(declare-fun e!788255 () Bool)

(assert (=> b!1392029 (=> (not res!931751) (not e!788255))))

(declare-datatypes ((array!95226 0))(
  ( (array!95227 (arr!45974 (Array (_ BitVec 32) (_ BitVec 64))) (size!46524 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95226)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392029 (= res!931751 (validKeyInArray!0 (select (arr!45974 a!2901) j!112)))))

(declare-fun b!1392030 () Bool)

(declare-fun e!788258 () Bool)

(assert (=> b!1392030 (= e!788255 (not e!788258))))

(declare-fun res!931755 () Bool)

(assert (=> b!1392030 (=> res!931755 e!788258)))

(declare-datatypes ((SeekEntryResult!10291 0))(
  ( (MissingZero!10291 (index!43535 (_ BitVec 32))) (Found!10291 (index!43536 (_ BitVec 32))) (Intermediate!10291 (undefined!11103 Bool) (index!43537 (_ BitVec 32)) (x!125219 (_ BitVec 32))) (Undefined!10291) (MissingVacant!10291 (index!43538 (_ BitVec 32))) )
))
(declare-fun lt!611438 () SeekEntryResult!10291)

(assert (=> b!1392030 (= res!931755 (or (not (is-Intermediate!10291 lt!611438)) (undefined!11103 lt!611438)))))

(declare-fun e!788257 () Bool)

(assert (=> b!1392030 e!788257))

(declare-fun res!931754 () Bool)

(assert (=> b!1392030 (=> (not res!931754) (not e!788257))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95226 (_ BitVec 32)) Bool)

(assert (=> b!1392030 (= res!931754 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46586 0))(
  ( (Unit!46587) )
))
(declare-fun lt!611437 () Unit!46586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46586)

(assert (=> b!1392030 (= lt!611437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95226 (_ BitVec 32)) SeekEntryResult!10291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392030 (= lt!611438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) (select (arr!45974 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392031 () Bool)

(declare-fun res!931753 () Bool)

(assert (=> b!1392031 (=> (not res!931753) (not e!788255))))

(assert (=> b!1392031 (= res!931753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392032 () Bool)

(declare-fun lt!611439 () (_ BitVec 32))

(assert (=> b!1392032 (= e!788258 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611439 #b00000000000000000000000000000000) (bvslt lt!611439 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392032 (= lt!611439 (toIndex!0 (select (store (arr!45974 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392033 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95226 (_ BitVec 32)) SeekEntryResult!10291)

(assert (=> b!1392033 (= e!788257 (= (seekEntryOrOpen!0 (select (arr!45974 a!2901) j!112) a!2901 mask!2840) (Found!10291 j!112)))))

(declare-fun b!1392034 () Bool)

(declare-fun res!931750 () Bool)

(assert (=> b!1392034 (=> (not res!931750) (not e!788255))))

(assert (=> b!1392034 (= res!931750 (validKeyInArray!0 (select (arr!45974 a!2901) i!1037)))))

(declare-fun b!1392036 () Bool)

(declare-fun res!931756 () Bool)

(assert (=> b!1392036 (=> (not res!931756) (not e!788255))))

(assert (=> b!1392036 (= res!931756 (and (= (size!46524 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46524 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46524 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931749 () Bool)

(assert (=> start!119442 (=> (not res!931749) (not e!788255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119442 (= res!931749 (validMask!0 mask!2840))))

(assert (=> start!119442 e!788255))

(assert (=> start!119442 true))

(declare-fun array_inv!35002 (array!95226) Bool)

(assert (=> start!119442 (array_inv!35002 a!2901)))

(declare-fun b!1392035 () Bool)

(declare-fun res!931752 () Bool)

(assert (=> b!1392035 (=> (not res!931752) (not e!788255))))

(declare-datatypes ((List!32493 0))(
  ( (Nil!32490) (Cons!32489 (h!33716 (_ BitVec 64)) (t!47187 List!32493)) )
))
(declare-fun arrayNoDuplicates!0 (array!95226 (_ BitVec 32) List!32493) Bool)

(assert (=> b!1392035 (= res!931752 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32490))))

(assert (= (and start!119442 res!931749) b!1392036))

(assert (= (and b!1392036 res!931756) b!1392034))

(assert (= (and b!1392034 res!931750) b!1392029))

(assert (= (and b!1392029 res!931751) b!1392031))

(assert (= (and b!1392031 res!931753) b!1392035))

(assert (= (and b!1392035 res!931752) b!1392030))

(assert (= (and b!1392030 res!931754) b!1392033))

(assert (= (and b!1392030 (not res!931755)) b!1392032))

(declare-fun m!1277811 () Bool)

(assert (=> b!1392033 m!1277811))

(assert (=> b!1392033 m!1277811))

(declare-fun m!1277813 () Bool)

(assert (=> b!1392033 m!1277813))

(assert (=> b!1392030 m!1277811))

(declare-fun m!1277815 () Bool)

(assert (=> b!1392030 m!1277815))

(assert (=> b!1392030 m!1277811))

(declare-fun m!1277817 () Bool)

(assert (=> b!1392030 m!1277817))

(assert (=> b!1392030 m!1277815))

(assert (=> b!1392030 m!1277811))

(declare-fun m!1277819 () Bool)

(assert (=> b!1392030 m!1277819))

(declare-fun m!1277821 () Bool)

(assert (=> b!1392030 m!1277821))

(declare-fun m!1277823 () Bool)

(assert (=> start!119442 m!1277823))

(declare-fun m!1277825 () Bool)

(assert (=> start!119442 m!1277825))

(assert (=> b!1392029 m!1277811))

(assert (=> b!1392029 m!1277811))

(declare-fun m!1277827 () Bool)

(assert (=> b!1392029 m!1277827))

(declare-fun m!1277829 () Bool)

(assert (=> b!1392032 m!1277829))

(declare-fun m!1277831 () Bool)

(assert (=> b!1392032 m!1277831))

(assert (=> b!1392032 m!1277831))

(declare-fun m!1277833 () Bool)

(assert (=> b!1392032 m!1277833))

(declare-fun m!1277835 () Bool)

(assert (=> b!1392031 m!1277835))

(declare-fun m!1277837 () Bool)

(assert (=> b!1392034 m!1277837))

(assert (=> b!1392034 m!1277837))

(declare-fun m!1277839 () Bool)

(assert (=> b!1392034 m!1277839))

(declare-fun m!1277841 () Bool)

(assert (=> b!1392035 m!1277841))

(push 1)

(assert (not b!1392034))

(assert (not b!1392029))

(assert (not start!119442))

(assert (not b!1392031))

(assert (not b!1392035))

(assert (not b!1392033))

(assert (not b!1392030))

(assert (not b!1392032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1392124 () Bool)

(declare-fun e!788310 () SeekEntryResult!10291)

(declare-fun lt!611485 () SeekEntryResult!10291)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95226 (_ BitVec 32)) SeekEntryResult!10291)

(assert (=> b!1392124 (= e!788310 (seekKeyOrZeroReturnVacant!0 (x!125219 lt!611485) (index!43537 lt!611485) (index!43537 lt!611485) (select (arr!45974 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392125 () Bool)

(assert (=> b!1392125 (= e!788310 (MissingZero!10291 (index!43537 lt!611485)))))

(declare-fun d!150427 () Bool)

(declare-fun lt!611486 () SeekEntryResult!10291)

(assert (=> d!150427 (and (or (is-Undefined!10291 lt!611486) (not (is-Found!10291 lt!611486)) (and (bvsge (index!43536 lt!611486) #b00000000000000000000000000000000) (bvslt (index!43536 lt!611486) (size!46524 a!2901)))) (or (is-Undefined!10291 lt!611486) (is-Found!10291 lt!611486) (not (is-MissingZero!10291 lt!611486)) (and (bvsge (index!43535 lt!611486) #b00000000000000000000000000000000) (bvslt (index!43535 lt!611486) (size!46524 a!2901)))) (or (is-Undefined!10291 lt!611486) (is-Found!10291 lt!611486) (is-MissingZero!10291 lt!611486) (not (is-MissingVacant!10291 lt!611486)) (and (bvsge (index!43538 lt!611486) #b00000000000000000000000000000000) (bvslt (index!43538 lt!611486) (size!46524 a!2901)))) (or (is-Undefined!10291 lt!611486) (ite (is-Found!10291 lt!611486) (= (select (arr!45974 a!2901) (index!43536 lt!611486)) (select (arr!45974 a!2901) j!112)) (ite (is-MissingZero!10291 lt!611486) (= (select (arr!45974 a!2901) (index!43535 lt!611486)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10291 lt!611486) (= (select (arr!45974 a!2901) (index!43538 lt!611486)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!788311 () SeekEntryResult!10291)

(assert (=> d!150427 (= lt!611486 e!788311)))

(declare-fun c!129602 () Bool)

(assert (=> d!150427 (= c!129602 (and (is-Intermediate!10291 lt!611485) (undefined!11103 lt!611485)))))

(assert (=> d!150427 (= lt!611485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) (select (arr!45974 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150427 (validMask!0 mask!2840)))

(assert (=> d!150427 (= (seekEntryOrOpen!0 (select (arr!45974 a!2901) j!112) a!2901 mask!2840) lt!611486)))

(declare-fun b!1392126 () Bool)

(assert (=> b!1392126 (= e!788311 Undefined!10291)))

(declare-fun b!1392127 () Bool)

(declare-fun e!788312 () SeekEntryResult!10291)

(assert (=> b!1392127 (= e!788312 (Found!10291 (index!43537 lt!611485)))))

(declare-fun b!1392128 () Bool)

(assert (=> b!1392128 (= e!788311 e!788312)))

(declare-fun lt!611487 () (_ BitVec 64))

(assert (=> b!1392128 (= lt!611487 (select (arr!45974 a!2901) (index!43537 lt!611485)))))

(declare-fun c!129601 () Bool)

(assert (=> b!1392128 (= c!129601 (= lt!611487 (select (arr!45974 a!2901) j!112)))))

(declare-fun b!1392129 () Bool)

(declare-fun c!129603 () Bool)

(assert (=> b!1392129 (= c!129603 (= lt!611487 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392129 (= e!788312 e!788310)))

(assert (= (and d!150427 c!129602) b!1392126))

(assert (= (and d!150427 (not c!129602)) b!1392128))

(assert (= (and b!1392128 c!129601) b!1392127))

(assert (= (and b!1392128 (not c!129601)) b!1392129))

(assert (= (and b!1392129 c!129603) b!1392125))

(assert (= (and b!1392129 (not c!129603)) b!1392124))

(assert (=> b!1392124 m!1277811))

(declare-fun m!1277927 () Bool)

(assert (=> b!1392124 m!1277927))

(declare-fun m!1277929 () Bool)

(assert (=> d!150427 m!1277929))

(assert (=> d!150427 m!1277815))

(assert (=> d!150427 m!1277811))

(assert (=> d!150427 m!1277819))

(declare-fun m!1277931 () Bool)

(assert (=> d!150427 m!1277931))

(assert (=> d!150427 m!1277811))

(assert (=> d!150427 m!1277815))

(assert (=> d!150427 m!1277823))

(declare-fun m!1277933 () Bool)

(assert (=> d!150427 m!1277933))

(declare-fun m!1277935 () Bool)

(assert (=> b!1392128 m!1277935))

(assert (=> b!1392033 d!150427))

(declare-fun d!150447 () Bool)

(assert (=> d!150447 (= (validKeyInArray!0 (select (arr!45974 a!2901) j!112)) (and (not (= (select (arr!45974 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45974 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392029 d!150447))

(declare-fun d!150449 () Bool)

(assert (=> d!150449 (= (validKeyInArray!0 (select (arr!45974 a!2901) i!1037)) (and (not (= (select (arr!45974 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45974 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392034 d!150449))

(declare-fun b!1392150 () Bool)

(declare-fun e!788329 () Bool)

(declare-fun call!66772 () Bool)

(assert (=> b!1392150 (= e!788329 call!66772)))

(declare-fun b!1392151 () Bool)

(declare-fun e!788328 () Bool)

(assert (=> b!1392151 (= e!788328 call!66772)))

(declare-fun bm!66769 () Bool)

(assert (=> bm!66769 (= call!66772 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150451 () Bool)

(declare-fun res!931833 () Bool)

(declare-fun e!788330 () Bool)

(assert (=> d!150451 (=> res!931833 e!788330)))

(assert (=> d!150451 (= res!931833 (bvsge j!112 (size!46524 a!2901)))))

(assert (=> d!150451 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788330)))

(declare-fun b!1392152 () Bool)

(assert (=> b!1392152 (= e!788330 e!788329)))

(declare-fun c!129609 () Bool)

(assert (=> b!1392152 (= c!129609 (validKeyInArray!0 (select (arr!45974 a!2901) j!112)))))

(declare-fun b!1392153 () Bool)

(assert (=> b!1392153 (= e!788329 e!788328)))

(declare-fun lt!611503 () (_ BitVec 64))

(assert (=> b!1392153 (= lt!611503 (select (arr!45974 a!2901) j!112))))

(declare-fun lt!611505 () Unit!46586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95226 (_ BitVec 64) (_ BitVec 32)) Unit!46586)

(assert (=> b!1392153 (= lt!611505 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611503 j!112))))

(declare-fun arrayContainsKey!0 (array!95226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392153 (arrayContainsKey!0 a!2901 lt!611503 #b00000000000000000000000000000000)))

(declare-fun lt!611504 () Unit!46586)

(assert (=> b!1392153 (= lt!611504 lt!611505)))

(declare-fun res!931832 () Bool)

(assert (=> b!1392153 (= res!931832 (= (seekEntryOrOpen!0 (select (arr!45974 a!2901) j!112) a!2901 mask!2840) (Found!10291 j!112)))))

(assert (=> b!1392153 (=> (not res!931832) (not e!788328))))

(assert (= (and d!150451 (not res!931833)) b!1392152))

(assert (= (and b!1392152 c!129609) b!1392153))

(assert (= (and b!1392152 (not c!129609)) b!1392150))

(assert (= (and b!1392153 res!931832) b!1392151))

(assert (= (or b!1392151 b!1392150) bm!66769))

(declare-fun m!1277943 () Bool)

(assert (=> bm!66769 m!1277943))

(assert (=> b!1392152 m!1277811))

(assert (=> b!1392152 m!1277811))

(assert (=> b!1392152 m!1277827))

(assert (=> b!1392153 m!1277811))

(declare-fun m!1277945 () Bool)

(assert (=> b!1392153 m!1277945))

(declare-fun m!1277947 () Bool)

(assert (=> b!1392153 m!1277947))

(assert (=> b!1392153 m!1277811))

(assert (=> b!1392153 m!1277813))

(assert (=> b!1392030 d!150451))

(declare-fun d!150455 () Bool)

(assert (=> d!150455 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611517 () Unit!46586)

(declare-fun choose!38 (array!95226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46586)

(assert (=> d!150455 (= lt!611517 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150455 (validMask!0 mask!2840)))

(assert (=> d!150455 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611517)))

(declare-fun bs!40500 () Bool)

(assert (= bs!40500 d!150455))

(assert (=> bs!40500 m!1277821))

(declare-fun m!1277951 () Bool)

(assert (=> bs!40500 m!1277951))

(assert (=> bs!40500 m!1277823))

(assert (=> b!1392030 d!150455))

(declare-fun b!1392225 () Bool)

(declare-fun e!788374 () SeekEntryResult!10291)

(declare-fun e!788371 () SeekEntryResult!10291)

(assert (=> b!1392225 (= e!788374 e!788371)))

(declare-fun lt!611543 () (_ BitVec 64))

(declare-fun c!129637 () Bool)

(assert (=> b!1392225 (= c!129637 (or (= lt!611543 (select (arr!45974 a!2901) j!112)) (= (bvadd lt!611543 lt!611543) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392226 () Bool)

(assert (=> b!1392226 (= e!788371 (Intermediate!10291 false (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392227 () Bool)

(declare-fun e!788375 () Bool)

(declare-fun e!788373 () Bool)

(assert (=> b!1392227 (= e!788375 e!788373)))

(declare-fun res!931854 () Bool)

(declare-fun lt!611542 () SeekEntryResult!10291)

(assert (=> b!1392227 (= res!931854 (and (is-Intermediate!10291 lt!611542) (not (undefined!11103 lt!611542)) (bvslt (x!125219 lt!611542) #b01111111111111111111111111111110) (bvsge (x!125219 lt!611542) #b00000000000000000000000000000000) (bvsge (x!125219 lt!611542) #b00000000000000000000000000000000)))))

(assert (=> b!1392227 (=> (not res!931854) (not e!788373))))

(declare-fun b!1392228 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392228 (= e!788371 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45974 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392230 () Bool)

(assert (=> b!1392230 (= e!788374 (Intermediate!10291 true (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392231 () Bool)

(assert (=> b!1392231 (and (bvsge (index!43537 lt!611542) #b00000000000000000000000000000000) (bvslt (index!43537 lt!611542) (size!46524 a!2901)))))

(declare-fun res!931853 () Bool)

(assert (=> b!1392231 (= res!931853 (= (select (arr!45974 a!2901) (index!43537 lt!611542)) (select (arr!45974 a!2901) j!112)))))

(declare-fun e!788372 () Bool)

(assert (=> b!1392231 (=> res!931853 e!788372)))

(assert (=> b!1392231 (= e!788373 e!788372)))

(declare-fun b!1392232 () Bool)

(assert (=> b!1392232 (= e!788375 (bvsge (x!125219 lt!611542) #b01111111111111111111111111111110))))

(declare-fun b!1392233 () Bool)

(assert (=> b!1392233 (and (bvsge (index!43537 lt!611542) #b00000000000000000000000000000000) (bvslt (index!43537 lt!611542) (size!46524 a!2901)))))

(assert (=> b!1392233 (= e!788372 (= (select (arr!45974 a!2901) (index!43537 lt!611542)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!150459 () Bool)

(assert (=> d!150459 e!788375))

(declare-fun c!129636 () Bool)

(assert (=> d!150459 (= c!129636 (and (is-Intermediate!10291 lt!611542) (undefined!11103 lt!611542)))))

(assert (=> d!150459 (= lt!611542 e!788374)))

(declare-fun c!129638 () Bool)

(assert (=> d!150459 (= c!129638 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150459 (= lt!611543 (select (arr!45974 a!2901) (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840)))))

(assert (=> d!150459 (validMask!0 mask!2840)))

(assert (=> d!150459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) (select (arr!45974 a!2901) j!112) a!2901 mask!2840) lt!611542)))

(declare-fun b!1392229 () Bool)

(assert (=> b!1392229 (and (bvsge (index!43537 lt!611542) #b00000000000000000000000000000000) (bvslt (index!43537 lt!611542) (size!46524 a!2901)))))

(declare-fun res!931855 () Bool)

(assert (=> b!1392229 (= res!931855 (= (select (arr!45974 a!2901) (index!43537 lt!611542)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392229 (=> res!931855 e!788372)))

(assert (= (and d!150459 c!129638) b!1392230))

(assert (= (and d!150459 (not c!129638)) b!1392225))

(assert (= (and b!1392225 c!129637) b!1392226))

(assert (= (and b!1392225 (not c!129637)) b!1392228))

(assert (= (and d!150459 c!129636) b!1392232))

(assert (= (and d!150459 (not c!129636)) b!1392227))

(assert (= (and b!1392227 res!931854) b!1392231))

(assert (= (and b!1392231 (not res!931853)) b!1392229))

(assert (= (and b!1392229 (not res!931855)) b!1392233))

(declare-fun m!1277987 () Bool)

(assert (=> b!1392231 m!1277987))

(assert (=> b!1392229 m!1277987))

(assert (=> d!150459 m!1277815))

(declare-fun m!1277989 () Bool)

(assert (=> d!150459 m!1277989))

(assert (=> d!150459 m!1277823))

(assert (=> b!1392228 m!1277815))

(declare-fun m!1277991 () Bool)

(assert (=> b!1392228 m!1277991))

(assert (=> b!1392228 m!1277991))

(assert (=> b!1392228 m!1277811))

(declare-fun m!1277993 () Bool)

(assert (=> b!1392228 m!1277993))

(assert (=> b!1392233 m!1277987))

(assert (=> b!1392030 d!150459))

(declare-fun d!150475 () Bool)

(declare-fun lt!611553 () (_ BitVec 32))

(declare-fun lt!611552 () (_ BitVec 32))

(assert (=> d!150475 (= lt!611553 (bvmul (bvxor lt!611552 (bvlshr lt!611552 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150475 (= lt!611552 ((_ extract 31 0) (bvand (bvxor (select (arr!45974 a!2901) j!112) (bvlshr (select (arr!45974 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150475 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931856 (let ((h!33721 ((_ extract 31 0) (bvand (bvxor (select (arr!45974 a!2901) j!112) (bvlshr (select (arr!45974 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125226 (bvmul (bvxor h!33721 (bvlshr h!33721 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125226 (bvlshr x!125226 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931856 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931856 #b00000000000000000000000000000000))))))

(assert (=> d!150475 (= (toIndex!0 (select (arr!45974 a!2901) j!112) mask!2840) (bvand (bvxor lt!611553 (bvlshr lt!611553 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392030 d!150475))

(declare-fun b!1392271 () Bool)

(declare-fun e!788400 () Bool)

(declare-fun contains!9769 (List!32493 (_ BitVec 64)) Bool)

(assert (=> b!1392271 (= e!788400 (contains!9769 Nil!32490 (select (arr!45974 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150477 () Bool)

(declare-fun res!931872 () Bool)

(declare-fun e!788401 () Bool)

(assert (=> d!150477 (=> res!931872 e!788401)))

(assert (=> d!150477 (= res!931872 (bvsge #b00000000000000000000000000000000 (size!46524 a!2901)))))

(assert (=> d!150477 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32490) e!788401)))

(declare-fun b!1392272 () Bool)

(declare-fun e!788402 () Bool)

(assert (=> b!1392272 (= e!788401 e!788402)))

(declare-fun res!931873 () Bool)

(assert (=> b!1392272 (=> (not res!931873) (not e!788402))))

(assert (=> b!1392272 (= res!931873 (not e!788400))))

(declare-fun res!931874 () Bool)

(assert (=> b!1392272 (=> (not res!931874) (not e!788400))))

(assert (=> b!1392272 (= res!931874 (validKeyInArray!0 (select (arr!45974 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392273 () Bool)

(declare-fun e!788399 () Bool)

(declare-fun call!66777 () Bool)

(assert (=> b!1392273 (= e!788399 call!66777)))

(declare-fun b!1392274 () Bool)

(assert (=> b!1392274 (= e!788402 e!788399)))

(declare-fun c!129650 () Bool)

(assert (=> b!1392274 (= c!129650 (validKeyInArray!0 (select (arr!45974 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66774 () Bool)

(assert (=> bm!66774 (= call!66777 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129650 (Cons!32489 (select (arr!45974 a!2901) #b00000000000000000000000000000000) Nil!32490) Nil!32490)))))

(declare-fun b!1392275 () Bool)

(assert (=> b!1392275 (= e!788399 call!66777)))

(assert (= (and d!150477 (not res!931872)) b!1392272))

(assert (= (and b!1392272 res!931874) b!1392271))

(assert (= (and b!1392272 res!931873) b!1392274))

(assert (= (and b!1392274 c!129650) b!1392275))

(assert (= (and b!1392274 (not c!129650)) b!1392273))

(assert (= (or b!1392275 b!1392273) bm!66774))

(declare-fun m!1278003 () Bool)

(assert (=> b!1392271 m!1278003))

(assert (=> b!1392271 m!1278003))

(declare-fun m!1278005 () Bool)

(assert (=> b!1392271 m!1278005))

(assert (=> b!1392272 m!1278003))

(assert (=> b!1392272 m!1278003))

(declare-fun m!1278007 () Bool)

(assert (=> b!1392272 m!1278007))

(assert (=> b!1392274 m!1278003))

(assert (=> b!1392274 m!1278003))

(assert (=> b!1392274 m!1278007))

(assert (=> bm!66774 m!1278003))

(declare-fun m!1278009 () Bool)

(assert (=> bm!66774 m!1278009))

(assert (=> b!1392035 d!150477))

(declare-fun d!150485 () Bool)

(declare-fun lt!611559 () (_ BitVec 32))

(declare-fun lt!611558 () (_ BitVec 32))

(assert (=> d!150485 (= lt!611559 (bvmul (bvxor lt!611558 (bvlshr lt!611558 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150485 (= lt!611558 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45974 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45974 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150485 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931856 (let ((h!33721 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45974 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45974 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125226 (bvmul (bvxor h!33721 (bvlshr h!33721 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125226 (bvlshr x!125226 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931856 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931856 #b00000000000000000000000000000000))))))

(assert (=> d!150485 (= (toIndex!0 (select (store (arr!45974 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611559 (bvlshr lt!611559 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392032 d!150485))

(declare-fun d!150487 () Bool)

(assert (=> d!150487 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119442 d!150487))

(declare-fun d!150489 () Bool)

(assert (=> d!150489 (= (array_inv!35002 a!2901) (bvsge (size!46524 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119442 d!150489))

(declare-fun b!1392309 () Bool)

(declare-fun e!788425 () Bool)

(declare-fun call!66781 () Bool)

(assert (=> b!1392309 (= e!788425 call!66781)))

(declare-fun b!1392310 () Bool)

(declare-fun e!788424 () Bool)

(assert (=> b!1392310 (= e!788424 call!66781)))

(declare-fun bm!66778 () Bool)

(assert (=> bm!66778 (= call!66781 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150491 () Bool)

(declare-fun res!931885 () Bool)

(declare-fun e!788426 () Bool)

(assert (=> d!150491 (=> res!931885 e!788426)))

(assert (=> d!150491 (= res!931885 (bvsge #b00000000000000000000000000000000 (size!46524 a!2901)))))

(assert (=> d!150491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788426)))

(declare-fun b!1392311 () Bool)

(assert (=> b!1392311 (= e!788426 e!788425)))

(declare-fun c!129663 () Bool)

(assert (=> b!1392311 (= c!129663 (validKeyInArray!0 (select (arr!45974 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392312 () Bool)

(assert (=> b!1392312 (= e!788425 e!788424)))

(declare-fun lt!611569 () (_ BitVec 64))

(assert (=> b!1392312 (= lt!611569 (select (arr!45974 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611571 () Unit!46586)

(assert (=> b!1392312 (= lt!611571 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611569 #b00000000000000000000000000000000))))

(assert (=> b!1392312 (arrayContainsKey!0 a!2901 lt!611569 #b00000000000000000000000000000000)))

(declare-fun lt!611570 () Unit!46586)

(assert (=> b!1392312 (= lt!611570 lt!611571)))

(declare-fun res!931884 () Bool)

(assert (=> b!1392312 (= res!931884 (= (seekEntryOrOpen!0 (select (arr!45974 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10291 #b00000000000000000000000000000000)))))

(assert (=> b!1392312 (=> (not res!931884) (not e!788424))))

(assert (= (and d!150491 (not res!931885)) b!1392311))

(assert (= (and b!1392311 c!129663) b!1392312))

(assert (= (and b!1392311 (not c!129663)) b!1392309))

(assert (= (and b!1392312 res!931884) b!1392310))

(assert (= (or b!1392310 b!1392309) bm!66778))

(declare-fun m!1278025 () Bool)

(assert (=> bm!66778 m!1278025))

(assert (=> b!1392311 m!1278003))

(assert (=> b!1392311 m!1278003))

(assert (=> b!1392311 m!1278007))

(assert (=> b!1392312 m!1278003))

(declare-fun m!1278027 () Bool)

(assert (=> b!1392312 m!1278027))

(declare-fun m!1278029 () Bool)

(assert (=> b!1392312 m!1278029))

(assert (=> b!1392312 m!1278003))

(declare-fun m!1278031 () Bool)

(assert (=> b!1392312 m!1278031))

(assert (=> b!1392031 d!150491))

(push 1)

(assert (not bm!66774))

(assert (not b!1392272))

(assert (not b!1392311))

(assert (not d!150459))

(assert (not b!1392152))

(assert (not d!150427))

(assert (not b!1392274))

(assert (not bm!66769))

(assert (not b!1392271))

(assert (not b!1392153))

(assert (not bm!66778))

(assert (not b!1392228))

(assert (not b!1392312))

(assert (not d!150455))

(assert (not b!1392124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

