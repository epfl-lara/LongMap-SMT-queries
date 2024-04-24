; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121694 () Bool)

(assert start!121694)

(declare-fun b!1413016 () Bool)

(declare-fun e!799707 () Bool)

(declare-fun e!799709 () Bool)

(assert (=> b!1413016 (= e!799707 (not e!799709))))

(declare-fun res!949563 () Bool)

(assert (=> b!1413016 (=> res!949563 e!799709)))

(declare-datatypes ((SeekEntryResult!10859 0))(
  ( (MissingZero!10859 (index!45813 (_ BitVec 32))) (Found!10859 (index!45814 (_ BitVec 32))) (Intermediate!10859 (undefined!11671 Bool) (index!45815 (_ BitVec 32)) (x!127553 (_ BitVec 32))) (Undefined!10859) (MissingVacant!10859 (index!45816 (_ BitVec 32))) )
))
(declare-fun lt!622410 () SeekEntryResult!10859)

(get-info :version)

(assert (=> b!1413016 (= res!949563 (or (not ((_ is Intermediate!10859) lt!622410)) (undefined!11671 lt!622410)))))

(declare-fun e!799708 () Bool)

(assert (=> b!1413016 e!799708))

(declare-fun res!949566 () Bool)

(assert (=> b!1413016 (=> (not res!949566) (not e!799708))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96617 0))(
  ( (array!96618 (arr!46645 (Array (_ BitVec 32) (_ BitVec 64))) (size!47196 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96617)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96617 (_ BitVec 32)) Bool)

(assert (=> b!1413016 (= res!949566 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47719 0))(
  ( (Unit!47720) )
))
(declare-fun lt!622407 () Unit!47719)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47719)

