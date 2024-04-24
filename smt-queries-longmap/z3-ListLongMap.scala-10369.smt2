; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122216 () Bool)

(assert start!122216)

(declare-fun res!952911 () Bool)

(declare-fun e!802380 () Bool)

(assert (=> start!122216 (=> (not res!952911) (not e!802380))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122216 (= res!952911 (validMask!0 mask!2840))))

(assert (=> start!122216 e!802380))

(assert (=> start!122216 true))

(declare-datatypes ((array!96824 0))(
  ( (array!96825 (arr!46741 (Array (_ BitVec 32) (_ BitVec 64))) (size!47292 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96824)

(declare-fun array_inv!36022 (array!96824) Bool)

(assert (=> start!122216 (array_inv!36022 a!2901)))

(declare-fun e!802382 () Bool)

(declare-fun b!1417547 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10955 0))(
  ( (MissingZero!10955 (index!46212 (_ BitVec 32))) (Found!10955 (index!46213 (_ BitVec 32))) (Intermediate!10955 (undefined!11767 Bool) (index!46214 (_ BitVec 32)) (x!127965 (_ BitVec 32))) (Undefined!10955) (MissingVacant!10955 (index!46215 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96824 (_ BitVec 32)) SeekEntryResult!10955)

(assert (=> b!1417547 (= e!802382 (= (seekEntryOrOpen!0 (select (arr!46741 a!2901) j!112) a!2901 mask!2840) (Found!10955 j!112)))))

(declare-fun b!1417548 () Bool)

(declare-fun res!952907 () Bool)

(assert (=> b!1417548 (=> (not res!952907) (not e!802380))))

(declare-datatypes ((List!33247 0))(
  ( (Nil!33244) (Cons!33243 (h!34538 (_ BitVec 64)) (t!47933 List!33247)) )
))
(declare-fun arrayNoDuplicates!0 (array!96824 (_ BitVec 32) List!33247) Bool)

(assert (=> b!1417548 (= res!952907 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33244))))

(declare-fun b!1417549 () Bool)

(declare-fun e!802381 () Bool)

(assert (=> b!1417549 (= e!802380 (not e!802381))))

(declare-fun res!952906 () Bool)

(assert (=> b!1417549 (=> res!952906 e!802381)))

(declare-fun lt!625347 () SeekEntryResult!10955)

(get-info :version)

(assert (=> b!1417549 (= res!952906 (or (not ((_ is Intermediate!10955) lt!625347)) (undefined!11767 lt!625347)))))

(assert (=> b!1417549 e!802382))

(declare-fun res!952910 () Bool)

(assert (=> b!1417549 (=> (not res!952910) (not e!802382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96824 (_ BitVec 32)) Bool)

(assert (=> b!1417549 (= res!952910 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47911 0))(
  ( (Unit!47912) )
))
(declare-fun lt!625348 () Unit!47911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47911)

(assert (=> b!1417549 (= lt!625348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96824 (_ BitVec 32)) SeekEntryResult!10955)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417549 (= lt!625347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) (select (arr!46741 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417550 () Bool)

(declare-fun res!952909 () Bool)

(assert (=> b!1417550 (=> (not res!952909) (not e!802380))))

(assert (=> b!1417550 (= res!952909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417551 () Bool)

(declare-fun res!952912 () Bool)

(assert (=> b!1417551 (=> (not res!952912) (not e!802380))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417551 (= res!952912 (validKeyInArray!0 (select (arr!46741 a!2901) i!1037)))))

(declare-fun b!1417552 () Bool)

(declare-fun res!952908 () Bool)

(assert (=> b!1417552 (=> (not res!952908) (not e!802380))))

(assert (=> b!1417552 (= res!952908 (validKeyInArray!0 (select (arr!46741 a!2901) j!112)))))

(declare-fun b!1417553 () Bool)

(declare-fun lt!625349 () SeekEntryResult!10955)

(assert (=> b!1417553 (= e!802381 (or (= lt!625347 lt!625349) ((_ is Intermediate!10955) lt!625349)))))

(assert (=> b!1417553 (= lt!625349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901)) mask!2840))))

(declare-fun b!1417554 () Bool)

(declare-fun res!952905 () Bool)

(assert (=> b!1417554 (=> (not res!952905) (not e!802380))))

(assert (=> b!1417554 (= res!952905 (and (= (size!47292 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47292 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47292 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!122216 res!952911) b!1417554))

(assert (= (and b!1417554 res!952905) b!1417551))

(assert (= (and b!1417551 res!952912) b!1417552))

(assert (= (and b!1417552 res!952908) b!1417550))

(assert (= (and b!1417550 res!952909) b!1417548))

(assert (= (and b!1417548 res!952907) b!1417549))

(assert (= (and b!1417549 res!952910) b!1417547))

(assert (= (and b!1417549 (not res!952906)) b!1417553))

(declare-fun m!1308493 () Bool)

(assert (=> b!1417553 m!1308493))

(declare-fun m!1308495 () Bool)

(assert (=> b!1417553 m!1308495))

(assert (=> b!1417553 m!1308495))

(declare-fun m!1308497 () Bool)

(assert (=> b!1417553 m!1308497))

(assert (=> b!1417553 m!1308497))

(assert (=> b!1417553 m!1308495))

(declare-fun m!1308499 () Bool)

(assert (=> b!1417553 m!1308499))

(declare-fun m!1308501 () Bool)

(assert (=> b!1417548 m!1308501))

(declare-fun m!1308503 () Bool)

(assert (=> b!1417550 m!1308503))

(declare-fun m!1308505 () Bool)

(assert (=> b!1417551 m!1308505))

(assert (=> b!1417551 m!1308505))

(declare-fun m!1308507 () Bool)

(assert (=> b!1417551 m!1308507))

(declare-fun m!1308509 () Bool)

(assert (=> b!1417549 m!1308509))

(declare-fun m!1308511 () Bool)

(assert (=> b!1417549 m!1308511))

(assert (=> b!1417549 m!1308509))

(declare-fun m!1308513 () Bool)

(assert (=> b!1417549 m!1308513))

(assert (=> b!1417549 m!1308511))

(assert (=> b!1417549 m!1308509))

(declare-fun m!1308515 () Bool)

(assert (=> b!1417549 m!1308515))

(declare-fun m!1308517 () Bool)

(assert (=> b!1417549 m!1308517))

(assert (=> b!1417552 m!1308509))

(assert (=> b!1417552 m!1308509))

(declare-fun m!1308519 () Bool)

(assert (=> b!1417552 m!1308519))

(declare-fun m!1308521 () Bool)

(assert (=> start!122216 m!1308521))

(declare-fun m!1308523 () Bool)

(assert (=> start!122216 m!1308523))

(assert (=> b!1417547 m!1308509))

(assert (=> b!1417547 m!1308509))

(declare-fun m!1308525 () Bool)

(assert (=> b!1417547 m!1308525))

(check-sat (not b!1417552) (not start!122216) (not b!1417549) (not b!1417553) (not b!1417550) (not b!1417548) (not b!1417551) (not b!1417547))
(check-sat)
(get-model)

(declare-fun d!152885 () Bool)

(assert (=> d!152885 (= (validKeyInArray!0 (select (arr!46741 a!2901) i!1037)) (and (not (= (select (arr!46741 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46741 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417551 d!152885))

(declare-fun b!1417611 () Bool)

(declare-fun e!802415 () Bool)

(declare-fun e!802413 () Bool)

(assert (=> b!1417611 (= e!802415 e!802413)))

(declare-fun lt!625376 () (_ BitVec 64))

(assert (=> b!1417611 (= lt!625376 (select (arr!46741 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625374 () Unit!47911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96824 (_ BitVec 64) (_ BitVec 32)) Unit!47911)

(assert (=> b!1417611 (= lt!625374 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625376 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417611 (arrayContainsKey!0 a!2901 lt!625376 #b00000000000000000000000000000000)))

(declare-fun lt!625375 () Unit!47911)

(assert (=> b!1417611 (= lt!625375 lt!625374)))

(declare-fun res!952966 () Bool)

(assert (=> b!1417611 (= res!952966 (= (seekEntryOrOpen!0 (select (arr!46741 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10955 #b00000000000000000000000000000000)))))

(assert (=> b!1417611 (=> (not res!952966) (not e!802413))))

(declare-fun bm!67239 () Bool)

(declare-fun call!67242 () Bool)

(assert (=> bm!67239 (= call!67242 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1417612 () Bool)

(declare-fun e!802414 () Bool)

(assert (=> b!1417612 (= e!802414 e!802415)))

(declare-fun c!131809 () Bool)

(assert (=> b!1417612 (= c!131809 (validKeyInArray!0 (select (arr!46741 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1417613 () Bool)

(assert (=> b!1417613 (= e!802415 call!67242)))

(declare-fun d!152887 () Bool)

(declare-fun res!952965 () Bool)

(assert (=> d!152887 (=> res!952965 e!802414)))

(assert (=> d!152887 (= res!952965 (bvsge #b00000000000000000000000000000000 (size!47292 a!2901)))))

(assert (=> d!152887 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!802414)))

(declare-fun b!1417614 () Bool)

(assert (=> b!1417614 (= e!802413 call!67242)))

(assert (= (and d!152887 (not res!952965)) b!1417612))

(assert (= (and b!1417612 c!131809) b!1417611))

(assert (= (and b!1417612 (not c!131809)) b!1417613))

(assert (= (and b!1417611 res!952966) b!1417614))

(assert (= (or b!1417614 b!1417613) bm!67239))

(declare-fun m!1308595 () Bool)

(assert (=> b!1417611 m!1308595))

(declare-fun m!1308597 () Bool)

(assert (=> b!1417611 m!1308597))

(declare-fun m!1308599 () Bool)

(assert (=> b!1417611 m!1308599))

(assert (=> b!1417611 m!1308595))

(declare-fun m!1308601 () Bool)

(assert (=> b!1417611 m!1308601))

(declare-fun m!1308603 () Bool)

(assert (=> bm!67239 m!1308603))

(assert (=> b!1417612 m!1308595))

(assert (=> b!1417612 m!1308595))

(declare-fun m!1308605 () Bool)

(assert (=> b!1417612 m!1308605))

(assert (=> b!1417550 d!152887))

(declare-fun d!152891 () Bool)

(assert (=> d!152891 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122216 d!152891))

(declare-fun d!152895 () Bool)

(assert (=> d!152895 (= (array_inv!36022 a!2901) (bvsge (size!47292 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122216 d!152895))

(declare-fun b!1417625 () Bool)

(declare-fun e!802426 () Bool)

(declare-fun e!802424 () Bool)

(assert (=> b!1417625 (= e!802426 e!802424)))

(declare-fun lt!625379 () (_ BitVec 64))

(assert (=> b!1417625 (= lt!625379 (select (arr!46741 a!2901) j!112))))

(declare-fun lt!625377 () Unit!47911)

(assert (=> b!1417625 (= lt!625377 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625379 j!112))))

(assert (=> b!1417625 (arrayContainsKey!0 a!2901 lt!625379 #b00000000000000000000000000000000)))

(declare-fun lt!625378 () Unit!47911)

(assert (=> b!1417625 (= lt!625378 lt!625377)))

(declare-fun res!952974 () Bool)

(assert (=> b!1417625 (= res!952974 (= (seekEntryOrOpen!0 (select (arr!46741 a!2901) j!112) a!2901 mask!2840) (Found!10955 j!112)))))

(assert (=> b!1417625 (=> (not res!952974) (not e!802424))))

(declare-fun bm!67242 () Bool)

(declare-fun call!67245 () Bool)

(assert (=> bm!67242 (= call!67245 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1417626 () Bool)

(declare-fun e!802425 () Bool)

(assert (=> b!1417626 (= e!802425 e!802426)))

(declare-fun c!131812 () Bool)

(assert (=> b!1417626 (= c!131812 (validKeyInArray!0 (select (arr!46741 a!2901) j!112)))))

(declare-fun b!1417627 () Bool)

(assert (=> b!1417627 (= e!802426 call!67245)))

(declare-fun d!152897 () Bool)

(declare-fun res!952973 () Bool)

(assert (=> d!152897 (=> res!952973 e!802425)))

(assert (=> d!152897 (= res!952973 (bvsge j!112 (size!47292 a!2901)))))

(assert (=> d!152897 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!802425)))

(declare-fun b!1417628 () Bool)

(assert (=> b!1417628 (= e!802424 call!67245)))

(assert (= (and d!152897 (not res!952973)) b!1417626))

(assert (= (and b!1417626 c!131812) b!1417625))

(assert (= (and b!1417626 (not c!131812)) b!1417627))

(assert (= (and b!1417625 res!952974) b!1417628))

(assert (= (or b!1417628 b!1417627) bm!67242))

(assert (=> b!1417625 m!1308509))

(declare-fun m!1308607 () Bool)

(assert (=> b!1417625 m!1308607))

(declare-fun m!1308609 () Bool)

(assert (=> b!1417625 m!1308609))

(assert (=> b!1417625 m!1308509))

(assert (=> b!1417625 m!1308525))

(declare-fun m!1308611 () Bool)

(assert (=> bm!67242 m!1308611))

(assert (=> b!1417626 m!1308509))

(assert (=> b!1417626 m!1308509))

(assert (=> b!1417626 m!1308519))

(assert (=> b!1417549 d!152897))

(declare-fun d!152899 () Bool)

(assert (=> d!152899 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625382 () Unit!47911)

(declare-fun choose!38 (array!96824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47911)

(assert (=> d!152899 (= lt!625382 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152899 (validMask!0 mask!2840)))

(assert (=> d!152899 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625382)))

(declare-fun bs!41299 () Bool)

(assert (= bs!41299 d!152899))

(assert (=> bs!41299 m!1308517))

(declare-fun m!1308621 () Bool)

(assert (=> bs!41299 m!1308621))

(assert (=> bs!41299 m!1308521))

(assert (=> b!1417549 d!152899))

(declare-fun b!1417667 () Bool)

(declare-fun lt!625387 () SeekEntryResult!10955)

(assert (=> b!1417667 (and (bvsge (index!46214 lt!625387) #b00000000000000000000000000000000) (bvslt (index!46214 lt!625387) (size!47292 a!2901)))))

(declare-fun e!802454 () Bool)

(assert (=> b!1417667 (= e!802454 (= (select (arr!46741 a!2901) (index!46214 lt!625387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152903 () Bool)

(declare-fun e!802457 () Bool)

(assert (=> d!152903 e!802457))

(declare-fun c!131824 () Bool)

(assert (=> d!152903 (= c!131824 (and ((_ is Intermediate!10955) lt!625387) (undefined!11767 lt!625387)))))

(declare-fun e!802455 () SeekEntryResult!10955)

(assert (=> d!152903 (= lt!625387 e!802455)))

(declare-fun c!131825 () Bool)

(assert (=> d!152903 (= c!131825 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625388 () (_ BitVec 64))

(assert (=> d!152903 (= lt!625388 (select (arr!46741 a!2901) (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840)))))

(assert (=> d!152903 (validMask!0 mask!2840)))

(assert (=> d!152903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) (select (arr!46741 a!2901) j!112) a!2901 mask!2840) lt!625387)))

(declare-fun b!1417668 () Bool)

(declare-fun e!802456 () SeekEntryResult!10955)

(assert (=> b!1417668 (= e!802456 (Intermediate!10955 false (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417669 () Bool)

(assert (=> b!1417669 (and (bvsge (index!46214 lt!625387) #b00000000000000000000000000000000) (bvslt (index!46214 lt!625387) (size!47292 a!2901)))))

(declare-fun res!952993 () Bool)

(assert (=> b!1417669 (= res!952993 (= (select (arr!46741 a!2901) (index!46214 lt!625387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1417669 (=> res!952993 e!802454)))

(declare-fun b!1417670 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417670 (= e!802456 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46741 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417671 () Bool)

(assert (=> b!1417671 (= e!802457 (bvsge (x!127965 lt!625387) #b01111111111111111111111111111110))))

(declare-fun b!1417672 () Bool)

(assert (=> b!1417672 (= e!802455 (Intermediate!10955 true (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417673 () Bool)

(assert (=> b!1417673 (= e!802455 e!802456)))

(declare-fun c!131823 () Bool)

(assert (=> b!1417673 (= c!131823 (or (= lt!625388 (select (arr!46741 a!2901) j!112)) (= (bvadd lt!625388 lt!625388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1417674 () Bool)

(declare-fun e!802453 () Bool)

(assert (=> b!1417674 (= e!802457 e!802453)))

(declare-fun res!952995 () Bool)

(assert (=> b!1417674 (= res!952995 (and ((_ is Intermediate!10955) lt!625387) (not (undefined!11767 lt!625387)) (bvslt (x!127965 lt!625387) #b01111111111111111111111111111110) (bvsge (x!127965 lt!625387) #b00000000000000000000000000000000) (bvsge (x!127965 lt!625387) #b00000000000000000000000000000000)))))

(assert (=> b!1417674 (=> (not res!952995) (not e!802453))))

(declare-fun b!1417675 () Bool)

(assert (=> b!1417675 (and (bvsge (index!46214 lt!625387) #b00000000000000000000000000000000) (bvslt (index!46214 lt!625387) (size!47292 a!2901)))))

(declare-fun res!952994 () Bool)

(assert (=> b!1417675 (= res!952994 (= (select (arr!46741 a!2901) (index!46214 lt!625387)) (select (arr!46741 a!2901) j!112)))))

(assert (=> b!1417675 (=> res!952994 e!802454)))

(assert (=> b!1417675 (= e!802453 e!802454)))

(assert (= (and d!152903 c!131825) b!1417672))

(assert (= (and d!152903 (not c!131825)) b!1417673))

(assert (= (and b!1417673 c!131823) b!1417668))

(assert (= (and b!1417673 (not c!131823)) b!1417670))

(assert (= (and d!152903 c!131824) b!1417671))

(assert (= (and d!152903 (not c!131824)) b!1417674))

(assert (= (and b!1417674 res!952995) b!1417675))

(assert (= (and b!1417675 (not res!952994)) b!1417669))

(assert (= (and b!1417669 (not res!952993)) b!1417667))

(declare-fun m!1308631 () Bool)

(assert (=> b!1417667 m!1308631))

(assert (=> b!1417675 m!1308631))

(assert (=> b!1417670 m!1308511))

(declare-fun m!1308633 () Bool)

(assert (=> b!1417670 m!1308633))

(assert (=> b!1417670 m!1308633))

(assert (=> b!1417670 m!1308509))

(declare-fun m!1308635 () Bool)

(assert (=> b!1417670 m!1308635))

(assert (=> d!152903 m!1308511))

(declare-fun m!1308637 () Bool)

(assert (=> d!152903 m!1308637))

(assert (=> d!152903 m!1308521))

(assert (=> b!1417669 m!1308631))

(assert (=> b!1417549 d!152903))

(declare-fun d!152923 () Bool)

(declare-fun lt!625400 () (_ BitVec 32))

(declare-fun lt!625399 () (_ BitVec 32))

(assert (=> d!152923 (= lt!625400 (bvmul (bvxor lt!625399 (bvlshr lt!625399 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152923 (= lt!625399 ((_ extract 31 0) (bvand (bvxor (select (arr!46741 a!2901) j!112) (bvlshr (select (arr!46741 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152923 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952996 (let ((h!34541 ((_ extract 31 0) (bvand (bvxor (select (arr!46741 a!2901) j!112) (bvlshr (select (arr!46741 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127969 (bvmul (bvxor h!34541 (bvlshr h!34541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127969 (bvlshr x!127969 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952996 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952996 #b00000000000000000000000000000000))))))

(assert (=> d!152923 (= (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) (bvand (bvxor lt!625400 (bvlshr lt!625400 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1417549 d!152923))

(declare-fun b!1417714 () Bool)

(declare-fun e!802488 () Bool)

(declare-fun e!802489 () Bool)

(assert (=> b!1417714 (= e!802488 e!802489)))

(declare-fun res!953017 () Bool)

(assert (=> b!1417714 (=> (not res!953017) (not e!802489))))

(declare-fun e!802487 () Bool)

(assert (=> b!1417714 (= res!953017 (not e!802487))))

(declare-fun res!953019 () Bool)

(assert (=> b!1417714 (=> (not res!953019) (not e!802487))))

(assert (=> b!1417714 (= res!953019 (validKeyInArray!0 (select (arr!46741 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67256 () Bool)

(declare-fun call!67259 () Bool)

(declare-fun c!131835 () Bool)

(assert (=> bm!67256 (= call!67259 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131835 (Cons!33243 (select (arr!46741 a!2901) #b00000000000000000000000000000000) Nil!33244) Nil!33244)))))

(declare-fun b!1417715 () Bool)

(declare-fun e!802490 () Bool)

(assert (=> b!1417715 (= e!802490 call!67259)))

(declare-fun b!1417716 () Bool)

(assert (=> b!1417716 (= e!802490 call!67259)))

(declare-fun b!1417717 () Bool)

(declare-fun contains!9868 (List!33247 (_ BitVec 64)) Bool)

(assert (=> b!1417717 (= e!802487 (contains!9868 Nil!33244 (select (arr!46741 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152925 () Bool)

(declare-fun res!953018 () Bool)

(assert (=> d!152925 (=> res!953018 e!802488)))

(assert (=> d!152925 (= res!953018 (bvsge #b00000000000000000000000000000000 (size!47292 a!2901)))))

(assert (=> d!152925 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33244) e!802488)))

(declare-fun b!1417718 () Bool)

(assert (=> b!1417718 (= e!802489 e!802490)))

(assert (=> b!1417718 (= c!131835 (validKeyInArray!0 (select (arr!46741 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152925 (not res!953018)) b!1417714))

(assert (= (and b!1417714 res!953019) b!1417717))

(assert (= (and b!1417714 res!953017) b!1417718))

(assert (= (and b!1417718 c!131835) b!1417716))

(assert (= (and b!1417718 (not c!131835)) b!1417715))

(assert (= (or b!1417716 b!1417715) bm!67256))

(assert (=> b!1417714 m!1308595))

(assert (=> b!1417714 m!1308595))

(assert (=> b!1417714 m!1308605))

(assert (=> bm!67256 m!1308595))

(declare-fun m!1308659 () Bool)

(assert (=> bm!67256 m!1308659))

(assert (=> b!1417717 m!1308595))

(assert (=> b!1417717 m!1308595))

(declare-fun m!1308661 () Bool)

(assert (=> b!1417717 m!1308661))

(assert (=> b!1417718 m!1308595))

(assert (=> b!1417718 m!1308595))

(assert (=> b!1417718 m!1308605))

(assert (=> b!1417548 d!152925))

(declare-fun b!1417719 () Bool)

(declare-fun lt!625416 () SeekEntryResult!10955)

(assert (=> b!1417719 (and (bvsge (index!46214 lt!625416) #b00000000000000000000000000000000) (bvslt (index!46214 lt!625416) (size!47292 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901)))))))

(declare-fun e!802492 () Bool)

(assert (=> b!1417719 (= e!802492 (= (select (arr!46741 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901))) (index!46214 lt!625416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152933 () Bool)

(declare-fun e!802495 () Bool)

(assert (=> d!152933 e!802495))

(declare-fun c!131837 () Bool)

(assert (=> d!152933 (= c!131837 (and ((_ is Intermediate!10955) lt!625416) (undefined!11767 lt!625416)))))

(declare-fun e!802493 () SeekEntryResult!10955)

(assert (=> d!152933 (= lt!625416 e!802493)))

(declare-fun c!131838 () Bool)

(assert (=> d!152933 (= c!131838 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625417 () (_ BitVec 64))

(assert (=> d!152933 (= lt!625417 (select (arr!46741 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901))) (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152933 (validMask!0 mask!2840)))

(assert (=> d!152933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901)) mask!2840) lt!625416)))

(declare-fun e!802494 () SeekEntryResult!10955)

(declare-fun b!1417720 () Bool)

(assert (=> b!1417720 (= e!802494 (Intermediate!10955 false (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417721 () Bool)

(assert (=> b!1417721 (and (bvsge (index!46214 lt!625416) #b00000000000000000000000000000000) (bvslt (index!46214 lt!625416) (size!47292 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901)))))))

(declare-fun res!953020 () Bool)

(assert (=> b!1417721 (= res!953020 (= (select (arr!46741 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901))) (index!46214 lt!625416)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1417721 (=> res!953020 e!802492)))

(declare-fun b!1417722 () Bool)

(assert (=> b!1417722 (= e!802494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901)) mask!2840))))

(declare-fun b!1417723 () Bool)

(assert (=> b!1417723 (= e!802495 (bvsge (x!127965 lt!625416) #b01111111111111111111111111111110))))

(declare-fun b!1417724 () Bool)

(assert (=> b!1417724 (= e!802493 (Intermediate!10955 true (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1417725 () Bool)

(assert (=> b!1417725 (= e!802493 e!802494)))

(declare-fun c!131836 () Bool)

(assert (=> b!1417725 (= c!131836 (or (= lt!625417 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!625417 lt!625417) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1417726 () Bool)

(declare-fun e!802491 () Bool)

(assert (=> b!1417726 (= e!802495 e!802491)))

(declare-fun res!953022 () Bool)

(assert (=> b!1417726 (= res!953022 (and ((_ is Intermediate!10955) lt!625416) (not (undefined!11767 lt!625416)) (bvslt (x!127965 lt!625416) #b01111111111111111111111111111110) (bvsge (x!127965 lt!625416) #b00000000000000000000000000000000) (bvsge (x!127965 lt!625416) #b00000000000000000000000000000000)))))

(assert (=> b!1417726 (=> (not res!953022) (not e!802491))))

(declare-fun b!1417727 () Bool)

(assert (=> b!1417727 (and (bvsge (index!46214 lt!625416) #b00000000000000000000000000000000) (bvslt (index!46214 lt!625416) (size!47292 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901)))))))

(declare-fun res!953021 () Bool)

(assert (=> b!1417727 (= res!953021 (= (select (arr!46741 (array!96825 (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47292 a!2901))) (index!46214 lt!625416)) (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1417727 (=> res!953021 e!802492)))

(assert (=> b!1417727 (= e!802491 e!802492)))

(assert (= (and d!152933 c!131838) b!1417724))

(assert (= (and d!152933 (not c!131838)) b!1417725))

(assert (= (and b!1417725 c!131836) b!1417720))

(assert (= (and b!1417725 (not c!131836)) b!1417722))

(assert (= (and d!152933 c!131837) b!1417723))

(assert (= (and d!152933 (not c!131837)) b!1417726))

(assert (= (and b!1417726 res!953022) b!1417727))

(assert (= (and b!1417727 (not res!953021)) b!1417721))

(assert (= (and b!1417721 (not res!953020)) b!1417719))

(declare-fun m!1308663 () Bool)

(assert (=> b!1417719 m!1308663))

(assert (=> b!1417727 m!1308663))

(assert (=> b!1417722 m!1308497))

(declare-fun m!1308665 () Bool)

(assert (=> b!1417722 m!1308665))

(assert (=> b!1417722 m!1308665))

(assert (=> b!1417722 m!1308495))

(declare-fun m!1308667 () Bool)

(assert (=> b!1417722 m!1308667))

(assert (=> d!152933 m!1308497))

(declare-fun m!1308669 () Bool)

(assert (=> d!152933 m!1308669))

(assert (=> d!152933 m!1308521))

(assert (=> b!1417721 m!1308663))

(assert (=> b!1417553 d!152933))

(declare-fun d!152935 () Bool)

(declare-fun lt!625419 () (_ BitVec 32))

(declare-fun lt!625418 () (_ BitVec 32))

(assert (=> d!152935 (= lt!625419 (bvmul (bvxor lt!625418 (bvlshr lt!625418 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152935 (= lt!625418 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152935 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952996 (let ((h!34541 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127969 (bvmul (bvxor h!34541 (bvlshr h!34541 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127969 (bvlshr x!127969 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952996 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952996 #b00000000000000000000000000000000))))))

(assert (=> d!152935 (= (toIndex!0 (select (store (arr!46741 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!625419 (bvlshr lt!625419 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1417553 d!152935))

(declare-fun b!1417740 () Bool)

(declare-fun e!802503 () SeekEntryResult!10955)

(assert (=> b!1417740 (= e!802503 Undefined!10955)))

(declare-fun b!1417741 () Bool)

(declare-fun e!802504 () SeekEntryResult!10955)

(declare-fun lt!625434 () SeekEntryResult!10955)

(assert (=> b!1417741 (= e!802504 (MissingZero!10955 (index!46214 lt!625434)))))

(declare-fun b!1417742 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96824 (_ BitVec 32)) SeekEntryResult!10955)

(assert (=> b!1417742 (= e!802504 (seekKeyOrZeroReturnVacant!0 (x!127965 lt!625434) (index!46214 lt!625434) (index!46214 lt!625434) (select (arr!46741 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417743 () Bool)

(declare-fun c!131845 () Bool)

(declare-fun lt!625432 () (_ BitVec 64))

(assert (=> b!1417743 (= c!131845 (= lt!625432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802502 () SeekEntryResult!10955)

(assert (=> b!1417743 (= e!802502 e!802504)))

(declare-fun b!1417744 () Bool)

(assert (=> b!1417744 (= e!802503 e!802502)))

(assert (=> b!1417744 (= lt!625432 (select (arr!46741 a!2901) (index!46214 lt!625434)))))

(declare-fun c!131846 () Bool)

(assert (=> b!1417744 (= c!131846 (= lt!625432 (select (arr!46741 a!2901) j!112)))))

(declare-fun d!152937 () Bool)

(declare-fun lt!625433 () SeekEntryResult!10955)

(assert (=> d!152937 (and (or ((_ is Undefined!10955) lt!625433) (not ((_ is Found!10955) lt!625433)) (and (bvsge (index!46213 lt!625433) #b00000000000000000000000000000000) (bvslt (index!46213 lt!625433) (size!47292 a!2901)))) (or ((_ is Undefined!10955) lt!625433) ((_ is Found!10955) lt!625433) (not ((_ is MissingZero!10955) lt!625433)) (and (bvsge (index!46212 lt!625433) #b00000000000000000000000000000000) (bvslt (index!46212 lt!625433) (size!47292 a!2901)))) (or ((_ is Undefined!10955) lt!625433) ((_ is Found!10955) lt!625433) ((_ is MissingZero!10955) lt!625433) (not ((_ is MissingVacant!10955) lt!625433)) (and (bvsge (index!46215 lt!625433) #b00000000000000000000000000000000) (bvslt (index!46215 lt!625433) (size!47292 a!2901)))) (or ((_ is Undefined!10955) lt!625433) (ite ((_ is Found!10955) lt!625433) (= (select (arr!46741 a!2901) (index!46213 lt!625433)) (select (arr!46741 a!2901) j!112)) (ite ((_ is MissingZero!10955) lt!625433) (= (select (arr!46741 a!2901) (index!46212 lt!625433)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10955) lt!625433) (= (select (arr!46741 a!2901) (index!46215 lt!625433)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152937 (= lt!625433 e!802503)))

(declare-fun c!131847 () Bool)

(assert (=> d!152937 (= c!131847 (and ((_ is Intermediate!10955) lt!625434) (undefined!11767 lt!625434)))))

(assert (=> d!152937 (= lt!625434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46741 a!2901) j!112) mask!2840) (select (arr!46741 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152937 (validMask!0 mask!2840)))

(assert (=> d!152937 (= (seekEntryOrOpen!0 (select (arr!46741 a!2901) j!112) a!2901 mask!2840) lt!625433)))

(declare-fun b!1417745 () Bool)

(assert (=> b!1417745 (= e!802502 (Found!10955 (index!46214 lt!625434)))))

(assert (= (and d!152937 c!131847) b!1417740))

(assert (= (and d!152937 (not c!131847)) b!1417744))

(assert (= (and b!1417744 c!131846) b!1417745))

(assert (= (and b!1417744 (not c!131846)) b!1417743))

(assert (= (and b!1417743 c!131845) b!1417741))

(assert (= (and b!1417743 (not c!131845)) b!1417742))

(assert (=> b!1417742 m!1308509))

(declare-fun m!1308675 () Bool)

(assert (=> b!1417742 m!1308675))

(declare-fun m!1308677 () Bool)

(assert (=> b!1417744 m!1308677))

(declare-fun m!1308679 () Bool)

(assert (=> d!152937 m!1308679))

(assert (=> d!152937 m!1308521))

(declare-fun m!1308681 () Bool)

(assert (=> d!152937 m!1308681))

(declare-fun m!1308683 () Bool)

(assert (=> d!152937 m!1308683))

(assert (=> d!152937 m!1308511))

(assert (=> d!152937 m!1308509))

(assert (=> d!152937 m!1308515))

(assert (=> d!152937 m!1308509))

(assert (=> d!152937 m!1308511))

(assert (=> b!1417547 d!152937))

(declare-fun d!152943 () Bool)

(assert (=> d!152943 (= (validKeyInArray!0 (select (arr!46741 a!2901) j!112)) (and (not (= (select (arr!46741 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46741 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417552 d!152943))

(check-sat (not b!1417714) (not bm!67242) (not bm!67239) (not d!152903) (not bm!67256) (not b!1417717) (not d!152933) (not b!1417625) (not b!1417626) (not b!1417611) (not b!1417722) (not d!152899) (not b!1417718) (not d!152937) (not b!1417742) (not b!1417670) (not b!1417612))
(check-sat)
