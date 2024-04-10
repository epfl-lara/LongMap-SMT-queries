; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120904 () Bool)

(assert start!120904)

(declare-fun b!1406800 () Bool)

(declare-fun res!945024 () Bool)

(declare-fun e!796220 () Bool)

(assert (=> b!1406800 (=> (not res!945024) (not e!796220))))

(declare-datatypes ((array!96211 0))(
  ( (array!96212 (arr!46453 (Array (_ BitVec 32) (_ BitVec 64))) (size!47003 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96211)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96211 (_ BitVec 32)) Bool)

(assert (=> b!1406800 (= res!945024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406801 () Bool)

(declare-fun res!945018 () Bool)

(assert (=> b!1406801 (=> (not res!945018) (not e!796220))))

(declare-datatypes ((List!32972 0))(
  ( (Nil!32969) (Cons!32968 (h!34222 (_ BitVec 64)) (t!47666 List!32972)) )
))
(declare-fun arrayNoDuplicates!0 (array!96211 (_ BitVec 32) List!32972) Bool)

(assert (=> b!1406801 (= res!945018 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32969))))

(declare-fun b!1406802 () Bool)

(declare-fun res!945019 () Bool)

(assert (=> b!1406802 (=> (not res!945019) (not e!796220))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406802 (= res!945019 (and (= (size!47003 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47003 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47003 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!796219 () Bool)

(declare-fun b!1406803 () Bool)

(declare-datatypes ((SeekEntryResult!10764 0))(
  ( (MissingZero!10764 (index!45433 (_ BitVec 32))) (Found!10764 (index!45434 (_ BitVec 32))) (Intermediate!10764 (undefined!11576 Bool) (index!45435 (_ BitVec 32)) (x!127027 (_ BitVec 32))) (Undefined!10764) (MissingVacant!10764 (index!45436 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96211 (_ BitVec 32)) SeekEntryResult!10764)

(assert (=> b!1406803 (= e!796219 (= (seekEntryOrOpen!0 (select (arr!46453 a!2901) j!112) a!2901 mask!2840) (Found!10764 j!112)))))

(declare-fun b!1406804 () Bool)

(declare-fun res!945022 () Bool)

(assert (=> b!1406804 (=> (not res!945022) (not e!796220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406804 (= res!945022 (validKeyInArray!0 (select (arr!46453 a!2901) i!1037)))))

(declare-fun res!945017 () Bool)

(assert (=> start!120904 (=> (not res!945017) (not e!796220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120904 (= res!945017 (validMask!0 mask!2840))))

(assert (=> start!120904 e!796220))

(assert (=> start!120904 true))

(declare-fun array_inv!35481 (array!96211) Bool)

(assert (=> start!120904 (array_inv!35481 a!2901)))

(declare-fun b!1406805 () Bool)

(declare-fun e!796217 () Bool)

(assert (=> b!1406805 (= e!796220 (not e!796217))))

(declare-fun res!945021 () Bool)

(assert (=> b!1406805 (=> res!945021 e!796217)))

(declare-fun lt!619509 () SeekEntryResult!10764)

(assert (=> b!1406805 (= res!945021 (or (not (is-Intermediate!10764 lt!619509)) (undefined!11576 lt!619509)))))

(assert (=> b!1406805 e!796219))

(declare-fun res!945025 () Bool)

(assert (=> b!1406805 (=> (not res!945025) (not e!796219))))

(assert (=> b!1406805 (= res!945025 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47502 0))(
  ( (Unit!47503) )
))
(declare-fun lt!619508 () Unit!47502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47502)

(assert (=> b!1406805 (= lt!619508 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96211 (_ BitVec 32)) SeekEntryResult!10764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406805 (= lt!619509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) (select (arr!46453 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406806 () Bool)

(assert (=> b!1406806 (= e!796217 (and (bvsge (x!127027 lt!619509) #b00000000000000000000000000000000) (bvsle (x!127027 lt!619509) #b01111111111111111111111111111110)))))

(declare-fun b!1406807 () Bool)

(declare-fun res!945020 () Bool)

(assert (=> b!1406807 (=> (not res!945020) (not e!796220))))

(assert (=> b!1406807 (= res!945020 (validKeyInArray!0 (select (arr!46453 a!2901) j!112)))))

(declare-fun b!1406808 () Bool)

(declare-fun res!945023 () Bool)

(assert (=> b!1406808 (=> res!945023 e!796217)))

(assert (=> b!1406808 (= res!945023 (not (= lt!619509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901)) mask!2840))))))

(assert (= (and start!120904 res!945017) b!1406802))

(assert (= (and b!1406802 res!945019) b!1406804))

(assert (= (and b!1406804 res!945022) b!1406807))

(assert (= (and b!1406807 res!945020) b!1406800))

(assert (= (and b!1406800 res!945024) b!1406801))

(assert (= (and b!1406801 res!945018) b!1406805))

(assert (= (and b!1406805 res!945025) b!1406803))

(assert (= (and b!1406805 (not res!945021)) b!1406808))

(assert (= (and b!1406808 (not res!945023)) b!1406806))

(declare-fun m!1296083 () Bool)

(assert (=> b!1406807 m!1296083))

(assert (=> b!1406807 m!1296083))

(declare-fun m!1296085 () Bool)

(assert (=> b!1406807 m!1296085))

(declare-fun m!1296087 () Bool)

(assert (=> b!1406808 m!1296087))

(declare-fun m!1296089 () Bool)

(assert (=> b!1406808 m!1296089))

(assert (=> b!1406808 m!1296089))

(declare-fun m!1296091 () Bool)

(assert (=> b!1406808 m!1296091))

(assert (=> b!1406808 m!1296091))

(assert (=> b!1406808 m!1296089))

(declare-fun m!1296093 () Bool)

(assert (=> b!1406808 m!1296093))

(declare-fun m!1296095 () Bool)

(assert (=> b!1406804 m!1296095))

(assert (=> b!1406804 m!1296095))

(declare-fun m!1296097 () Bool)

(assert (=> b!1406804 m!1296097))

(declare-fun m!1296099 () Bool)

(assert (=> start!120904 m!1296099))

(declare-fun m!1296101 () Bool)

(assert (=> start!120904 m!1296101))

(assert (=> b!1406805 m!1296083))

(declare-fun m!1296103 () Bool)

(assert (=> b!1406805 m!1296103))

(assert (=> b!1406805 m!1296083))

(declare-fun m!1296105 () Bool)

(assert (=> b!1406805 m!1296105))

(assert (=> b!1406805 m!1296103))

(assert (=> b!1406805 m!1296083))

(declare-fun m!1296107 () Bool)

(assert (=> b!1406805 m!1296107))

(declare-fun m!1296109 () Bool)

(assert (=> b!1406805 m!1296109))

(declare-fun m!1296111 () Bool)

(assert (=> b!1406800 m!1296111))

(assert (=> b!1406803 m!1296083))

(assert (=> b!1406803 m!1296083))

(declare-fun m!1296113 () Bool)

(assert (=> b!1406803 m!1296113))

(declare-fun m!1296115 () Bool)

(assert (=> b!1406801 m!1296115))

(push 1)

(assert (not start!120904))

(assert (not b!1406803))

(assert (not b!1406800))

(assert (not b!1406801))

(assert (not b!1406805))

(assert (not b!1406807))

(assert (not b!1406808))

(assert (not b!1406804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151443 () Bool)

(assert (=> d!151443 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120904 d!151443))

(declare-fun d!151451 () Bool)

(assert (=> d!151451 (= (array_inv!35481 a!2901) (bvsge (size!47003 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120904 d!151451))

(declare-fun b!1406859 () Bool)

(declare-fun e!796253 () Bool)

(declare-fun e!796254 () Bool)

(assert (=> b!1406859 (= e!796253 e!796254)))

(declare-fun lt!619546 () (_ BitVec 64))

(assert (=> b!1406859 (= lt!619546 (select (arr!46453 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619544 () Unit!47502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96211 (_ BitVec 64) (_ BitVec 32)) Unit!47502)

(assert (=> b!1406859 (= lt!619544 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619546 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1406859 (arrayContainsKey!0 a!2901 lt!619546 #b00000000000000000000000000000000)))

(declare-fun lt!619545 () Unit!47502)

(assert (=> b!1406859 (= lt!619545 lt!619544)))

(declare-fun res!945039 () Bool)

(assert (=> b!1406859 (= res!945039 (= (seekEntryOrOpen!0 (select (arr!46453 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10764 #b00000000000000000000000000000000)))))

(assert (=> b!1406859 (=> (not res!945039) (not e!796254))))

(declare-fun b!1406860 () Bool)

(declare-fun e!796252 () Bool)

(assert (=> b!1406860 (= e!796252 e!796253)))

(declare-fun c!130373 () Bool)

(assert (=> b!1406860 (= c!130373 (validKeyInArray!0 (select (arr!46453 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66953 () Bool)

(declare-fun call!66956 () Bool)

(assert (=> bm!66953 (= call!66956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1406861 () Bool)

(assert (=> b!1406861 (= e!796254 call!66956)))

(declare-fun d!151453 () Bool)

(declare-fun res!945038 () Bool)

(assert (=> d!151453 (=> res!945038 e!796252)))

(assert (=> d!151453 (= res!945038 (bvsge #b00000000000000000000000000000000 (size!47003 a!2901)))))

(assert (=> d!151453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796252)))

(declare-fun b!1406862 () Bool)

(assert (=> b!1406862 (= e!796253 call!66956)))

(assert (= (and d!151453 (not res!945038)) b!1406860))

(assert (= (and b!1406860 c!130373) b!1406859))

(assert (= (and b!1406860 (not c!130373)) b!1406862))

(assert (= (and b!1406859 res!945039) b!1406861))

(assert (= (or b!1406861 b!1406862) bm!66953))

(declare-fun m!1296147 () Bool)

(assert (=> b!1406859 m!1296147))

(declare-fun m!1296149 () Bool)

(assert (=> b!1406859 m!1296149))

(declare-fun m!1296151 () Bool)

(assert (=> b!1406859 m!1296151))

(assert (=> b!1406859 m!1296147))

(declare-fun m!1296153 () Bool)

(assert (=> b!1406859 m!1296153))

(assert (=> b!1406860 m!1296147))

(assert (=> b!1406860 m!1296147))

(declare-fun m!1296155 () Bool)

(assert (=> b!1406860 m!1296155))

(declare-fun m!1296157 () Bool)

(assert (=> bm!66953 m!1296157))

(assert (=> b!1406800 d!151453))

(declare-fun b!1406865 () Bool)

(declare-fun e!796256 () Bool)

(declare-fun e!796257 () Bool)

(assert (=> b!1406865 (= e!796256 e!796257)))

(declare-fun lt!619549 () (_ BitVec 64))

(assert (=> b!1406865 (= lt!619549 (select (arr!46453 a!2901) j!112))))

(declare-fun lt!619547 () Unit!47502)

(assert (=> b!1406865 (= lt!619547 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619549 j!112))))

(assert (=> b!1406865 (arrayContainsKey!0 a!2901 lt!619549 #b00000000000000000000000000000000)))

(declare-fun lt!619548 () Unit!47502)

(assert (=> b!1406865 (= lt!619548 lt!619547)))

(declare-fun res!945041 () Bool)

(assert (=> b!1406865 (= res!945041 (= (seekEntryOrOpen!0 (select (arr!46453 a!2901) j!112) a!2901 mask!2840) (Found!10764 j!112)))))

(assert (=> b!1406865 (=> (not res!945041) (not e!796257))))

(declare-fun b!1406866 () Bool)

(declare-fun e!796255 () Bool)

(assert (=> b!1406866 (= e!796255 e!796256)))

(declare-fun c!130374 () Bool)

(assert (=> b!1406866 (= c!130374 (validKeyInArray!0 (select (arr!46453 a!2901) j!112)))))

(declare-fun bm!66954 () Bool)

(declare-fun call!66957 () Bool)

(assert (=> bm!66954 (= call!66957 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1406867 () Bool)

(assert (=> b!1406867 (= e!796257 call!66957)))

(declare-fun d!151455 () Bool)

(declare-fun res!945040 () Bool)

(assert (=> d!151455 (=> res!945040 e!796255)))

(assert (=> d!151455 (= res!945040 (bvsge j!112 (size!47003 a!2901)))))

(assert (=> d!151455 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796255)))

(declare-fun b!1406868 () Bool)

(assert (=> b!1406868 (= e!796256 call!66957)))

(assert (= (and d!151455 (not res!945040)) b!1406866))

(assert (= (and b!1406866 c!130374) b!1406865))

(assert (= (and b!1406866 (not c!130374)) b!1406868))

(assert (= (and b!1406865 res!945041) b!1406867))

(assert (= (or b!1406867 b!1406868) bm!66954))

(assert (=> b!1406865 m!1296083))

(declare-fun m!1296159 () Bool)

(assert (=> b!1406865 m!1296159))

(declare-fun m!1296161 () Bool)

(assert (=> b!1406865 m!1296161))

(assert (=> b!1406865 m!1296083))

(assert (=> b!1406865 m!1296113))

(assert (=> b!1406866 m!1296083))

(assert (=> b!1406866 m!1296083))

(assert (=> b!1406866 m!1296085))

(declare-fun m!1296163 () Bool)

(assert (=> bm!66954 m!1296163))

(assert (=> b!1406805 d!151455))

(declare-fun d!151457 () Bool)

(assert (=> d!151457 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619552 () Unit!47502)

(declare-fun choose!38 (array!96211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47502)

(assert (=> d!151457 (= lt!619552 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151457 (validMask!0 mask!2840)))

(assert (=> d!151457 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619552)))

(declare-fun bs!41010 () Bool)

(assert (= bs!41010 d!151457))

(assert (=> bs!41010 m!1296109))

(declare-fun m!1296165 () Bool)

(assert (=> bs!41010 m!1296165))

(assert (=> bs!41010 m!1296099))

(assert (=> b!1406805 d!151457))

(declare-fun b!1406941 () Bool)

(declare-fun lt!619571 () SeekEntryResult!10764)

(assert (=> b!1406941 (and (bvsge (index!45435 lt!619571) #b00000000000000000000000000000000) (bvslt (index!45435 lt!619571) (size!47003 a!2901)))))

(declare-fun e!796305 () Bool)

(assert (=> b!1406941 (= e!796305 (= (select (arr!46453 a!2901) (index!45435 lt!619571)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151459 () Bool)

(declare-fun e!796306 () Bool)

(assert (=> d!151459 e!796306))

(declare-fun c!130398 () Bool)

(assert (=> d!151459 (= c!130398 (and (is-Intermediate!10764 lt!619571) (undefined!11576 lt!619571)))))

(declare-fun e!796303 () SeekEntryResult!10764)

(assert (=> d!151459 (= lt!619571 e!796303)))

(declare-fun c!130397 () Bool)

(assert (=> d!151459 (= c!130397 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619572 () (_ BitVec 64))

(assert (=> d!151459 (= lt!619572 (select (arr!46453 a!2901) (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840)))))

(assert (=> d!151459 (validMask!0 mask!2840)))

(assert (=> d!151459 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) (select (arr!46453 a!2901) j!112) a!2901 mask!2840) lt!619571)))

(declare-fun b!1406942 () Bool)

(declare-fun e!796304 () Bool)

(assert (=> b!1406942 (= e!796306 e!796304)))

(declare-fun res!945074 () Bool)

(assert (=> b!1406942 (= res!945074 (and (is-Intermediate!10764 lt!619571) (not (undefined!11576 lt!619571)) (bvslt (x!127027 lt!619571) #b01111111111111111111111111111110) (bvsge (x!127027 lt!619571) #b00000000000000000000000000000000) (bvsge (x!127027 lt!619571) #b00000000000000000000000000000000)))))

(assert (=> b!1406942 (=> (not res!945074) (not e!796304))))

(declare-fun b!1406943 () Bool)

(assert (=> b!1406943 (= e!796306 (bvsge (x!127027 lt!619571) #b01111111111111111111111111111110))))

(declare-fun b!1406944 () Bool)

(declare-fun e!796302 () SeekEntryResult!10764)

(assert (=> b!1406944 (= e!796302 (Intermediate!10764 false (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406945 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406945 (= e!796302 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46453 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406946 () Bool)

(assert (=> b!1406946 (= e!796303 (Intermediate!10764 true (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406947 () Bool)

(assert (=> b!1406947 (= e!796303 e!796302)))

(declare-fun c!130399 () Bool)

(assert (=> b!1406947 (= c!130399 (or (= lt!619572 (select (arr!46453 a!2901) j!112)) (= (bvadd lt!619572 lt!619572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1406948 () Bool)

(assert (=> b!1406948 (and (bvsge (index!45435 lt!619571) #b00000000000000000000000000000000) (bvslt (index!45435 lt!619571) (size!47003 a!2901)))))

(declare-fun res!945076 () Bool)

(assert (=> b!1406948 (= res!945076 (= (select (arr!46453 a!2901) (index!45435 lt!619571)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1406948 (=> res!945076 e!796305)))

(declare-fun b!1406949 () Bool)

(assert (=> b!1406949 (and (bvsge (index!45435 lt!619571) #b00000000000000000000000000000000) (bvslt (index!45435 lt!619571) (size!47003 a!2901)))))

(declare-fun res!945075 () Bool)

(assert (=> b!1406949 (= res!945075 (= (select (arr!46453 a!2901) (index!45435 lt!619571)) (select (arr!46453 a!2901) j!112)))))

(assert (=> b!1406949 (=> res!945075 e!796305)))

(assert (=> b!1406949 (= e!796304 e!796305)))

(assert (= (and d!151459 c!130397) b!1406946))

(assert (= (and d!151459 (not c!130397)) b!1406947))

(assert (= (and b!1406947 c!130399) b!1406944))

(assert (= (and b!1406947 (not c!130399)) b!1406945))

(assert (= (and d!151459 c!130398) b!1406943))

(assert (= (and d!151459 (not c!130398)) b!1406942))

(assert (= (and b!1406942 res!945074) b!1406949))

(assert (= (and b!1406949 (not res!945075)) b!1406948))

(assert (= (and b!1406948 (not res!945076)) b!1406941))

(assert (=> d!151459 m!1296103))

(declare-fun m!1296183 () Bool)

(assert (=> d!151459 m!1296183))

(assert (=> d!151459 m!1296099))

(assert (=> b!1406945 m!1296103))

(declare-fun m!1296185 () Bool)

(assert (=> b!1406945 m!1296185))

(assert (=> b!1406945 m!1296185))

(assert (=> b!1406945 m!1296083))

(declare-fun m!1296187 () Bool)

(assert (=> b!1406945 m!1296187))

(declare-fun m!1296189 () Bool)

(assert (=> b!1406941 m!1296189))

(assert (=> b!1406949 m!1296189))

(assert (=> b!1406948 m!1296189))

(assert (=> b!1406805 d!151459))

(declare-fun d!151469 () Bool)

(declare-fun lt!619582 () (_ BitVec 32))

(declare-fun lt!619581 () (_ BitVec 32))

(assert (=> d!151469 (= lt!619582 (bvmul (bvxor lt!619581 (bvlshr lt!619581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151469 (= lt!619581 ((_ extract 31 0) (bvand (bvxor (select (arr!46453 a!2901) j!112) (bvlshr (select (arr!46453 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151469 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945077 (let ((h!34225 ((_ extract 31 0) (bvand (bvxor (select (arr!46453 a!2901) j!112) (bvlshr (select (arr!46453 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127033 (bvmul (bvxor h!34225 (bvlshr h!34225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127033 (bvlshr x!127033 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945077 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945077 #b00000000000000000000000000000000))))))

(assert (=> d!151469 (= (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) (bvand (bvxor lt!619582 (bvlshr lt!619582 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406805 d!151469))

(declare-fun b!1407003 () Bool)

(declare-fun e!796345 () SeekEntryResult!10764)

(declare-fun lt!619607 () SeekEntryResult!10764)

(assert (=> b!1407003 (= e!796345 (Found!10764 (index!45435 lt!619607)))))

(declare-fun d!151473 () Bool)

(declare-fun lt!619609 () SeekEntryResult!10764)

(assert (=> d!151473 (and (or (is-Undefined!10764 lt!619609) (not (is-Found!10764 lt!619609)) (and (bvsge (index!45434 lt!619609) #b00000000000000000000000000000000) (bvslt (index!45434 lt!619609) (size!47003 a!2901)))) (or (is-Undefined!10764 lt!619609) (is-Found!10764 lt!619609) (not (is-MissingZero!10764 lt!619609)) (and (bvsge (index!45433 lt!619609) #b00000000000000000000000000000000) (bvslt (index!45433 lt!619609) (size!47003 a!2901)))) (or (is-Undefined!10764 lt!619609) (is-Found!10764 lt!619609) (is-MissingZero!10764 lt!619609) (not (is-MissingVacant!10764 lt!619609)) (and (bvsge (index!45436 lt!619609) #b00000000000000000000000000000000) (bvslt (index!45436 lt!619609) (size!47003 a!2901)))) (or (is-Undefined!10764 lt!619609) (ite (is-Found!10764 lt!619609) (= (select (arr!46453 a!2901) (index!45434 lt!619609)) (select (arr!46453 a!2901) j!112)) (ite (is-MissingZero!10764 lt!619609) (= (select (arr!46453 a!2901) (index!45433 lt!619609)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10764 lt!619609) (= (select (arr!46453 a!2901) (index!45436 lt!619609)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!796343 () SeekEntryResult!10764)

(assert (=> d!151473 (= lt!619609 e!796343)))

(declare-fun c!130416 () Bool)

(assert (=> d!151473 (= c!130416 (and (is-Intermediate!10764 lt!619607) (undefined!11576 lt!619607)))))

(assert (=> d!151473 (= lt!619607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840) (select (arr!46453 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151473 (validMask!0 mask!2840)))

(assert (=> d!151473 (= (seekEntryOrOpen!0 (select (arr!46453 a!2901) j!112) a!2901 mask!2840) lt!619609)))

(declare-fun e!796344 () SeekEntryResult!10764)

(declare-fun b!1407004 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96211 (_ BitVec 32)) SeekEntryResult!10764)

(assert (=> b!1407004 (= e!796344 (seekKeyOrZeroReturnVacant!0 (x!127027 lt!619607) (index!45435 lt!619607) (index!45435 lt!619607) (select (arr!46453 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407005 () Bool)

(assert (=> b!1407005 (= e!796344 (MissingZero!10764 (index!45435 lt!619607)))))

(declare-fun b!1407006 () Bool)

(declare-fun c!130417 () Bool)

(declare-fun lt!619608 () (_ BitVec 64))

(assert (=> b!1407006 (= c!130417 (= lt!619608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407006 (= e!796345 e!796344)))

(declare-fun b!1407007 () Bool)

(assert (=> b!1407007 (= e!796343 e!796345)))

(assert (=> b!1407007 (= lt!619608 (select (arr!46453 a!2901) (index!45435 lt!619607)))))

(declare-fun c!130418 () Bool)

(assert (=> b!1407007 (= c!130418 (= lt!619608 (select (arr!46453 a!2901) j!112)))))

(declare-fun b!1407008 () Bool)

(assert (=> b!1407008 (= e!796343 Undefined!10764)))

(assert (= (and d!151473 c!130416) b!1407008))

(assert (= (and d!151473 (not c!130416)) b!1407007))

(assert (= (and b!1407007 c!130418) b!1407003))

(assert (= (and b!1407007 (not c!130418)) b!1407006))

(assert (= (and b!1407006 c!130417) b!1407005))

(assert (= (and b!1407006 (not c!130417)) b!1407004))

(declare-fun m!1296219 () Bool)

(assert (=> d!151473 m!1296219))

(assert (=> d!151473 m!1296083))

(assert (=> d!151473 m!1296103))

(declare-fun m!1296221 () Bool)

(assert (=> d!151473 m!1296221))

(declare-fun m!1296223 () Bool)

(assert (=> d!151473 m!1296223))

(assert (=> d!151473 m!1296099))

(assert (=> d!151473 m!1296103))

(assert (=> d!151473 m!1296083))

(assert (=> d!151473 m!1296107))

(assert (=> b!1407004 m!1296083))

(declare-fun m!1296225 () Bool)

(assert (=> b!1407004 m!1296225))

(declare-fun m!1296227 () Bool)

(assert (=> b!1407007 m!1296227))

(assert (=> b!1406803 d!151473))

(declare-fun d!151489 () Bool)

(assert (=> d!151489 (= (validKeyInArray!0 (select (arr!46453 a!2901) i!1037)) (and (not (= (select (arr!46453 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46453 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406804 d!151489))

(declare-fun d!151491 () Bool)

(assert (=> d!151491 (= (validKeyInArray!0 (select (arr!46453 a!2901) j!112)) (and (not (= (select (arr!46453 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46453 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1406807 d!151491))

(declare-fun b!1407018 () Bool)

(declare-fun lt!619614 () SeekEntryResult!10764)

(assert (=> b!1407018 (and (bvsge (index!45435 lt!619614) #b00000000000000000000000000000000) (bvslt (index!45435 lt!619614) (size!47003 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901)))))))

(declare-fun e!796354 () Bool)

(assert (=> b!1407018 (= e!796354 (= (select (arr!46453 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901))) (index!45435 lt!619614)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151493 () Bool)

(declare-fun e!796355 () Bool)

(assert (=> d!151493 e!796355))

(declare-fun c!130423 () Bool)

(assert (=> d!151493 (= c!130423 (and (is-Intermediate!10764 lt!619614) (undefined!11576 lt!619614)))))

(declare-fun e!796352 () SeekEntryResult!10764)

(assert (=> d!151493 (= lt!619614 e!796352)))

(declare-fun c!130422 () Bool)

(assert (=> d!151493 (= c!130422 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619615 () (_ BitVec 64))

(assert (=> d!151493 (= lt!619615 (select (arr!46453 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901))) (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151493 (validMask!0 mask!2840)))

(assert (=> d!151493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901)) mask!2840) lt!619614)))

(declare-fun b!1407019 () Bool)

(declare-fun e!796353 () Bool)

(assert (=> b!1407019 (= e!796355 e!796353)))

(declare-fun res!945102 () Bool)

(assert (=> b!1407019 (= res!945102 (and (is-Intermediate!10764 lt!619614) (not (undefined!11576 lt!619614)) (bvslt (x!127027 lt!619614) #b01111111111111111111111111111110) (bvsge (x!127027 lt!619614) #b00000000000000000000000000000000) (bvsge (x!127027 lt!619614) #b00000000000000000000000000000000)))))

(assert (=> b!1407019 (=> (not res!945102) (not e!796353))))

(declare-fun b!1407020 () Bool)

(assert (=> b!1407020 (= e!796355 (bvsge (x!127027 lt!619614) #b01111111111111111111111111111110))))

(declare-fun b!1407021 () Bool)

(declare-fun e!796351 () SeekEntryResult!10764)

(assert (=> b!1407021 (= e!796351 (Intermediate!10764 false (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407022 () Bool)

(assert (=> b!1407022 (= e!796351 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901)) mask!2840))))

(declare-fun b!1407023 () Bool)

(assert (=> b!1407023 (= e!796352 (Intermediate!10764 true (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407024 () Bool)

(assert (=> b!1407024 (= e!796352 e!796351)))

(declare-fun c!130424 () Bool)

(assert (=> b!1407024 (= c!130424 (or (= lt!619615 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619615 lt!619615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407025 () Bool)

(assert (=> b!1407025 (and (bvsge (index!45435 lt!619614) #b00000000000000000000000000000000) (bvslt (index!45435 lt!619614) (size!47003 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901)))))))

(declare-fun res!945104 () Bool)

(assert (=> b!1407025 (= res!945104 (= (select (arr!46453 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901))) (index!45435 lt!619614)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407025 (=> res!945104 e!796354)))

(declare-fun b!1407026 () Bool)

(assert (=> b!1407026 (and (bvsge (index!45435 lt!619614) #b00000000000000000000000000000000) (bvslt (index!45435 lt!619614) (size!47003 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901)))))))

(declare-fun res!945103 () Bool)

(assert (=> b!1407026 (= res!945103 (= (select (arr!46453 (array!96212 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47003 a!2901))) (index!45435 lt!619614)) (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407026 (=> res!945103 e!796354)))

(assert (=> b!1407026 (= e!796353 e!796354)))

(assert (= (and d!151493 c!130422) b!1407023))

(assert (= (and d!151493 (not c!130422)) b!1407024))

(assert (= (and b!1407024 c!130424) b!1407021))

(assert (= (and b!1407024 (not c!130424)) b!1407022))

(assert (= (and d!151493 c!130423) b!1407020))

(assert (= (and d!151493 (not c!130423)) b!1407019))

(assert (= (and b!1407019 res!945102) b!1407026))

(assert (= (and b!1407026 (not res!945103)) b!1407025))

(assert (= (and b!1407025 (not res!945104)) b!1407018))

(assert (=> d!151493 m!1296091))

(declare-fun m!1296237 () Bool)

(assert (=> d!151493 m!1296237))

(assert (=> d!151493 m!1296099))

(assert (=> b!1407022 m!1296091))

(declare-fun m!1296239 () Bool)

(assert (=> b!1407022 m!1296239))

(assert (=> b!1407022 m!1296239))

(assert (=> b!1407022 m!1296089))

(declare-fun m!1296241 () Bool)

(assert (=> b!1407022 m!1296241))

(declare-fun m!1296243 () Bool)

(assert (=> b!1407018 m!1296243))

(assert (=> b!1407026 m!1296243))

(assert (=> b!1407025 m!1296243))

(assert (=> b!1406808 d!151493))

(declare-fun d!151499 () Bool)

(declare-fun lt!619617 () (_ BitVec 32))

(declare-fun lt!619616 () (_ BitVec 32))

(assert (=> d!151499 (= lt!619617 (bvmul (bvxor lt!619616 (bvlshr lt!619616 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151499 (= lt!619616 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151499 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945077 (let ((h!34225 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127033 (bvmul (bvxor h!34225 (bvlshr h!34225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127033 (bvlshr x!127033 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945077 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945077 #b00000000000000000000000000000000))))))

(assert (=> d!151499 (= (toIndex!0 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619617 (bvlshr lt!619617 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1406808 d!151499))

(declare-fun b!1407037 () Bool)

(declare-fun e!796367 () Bool)

(declare-fun call!66969 () Bool)

(assert (=> b!1407037 (= e!796367 call!66969)))

(declare-fun b!1407038 () Bool)

(declare-fun e!796365 () Bool)

(declare-fun e!796366 () Bool)

(assert (=> b!1407038 (= e!796365 e!796366)))

(declare-fun res!945112 () Bool)

(assert (=> b!1407038 (=> (not res!945112) (not e!796366))))

(declare-fun e!796364 () Bool)

(assert (=> b!1407038 (= res!945112 (not e!796364))))

(declare-fun res!945113 () Bool)

(assert (=> b!1407038 (=> (not res!945113) (not e!796364))))

(assert (=> b!1407038 (= res!945113 (validKeyInArray!0 (select (arr!46453 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66966 () Bool)

(declare-fun c!130427 () Bool)

(assert (=> bm!66966 (= call!66969 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130427 (Cons!32968 (select (arr!46453 a!2901) #b00000000000000000000000000000000) Nil!32969) Nil!32969)))))

(declare-fun d!151501 () Bool)

(declare-fun res!945111 () Bool)

(assert (=> d!151501 (=> res!945111 e!796365)))

(assert (=> d!151501 (= res!945111 (bvsge #b00000000000000000000000000000000 (size!47003 a!2901)))))

(assert (=> d!151501 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32969) e!796365)))

(declare-fun b!1407039 () Bool)

(assert (=> b!1407039 (= e!796367 call!66969)))

(declare-fun b!1407040 () Bool)

(assert (=> b!1407040 (= e!796366 e!796367)))

(assert (=> b!1407040 (= c!130427 (validKeyInArray!0 (select (arr!46453 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407041 () Bool)

(declare-fun contains!9796 (List!32972 (_ BitVec 64)) Bool)

(assert (=> b!1407041 (= e!796364 (contains!9796 Nil!32969 (select (arr!46453 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151501 (not res!945111)) b!1407038))

(assert (= (and b!1407038 res!945113) b!1407041))

(assert (= (and b!1407038 res!945112) b!1407040))

(assert (= (and b!1407040 c!130427) b!1407039))

(assert (= (and b!1407040 (not c!130427)) b!1407037))

(assert (= (or b!1407039 b!1407037) bm!66966))

(assert (=> b!1407038 m!1296147))

(assert (=> b!1407038 m!1296147))

(assert (=> b!1407038 m!1296155))

(assert (=> bm!66966 m!1296147))

(declare-fun m!1296245 () Bool)

(assert (=> bm!66966 m!1296245))

(assert (=> b!1407040 m!1296147))

(assert (=> b!1407040 m!1296147))

(assert (=> b!1407040 m!1296155))

(assert (=> b!1407041 m!1296147))

(assert (=> b!1407041 m!1296147))

(declare-fun m!1296247 () Bool)

(assert (=> b!1407041 m!1296247))

(assert (=> b!1406801 d!151501))

(push 1)

