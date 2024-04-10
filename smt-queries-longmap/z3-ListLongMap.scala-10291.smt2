; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120962 () Bool)

(assert start!120962)

(declare-fun b!1407109 () Bool)

(declare-fun res!945163 () Bool)

(declare-fun e!796403 () Bool)

(assert (=> b!1407109 (=> res!945163 e!796403)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96218 0))(
  ( (array!96219 (arr!46455 (Array (_ BitVec 32) (_ BitVec 64))) (size!47005 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96218)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10766 0))(
  ( (MissingZero!10766 (index!45441 (_ BitVec 32))) (Found!10766 (index!45442 (_ BitVec 32))) (Intermediate!10766 (undefined!11578 Bool) (index!45443 (_ BitVec 32)) (x!127043 (_ BitVec 32))) (Undefined!10766) (MissingVacant!10766 (index!45444 (_ BitVec 32))) )
))
(declare-fun lt!619646 () SeekEntryResult!10766)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96218 (_ BitVec 32)) SeekEntryResult!10766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407109 (= res!945163 (not (= lt!619646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)) mask!2840))))))

(declare-fun b!1407110 () Bool)

(declare-fun res!945164 () Bool)

(declare-fun e!796402 () Bool)

(assert (=> b!1407110 (=> (not res!945164) (not e!796402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407110 (= res!945164 (validKeyInArray!0 (select (arr!46455 a!2901) j!112)))))

(declare-fun b!1407111 () Bool)

(declare-fun res!945167 () Bool)

(assert (=> b!1407111 (=> (not res!945167) (not e!796402))))

(assert (=> b!1407111 (= res!945167 (and (= (size!47005 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47005 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47005 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407112 () Bool)

(assert (=> b!1407112 (= e!796402 (not e!796403))))

(declare-fun res!945169 () Bool)

(assert (=> b!1407112 (=> res!945169 e!796403)))

(get-info :version)

(assert (=> b!1407112 (= res!945169 (or (not ((_ is Intermediate!10766) lt!619646)) (undefined!11578 lt!619646)))))

(declare-fun e!796401 () Bool)

(assert (=> b!1407112 e!796401))

(declare-fun res!945168 () Bool)

(assert (=> b!1407112 (=> (not res!945168) (not e!796401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96218 (_ BitVec 32)) Bool)

(assert (=> b!1407112 (= res!945168 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47506 0))(
  ( (Unit!47507) )
))
(declare-fun lt!619647 () Unit!47506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47506)

(assert (=> b!1407112 (= lt!619647 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619645 () (_ BitVec 32))

(assert (=> b!1407112 (= lt!619646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619645 (select (arr!46455 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407112 (= lt!619645 (toIndex!0 (select (arr!46455 a!2901) j!112) mask!2840))))

(declare-fun b!1407113 () Bool)

(declare-fun res!945165 () Bool)

(assert (=> b!1407113 (=> (not res!945165) (not e!796402))))

(assert (=> b!1407113 (= res!945165 (validKeyInArray!0 (select (arr!46455 a!2901) i!1037)))))

(declare-fun b!1407114 () Bool)

(declare-fun res!945166 () Bool)

(assert (=> b!1407114 (=> (not res!945166) (not e!796402))))

(assert (=> b!1407114 (= res!945166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407115 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96218 (_ BitVec 32)) SeekEntryResult!10766)

(assert (=> b!1407115 (= e!796401 (= (seekEntryOrOpen!0 (select (arr!46455 a!2901) j!112) a!2901 mask!2840) (Found!10766 j!112)))))

(declare-fun b!1407116 () Bool)

(declare-fun res!945161 () Bool)

(assert (=> b!1407116 (=> (not res!945161) (not e!796402))))

(declare-datatypes ((List!32974 0))(
  ( (Nil!32971) (Cons!32970 (h!34227 (_ BitVec 64)) (t!47668 List!32974)) )
))
(declare-fun arrayNoDuplicates!0 (array!96218 (_ BitVec 32) List!32974) Bool)

(assert (=> b!1407116 (= res!945161 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32971))))

(declare-fun b!1407117 () Bool)

(assert (=> b!1407117 (= e!796403 (or (bvslt (x!127043 lt!619646) #b00000000000000000000000000000000) (bvsgt (x!127043 lt!619646) #b01111111111111111111111111111110) (and (bvsge lt!619645 #b00000000000000000000000000000000) (bvslt lt!619645 (size!47005 a!2901)))))))

(declare-fun res!945162 () Bool)

(assert (=> start!120962 (=> (not res!945162) (not e!796402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120962 (= res!945162 (validMask!0 mask!2840))))

(assert (=> start!120962 e!796402))

(assert (=> start!120962 true))

(declare-fun array_inv!35483 (array!96218) Bool)

(assert (=> start!120962 (array_inv!35483 a!2901)))

(assert (= (and start!120962 res!945162) b!1407111))

(assert (= (and b!1407111 res!945167) b!1407113))

(assert (= (and b!1407113 res!945165) b!1407110))

(assert (= (and b!1407110 res!945164) b!1407114))

(assert (= (and b!1407114 res!945166) b!1407116))

(assert (= (and b!1407116 res!945161) b!1407112))

(assert (= (and b!1407112 res!945168) b!1407115))

(assert (= (and b!1407112 (not res!945169)) b!1407109))

(assert (= (and b!1407109 (not res!945163)) b!1407117))

(declare-fun m!1296301 () Bool)

(assert (=> b!1407112 m!1296301))

(declare-fun m!1296303 () Bool)

(assert (=> b!1407112 m!1296303))

(assert (=> b!1407112 m!1296301))

(declare-fun m!1296305 () Bool)

(assert (=> b!1407112 m!1296305))

(assert (=> b!1407112 m!1296301))

(declare-fun m!1296307 () Bool)

(assert (=> b!1407112 m!1296307))

(declare-fun m!1296309 () Bool)

(assert (=> b!1407112 m!1296309))

(declare-fun m!1296311 () Bool)

(assert (=> b!1407109 m!1296311))

(declare-fun m!1296313 () Bool)

(assert (=> b!1407109 m!1296313))

(assert (=> b!1407109 m!1296313))

(declare-fun m!1296315 () Bool)

(assert (=> b!1407109 m!1296315))

(assert (=> b!1407109 m!1296315))

(assert (=> b!1407109 m!1296313))

(declare-fun m!1296317 () Bool)

(assert (=> b!1407109 m!1296317))

(declare-fun m!1296319 () Bool)

(assert (=> b!1407113 m!1296319))

(assert (=> b!1407113 m!1296319))

(declare-fun m!1296321 () Bool)

(assert (=> b!1407113 m!1296321))

(assert (=> b!1407115 m!1296301))

(assert (=> b!1407115 m!1296301))

(declare-fun m!1296323 () Bool)

(assert (=> b!1407115 m!1296323))

(declare-fun m!1296325 () Bool)

(assert (=> b!1407116 m!1296325))

(assert (=> b!1407110 m!1296301))

(assert (=> b!1407110 m!1296301))

(declare-fun m!1296327 () Bool)

(assert (=> b!1407110 m!1296327))

(declare-fun m!1296329 () Bool)

(assert (=> start!120962 m!1296329))

(declare-fun m!1296331 () Bool)

(assert (=> start!120962 m!1296331))

(declare-fun m!1296333 () Bool)

(assert (=> b!1407114 m!1296333))

(check-sat (not b!1407115) (not start!120962) (not b!1407110) (not b!1407116) (not b!1407109) (not b!1407114) (not b!1407112) (not b!1407113))
(check-sat)
(get-model)

(declare-fun d!151515 () Bool)

(assert (=> d!151515 (= (validKeyInArray!0 (select (arr!46455 a!2901) j!112)) (and (not (= (select (arr!46455 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46455 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407110 d!151515))

(declare-fun b!1407155 () Bool)

(declare-fun e!796425 () Bool)

(declare-fun e!796424 () Bool)

(assert (=> b!1407155 (= e!796425 e!796424)))

(declare-fun res!945205 () Bool)

(assert (=> b!1407155 (=> (not res!945205) (not e!796424))))

(declare-fun e!796427 () Bool)

(assert (=> b!1407155 (= res!945205 (not e!796427))))

(declare-fun res!945203 () Bool)

(assert (=> b!1407155 (=> (not res!945203) (not e!796427))))

(assert (=> b!1407155 (= res!945203 (validKeyInArray!0 (select (arr!46455 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407156 () Bool)

(declare-fun contains!9797 (List!32974 (_ BitVec 64)) Bool)

(assert (=> b!1407156 (= e!796427 (contains!9797 Nil!32971 (select (arr!46455 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151517 () Bool)

(declare-fun res!945204 () Bool)

(assert (=> d!151517 (=> res!945204 e!796425)))

(assert (=> d!151517 (= res!945204 (bvsge #b00000000000000000000000000000000 (size!47005 a!2901)))))

(assert (=> d!151517 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32971) e!796425)))

(declare-fun b!1407157 () Bool)

(declare-fun e!796426 () Bool)

(declare-fun call!66973 () Bool)

(assert (=> b!1407157 (= e!796426 call!66973)))

(declare-fun bm!66970 () Bool)

(declare-fun c!130440 () Bool)

(assert (=> bm!66970 (= call!66973 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130440 (Cons!32970 (select (arr!46455 a!2901) #b00000000000000000000000000000000) Nil!32971) Nil!32971)))))

(declare-fun b!1407158 () Bool)

(assert (=> b!1407158 (= e!796424 e!796426)))

(assert (=> b!1407158 (= c!130440 (validKeyInArray!0 (select (arr!46455 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407159 () Bool)

(assert (=> b!1407159 (= e!796426 call!66973)))

(assert (= (and d!151517 (not res!945204)) b!1407155))

(assert (= (and b!1407155 res!945203) b!1407156))

(assert (= (and b!1407155 res!945205) b!1407158))

(assert (= (and b!1407158 c!130440) b!1407159))

(assert (= (and b!1407158 (not c!130440)) b!1407157))

(assert (= (or b!1407159 b!1407157) bm!66970))

(declare-fun m!1296369 () Bool)

(assert (=> b!1407155 m!1296369))

(assert (=> b!1407155 m!1296369))

(declare-fun m!1296371 () Bool)

(assert (=> b!1407155 m!1296371))

(assert (=> b!1407156 m!1296369))

(assert (=> b!1407156 m!1296369))

(declare-fun m!1296373 () Bool)

(assert (=> b!1407156 m!1296373))

(assert (=> bm!66970 m!1296369))

(declare-fun m!1296375 () Bool)

(assert (=> bm!66970 m!1296375))

(assert (=> b!1407158 m!1296369))

(assert (=> b!1407158 m!1296369))

(assert (=> b!1407158 m!1296371))

(assert (=> b!1407116 d!151517))

(declare-fun b!1407186 () Bool)

(declare-fun e!796444 () Bool)

(declare-fun call!66976 () Bool)

(assert (=> b!1407186 (= e!796444 call!66976)))

(declare-fun b!1407188 () Bool)

(declare-fun e!796446 () Bool)

(assert (=> b!1407188 (= e!796446 e!796444)))

(declare-fun c!130449 () Bool)

(assert (=> b!1407188 (= c!130449 (validKeyInArray!0 (select (arr!46455 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407189 () Bool)

(declare-fun e!796445 () Bool)

(assert (=> b!1407189 (= e!796444 e!796445)))

(declare-fun lt!619668 () (_ BitVec 64))

(assert (=> b!1407189 (= lt!619668 (select (arr!46455 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619667 () Unit!47506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96218 (_ BitVec 64) (_ BitVec 32)) Unit!47506)

(assert (=> b!1407189 (= lt!619667 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619668 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407189 (arrayContainsKey!0 a!2901 lt!619668 #b00000000000000000000000000000000)))

(declare-fun lt!619669 () Unit!47506)

(assert (=> b!1407189 (= lt!619669 lt!619667)))

(declare-fun res!945216 () Bool)

(assert (=> b!1407189 (= res!945216 (= (seekEntryOrOpen!0 (select (arr!46455 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10766 #b00000000000000000000000000000000)))))

(assert (=> b!1407189 (=> (not res!945216) (not e!796445))))

(declare-fun bm!66973 () Bool)

(assert (=> bm!66973 (= call!66976 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407187 () Bool)

(assert (=> b!1407187 (= e!796445 call!66976)))

(declare-fun d!151521 () Bool)

(declare-fun res!945217 () Bool)

(assert (=> d!151521 (=> res!945217 e!796446)))

(assert (=> d!151521 (= res!945217 (bvsge #b00000000000000000000000000000000 (size!47005 a!2901)))))

(assert (=> d!151521 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796446)))

(assert (= (and d!151521 (not res!945217)) b!1407188))

(assert (= (and b!1407188 c!130449) b!1407189))

(assert (= (and b!1407188 (not c!130449)) b!1407186))

(assert (= (and b!1407189 res!945216) b!1407187))

(assert (= (or b!1407187 b!1407186) bm!66973))

(assert (=> b!1407188 m!1296369))

(assert (=> b!1407188 m!1296369))

(assert (=> b!1407188 m!1296371))

(assert (=> b!1407189 m!1296369))

(declare-fun m!1296377 () Bool)

(assert (=> b!1407189 m!1296377))

(declare-fun m!1296379 () Bool)

(assert (=> b!1407189 m!1296379))

(assert (=> b!1407189 m!1296369))

(declare-fun m!1296381 () Bool)

(assert (=> b!1407189 m!1296381))

(declare-fun m!1296383 () Bool)

(assert (=> bm!66973 m!1296383))

(assert (=> b!1407114 d!151521))

(declare-fun b!1407250 () Bool)

(declare-fun lt!619700 () SeekEntryResult!10766)

(assert (=> b!1407250 (and (bvsge (index!45443 lt!619700) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619700) (size!47005 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)))))))

(declare-fun res!945247 () Bool)

(assert (=> b!1407250 (= res!945247 (= (select (arr!46455 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901))) (index!45443 lt!619700)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796487 () Bool)

(assert (=> b!1407250 (=> res!945247 e!796487)))

(declare-fun b!1407251 () Bool)

(declare-fun e!796490 () SeekEntryResult!10766)

(declare-fun e!796489 () SeekEntryResult!10766)

(assert (=> b!1407251 (= e!796490 e!796489)))

(declare-fun c!130467 () Bool)

(declare-fun lt!619701 () (_ BitVec 64))

(assert (=> b!1407251 (= c!130467 (or (= lt!619701 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619701 lt!619701) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407252 () Bool)

(declare-fun e!796491 () Bool)

(assert (=> b!1407252 (= e!796491 (bvsge (x!127043 lt!619700) #b01111111111111111111111111111110))))

(declare-fun d!151525 () Bool)

(assert (=> d!151525 e!796491))

(declare-fun c!130468 () Bool)

(assert (=> d!151525 (= c!130468 (and ((_ is Intermediate!10766) lt!619700) (undefined!11578 lt!619700)))))

(assert (=> d!151525 (= lt!619700 e!796490)))

(declare-fun c!130469 () Bool)

(assert (=> d!151525 (= c!130469 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151525 (= lt!619701 (select (arr!46455 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901))) (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151525 (validMask!0 mask!2840)))

(assert (=> d!151525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)) mask!2840) lt!619700)))

(declare-fun b!1407253 () Bool)

(assert (=> b!1407253 (= e!796489 (Intermediate!10766 false (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407254 () Bool)

(assert (=> b!1407254 (= e!796490 (Intermediate!10766 true (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407255 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407255 (= e!796489 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)) mask!2840))))

(declare-fun b!1407256 () Bool)

(declare-fun e!796488 () Bool)

(assert (=> b!1407256 (= e!796491 e!796488)))

(declare-fun res!945246 () Bool)

(assert (=> b!1407256 (= res!945246 (and ((_ is Intermediate!10766) lt!619700) (not (undefined!11578 lt!619700)) (bvslt (x!127043 lt!619700) #b01111111111111111111111111111110) (bvsge (x!127043 lt!619700) #b00000000000000000000000000000000) (bvsge (x!127043 lt!619700) #b00000000000000000000000000000000)))))

(assert (=> b!1407256 (=> (not res!945246) (not e!796488))))

(declare-fun b!1407257 () Bool)

(assert (=> b!1407257 (and (bvsge (index!45443 lt!619700) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619700) (size!47005 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)))))))

(declare-fun res!945245 () Bool)

(assert (=> b!1407257 (= res!945245 (= (select (arr!46455 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901))) (index!45443 lt!619700)) (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407257 (=> res!945245 e!796487)))

(assert (=> b!1407257 (= e!796488 e!796487)))

(declare-fun b!1407258 () Bool)

(assert (=> b!1407258 (and (bvsge (index!45443 lt!619700) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619700) (size!47005 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)))))))

(assert (=> b!1407258 (= e!796487 (= (select (arr!46455 (array!96219 (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901))) (index!45443 lt!619700)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151525 c!130469) b!1407254))

(assert (= (and d!151525 (not c!130469)) b!1407251))

(assert (= (and b!1407251 c!130467) b!1407253))

(assert (= (and b!1407251 (not c!130467)) b!1407255))

(assert (= (and d!151525 c!130468) b!1407252))

(assert (= (and d!151525 (not c!130468)) b!1407256))

(assert (= (and b!1407256 res!945246) b!1407257))

(assert (= (and b!1407257 (not res!945245)) b!1407250))

(assert (= (and b!1407250 (not res!945247)) b!1407258))

(assert (=> b!1407255 m!1296315))

(declare-fun m!1296409 () Bool)

(assert (=> b!1407255 m!1296409))

(assert (=> b!1407255 m!1296409))

(assert (=> b!1407255 m!1296313))

(declare-fun m!1296411 () Bool)

(assert (=> b!1407255 m!1296411))

(declare-fun m!1296413 () Bool)

(assert (=> b!1407250 m!1296413))

(assert (=> b!1407257 m!1296413))

(assert (=> b!1407258 m!1296413))

(assert (=> d!151525 m!1296315))

(declare-fun m!1296415 () Bool)

(assert (=> d!151525 m!1296415))

(assert (=> d!151525 m!1296329))

(assert (=> b!1407109 d!151525))

(declare-fun d!151537 () Bool)

(declare-fun lt!619710 () (_ BitVec 32))

(declare-fun lt!619709 () (_ BitVec 32))

(assert (=> d!151537 (= lt!619710 (bvmul (bvxor lt!619709 (bvlshr lt!619709 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151537 (= lt!619709 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151537 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945250 (let ((h!34230 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127048 (bvmul (bvxor h!34230 (bvlshr h!34230 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127048 (bvlshr x!127048 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945250 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945250 #b00000000000000000000000000000000))))))

(assert (=> d!151537 (= (toIndex!0 (select (store (arr!46455 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619710 (bvlshr lt!619710 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407109 d!151537))

(declare-fun b!1407326 () Bool)

(declare-fun e!796531 () SeekEntryResult!10766)

(declare-fun e!796533 () SeekEntryResult!10766)

(assert (=> b!1407326 (= e!796531 e!796533)))

(declare-fun lt!619744 () (_ BitVec 64))

(declare-fun lt!619745 () SeekEntryResult!10766)

(assert (=> b!1407326 (= lt!619744 (select (arr!46455 a!2901) (index!45443 lt!619745)))))

(declare-fun c!130495 () Bool)

(assert (=> b!1407326 (= c!130495 (= lt!619744 (select (arr!46455 a!2901) j!112)))))

(declare-fun d!151543 () Bool)

(declare-fun lt!619743 () SeekEntryResult!10766)

(assert (=> d!151543 (and (or ((_ is Undefined!10766) lt!619743) (not ((_ is Found!10766) lt!619743)) (and (bvsge (index!45442 lt!619743) #b00000000000000000000000000000000) (bvslt (index!45442 lt!619743) (size!47005 a!2901)))) (or ((_ is Undefined!10766) lt!619743) ((_ is Found!10766) lt!619743) (not ((_ is MissingZero!10766) lt!619743)) (and (bvsge (index!45441 lt!619743) #b00000000000000000000000000000000) (bvslt (index!45441 lt!619743) (size!47005 a!2901)))) (or ((_ is Undefined!10766) lt!619743) ((_ is Found!10766) lt!619743) ((_ is MissingZero!10766) lt!619743) (not ((_ is MissingVacant!10766) lt!619743)) (and (bvsge (index!45444 lt!619743) #b00000000000000000000000000000000) (bvslt (index!45444 lt!619743) (size!47005 a!2901)))) (or ((_ is Undefined!10766) lt!619743) (ite ((_ is Found!10766) lt!619743) (= (select (arr!46455 a!2901) (index!45442 lt!619743)) (select (arr!46455 a!2901) j!112)) (ite ((_ is MissingZero!10766) lt!619743) (= (select (arr!46455 a!2901) (index!45441 lt!619743)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10766) lt!619743) (= (select (arr!46455 a!2901) (index!45444 lt!619743)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151543 (= lt!619743 e!796531)))

(declare-fun c!130494 () Bool)

(assert (=> d!151543 (= c!130494 (and ((_ is Intermediate!10766) lt!619745) (undefined!11578 lt!619745)))))

(assert (=> d!151543 (= lt!619745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46455 a!2901) j!112) mask!2840) (select (arr!46455 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151543 (validMask!0 mask!2840)))

(assert (=> d!151543 (= (seekEntryOrOpen!0 (select (arr!46455 a!2901) j!112) a!2901 mask!2840) lt!619743)))

(declare-fun b!1407327 () Bool)

(declare-fun e!796532 () SeekEntryResult!10766)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96218 (_ BitVec 32)) SeekEntryResult!10766)

(assert (=> b!1407327 (= e!796532 (seekKeyOrZeroReturnVacant!0 (x!127043 lt!619745) (index!45443 lt!619745) (index!45443 lt!619745) (select (arr!46455 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407328 () Bool)

(assert (=> b!1407328 (= e!796531 Undefined!10766)))

(declare-fun b!1407329 () Bool)

(assert (=> b!1407329 (= e!796533 (Found!10766 (index!45443 lt!619745)))))

(declare-fun b!1407330 () Bool)

(assert (=> b!1407330 (= e!796532 (MissingZero!10766 (index!45443 lt!619745)))))

(declare-fun b!1407331 () Bool)

(declare-fun c!130493 () Bool)

(assert (=> b!1407331 (= c!130493 (= lt!619744 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407331 (= e!796533 e!796532)))

(assert (= (and d!151543 c!130494) b!1407328))

(assert (= (and d!151543 (not c!130494)) b!1407326))

(assert (= (and b!1407326 c!130495) b!1407329))

(assert (= (and b!1407326 (not c!130495)) b!1407331))

(assert (= (and b!1407331 c!130493) b!1407330))

(assert (= (and b!1407331 (not c!130493)) b!1407327))

(declare-fun m!1296457 () Bool)

(assert (=> b!1407326 m!1296457))

(assert (=> d!151543 m!1296329))

(assert (=> d!151543 m!1296303))

(assert (=> d!151543 m!1296301))

(declare-fun m!1296459 () Bool)

(assert (=> d!151543 m!1296459))

(declare-fun m!1296461 () Bool)

(assert (=> d!151543 m!1296461))

(assert (=> d!151543 m!1296301))

(assert (=> d!151543 m!1296303))

(declare-fun m!1296463 () Bool)

(assert (=> d!151543 m!1296463))

(declare-fun m!1296465 () Bool)

(assert (=> d!151543 m!1296465))

(assert (=> b!1407327 m!1296301))

(declare-fun m!1296467 () Bool)

(assert (=> b!1407327 m!1296467))

(assert (=> b!1407115 d!151543))

(declare-fun d!151571 () Bool)

(assert (=> d!151571 (= (validKeyInArray!0 (select (arr!46455 a!2901) i!1037)) (and (not (= (select (arr!46455 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46455 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407113 d!151571))

(declare-fun d!151573 () Bool)

(assert (=> d!151573 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120962 d!151573))

(declare-fun d!151575 () Bool)

(assert (=> d!151575 (= (array_inv!35483 a!2901) (bvsge (size!47005 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120962 d!151575))

(declare-fun b!1407344 () Bool)

(declare-fun e!796540 () Bool)

(declare-fun call!66987 () Bool)

(assert (=> b!1407344 (= e!796540 call!66987)))

(declare-fun b!1407348 () Bool)

(declare-fun e!796542 () Bool)

(assert (=> b!1407348 (= e!796542 e!796540)))

(declare-fun c!130502 () Bool)

(assert (=> b!1407348 (= c!130502 (validKeyInArray!0 (select (arr!46455 a!2901) j!112)))))

(declare-fun b!1407349 () Bool)

(declare-fun e!796541 () Bool)

(assert (=> b!1407349 (= e!796540 e!796541)))

(declare-fun lt!619757 () (_ BitVec 64))

(assert (=> b!1407349 (= lt!619757 (select (arr!46455 a!2901) j!112))))

(declare-fun lt!619756 () Unit!47506)

(assert (=> b!1407349 (= lt!619756 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619757 j!112))))

(assert (=> b!1407349 (arrayContainsKey!0 a!2901 lt!619757 #b00000000000000000000000000000000)))

(declare-fun lt!619758 () Unit!47506)

(assert (=> b!1407349 (= lt!619758 lt!619756)))

(declare-fun res!945271 () Bool)

(assert (=> b!1407349 (= res!945271 (= (seekEntryOrOpen!0 (select (arr!46455 a!2901) j!112) a!2901 mask!2840) (Found!10766 j!112)))))

(assert (=> b!1407349 (=> (not res!945271) (not e!796541))))

(declare-fun bm!66984 () Bool)

(assert (=> bm!66984 (= call!66987 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407346 () Bool)

(assert (=> b!1407346 (= e!796541 call!66987)))

(declare-fun d!151577 () Bool)

(declare-fun res!945272 () Bool)

(assert (=> d!151577 (=> res!945272 e!796542)))

(assert (=> d!151577 (= res!945272 (bvsge j!112 (size!47005 a!2901)))))

(assert (=> d!151577 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796542)))

(assert (= (and d!151577 (not res!945272)) b!1407348))

(assert (= (and b!1407348 c!130502) b!1407349))

(assert (= (and b!1407348 (not c!130502)) b!1407344))

(assert (= (and b!1407349 res!945271) b!1407346))

(assert (= (or b!1407346 b!1407344) bm!66984))

(assert (=> b!1407348 m!1296301))

(assert (=> b!1407348 m!1296301))

(assert (=> b!1407348 m!1296327))

(assert (=> b!1407349 m!1296301))

(declare-fun m!1296469 () Bool)

(assert (=> b!1407349 m!1296469))

(declare-fun m!1296471 () Bool)

(assert (=> b!1407349 m!1296471))

(assert (=> b!1407349 m!1296301))

(assert (=> b!1407349 m!1296323))

(declare-fun m!1296473 () Bool)

(assert (=> bm!66984 m!1296473))

(assert (=> b!1407112 d!151577))

(declare-fun d!151579 () Bool)

(assert (=> d!151579 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619769 () Unit!47506)

(declare-fun choose!38 (array!96218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47506)

(assert (=> d!151579 (= lt!619769 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151579 (validMask!0 mask!2840)))

(assert (=> d!151579 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619769)))

(declare-fun bs!41017 () Bool)

(assert (= bs!41017 d!151579))

(assert (=> bs!41017 m!1296309))

(declare-fun m!1296485 () Bool)

(assert (=> bs!41017 m!1296485))

(assert (=> bs!41017 m!1296329))

(assert (=> b!1407112 d!151579))

(declare-fun b!1407372 () Bool)

(declare-fun lt!619770 () SeekEntryResult!10766)

(assert (=> b!1407372 (and (bvsge (index!45443 lt!619770) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619770) (size!47005 a!2901)))))

(declare-fun res!945275 () Bool)

(assert (=> b!1407372 (= res!945275 (= (select (arr!46455 a!2901) (index!45443 lt!619770)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796555 () Bool)

(assert (=> b!1407372 (=> res!945275 e!796555)))

(declare-fun b!1407373 () Bool)

(declare-fun e!796558 () SeekEntryResult!10766)

(declare-fun e!796557 () SeekEntryResult!10766)

(assert (=> b!1407373 (= e!796558 e!796557)))

(declare-fun c!130515 () Bool)

(declare-fun lt!619771 () (_ BitVec 64))

(assert (=> b!1407373 (= c!130515 (or (= lt!619771 (select (arr!46455 a!2901) j!112)) (= (bvadd lt!619771 lt!619771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1407374 () Bool)

(declare-fun e!796559 () Bool)

(assert (=> b!1407374 (= e!796559 (bvsge (x!127043 lt!619770) #b01111111111111111111111111111110))))

(declare-fun d!151581 () Bool)

(assert (=> d!151581 e!796559))

(declare-fun c!130516 () Bool)

(assert (=> d!151581 (= c!130516 (and ((_ is Intermediate!10766) lt!619770) (undefined!11578 lt!619770)))))

(assert (=> d!151581 (= lt!619770 e!796558)))

(declare-fun c!130517 () Bool)

(assert (=> d!151581 (= c!130517 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151581 (= lt!619771 (select (arr!46455 a!2901) lt!619645))))

(assert (=> d!151581 (validMask!0 mask!2840)))

(assert (=> d!151581 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619645 (select (arr!46455 a!2901) j!112) a!2901 mask!2840) lt!619770)))

(declare-fun b!1407375 () Bool)

(assert (=> b!1407375 (= e!796557 (Intermediate!10766 false lt!619645 #b00000000000000000000000000000000))))

(declare-fun b!1407376 () Bool)

(assert (=> b!1407376 (= e!796558 (Intermediate!10766 true lt!619645 #b00000000000000000000000000000000))))

(declare-fun b!1407377 () Bool)

(assert (=> b!1407377 (= e!796557 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619645 #b00000000000000000000000000000000 mask!2840) (select (arr!46455 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407378 () Bool)

(declare-fun e!796556 () Bool)

(assert (=> b!1407378 (= e!796559 e!796556)))

(declare-fun res!945274 () Bool)

(assert (=> b!1407378 (= res!945274 (and ((_ is Intermediate!10766) lt!619770) (not (undefined!11578 lt!619770)) (bvslt (x!127043 lt!619770) #b01111111111111111111111111111110) (bvsge (x!127043 lt!619770) #b00000000000000000000000000000000) (bvsge (x!127043 lt!619770) #b00000000000000000000000000000000)))))

(assert (=> b!1407378 (=> (not res!945274) (not e!796556))))

(declare-fun b!1407379 () Bool)

(assert (=> b!1407379 (and (bvsge (index!45443 lt!619770) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619770) (size!47005 a!2901)))))

(declare-fun res!945273 () Bool)

(assert (=> b!1407379 (= res!945273 (= (select (arr!46455 a!2901) (index!45443 lt!619770)) (select (arr!46455 a!2901) j!112)))))

(assert (=> b!1407379 (=> res!945273 e!796555)))

(assert (=> b!1407379 (= e!796556 e!796555)))

(declare-fun b!1407380 () Bool)

(assert (=> b!1407380 (and (bvsge (index!45443 lt!619770) #b00000000000000000000000000000000) (bvslt (index!45443 lt!619770) (size!47005 a!2901)))))

(assert (=> b!1407380 (= e!796555 (= (select (arr!46455 a!2901) (index!45443 lt!619770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151581 c!130517) b!1407376))

(assert (= (and d!151581 (not c!130517)) b!1407373))

(assert (= (and b!1407373 c!130515) b!1407375))

(assert (= (and b!1407373 (not c!130515)) b!1407377))

(assert (= (and d!151581 c!130516) b!1407374))

(assert (= (and d!151581 (not c!130516)) b!1407378))

(assert (= (and b!1407378 res!945274) b!1407379))

(assert (= (and b!1407379 (not res!945273)) b!1407372))

(assert (= (and b!1407372 (not res!945275)) b!1407380))

(declare-fun m!1296501 () Bool)

(assert (=> b!1407377 m!1296501))

(assert (=> b!1407377 m!1296501))

(assert (=> b!1407377 m!1296301))

(declare-fun m!1296503 () Bool)

(assert (=> b!1407377 m!1296503))

(declare-fun m!1296507 () Bool)

(assert (=> b!1407372 m!1296507))

(assert (=> b!1407379 m!1296507))

(assert (=> b!1407380 m!1296507))

(declare-fun m!1296513 () Bool)

(assert (=> d!151581 m!1296513))

(assert (=> d!151581 m!1296329))

(assert (=> b!1407112 d!151581))

(declare-fun d!151585 () Bool)

(declare-fun lt!619776 () (_ BitVec 32))

(declare-fun lt!619775 () (_ BitVec 32))

(assert (=> d!151585 (= lt!619776 (bvmul (bvxor lt!619775 (bvlshr lt!619775 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151585 (= lt!619775 ((_ extract 31 0) (bvand (bvxor (select (arr!46455 a!2901) j!112) (bvlshr (select (arr!46455 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151585 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945250 (let ((h!34230 ((_ extract 31 0) (bvand (bvxor (select (arr!46455 a!2901) j!112) (bvlshr (select (arr!46455 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127048 (bvmul (bvxor h!34230 (bvlshr h!34230 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127048 (bvlshr x!127048 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945250 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945250 #b00000000000000000000000000000000))))))

(assert (=> d!151585 (= (toIndex!0 (select (arr!46455 a!2901) j!112) mask!2840) (bvand (bvxor lt!619776 (bvlshr lt!619776 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407112 d!151585))

(check-sat (not b!1407155) (not b!1407377) (not bm!66973) (not bm!66984) (not b!1407158) (not d!151543) (not b!1407156) (not b!1407189) (not b!1407327) (not bm!66970) (not b!1407188) (not b!1407348) (not b!1407255) (not d!151579) (not b!1407349) (not d!151581) (not d!151525))
(check-sat)
