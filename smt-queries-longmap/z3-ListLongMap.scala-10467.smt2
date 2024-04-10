; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123020 () Bool)

(assert start!123020)

(declare-fun b!1426884 () Bool)

(declare-fun res!962125 () Bool)

(declare-fun e!805947 () Bool)

(assert (=> b!1426884 (=> (not res!962125) (not e!805947))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97334 0))(
  ( (array!97335 (arr!46983 (Array (_ BitVec 32) (_ BitVec 64))) (size!47533 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97334)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1426884 (= res!962125 (and (= (size!47533 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47533 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47533 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426885 () Bool)

(declare-fun e!805946 () Bool)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1426885 (= e!805946 (not (not (= (select (arr!46983 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!805949 () Bool)

(assert (=> b!1426885 e!805949))

(declare-fun res!962119 () Bool)

(assert (=> b!1426885 (=> (not res!962119) (not e!805949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97334 (_ BitVec 32)) Bool)

(assert (=> b!1426885 (= res!962119 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48270 0))(
  ( (Unit!48271) )
))
(declare-fun lt!628343 () Unit!48270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48270)

(assert (=> b!1426885 (= lt!628343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1426886 () Bool)

(declare-fun res!962116 () Bool)

(assert (=> b!1426886 (=> (not res!962116) (not e!805947))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1426886 (= res!962116 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47533 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47533 a!2831))))))

(declare-fun b!1426887 () Bool)

(declare-fun res!962124 () Bool)

(assert (=> b!1426887 (=> (not res!962124) (not e!805946))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426887 (= res!962124 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426889 () Bool)

(declare-fun e!805948 () Bool)

(assert (=> b!1426889 (= e!805948 e!805946)))

(declare-fun res!962127 () Bool)

(assert (=> b!1426889 (=> (not res!962127) (not e!805946))))

(declare-datatypes ((SeekEntryResult!11262 0))(
  ( (MissingZero!11262 (index!47440 (_ BitVec 32))) (Found!11262 (index!47441 (_ BitVec 32))) (Intermediate!11262 (undefined!12074 Bool) (index!47442 (_ BitVec 32)) (x!129070 (_ BitVec 32))) (Undefined!11262) (MissingVacant!11262 (index!47443 (_ BitVec 32))) )
))
(declare-fun lt!628347 () SeekEntryResult!11262)

(declare-fun lt!628346 () (_ BitVec 64))

(declare-fun lt!628344 () array!97334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97334 (_ BitVec 32)) SeekEntryResult!11262)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426889 (= res!962127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628346 mask!2608) lt!628346 lt!628344 mask!2608) lt!628347))))

(assert (=> b!1426889 (= lt!628347 (Intermediate!11262 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426889 (= lt!628346 (select (store (arr!46983 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426889 (= lt!628344 (array!97335 (store (arr!46983 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47533 a!2831)))))

(declare-fun b!1426890 () Bool)

(declare-fun res!962128 () Bool)

(assert (=> b!1426890 (=> (not res!962128) (not e!805947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426890 (= res!962128 (validKeyInArray!0 (select (arr!46983 a!2831) i!982)))))

(declare-fun b!1426891 () Bool)

(declare-fun res!962120 () Bool)

(assert (=> b!1426891 (=> (not res!962120) (not e!805947))))

(assert (=> b!1426891 (= res!962120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426892 () Bool)

(assert (=> b!1426892 (= e!805947 e!805948)))

(declare-fun res!962117 () Bool)

(assert (=> b!1426892 (=> (not res!962117) (not e!805948))))

(declare-fun lt!628345 () SeekEntryResult!11262)

(assert (=> b!1426892 (= res!962117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) (select (arr!46983 a!2831) j!81) a!2831 mask!2608) lt!628345))))

(assert (=> b!1426892 (= lt!628345 (Intermediate!11262 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426893 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97334 (_ BitVec 32)) SeekEntryResult!11262)

(assert (=> b!1426893 (= e!805949 (= (seekEntryOrOpen!0 (select (arr!46983 a!2831) j!81) a!2831 mask!2608) (Found!11262 j!81)))))

(declare-fun b!1426894 () Bool)

(declare-fun res!962126 () Bool)

(assert (=> b!1426894 (=> (not res!962126) (not e!805946))))

(assert (=> b!1426894 (= res!962126 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46983 a!2831) j!81) a!2831 mask!2608) lt!628345))))

(declare-fun b!1426895 () Bool)

(declare-fun res!962121 () Bool)

(assert (=> b!1426895 (=> (not res!962121) (not e!805947))))

(declare-datatypes ((List!33493 0))(
  ( (Nil!33490) (Cons!33489 (h!34794 (_ BitVec 64)) (t!48187 List!33493)) )
))
(declare-fun arrayNoDuplicates!0 (array!97334 (_ BitVec 32) List!33493) Bool)

(assert (=> b!1426895 (= res!962121 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33490))))

(declare-fun b!1426896 () Bool)

(declare-fun res!962123 () Bool)

(assert (=> b!1426896 (=> (not res!962123) (not e!805947))))

(assert (=> b!1426896 (= res!962123 (validKeyInArray!0 (select (arr!46983 a!2831) j!81)))))

(declare-fun res!962118 () Bool)

(assert (=> start!123020 (=> (not res!962118) (not e!805947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123020 (= res!962118 (validMask!0 mask!2608))))

(assert (=> start!123020 e!805947))

(assert (=> start!123020 true))

(declare-fun array_inv!36011 (array!97334) Bool)

(assert (=> start!123020 (array_inv!36011 a!2831)))

(declare-fun b!1426888 () Bool)

(declare-fun res!962122 () Bool)

(assert (=> b!1426888 (=> (not res!962122) (not e!805946))))

(assert (=> b!1426888 (= res!962122 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628346 lt!628344 mask!2608) lt!628347))))

(assert (= (and start!123020 res!962118) b!1426884))

(assert (= (and b!1426884 res!962125) b!1426890))

(assert (= (and b!1426890 res!962128) b!1426896))

(assert (= (and b!1426896 res!962123) b!1426891))

(assert (= (and b!1426891 res!962120) b!1426895))

(assert (= (and b!1426895 res!962121) b!1426886))

(assert (= (and b!1426886 res!962116) b!1426892))

(assert (= (and b!1426892 res!962117) b!1426889))

(assert (= (and b!1426889 res!962127) b!1426894))

(assert (= (and b!1426894 res!962126) b!1426888))

(assert (= (and b!1426888 res!962122) b!1426887))

(assert (= (and b!1426887 res!962124) b!1426885))

(assert (= (and b!1426885 res!962119) b!1426893))

(declare-fun m!1317379 () Bool)

(assert (=> b!1426895 m!1317379))

(declare-fun m!1317381 () Bool)

(assert (=> b!1426893 m!1317381))

(assert (=> b!1426893 m!1317381))

(declare-fun m!1317383 () Bool)

(assert (=> b!1426893 m!1317383))

(declare-fun m!1317385 () Bool)

(assert (=> b!1426889 m!1317385))

(assert (=> b!1426889 m!1317385))

(declare-fun m!1317387 () Bool)

(assert (=> b!1426889 m!1317387))

(declare-fun m!1317389 () Bool)

(assert (=> b!1426889 m!1317389))

(declare-fun m!1317391 () Bool)

(assert (=> b!1426889 m!1317391))

(declare-fun m!1317393 () Bool)

(assert (=> b!1426890 m!1317393))

(assert (=> b!1426890 m!1317393))

(declare-fun m!1317395 () Bool)

(assert (=> b!1426890 m!1317395))

(declare-fun m!1317397 () Bool)

(assert (=> start!123020 m!1317397))

(declare-fun m!1317399 () Bool)

(assert (=> start!123020 m!1317399))

(assert (=> b!1426896 m!1317381))

(assert (=> b!1426896 m!1317381))

(declare-fun m!1317401 () Bool)

(assert (=> b!1426896 m!1317401))

(assert (=> b!1426892 m!1317381))

(assert (=> b!1426892 m!1317381))

(declare-fun m!1317403 () Bool)

(assert (=> b!1426892 m!1317403))

(assert (=> b!1426892 m!1317403))

(assert (=> b!1426892 m!1317381))

(declare-fun m!1317405 () Bool)

(assert (=> b!1426892 m!1317405))

(declare-fun m!1317407 () Bool)

(assert (=> b!1426891 m!1317407))

(declare-fun m!1317409 () Bool)

(assert (=> b!1426888 m!1317409))

(declare-fun m!1317411 () Bool)

(assert (=> b!1426885 m!1317411))

(declare-fun m!1317413 () Bool)

(assert (=> b!1426885 m!1317413))

(declare-fun m!1317415 () Bool)

(assert (=> b!1426885 m!1317415))

(assert (=> b!1426894 m!1317381))

(assert (=> b!1426894 m!1317381))

(declare-fun m!1317417 () Bool)

(assert (=> b!1426894 m!1317417))

(check-sat (not b!1426896) (not b!1426891) (not b!1426885) (not b!1426895) (not b!1426893) (not b!1426888) (not b!1426894) (not b!1426890) (not b!1426889) (not start!123020) (not b!1426892))
(check-sat)
(get-model)

(declare-fun d!153265 () Bool)

(declare-fun res!962172 () Bool)

(declare-fun e!805972 () Bool)

(assert (=> d!153265 (=> res!962172 e!805972)))

(assert (=> d!153265 (= res!962172 (bvsge j!81 (size!47533 a!2831)))))

(assert (=> d!153265 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!805972)))

(declare-fun b!1426944 () Bool)

(declare-fun e!805973 () Bool)

(assert (=> b!1426944 (= e!805972 e!805973)))

(declare-fun c!131874 () Bool)

(assert (=> b!1426944 (= c!131874 (validKeyInArray!0 (select (arr!46983 a!2831) j!81)))))

(declare-fun bm!67342 () Bool)

(declare-fun call!67345 () Bool)

(assert (=> bm!67342 (= call!67345 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1426945 () Bool)

(declare-fun e!805971 () Bool)

(assert (=> b!1426945 (= e!805971 call!67345)))

(declare-fun b!1426946 () Bool)

(assert (=> b!1426946 (= e!805973 call!67345)))

(declare-fun b!1426947 () Bool)

(assert (=> b!1426947 (= e!805973 e!805971)))

(declare-fun lt!628369 () (_ BitVec 64))

(assert (=> b!1426947 (= lt!628369 (select (arr!46983 a!2831) j!81))))

(declare-fun lt!628371 () Unit!48270)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97334 (_ BitVec 64) (_ BitVec 32)) Unit!48270)

(assert (=> b!1426947 (= lt!628371 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628369 j!81))))

(declare-fun arrayContainsKey!0 (array!97334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1426947 (arrayContainsKey!0 a!2831 lt!628369 #b00000000000000000000000000000000)))

(declare-fun lt!628370 () Unit!48270)

(assert (=> b!1426947 (= lt!628370 lt!628371)))

(declare-fun res!962173 () Bool)

(assert (=> b!1426947 (= res!962173 (= (seekEntryOrOpen!0 (select (arr!46983 a!2831) j!81) a!2831 mask!2608) (Found!11262 j!81)))))

(assert (=> b!1426947 (=> (not res!962173) (not e!805971))))

(assert (= (and d!153265 (not res!962172)) b!1426944))

(assert (= (and b!1426944 c!131874) b!1426947))

(assert (= (and b!1426944 (not c!131874)) b!1426946))

(assert (= (and b!1426947 res!962173) b!1426945))

(assert (= (or b!1426945 b!1426946) bm!67342))

(assert (=> b!1426944 m!1317381))

(assert (=> b!1426944 m!1317381))

(assert (=> b!1426944 m!1317401))

(declare-fun m!1317459 () Bool)

(assert (=> bm!67342 m!1317459))

(assert (=> b!1426947 m!1317381))

(declare-fun m!1317461 () Bool)

(assert (=> b!1426947 m!1317461))

(declare-fun m!1317463 () Bool)

(assert (=> b!1426947 m!1317463))

(assert (=> b!1426947 m!1317381))

(assert (=> b!1426947 m!1317383))

(assert (=> b!1426885 d!153265))

(declare-fun d!153267 () Bool)

(assert (=> d!153267 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!628374 () Unit!48270)

(declare-fun choose!38 (array!97334 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48270)

(assert (=> d!153267 (= lt!628374 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153267 (validMask!0 mask!2608)))

(assert (=> d!153267 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!628374)))

(declare-fun bs!41597 () Bool)

(assert (= bs!41597 d!153267))

(assert (=> bs!41597 m!1317413))

(declare-fun m!1317465 () Bool)

(assert (=> bs!41597 m!1317465))

(assert (=> bs!41597 m!1317397))

(assert (=> b!1426885 d!153267))

(declare-fun d!153269 () Bool)

(declare-fun res!962181 () Bool)

(declare-fun e!805983 () Bool)

(assert (=> d!153269 (=> res!962181 e!805983)))

(assert (=> d!153269 (= res!962181 (bvsge #b00000000000000000000000000000000 (size!47533 a!2831)))))

(assert (=> d!153269 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33490) e!805983)))

(declare-fun b!1426958 () Bool)

(declare-fun e!805985 () Bool)

(declare-fun contains!9849 (List!33493 (_ BitVec 64)) Bool)

(assert (=> b!1426958 (= e!805985 (contains!9849 Nil!33490 (select (arr!46983 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1426959 () Bool)

(declare-fun e!805984 () Bool)

(declare-fun call!67348 () Bool)

(assert (=> b!1426959 (= e!805984 call!67348)))

(declare-fun b!1426960 () Bool)

(declare-fun e!805982 () Bool)

(assert (=> b!1426960 (= e!805982 e!805984)))

(declare-fun c!131877 () Bool)

(assert (=> b!1426960 (= c!131877 (validKeyInArray!0 (select (arr!46983 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67345 () Bool)

(assert (=> bm!67345 (= call!67348 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131877 (Cons!33489 (select (arr!46983 a!2831) #b00000000000000000000000000000000) Nil!33490) Nil!33490)))))

(declare-fun b!1426961 () Bool)

(assert (=> b!1426961 (= e!805984 call!67348)))

(declare-fun b!1426962 () Bool)

(assert (=> b!1426962 (= e!805983 e!805982)))

(declare-fun res!962182 () Bool)

(assert (=> b!1426962 (=> (not res!962182) (not e!805982))))

(assert (=> b!1426962 (= res!962182 (not e!805985))))

(declare-fun res!962180 () Bool)

(assert (=> b!1426962 (=> (not res!962180) (not e!805985))))

(assert (=> b!1426962 (= res!962180 (validKeyInArray!0 (select (arr!46983 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153269 (not res!962181)) b!1426962))

(assert (= (and b!1426962 res!962180) b!1426958))

(assert (= (and b!1426962 res!962182) b!1426960))

(assert (= (and b!1426960 c!131877) b!1426961))

(assert (= (and b!1426960 (not c!131877)) b!1426959))

(assert (= (or b!1426961 b!1426959) bm!67345))

(declare-fun m!1317467 () Bool)

(assert (=> b!1426958 m!1317467))

(assert (=> b!1426958 m!1317467))

(declare-fun m!1317469 () Bool)

(assert (=> b!1426958 m!1317469))

(assert (=> b!1426960 m!1317467))

(assert (=> b!1426960 m!1317467))

(declare-fun m!1317471 () Bool)

(assert (=> b!1426960 m!1317471))

(assert (=> bm!67345 m!1317467))

(declare-fun m!1317473 () Bool)

(assert (=> bm!67345 m!1317473))

(assert (=> b!1426962 m!1317467))

(assert (=> b!1426962 m!1317467))

(assert (=> b!1426962 m!1317471))

(assert (=> b!1426895 d!153269))

(declare-fun d!153271 () Bool)

(assert (=> d!153271 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123020 d!153271))

(declare-fun d!153273 () Bool)

(assert (=> d!153273 (= (array_inv!36011 a!2831) (bvsge (size!47533 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123020 d!153273))

(declare-fun d!153275 () Bool)

(assert (=> d!153275 (= (validKeyInArray!0 (select (arr!46983 a!2831) j!81)) (and (not (= (select (arr!46983 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46983 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426896 d!153275))

(declare-fun b!1426981 () Bool)

(declare-fun e!805997 () SeekEntryResult!11262)

(declare-fun e!805996 () SeekEntryResult!11262)

(assert (=> b!1426981 (= e!805997 e!805996)))

(declare-fun c!131885 () Bool)

(declare-fun lt!628380 () (_ BitVec 64))

(assert (=> b!1426981 (= c!131885 (or (= lt!628380 lt!628346) (= (bvadd lt!628380 lt!628380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426982 () Bool)

(declare-fun lt!628379 () SeekEntryResult!11262)

(assert (=> b!1426982 (and (bvsge (index!47442 lt!628379) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628379) (size!47533 lt!628344)))))

(declare-fun res!962190 () Bool)

(assert (=> b!1426982 (= res!962190 (= (select (arr!46983 lt!628344) (index!47442 lt!628379)) lt!628346))))

(declare-fun e!806000 () Bool)

(assert (=> b!1426982 (=> res!962190 e!806000)))

(declare-fun e!805999 () Bool)

(assert (=> b!1426982 (= e!805999 e!806000)))

(declare-fun d!153277 () Bool)

(declare-fun e!805998 () Bool)

(assert (=> d!153277 e!805998))

(declare-fun c!131884 () Bool)

(get-info :version)

(assert (=> d!153277 (= c!131884 (and ((_ is Intermediate!11262) lt!628379) (undefined!12074 lt!628379)))))

(assert (=> d!153277 (= lt!628379 e!805997)))

(declare-fun c!131886 () Bool)

(assert (=> d!153277 (= c!131886 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153277 (= lt!628380 (select (arr!46983 lt!628344) (toIndex!0 lt!628346 mask!2608)))))

(assert (=> d!153277 (validMask!0 mask!2608)))

(assert (=> d!153277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628346 mask!2608) lt!628346 lt!628344 mask!2608) lt!628379)))

(declare-fun b!1426983 () Bool)

(assert (=> b!1426983 (= e!805997 (Intermediate!11262 true (toIndex!0 lt!628346 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426984 () Bool)

(assert (=> b!1426984 (= e!805998 (bvsge (x!129070 lt!628379) #b01111111111111111111111111111110))))

(declare-fun b!1426985 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426985 (= e!805996 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!628346 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!628346 lt!628344 mask!2608))))

(declare-fun b!1426986 () Bool)

(assert (=> b!1426986 (= e!805996 (Intermediate!11262 false (toIndex!0 lt!628346 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426987 () Bool)

(assert (=> b!1426987 (and (bvsge (index!47442 lt!628379) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628379) (size!47533 lt!628344)))))

(assert (=> b!1426987 (= e!806000 (= (select (arr!46983 lt!628344) (index!47442 lt!628379)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426988 () Bool)

(assert (=> b!1426988 (= e!805998 e!805999)))

(declare-fun res!962191 () Bool)

(assert (=> b!1426988 (= res!962191 (and ((_ is Intermediate!11262) lt!628379) (not (undefined!12074 lt!628379)) (bvslt (x!129070 lt!628379) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628379) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628379) #b00000000000000000000000000000000)))))

(assert (=> b!1426988 (=> (not res!962191) (not e!805999))))

(declare-fun b!1426989 () Bool)

(assert (=> b!1426989 (and (bvsge (index!47442 lt!628379) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628379) (size!47533 lt!628344)))))

(declare-fun res!962189 () Bool)

(assert (=> b!1426989 (= res!962189 (= (select (arr!46983 lt!628344) (index!47442 lt!628379)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426989 (=> res!962189 e!806000)))

(assert (= (and d!153277 c!131886) b!1426983))

(assert (= (and d!153277 (not c!131886)) b!1426981))

(assert (= (and b!1426981 c!131885) b!1426986))

(assert (= (and b!1426981 (not c!131885)) b!1426985))

(assert (= (and d!153277 c!131884) b!1426984))

(assert (= (and d!153277 (not c!131884)) b!1426988))

(assert (= (and b!1426988 res!962191) b!1426982))

(assert (= (and b!1426982 (not res!962190)) b!1426989))

(assert (= (and b!1426989 (not res!962189)) b!1426987))

(assert (=> d!153277 m!1317385))

(declare-fun m!1317475 () Bool)

(assert (=> d!153277 m!1317475))

(assert (=> d!153277 m!1317397))

(declare-fun m!1317477 () Bool)

(assert (=> b!1426989 m!1317477))

(assert (=> b!1426982 m!1317477))

(assert (=> b!1426985 m!1317385))

(declare-fun m!1317479 () Bool)

(assert (=> b!1426985 m!1317479))

(assert (=> b!1426985 m!1317479))

(declare-fun m!1317481 () Bool)

(assert (=> b!1426985 m!1317481))

(assert (=> b!1426987 m!1317477))

(assert (=> b!1426889 d!153277))

(declare-fun d!153279 () Bool)

(declare-fun lt!628386 () (_ BitVec 32))

(declare-fun lt!628385 () (_ BitVec 32))

(assert (=> d!153279 (= lt!628386 (bvmul (bvxor lt!628385 (bvlshr lt!628385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153279 (= lt!628385 ((_ extract 31 0) (bvand (bvxor lt!628346 (bvlshr lt!628346 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153279 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962192 (let ((h!34796 ((_ extract 31 0) (bvand (bvxor lt!628346 (bvlshr lt!628346 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129073 (bvmul (bvxor h!34796 (bvlshr h!34796 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129073 (bvlshr x!129073 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962192 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962192 #b00000000000000000000000000000000))))))

(assert (=> d!153279 (= (toIndex!0 lt!628346 mask!2608) (bvand (bvxor lt!628386 (bvlshr lt!628386 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426889 d!153279))

(declare-fun b!1426990 () Bool)

(declare-fun e!806002 () SeekEntryResult!11262)

(declare-fun e!806001 () SeekEntryResult!11262)

(assert (=> b!1426990 (= e!806002 e!806001)))

(declare-fun c!131888 () Bool)

(declare-fun lt!628388 () (_ BitVec 64))

(assert (=> b!1426990 (= c!131888 (or (= lt!628388 lt!628346) (= (bvadd lt!628388 lt!628388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426991 () Bool)

(declare-fun lt!628387 () SeekEntryResult!11262)

(assert (=> b!1426991 (and (bvsge (index!47442 lt!628387) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628387) (size!47533 lt!628344)))))

(declare-fun res!962194 () Bool)

(assert (=> b!1426991 (= res!962194 (= (select (arr!46983 lt!628344) (index!47442 lt!628387)) lt!628346))))

(declare-fun e!806005 () Bool)

(assert (=> b!1426991 (=> res!962194 e!806005)))

(declare-fun e!806004 () Bool)

(assert (=> b!1426991 (= e!806004 e!806005)))

(declare-fun d!153281 () Bool)

(declare-fun e!806003 () Bool)

(assert (=> d!153281 e!806003))

(declare-fun c!131887 () Bool)

(assert (=> d!153281 (= c!131887 (and ((_ is Intermediate!11262) lt!628387) (undefined!12074 lt!628387)))))

(assert (=> d!153281 (= lt!628387 e!806002)))

(declare-fun c!131889 () Bool)

(assert (=> d!153281 (= c!131889 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153281 (= lt!628388 (select (arr!46983 lt!628344) index!585))))

(assert (=> d!153281 (validMask!0 mask!2608)))

(assert (=> d!153281 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628346 lt!628344 mask!2608) lt!628387)))

(declare-fun b!1426992 () Bool)

(assert (=> b!1426992 (= e!806002 (Intermediate!11262 true index!585 x!605))))

(declare-fun b!1426993 () Bool)

(assert (=> b!1426993 (= e!806003 (bvsge (x!129070 lt!628387) #b01111111111111111111111111111110))))

(declare-fun b!1426994 () Bool)

(assert (=> b!1426994 (= e!806001 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628346 lt!628344 mask!2608))))

(declare-fun b!1426995 () Bool)

(assert (=> b!1426995 (= e!806001 (Intermediate!11262 false index!585 x!605))))

(declare-fun b!1426996 () Bool)

(assert (=> b!1426996 (and (bvsge (index!47442 lt!628387) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628387) (size!47533 lt!628344)))))

(assert (=> b!1426996 (= e!806005 (= (select (arr!46983 lt!628344) (index!47442 lt!628387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426997 () Bool)

(assert (=> b!1426997 (= e!806003 e!806004)))

(declare-fun res!962195 () Bool)

(assert (=> b!1426997 (= res!962195 (and ((_ is Intermediate!11262) lt!628387) (not (undefined!12074 lt!628387)) (bvslt (x!129070 lt!628387) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628387) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628387) x!605)))))

(assert (=> b!1426997 (=> (not res!962195) (not e!806004))))

(declare-fun b!1426998 () Bool)

(assert (=> b!1426998 (and (bvsge (index!47442 lt!628387) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628387) (size!47533 lt!628344)))))

(declare-fun res!962193 () Bool)

(assert (=> b!1426998 (= res!962193 (= (select (arr!46983 lt!628344) (index!47442 lt!628387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1426998 (=> res!962193 e!806005)))

(assert (= (and d!153281 c!131889) b!1426992))

(assert (= (and d!153281 (not c!131889)) b!1426990))

(assert (= (and b!1426990 c!131888) b!1426995))

(assert (= (and b!1426990 (not c!131888)) b!1426994))

(assert (= (and d!153281 c!131887) b!1426993))

(assert (= (and d!153281 (not c!131887)) b!1426997))

(assert (= (and b!1426997 res!962195) b!1426991))

(assert (= (and b!1426991 (not res!962194)) b!1426998))

(assert (= (and b!1426998 (not res!962193)) b!1426996))

(declare-fun m!1317483 () Bool)

(assert (=> d!153281 m!1317483))

(assert (=> d!153281 m!1317397))

(declare-fun m!1317485 () Bool)

(assert (=> b!1426998 m!1317485))

(assert (=> b!1426991 m!1317485))

(declare-fun m!1317487 () Bool)

(assert (=> b!1426994 m!1317487))

(assert (=> b!1426994 m!1317487))

(declare-fun m!1317489 () Bool)

(assert (=> b!1426994 m!1317489))

(assert (=> b!1426996 m!1317485))

(assert (=> b!1426888 d!153281))

(declare-fun d!153283 () Bool)

(assert (=> d!153283 (= (validKeyInArray!0 (select (arr!46983 a!2831) i!982)) (and (not (= (select (arr!46983 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46983 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426890 d!153283))

(declare-fun d!153285 () Bool)

(declare-fun res!962196 () Bool)

(declare-fun e!806007 () Bool)

(assert (=> d!153285 (=> res!962196 e!806007)))

(assert (=> d!153285 (= res!962196 (bvsge #b00000000000000000000000000000000 (size!47533 a!2831)))))

(assert (=> d!153285 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!806007)))

(declare-fun b!1426999 () Bool)

(declare-fun e!806008 () Bool)

(assert (=> b!1426999 (= e!806007 e!806008)))

(declare-fun c!131890 () Bool)

(assert (=> b!1426999 (= c!131890 (validKeyInArray!0 (select (arr!46983 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67346 () Bool)

(declare-fun call!67349 () Bool)

(assert (=> bm!67346 (= call!67349 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1427000 () Bool)

(declare-fun e!806006 () Bool)

(assert (=> b!1427000 (= e!806006 call!67349)))

(declare-fun b!1427001 () Bool)

(assert (=> b!1427001 (= e!806008 call!67349)))

(declare-fun b!1427002 () Bool)

(assert (=> b!1427002 (= e!806008 e!806006)))

(declare-fun lt!628389 () (_ BitVec 64))

(assert (=> b!1427002 (= lt!628389 (select (arr!46983 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628391 () Unit!48270)

(assert (=> b!1427002 (= lt!628391 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628389 #b00000000000000000000000000000000))))

(assert (=> b!1427002 (arrayContainsKey!0 a!2831 lt!628389 #b00000000000000000000000000000000)))

(declare-fun lt!628390 () Unit!48270)

(assert (=> b!1427002 (= lt!628390 lt!628391)))

(declare-fun res!962197 () Bool)

(assert (=> b!1427002 (= res!962197 (= (seekEntryOrOpen!0 (select (arr!46983 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11262 #b00000000000000000000000000000000)))))

(assert (=> b!1427002 (=> (not res!962197) (not e!806006))))

(assert (= (and d!153285 (not res!962196)) b!1426999))

(assert (= (and b!1426999 c!131890) b!1427002))

(assert (= (and b!1426999 (not c!131890)) b!1427001))

(assert (= (and b!1427002 res!962197) b!1427000))

(assert (= (or b!1427000 b!1427001) bm!67346))

(assert (=> b!1426999 m!1317467))

(assert (=> b!1426999 m!1317467))

(assert (=> b!1426999 m!1317471))

(declare-fun m!1317491 () Bool)

(assert (=> bm!67346 m!1317491))

(assert (=> b!1427002 m!1317467))

(declare-fun m!1317493 () Bool)

(assert (=> b!1427002 m!1317493))

(declare-fun m!1317495 () Bool)

(assert (=> b!1427002 m!1317495))

(assert (=> b!1427002 m!1317467))

(declare-fun m!1317497 () Bool)

(assert (=> b!1427002 m!1317497))

(assert (=> b!1426891 d!153285))

(declare-fun b!1427015 () Bool)

(declare-fun e!806015 () SeekEntryResult!11262)

(assert (=> b!1427015 (= e!806015 Undefined!11262)))

(declare-fun b!1427016 () Bool)

(declare-fun e!806016 () SeekEntryResult!11262)

(declare-fun lt!628398 () SeekEntryResult!11262)

(assert (=> b!1427016 (= e!806016 (MissingZero!11262 (index!47442 lt!628398)))))

(declare-fun b!1427017 () Bool)

(declare-fun e!806017 () SeekEntryResult!11262)

(assert (=> b!1427017 (= e!806015 e!806017)))

(declare-fun lt!628399 () (_ BitVec 64))

(assert (=> b!1427017 (= lt!628399 (select (arr!46983 a!2831) (index!47442 lt!628398)))))

(declare-fun c!131897 () Bool)

(assert (=> b!1427017 (= c!131897 (= lt!628399 (select (arr!46983 a!2831) j!81)))))

(declare-fun b!1427018 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97334 (_ BitVec 32)) SeekEntryResult!11262)

(assert (=> b!1427018 (= e!806016 (seekKeyOrZeroReturnVacant!0 (x!129070 lt!628398) (index!47442 lt!628398) (index!47442 lt!628398) (select (arr!46983 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427019 () Bool)

(declare-fun c!131898 () Bool)

(assert (=> b!1427019 (= c!131898 (= lt!628399 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427019 (= e!806017 e!806016)))

(declare-fun d!153287 () Bool)

(declare-fun lt!628400 () SeekEntryResult!11262)

(assert (=> d!153287 (and (or ((_ is Undefined!11262) lt!628400) (not ((_ is Found!11262) lt!628400)) (and (bvsge (index!47441 lt!628400) #b00000000000000000000000000000000) (bvslt (index!47441 lt!628400) (size!47533 a!2831)))) (or ((_ is Undefined!11262) lt!628400) ((_ is Found!11262) lt!628400) (not ((_ is MissingZero!11262) lt!628400)) (and (bvsge (index!47440 lt!628400) #b00000000000000000000000000000000) (bvslt (index!47440 lt!628400) (size!47533 a!2831)))) (or ((_ is Undefined!11262) lt!628400) ((_ is Found!11262) lt!628400) ((_ is MissingZero!11262) lt!628400) (not ((_ is MissingVacant!11262) lt!628400)) (and (bvsge (index!47443 lt!628400) #b00000000000000000000000000000000) (bvslt (index!47443 lt!628400) (size!47533 a!2831)))) (or ((_ is Undefined!11262) lt!628400) (ite ((_ is Found!11262) lt!628400) (= (select (arr!46983 a!2831) (index!47441 lt!628400)) (select (arr!46983 a!2831) j!81)) (ite ((_ is MissingZero!11262) lt!628400) (= (select (arr!46983 a!2831) (index!47440 lt!628400)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!11262) lt!628400) (= (select (arr!46983 a!2831) (index!47443 lt!628400)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153287 (= lt!628400 e!806015)))

(declare-fun c!131899 () Bool)

(assert (=> d!153287 (= c!131899 (and ((_ is Intermediate!11262) lt!628398) (undefined!12074 lt!628398)))))

(assert (=> d!153287 (= lt!628398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) (select (arr!46983 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153287 (validMask!0 mask!2608)))

(assert (=> d!153287 (= (seekEntryOrOpen!0 (select (arr!46983 a!2831) j!81) a!2831 mask!2608) lt!628400)))

(declare-fun b!1427020 () Bool)

(assert (=> b!1427020 (= e!806017 (Found!11262 (index!47442 lt!628398)))))

(assert (= (and d!153287 c!131899) b!1427015))

(assert (= (and d!153287 (not c!131899)) b!1427017))

(assert (= (and b!1427017 c!131897) b!1427020))

(assert (= (and b!1427017 (not c!131897)) b!1427019))

(assert (= (and b!1427019 c!131898) b!1427016))

(assert (= (and b!1427019 (not c!131898)) b!1427018))

(declare-fun m!1317499 () Bool)

(assert (=> b!1427017 m!1317499))

(assert (=> b!1427018 m!1317381))

(declare-fun m!1317501 () Bool)

(assert (=> b!1427018 m!1317501))

(assert (=> d!153287 m!1317403))

(assert (=> d!153287 m!1317381))

(assert (=> d!153287 m!1317405))

(declare-fun m!1317503 () Bool)

(assert (=> d!153287 m!1317503))

(declare-fun m!1317505 () Bool)

(assert (=> d!153287 m!1317505))

(declare-fun m!1317507 () Bool)

(assert (=> d!153287 m!1317507))

(assert (=> d!153287 m!1317381))

(assert (=> d!153287 m!1317403))

(assert (=> d!153287 m!1317397))

(assert (=> b!1426893 d!153287))

(declare-fun b!1427021 () Bool)

(declare-fun e!806019 () SeekEntryResult!11262)

(declare-fun e!806018 () SeekEntryResult!11262)

(assert (=> b!1427021 (= e!806019 e!806018)))

(declare-fun lt!628402 () (_ BitVec 64))

(declare-fun c!131901 () Bool)

(assert (=> b!1427021 (= c!131901 (or (= lt!628402 (select (arr!46983 a!2831) j!81)) (= (bvadd lt!628402 lt!628402) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427022 () Bool)

(declare-fun lt!628401 () SeekEntryResult!11262)

(assert (=> b!1427022 (and (bvsge (index!47442 lt!628401) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628401) (size!47533 a!2831)))))

(declare-fun res!962199 () Bool)

(assert (=> b!1427022 (= res!962199 (= (select (arr!46983 a!2831) (index!47442 lt!628401)) (select (arr!46983 a!2831) j!81)))))

(declare-fun e!806022 () Bool)

(assert (=> b!1427022 (=> res!962199 e!806022)))

(declare-fun e!806021 () Bool)

(assert (=> b!1427022 (= e!806021 e!806022)))

(declare-fun d!153295 () Bool)

(declare-fun e!806020 () Bool)

(assert (=> d!153295 e!806020))

(declare-fun c!131900 () Bool)

(assert (=> d!153295 (= c!131900 (and ((_ is Intermediate!11262) lt!628401) (undefined!12074 lt!628401)))))

(assert (=> d!153295 (= lt!628401 e!806019)))

(declare-fun c!131902 () Bool)

(assert (=> d!153295 (= c!131902 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153295 (= lt!628402 (select (arr!46983 a!2831) (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608)))))

(assert (=> d!153295 (validMask!0 mask!2608)))

(assert (=> d!153295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) (select (arr!46983 a!2831) j!81) a!2831 mask!2608) lt!628401)))

(declare-fun b!1427023 () Bool)

(assert (=> b!1427023 (= e!806019 (Intermediate!11262 true (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427024 () Bool)

(assert (=> b!1427024 (= e!806020 (bvsge (x!129070 lt!628401) #b01111111111111111111111111111110))))

(declare-fun b!1427025 () Bool)

(assert (=> b!1427025 (= e!806018 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46983 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427026 () Bool)

(assert (=> b!1427026 (= e!806018 (Intermediate!11262 false (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1427027 () Bool)

(assert (=> b!1427027 (and (bvsge (index!47442 lt!628401) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628401) (size!47533 a!2831)))))

(assert (=> b!1427027 (= e!806022 (= (select (arr!46983 a!2831) (index!47442 lt!628401)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427028 () Bool)

(assert (=> b!1427028 (= e!806020 e!806021)))

(declare-fun res!962200 () Bool)

(assert (=> b!1427028 (= res!962200 (and ((_ is Intermediate!11262) lt!628401) (not (undefined!12074 lt!628401)) (bvslt (x!129070 lt!628401) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628401) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628401) #b00000000000000000000000000000000)))))

(assert (=> b!1427028 (=> (not res!962200) (not e!806021))))

(declare-fun b!1427029 () Bool)

(assert (=> b!1427029 (and (bvsge (index!47442 lt!628401) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628401) (size!47533 a!2831)))))

(declare-fun res!962198 () Bool)

(assert (=> b!1427029 (= res!962198 (= (select (arr!46983 a!2831) (index!47442 lt!628401)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427029 (=> res!962198 e!806022)))

(assert (= (and d!153295 c!131902) b!1427023))

(assert (= (and d!153295 (not c!131902)) b!1427021))

(assert (= (and b!1427021 c!131901) b!1427026))

(assert (= (and b!1427021 (not c!131901)) b!1427025))

(assert (= (and d!153295 c!131900) b!1427024))

(assert (= (and d!153295 (not c!131900)) b!1427028))

(assert (= (and b!1427028 res!962200) b!1427022))

(assert (= (and b!1427022 (not res!962199)) b!1427029))

(assert (= (and b!1427029 (not res!962198)) b!1427027))

(assert (=> d!153295 m!1317403))

(declare-fun m!1317509 () Bool)

(assert (=> d!153295 m!1317509))

(assert (=> d!153295 m!1317397))

(declare-fun m!1317511 () Bool)

(assert (=> b!1427029 m!1317511))

(assert (=> b!1427022 m!1317511))

(assert (=> b!1427025 m!1317403))

(declare-fun m!1317513 () Bool)

(assert (=> b!1427025 m!1317513))

(assert (=> b!1427025 m!1317513))

(assert (=> b!1427025 m!1317381))

(declare-fun m!1317515 () Bool)

(assert (=> b!1427025 m!1317515))

(assert (=> b!1427027 m!1317511))

(assert (=> b!1426892 d!153295))

(declare-fun d!153297 () Bool)

(declare-fun lt!628404 () (_ BitVec 32))

(declare-fun lt!628403 () (_ BitVec 32))

(assert (=> d!153297 (= lt!628404 (bvmul (bvxor lt!628403 (bvlshr lt!628403 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153297 (= lt!628403 ((_ extract 31 0) (bvand (bvxor (select (arr!46983 a!2831) j!81) (bvlshr (select (arr!46983 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153297 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!962192 (let ((h!34796 ((_ extract 31 0) (bvand (bvxor (select (arr!46983 a!2831) j!81) (bvlshr (select (arr!46983 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129073 (bvmul (bvxor h!34796 (bvlshr h!34796 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129073 (bvlshr x!129073 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!962192 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!962192 #b00000000000000000000000000000000))))))

(assert (=> d!153297 (= (toIndex!0 (select (arr!46983 a!2831) j!81) mask!2608) (bvand (bvxor lt!628404 (bvlshr lt!628404 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426892 d!153297))

(declare-fun b!1427030 () Bool)

(declare-fun e!806024 () SeekEntryResult!11262)

(declare-fun e!806023 () SeekEntryResult!11262)

(assert (=> b!1427030 (= e!806024 e!806023)))

(declare-fun c!131904 () Bool)

(declare-fun lt!628406 () (_ BitVec 64))

(assert (=> b!1427030 (= c!131904 (or (= lt!628406 (select (arr!46983 a!2831) j!81)) (= (bvadd lt!628406 lt!628406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1427031 () Bool)

(declare-fun lt!628405 () SeekEntryResult!11262)

(assert (=> b!1427031 (and (bvsge (index!47442 lt!628405) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628405) (size!47533 a!2831)))))

(declare-fun res!962202 () Bool)

(assert (=> b!1427031 (= res!962202 (= (select (arr!46983 a!2831) (index!47442 lt!628405)) (select (arr!46983 a!2831) j!81)))))

(declare-fun e!806027 () Bool)

(assert (=> b!1427031 (=> res!962202 e!806027)))

(declare-fun e!806026 () Bool)

(assert (=> b!1427031 (= e!806026 e!806027)))

(declare-fun d!153299 () Bool)

(declare-fun e!806025 () Bool)

(assert (=> d!153299 e!806025))

(declare-fun c!131903 () Bool)

(assert (=> d!153299 (= c!131903 (and ((_ is Intermediate!11262) lt!628405) (undefined!12074 lt!628405)))))

(assert (=> d!153299 (= lt!628405 e!806024)))

(declare-fun c!131905 () Bool)

(assert (=> d!153299 (= c!131905 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153299 (= lt!628406 (select (arr!46983 a!2831) index!585))))

(assert (=> d!153299 (validMask!0 mask!2608)))

(assert (=> d!153299 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46983 a!2831) j!81) a!2831 mask!2608) lt!628405)))

(declare-fun b!1427032 () Bool)

(assert (=> b!1427032 (= e!806024 (Intermediate!11262 true index!585 x!605))))

(declare-fun b!1427033 () Bool)

(assert (=> b!1427033 (= e!806025 (bvsge (x!129070 lt!628405) #b01111111111111111111111111111110))))

(declare-fun b!1427034 () Bool)

(assert (=> b!1427034 (= e!806023 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46983 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1427035 () Bool)

(assert (=> b!1427035 (= e!806023 (Intermediate!11262 false index!585 x!605))))

(declare-fun b!1427036 () Bool)

(assert (=> b!1427036 (and (bvsge (index!47442 lt!628405) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628405) (size!47533 a!2831)))))

(assert (=> b!1427036 (= e!806027 (= (select (arr!46983 a!2831) (index!47442 lt!628405)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1427037 () Bool)

(assert (=> b!1427037 (= e!806025 e!806026)))

(declare-fun res!962203 () Bool)

(assert (=> b!1427037 (= res!962203 (and ((_ is Intermediate!11262) lt!628405) (not (undefined!12074 lt!628405)) (bvslt (x!129070 lt!628405) #b01111111111111111111111111111110) (bvsge (x!129070 lt!628405) #b00000000000000000000000000000000) (bvsge (x!129070 lt!628405) x!605)))))

(assert (=> b!1427037 (=> (not res!962203) (not e!806026))))

(declare-fun b!1427038 () Bool)

(assert (=> b!1427038 (and (bvsge (index!47442 lt!628405) #b00000000000000000000000000000000) (bvslt (index!47442 lt!628405) (size!47533 a!2831)))))

(declare-fun res!962201 () Bool)

(assert (=> b!1427038 (= res!962201 (= (select (arr!46983 a!2831) (index!47442 lt!628405)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1427038 (=> res!962201 e!806027)))

(assert (= (and d!153299 c!131905) b!1427032))

(assert (= (and d!153299 (not c!131905)) b!1427030))

(assert (= (and b!1427030 c!131904) b!1427035))

(assert (= (and b!1427030 (not c!131904)) b!1427034))

(assert (= (and d!153299 c!131903) b!1427033))

(assert (= (and d!153299 (not c!131903)) b!1427037))

(assert (= (and b!1427037 res!962203) b!1427031))

(assert (= (and b!1427031 (not res!962202)) b!1427038))

(assert (= (and b!1427038 (not res!962201)) b!1427036))

(assert (=> d!153299 m!1317411))

(assert (=> d!153299 m!1317397))

(declare-fun m!1317517 () Bool)

(assert (=> b!1427038 m!1317517))

(assert (=> b!1427031 m!1317517))

(assert (=> b!1427034 m!1317487))

(assert (=> b!1427034 m!1317487))

(assert (=> b!1427034 m!1317381))

(declare-fun m!1317519 () Bool)

(assert (=> b!1427034 m!1317519))

(assert (=> b!1427036 m!1317517))

(assert (=> b!1426894 d!153299))

(check-sat (not b!1426999) (not d!153295) (not bm!67345) (not d!153277) (not b!1427034) (not b!1426947) (not d!153267) (not b!1426960) (not b!1426985) (not bm!67346) (not b!1427002) (not b!1426958) (not d!153287) (not b!1426944) (not bm!67342) (not b!1427018) (not b!1427025) (not d!153299) (not b!1426994) (not b!1426962) (not d!153281))
(check-sat)
