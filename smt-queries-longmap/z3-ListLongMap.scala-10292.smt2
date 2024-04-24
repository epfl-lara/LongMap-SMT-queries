; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121208 () Bool)

(assert start!121208)

(declare-fun e!797322 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96335 0))(
  ( (array!96336 (arr!46510 (Array (_ BitVec 32) (_ BitVec 64))) (size!47061 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96335)

(declare-fun b!1408558 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10724 0))(
  ( (MissingZero!10724 (index!45273 (_ BitVec 32))) (Found!10724 (index!45274 (_ BitVec 32))) (Intermediate!10724 (undefined!11536 Bool) (index!45275 (_ BitVec 32)) (x!127034 (_ BitVec 32))) (Undefined!10724) (MissingVacant!10724 (index!45276 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96335 (_ BitVec 32)) SeekEntryResult!10724)

(assert (=> b!1408558 (= e!797322 (= (seekEntryOrOpen!0 (select (arr!46510 a!2901) j!112) a!2901 mask!2840) (Found!10724 j!112)))))

(declare-fun b!1408559 () Bool)

(declare-fun res!945768 () Bool)

(declare-fun e!797323 () Bool)

(assert (=> b!1408559 (=> (not res!945768) (not e!797323))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1408559 (= res!945768 (and (= (size!47061 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47061 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47061 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408560 () Bool)

(declare-fun res!945765 () Bool)

(declare-fun e!797324 () Bool)

(assert (=> b!1408560 (=> res!945765 e!797324)))

(declare-fun lt!620183 () SeekEntryResult!10724)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96335 (_ BitVec 32)) SeekEntryResult!10724)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408560 (= res!945765 (not (= lt!620183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)) mask!2840))))))

(declare-fun b!1408561 () Bool)

(assert (=> b!1408561 (= e!797323 (not e!797324))))

(declare-fun res!945767 () Bool)

(assert (=> b!1408561 (=> res!945767 e!797324)))

(get-info :version)

(assert (=> b!1408561 (= res!945767 (or (not ((_ is Intermediate!10724) lt!620183)) (undefined!11536 lt!620183)))))

(assert (=> b!1408561 e!797322))

(declare-fun res!945764 () Bool)

(assert (=> b!1408561 (=> (not res!945764) (not e!797322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96335 (_ BitVec 32)) Bool)

(assert (=> b!1408561 (= res!945764 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47449 0))(
  ( (Unit!47450) )
))
(declare-fun lt!620181 () Unit!47449)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47449)

(assert (=> b!1408561 (= lt!620181 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620182 () (_ BitVec 32))

(assert (=> b!1408561 (= lt!620183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620182 (select (arr!46510 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408561 (= lt!620182 (toIndex!0 (select (arr!46510 a!2901) j!112) mask!2840))))

(declare-fun b!1408562 () Bool)

(declare-fun res!945761 () Bool)

(assert (=> b!1408562 (=> (not res!945761) (not e!797323))))

(assert (=> b!1408562 (= res!945761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!945762 () Bool)

(assert (=> start!121208 (=> (not res!945762) (not e!797323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121208 (= res!945762 (validMask!0 mask!2840))))

(assert (=> start!121208 e!797323))

(assert (=> start!121208 true))

(declare-fun array_inv!35791 (array!96335) Bool)

(assert (=> start!121208 (array_inv!35791 a!2901)))

(declare-fun b!1408563 () Bool)

(declare-fun res!945766 () Bool)

(assert (=> b!1408563 (=> (not res!945766) (not e!797323))))

(declare-datatypes ((List!33016 0))(
  ( (Nil!33013) (Cons!33012 (h!34280 (_ BitVec 64)) (t!47702 List!33016)) )
))
(declare-fun arrayNoDuplicates!0 (array!96335 (_ BitVec 32) List!33016) Bool)

(assert (=> b!1408563 (= res!945766 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33013))))

(declare-fun b!1408564 () Bool)

(declare-fun res!945769 () Bool)

(assert (=> b!1408564 (=> (not res!945769) (not e!797323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408564 (= res!945769 (validKeyInArray!0 (select (arr!46510 a!2901) j!112)))))

(declare-fun b!1408565 () Bool)

(assert (=> b!1408565 (= e!797324 (or (bvslt (x!127034 lt!620183) #b00000000000000000000000000000000) (bvsgt (x!127034 lt!620183) #b01111111111111111111111111111110) (bvslt lt!620182 #b00000000000000000000000000000000) (bvsge lt!620182 (size!47061 a!2901)) (and (bvsge (index!45275 lt!620183) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620183) (size!47061 a!2901)))))))

(declare-fun b!1408566 () Bool)

(declare-fun res!945763 () Bool)

(assert (=> b!1408566 (=> (not res!945763) (not e!797323))))

(assert (=> b!1408566 (= res!945763 (validKeyInArray!0 (select (arr!46510 a!2901) i!1037)))))

(assert (= (and start!121208 res!945762) b!1408559))

(assert (= (and b!1408559 res!945768) b!1408566))

(assert (= (and b!1408566 res!945763) b!1408564))

(assert (= (and b!1408564 res!945769) b!1408562))

(assert (= (and b!1408562 res!945761) b!1408563))

(assert (= (and b!1408563 res!945766) b!1408561))

(assert (= (and b!1408561 res!945764) b!1408558))

(assert (= (and b!1408561 (not res!945767)) b!1408560))

(assert (= (and b!1408560 (not res!945765)) b!1408565))

(declare-fun m!1297897 () Bool)

(assert (=> b!1408564 m!1297897))

(assert (=> b!1408564 m!1297897))

(declare-fun m!1297899 () Bool)

(assert (=> b!1408564 m!1297899))

(assert (=> b!1408561 m!1297897))

(declare-fun m!1297901 () Bool)

(assert (=> b!1408561 m!1297901))

(assert (=> b!1408561 m!1297897))

(assert (=> b!1408561 m!1297897))

(declare-fun m!1297903 () Bool)

(assert (=> b!1408561 m!1297903))

(declare-fun m!1297905 () Bool)

(assert (=> b!1408561 m!1297905))

(declare-fun m!1297907 () Bool)

(assert (=> b!1408561 m!1297907))

(assert (=> b!1408558 m!1297897))

(assert (=> b!1408558 m!1297897))

(declare-fun m!1297909 () Bool)

(assert (=> b!1408558 m!1297909))

(declare-fun m!1297911 () Bool)

(assert (=> b!1408566 m!1297911))

(assert (=> b!1408566 m!1297911))

(declare-fun m!1297913 () Bool)

(assert (=> b!1408566 m!1297913))

(declare-fun m!1297915 () Bool)

(assert (=> b!1408562 m!1297915))

(declare-fun m!1297917 () Bool)

(assert (=> b!1408563 m!1297917))

(declare-fun m!1297919 () Bool)

(assert (=> b!1408560 m!1297919))

(declare-fun m!1297921 () Bool)

(assert (=> b!1408560 m!1297921))

(assert (=> b!1408560 m!1297921))

(declare-fun m!1297923 () Bool)

(assert (=> b!1408560 m!1297923))

(assert (=> b!1408560 m!1297923))

(assert (=> b!1408560 m!1297921))

(declare-fun m!1297925 () Bool)

(assert (=> b!1408560 m!1297925))

(declare-fun m!1297927 () Bool)

(assert (=> start!121208 m!1297927))

(declare-fun m!1297929 () Bool)

(assert (=> start!121208 m!1297929))

(check-sat (not b!1408564) (not b!1408560) (not b!1408562) (not b!1408566) (not start!121208) (not b!1408558) (not b!1408561) (not b!1408563))
(check-sat)
(get-model)

(declare-fun b!1408629 () Bool)

(declare-fun e!797357 () Bool)

(declare-fun call!67053 () Bool)

(assert (=> b!1408629 (= e!797357 call!67053)))

(declare-fun d!151939 () Bool)

(declare-fun res!945828 () Bool)

(declare-fun e!797356 () Bool)

(assert (=> d!151939 (=> res!945828 e!797356)))

(assert (=> d!151939 (= res!945828 (bvsge #b00000000000000000000000000000000 (size!47061 a!2901)))))

(assert (=> d!151939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797356)))

(declare-fun b!1408630 () Bool)

(assert (=> b!1408630 (= e!797356 e!797357)))

(declare-fun c!130873 () Bool)

(assert (=> b!1408630 (= c!130873 (validKeyInArray!0 (select (arr!46510 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408631 () Bool)

(declare-fun e!797355 () Bool)

(assert (=> b!1408631 (= e!797355 call!67053)))

(declare-fun bm!67050 () Bool)

(assert (=> bm!67050 (= call!67053 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1408632 () Bool)

(assert (=> b!1408632 (= e!797357 e!797355)))

(declare-fun lt!620209 () (_ BitVec 64))

(assert (=> b!1408632 (= lt!620209 (select (arr!46510 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620208 () Unit!47449)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96335 (_ BitVec 64) (_ BitVec 32)) Unit!47449)

(assert (=> b!1408632 (= lt!620208 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620209 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1408632 (arrayContainsKey!0 a!2901 lt!620209 #b00000000000000000000000000000000)))

(declare-fun lt!620210 () Unit!47449)

(assert (=> b!1408632 (= lt!620210 lt!620208)))

(declare-fun res!945829 () Bool)

(assert (=> b!1408632 (= res!945829 (= (seekEntryOrOpen!0 (select (arr!46510 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10724 #b00000000000000000000000000000000)))))

(assert (=> b!1408632 (=> (not res!945829) (not e!797355))))

(assert (= (and d!151939 (not res!945828)) b!1408630))

(assert (= (and b!1408630 c!130873) b!1408632))

(assert (= (and b!1408630 (not c!130873)) b!1408629))

(assert (= (and b!1408632 res!945829) b!1408631))

(assert (= (or b!1408631 b!1408629) bm!67050))

(declare-fun m!1297999 () Bool)

(assert (=> b!1408630 m!1297999))

(assert (=> b!1408630 m!1297999))

(declare-fun m!1298001 () Bool)

(assert (=> b!1408630 m!1298001))

(declare-fun m!1298003 () Bool)

(assert (=> bm!67050 m!1298003))

(assert (=> b!1408632 m!1297999))

(declare-fun m!1298005 () Bool)

(assert (=> b!1408632 m!1298005))

(declare-fun m!1298007 () Bool)

(assert (=> b!1408632 m!1298007))

(assert (=> b!1408632 m!1297999))

(declare-fun m!1298009 () Bool)

(assert (=> b!1408632 m!1298009))

(assert (=> b!1408562 d!151939))

(declare-fun d!151941 () Bool)

(assert (=> d!151941 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121208 d!151941))

(declare-fun d!151943 () Bool)

(assert (=> d!151943 (= (array_inv!35791 a!2901) (bvsge (size!47061 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121208 d!151943))

(declare-fun e!797374 () SeekEntryResult!10724)

(declare-fun b!1408659 () Bool)

(assert (=> b!1408659 (= e!797374 (Intermediate!10724 true (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!797375 () SeekEntryResult!10724)

(declare-fun b!1408660 () Bool)

(assert (=> b!1408660 (= e!797375 (Intermediate!10724 false (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1408661 () Bool)

(declare-fun lt!620222 () SeekEntryResult!10724)

(assert (=> b!1408661 (and (bvsge (index!45275 lt!620222) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620222) (size!47061 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)))))))

(declare-fun e!797378 () Bool)

(assert (=> b!1408661 (= e!797378 (= (select (arr!46510 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901))) (index!45275 lt!620222)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151945 () Bool)

(declare-fun e!797377 () Bool)

(assert (=> d!151945 e!797377))

(declare-fun c!130884 () Bool)

(assert (=> d!151945 (= c!130884 (and ((_ is Intermediate!10724) lt!620222) (undefined!11536 lt!620222)))))

(assert (=> d!151945 (= lt!620222 e!797374)))

(declare-fun c!130883 () Bool)

(assert (=> d!151945 (= c!130883 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620221 () (_ BitVec 64))

(assert (=> d!151945 (= lt!620221 (select (arr!46510 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901))) (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151945 (validMask!0 mask!2840)))

(assert (=> d!151945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)) mask!2840) lt!620222)))

(declare-fun b!1408662 () Bool)

(declare-fun e!797376 () Bool)

(assert (=> b!1408662 (= e!797377 e!797376)))

(declare-fun res!945841 () Bool)

(assert (=> b!1408662 (= res!945841 (and ((_ is Intermediate!10724) lt!620222) (not (undefined!11536 lt!620222)) (bvslt (x!127034 lt!620222) #b01111111111111111111111111111110) (bvsge (x!127034 lt!620222) #b00000000000000000000000000000000) (bvsge (x!127034 lt!620222) #b00000000000000000000000000000000)))))

(assert (=> b!1408662 (=> (not res!945841) (not e!797376))))

(declare-fun b!1408663 () Bool)

(assert (=> b!1408663 (= e!797377 (bvsge (x!127034 lt!620222) #b01111111111111111111111111111110))))

(declare-fun b!1408664 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408664 (= e!797375 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)) mask!2840))))

(declare-fun b!1408665 () Bool)

(assert (=> b!1408665 (and (bvsge (index!45275 lt!620222) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620222) (size!47061 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)))))))

(declare-fun res!945842 () Bool)

(assert (=> b!1408665 (= res!945842 (= (select (arr!46510 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901))) (index!45275 lt!620222)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1408665 (=> res!945842 e!797378)))

(declare-fun b!1408666 () Bool)

(assert (=> b!1408666 (= e!797374 e!797375)))

(declare-fun c!130882 () Bool)

(assert (=> b!1408666 (= c!130882 (or (= lt!620221 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620221 lt!620221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1408667 () Bool)

(assert (=> b!1408667 (and (bvsge (index!45275 lt!620222) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620222) (size!47061 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901)))))))

(declare-fun res!945840 () Bool)

(assert (=> b!1408667 (= res!945840 (= (select (arr!46510 (array!96336 (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47061 a!2901))) (index!45275 lt!620222)) (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1408667 (=> res!945840 e!797378)))

(assert (=> b!1408667 (= e!797376 e!797378)))

(assert (= (and d!151945 c!130883) b!1408659))

(assert (= (and d!151945 (not c!130883)) b!1408666))

(assert (= (and b!1408666 c!130882) b!1408660))

(assert (= (and b!1408666 (not c!130882)) b!1408664))

(assert (= (and d!151945 c!130884) b!1408663))

(assert (= (and d!151945 (not c!130884)) b!1408662))

(assert (= (and b!1408662 res!945841) b!1408667))

(assert (= (and b!1408667 (not res!945840)) b!1408665))

(assert (= (and b!1408665 (not res!945842)) b!1408661))

(declare-fun m!1298011 () Bool)

(assert (=> b!1408661 m!1298011))

(assert (=> b!1408667 m!1298011))

(assert (=> d!151945 m!1297923))

(declare-fun m!1298015 () Bool)

(assert (=> d!151945 m!1298015))

(assert (=> d!151945 m!1297927))

(assert (=> b!1408665 m!1298011))

(assert (=> b!1408664 m!1297923))

(declare-fun m!1298021 () Bool)

(assert (=> b!1408664 m!1298021))

(assert (=> b!1408664 m!1298021))

(assert (=> b!1408664 m!1297921))

(declare-fun m!1298023 () Bool)

(assert (=> b!1408664 m!1298023))

(assert (=> b!1408560 d!151945))

(declare-fun d!151953 () Bool)

(declare-fun lt!620238 () (_ BitVec 32))

(declare-fun lt!620237 () (_ BitVec 32))

(assert (=> d!151953 (= lt!620238 (bvmul (bvxor lt!620237 (bvlshr lt!620237 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151953 (= lt!620237 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151953 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945845 (let ((h!34283 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127038 (bvmul (bvxor h!34283 (bvlshr h!34283 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127038 (bvlshr x!127038 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945845 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945845 #b00000000000000000000000000000000))))))

(assert (=> d!151953 (= (toIndex!0 (select (store (arr!46510 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620238 (bvlshr lt!620238 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1408560 d!151953))

(declare-fun b!1408690 () Bool)

(declare-fun e!797394 () Bool)

(declare-fun call!67057 () Bool)

(assert (=> b!1408690 (= e!797394 call!67057)))

(declare-fun d!151957 () Bool)

(declare-fun res!945852 () Bool)

(declare-fun e!797393 () Bool)

(assert (=> d!151957 (=> res!945852 e!797393)))

(assert (=> d!151957 (= res!945852 (bvsge j!112 (size!47061 a!2901)))))

(assert (=> d!151957 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797393)))

(declare-fun b!1408691 () Bool)

(assert (=> b!1408691 (= e!797393 e!797394)))

(declare-fun c!130892 () Bool)

(assert (=> b!1408691 (= c!130892 (validKeyInArray!0 (select (arr!46510 a!2901) j!112)))))

(declare-fun b!1408692 () Bool)

(declare-fun e!797392 () Bool)

(assert (=> b!1408692 (= e!797392 call!67057)))

(declare-fun bm!67054 () Bool)

(assert (=> bm!67054 (= call!67057 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1408693 () Bool)

(assert (=> b!1408693 (= e!797394 e!797392)))

(declare-fun lt!620240 () (_ BitVec 64))

(assert (=> b!1408693 (= lt!620240 (select (arr!46510 a!2901) j!112))))

(declare-fun lt!620239 () Unit!47449)

(assert (=> b!1408693 (= lt!620239 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620240 j!112))))

(assert (=> b!1408693 (arrayContainsKey!0 a!2901 lt!620240 #b00000000000000000000000000000000)))

(declare-fun lt!620241 () Unit!47449)

(assert (=> b!1408693 (= lt!620241 lt!620239)))

(declare-fun res!945853 () Bool)

(assert (=> b!1408693 (= res!945853 (= (seekEntryOrOpen!0 (select (arr!46510 a!2901) j!112) a!2901 mask!2840) (Found!10724 j!112)))))

(assert (=> b!1408693 (=> (not res!945853) (not e!797392))))

(assert (= (and d!151957 (not res!945852)) b!1408691))

(assert (= (and b!1408691 c!130892) b!1408693))

(assert (= (and b!1408691 (not c!130892)) b!1408690))

(assert (= (and b!1408693 res!945853) b!1408692))

(assert (= (or b!1408692 b!1408690) bm!67054))

(assert (=> b!1408691 m!1297897))

(assert (=> b!1408691 m!1297897))

(assert (=> b!1408691 m!1297899))

(declare-fun m!1298027 () Bool)

(assert (=> bm!67054 m!1298027))

(assert (=> b!1408693 m!1297897))

(declare-fun m!1298029 () Bool)

(assert (=> b!1408693 m!1298029))

(declare-fun m!1298031 () Bool)

(assert (=> b!1408693 m!1298031))

(assert (=> b!1408693 m!1297897))

(assert (=> b!1408693 m!1297909))

(assert (=> b!1408561 d!151957))

(declare-fun d!151959 () Bool)

(assert (=> d!151959 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620246 () Unit!47449)

(declare-fun choose!38 (array!96335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47449)

(assert (=> d!151959 (= lt!620246 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151959 (validMask!0 mask!2840)))

(assert (=> d!151959 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620246)))

(declare-fun bs!41027 () Bool)

(assert (= bs!41027 d!151959))

(assert (=> bs!41027 m!1297907))

(declare-fun m!1298041 () Bool)

(assert (=> bs!41027 m!1298041))

(assert (=> bs!41027 m!1297927))

(assert (=> b!1408561 d!151959))

(declare-fun b!1408703 () Bool)

(declare-fun e!797400 () SeekEntryResult!10724)

(assert (=> b!1408703 (= e!797400 (Intermediate!10724 true lt!620182 #b00000000000000000000000000000000))))

(declare-fun b!1408704 () Bool)

(declare-fun e!797401 () SeekEntryResult!10724)

(assert (=> b!1408704 (= e!797401 (Intermediate!10724 false lt!620182 #b00000000000000000000000000000000))))

(declare-fun b!1408705 () Bool)

(declare-fun lt!620248 () SeekEntryResult!10724)

(assert (=> b!1408705 (and (bvsge (index!45275 lt!620248) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620248) (size!47061 a!2901)))))

(declare-fun e!797404 () Bool)

(assert (=> b!1408705 (= e!797404 (= (select (arr!46510 a!2901) (index!45275 lt!620248)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151963 () Bool)

(declare-fun e!797403 () Bool)

(assert (=> d!151963 e!797403))

(declare-fun c!130898 () Bool)

(assert (=> d!151963 (= c!130898 (and ((_ is Intermediate!10724) lt!620248) (undefined!11536 lt!620248)))))

(assert (=> d!151963 (= lt!620248 e!797400)))

(declare-fun c!130897 () Bool)

(assert (=> d!151963 (= c!130897 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620247 () (_ BitVec 64))

(assert (=> d!151963 (= lt!620247 (select (arr!46510 a!2901) lt!620182))))

(assert (=> d!151963 (validMask!0 mask!2840)))

(assert (=> d!151963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620182 (select (arr!46510 a!2901) j!112) a!2901 mask!2840) lt!620248)))

(declare-fun b!1408706 () Bool)

(declare-fun e!797402 () Bool)

(assert (=> b!1408706 (= e!797403 e!797402)))

(declare-fun res!945859 () Bool)

(assert (=> b!1408706 (= res!945859 (and ((_ is Intermediate!10724) lt!620248) (not (undefined!11536 lt!620248)) (bvslt (x!127034 lt!620248) #b01111111111111111111111111111110) (bvsge (x!127034 lt!620248) #b00000000000000000000000000000000) (bvsge (x!127034 lt!620248) #b00000000000000000000000000000000)))))

(assert (=> b!1408706 (=> (not res!945859) (not e!797402))))

(declare-fun b!1408707 () Bool)

(assert (=> b!1408707 (= e!797403 (bvsge (x!127034 lt!620248) #b01111111111111111111111111111110))))

(declare-fun b!1408708 () Bool)

(assert (=> b!1408708 (= e!797401 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620182 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46510 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408709 () Bool)

(assert (=> b!1408709 (and (bvsge (index!45275 lt!620248) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620248) (size!47061 a!2901)))))

(declare-fun res!945860 () Bool)

(assert (=> b!1408709 (= res!945860 (= (select (arr!46510 a!2901) (index!45275 lt!620248)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1408709 (=> res!945860 e!797404)))

(declare-fun b!1408710 () Bool)

(assert (=> b!1408710 (= e!797400 e!797401)))

(declare-fun c!130896 () Bool)

(assert (=> b!1408710 (= c!130896 (or (= lt!620247 (select (arr!46510 a!2901) j!112)) (= (bvadd lt!620247 lt!620247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1408711 () Bool)

(assert (=> b!1408711 (and (bvsge (index!45275 lt!620248) #b00000000000000000000000000000000) (bvslt (index!45275 lt!620248) (size!47061 a!2901)))))

(declare-fun res!945858 () Bool)

(assert (=> b!1408711 (= res!945858 (= (select (arr!46510 a!2901) (index!45275 lt!620248)) (select (arr!46510 a!2901) j!112)))))

(assert (=> b!1408711 (=> res!945858 e!797404)))

(assert (=> b!1408711 (= e!797402 e!797404)))

(assert (= (and d!151963 c!130897) b!1408703))

(assert (= (and d!151963 (not c!130897)) b!1408710))

(assert (= (and b!1408710 c!130896) b!1408704))

(assert (= (and b!1408710 (not c!130896)) b!1408708))

(assert (= (and d!151963 c!130898) b!1408707))

(assert (= (and d!151963 (not c!130898)) b!1408706))

(assert (= (and b!1408706 res!945859) b!1408711))

(assert (= (and b!1408711 (not res!945858)) b!1408709))

(assert (= (and b!1408709 (not res!945860)) b!1408705))

(declare-fun m!1298043 () Bool)

(assert (=> b!1408705 m!1298043))

(assert (=> b!1408711 m!1298043))

(declare-fun m!1298045 () Bool)

(assert (=> d!151963 m!1298045))

(assert (=> d!151963 m!1297927))

(assert (=> b!1408709 m!1298043))

(declare-fun m!1298047 () Bool)

(assert (=> b!1408708 m!1298047))

(assert (=> b!1408708 m!1298047))

(assert (=> b!1408708 m!1297897))

(declare-fun m!1298049 () Bool)

(assert (=> b!1408708 m!1298049))

(assert (=> b!1408561 d!151963))

(declare-fun d!151965 () Bool)

(declare-fun lt!620250 () (_ BitVec 32))

(declare-fun lt!620249 () (_ BitVec 32))

(assert (=> d!151965 (= lt!620250 (bvmul (bvxor lt!620249 (bvlshr lt!620249 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151965 (= lt!620249 ((_ extract 31 0) (bvand (bvxor (select (arr!46510 a!2901) j!112) (bvlshr (select (arr!46510 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151965 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945845 (let ((h!34283 ((_ extract 31 0) (bvand (bvxor (select (arr!46510 a!2901) j!112) (bvlshr (select (arr!46510 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127038 (bvmul (bvxor h!34283 (bvlshr h!34283 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127038 (bvlshr x!127038 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945845 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945845 #b00000000000000000000000000000000))))))

(assert (=> d!151965 (= (toIndex!0 (select (arr!46510 a!2901) j!112) mask!2840) (bvand (bvxor lt!620250 (bvlshr lt!620250 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1408561 d!151965))

(declare-fun d!151967 () Bool)

(assert (=> d!151967 (= (validKeyInArray!0 (select (arr!46510 a!2901) i!1037)) (and (not (= (select (arr!46510 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46510 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1408566 d!151967))

(declare-fun d!151969 () Bool)

(assert (=> d!151969 (= (validKeyInArray!0 (select (arr!46510 a!2901) j!112)) (and (not (= (select (arr!46510 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46510 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1408564 d!151969))

(declare-fun bm!67059 () Bool)

(declare-fun call!67062 () Bool)

(declare-fun c!130912 () Bool)

(assert (=> bm!67059 (= call!67062 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130912 (Cons!33012 (select (arr!46510 a!2901) #b00000000000000000000000000000000) Nil!33013) Nil!33013)))))

(declare-fun b!1408759 () Bool)

(declare-fun e!797437 () Bool)

(assert (=> b!1408759 (= e!797437 call!67062)))

(declare-fun b!1408760 () Bool)

(assert (=> b!1408760 (= e!797437 call!67062)))

(declare-fun b!1408761 () Bool)

(declare-fun e!797438 () Bool)

(assert (=> b!1408761 (= e!797438 e!797437)))

(assert (=> b!1408761 (= c!130912 (validKeyInArray!0 (select (arr!46510 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151971 () Bool)

(declare-fun res!945883 () Bool)

(declare-fun e!797436 () Bool)

(assert (=> d!151971 (=> res!945883 e!797436)))

(assert (=> d!151971 (= res!945883 (bvsge #b00000000000000000000000000000000 (size!47061 a!2901)))))

(assert (=> d!151971 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33013) e!797436)))

(declare-fun b!1408762 () Bool)

(declare-fun e!797439 () Bool)

(declare-fun contains!9842 (List!33016 (_ BitVec 64)) Bool)

(assert (=> b!1408762 (= e!797439 (contains!9842 Nil!33013 (select (arr!46510 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1408763 () Bool)

(assert (=> b!1408763 (= e!797436 e!797438)))

(declare-fun res!945885 () Bool)

(assert (=> b!1408763 (=> (not res!945885) (not e!797438))))

(assert (=> b!1408763 (= res!945885 (not e!797439))))

(declare-fun res!945884 () Bool)

(assert (=> b!1408763 (=> (not res!945884) (not e!797439))))

(assert (=> b!1408763 (= res!945884 (validKeyInArray!0 (select (arr!46510 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151971 (not res!945883)) b!1408763))

(assert (= (and b!1408763 res!945884) b!1408762))

(assert (= (and b!1408763 res!945885) b!1408761))

(assert (= (and b!1408761 c!130912) b!1408759))

(assert (= (and b!1408761 (not c!130912)) b!1408760))

(assert (= (or b!1408759 b!1408760) bm!67059))

(assert (=> bm!67059 m!1297999))

(declare-fun m!1298059 () Bool)

(assert (=> bm!67059 m!1298059))

(assert (=> b!1408761 m!1297999))

(assert (=> b!1408761 m!1297999))

(assert (=> b!1408761 m!1298001))

(assert (=> b!1408762 m!1297999))

(assert (=> b!1408762 m!1297999))

(declare-fun m!1298061 () Bool)

(assert (=> b!1408762 m!1298061))

(assert (=> b!1408763 m!1297999))

(assert (=> b!1408763 m!1297999))

(assert (=> b!1408763 m!1298001))

(assert (=> b!1408563 d!151971))

(declare-fun d!151979 () Bool)

(declare-fun lt!620285 () SeekEntryResult!10724)

(assert (=> d!151979 (and (or ((_ is Undefined!10724) lt!620285) (not ((_ is Found!10724) lt!620285)) (and (bvsge (index!45274 lt!620285) #b00000000000000000000000000000000) (bvslt (index!45274 lt!620285) (size!47061 a!2901)))) (or ((_ is Undefined!10724) lt!620285) ((_ is Found!10724) lt!620285) (not ((_ is MissingZero!10724) lt!620285)) (and (bvsge (index!45273 lt!620285) #b00000000000000000000000000000000) (bvslt (index!45273 lt!620285) (size!47061 a!2901)))) (or ((_ is Undefined!10724) lt!620285) ((_ is Found!10724) lt!620285) ((_ is MissingZero!10724) lt!620285) (not ((_ is MissingVacant!10724) lt!620285)) (and (bvsge (index!45276 lt!620285) #b00000000000000000000000000000000) (bvslt (index!45276 lt!620285) (size!47061 a!2901)))) (or ((_ is Undefined!10724) lt!620285) (ite ((_ is Found!10724) lt!620285) (= (select (arr!46510 a!2901) (index!45274 lt!620285)) (select (arr!46510 a!2901) j!112)) (ite ((_ is MissingZero!10724) lt!620285) (= (select (arr!46510 a!2901) (index!45273 lt!620285)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10724) lt!620285) (= (select (arr!46510 a!2901) (index!45276 lt!620285)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!797471 () SeekEntryResult!10724)

(assert (=> d!151979 (= lt!620285 e!797471)))

(declare-fun c!130926 () Bool)

(declare-fun lt!620284 () SeekEntryResult!10724)

(assert (=> d!151979 (= c!130926 (and ((_ is Intermediate!10724) lt!620284) (undefined!11536 lt!620284)))))

(assert (=> d!151979 (= lt!620284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46510 a!2901) j!112) mask!2840) (select (arr!46510 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151979 (validMask!0 mask!2840)))

(assert (=> d!151979 (= (seekEntryOrOpen!0 (select (arr!46510 a!2901) j!112) a!2901 mask!2840) lt!620285)))

(declare-fun b!1408808 () Bool)

(assert (=> b!1408808 (= e!797471 Undefined!10724)))

(declare-fun b!1408809 () Bool)

(declare-fun e!797472 () SeekEntryResult!10724)

(assert (=> b!1408809 (= e!797472 (Found!10724 (index!45275 lt!620284)))))

(declare-fun b!1408810 () Bool)

(declare-fun e!797473 () SeekEntryResult!10724)

(assert (=> b!1408810 (= e!797473 (MissingZero!10724 (index!45275 lt!620284)))))

(declare-fun b!1408811 () Bool)

(declare-fun c!130928 () Bool)

(declare-fun lt!620286 () (_ BitVec 64))

(assert (=> b!1408811 (= c!130928 (= lt!620286 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1408811 (= e!797472 e!797473)))

(declare-fun b!1408812 () Bool)

(assert (=> b!1408812 (= e!797471 e!797472)))

(assert (=> b!1408812 (= lt!620286 (select (arr!46510 a!2901) (index!45275 lt!620284)))))

(declare-fun c!130927 () Bool)

(assert (=> b!1408812 (= c!130927 (= lt!620286 (select (arr!46510 a!2901) j!112)))))

(declare-fun b!1408813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96335 (_ BitVec 32)) SeekEntryResult!10724)

(assert (=> b!1408813 (= e!797473 (seekKeyOrZeroReturnVacant!0 (x!127034 lt!620284) (index!45275 lt!620284) (index!45275 lt!620284) (select (arr!46510 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151979 c!130926) b!1408808))

(assert (= (and d!151979 (not c!130926)) b!1408812))

(assert (= (and b!1408812 c!130927) b!1408809))

(assert (= (and b!1408812 (not c!130927)) b!1408811))

(assert (= (and b!1408811 c!130928) b!1408810))

(assert (= (and b!1408811 (not c!130928)) b!1408813))

(declare-fun m!1298087 () Bool)

(assert (=> d!151979 m!1298087))

(assert (=> d!151979 m!1297927))

(declare-fun m!1298089 () Bool)

(assert (=> d!151979 m!1298089))

(assert (=> d!151979 m!1297897))

(assert (=> d!151979 m!1297901))

(assert (=> d!151979 m!1297901))

(assert (=> d!151979 m!1297897))

(declare-fun m!1298091 () Bool)

(assert (=> d!151979 m!1298091))

(declare-fun m!1298093 () Bool)

(assert (=> d!151979 m!1298093))

(declare-fun m!1298095 () Bool)

(assert (=> b!1408812 m!1298095))

(assert (=> b!1408813 m!1297897))

(declare-fun m!1298097 () Bool)

(assert (=> b!1408813 m!1298097))

(assert (=> b!1408558 d!151979))

(check-sat (not b!1408763) (not d!151945) (not b!1408664) (not d!151979) (not b!1408761) (not d!151959) (not b!1408632) (not bm!67050) (not b!1408762) (not b!1408813) (not b!1408708) (not bm!67059) (not b!1408691) (not b!1408630) (not b!1408693) (not d!151963) (not bm!67054))
(check-sat)
