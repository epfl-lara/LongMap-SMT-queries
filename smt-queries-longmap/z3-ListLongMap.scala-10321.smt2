; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121352 () Bool)

(assert start!121352)

(declare-fun b!1410251 () Bool)

(declare-fun res!947696 () Bool)

(declare-fun e!798068 () Bool)

(assert (=> b!1410251 (=> (not res!947696) (not e!798068))))

(declare-datatypes ((array!96357 0))(
  ( (array!96358 (arr!46519 (Array (_ BitVec 32) (_ BitVec 64))) (size!47071 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96357)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410251 (= res!947696 (validKeyInArray!0 (select (arr!46519 a!2901) i!1037)))))

(declare-datatypes ((SeekEntryResult!10856 0))(
  ( (MissingZero!10856 (index!45801 (_ BitVec 32))) (Found!10856 (index!45802 (_ BitVec 32))) (Intermediate!10856 (undefined!11668 Bool) (index!45803 (_ BitVec 32)) (x!127394 (_ BitVec 32))) (Undefined!10856) (MissingVacant!10856 (index!45804 (_ BitVec 32))) )
))
(declare-fun lt!620927 () SeekEntryResult!10856)

(declare-fun e!798066 () Bool)

(declare-fun lt!620930 () SeekEntryResult!10856)

(declare-fun lt!620928 () (_ BitVec 32))

(declare-fun b!1410252 () Bool)

(get-info :version)

(assert (=> b!1410252 (= e!798066 (or (= lt!620927 lt!620930) (not ((_ is Intermediate!10856) lt!620930)) (bvslt (x!127394 lt!620927) #b00000000000000000000000000000000) (bvsgt (x!127394 lt!620927) #b01111111111111111111111111111110) (bvslt lt!620928 #b00000000000000000000000000000000) (bvsge lt!620928 (size!47071 a!2901)) (and (bvsge (index!45803 lt!620927) #b00000000000000000000000000000000) (bvslt (index!45803 lt!620927) (size!47071 a!2901)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96357 (_ BitVec 32)) SeekEntryResult!10856)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410252 (= lt!620930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)) mask!2840))))

(declare-fun b!1410253 () Bool)

(declare-fun res!947694 () Bool)

(assert (=> b!1410253 (=> (not res!947694) (not e!798068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96357 (_ BitVec 32)) Bool)

(assert (=> b!1410253 (= res!947694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410254 () Bool)

(declare-fun res!947699 () Bool)

(assert (=> b!1410254 (=> (not res!947699) (not e!798068))))

(assert (=> b!1410254 (= res!947699 (and (= (size!47071 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47071 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47071 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410255 () Bool)

(assert (=> b!1410255 (= e!798068 (not e!798066))))

(declare-fun res!947695 () Bool)

(assert (=> b!1410255 (=> res!947695 e!798066)))

(assert (=> b!1410255 (= res!947695 (or (not ((_ is Intermediate!10856) lt!620927)) (undefined!11668 lt!620927)))))

(declare-fun e!798067 () Bool)

(assert (=> b!1410255 e!798067))

(declare-fun res!947701 () Bool)

(assert (=> b!1410255 (=> (not res!947701) (not e!798067))))

(assert (=> b!1410255 (= res!947701 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47529 0))(
  ( (Unit!47530) )
))
(declare-fun lt!620929 () Unit!47529)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47529)

(assert (=> b!1410255 (= lt!620929 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410255 (= lt!620927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620928 (select (arr!46519 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410255 (= lt!620928 (toIndex!0 (select (arr!46519 a!2901) j!112) mask!2840))))

(declare-fun b!1410256 () Bool)

(declare-fun res!947697 () Bool)

(assert (=> b!1410256 (=> (not res!947697) (not e!798068))))

(declare-datatypes ((List!33116 0))(
  ( (Nil!33113) (Cons!33112 (h!34381 (_ BitVec 64)) (t!47802 List!33116)) )
))
(declare-fun arrayNoDuplicates!0 (array!96357 (_ BitVec 32) List!33116) Bool)

(assert (=> b!1410256 (= res!947697 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33113))))

(declare-fun res!947700 () Bool)

(assert (=> start!121352 (=> (not res!947700) (not e!798068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121352 (= res!947700 (validMask!0 mask!2840))))

(assert (=> start!121352 e!798068))

(assert (=> start!121352 true))

(declare-fun array_inv!35752 (array!96357) Bool)

(assert (=> start!121352 (array_inv!35752 a!2901)))

(declare-fun b!1410257 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96357 (_ BitVec 32)) SeekEntryResult!10856)

(assert (=> b!1410257 (= e!798067 (= (seekEntryOrOpen!0 (select (arr!46519 a!2901) j!112) a!2901 mask!2840) (Found!10856 j!112)))))

(declare-fun b!1410258 () Bool)

(declare-fun res!947698 () Bool)

(assert (=> b!1410258 (=> (not res!947698) (not e!798068))))

(assert (=> b!1410258 (= res!947698 (validKeyInArray!0 (select (arr!46519 a!2901) j!112)))))

(assert (= (and start!121352 res!947700) b!1410254))

(assert (= (and b!1410254 res!947699) b!1410251))

(assert (= (and b!1410251 res!947696) b!1410258))

(assert (= (and b!1410258 res!947698) b!1410253))

(assert (= (and b!1410253 res!947694) b!1410256))

(assert (= (and b!1410256 res!947697) b!1410255))

(assert (= (and b!1410255 res!947701) b!1410257))

(assert (= (and b!1410255 (not res!947695)) b!1410252))

(declare-fun m!1299469 () Bool)

(assert (=> b!1410253 m!1299469))

(declare-fun m!1299471 () Bool)

(assert (=> b!1410258 m!1299471))

(assert (=> b!1410258 m!1299471))

(declare-fun m!1299473 () Bool)

(assert (=> b!1410258 m!1299473))

(assert (=> b!1410257 m!1299471))

(assert (=> b!1410257 m!1299471))

(declare-fun m!1299475 () Bool)

(assert (=> b!1410257 m!1299475))

(assert (=> b!1410255 m!1299471))

(declare-fun m!1299477 () Bool)

(assert (=> b!1410255 m!1299477))

(assert (=> b!1410255 m!1299471))

(declare-fun m!1299479 () Bool)

(assert (=> b!1410255 m!1299479))

(assert (=> b!1410255 m!1299471))

(declare-fun m!1299481 () Bool)

(assert (=> b!1410255 m!1299481))

(declare-fun m!1299483 () Bool)

(assert (=> b!1410255 m!1299483))

(declare-fun m!1299485 () Bool)

(assert (=> b!1410256 m!1299485))

(declare-fun m!1299487 () Bool)

(assert (=> b!1410252 m!1299487))

(declare-fun m!1299489 () Bool)

(assert (=> b!1410252 m!1299489))

(assert (=> b!1410252 m!1299489))

(declare-fun m!1299491 () Bool)

(assert (=> b!1410252 m!1299491))

(assert (=> b!1410252 m!1299491))

(assert (=> b!1410252 m!1299489))

(declare-fun m!1299493 () Bool)

(assert (=> b!1410252 m!1299493))

(declare-fun m!1299495 () Bool)

(assert (=> start!121352 m!1299495))

(declare-fun m!1299497 () Bool)

(assert (=> start!121352 m!1299497))

(declare-fun m!1299499 () Bool)

(assert (=> b!1410251 m!1299499))

(assert (=> b!1410251 m!1299499))

(declare-fun m!1299501 () Bool)

(assert (=> b!1410251 m!1299501))

(check-sat (not b!1410253) (not start!121352) (not b!1410257) (not b!1410256) (not b!1410252) (not b!1410251) (not b!1410255) (not b!1410258))
(check-sat)
(get-model)

(declare-fun d!151761 () Bool)

(declare-fun res!947755 () Bool)

(declare-fun e!798100 () Bool)

(assert (=> d!151761 (=> res!947755 e!798100)))

(assert (=> d!151761 (= res!947755 (bvsge #b00000000000000000000000000000000 (size!47071 a!2901)))))

(assert (=> d!151761 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798100)))

(declare-fun b!1410315 () Bool)

(declare-fun e!798099 () Bool)

(declare-fun call!67037 () Bool)

(assert (=> b!1410315 (= e!798099 call!67037)))

(declare-fun b!1410316 () Bool)

(declare-fun e!798101 () Bool)

(assert (=> b!1410316 (= e!798101 e!798099)))

(declare-fun lt!620963 () (_ BitVec 64))

(assert (=> b!1410316 (= lt!620963 (select (arr!46519 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620962 () Unit!47529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96357 (_ BitVec 64) (_ BitVec 32)) Unit!47529)

(assert (=> b!1410316 (= lt!620962 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620963 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410316 (arrayContainsKey!0 a!2901 lt!620963 #b00000000000000000000000000000000)))

(declare-fun lt!620961 () Unit!47529)

(assert (=> b!1410316 (= lt!620961 lt!620962)))

(declare-fun res!947754 () Bool)

(assert (=> b!1410316 (= res!947754 (= (seekEntryOrOpen!0 (select (arr!46519 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10856 #b00000000000000000000000000000000)))))

(assert (=> b!1410316 (=> (not res!947754) (not e!798099))))

(declare-fun b!1410317 () Bool)

(assert (=> b!1410317 (= e!798101 call!67037)))

(declare-fun b!1410318 () Bool)

(assert (=> b!1410318 (= e!798100 e!798101)))

(declare-fun c!130753 () Bool)

(assert (=> b!1410318 (= c!130753 (validKeyInArray!0 (select (arr!46519 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67034 () Bool)

(assert (=> bm!67034 (= call!67037 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151761 (not res!947755)) b!1410318))

(assert (= (and b!1410318 c!130753) b!1410316))

(assert (= (and b!1410318 (not c!130753)) b!1410317))

(assert (= (and b!1410316 res!947754) b!1410315))

(assert (= (or b!1410315 b!1410317) bm!67034))

(declare-fun m!1299571 () Bool)

(assert (=> b!1410316 m!1299571))

(declare-fun m!1299573 () Bool)

(assert (=> b!1410316 m!1299573))

(declare-fun m!1299575 () Bool)

(assert (=> b!1410316 m!1299575))

(assert (=> b!1410316 m!1299571))

(declare-fun m!1299577 () Bool)

(assert (=> b!1410316 m!1299577))

(assert (=> b!1410318 m!1299571))

(assert (=> b!1410318 m!1299571))

(declare-fun m!1299579 () Bool)

(assert (=> b!1410318 m!1299579))

(declare-fun m!1299581 () Bool)

(assert (=> bm!67034 m!1299581))

(assert (=> b!1410253 d!151761))

(declare-fun d!151763 () Bool)

(assert (=> d!151763 (= (validKeyInArray!0 (select (arr!46519 a!2901) j!112)) (and (not (= (select (arr!46519 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46519 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410258 d!151763))

(declare-fun d!151765 () Bool)

(declare-fun res!947757 () Bool)

(declare-fun e!798103 () Bool)

(assert (=> d!151765 (=> res!947757 e!798103)))

(assert (=> d!151765 (= res!947757 (bvsge j!112 (size!47071 a!2901)))))

(assert (=> d!151765 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798103)))

(declare-fun b!1410319 () Bool)

(declare-fun e!798102 () Bool)

(declare-fun call!67038 () Bool)

(assert (=> b!1410319 (= e!798102 call!67038)))

(declare-fun b!1410320 () Bool)

(declare-fun e!798104 () Bool)

(assert (=> b!1410320 (= e!798104 e!798102)))

(declare-fun lt!620966 () (_ BitVec 64))

(assert (=> b!1410320 (= lt!620966 (select (arr!46519 a!2901) j!112))))

(declare-fun lt!620965 () Unit!47529)

(assert (=> b!1410320 (= lt!620965 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620966 j!112))))

(assert (=> b!1410320 (arrayContainsKey!0 a!2901 lt!620966 #b00000000000000000000000000000000)))

(declare-fun lt!620964 () Unit!47529)

(assert (=> b!1410320 (= lt!620964 lt!620965)))

(declare-fun res!947756 () Bool)

(assert (=> b!1410320 (= res!947756 (= (seekEntryOrOpen!0 (select (arr!46519 a!2901) j!112) a!2901 mask!2840) (Found!10856 j!112)))))

(assert (=> b!1410320 (=> (not res!947756) (not e!798102))))

(declare-fun b!1410321 () Bool)

(assert (=> b!1410321 (= e!798104 call!67038)))

(declare-fun b!1410322 () Bool)

(assert (=> b!1410322 (= e!798103 e!798104)))

(declare-fun c!130754 () Bool)

(assert (=> b!1410322 (= c!130754 (validKeyInArray!0 (select (arr!46519 a!2901) j!112)))))

(declare-fun bm!67035 () Bool)

(assert (=> bm!67035 (= call!67038 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151765 (not res!947757)) b!1410322))

(assert (= (and b!1410322 c!130754) b!1410320))

(assert (= (and b!1410322 (not c!130754)) b!1410321))

(assert (= (and b!1410320 res!947756) b!1410319))

(assert (= (or b!1410319 b!1410321) bm!67035))

(assert (=> b!1410320 m!1299471))

(declare-fun m!1299583 () Bool)

(assert (=> b!1410320 m!1299583))

(declare-fun m!1299585 () Bool)

(assert (=> b!1410320 m!1299585))

(assert (=> b!1410320 m!1299471))

(assert (=> b!1410320 m!1299475))

(assert (=> b!1410322 m!1299471))

(assert (=> b!1410322 m!1299471))

(assert (=> b!1410322 m!1299473))

(declare-fun m!1299587 () Bool)

(assert (=> bm!67035 m!1299587))

(assert (=> b!1410255 d!151765))

(declare-fun d!151767 () Bool)

(assert (=> d!151767 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620969 () Unit!47529)

(declare-fun choose!38 (array!96357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47529)

(assert (=> d!151767 (= lt!620969 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151767 (validMask!0 mask!2840)))

(assert (=> d!151767 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620969)))

(declare-fun bs!41089 () Bool)

(assert (= bs!41089 d!151767))

(assert (=> bs!41089 m!1299483))

(declare-fun m!1299589 () Bool)

(assert (=> bs!41089 m!1299589))

(assert (=> bs!41089 m!1299495))

(assert (=> b!1410255 d!151767))

(declare-fun e!798117 () SeekEntryResult!10856)

(declare-fun b!1410341 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410341 (= e!798117 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620928 #b00000000000000000000000000000000 mask!2840) (select (arr!46519 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410342 () Bool)

(declare-fun e!798116 () SeekEntryResult!10856)

(assert (=> b!1410342 (= e!798116 (Intermediate!10856 true lt!620928 #b00000000000000000000000000000000))))

(declare-fun b!1410344 () Bool)

(declare-fun lt!620975 () SeekEntryResult!10856)

(assert (=> b!1410344 (and (bvsge (index!45803 lt!620975) #b00000000000000000000000000000000) (bvslt (index!45803 lt!620975) (size!47071 a!2901)))))

(declare-fun res!947765 () Bool)

(assert (=> b!1410344 (= res!947765 (= (select (arr!46519 a!2901) (index!45803 lt!620975)) (select (arr!46519 a!2901) j!112)))))

(declare-fun e!798115 () Bool)

(assert (=> b!1410344 (=> res!947765 e!798115)))

(declare-fun e!798118 () Bool)

(assert (=> b!1410344 (= e!798118 e!798115)))

(declare-fun b!1410345 () Bool)

(assert (=> b!1410345 (= e!798117 (Intermediate!10856 false lt!620928 #b00000000000000000000000000000000))))

(declare-fun b!1410343 () Bool)

(assert (=> b!1410343 (and (bvsge (index!45803 lt!620975) #b00000000000000000000000000000000) (bvslt (index!45803 lt!620975) (size!47071 a!2901)))))

(declare-fun res!947766 () Bool)

(assert (=> b!1410343 (= res!947766 (= (select (arr!46519 a!2901) (index!45803 lt!620975)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410343 (=> res!947766 e!798115)))

(declare-fun d!151769 () Bool)

(declare-fun e!798119 () Bool)

(assert (=> d!151769 e!798119))

(declare-fun c!130763 () Bool)

(assert (=> d!151769 (= c!130763 (and ((_ is Intermediate!10856) lt!620975) (undefined!11668 lt!620975)))))

(assert (=> d!151769 (= lt!620975 e!798116)))

(declare-fun c!130762 () Bool)

(assert (=> d!151769 (= c!130762 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620974 () (_ BitVec 64))

(assert (=> d!151769 (= lt!620974 (select (arr!46519 a!2901) lt!620928))))

(assert (=> d!151769 (validMask!0 mask!2840)))

(assert (=> d!151769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620928 (select (arr!46519 a!2901) j!112) a!2901 mask!2840) lt!620975)))

(declare-fun b!1410346 () Bool)

(assert (=> b!1410346 (= e!798119 (bvsge (x!127394 lt!620975) #b01111111111111111111111111111110))))

(declare-fun b!1410347 () Bool)

(assert (=> b!1410347 (and (bvsge (index!45803 lt!620975) #b00000000000000000000000000000000) (bvslt (index!45803 lt!620975) (size!47071 a!2901)))))

(assert (=> b!1410347 (= e!798115 (= (select (arr!46519 a!2901) (index!45803 lt!620975)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410348 () Bool)

(assert (=> b!1410348 (= e!798119 e!798118)))

(declare-fun res!947764 () Bool)

(assert (=> b!1410348 (= res!947764 (and ((_ is Intermediate!10856) lt!620975) (not (undefined!11668 lt!620975)) (bvslt (x!127394 lt!620975) #b01111111111111111111111111111110) (bvsge (x!127394 lt!620975) #b00000000000000000000000000000000) (bvsge (x!127394 lt!620975) #b00000000000000000000000000000000)))))

(assert (=> b!1410348 (=> (not res!947764) (not e!798118))))

(declare-fun b!1410349 () Bool)

(assert (=> b!1410349 (= e!798116 e!798117)))

(declare-fun c!130761 () Bool)

(assert (=> b!1410349 (= c!130761 (or (= lt!620974 (select (arr!46519 a!2901) j!112)) (= (bvadd lt!620974 lt!620974) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151769 c!130762) b!1410342))

(assert (= (and d!151769 (not c!130762)) b!1410349))

(assert (= (and b!1410349 c!130761) b!1410345))

(assert (= (and b!1410349 (not c!130761)) b!1410341))

(assert (= (and d!151769 c!130763) b!1410346))

(assert (= (and d!151769 (not c!130763)) b!1410348))

(assert (= (and b!1410348 res!947764) b!1410344))

(assert (= (and b!1410344 (not res!947765)) b!1410343))

(assert (= (and b!1410343 (not res!947766)) b!1410347))

(declare-fun m!1299591 () Bool)

(assert (=> b!1410341 m!1299591))

(assert (=> b!1410341 m!1299591))

(assert (=> b!1410341 m!1299471))

(declare-fun m!1299593 () Bool)

(assert (=> b!1410341 m!1299593))

(declare-fun m!1299595 () Bool)

(assert (=> b!1410343 m!1299595))

(assert (=> b!1410344 m!1299595))

(assert (=> b!1410347 m!1299595))

(declare-fun m!1299597 () Bool)

(assert (=> d!151769 m!1299597))

(assert (=> d!151769 m!1299495))

(assert (=> b!1410255 d!151769))

(declare-fun d!151781 () Bool)

(declare-fun lt!620996 () (_ BitVec 32))

(declare-fun lt!620995 () (_ BitVec 32))

(assert (=> d!151781 (= lt!620996 (bvmul (bvxor lt!620995 (bvlshr lt!620995 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151781 (= lt!620995 ((_ extract 31 0) (bvand (bvxor (select (arr!46519 a!2901) j!112) (bvlshr (select (arr!46519 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151781 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947771 (let ((h!34384 ((_ extract 31 0) (bvand (bvxor (select (arr!46519 a!2901) j!112) (bvlshr (select (arr!46519 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127398 (bvmul (bvxor h!34384 (bvlshr h!34384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127398 (bvlshr x!127398 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947771 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947771 #b00000000000000000000000000000000))))))

(assert (=> d!151781 (= (toIndex!0 (select (arr!46519 a!2901) j!112) mask!2840) (bvand (bvxor lt!620996 (bvlshr lt!620996 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410255 d!151781))

(declare-fun d!151785 () Bool)

(assert (=> d!151785 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121352 d!151785))

(declare-fun d!151797 () Bool)

(assert (=> d!151797 (= (array_inv!35752 a!2901) (bvsge (size!47071 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121352 d!151797))

(declare-fun d!151799 () Bool)

(assert (=> d!151799 (= (validKeyInArray!0 (select (arr!46519 a!2901) i!1037)) (and (not (= (select (arr!46519 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46519 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410251 d!151799))

(declare-fun b!1410409 () Bool)

(declare-fun e!798161 () Bool)

(declare-fun call!67048 () Bool)

(assert (=> b!1410409 (= e!798161 call!67048)))

(declare-fun b!1410410 () Bool)

(declare-fun e!798164 () Bool)

(declare-fun e!798162 () Bool)

(assert (=> b!1410410 (= e!798164 e!798162)))

(declare-fun res!947793 () Bool)

(assert (=> b!1410410 (=> (not res!947793) (not e!798162))))

(declare-fun e!798163 () Bool)

(assert (=> b!1410410 (= res!947793 (not e!798163))))

(declare-fun res!947791 () Bool)

(assert (=> b!1410410 (=> (not res!947791) (not e!798163))))

(assert (=> b!1410410 (= res!947791 (validKeyInArray!0 (select (arr!46519 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410412 () Bool)

(assert (=> b!1410412 (= e!798161 call!67048)))

(declare-fun b!1410413 () Bool)

(declare-fun contains!9771 (List!33116 (_ BitVec 64)) Bool)

(assert (=> b!1410413 (= e!798163 (contains!9771 Nil!33113 (select (arr!46519 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67045 () Bool)

(declare-fun c!130782 () Bool)

(assert (=> bm!67045 (= call!67048 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130782 (Cons!33112 (select (arr!46519 a!2901) #b00000000000000000000000000000000) Nil!33113) Nil!33113)))))

(declare-fun d!151801 () Bool)

(declare-fun res!947792 () Bool)

(assert (=> d!151801 (=> res!947792 e!798164)))

(assert (=> d!151801 (= res!947792 (bvsge #b00000000000000000000000000000000 (size!47071 a!2901)))))

(assert (=> d!151801 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33113) e!798164)))

(declare-fun b!1410411 () Bool)

(assert (=> b!1410411 (= e!798162 e!798161)))

(assert (=> b!1410411 (= c!130782 (validKeyInArray!0 (select (arr!46519 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151801 (not res!947792)) b!1410410))

(assert (= (and b!1410410 res!947791) b!1410413))

(assert (= (and b!1410410 res!947793) b!1410411))

(assert (= (and b!1410411 c!130782) b!1410409))

(assert (= (and b!1410411 (not c!130782)) b!1410412))

(assert (= (or b!1410409 b!1410412) bm!67045))

(assert (=> b!1410410 m!1299571))

(assert (=> b!1410410 m!1299571))

(assert (=> b!1410410 m!1299579))

(assert (=> b!1410413 m!1299571))

(assert (=> b!1410413 m!1299571))

(declare-fun m!1299635 () Bool)

(assert (=> b!1410413 m!1299635))

(assert (=> bm!67045 m!1299571))

(declare-fun m!1299637 () Bool)

(assert (=> bm!67045 m!1299637))

(assert (=> b!1410411 m!1299571))

(assert (=> b!1410411 m!1299571))

(assert (=> b!1410411 m!1299579))

(assert (=> b!1410256 d!151801))

(declare-fun b!1410469 () Bool)

(declare-fun e!798198 () SeekEntryResult!10856)

(declare-fun lt!621035 () SeekEntryResult!10856)

(assert (=> b!1410469 (= e!798198 (MissingZero!10856 (index!45803 lt!621035)))))

(declare-fun d!151809 () Bool)

(declare-fun lt!621038 () SeekEntryResult!10856)

(assert (=> d!151809 (and (or ((_ is Undefined!10856) lt!621038) (not ((_ is Found!10856) lt!621038)) (and (bvsge (index!45802 lt!621038) #b00000000000000000000000000000000) (bvslt (index!45802 lt!621038) (size!47071 a!2901)))) (or ((_ is Undefined!10856) lt!621038) ((_ is Found!10856) lt!621038) (not ((_ is MissingZero!10856) lt!621038)) (and (bvsge (index!45801 lt!621038) #b00000000000000000000000000000000) (bvslt (index!45801 lt!621038) (size!47071 a!2901)))) (or ((_ is Undefined!10856) lt!621038) ((_ is Found!10856) lt!621038) ((_ is MissingZero!10856) lt!621038) (not ((_ is MissingVacant!10856) lt!621038)) (and (bvsge (index!45804 lt!621038) #b00000000000000000000000000000000) (bvslt (index!45804 lt!621038) (size!47071 a!2901)))) (or ((_ is Undefined!10856) lt!621038) (ite ((_ is Found!10856) lt!621038) (= (select (arr!46519 a!2901) (index!45802 lt!621038)) (select (arr!46519 a!2901) j!112)) (ite ((_ is MissingZero!10856) lt!621038) (= (select (arr!46519 a!2901) (index!45801 lt!621038)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10856) lt!621038) (= (select (arr!46519 a!2901) (index!45804 lt!621038)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!798199 () SeekEntryResult!10856)

(assert (=> d!151809 (= lt!621038 e!798199)))

(declare-fun c!130802 () Bool)

(assert (=> d!151809 (= c!130802 (and ((_ is Intermediate!10856) lt!621035) (undefined!11668 lt!621035)))))

(assert (=> d!151809 (= lt!621035 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46519 a!2901) j!112) mask!2840) (select (arr!46519 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151809 (validMask!0 mask!2840)))

(assert (=> d!151809 (= (seekEntryOrOpen!0 (select (arr!46519 a!2901) j!112) a!2901 mask!2840) lt!621038)))

(declare-fun b!1410470 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96357 (_ BitVec 32)) SeekEntryResult!10856)

(assert (=> b!1410470 (= e!798198 (seekKeyOrZeroReturnVacant!0 (x!127394 lt!621035) (index!45803 lt!621035) (index!45803 lt!621035) (select (arr!46519 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410471 () Bool)

(declare-fun e!798200 () SeekEntryResult!10856)

(assert (=> b!1410471 (= e!798200 (Found!10856 (index!45803 lt!621035)))))

(declare-fun b!1410472 () Bool)

(declare-fun c!130803 () Bool)

(declare-fun lt!621039 () (_ BitVec 64))

(assert (=> b!1410472 (= c!130803 (= lt!621039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410472 (= e!798200 e!798198)))

(declare-fun b!1410473 () Bool)

(assert (=> b!1410473 (= e!798199 e!798200)))

(assert (=> b!1410473 (= lt!621039 (select (arr!46519 a!2901) (index!45803 lt!621035)))))

(declare-fun c!130804 () Bool)

(assert (=> b!1410473 (= c!130804 (= lt!621039 (select (arr!46519 a!2901) j!112)))))

(declare-fun b!1410474 () Bool)

(assert (=> b!1410474 (= e!798199 Undefined!10856)))

(assert (= (and d!151809 c!130802) b!1410474))

(assert (= (and d!151809 (not c!130802)) b!1410473))

(assert (= (and b!1410473 c!130804) b!1410471))

(assert (= (and b!1410473 (not c!130804)) b!1410472))

(assert (= (and b!1410472 c!130803) b!1410469))

(assert (= (and b!1410472 (not c!130803)) b!1410470))

(assert (=> d!151809 m!1299471))

(assert (=> d!151809 m!1299477))

(declare-fun m!1299667 () Bool)

(assert (=> d!151809 m!1299667))

(assert (=> d!151809 m!1299495))

(assert (=> d!151809 m!1299477))

(assert (=> d!151809 m!1299471))

(declare-fun m!1299669 () Bool)

(assert (=> d!151809 m!1299669))

(declare-fun m!1299671 () Bool)

(assert (=> d!151809 m!1299671))

(declare-fun m!1299673 () Bool)

(assert (=> d!151809 m!1299673))

(assert (=> b!1410470 m!1299471))

(declare-fun m!1299675 () Bool)

(assert (=> b!1410470 m!1299675))

(declare-fun m!1299677 () Bool)

(assert (=> b!1410473 m!1299677))

(assert (=> b!1410257 d!151809))

(declare-fun b!1410475 () Bool)

(declare-fun e!798203 () SeekEntryResult!10856)

(assert (=> b!1410475 (= e!798203 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)) mask!2840))))

(declare-fun b!1410476 () Bool)

(declare-fun e!798202 () SeekEntryResult!10856)

(assert (=> b!1410476 (= e!798202 (Intermediate!10856 true (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410478 () Bool)

(declare-fun lt!621043 () SeekEntryResult!10856)

(assert (=> b!1410478 (and (bvsge (index!45803 lt!621043) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621043) (size!47071 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)))))))

(declare-fun res!947813 () Bool)

(assert (=> b!1410478 (= res!947813 (= (select (arr!46519 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901))) (index!45803 lt!621043)) (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!798201 () Bool)

(assert (=> b!1410478 (=> res!947813 e!798201)))

(declare-fun e!798204 () Bool)

(assert (=> b!1410478 (= e!798204 e!798201)))

(declare-fun b!1410479 () Bool)

(assert (=> b!1410479 (= e!798203 (Intermediate!10856 false (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410477 () Bool)

(assert (=> b!1410477 (and (bvsge (index!45803 lt!621043) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621043) (size!47071 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)))))))

(declare-fun res!947814 () Bool)

(assert (=> b!1410477 (= res!947814 (= (select (arr!46519 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901))) (index!45803 lt!621043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410477 (=> res!947814 e!798201)))

(declare-fun d!151820 () Bool)

(declare-fun e!798205 () Bool)

(assert (=> d!151820 e!798205))

(declare-fun c!130807 () Bool)

(assert (=> d!151820 (= c!130807 (and ((_ is Intermediate!10856) lt!621043) (undefined!11668 lt!621043)))))

(assert (=> d!151820 (= lt!621043 e!798202)))

(declare-fun c!130806 () Bool)

(assert (=> d!151820 (= c!130806 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621042 () (_ BitVec 64))

(assert (=> d!151820 (= lt!621042 (select (arr!46519 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901))) (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151820 (validMask!0 mask!2840)))

(assert (=> d!151820 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)) mask!2840) lt!621043)))

(declare-fun b!1410480 () Bool)

(assert (=> b!1410480 (= e!798205 (bvsge (x!127394 lt!621043) #b01111111111111111111111111111110))))

(declare-fun b!1410481 () Bool)

(assert (=> b!1410481 (and (bvsge (index!45803 lt!621043) #b00000000000000000000000000000000) (bvslt (index!45803 lt!621043) (size!47071 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901)))))))

(assert (=> b!1410481 (= e!798201 (= (select (arr!46519 (array!96358 (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47071 a!2901))) (index!45803 lt!621043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410482 () Bool)

(assert (=> b!1410482 (= e!798205 e!798204)))

(declare-fun res!947812 () Bool)

(assert (=> b!1410482 (= res!947812 (and ((_ is Intermediate!10856) lt!621043) (not (undefined!11668 lt!621043)) (bvslt (x!127394 lt!621043) #b01111111111111111111111111111110) (bvsge (x!127394 lt!621043) #b00000000000000000000000000000000) (bvsge (x!127394 lt!621043) #b00000000000000000000000000000000)))))

(assert (=> b!1410482 (=> (not res!947812) (not e!798204))))

(declare-fun b!1410483 () Bool)

(assert (=> b!1410483 (= e!798202 e!798203)))

(declare-fun c!130805 () Bool)

(assert (=> b!1410483 (= c!130805 (or (= lt!621042 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621042 lt!621042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151820 c!130806) b!1410476))

(assert (= (and d!151820 (not c!130806)) b!1410483))

(assert (= (and b!1410483 c!130805) b!1410479))

(assert (= (and b!1410483 (not c!130805)) b!1410475))

(assert (= (and d!151820 c!130807) b!1410480))

(assert (= (and d!151820 (not c!130807)) b!1410482))

(assert (= (and b!1410482 res!947812) b!1410478))

(assert (= (and b!1410478 (not res!947813)) b!1410477))

(assert (= (and b!1410477 (not res!947814)) b!1410481))

(assert (=> b!1410475 m!1299491))

(declare-fun m!1299679 () Bool)

(assert (=> b!1410475 m!1299679))

(assert (=> b!1410475 m!1299679))

(assert (=> b!1410475 m!1299489))

(declare-fun m!1299681 () Bool)

(assert (=> b!1410475 m!1299681))

(declare-fun m!1299683 () Bool)

(assert (=> b!1410477 m!1299683))

(assert (=> b!1410478 m!1299683))

(assert (=> b!1410481 m!1299683))

(assert (=> d!151820 m!1299491))

(declare-fun m!1299685 () Bool)

(assert (=> d!151820 m!1299685))

(assert (=> d!151820 m!1299495))

(assert (=> b!1410252 d!151820))

(declare-fun d!151823 () Bool)

(declare-fun lt!621045 () (_ BitVec 32))

(declare-fun lt!621044 () (_ BitVec 32))

(assert (=> d!151823 (= lt!621045 (bvmul (bvxor lt!621044 (bvlshr lt!621044 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151823 (= lt!621044 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151823 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947771 (let ((h!34384 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127398 (bvmul (bvxor h!34384 (bvlshr h!34384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127398 (bvlshr x!127398 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947771 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947771 #b00000000000000000000000000000000))))))

(assert (=> d!151823 (= (toIndex!0 (select (store (arr!46519 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621045 (bvlshr lt!621045 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410252 d!151823))

(check-sat (not d!151809) (not b!1410410) (not b!1410322) (not d!151769) (not d!151820) (not b!1410316) (not d!151767) (not b!1410318) (not bm!67035) (not b!1410470) (not bm!67034) (not b!1410475) (not b!1410411) (not b!1410413) (not b!1410320) (not b!1410341) (not bm!67045))
(check-sat)