(assert (=> b!1413016 (= lt!622407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!622411 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96617 (_ BitVec 32)) SeekEntryResult!10859)

(assert (=> b!1413016 (= lt!622410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622411 (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413016 (= lt!622411 (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840))))

(declare-fun res!949559 () Bool)

(assert (=> start!121694 (=> (not res!949559) (not e!799707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121694 (= res!949559 (validMask!0 mask!2840))))

(assert (=> start!121694 e!799707))

(assert (=> start!121694 true))

(declare-fun array_inv!35926 (array!96617) Bool)

(assert (=> start!121694 (array_inv!35926 a!2901)))

(declare-fun b!1413017 () Bool)

(declare-fun res!949565 () Bool)

(assert (=> b!1413017 (=> (not res!949565) (not e!799707))))

(declare-datatypes ((List!33151 0))(
  ( (Nil!33148) (Cons!33147 (h!34427 (_ BitVec 64)) (t!47837 List!33151)) )
))
(declare-fun arrayNoDuplicates!0 (array!96617 (_ BitVec 32) List!33151) Bool)

(assert (=> b!1413017 (= res!949565 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33148))))

(declare-fun b!1413018 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96617 (_ BitVec 32)) SeekEntryResult!10859)

(assert (=> b!1413018 (= e!799708 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) (Found!10859 j!112)))))

(declare-fun b!1413019 () Bool)

(declare-fun e!799706 () Bool)

(assert (=> b!1413019 (= e!799709 e!799706)))

(declare-fun res!949564 () Bool)

(assert (=> b!1413019 (=> res!949564 e!799706)))

(declare-fun lt!622412 () SeekEntryResult!10859)

(assert (=> b!1413019 (= res!949564 (or (= lt!622410 lt!622412) (not ((_ is Intermediate!10859) lt!622412))))))

(declare-fun lt!622406 () array!96617)

(declare-fun lt!622408 () (_ BitVec 64))

(assert (=> b!1413019 (= lt!622412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622408 mask!2840) lt!622408 lt!622406 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1413019 (= lt!622408 (select (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413019 (= lt!622406 (array!96618 (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47196 a!2901)))))

(declare-fun b!1413020 () Bool)

(declare-fun res!949560 () Bool)

(assert (=> b!1413020 (=> (not res!949560) (not e!799707))))

(assert (=> b!1413020 (= res!949560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413021 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96617 (_ BitVec 32)) SeekEntryResult!10859)

(assert (=> b!1413021 (= e!799706 (= (seekEntryOrOpen!0 lt!622408 lt!622406 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127553 lt!622412) (index!45815 lt!622412) (index!45815 lt!622412) (select (arr!46645 a!2901) j!112) lt!622406 mask!2840)))))

(assert (=> b!1413021 (and (not (undefined!11671 lt!622412)) (= (index!45815 lt!622412) i!1037) (bvslt (x!127553 lt!622412) (x!127553 lt!622410)) (= (select (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45815 lt!622412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!622409 () Unit!47719)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47719)

(assert (=> b!1413021 (= lt!622409 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622411 (x!127553 lt!622410) (index!45815 lt!622410) (x!127553 lt!622412) (index!45815 lt!622412) (undefined!11671 lt!622412) mask!2840))))

(declare-fun b!1413022 () Bool)

(declare-fun res!949561 () Bool)

(assert (=> b!1413022 (=> (not res!949561) (not e!799707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413022 (= res!949561 (validKeyInArray!0 (select (arr!46645 a!2901) j!112)))))

(declare-fun b!1413023 () Bool)

(declare-fun res!949567 () Bool)

(assert (=> b!1413023 (=> (not res!949567) (not e!799707))))

(assert (=> b!1413023 (= res!949567 (and (= (size!47196 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47196 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47196 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1413024 () Bool)

(declare-fun res!949562 () Bool)

(assert (=> b!1413024 (=> (not res!949562) (not e!799707))))

(assert (=> b!1413024 (= res!949562 (validKeyInArray!0 (select (arr!46645 a!2901) i!1037)))))

(assert (= (and start!121694 res!949559) b!1413023))

(assert (= (and b!1413023 res!949567) b!1413024))

(assert (= (and b!1413024 res!949562) b!1413022))

(assert (= (and b!1413022 res!949561) b!1413020))

(assert (= (and b!1413020 res!949560) b!1413017))

(assert (= (and b!1413017 res!949565) b!1413016))

(assert (= (and b!1413016 res!949566) b!1413018))

(assert (= (and b!1413016 (not res!949563)) b!1413019))

(assert (= (and b!1413019 (not res!949564)) b!1413021))

(declare-fun m!1303273 () Bool)

(assert (=> b!1413024 m!1303273))

(assert (=> b!1413024 m!1303273))

(declare-fun m!1303275 () Bool)

(assert (=> b!1413024 m!1303275))

(declare-fun m!1303277 () Bool)

(assert (=> b!1413020 m!1303277))

(declare-fun m!1303279 () Bool)

(assert (=> b!1413017 m!1303279))

(declare-fun m!1303281 () Bool)

(assert (=> start!121694 m!1303281))

(declare-fun m!1303283 () Bool)

(assert (=> start!121694 m!1303283))

(declare-fun m!1303285 () Bool)

(assert (=> b!1413021 m!1303285))

(declare-fun m!1303287 () Bool)

(assert (=> b!1413021 m!1303287))

(declare-fun m!1303289 () Bool)

(assert (=> b!1413021 m!1303289))

(assert (=> b!1413021 m!1303287))

(declare-fun m!1303291 () Bool)

(assert (=> b!1413021 m!1303291))

(declare-fun m!1303293 () Bool)

(assert (=> b!1413021 m!1303293))

(declare-fun m!1303295 () Bool)

(assert (=> b!1413021 m!1303295))

(declare-fun m!1303297 () Bool)

(assert (=> b!1413019 m!1303297))

(assert (=> b!1413019 m!1303297))

(declare-fun m!1303299 () Bool)

(assert (=> b!1413019 m!1303299))

(assert (=> b!1413019 m!1303295))

(declare-fun m!1303301 () Bool)

(assert (=> b!1413019 m!1303301))

(assert (=> b!1413016 m!1303287))

(declare-fun m!1303303 () Bool)

(assert (=> b!1413016 m!1303303))

(assert (=> b!1413016 m!1303287))

(assert (=> b!1413016 m!1303287))

(declare-fun m!1303305 () Bool)

(assert (=> b!1413016 m!1303305))

(declare-fun m!1303307 () Bool)

(assert (=> b!1413016 m!1303307))

(declare-fun m!1303309 () Bool)

(assert (=> b!1413016 m!1303309))

(assert (=> b!1413018 m!1303287))

(assert (=> b!1413018 m!1303287))

(declare-fun m!1303311 () Bool)

(assert (=> b!1413018 m!1303311))

(assert (=> b!1413022 m!1303287))

(assert (=> b!1413022 m!1303287))

(declare-fun m!1303313 () Bool)

(assert (=> b!1413022 m!1303313))

(check-sat (not b!1413024) (not start!121694) (not b!1413020) (not b!1413017) (not b!1413018) (not b!1413022) (not b!1413016) (not b!1413019) (not b!1413021))
(check-sat)
(get-model)

(declare-fun b!1413087 () Bool)

(declare-fun e!799746 () Bool)

(declare-fun e!799748 () Bool)

(assert (=> b!1413087 (= e!799746 e!799748)))

(declare-fun lt!622463 () (_ BitVec 64))

(assert (=> b!1413087 (= lt!622463 (select (arr!46645 a!2901) j!112))))

(declare-fun lt!622462 () Unit!47719)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96617 (_ BitVec 64) (_ BitVec 32)) Unit!47719)

(assert (=> b!1413087 (= lt!622462 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622463 j!112))))

(declare-fun arrayContainsKey!0 (array!96617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1413087 (arrayContainsKey!0 a!2901 lt!622463 #b00000000000000000000000000000000)))

(declare-fun lt!622461 () Unit!47719)

(assert (=> b!1413087 (= lt!622461 lt!622462)))

(declare-fun res!949626 () Bool)

(assert (=> b!1413087 (= res!949626 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) (Found!10859 j!112)))))

(assert (=> b!1413087 (=> (not res!949626) (not e!799748))))

(declare-fun b!1413088 () Bool)

(declare-fun e!799747 () Bool)

(assert (=> b!1413088 (= e!799747 e!799746)))

(declare-fun c!131209 () Bool)

(assert (=> b!1413088 (= c!131209 (validKeyInArray!0 (select (arr!46645 a!2901) j!112)))))

(declare-fun d!152341 () Bool)

(declare-fun res!949627 () Bool)

(assert (=> d!152341 (=> res!949627 e!799747)))

(assert (=> d!152341 (= res!949627 (bvsge j!112 (size!47196 a!2901)))))

(assert (=> d!152341 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799747)))

(declare-fun call!67137 () Bool)

(declare-fun bm!67134 () Bool)

(assert (=> bm!67134 (= call!67137 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413089 () Bool)

(assert (=> b!1413089 (= e!799748 call!67137)))

(declare-fun b!1413090 () Bool)

(assert (=> b!1413090 (= e!799746 call!67137)))

(assert (= (and d!152341 (not res!949627)) b!1413088))

(assert (= (and b!1413088 c!131209) b!1413087))

(assert (= (and b!1413088 (not c!131209)) b!1413090))

(assert (= (and b!1413087 res!949626) b!1413089))

(assert (= (or b!1413089 b!1413090) bm!67134))

(assert (=> b!1413087 m!1303287))

(declare-fun m!1303399 () Bool)

(assert (=> b!1413087 m!1303399))

(declare-fun m!1303401 () Bool)

(assert (=> b!1413087 m!1303401))

(assert (=> b!1413087 m!1303287))

(assert (=> b!1413087 m!1303311))

(assert (=> b!1413088 m!1303287))

(assert (=> b!1413088 m!1303287))

(assert (=> b!1413088 m!1303313))

(declare-fun m!1303403 () Bool)

(assert (=> bm!67134 m!1303403))

(assert (=> b!1413016 d!152341))

(declare-fun d!152343 () Bool)

(assert (=> d!152343 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!622466 () Unit!47719)

(declare-fun choose!38 (array!96617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47719)

(assert (=> d!152343 (= lt!622466 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152343 (validMask!0 mask!2840)))

(assert (=> d!152343 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!622466)))

(declare-fun bs!41173 () Bool)

(assert (= bs!41173 d!152343))

(assert (=> bs!41173 m!1303309))

(declare-fun m!1303405 () Bool)

(assert (=> bs!41173 m!1303405))

(assert (=> bs!41173 m!1303281))

(assert (=> b!1413016 d!152343))

(declare-fun b!1413109 () Bool)

(declare-fun e!799761 () SeekEntryResult!10859)

(assert (=> b!1413109 (= e!799761 (Intermediate!10859 false lt!622411 #b00000000000000000000000000000000))))

(declare-fun b!1413110 () Bool)

(declare-fun lt!622471 () SeekEntryResult!10859)

(assert (=> b!1413110 (and (bvsge (index!45815 lt!622471) #b00000000000000000000000000000000) (bvslt (index!45815 lt!622471) (size!47196 a!2901)))))

(declare-fun res!949634 () Bool)

(assert (=> b!1413110 (= res!949634 (= (select (arr!46645 a!2901) (index!45815 lt!622471)) (select (arr!46645 a!2901) j!112)))))

(declare-fun e!799762 () Bool)

(assert (=> b!1413110 (=> res!949634 e!799762)))

(declare-fun e!799760 () Bool)

(assert (=> b!1413110 (= e!799760 e!799762)))

(declare-fun b!1413111 () Bool)

(declare-fun e!799759 () Bool)

(assert (=> b!1413111 (= e!799759 e!799760)))

(declare-fun res!949635 () Bool)

(assert (=> b!1413111 (= res!949635 (and ((_ is Intermediate!10859) lt!622471) (not (undefined!11671 lt!622471)) (bvslt (x!127553 lt!622471) #b01111111111111111111111111111110) (bvsge (x!127553 lt!622471) #b00000000000000000000000000000000) (bvsge (x!127553 lt!622471) #b00000000000000000000000000000000)))))

(assert (=> b!1413111 (=> (not res!949635) (not e!799760))))

(declare-fun b!1413112 () Bool)

(assert (=> b!1413112 (= e!799759 (bvsge (x!127553 lt!622471) #b01111111111111111111111111111110))))

(declare-fun b!1413113 () Bool)

(declare-fun e!799763 () SeekEntryResult!10859)

(assert (=> b!1413113 (= e!799763 e!799761)))

(declare-fun lt!622472 () (_ BitVec 64))

(declare-fun c!131216 () Bool)

(assert (=> b!1413113 (= c!131216 (or (= lt!622472 (select (arr!46645 a!2901) j!112)) (= (bvadd lt!622472 lt!622472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1413114 () Bool)

(assert (=> b!1413114 (= e!799763 (Intermediate!10859 true lt!622411 #b00000000000000000000000000000000))))

(declare-fun b!1413115 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413115 (= e!799761 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!622411 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413116 () Bool)

(assert (=> b!1413116 (and (bvsge (index!45815 lt!622471) #b00000000000000000000000000000000) (bvslt (index!45815 lt!622471) (size!47196 a!2901)))))

(declare-fun res!949636 () Bool)

(assert (=> b!1413116 (= res!949636 (= (select (arr!46645 a!2901) (index!45815 lt!622471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413116 (=> res!949636 e!799762)))

(declare-fun b!1413117 () Bool)

(assert (=> b!1413117 (and (bvsge (index!45815 lt!622471) #b00000000000000000000000000000000) (bvslt (index!45815 lt!622471) (size!47196 a!2901)))))

(assert (=> b!1413117 (= e!799762 (= (select (arr!46645 a!2901) (index!45815 lt!622471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152347 () Bool)

(assert (=> d!152347 e!799759))

(declare-fun c!131218 () Bool)

(assert (=> d!152347 (= c!131218 (and ((_ is Intermediate!10859) lt!622471) (undefined!11671 lt!622471)))))

(assert (=> d!152347 (= lt!622471 e!799763)))

(declare-fun c!131217 () Bool)

(assert (=> d!152347 (= c!131217 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152347 (= lt!622472 (select (arr!46645 a!2901) lt!622411))))

(assert (=> d!152347 (validMask!0 mask!2840)))

(assert (=> d!152347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622411 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) lt!622471)))

(assert (= (and d!152347 c!131217) b!1413114))

(assert (= (and d!152347 (not c!131217)) b!1413113))

(assert (= (and b!1413113 c!131216) b!1413109))

(assert (= (and b!1413113 (not c!131216)) b!1413115))

(assert (= (and d!152347 c!131218) b!1413112))

(assert (= (and d!152347 (not c!131218)) b!1413111))

(assert (= (and b!1413111 res!949635) b!1413110))

(assert (= (and b!1413110 (not res!949634)) b!1413116))

(assert (= (and b!1413116 (not res!949636)) b!1413117))

(declare-fun m!1303407 () Bool)

(assert (=> b!1413116 m!1303407))

(assert (=> b!1413117 m!1303407))

(declare-fun m!1303409 () Bool)

(assert (=> b!1413115 m!1303409))

(assert (=> b!1413115 m!1303409))

(assert (=> b!1413115 m!1303287))

(declare-fun m!1303411 () Bool)

(assert (=> b!1413115 m!1303411))

(declare-fun m!1303413 () Bool)

(assert (=> d!152347 m!1303413))

(assert (=> d!152347 m!1303281))

(assert (=> b!1413110 m!1303407))

(assert (=> b!1413016 d!152347))

(declare-fun d!152355 () Bool)

(declare-fun lt!622486 () (_ BitVec 32))

(declare-fun lt!622485 () (_ BitVec 32))

(assert (=> d!152355 (= lt!622486 (bvmul (bvxor lt!622485 (bvlshr lt!622485 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152355 (= lt!622485 ((_ extract 31 0) (bvand (bvxor (select (arr!46645 a!2901) j!112) (bvlshr (select (arr!46645 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152355 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949637 (let ((h!34430 ((_ extract 31 0) (bvand (bvxor (select (arr!46645 a!2901) j!112) (bvlshr (select (arr!46645 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127557 (bvmul (bvxor h!34430 (bvlshr h!34430 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127557 (bvlshr x!127557 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949637 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949637 #b00000000000000000000000000000000))))))

(assert (=> d!152355 (= (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840) (bvand (bvxor lt!622486 (bvlshr lt!622486 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413016 d!152355))

(declare-fun b!1413208 () Bool)

(declare-fun e!799820 () SeekEntryResult!10859)

(declare-fun lt!622529 () SeekEntryResult!10859)

(assert (=> b!1413208 (= e!799820 (MissingZero!10859 (index!45815 lt!622529)))))

(declare-fun b!1413209 () Bool)

(assert (=> b!1413209 (= e!799820 (seekKeyOrZeroReturnVacant!0 (x!127553 lt!622529) (index!45815 lt!622529) (index!45815 lt!622529) lt!622408 lt!622406 mask!2840))))

(declare-fun b!1413210 () Bool)

(declare-fun e!799819 () SeekEntryResult!10859)

(assert (=> b!1413210 (= e!799819 (Found!10859 (index!45815 lt!622529)))))

(declare-fun b!1413211 () Bool)

(declare-fun e!799818 () SeekEntryResult!10859)

(assert (=> b!1413211 (= e!799818 Undefined!10859)))

(declare-fun b!1413212 () Bool)

(declare-fun c!131251 () Bool)

(declare-fun lt!622527 () (_ BitVec 64))

(assert (=> b!1413212 (= c!131251 (= lt!622527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413212 (= e!799819 e!799820)))

(declare-fun b!1413213 () Bool)

(assert (=> b!1413213 (= e!799818 e!799819)))

(assert (=> b!1413213 (= lt!622527 (select (arr!46645 lt!622406) (index!45815 lt!622529)))))

(declare-fun c!131249 () Bool)

(assert (=> b!1413213 (= c!131249 (= lt!622527 lt!622408))))

(declare-fun d!152357 () Bool)

(declare-fun lt!622528 () SeekEntryResult!10859)

(assert (=> d!152357 (and (or ((_ is Undefined!10859) lt!622528) (not ((_ is Found!10859) lt!622528)) (and (bvsge (index!45814 lt!622528) #b00000000000000000000000000000000) (bvslt (index!45814 lt!622528) (size!47196 lt!622406)))) (or ((_ is Undefined!10859) lt!622528) ((_ is Found!10859) lt!622528) (not ((_ is MissingZero!10859) lt!622528)) (and (bvsge (index!45813 lt!622528) #b00000000000000000000000000000000) (bvslt (index!45813 lt!622528) (size!47196 lt!622406)))) (or ((_ is Undefined!10859) lt!622528) ((_ is Found!10859) lt!622528) ((_ is MissingZero!10859) lt!622528) (not ((_ is MissingVacant!10859) lt!622528)) (and (bvsge (index!45816 lt!622528) #b00000000000000000000000000000000) (bvslt (index!45816 lt!622528) (size!47196 lt!622406)))) (or ((_ is Undefined!10859) lt!622528) (ite ((_ is Found!10859) lt!622528) (= (select (arr!46645 lt!622406) (index!45814 lt!622528)) lt!622408) (ite ((_ is MissingZero!10859) lt!622528) (= (select (arr!46645 lt!622406) (index!45813 lt!622528)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10859) lt!622528) (= (select (arr!46645 lt!622406) (index!45816 lt!622528)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152357 (= lt!622528 e!799818)))

(declare-fun c!131250 () Bool)

(assert (=> d!152357 (= c!131250 (and ((_ is Intermediate!10859) lt!622529) (undefined!11671 lt!622529)))))

(assert (=> d!152357 (= lt!622529 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622408 mask!2840) lt!622408 lt!622406 mask!2840))))

(assert (=> d!152357 (validMask!0 mask!2840)))

(assert (=> d!152357 (= (seekEntryOrOpen!0 lt!622408 lt!622406 mask!2840) lt!622528)))

(assert (= (and d!152357 c!131250) b!1413211))

(assert (= (and d!152357 (not c!131250)) b!1413213))

(assert (= (and b!1413213 c!131249) b!1413210))

(assert (= (and b!1413213 (not c!131249)) b!1413212))

(assert (= (and b!1413212 c!131251) b!1413208))

(assert (= (and b!1413212 (not c!131251)) b!1413209))

(declare-fun m!1303443 () Bool)

(assert (=> b!1413209 m!1303443))

(declare-fun m!1303445 () Bool)

(assert (=> b!1413213 m!1303445))

(assert (=> d!152357 m!1303297))

(declare-fun m!1303447 () Bool)

(assert (=> d!152357 m!1303447))

(declare-fun m!1303449 () Bool)

(assert (=> d!152357 m!1303449))

(declare-fun m!1303451 () Bool)

(assert (=> d!152357 m!1303451))

(assert (=> d!152357 m!1303297))

(assert (=> d!152357 m!1303299))

(assert (=> d!152357 m!1303281))

(assert (=> b!1413021 d!152357))

(declare-fun b!1413244 () Bool)

(declare-fun c!131266 () Bool)

(declare-fun lt!622548 () (_ BitVec 64))

(assert (=> b!1413244 (= c!131266 (= lt!622548 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799839 () SeekEntryResult!10859)

(declare-fun e!799838 () SeekEntryResult!10859)

(assert (=> b!1413244 (= e!799839 e!799838)))

(declare-fun b!1413245 () Bool)

(assert (=> b!1413245 (= e!799838 (MissingVacant!10859 (index!45815 lt!622412)))))

(declare-fun b!1413246 () Bool)

(assert (=> b!1413246 (= e!799839 (Found!10859 (index!45815 lt!622412)))))

(declare-fun b!1413247 () Bool)

(assert (=> b!1413247 (= e!799838 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127553 lt!622412) #b00000000000000000000000000000001) (nextIndex!0 (index!45815 lt!622412) (bvadd (x!127553 lt!622412) #b00000000000000000000000000000001) mask!2840) (index!45815 lt!622412) (select (arr!46645 a!2901) j!112) lt!622406 mask!2840))))

(declare-fun b!1413249 () Bool)

(declare-fun e!799837 () SeekEntryResult!10859)

(assert (=> b!1413249 (= e!799837 e!799839)))

(declare-fun c!131264 () Bool)

(assert (=> b!1413249 (= c!131264 (= lt!622548 (select (arr!46645 a!2901) j!112)))))

(declare-fun b!1413248 () Bool)

(assert (=> b!1413248 (= e!799837 Undefined!10859)))

(declare-fun lt!622549 () SeekEntryResult!10859)

(declare-fun d!152371 () Bool)

(assert (=> d!152371 (and (or ((_ is Undefined!10859) lt!622549) (not ((_ is Found!10859) lt!622549)) (and (bvsge (index!45814 lt!622549) #b00000000000000000000000000000000) (bvslt (index!45814 lt!622549) (size!47196 lt!622406)))) (or ((_ is Undefined!10859) lt!622549) ((_ is Found!10859) lt!622549) (not ((_ is MissingVacant!10859) lt!622549)) (not (= (index!45816 lt!622549) (index!45815 lt!622412))) (and (bvsge (index!45816 lt!622549) #b00000000000000000000000000000000) (bvslt (index!45816 lt!622549) (size!47196 lt!622406)))) (or ((_ is Undefined!10859) lt!622549) (ite ((_ is Found!10859) lt!622549) (= (select (arr!46645 lt!622406) (index!45814 lt!622549)) (select (arr!46645 a!2901) j!112)) (and ((_ is MissingVacant!10859) lt!622549) (= (index!45816 lt!622549) (index!45815 lt!622412)) (= (select (arr!46645 lt!622406) (index!45816 lt!622549)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152371 (= lt!622549 e!799837)))

(declare-fun c!131265 () Bool)

(assert (=> d!152371 (= c!131265 (bvsge (x!127553 lt!622412) #b01111111111111111111111111111110))))

(assert (=> d!152371 (= lt!622548 (select (arr!46645 lt!622406) (index!45815 lt!622412)))))

(assert (=> d!152371 (validMask!0 mask!2840)))

(assert (=> d!152371 (= (seekKeyOrZeroReturnVacant!0 (x!127553 lt!622412) (index!45815 lt!622412) (index!45815 lt!622412) (select (arr!46645 a!2901) j!112) lt!622406 mask!2840) lt!622549)))

(assert (= (and d!152371 c!131265) b!1413248))

(assert (= (and d!152371 (not c!131265)) b!1413249))

(assert (= (and b!1413249 c!131264) b!1413246))

(assert (= (and b!1413249 (not c!131264)) b!1413244))

(assert (= (and b!1413244 c!131266) b!1413245))

(assert (= (and b!1413244 (not c!131266)) b!1413247))

(declare-fun m!1303473 () Bool)

(assert (=> b!1413247 m!1303473))

(assert (=> b!1413247 m!1303473))

(assert (=> b!1413247 m!1303287))

(declare-fun m!1303475 () Bool)

(assert (=> b!1413247 m!1303475))

(declare-fun m!1303477 () Bool)

(assert (=> d!152371 m!1303477))

(declare-fun m!1303479 () Bool)

(assert (=> d!152371 m!1303479))

(declare-fun m!1303481 () Bool)

(assert (=> d!152371 m!1303481))

(assert (=> d!152371 m!1303281))

(assert (=> b!1413021 d!152371))

(declare-fun d!152385 () Bool)

(assert (=> d!152385 (and (not (undefined!11671 lt!622412)) (= (index!45815 lt!622412) i!1037) (bvslt (x!127553 lt!622412) (x!127553 lt!622410)))))

(declare-fun lt!622558 () Unit!47719)

(declare-fun choose!62 (array!96617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47719)

(assert (=> d!152385 (= lt!622558 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622411 (x!127553 lt!622410) (index!45815 lt!622410) (x!127553 lt!622412) (index!45815 lt!622412) (undefined!11671 lt!622412) mask!2840))))

(assert (=> d!152385 (validMask!0 mask!2840)))

(assert (=> d!152385 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622411 (x!127553 lt!622410) (index!45815 lt!622410) (x!127553 lt!622412) (index!45815 lt!622412) (undefined!11671 lt!622412) mask!2840) lt!622558)))

(declare-fun bs!41176 () Bool)

(assert (= bs!41176 d!152385))

(declare-fun m!1303483 () Bool)

(assert (=> bs!41176 m!1303483))

(assert (=> bs!41176 m!1303281))

(assert (=> b!1413021 d!152385))

(declare-fun d!152387 () Bool)

(assert (=> d!152387 (= (validKeyInArray!0 (select (arr!46645 a!2901) j!112)) (and (not (= (select (arr!46645 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46645 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413022 d!152387))

(declare-fun b!1413302 () Bool)

(declare-fun e!799871 () Bool)

(declare-fun call!67146 () Bool)

(assert (=> b!1413302 (= e!799871 call!67146)))

(declare-fun d!152389 () Bool)

(declare-fun res!949683 () Bool)

(declare-fun e!799872 () Bool)

(assert (=> d!152389 (=> res!949683 e!799872)))

(assert (=> d!152389 (= res!949683 (bvsge #b00000000000000000000000000000000 (size!47196 a!2901)))))

(assert (=> d!152389 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33148) e!799872)))

(declare-fun bm!67143 () Bool)

(declare-fun c!131290 () Bool)

(assert (=> bm!67143 (= call!67146 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131290 (Cons!33147 (select (arr!46645 a!2901) #b00000000000000000000000000000000) Nil!33148) Nil!33148)))))

(declare-fun b!1413303 () Bool)

(assert (=> b!1413303 (= e!799871 call!67146)))

(declare-fun b!1413304 () Bool)

(declare-fun e!799869 () Bool)

(assert (=> b!1413304 (= e!799869 e!799871)))

(assert (=> b!1413304 (= c!131290 (validKeyInArray!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413305 () Bool)

(declare-fun e!799870 () Bool)

(declare-fun contains!9853 (List!33151 (_ BitVec 64)) Bool)

(assert (=> b!1413305 (= e!799870 (contains!9853 Nil!33148 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1413306 () Bool)

(assert (=> b!1413306 (= e!799872 e!799869)))

(declare-fun res!949684 () Bool)

(assert (=> b!1413306 (=> (not res!949684) (not e!799869))))

(assert (=> b!1413306 (= res!949684 (not e!799870))))

(declare-fun res!949682 () Bool)

(assert (=> b!1413306 (=> (not res!949682) (not e!799870))))

(assert (=> b!1413306 (= res!949682 (validKeyInArray!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152389 (not res!949683)) b!1413306))

(assert (= (and b!1413306 res!949682) b!1413305))

(assert (= (and b!1413306 res!949684) b!1413304))

(assert (= (and b!1413304 c!131290) b!1413302))

(assert (= (and b!1413304 (not c!131290)) b!1413303))

(assert (= (or b!1413302 b!1413303) bm!67143))

(declare-fun m!1303519 () Bool)

(assert (=> bm!67143 m!1303519))

(declare-fun m!1303521 () Bool)

(assert (=> bm!67143 m!1303521))

(assert (=> b!1413304 m!1303519))

(assert (=> b!1413304 m!1303519))

(declare-fun m!1303523 () Bool)

(assert (=> b!1413304 m!1303523))

(assert (=> b!1413305 m!1303519))

(assert (=> b!1413305 m!1303519))

(declare-fun m!1303525 () Bool)

(assert (=> b!1413305 m!1303525))

(assert (=> b!1413306 m!1303519))

(assert (=> b!1413306 m!1303519))

(assert (=> b!1413306 m!1303523))

(assert (=> b!1413017 d!152389))

(declare-fun b!1413307 () Bool)

(declare-fun e!799875 () SeekEntryResult!10859)

(declare-fun lt!622576 () SeekEntryResult!10859)

(assert (=> b!1413307 (= e!799875 (MissingZero!10859 (index!45815 lt!622576)))))

(declare-fun b!1413308 () Bool)

(assert (=> b!1413308 (= e!799875 (seekKeyOrZeroReturnVacant!0 (x!127553 lt!622576) (index!45815 lt!622576) (index!45815 lt!622576) (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1413309 () Bool)

(declare-fun e!799874 () SeekEntryResult!10859)

(assert (=> b!1413309 (= e!799874 (Found!10859 (index!45815 lt!622576)))))

(declare-fun b!1413310 () Bool)

(declare-fun e!799873 () SeekEntryResult!10859)

(assert (=> b!1413310 (= e!799873 Undefined!10859)))

(declare-fun b!1413311 () Bool)

(declare-fun c!131293 () Bool)

(declare-fun lt!622574 () (_ BitVec 64))

(assert (=> b!1413311 (= c!131293 (= lt!622574 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413311 (= e!799874 e!799875)))

(declare-fun b!1413312 () Bool)

(assert (=> b!1413312 (= e!799873 e!799874)))

(assert (=> b!1413312 (= lt!622574 (select (arr!46645 a!2901) (index!45815 lt!622576)))))

(declare-fun c!131291 () Bool)

(assert (=> b!1413312 (= c!131291 (= lt!622574 (select (arr!46645 a!2901) j!112)))))

(declare-fun d!152397 () Bool)

(declare-fun lt!622575 () SeekEntryResult!10859)

(assert (=> d!152397 (and (or ((_ is Undefined!10859) lt!622575) (not ((_ is Found!10859) lt!622575)) (and (bvsge (index!45814 lt!622575) #b00000000000000000000000000000000) (bvslt (index!45814 lt!622575) (size!47196 a!2901)))) (or ((_ is Undefined!10859) lt!622575) ((_ is Found!10859) lt!622575) (not ((_ is MissingZero!10859) lt!622575)) (and (bvsge (index!45813 lt!622575) #b00000000000000000000000000000000) (bvslt (index!45813 lt!622575) (size!47196 a!2901)))) (or ((_ is Undefined!10859) lt!622575) ((_ is Found!10859) lt!622575) ((_ is MissingZero!10859) lt!622575) (not ((_ is MissingVacant!10859) lt!622575)) (and (bvsge (index!45816 lt!622575) #b00000000000000000000000000000000) (bvslt (index!45816 lt!622575) (size!47196 a!2901)))) (or ((_ is Undefined!10859) lt!622575) (ite ((_ is Found!10859) lt!622575) (= (select (arr!46645 a!2901) (index!45814 lt!622575)) (select (arr!46645 a!2901) j!112)) (ite ((_ is MissingZero!10859) lt!622575) (= (select (arr!46645 a!2901) (index!45813 lt!622575)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10859) lt!622575) (= (select (arr!46645 a!2901) (index!45816 lt!622575)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152397 (= lt!622575 e!799873)))

(declare-fun c!131292 () Bool)

(assert (=> d!152397 (= c!131292 (and ((_ is Intermediate!10859) lt!622576) (undefined!11671 lt!622576)))))

(assert (=> d!152397 (= lt!622576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840) (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152397 (validMask!0 mask!2840)))

(assert (=> d!152397 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) lt!622575)))

(assert (= (and d!152397 c!131292) b!1413310))

(assert (= (and d!152397 (not c!131292)) b!1413312))

(assert (= (and b!1413312 c!131291) b!1413309))

(assert (= (and b!1413312 (not c!131291)) b!1413311))

(assert (= (and b!1413311 c!131293) b!1413307))

(assert (= (and b!1413311 (not c!131293)) b!1413308))

(assert (=> b!1413308 m!1303287))

(declare-fun m!1303527 () Bool)

(assert (=> b!1413308 m!1303527))

(declare-fun m!1303529 () Bool)

(assert (=> b!1413312 m!1303529))

(assert (=> d!152397 m!1303287))

(assert (=> d!152397 m!1303303))

(declare-fun m!1303531 () Bool)

(assert (=> d!152397 m!1303531))

(declare-fun m!1303533 () Bool)

(assert (=> d!152397 m!1303533))

(declare-fun m!1303535 () Bool)

(assert (=> d!152397 m!1303535))

(assert (=> d!152397 m!1303303))

(assert (=> d!152397 m!1303287))

(declare-fun m!1303537 () Bool)

(assert (=> d!152397 m!1303537))

(assert (=> d!152397 m!1303281))

(assert (=> b!1413018 d!152397))

(declare-fun d!152399 () Bool)

(assert (=> d!152399 (= (validKeyInArray!0 (select (arr!46645 a!2901) i!1037)) (and (not (= (select (arr!46645 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46645 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413024 d!152399))

(declare-fun d!152401 () Bool)

(assert (=> d!152401 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121694 d!152401))

(declare-fun d!152411 () Bool)

(assert (=> d!152411 (= (array_inv!35926 a!2901) (bvsge (size!47196 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121694 d!152411))

(declare-fun b!1413329 () Bool)

(declare-fun e!799887 () SeekEntryResult!10859)

(assert (=> b!1413329 (= e!799887 (Intermediate!10859 false (toIndex!0 lt!622408 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413330 () Bool)

(declare-fun lt!622584 () SeekEntryResult!10859)

(assert (=> b!1413330 (and (bvsge (index!45815 lt!622584) #b00000000000000000000000000000000) (bvslt (index!45815 lt!622584) (size!47196 lt!622406)))))

(declare-fun res!949687 () Bool)

(assert (=> b!1413330 (= res!949687 (= (select (arr!46645 lt!622406) (index!45815 lt!622584)) lt!622408))))

(declare-fun e!799888 () Bool)

(assert (=> b!1413330 (=> res!949687 e!799888)))

(declare-fun e!799886 () Bool)

(assert (=> b!1413330 (= e!799886 e!799888)))

(declare-fun b!1413331 () Bool)

(declare-fun e!799885 () Bool)

(assert (=> b!1413331 (= e!799885 e!799886)))

(declare-fun res!949688 () Bool)

(assert (=> b!1413331 (= res!949688 (and ((_ is Intermediate!10859) lt!622584) (not (undefined!11671 lt!622584)) (bvslt (x!127553 lt!622584) #b01111111111111111111111111111110) (bvsge (x!127553 lt!622584) #b00000000000000000000000000000000) (bvsge (x!127553 lt!622584) #b00000000000000000000000000000000)))))

(assert (=> b!1413331 (=> (not res!949688) (not e!799886))))

(declare-fun b!1413332 () Bool)

(assert (=> b!1413332 (= e!799885 (bvsge (x!127553 lt!622584) #b01111111111111111111111111111110))))

(declare-fun b!1413333 () Bool)

(declare-fun e!799889 () SeekEntryResult!10859)

(assert (=> b!1413333 (= e!799889 e!799887)))

(declare-fun c!131301 () Bool)

(declare-fun lt!622585 () (_ BitVec 64))

(assert (=> b!1413333 (= c!131301 (or (= lt!622585 lt!622408) (= (bvadd lt!622585 lt!622585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1413334 () Bool)

(assert (=> b!1413334 (= e!799889 (Intermediate!10859 true (toIndex!0 lt!622408 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1413335 () Bool)

(assert (=> b!1413335 (= e!799887 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!622408 mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) lt!622408 lt!622406 mask!2840))))

(declare-fun b!1413336 () Bool)

(assert (=> b!1413336 (and (bvsge (index!45815 lt!622584) #b00000000000000000000000000000000) (bvslt (index!45815 lt!622584) (size!47196 lt!622406)))))

(declare-fun res!949689 () Bool)

(assert (=> b!1413336 (= res!949689 (= (select (arr!46645 lt!622406) (index!45815 lt!622584)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1413336 (=> res!949689 e!799888)))

(declare-fun b!1413337 () Bool)

(assert (=> b!1413337 (and (bvsge (index!45815 lt!622584) #b00000000000000000000000000000000) (bvslt (index!45815 lt!622584) (size!47196 lt!622406)))))

(assert (=> b!1413337 (= e!799888 (= (select (arr!46645 lt!622406) (index!45815 lt!622584)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152413 () Bool)

(assert (=> d!152413 e!799885))

(declare-fun c!131303 () Bool)

(assert (=> d!152413 (= c!131303 (and ((_ is Intermediate!10859) lt!622584) (undefined!11671 lt!622584)))))

(assert (=> d!152413 (= lt!622584 e!799889)))

(declare-fun c!131302 () Bool)

(assert (=> d!152413 (= c!131302 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152413 (= lt!622585 (select (arr!46645 lt!622406) (toIndex!0 lt!622408 mask!2840)))))

(assert (=> d!152413 (validMask!0 mask!2840)))

(assert (=> d!152413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622408 mask!2840) lt!622408 lt!622406 mask!2840) lt!622584)))

(assert (= (and d!152413 c!131302) b!1413334))

(assert (= (and d!152413 (not c!131302)) b!1413333))

(assert (= (and b!1413333 c!131301) b!1413329))

(assert (= (and b!1413333 (not c!131301)) b!1413335))

(assert (= (and d!152413 c!131303) b!1413332))

(assert (= (and d!152413 (not c!131303)) b!1413331))

(assert (= (and b!1413331 res!949688) b!1413330))

(assert (= (and b!1413330 (not res!949687)) b!1413336))

(assert (= (and b!1413336 (not res!949689)) b!1413337))

(declare-fun m!1303551 () Bool)

(assert (=> b!1413336 m!1303551))

(assert (=> b!1413337 m!1303551))

(assert (=> b!1413335 m!1303297))

(declare-fun m!1303553 () Bool)

(assert (=> b!1413335 m!1303553))

(assert (=> b!1413335 m!1303553))

(declare-fun m!1303555 () Bool)

(assert (=> b!1413335 m!1303555))

(assert (=> d!152413 m!1303297))

(declare-fun m!1303557 () Bool)

(assert (=> d!152413 m!1303557))

(assert (=> d!152413 m!1303281))

(assert (=> b!1413330 m!1303551))

(assert (=> b!1413019 d!152413))

(declare-fun d!152415 () Bool)

(declare-fun lt!622587 () (_ BitVec 32))

(declare-fun lt!622586 () (_ BitVec 32))

(assert (=> d!152415 (= lt!622587 (bvmul (bvxor lt!622586 (bvlshr lt!622586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152415 (= lt!622586 ((_ extract 31 0) (bvand (bvxor lt!622408 (bvlshr lt!622408 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152415 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949637 (let ((h!34430 ((_ extract 31 0) (bvand (bvxor lt!622408 (bvlshr lt!622408 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127557 (bvmul (bvxor h!34430 (bvlshr h!34430 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127557 (bvlshr x!127557 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949637 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949637 #b00000000000000000000000000000000))))))

(assert (=> d!152415 (= (toIndex!0 lt!622408 mask!2840) (bvand (bvxor lt!622587 (bvlshr lt!622587 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413019 d!152415))

(declare-fun b!1413344 () Bool)

(declare-fun e!799893 () Bool)

(declare-fun e!799895 () Bool)

(assert (=> b!1413344 (= e!799893 e!799895)))

(declare-fun lt!622592 () (_ BitVec 64))

(assert (=> b!1413344 (= lt!622592 (select (arr!46645 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!622591 () Unit!47719)

(assert (=> b!1413344 (= lt!622591 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622592 #b00000000000000000000000000000000))))

(assert (=> b!1413344 (arrayContainsKey!0 a!2901 lt!622592 #b00000000000000000000000000000000)))

(declare-fun lt!622590 () Unit!47719)

(assert (=> b!1413344 (= lt!622590 lt!622591)))

(declare-fun res!949690 () Bool)

(assert (=> b!1413344 (= res!949690 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10859 #b00000000000000000000000000000000)))))

(assert (=> b!1413344 (=> (not res!949690) (not e!799895))))

(declare-fun b!1413345 () Bool)

(declare-fun e!799894 () Bool)

(assert (=> b!1413345 (= e!799894 e!799893)))

(declare-fun c!131307 () Bool)

(assert (=> b!1413345 (= c!131307 (validKeyInArray!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152417 () Bool)

(declare-fun res!949691 () Bool)

(assert (=> d!152417 (=> res!949691 e!799894)))

(assert (=> d!152417 (= res!949691 (bvsge #b00000000000000000000000000000000 (size!47196 a!2901)))))

(assert (=> d!152417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!799894)))

(declare-fun bm!67145 () Bool)

(declare-fun call!67148 () Bool)

(assert (=> bm!67145 (= call!67148 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1413346 () Bool)

(assert (=> b!1413346 (= e!799895 call!67148)))

(declare-fun b!1413347 () Bool)

(assert (=> b!1413347 (= e!799893 call!67148)))

(assert (= (and d!152417 (not res!949691)) b!1413345))

(assert (= (and b!1413345 c!131307) b!1413344))

(assert (= (and b!1413345 (not c!131307)) b!1413347))

(assert (= (and b!1413344 res!949690) b!1413346))

(assert (= (or b!1413346 b!1413347) bm!67145))

(assert (=> b!1413344 m!1303519))

(declare-fun m!1303561 () Bool)

(assert (=> b!1413344 m!1303561))

(declare-fun m!1303565 () Bool)

(assert (=> b!1413344 m!1303565))

(assert (=> b!1413344 m!1303519))

(declare-fun m!1303569 () Bool)

(assert (=> b!1413344 m!1303569))

(assert (=> b!1413345 m!1303519))

(assert (=> b!1413345 m!1303519))

(assert (=> b!1413345 m!1303523))

(declare-fun m!1303573 () Bool)

(assert (=> bm!67145 m!1303573))

(assert (=> b!1413020 d!152417))

(check-sat (not d!152347) (not bm!67145) (not b!1413308) (not b!1413305) (not b!1413209) (not b!1413247) (not d!152385) (not d!152371) (not b!1413345) (not d!152343) (not b!1413115) (not b!1413335) (not b!1413344) (not d!152357) (not d!152413) (not b!1413088) (not d!152397) (not bm!67134) (not b!1413087) (not b!1413304) (not b!1413306) (not bm!67143))
(check-sat)
