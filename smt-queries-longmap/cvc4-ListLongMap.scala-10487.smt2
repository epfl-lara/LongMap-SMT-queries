; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123358 () Bool)

(assert start!123358)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1430516 () Bool)

(declare-fun e!807618 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97468 0))(
  ( (array!97469 (arr!47044 (Array (_ BitVec 32) (_ BitVec 64))) (size!47594 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97468)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1430516 (= e!807618 (or (= (select (arr!47044 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47044 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47044 a!2831) index!585) (select (arr!47044 a!2831) j!81)) (not (= (select (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (= index!585 intermediateAfterIndex!13) (= intermediateAfterIndex!13 i!982))))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun e!807620 () Bool)

(declare-fun b!1430517 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1430517 (= e!807620 (not (or (= (select (arr!47044 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47044 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47044 a!2831) index!585) (select (arr!47044 a!2831) j!81)) (not (= (select (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt intermediateAfterX!13 intermediateBeforeX!13))))))

(assert (=> b!1430517 e!807618))

(declare-fun res!964950 () Bool)

(assert (=> b!1430517 (=> (not res!964950) (not e!807618))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97468 (_ BitVec 32)) Bool)

(assert (=> b!1430517 (= res!964950 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48392 0))(
  ( (Unit!48393) )
))
(declare-fun lt!629786 () Unit!48392)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48392)

(assert (=> b!1430517 (= lt!629786 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430518 () Bool)

(declare-fun e!807616 () Bool)

(declare-fun e!807617 () Bool)

(assert (=> b!1430518 (= e!807616 e!807617)))

(declare-fun res!964957 () Bool)

(assert (=> b!1430518 (=> (not res!964957) (not e!807617))))

(declare-datatypes ((SeekEntryResult!11323 0))(
  ( (MissingZero!11323 (index!47684 (_ BitVec 32))) (Found!11323 (index!47685 (_ BitVec 32))) (Intermediate!11323 (undefined!12135 Bool) (index!47686 (_ BitVec 32)) (x!129315 (_ BitVec 32))) (Undefined!11323) (MissingVacant!11323 (index!47687 (_ BitVec 32))) )
))
(declare-fun lt!629788 () SeekEntryResult!11323)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97468 (_ BitVec 32)) SeekEntryResult!11323)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430518 (= res!964957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629788))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1430518 (= lt!629788 (Intermediate!11323 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430519 () Bool)

(declare-fun res!964953 () Bool)

(assert (=> b!1430519 (=> (not res!964953) (not e!807616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430519 (= res!964953 (validKeyInArray!0 (select (arr!47044 a!2831) j!81)))))

(declare-fun b!1430520 () Bool)

(assert (=> b!1430520 (= e!807617 e!807620)))

(declare-fun res!964955 () Bool)

(assert (=> b!1430520 (=> (not res!964955) (not e!807620))))

(declare-fun lt!629787 () array!97468)

(declare-fun lt!629789 () (_ BitVec 64))

(declare-fun lt!629790 () SeekEntryResult!11323)

(assert (=> b!1430520 (= res!964955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629789 mask!2608) lt!629789 lt!629787 mask!2608) lt!629790))))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430520 (= lt!629790 (Intermediate!11323 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430520 (= lt!629789 (select (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430520 (= lt!629787 (array!97469 (store (arr!47044 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47594 a!2831)))))

(declare-fun b!1430521 () Bool)

(declare-fun res!964944 () Bool)

(assert (=> b!1430521 (=> (not res!964944) (not e!807620))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1430521 (= res!964944 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629788))))

(declare-fun b!1430522 () Bool)

(declare-fun res!964947 () Bool)

(assert (=> b!1430522 (=> (not res!964947) (not e!807616))))

(assert (=> b!1430522 (= res!964947 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47594 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47594 a!2831))))))

(declare-fun b!1430523 () Bool)

(declare-fun res!964951 () Bool)

(assert (=> b!1430523 (=> (not res!964951) (not e!807620))))

(assert (=> b!1430523 (= res!964951 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430524 () Bool)

(declare-fun res!964946 () Bool)

(assert (=> b!1430524 (=> (not res!964946) (not e!807620))))

(assert (=> b!1430524 (= res!964946 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629789 lt!629787 mask!2608) lt!629790))))

(declare-fun b!1430525 () Bool)

(declare-fun res!964945 () Bool)

(assert (=> b!1430525 (=> (not res!964945) (not e!807616))))

(declare-datatypes ((List!33554 0))(
  ( (Nil!33551) (Cons!33550 (h!34867 (_ BitVec 64)) (t!48248 List!33554)) )
))
(declare-fun arrayNoDuplicates!0 (array!97468 (_ BitVec 32) List!33554) Bool)

(assert (=> b!1430525 (= res!964945 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33551))))

(declare-fun b!1430526 () Bool)

(declare-fun res!964956 () Bool)

(assert (=> b!1430526 (=> (not res!964956) (not e!807616))))

(assert (=> b!1430526 (= res!964956 (and (= (size!47594 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47594 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47594 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!964954 () Bool)

(assert (=> start!123358 (=> (not res!964954) (not e!807616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123358 (= res!964954 (validMask!0 mask!2608))))

(assert (=> start!123358 e!807616))

(assert (=> start!123358 true))

(declare-fun array_inv!36072 (array!97468) Bool)

(assert (=> start!123358 (array_inv!36072 a!2831)))

(declare-fun b!1430527 () Bool)

(declare-fun res!964952 () Bool)

(assert (=> b!1430527 (=> (not res!964952) (not e!807618))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97468 (_ BitVec 32)) SeekEntryResult!11323)

(assert (=> b!1430527 (= res!964952 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) (Found!11323 j!81)))))

(declare-fun b!1430528 () Bool)

(declare-fun res!964949 () Bool)

(assert (=> b!1430528 (=> (not res!964949) (not e!807616))))

(assert (=> b!1430528 (= res!964949 (validKeyInArray!0 (select (arr!47044 a!2831) i!982)))))

(declare-fun b!1430529 () Bool)

(declare-fun res!964948 () Bool)

(assert (=> b!1430529 (=> (not res!964948) (not e!807616))))

(assert (=> b!1430529 (= res!964948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123358 res!964954) b!1430526))

(assert (= (and b!1430526 res!964956) b!1430528))

(assert (= (and b!1430528 res!964949) b!1430519))

(assert (= (and b!1430519 res!964953) b!1430529))

(assert (= (and b!1430529 res!964948) b!1430525))

(assert (= (and b!1430525 res!964945) b!1430522))

(assert (= (and b!1430522 res!964947) b!1430518))

(assert (= (and b!1430518 res!964957) b!1430520))

(assert (= (and b!1430520 res!964955) b!1430521))

(assert (= (and b!1430521 res!964944) b!1430524))

(assert (= (and b!1430524 res!964946) b!1430523))

(assert (= (and b!1430523 res!964951) b!1430517))

(assert (= (and b!1430517 res!964950) b!1430527))

(assert (= (and b!1430527 res!964952) b!1430516))

(declare-fun m!1320489 () Bool)

(assert (=> b!1430529 m!1320489))

(declare-fun m!1320491 () Bool)

(assert (=> b!1430524 m!1320491))

(declare-fun m!1320493 () Bool)

(assert (=> b!1430521 m!1320493))

(assert (=> b!1430521 m!1320493))

(declare-fun m!1320495 () Bool)

(assert (=> b!1430521 m!1320495))

(assert (=> b!1430518 m!1320493))

(assert (=> b!1430518 m!1320493))

(declare-fun m!1320497 () Bool)

(assert (=> b!1430518 m!1320497))

(assert (=> b!1430518 m!1320497))

(assert (=> b!1430518 m!1320493))

(declare-fun m!1320499 () Bool)

(assert (=> b!1430518 m!1320499))

(assert (=> b!1430519 m!1320493))

(assert (=> b!1430519 m!1320493))

(declare-fun m!1320501 () Bool)

(assert (=> b!1430519 m!1320501))

(declare-fun m!1320503 () Bool)

(assert (=> b!1430520 m!1320503))

(assert (=> b!1430520 m!1320503))

(declare-fun m!1320505 () Bool)

(assert (=> b!1430520 m!1320505))

(declare-fun m!1320507 () Bool)

(assert (=> b!1430520 m!1320507))

(declare-fun m!1320509 () Bool)

(assert (=> b!1430520 m!1320509))

(declare-fun m!1320511 () Bool)

(assert (=> start!123358 m!1320511))

(declare-fun m!1320513 () Bool)

(assert (=> start!123358 m!1320513))

(declare-fun m!1320515 () Bool)

(assert (=> b!1430528 m!1320515))

(assert (=> b!1430528 m!1320515))

(declare-fun m!1320517 () Bool)

(assert (=> b!1430528 m!1320517))

(assert (=> b!1430517 m!1320507))

(declare-fun m!1320519 () Bool)

(assert (=> b!1430517 m!1320519))

(declare-fun m!1320521 () Bool)

(assert (=> b!1430517 m!1320521))

(declare-fun m!1320523 () Bool)

(assert (=> b!1430517 m!1320523))

(assert (=> b!1430517 m!1320493))

(declare-fun m!1320525 () Bool)

(assert (=> b!1430517 m!1320525))

(assert (=> b!1430516 m!1320521))

(assert (=> b!1430516 m!1320493))

(assert (=> b!1430516 m!1320507))

(assert (=> b!1430516 m!1320519))

(assert (=> b!1430527 m!1320493))

(assert (=> b!1430527 m!1320493))

(declare-fun m!1320527 () Bool)

(assert (=> b!1430527 m!1320527))

(declare-fun m!1320529 () Bool)

(assert (=> b!1430525 m!1320529))

(push 1)

(assert (not b!1430529))

(assert (not b!1430521))

(assert (not b!1430527))

(assert (not b!1430525))

(assert (not b!1430517))

(assert (not b!1430518))

(assert (not b!1430528))

(assert (not start!123358))

(assert (not b!1430524))

(assert (not b!1430519))

(assert (not b!1430520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153675 () Bool)

(assert (=> d!153675 (= (validKeyInArray!0 (select (arr!47044 a!2831) j!81)) (and (not (= (select (arr!47044 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47044 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430519 d!153675))

(declare-fun b!1430576 () Bool)

(declare-fun e!807649 () Bool)

(declare-fun call!67432 () Bool)

(assert (=> b!1430576 (= e!807649 call!67432)))

(declare-fun d!153677 () Bool)

(declare-fun res!964969 () Bool)

(declare-fun e!807650 () Bool)

(assert (=> d!153677 (=> res!964969 e!807650)))

(assert (=> d!153677 (= res!964969 (bvsge #b00000000000000000000000000000000 (size!47594 a!2831)))))

(assert (=> d!153677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!807650)))

(declare-fun bm!67429 () Bool)

(assert (=> bm!67429 (= call!67432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430577 () Bool)

(declare-fun e!807651 () Bool)

(assert (=> b!1430577 (= e!807651 call!67432)))

(declare-fun b!1430578 () Bool)

(assert (=> b!1430578 (= e!807651 e!807649)))

(declare-fun lt!629822 () (_ BitVec 64))

(assert (=> b!1430578 (= lt!629822 (select (arr!47044 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!629824 () Unit!48392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97468 (_ BitVec 64) (_ BitVec 32)) Unit!48392)

(assert (=> b!1430578 (= lt!629824 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629822 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1430578 (arrayContainsKey!0 a!2831 lt!629822 #b00000000000000000000000000000000)))

(declare-fun lt!629823 () Unit!48392)

(assert (=> b!1430578 (= lt!629823 lt!629824)))

(declare-fun res!964968 () Bool)

(assert (=> b!1430578 (= res!964968 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11323 #b00000000000000000000000000000000)))))

(assert (=> b!1430578 (=> (not res!964968) (not e!807649))))

(declare-fun b!1430579 () Bool)

(assert (=> b!1430579 (= e!807650 e!807651)))

(declare-fun c!132298 () Bool)

(assert (=> b!1430579 (= c!132298 (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153677 (not res!964969)) b!1430579))

(assert (= (and b!1430579 c!132298) b!1430578))

(assert (= (and b!1430579 (not c!132298)) b!1430577))

(assert (= (and b!1430578 res!964968) b!1430576))

(assert (= (or b!1430576 b!1430577) bm!67429))

(declare-fun m!1320549 () Bool)

(assert (=> bm!67429 m!1320549))

(declare-fun m!1320551 () Bool)

(assert (=> b!1430578 m!1320551))

(declare-fun m!1320553 () Bool)

(assert (=> b!1430578 m!1320553))

(declare-fun m!1320555 () Bool)

(assert (=> b!1430578 m!1320555))

(assert (=> b!1430578 m!1320551))

(declare-fun m!1320557 () Bool)

(assert (=> b!1430578 m!1320557))

(assert (=> b!1430579 m!1320551))

(assert (=> b!1430579 m!1320551))

(declare-fun m!1320559 () Bool)

(assert (=> b!1430579 m!1320559))

(assert (=> b!1430529 d!153677))

(declare-fun b!1430667 () Bool)

(declare-fun e!807706 () SeekEntryResult!11323)

(assert (=> b!1430667 (= e!807706 (Intermediate!11323 false index!585 x!605))))

(declare-fun b!1430668 () Bool)

(declare-fun lt!629856 () SeekEntryResult!11323)

(assert (=> b!1430668 (and (bvsge (index!47686 lt!629856) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629856) (size!47594 lt!629787)))))

(declare-fun e!807708 () Bool)

(assert (=> b!1430668 (= e!807708 (= (select (arr!47044 lt!629787) (index!47686 lt!629856)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430669 () Bool)

(assert (=> b!1430669 (and (bvsge (index!47686 lt!629856) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629856) (size!47594 lt!629787)))))

(declare-fun res!965007 () Bool)

(assert (=> b!1430669 (= res!965007 (= (select (arr!47044 lt!629787) (index!47686 lt!629856)) lt!629789))))

(assert (=> b!1430669 (=> res!965007 e!807708)))

(declare-fun e!807705 () Bool)

(assert (=> b!1430669 (= e!807705 e!807708)))

(declare-fun b!1430670 () Bool)

(declare-fun e!807707 () SeekEntryResult!11323)

(assert (=> b!1430670 (= e!807707 (Intermediate!11323 true index!585 x!605))))

(declare-fun b!1430671 () Bool)

(assert (=> b!1430671 (and (bvsge (index!47686 lt!629856) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629856) (size!47594 lt!629787)))))

(declare-fun res!965008 () Bool)

(assert (=> b!1430671 (= res!965008 (= (select (arr!47044 lt!629787) (index!47686 lt!629856)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430671 (=> res!965008 e!807708)))

(declare-fun b!1430672 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430672 (= e!807706 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629789 lt!629787 mask!2608))))

(declare-fun b!1430673 () Bool)

(declare-fun e!807704 () Bool)

(assert (=> b!1430673 (= e!807704 e!807705)))

(declare-fun res!965009 () Bool)

(assert (=> b!1430673 (= res!965009 (and (is-Intermediate!11323 lt!629856) (not (undefined!12135 lt!629856)) (bvslt (x!129315 lt!629856) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629856) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629856) x!605)))))

(assert (=> b!1430673 (=> (not res!965009) (not e!807705))))

(declare-fun b!1430674 () Bool)

(assert (=> b!1430674 (= e!807707 e!807706)))

(declare-fun c!132326 () Bool)

(declare-fun lt!629857 () (_ BitVec 64))

(assert (=> b!1430674 (= c!132326 (or (= lt!629857 lt!629789) (= (bvadd lt!629857 lt!629857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153679 () Bool)

(assert (=> d!153679 e!807704))

(declare-fun c!132325 () Bool)

(assert (=> d!153679 (= c!132325 (and (is-Intermediate!11323 lt!629856) (undefined!12135 lt!629856)))))

(assert (=> d!153679 (= lt!629856 e!807707)))

(declare-fun c!132327 () Bool)

(assert (=> d!153679 (= c!132327 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153679 (= lt!629857 (select (arr!47044 lt!629787) index!585))))

(assert (=> d!153679 (validMask!0 mask!2608)))

(assert (=> d!153679 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629789 lt!629787 mask!2608) lt!629856)))

(declare-fun b!1430675 () Bool)

(assert (=> b!1430675 (= e!807704 (bvsge (x!129315 lt!629856) #b01111111111111111111111111111110))))

(assert (= (and d!153679 c!132327) b!1430670))

(assert (= (and d!153679 (not c!132327)) b!1430674))

(assert (= (and b!1430674 c!132326) b!1430667))

(assert (= (and b!1430674 (not c!132326)) b!1430672))

(assert (= (and d!153679 c!132325) b!1430675))

(assert (= (and d!153679 (not c!132325)) b!1430673))

(assert (= (and b!1430673 res!965009) b!1430669))

(assert (= (and b!1430669 (not res!965007)) b!1430671))

(assert (= (and b!1430671 (not res!965008)) b!1430668))

(declare-fun m!1320599 () Bool)

(assert (=> b!1430669 m!1320599))

(declare-fun m!1320601 () Bool)

(assert (=> d!153679 m!1320601))

(assert (=> d!153679 m!1320511))

(declare-fun m!1320603 () Bool)

(assert (=> b!1430672 m!1320603))

(assert (=> b!1430672 m!1320603))

(declare-fun m!1320607 () Bool)

(assert (=> b!1430672 m!1320607))

(assert (=> b!1430671 m!1320599))

(assert (=> b!1430668 m!1320599))

(assert (=> b!1430524 d!153679))

(declare-fun b!1430691 () Bool)

(declare-fun e!807722 () Bool)

(declare-fun e!807724 () Bool)

(assert (=> b!1430691 (= e!807722 e!807724)))

(declare-fun c!132331 () Bool)

(assert (=> b!1430691 (= c!132331 (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430692 () Bool)

(declare-fun call!67439 () Bool)

(assert (=> b!1430692 (= e!807724 call!67439)))

(declare-fun b!1430693 () Bool)

(assert (=> b!1430693 (= e!807724 call!67439)))

(declare-fun bm!67436 () Bool)

(assert (=> bm!67436 (= call!67439 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132331 (Cons!33550 (select (arr!47044 a!2831) #b00000000000000000000000000000000) Nil!33551) Nil!33551)))))

(declare-fun d!153699 () Bool)

(declare-fun res!965019 () Bool)

(declare-fun e!807723 () Bool)

(assert (=> d!153699 (=> res!965019 e!807723)))

(assert (=> d!153699 (= res!965019 (bvsge #b00000000000000000000000000000000 (size!47594 a!2831)))))

(assert (=> d!153699 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33551) e!807723)))

(declare-fun b!1430694 () Bool)

(assert (=> b!1430694 (= e!807723 e!807722)))

(declare-fun res!965020 () Bool)

(assert (=> b!1430694 (=> (not res!965020) (not e!807722))))

(declare-fun e!807721 () Bool)

(assert (=> b!1430694 (= res!965020 (not e!807721))))

(declare-fun res!965021 () Bool)

(assert (=> b!1430694 (=> (not res!965021) (not e!807721))))

(assert (=> b!1430694 (= res!965021 (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430695 () Bool)

(declare-fun contains!9862 (List!33554 (_ BitVec 64)) Bool)

(assert (=> b!1430695 (= e!807721 (contains!9862 Nil!33551 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153699 (not res!965019)) b!1430694))

(assert (= (and b!1430694 res!965021) b!1430695))

(assert (= (and b!1430694 res!965020) b!1430691))

(assert (= (and b!1430691 c!132331) b!1430693))

(assert (= (and b!1430691 (not c!132331)) b!1430692))

(assert (= (or b!1430693 b!1430692) bm!67436))

(assert (=> b!1430691 m!1320551))

(assert (=> b!1430691 m!1320551))

(assert (=> b!1430691 m!1320559))

(assert (=> bm!67436 m!1320551))

(declare-fun m!1320609 () Bool)

(assert (=> bm!67436 m!1320609))

(assert (=> b!1430694 m!1320551))

(assert (=> b!1430694 m!1320551))

(assert (=> b!1430694 m!1320559))

(assert (=> b!1430695 m!1320551))

(assert (=> b!1430695 m!1320551))

(declare-fun m!1320611 () Bool)

(assert (=> b!1430695 m!1320611))

(assert (=> b!1430525 d!153699))

(declare-fun b!1430696 () Bool)

(declare-fun e!807727 () SeekEntryResult!11323)

(assert (=> b!1430696 (= e!807727 (Intermediate!11323 false (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430697 () Bool)

(declare-fun lt!629858 () SeekEntryResult!11323)

(assert (=> b!1430697 (and (bvsge (index!47686 lt!629858) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629858) (size!47594 lt!629787)))))

(declare-fun e!807729 () Bool)

(assert (=> b!1430697 (= e!807729 (= (select (arr!47044 lt!629787) (index!47686 lt!629858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430698 () Bool)

(assert (=> b!1430698 (and (bvsge (index!47686 lt!629858) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629858) (size!47594 lt!629787)))))

(declare-fun res!965022 () Bool)

(assert (=> b!1430698 (= res!965022 (= (select (arr!47044 lt!629787) (index!47686 lt!629858)) lt!629789))))

(assert (=> b!1430698 (=> res!965022 e!807729)))

(declare-fun e!807726 () Bool)

(assert (=> b!1430698 (= e!807726 e!807729)))

(declare-fun b!1430699 () Bool)

(declare-fun e!807728 () SeekEntryResult!11323)

(assert (=> b!1430699 (= e!807728 (Intermediate!11323 true (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430700 () Bool)

(assert (=> b!1430700 (and (bvsge (index!47686 lt!629858) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629858) (size!47594 lt!629787)))))

(declare-fun res!965023 () Bool)

(assert (=> b!1430700 (= res!965023 (= (select (arr!47044 lt!629787) (index!47686 lt!629858)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430700 (=> res!965023 e!807729)))

(declare-fun b!1430701 () Bool)

(assert (=> b!1430701 (= e!807727 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629789 lt!629787 mask!2608))))

(declare-fun b!1430702 () Bool)

(declare-fun e!807725 () Bool)

(assert (=> b!1430702 (= e!807725 e!807726)))

(declare-fun res!965024 () Bool)

(assert (=> b!1430702 (= res!965024 (and (is-Intermediate!11323 lt!629858) (not (undefined!12135 lt!629858)) (bvslt (x!129315 lt!629858) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629858) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629858) #b00000000000000000000000000000000)))))

(assert (=> b!1430702 (=> (not res!965024) (not e!807726))))

(declare-fun b!1430703 () Bool)

(assert (=> b!1430703 (= e!807728 e!807727)))

(declare-fun c!132333 () Bool)

(declare-fun lt!629859 () (_ BitVec 64))

(assert (=> b!1430703 (= c!132333 (or (= lt!629859 lt!629789) (= (bvadd lt!629859 lt!629859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153701 () Bool)

(assert (=> d!153701 e!807725))

(declare-fun c!132332 () Bool)

(assert (=> d!153701 (= c!132332 (and (is-Intermediate!11323 lt!629858) (undefined!12135 lt!629858)))))

(assert (=> d!153701 (= lt!629858 e!807728)))

(declare-fun c!132334 () Bool)

(assert (=> d!153701 (= c!132334 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153701 (= lt!629859 (select (arr!47044 lt!629787) (toIndex!0 lt!629789 mask!2608)))))

(assert (=> d!153701 (validMask!0 mask!2608)))

(assert (=> d!153701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629789 mask!2608) lt!629789 lt!629787 mask!2608) lt!629858)))

(declare-fun b!1430704 () Bool)

(assert (=> b!1430704 (= e!807725 (bvsge (x!129315 lt!629858) #b01111111111111111111111111111110))))

(assert (= (and d!153701 c!132334) b!1430699))

(assert (= (and d!153701 (not c!132334)) b!1430703))

(assert (= (and b!1430703 c!132333) b!1430696))

(assert (= (and b!1430703 (not c!132333)) b!1430701))

(assert (= (and d!153701 c!132332) b!1430704))

(assert (= (and d!153701 (not c!132332)) b!1430702))

(assert (= (and b!1430702 res!965024) b!1430698))

(assert (= (and b!1430698 (not res!965022)) b!1430700))

(assert (= (and b!1430700 (not res!965023)) b!1430697))

(declare-fun m!1320613 () Bool)

(assert (=> b!1430698 m!1320613))

(assert (=> d!153701 m!1320503))

(declare-fun m!1320615 () Bool)

(assert (=> d!153701 m!1320615))

(assert (=> d!153701 m!1320511))

(assert (=> b!1430701 m!1320503))

(declare-fun m!1320617 () Bool)

(assert (=> b!1430701 m!1320617))

(assert (=> b!1430701 m!1320617))

(declare-fun m!1320619 () Bool)

(assert (=> b!1430701 m!1320619))

(assert (=> b!1430700 m!1320613))

(assert (=> b!1430697 m!1320613))

(assert (=> b!1430520 d!153701))

(declare-fun d!153703 () Bool)

(declare-fun lt!629875 () (_ BitVec 32))

(declare-fun lt!629874 () (_ BitVec 32))

(assert (=> d!153703 (= lt!629875 (bvmul (bvxor lt!629874 (bvlshr lt!629874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153703 (= lt!629874 ((_ extract 31 0) (bvand (bvxor lt!629789 (bvlshr lt!629789 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153703 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965025 (let ((h!34870 ((_ extract 31 0) (bvand (bvxor lt!629789 (bvlshr lt!629789 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129321 (bvmul (bvxor h!34870 (bvlshr h!34870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129321 (bvlshr x!129321 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965025 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965025 #b00000000000000000000000000000000))))))

(assert (=> d!153703 (= (toIndex!0 lt!629789 mask!2608) (bvand (bvxor lt!629875 (bvlshr lt!629875 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430520 d!153703))

(declare-fun d!153713 () Bool)

(assert (=> d!153713 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123358 d!153713))

(declare-fun d!153717 () Bool)

(assert (=> d!153717 (= (array_inv!36072 a!2831) (bvsge (size!47594 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123358 d!153717))

(declare-fun d!153719 () Bool)

(declare-fun lt!629910 () SeekEntryResult!11323)

(assert (=> d!153719 (and (or (is-Undefined!11323 lt!629910) (not (is-Found!11323 lt!629910)) (and (bvsge (index!47685 lt!629910) #b00000000000000000000000000000000) (bvslt (index!47685 lt!629910) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629910) (is-Found!11323 lt!629910) (not (is-MissingZero!11323 lt!629910)) (and (bvsge (index!47684 lt!629910) #b00000000000000000000000000000000) (bvslt (index!47684 lt!629910) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629910) (is-Found!11323 lt!629910) (is-MissingZero!11323 lt!629910) (not (is-MissingVacant!11323 lt!629910)) (and (bvsge (index!47687 lt!629910) #b00000000000000000000000000000000) (bvslt (index!47687 lt!629910) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629910) (ite (is-Found!11323 lt!629910) (= (select (arr!47044 a!2831) (index!47685 lt!629910)) (select (arr!47044 a!2831) j!81)) (ite (is-MissingZero!11323 lt!629910) (= (select (arr!47044 a!2831) (index!47684 lt!629910)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11323 lt!629910) (= (select (arr!47044 a!2831) (index!47687 lt!629910)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!807782 () SeekEntryResult!11323)

(assert (=> d!153719 (= lt!629910 e!807782)))

(declare-fun c!132369 () Bool)

(declare-fun lt!629908 () SeekEntryResult!11323)

(assert (=> d!153719 (= c!132369 (and (is-Intermediate!11323 lt!629908) (undefined!12135 lt!629908)))))

(assert (=> d!153719 (= lt!629908 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153719 (validMask!0 mask!2608)))

(assert (=> d!153719 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629910)))

(declare-fun b!1430796 () Bool)

(declare-fun e!807784 () SeekEntryResult!11323)

(assert (=> b!1430796 (= e!807782 e!807784)))

(declare-fun lt!629909 () (_ BitVec 64))

(assert (=> b!1430796 (= lt!629909 (select (arr!47044 a!2831) (index!47686 lt!629908)))))

(declare-fun c!132370 () Bool)

(assert (=> b!1430796 (= c!132370 (= lt!629909 (select (arr!47044 a!2831) j!81)))))

(declare-fun e!807783 () SeekEntryResult!11323)

(declare-fun b!1430797 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97468 (_ BitVec 32)) SeekEntryResult!11323)

(assert (=> b!1430797 (= e!807783 (seekKeyOrZeroReturnVacant!0 (x!129315 lt!629908) (index!47686 lt!629908) (index!47686 lt!629908) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430798 () Bool)

(assert (=> b!1430798 (= e!807784 (Found!11323 (index!47686 lt!629908)))))

(declare-fun b!1430799 () Bool)

(assert (=> b!1430799 (= e!807782 Undefined!11323)))

(declare-fun b!1430800 () Bool)

(assert (=> b!1430800 (= e!807783 (MissingZero!11323 (index!47686 lt!629908)))))

(declare-fun b!1430801 () Bool)

(declare-fun c!132371 () Bool)

(assert (=> b!1430801 (= c!132371 (= lt!629909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430801 (= e!807784 e!807783)))

(assert (= (and d!153719 c!132369) b!1430799))

(assert (= (and d!153719 (not c!132369)) b!1430796))

(assert (= (and b!1430796 c!132370) b!1430798))

(assert (= (and b!1430796 (not c!132370)) b!1430801))

(assert (= (and b!1430801 c!132371) b!1430800))

(assert (= (and b!1430801 (not c!132371)) b!1430797))

(declare-fun m!1320683 () Bool)

(assert (=> d!153719 m!1320683))

(assert (=> d!153719 m!1320511))

(assert (=> d!153719 m!1320497))

(assert (=> d!153719 m!1320493))

(assert (=> d!153719 m!1320499))

(declare-fun m!1320685 () Bool)

(assert (=> d!153719 m!1320685))

(assert (=> d!153719 m!1320493))

(assert (=> d!153719 m!1320497))

(declare-fun m!1320687 () Bool)

(assert (=> d!153719 m!1320687))

(declare-fun m!1320689 () Bool)

(assert (=> b!1430796 m!1320689))

(assert (=> b!1430797 m!1320493))

(declare-fun m!1320691 () Bool)

(assert (=> b!1430797 m!1320691))

(assert (=> b!1430527 d!153719))

(declare-fun b!1430802 () Bool)

(declare-fun e!807787 () SeekEntryResult!11323)

(assert (=> b!1430802 (= e!807787 (Intermediate!11323 false index!585 x!605))))

(declare-fun b!1430803 () Bool)

(declare-fun lt!629911 () SeekEntryResult!11323)

(assert (=> b!1430803 (and (bvsge (index!47686 lt!629911) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629911) (size!47594 a!2831)))))

(declare-fun e!807789 () Bool)

(assert (=> b!1430803 (= e!807789 (= (select (arr!47044 a!2831) (index!47686 lt!629911)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430804 () Bool)

(assert (=> b!1430804 (and (bvsge (index!47686 lt!629911) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629911) (size!47594 a!2831)))))

(declare-fun res!965049 () Bool)

(assert (=> b!1430804 (= res!965049 (= (select (arr!47044 a!2831) (index!47686 lt!629911)) (select (arr!47044 a!2831) j!81)))))

(assert (=> b!1430804 (=> res!965049 e!807789)))

(declare-fun e!807786 () Bool)

(assert (=> b!1430804 (= e!807786 e!807789)))

(declare-fun b!1430805 () Bool)

(declare-fun e!807788 () SeekEntryResult!11323)

(assert (=> b!1430805 (= e!807788 (Intermediate!11323 true index!585 x!605))))

(declare-fun b!1430806 () Bool)

(assert (=> b!1430806 (and (bvsge (index!47686 lt!629911) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629911) (size!47594 a!2831)))))

(declare-fun res!965050 () Bool)

(assert (=> b!1430806 (= res!965050 (= (select (arr!47044 a!2831) (index!47686 lt!629911)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430806 (=> res!965050 e!807789)))

(declare-fun b!1430807 () Bool)

(assert (=> b!1430807 (= e!807787 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430808 () Bool)

(declare-fun e!807785 () Bool)

(assert (=> b!1430808 (= e!807785 e!807786)))

(declare-fun res!965051 () Bool)

(assert (=> b!1430808 (= res!965051 (and (is-Intermediate!11323 lt!629911) (not (undefined!12135 lt!629911)) (bvslt (x!129315 lt!629911) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629911) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629911) x!605)))))

(assert (=> b!1430808 (=> (not res!965051) (not e!807786))))

(declare-fun b!1430809 () Bool)

(assert (=> b!1430809 (= e!807788 e!807787)))

(declare-fun lt!629912 () (_ BitVec 64))

(declare-fun c!132373 () Bool)

(assert (=> b!1430809 (= c!132373 (or (= lt!629912 (select (arr!47044 a!2831) j!81)) (= (bvadd lt!629912 lt!629912) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153743 () Bool)

(assert (=> d!153743 e!807785))

(declare-fun c!132372 () Bool)

(assert (=> d!153743 (= c!132372 (and (is-Intermediate!11323 lt!629911) (undefined!12135 lt!629911)))))

(assert (=> d!153743 (= lt!629911 e!807788)))

(declare-fun c!132374 () Bool)

(assert (=> d!153743 (= c!132374 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!153743 (= lt!629912 (select (arr!47044 a!2831) index!585))))

(assert (=> d!153743 (validMask!0 mask!2608)))

(assert (=> d!153743 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629911)))

(declare-fun b!1430810 () Bool)

(assert (=> b!1430810 (= e!807785 (bvsge (x!129315 lt!629911) #b01111111111111111111111111111110))))

(assert (= (and d!153743 c!132374) b!1430805))

(assert (= (and d!153743 (not c!132374)) b!1430809))

(assert (= (and b!1430809 c!132373) b!1430802))

(assert (= (and b!1430809 (not c!132373)) b!1430807))

(assert (= (and d!153743 c!132372) b!1430810))

(assert (= (and d!153743 (not c!132372)) b!1430808))

(assert (= (and b!1430808 res!965051) b!1430804))

(assert (= (and b!1430804 (not res!965049)) b!1430806))

(assert (= (and b!1430806 (not res!965050)) b!1430803))

(declare-fun m!1320693 () Bool)

(assert (=> b!1430804 m!1320693))

(assert (=> d!153743 m!1320521))

(assert (=> d!153743 m!1320511))

(assert (=> b!1430807 m!1320603))

(assert (=> b!1430807 m!1320603))

(assert (=> b!1430807 m!1320493))

(declare-fun m!1320695 () Bool)

(assert (=> b!1430807 m!1320695))

(assert (=> b!1430806 m!1320693))

(assert (=> b!1430803 m!1320693))

(assert (=> b!1430521 d!153743))

(declare-fun e!807800 () SeekEntryResult!11323)

(declare-fun b!1430821 () Bool)

(assert (=> b!1430821 (= e!807800 (Intermediate!11323 false (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430822 () Bool)

(declare-fun lt!629913 () SeekEntryResult!11323)

(assert (=> b!1430822 (and (bvsge (index!47686 lt!629913) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629913) (size!47594 a!2831)))))

(declare-fun e!807802 () Bool)

(assert (=> b!1430822 (= e!807802 (= (select (arr!47044 a!2831) (index!47686 lt!629913)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430823 () Bool)

(assert (=> b!1430823 (and (bvsge (index!47686 lt!629913) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629913) (size!47594 a!2831)))))

(declare-fun res!965058 () Bool)

(assert (=> b!1430823 (= res!965058 (= (select (arr!47044 a!2831) (index!47686 lt!629913)) (select (arr!47044 a!2831) j!81)))))

(assert (=> b!1430823 (=> res!965058 e!807802)))

(declare-fun e!807799 () Bool)

(assert (=> b!1430823 (= e!807799 e!807802)))

(declare-fun e!807801 () SeekEntryResult!11323)

(declare-fun b!1430824 () Bool)

(assert (=> b!1430824 (= e!807801 (Intermediate!11323 true (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1430825 () Bool)

(assert (=> b!1430825 (and (bvsge (index!47686 lt!629913) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629913) (size!47594 a!2831)))))

(declare-fun res!965059 () Bool)

(assert (=> b!1430825 (= res!965059 (= (select (arr!47044 a!2831) (index!47686 lt!629913)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430825 (=> res!965059 e!807802)))

(declare-fun b!1430826 () Bool)

(assert (=> b!1430826 (= e!807800 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430827 () Bool)

(declare-fun e!807798 () Bool)

(assert (=> b!1430827 (= e!807798 e!807799)))

(declare-fun res!965060 () Bool)

(assert (=> b!1430827 (= res!965060 (and (is-Intermediate!11323 lt!629913) (not (undefined!12135 lt!629913)) (bvslt (x!129315 lt!629913) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629913) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629913) #b00000000000000000000000000000000)))))

(assert (=> b!1430827 (=> (not res!965060) (not e!807799))))

(declare-fun b!1430828 () Bool)

(assert (=> b!1430828 (= e!807801 e!807800)))

(declare-fun c!132378 () Bool)

(declare-fun lt!629914 () (_ BitVec 64))

(assert (=> b!1430828 (= c!132378 (or (= lt!629914 (select (arr!47044 a!2831) j!81)) (= (bvadd lt!629914 lt!629914) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153745 () Bool)

(assert (=> d!153745 e!807798))

(declare-fun c!132377 () Bool)

(assert (=> d!153745 (= c!132377 (and (is-Intermediate!11323 lt!629913) (undefined!12135 lt!629913)))))

(assert (=> d!153745 (= lt!629913 e!807801)))

(declare-fun c!132379 () Bool)

(assert (=> d!153745 (= c!132379 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!153745 (= lt!629914 (select (arr!47044 a!2831) (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608)))))

(assert (=> d!153745 (validMask!0 mask!2608)))

(assert (=> d!153745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629913)))

(declare-fun b!1430829 () Bool)

(assert (=> b!1430829 (= e!807798 (bvsge (x!129315 lt!629913) #b01111111111111111111111111111110))))

(assert (= (and d!153745 c!132379) b!1430824))

(assert (= (and d!153745 (not c!132379)) b!1430828))

(assert (= (and b!1430828 c!132378) b!1430821))

(assert (= (and b!1430828 (not c!132378)) b!1430826))

(assert (= (and d!153745 c!132377) b!1430829))

(assert (= (and d!153745 (not c!132377)) b!1430827))

(assert (= (and b!1430827 res!965060) b!1430823))

(assert (= (and b!1430823 (not res!965058)) b!1430825))

(assert (= (and b!1430825 (not res!965059)) b!1430822))

(declare-fun m!1320697 () Bool)

(assert (=> b!1430823 m!1320697))

(assert (=> d!153745 m!1320497))

(declare-fun m!1320699 () Bool)

(assert (=> d!153745 m!1320699))

(assert (=> d!153745 m!1320511))

(assert (=> b!1430826 m!1320497))

(declare-fun m!1320701 () Bool)

(assert (=> b!1430826 m!1320701))

(assert (=> b!1430826 m!1320701))

(assert (=> b!1430826 m!1320493))

(declare-fun m!1320703 () Bool)

(assert (=> b!1430826 m!1320703))

(assert (=> b!1430825 m!1320697))

(assert (=> b!1430822 m!1320697))

(assert (=> b!1430518 d!153745))

(declare-fun d!153747 () Bool)

(declare-fun lt!629916 () (_ BitVec 32))

(declare-fun lt!629915 () (_ BitVec 32))

(assert (=> d!153747 (= lt!629916 (bvmul (bvxor lt!629915 (bvlshr lt!629915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153747 (= lt!629915 ((_ extract 31 0) (bvand (bvxor (select (arr!47044 a!2831) j!81) (bvlshr (select (arr!47044 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153747 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!965025 (let ((h!34870 ((_ extract 31 0) (bvand (bvxor (select (arr!47044 a!2831) j!81) (bvlshr (select (arr!47044 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129321 (bvmul (bvxor h!34870 (bvlshr h!34870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129321 (bvlshr x!129321 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!965025 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!965025 #b00000000000000000000000000000000))))))

(assert (=> d!153747 (= (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) (bvand (bvxor lt!629916 (bvlshr lt!629916 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1430518 d!153747))

(declare-fun b!1430830 () Bool)

(declare-fun e!807803 () Bool)

(declare-fun call!67446 () Bool)

(assert (=> b!1430830 (= e!807803 call!67446)))

(declare-fun d!153749 () Bool)

(declare-fun res!965062 () Bool)

(declare-fun e!807804 () Bool)

(assert (=> d!153749 (=> res!965062 e!807804)))

(assert (=> d!153749 (= res!965062 (bvsge j!81 (size!47594 a!2831)))))

(assert (=> d!153749 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!807804)))

(declare-fun bm!67443 () Bool)

(assert (=> bm!67443 (= call!67446 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430831 () Bool)

(declare-fun e!807805 () Bool)

(assert (=> b!1430831 (= e!807805 call!67446)))

(declare-fun b!1430832 () Bool)

(assert (=> b!1430832 (= e!807805 e!807803)))

(declare-fun lt!629917 () (_ BitVec 64))

(assert (=> b!1430832 (= lt!629917 (select (arr!47044 a!2831) j!81))))

(declare-fun lt!629919 () Unit!48392)

(assert (=> b!1430832 (= lt!629919 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629917 j!81))))

(assert (=> b!1430832 (arrayContainsKey!0 a!2831 lt!629917 #b00000000000000000000000000000000)))

(declare-fun lt!629918 () Unit!48392)

(assert (=> b!1430832 (= lt!629918 lt!629919)))

(declare-fun res!965061 () Bool)

(assert (=> b!1430832 (= res!965061 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) j!81) a!2831 mask!2608) (Found!11323 j!81)))))

(assert (=> b!1430832 (=> (not res!965061) (not e!807803))))

(declare-fun b!1430833 () Bool)

(assert (=> b!1430833 (= e!807804 e!807805)))

(declare-fun c!132380 () Bool)

(assert (=> b!1430833 (= c!132380 (validKeyInArray!0 (select (arr!47044 a!2831) j!81)))))

(assert (= (and d!153749 (not res!965062)) b!1430833))

(assert (= (and b!1430833 c!132380) b!1430832))

(assert (= (and b!1430833 (not c!132380)) b!1430831))

(assert (= (and b!1430832 res!965061) b!1430830))

(assert (= (or b!1430830 b!1430831) bm!67443))

(declare-fun m!1320705 () Bool)

(assert (=> bm!67443 m!1320705))

(assert (=> b!1430832 m!1320493))

(declare-fun m!1320707 () Bool)

(assert (=> b!1430832 m!1320707))

(declare-fun m!1320709 () Bool)

(assert (=> b!1430832 m!1320709))

(assert (=> b!1430832 m!1320493))

(assert (=> b!1430832 m!1320527))

(assert (=> b!1430833 m!1320493))

(assert (=> b!1430833 m!1320493))

(assert (=> b!1430833 m!1320501))

(assert (=> b!1430517 d!153749))

(declare-fun d!153751 () Bool)

(assert (=> d!153751 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!629922 () Unit!48392)

(declare-fun choose!38 (array!97468 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48392)

(assert (=> d!153751 (= lt!629922 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!153751 (validMask!0 mask!2608)))

(assert (=> d!153751 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!629922)))

(declare-fun bs!41671 () Bool)

(assert (= bs!41671 d!153751))

(assert (=> bs!41671 m!1320523))

(declare-fun m!1320715 () Bool)

(assert (=> bs!41671 m!1320715))

(assert (=> bs!41671 m!1320511))

(assert (=> b!1430517 d!153751))

(declare-fun d!153753 () Bool)

(assert (=> d!153753 (= (validKeyInArray!0 (select (arr!47044 a!2831) i!982)) (and (not (= (select (arr!47044 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47044 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430528 d!153753))

(push 1)

(assert (not d!153679))

(assert (not bm!67443))

(assert (not b!1430672))

(assert (not b!1430695))

(assert (not bm!67429))

(assert (not b!1430807))

(assert (not b!1430797))

(assert (not d!153719))

(assert (not bm!67436))

(assert (not d!153751))

(assert (not b!1430694))

(assert (not d!153701))

(assert (not b!1430832))

(assert (not d!153743))

(assert (not d!153745))

(assert (not b!1430578))

(assert (not b!1430701))

(assert (not b!1430833))

(assert (not b!1430691))

(assert (not b!1430579))

(assert (not b!1430826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153793 () Bool)

(assert (=> d!153793 (= (validKeyInArray!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000)) (and (not (= (select (arr!47044 a!2831) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47044 a!2831) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1430691 d!153793))

(assert (=> d!153701 d!153713))

(assert (=> d!153719 d!153745))

(assert (=> d!153719 d!153747))

(assert (=> d!153719 d!153713))

(declare-fun b!1430926 () Bool)

(declare-fun e!807866 () Bool)

(declare-fun call!67451 () Bool)

(assert (=> b!1430926 (= e!807866 call!67451)))

(declare-fun d!153795 () Bool)

(declare-fun res!965100 () Bool)

(declare-fun e!807867 () Bool)

(assert (=> d!153795 (=> res!965100 e!807867)))

(assert (=> d!153795 (= res!965100 (bvsge (bvadd j!81 #b00000000000000000000000000000001) (size!47594 a!2831)))))

(assert (=> d!153795 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608) e!807867)))

(declare-fun bm!67448 () Bool)

(assert (=> bm!67448 (= call!67451 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430927 () Bool)

(declare-fun e!807868 () Bool)

(assert (=> b!1430927 (= e!807868 call!67451)))

(declare-fun b!1430928 () Bool)

(assert (=> b!1430928 (= e!807868 e!807866)))

(declare-fun lt!629958 () (_ BitVec 64))

(assert (=> b!1430928 (= lt!629958 (select (arr!47044 a!2831) (bvadd j!81 #b00000000000000000000000000000001)))))

(declare-fun lt!629960 () Unit!48392)

(assert (=> b!1430928 (= lt!629960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629958 (bvadd j!81 #b00000000000000000000000000000001)))))

(assert (=> b!1430928 (arrayContainsKey!0 a!2831 lt!629958 #b00000000000000000000000000000000)))

(declare-fun lt!629959 () Unit!48392)

(assert (=> b!1430928 (= lt!629959 lt!629960)))

(declare-fun res!965099 () Bool)

(assert (=> b!1430928 (= res!965099 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) (bvadd j!81 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11323 (bvadd j!81 #b00000000000000000000000000000001))))))

(assert (=> b!1430928 (=> (not res!965099) (not e!807866))))

(declare-fun b!1430929 () Bool)

(assert (=> b!1430929 (= e!807867 e!807868)))

(declare-fun c!132409 () Bool)

(assert (=> b!1430929 (= c!132409 (validKeyInArray!0 (select (arr!47044 a!2831) (bvadd j!81 #b00000000000000000000000000000001))))))

(assert (= (and d!153795 (not res!965100)) b!1430929))

(assert (= (and b!1430929 c!132409) b!1430928))

(assert (= (and b!1430929 (not c!132409)) b!1430927))

(assert (= (and b!1430928 res!965099) b!1430926))

(assert (= (or b!1430926 b!1430927) bm!67448))

(declare-fun m!1320817 () Bool)

(assert (=> bm!67448 m!1320817))

(declare-fun m!1320819 () Bool)

(assert (=> b!1430928 m!1320819))

(declare-fun m!1320821 () Bool)

(assert (=> b!1430928 m!1320821))

(declare-fun m!1320823 () Bool)

(assert (=> b!1430928 m!1320823))

(assert (=> b!1430928 m!1320819))

(declare-fun m!1320825 () Bool)

(assert (=> b!1430928 m!1320825))

(assert (=> b!1430929 m!1320819))

(assert (=> b!1430929 m!1320819))

(declare-fun m!1320827 () Bool)

(assert (=> b!1430929 m!1320827))

(assert (=> bm!67443 d!153795))

(assert (=> d!153679 d!153713))

(declare-fun b!1430930 () Bool)

(declare-fun e!807870 () Bool)

(declare-fun e!807872 () Bool)

(assert (=> b!1430930 (= e!807870 e!807872)))

(declare-fun c!132410 () Bool)

(assert (=> b!1430930 (= c!132410 (validKeyInArray!0 (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430931 () Bool)

(declare-fun call!67452 () Bool)

(assert (=> b!1430931 (= e!807872 call!67452)))

(declare-fun b!1430932 () Bool)

(assert (=> b!1430932 (= e!807872 call!67452)))

(declare-fun bm!67449 () Bool)

(assert (=> bm!67449 (= call!67452 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!132410 (Cons!33550 (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!132331 (Cons!33550 (select (arr!47044 a!2831) #b00000000000000000000000000000000) Nil!33551) Nil!33551)) (ite c!132331 (Cons!33550 (select (arr!47044 a!2831) #b00000000000000000000000000000000) Nil!33551) Nil!33551))))))

(declare-fun d!153797 () Bool)

(declare-fun res!965101 () Bool)

(declare-fun e!807871 () Bool)

(assert (=> d!153797 (=> res!965101 e!807871)))

(assert (=> d!153797 (= res!965101 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47594 a!2831)))))

(assert (=> d!153797 (= (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132331 (Cons!33550 (select (arr!47044 a!2831) #b00000000000000000000000000000000) Nil!33551) Nil!33551)) e!807871)))

(declare-fun b!1430933 () Bool)

(assert (=> b!1430933 (= e!807871 e!807870)))

(declare-fun res!965102 () Bool)

(assert (=> b!1430933 (=> (not res!965102) (not e!807870))))

(declare-fun e!807869 () Bool)

(assert (=> b!1430933 (= res!965102 (not e!807869))))

(declare-fun res!965103 () Bool)

(assert (=> b!1430933 (=> (not res!965103) (not e!807869))))

(assert (=> b!1430933 (= res!965103 (validKeyInArray!0 (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1430934 () Bool)

(assert (=> b!1430934 (= e!807869 (contains!9862 (ite c!132331 (Cons!33550 (select (arr!47044 a!2831) #b00000000000000000000000000000000) Nil!33551) Nil!33551) (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!153797 (not res!965101)) b!1430933))

(assert (= (and b!1430933 res!965103) b!1430934))

(assert (= (and b!1430933 res!965102) b!1430930))

(assert (= (and b!1430930 c!132410) b!1430932))

(assert (= (and b!1430930 (not c!132410)) b!1430931))

(assert (= (or b!1430932 b!1430931) bm!67449))

(declare-fun m!1320829 () Bool)

(assert (=> b!1430930 m!1320829))

(assert (=> b!1430930 m!1320829))

(declare-fun m!1320831 () Bool)

(assert (=> b!1430930 m!1320831))

(assert (=> bm!67449 m!1320829))

(declare-fun m!1320833 () Bool)

(assert (=> bm!67449 m!1320833))

(assert (=> b!1430933 m!1320829))

(assert (=> b!1430933 m!1320829))

(assert (=> b!1430933 m!1320831))

(assert (=> b!1430934 m!1320829))

(assert (=> b!1430934 m!1320829))

(declare-fun m!1320835 () Bool)

(assert (=> b!1430934 m!1320835))

(assert (=> bm!67436 d!153797))

(assert (=> b!1430694 d!153793))

(assert (=> d!153745 d!153713))

(declare-fun b!1430947 () Bool)

(declare-fun c!132417 () Bool)

(declare-fun lt!629966 () (_ BitVec 64))

(assert (=> b!1430947 (= c!132417 (= lt!629966 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!807880 () SeekEntryResult!11323)

(declare-fun e!807879 () SeekEntryResult!11323)

(assert (=> b!1430947 (= e!807880 e!807879)))

(declare-fun b!1430949 () Bool)

(assert (=> b!1430949 (= e!807879 (seekKeyOrZeroReturnVacant!0 (bvadd (x!129315 lt!629908) #b00000000000000000000000000000001) (nextIndex!0 (index!47686 lt!629908) (x!129315 lt!629908) mask!2608) (index!47686 lt!629908) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1430950 () Bool)

(declare-fun e!807881 () SeekEntryResult!11323)

(assert (=> b!1430950 (= e!807881 Undefined!11323)))

(declare-fun b!1430948 () Bool)

(assert (=> b!1430948 (= e!807881 e!807880)))

(declare-fun c!132419 () Bool)

(assert (=> b!1430948 (= c!132419 (= lt!629966 (select (arr!47044 a!2831) j!81)))))

(declare-fun lt!629965 () SeekEntryResult!11323)

(declare-fun d!153799 () Bool)

(assert (=> d!153799 (and (or (is-Undefined!11323 lt!629965) (not (is-Found!11323 lt!629965)) (and (bvsge (index!47685 lt!629965) #b00000000000000000000000000000000) (bvslt (index!47685 lt!629965) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629965) (is-Found!11323 lt!629965) (not (is-MissingVacant!11323 lt!629965)) (not (= (index!47687 lt!629965) (index!47686 lt!629908))) (and (bvsge (index!47687 lt!629965) #b00000000000000000000000000000000) (bvslt (index!47687 lt!629965) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629965) (ite (is-Found!11323 lt!629965) (= (select (arr!47044 a!2831) (index!47685 lt!629965)) (select (arr!47044 a!2831) j!81)) (and (is-MissingVacant!11323 lt!629965) (= (index!47687 lt!629965) (index!47686 lt!629908)) (= (select (arr!47044 a!2831) (index!47687 lt!629965)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!153799 (= lt!629965 e!807881)))

(declare-fun c!132418 () Bool)

(assert (=> d!153799 (= c!132418 (bvsge (x!129315 lt!629908) #b01111111111111111111111111111110))))

(assert (=> d!153799 (= lt!629966 (select (arr!47044 a!2831) (index!47686 lt!629908)))))

(assert (=> d!153799 (validMask!0 mask!2608)))

(assert (=> d!153799 (= (seekKeyOrZeroReturnVacant!0 (x!129315 lt!629908) (index!47686 lt!629908) (index!47686 lt!629908) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629965)))

(declare-fun b!1430951 () Bool)

(assert (=> b!1430951 (= e!807880 (Found!11323 (index!47686 lt!629908)))))

(declare-fun b!1430952 () Bool)

(assert (=> b!1430952 (= e!807879 (MissingVacant!11323 (index!47686 lt!629908)))))

(assert (= (and d!153799 c!132418) b!1430950))

(assert (= (and d!153799 (not c!132418)) b!1430948))

(assert (= (and b!1430948 c!132419) b!1430951))

(assert (= (and b!1430948 (not c!132419)) b!1430947))

(assert (= (and b!1430947 c!132417) b!1430952))

(assert (= (and b!1430947 (not c!132417)) b!1430949))

(declare-fun m!1320837 () Bool)

(assert (=> b!1430949 m!1320837))

(assert (=> b!1430949 m!1320837))

(assert (=> b!1430949 m!1320493))

(declare-fun m!1320839 () Bool)

(assert (=> b!1430949 m!1320839))

(declare-fun m!1320841 () Bool)

(assert (=> d!153799 m!1320841))

(declare-fun m!1320843 () Bool)

(assert (=> d!153799 m!1320843))

(assert (=> d!153799 m!1320689))

(assert (=> d!153799 m!1320511))

(assert (=> b!1430797 d!153799))

(declare-fun d!153801 () Bool)

(assert (=> d!153801 (arrayContainsKey!0 a!2831 lt!629917 #b00000000000000000000000000000000)))

(declare-fun lt!629969 () Unit!48392)

(declare-fun choose!13 (array!97468 (_ BitVec 64) (_ BitVec 32)) Unit!48392)

(assert (=> d!153801 (= lt!629969 (choose!13 a!2831 lt!629917 j!81))))

(assert (=> d!153801 (bvsge j!81 #b00000000000000000000000000000000)))

(assert (=> d!153801 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629917 j!81) lt!629969)))

(declare-fun bs!41678 () Bool)

(assert (= bs!41678 d!153801))

(assert (=> bs!41678 m!1320709))

(declare-fun m!1320845 () Bool)

(assert (=> bs!41678 m!1320845))

(assert (=> b!1430832 d!153801))

(declare-fun d!153803 () Bool)

(declare-fun res!965108 () Bool)

(declare-fun e!807886 () Bool)

(assert (=> d!153803 (=> res!965108 e!807886)))

(assert (=> d!153803 (= res!965108 (= (select (arr!47044 a!2831) #b00000000000000000000000000000000) lt!629917))))

(assert (=> d!153803 (= (arrayContainsKey!0 a!2831 lt!629917 #b00000000000000000000000000000000) e!807886)))

(declare-fun b!1430957 () Bool)

(declare-fun e!807887 () Bool)

(assert (=> b!1430957 (= e!807886 e!807887)))

(declare-fun res!965109 () Bool)

(assert (=> b!1430957 (=> (not res!965109) (not e!807887))))

(assert (=> b!1430957 (= res!965109 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47594 a!2831)))))

(declare-fun b!1430958 () Bool)

(assert (=> b!1430958 (= e!807887 (arrayContainsKey!0 a!2831 lt!629917 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153803 (not res!965108)) b!1430957))

(assert (= (and b!1430957 res!965109) b!1430958))

(assert (=> d!153803 m!1320551))

(declare-fun m!1320847 () Bool)

(assert (=> b!1430958 m!1320847))

(assert (=> b!1430832 d!153803))

(assert (=> b!1430832 d!153719))

(declare-fun d!153805 () Bool)

(declare-fun lt!629972 () Bool)

(declare-fun content!773 (List!33554) (Set (_ BitVec 64)))

(assert (=> d!153805 (= lt!629972 (member (select (arr!47044 a!2831) #b00000000000000000000000000000000) (content!773 Nil!33551)))))

(declare-fun e!807892 () Bool)

(assert (=> d!153805 (= lt!629972 e!807892)))

(declare-fun res!965115 () Bool)

(assert (=> d!153805 (=> (not res!965115) (not e!807892))))

(assert (=> d!153805 (= res!965115 (is-Cons!33550 Nil!33551))))

(assert (=> d!153805 (= (contains!9862 Nil!33551 (select (arr!47044 a!2831) #b00000000000000000000000000000000)) lt!629972)))

(declare-fun b!1430963 () Bool)

(declare-fun e!807893 () Bool)

(assert (=> b!1430963 (= e!807892 e!807893)))

(declare-fun res!965114 () Bool)

(assert (=> b!1430963 (=> res!965114 e!807893)))

(assert (=> b!1430963 (= res!965114 (= (h!34867 Nil!33551) (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1430964 () Bool)

(assert (=> b!1430964 (= e!807893 (contains!9862 (t!48248 Nil!33551) (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!153805 res!965115) b!1430963))

(assert (= (and b!1430963 (not res!965114)) b!1430964))

(declare-fun m!1320849 () Bool)

(assert (=> d!153805 m!1320849))

(assert (=> d!153805 m!1320551))

(declare-fun m!1320851 () Bool)

(assert (=> d!153805 m!1320851))

(assert (=> b!1430964 m!1320551))

(declare-fun m!1320853 () Bool)

(assert (=> b!1430964 m!1320853))

(assert (=> b!1430695 d!153805))

(declare-fun b!1430965 () Bool)

(declare-fun e!807894 () Bool)

(declare-fun call!67453 () Bool)

(assert (=> b!1430965 (= e!807894 call!67453)))

(declare-fun d!153807 () Bool)

(declare-fun res!965117 () Bool)

(declare-fun e!807895 () Bool)

(assert (=> d!153807 (=> res!965117 e!807895)))

(assert (=> d!153807 (= res!965117 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47594 a!2831)))))

(assert (=> d!153807 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608) e!807895)))

(declare-fun bm!67450 () Bool)

(assert (=> bm!67450 (= call!67453 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1430966 () Bool)

(declare-fun e!807896 () Bool)

(assert (=> b!1430966 (= e!807896 call!67453)))

(declare-fun b!1430967 () Bool)

(assert (=> b!1430967 (= e!807896 e!807894)))

(declare-fun lt!629973 () (_ BitVec 64))

(assert (=> b!1430967 (= lt!629973 (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!629975 () Unit!48392)

(assert (=> b!1430967 (= lt!629975 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629973 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1430967 (arrayContainsKey!0 a!2831 lt!629973 #b00000000000000000000000000000000)))

(declare-fun lt!629974 () Unit!48392)

(assert (=> b!1430967 (= lt!629974 lt!629975)))

(declare-fun res!965116 () Bool)

(assert (=> b!1430967 (= res!965116 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2831 mask!2608) (Found!11323 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1430967 (=> (not res!965116) (not e!807894))))

(declare-fun b!1430968 () Bool)

(assert (=> b!1430968 (= e!807895 e!807896)))

(declare-fun c!132420 () Bool)

(assert (=> b!1430968 (= c!132420 (validKeyInArray!0 (select (arr!47044 a!2831) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!153807 (not res!965117)) b!1430968))

(assert (= (and b!1430968 c!132420) b!1430967))

(assert (= (and b!1430968 (not c!132420)) b!1430966))

(assert (= (and b!1430967 res!965116) b!1430965))

(assert (= (or b!1430965 b!1430966) bm!67450))

(declare-fun m!1320855 () Bool)

(assert (=> bm!67450 m!1320855))

(assert (=> b!1430967 m!1320829))

(declare-fun m!1320857 () Bool)

(assert (=> b!1430967 m!1320857))

(declare-fun m!1320859 () Bool)

(assert (=> b!1430967 m!1320859))

(assert (=> b!1430967 m!1320829))

(declare-fun m!1320861 () Bool)

(assert (=> b!1430967 m!1320861))

(assert (=> b!1430968 m!1320829))

(assert (=> b!1430968 m!1320829))

(assert (=> b!1430968 m!1320831))

(assert (=> bm!67429 d!153807))

(declare-fun d!153809 () Bool)

(assert (=> d!153809 (arrayContainsKey!0 a!2831 lt!629822 #b00000000000000000000000000000000)))

(declare-fun lt!629976 () Unit!48392)

(assert (=> d!153809 (= lt!629976 (choose!13 a!2831 lt!629822 #b00000000000000000000000000000000))))

(assert (=> d!153809 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!153809 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!629822 #b00000000000000000000000000000000) lt!629976)))

(declare-fun bs!41679 () Bool)

(assert (= bs!41679 d!153809))

(assert (=> bs!41679 m!1320555))

(declare-fun m!1320863 () Bool)

(assert (=> bs!41679 m!1320863))

(assert (=> b!1430578 d!153809))

(declare-fun d!153811 () Bool)

(declare-fun res!965118 () Bool)

(declare-fun e!807897 () Bool)

(assert (=> d!153811 (=> res!965118 e!807897)))

(assert (=> d!153811 (= res!965118 (= (select (arr!47044 a!2831) #b00000000000000000000000000000000) lt!629822))))

(assert (=> d!153811 (= (arrayContainsKey!0 a!2831 lt!629822 #b00000000000000000000000000000000) e!807897)))

(declare-fun b!1430969 () Bool)

(declare-fun e!807898 () Bool)

(assert (=> b!1430969 (= e!807897 e!807898)))

(declare-fun res!965119 () Bool)

(assert (=> b!1430969 (=> (not res!965119) (not e!807898))))

(assert (=> b!1430969 (= res!965119 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!47594 a!2831)))))

(declare-fun b!1430970 () Bool)

(assert (=> b!1430970 (= e!807898 (arrayContainsKey!0 a!2831 lt!629822 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!153811 (not res!965118)) b!1430969))

(assert (= (and b!1430969 res!965119) b!1430970))

(assert (=> d!153811 m!1320551))

(declare-fun m!1320865 () Bool)

(assert (=> b!1430970 m!1320865))

(assert (=> b!1430578 d!153811))

(declare-fun d!153815 () Bool)

(declare-fun lt!629979 () SeekEntryResult!11323)

(assert (=> d!153815 (and (or (is-Undefined!11323 lt!629979) (not (is-Found!11323 lt!629979)) (and (bvsge (index!47685 lt!629979) #b00000000000000000000000000000000) (bvslt (index!47685 lt!629979) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629979) (is-Found!11323 lt!629979) (not (is-MissingZero!11323 lt!629979)) (and (bvsge (index!47684 lt!629979) #b00000000000000000000000000000000) (bvslt (index!47684 lt!629979) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629979) (is-Found!11323 lt!629979) (is-MissingZero!11323 lt!629979) (not (is-MissingVacant!11323 lt!629979)) (and (bvsge (index!47687 lt!629979) #b00000000000000000000000000000000) (bvslt (index!47687 lt!629979) (size!47594 a!2831)))) (or (is-Undefined!11323 lt!629979) (ite (is-Found!11323 lt!629979) (= (select (arr!47044 a!2831) (index!47685 lt!629979)) (select (arr!47044 a!2831) #b00000000000000000000000000000000)) (ite (is-MissingZero!11323 lt!629979) (= (select (arr!47044 a!2831) (index!47684 lt!629979)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11323 lt!629979) (= (select (arr!47044 a!2831) (index!47687 lt!629979)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!807899 () SeekEntryResult!11323)

(assert (=> d!153815 (= lt!629979 e!807899)))

(declare-fun c!132421 () Bool)

(declare-fun lt!629977 () SeekEntryResult!11323)

(assert (=> d!153815 (= c!132421 (and (is-Intermediate!11323 lt!629977) (undefined!12135 lt!629977)))))

(assert (=> d!153815 (= lt!629977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000) mask!2608) (select (arr!47044 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(assert (=> d!153815 (validMask!0 mask!2608)))

(assert (=> d!153815 (= (seekEntryOrOpen!0 (select (arr!47044 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) lt!629979)))

(declare-fun b!1430971 () Bool)

(declare-fun e!807901 () SeekEntryResult!11323)

(assert (=> b!1430971 (= e!807899 e!807901)))

(declare-fun lt!629978 () (_ BitVec 64))

(assert (=> b!1430971 (= lt!629978 (select (arr!47044 a!2831) (index!47686 lt!629977)))))

(declare-fun c!132422 () Bool)

(assert (=> b!1430971 (= c!132422 (= lt!629978 (select (arr!47044 a!2831) #b00000000000000000000000000000000)))))

(declare-fun e!807900 () SeekEntryResult!11323)

(declare-fun b!1430972 () Bool)

(assert (=> b!1430972 (= e!807900 (seekKeyOrZeroReturnVacant!0 (x!129315 lt!629977) (index!47686 lt!629977) (index!47686 lt!629977) (select (arr!47044 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608))))

(declare-fun b!1430973 () Bool)

(assert (=> b!1430973 (= e!807901 (Found!11323 (index!47686 lt!629977)))))

(declare-fun b!1430974 () Bool)

(assert (=> b!1430974 (= e!807899 Undefined!11323)))

(declare-fun b!1430975 () Bool)

(assert (=> b!1430975 (= e!807900 (MissingZero!11323 (index!47686 lt!629977)))))

(declare-fun b!1430976 () Bool)

(declare-fun c!132423 () Bool)

(assert (=> b!1430976 (= c!132423 (= lt!629978 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430976 (= e!807901 e!807900)))

(assert (= (and d!153815 c!132421) b!1430974))

(assert (= (and d!153815 (not c!132421)) b!1430971))

(assert (= (and b!1430971 c!132422) b!1430973))

(assert (= (and b!1430971 (not c!132422)) b!1430976))

(assert (= (and b!1430976 c!132423) b!1430975))

(assert (= (and b!1430976 (not c!132423)) b!1430972))

(declare-fun m!1320867 () Bool)

(assert (=> d!153815 m!1320867))

(assert (=> d!153815 m!1320511))

(declare-fun m!1320869 () Bool)

(assert (=> d!153815 m!1320869))

(assert (=> d!153815 m!1320551))

(declare-fun m!1320871 () Bool)

(assert (=> d!153815 m!1320871))

(declare-fun m!1320873 () Bool)

(assert (=> d!153815 m!1320873))

(assert (=> d!153815 m!1320551))

(assert (=> d!153815 m!1320869))

(declare-fun m!1320875 () Bool)

(assert (=> d!153815 m!1320875))

(declare-fun m!1320877 () Bool)

(assert (=> b!1430971 m!1320877))

(assert (=> b!1430972 m!1320551))

(declare-fun m!1320879 () Bool)

(assert (=> b!1430972 m!1320879))

(assert (=> b!1430578 d!153815))

(declare-fun b!1430986 () Bool)

(declare-fun e!807909 () SeekEntryResult!11323)

(assert (=> b!1430986 (= e!807909 (Intermediate!11323 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430987 () Bool)

(declare-fun lt!629982 () SeekEntryResult!11323)

(assert (=> b!1430987 (and (bvsge (index!47686 lt!629982) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629982) (size!47594 lt!629787)))))

(declare-fun e!807911 () Bool)

(assert (=> b!1430987 (= e!807911 (= (select (arr!47044 lt!629787) (index!47686 lt!629982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1430988 () Bool)

(assert (=> b!1430988 (and (bvsge (index!47686 lt!629982) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629982) (size!47594 lt!629787)))))

(declare-fun res!965123 () Bool)

(assert (=> b!1430988 (= res!965123 (= (select (arr!47044 lt!629787) (index!47686 lt!629982)) lt!629789))))

(assert (=> b!1430988 (=> res!965123 e!807911)))

(declare-fun e!807908 () Bool)

(assert (=> b!1430988 (= e!807908 e!807911)))

(declare-fun e!807910 () SeekEntryResult!11323)

(declare-fun b!1430989 () Bool)

(assert (=> b!1430989 (= e!807910 (Intermediate!11323 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1430990 () Bool)

(assert (=> b!1430990 (and (bvsge (index!47686 lt!629982) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629982) (size!47594 lt!629787)))))

(declare-fun res!965124 () Bool)

(assert (=> b!1430990 (= res!965124 (= (select (arr!47044 lt!629787) (index!47686 lt!629982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1430990 (=> res!965124 e!807911)))

(declare-fun b!1430991 () Bool)

(assert (=> b!1430991 (= e!807909 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) lt!629789 lt!629787 mask!2608))))

(declare-fun b!1430992 () Bool)

(declare-fun e!807907 () Bool)

(assert (=> b!1430992 (= e!807907 e!807908)))

(declare-fun res!965125 () Bool)

(assert (=> b!1430992 (= res!965125 (and (is-Intermediate!11323 lt!629982) (not (undefined!12135 lt!629982)) (bvslt (x!129315 lt!629982) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629982) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629982) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1430992 (=> (not res!965125) (not e!807908))))

(declare-fun b!1430993 () Bool)

(assert (=> b!1430993 (= e!807910 e!807909)))

(declare-fun c!132428 () Bool)

(declare-fun lt!629983 () (_ BitVec 64))

(assert (=> b!1430993 (= c!132428 (or (= lt!629983 lt!629789) (= (bvadd lt!629983 lt!629983) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153819 () Bool)

(assert (=> d!153819 e!807907))

(declare-fun c!132427 () Bool)

(assert (=> d!153819 (= c!132427 (and (is-Intermediate!11323 lt!629982) (undefined!12135 lt!629982)))))

(assert (=> d!153819 (= lt!629982 e!807910)))

(declare-fun c!132429 () Bool)

(assert (=> d!153819 (= c!132429 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!153819 (= lt!629983 (select (arr!47044 lt!629787) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153819 (validMask!0 mask!2608)))

(assert (=> d!153819 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!629789 lt!629787 mask!2608) lt!629982)))

(declare-fun b!1430994 () Bool)

(assert (=> b!1430994 (= e!807907 (bvsge (x!129315 lt!629982) #b01111111111111111111111111111110))))

(assert (= (and d!153819 c!132429) b!1430989))

(assert (= (and d!153819 (not c!132429)) b!1430993))

(assert (= (and b!1430993 c!132428) b!1430986))

(assert (= (and b!1430993 (not c!132428)) b!1430991))

(assert (= (and d!153819 c!132427) b!1430994))

(assert (= (and d!153819 (not c!132427)) b!1430992))

(assert (= (and b!1430992 res!965125) b!1430988))

(assert (= (and b!1430988 (not res!965123)) b!1430990))

(assert (= (and b!1430990 (not res!965124)) b!1430987))

(declare-fun m!1320889 () Bool)

(assert (=> b!1430988 m!1320889))

(assert (=> d!153819 m!1320603))

(declare-fun m!1320891 () Bool)

(assert (=> d!153819 m!1320891))

(assert (=> d!153819 m!1320511))

(assert (=> b!1430991 m!1320603))

(declare-fun m!1320893 () Bool)

(assert (=> b!1430991 m!1320893))

(assert (=> b!1430991 m!1320893))

(declare-fun m!1320895 () Bool)

(assert (=> b!1430991 m!1320895))

(assert (=> b!1430990 m!1320889))

(assert (=> b!1430987 m!1320889))

(assert (=> b!1430672 d!153819))

(declare-fun d!153823 () Bool)

(declare-fun lt!629992 () (_ BitVec 32))

(assert (=> d!153823 (and (bvsge lt!629992 #b00000000000000000000000000000000) (bvslt lt!629992 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!153823 (= lt!629992 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!153823 (validMask!0 mask!2608)))

(assert (=> d!153823 (= (nextIndex!0 index!585 x!605 mask!2608) lt!629992)))

(declare-fun bs!41681 () Bool)

(assert (= bs!41681 d!153823))

(declare-fun m!1320907 () Bool)

(assert (=> bs!41681 m!1320907))

(assert (=> bs!41681 m!1320511))

(assert (=> b!1430672 d!153823))

(declare-fun b!1430999 () Bool)

(declare-fun e!807917 () SeekEntryResult!11323)

(assert (=> b!1430999 (= e!807917 (Intermediate!11323 false (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431000 () Bool)

(declare-fun lt!629993 () SeekEntryResult!11323)

(assert (=> b!1431000 (and (bvsge (index!47686 lt!629993) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629993) (size!47594 a!2831)))))

(declare-fun e!807919 () Bool)

(assert (=> b!1431000 (= e!807919 (= (select (arr!47044 a!2831) (index!47686 lt!629993)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431001 () Bool)

(assert (=> b!1431001 (and (bvsge (index!47686 lt!629993) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629993) (size!47594 a!2831)))))

(declare-fun res!965128 () Bool)

(assert (=> b!1431001 (= res!965128 (= (select (arr!47044 a!2831) (index!47686 lt!629993)) (select (arr!47044 a!2831) j!81)))))

(assert (=> b!1431001 (=> res!965128 e!807919)))

(declare-fun e!807916 () Bool)

(assert (=> b!1431001 (= e!807916 e!807919)))

(declare-fun e!807918 () SeekEntryResult!11323)

(declare-fun b!1431002 () Bool)

(assert (=> b!1431002 (= e!807918 (Intermediate!11323 true (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431003 () Bool)

(assert (=> b!1431003 (and (bvsge (index!47686 lt!629993) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629993) (size!47594 a!2831)))))

(declare-fun res!965129 () Bool)

(assert (=> b!1431003 (= res!965129 (= (select (arr!47044 a!2831) (index!47686 lt!629993)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431003 (=> res!965129 e!807919)))

(declare-fun b!1431004 () Bool)

(assert (=> b!1431004 (= e!807917 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431005 () Bool)

(declare-fun e!807915 () Bool)

(assert (=> b!1431005 (= e!807915 e!807916)))

(declare-fun res!965130 () Bool)

(assert (=> b!1431005 (= res!965130 (and (is-Intermediate!11323 lt!629993) (not (undefined!12135 lt!629993)) (bvslt (x!129315 lt!629993) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629993) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629993) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1431005 (=> (not res!965130) (not e!807916))))

(declare-fun b!1431006 () Bool)

(assert (=> b!1431006 (= e!807918 e!807917)))

(declare-fun lt!629994 () (_ BitVec 64))

(declare-fun c!132432 () Bool)

(assert (=> b!1431006 (= c!132432 (or (= lt!629994 (select (arr!47044 a!2831) j!81)) (= (bvadd lt!629994 lt!629994) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153827 () Bool)

(assert (=> d!153827 e!807915))

(declare-fun c!132431 () Bool)

(assert (=> d!153827 (= c!132431 (and (is-Intermediate!11323 lt!629993) (undefined!12135 lt!629993)))))

(assert (=> d!153827 (= lt!629993 e!807918)))

(declare-fun c!132433 () Bool)

(assert (=> d!153827 (= c!132433 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!153827 (= lt!629994 (select (arr!47044 a!2831) (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153827 (validMask!0 mask!2608)))

(assert (=> d!153827 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629993)))

(declare-fun b!1431007 () Bool)

(assert (=> b!1431007 (= e!807915 (bvsge (x!129315 lt!629993) #b01111111111111111111111111111110))))

(assert (= (and d!153827 c!132433) b!1431002))

(assert (= (and d!153827 (not c!132433)) b!1431006))

(assert (= (and b!1431006 c!132432) b!1430999))

(assert (= (and b!1431006 (not c!132432)) b!1431004))

(assert (= (and d!153827 c!132431) b!1431007))

(assert (= (and d!153827 (not c!132431)) b!1431005))

(assert (= (and b!1431005 res!965130) b!1431001))

(assert (= (and b!1431001 (not res!965128)) b!1431003))

(assert (= (and b!1431003 (not res!965129)) b!1431000))

(declare-fun m!1320913 () Bool)

(assert (=> b!1431001 m!1320913))

(assert (=> d!153827 m!1320701))

(declare-fun m!1320915 () Bool)

(assert (=> d!153827 m!1320915))

(assert (=> d!153827 m!1320511))

(assert (=> b!1431004 m!1320701))

(declare-fun m!1320919 () Bool)

(assert (=> b!1431004 m!1320919))

(assert (=> b!1431004 m!1320919))

(assert (=> b!1431004 m!1320493))

(declare-fun m!1320923 () Bool)

(assert (=> b!1431004 m!1320923))

(assert (=> b!1431003 m!1320913))

(assert (=> b!1431000 m!1320913))

(assert (=> b!1430826 d!153827))

(declare-fun d!153831 () Bool)

(declare-fun lt!629997 () (_ BitVec 32))

(assert (=> d!153831 (and (bvsge lt!629997 #b00000000000000000000000000000000) (bvslt lt!629997 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153831 (= lt!629997 (choose!52 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153831 (validMask!0 mask!2608)))

(assert (=> d!153831 (= (nextIndex!0 (toIndex!0 (select (arr!47044 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629997)))

(declare-fun bs!41682 () Bool)

(assert (= bs!41682 d!153831))

(assert (=> bs!41682 m!1320497))

(declare-fun m!1320929 () Bool)

(assert (=> bs!41682 m!1320929))

(assert (=> bs!41682 m!1320511))

(assert (=> b!1430826 d!153831))

(assert (=> b!1430833 d!153675))

(declare-fun e!807927 () SeekEntryResult!11323)

(declare-fun b!1431017 () Bool)

(assert (=> b!1431017 (= e!807927 (Intermediate!11323 false (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1431018 () Bool)

(declare-fun lt!629999 () SeekEntryResult!11323)

(assert (=> b!1431018 (and (bvsge (index!47686 lt!629999) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629999) (size!47594 a!2831)))))

(declare-fun e!807929 () Bool)

(assert (=> b!1431018 (= e!807929 (= (select (arr!47044 a!2831) (index!47686 lt!629999)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431019 () Bool)

(assert (=> b!1431019 (and (bvsge (index!47686 lt!629999) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629999) (size!47594 a!2831)))))

(declare-fun res!965134 () Bool)

(assert (=> b!1431019 (= res!965134 (= (select (arr!47044 a!2831) (index!47686 lt!629999)) (select (arr!47044 a!2831) j!81)))))

(assert (=> b!1431019 (=> res!965134 e!807929)))

(declare-fun e!807926 () Bool)

(assert (=> b!1431019 (= e!807926 e!807929)))

(declare-fun e!807928 () SeekEntryResult!11323)

(declare-fun b!1431020 () Bool)

(assert (=> b!1431020 (= e!807928 (Intermediate!11323 true (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001)))))

(declare-fun b!1431021 () Bool)

(assert (=> b!1431021 (and (bvsge (index!47686 lt!629999) #b00000000000000000000000000000000) (bvslt (index!47686 lt!629999) (size!47594 a!2831)))))

(declare-fun res!965135 () Bool)

(assert (=> b!1431021 (= res!965135 (= (select (arr!47044 a!2831) (index!47686 lt!629999)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431021 (=> res!965135 e!807929)))

(declare-fun b!1431022 () Bool)

(assert (=> b!1431022 (= e!807927 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!585 x!605 mask!2608) (bvadd x!605 #b00000000000000000000000000000001) mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1431023 () Bool)

(declare-fun e!807925 () Bool)

(assert (=> b!1431023 (= e!807925 e!807926)))

(declare-fun res!965136 () Bool)

(assert (=> b!1431023 (= res!965136 (and (is-Intermediate!11323 lt!629999) (not (undefined!12135 lt!629999)) (bvslt (x!129315 lt!629999) #b01111111111111111111111111111110) (bvsge (x!129315 lt!629999) #b00000000000000000000000000000000) (bvsge (x!129315 lt!629999) (bvadd x!605 #b00000000000000000000000000000001))))))

(assert (=> b!1431023 (=> (not res!965136) (not e!807926))))

(declare-fun b!1431024 () Bool)

(assert (=> b!1431024 (= e!807928 e!807927)))

(declare-fun lt!630000 () (_ BitVec 64))

(declare-fun c!132438 () Bool)

(assert (=> b!1431024 (= c!132438 (or (= lt!630000 (select (arr!47044 a!2831) j!81)) (= (bvadd lt!630000 lt!630000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153835 () Bool)

(assert (=> d!153835 e!807925))

(declare-fun c!132437 () Bool)

(assert (=> d!153835 (= c!132437 (and (is-Intermediate!11323 lt!629999) (undefined!12135 lt!629999)))))

(assert (=> d!153835 (= lt!629999 e!807928)))

(declare-fun c!132439 () Bool)

(assert (=> d!153835 (= c!132439 (bvsge (bvadd x!605 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!153835 (= lt!630000 (select (arr!47044 a!2831) (nextIndex!0 index!585 x!605 mask!2608)))))

(assert (=> d!153835 (validMask!0 mask!2608)))

(assert (=> d!153835 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47044 a!2831) j!81) a!2831 mask!2608) lt!629999)))

(declare-fun b!1431025 () Bool)

(assert (=> b!1431025 (= e!807925 (bvsge (x!129315 lt!629999) #b01111111111111111111111111111110))))

(assert (= (and d!153835 c!132439) b!1431020))

(assert (= (and d!153835 (not c!132439)) b!1431024))

(assert (= (and b!1431024 c!132438) b!1431017))

(assert (= (and b!1431024 (not c!132438)) b!1431022))

(assert (= (and d!153835 c!132437) b!1431025))

(assert (= (and d!153835 (not c!132437)) b!1431023))

(assert (= (and b!1431023 res!965136) b!1431019))

(assert (= (and b!1431019 (not res!965134)) b!1431021))

(assert (= (and b!1431021 (not res!965135)) b!1431018))

(declare-fun m!1320933 () Bool)

(assert (=> b!1431019 m!1320933))

(assert (=> d!153835 m!1320603))

(declare-fun m!1320935 () Bool)

(assert (=> d!153835 m!1320935))

(assert (=> d!153835 m!1320511))

(assert (=> b!1431022 m!1320603))

(assert (=> b!1431022 m!1320893))

(assert (=> b!1431022 m!1320893))

(assert (=> b!1431022 m!1320493))

(declare-fun m!1320937 () Bool)

(assert (=> b!1431022 m!1320937))

(assert (=> b!1431021 m!1320933))

(assert (=> b!1431018 m!1320933))

(assert (=> b!1430807 d!153835))

(assert (=> b!1430807 d!153823))

(assert (=> d!153751 d!153749))

(declare-fun d!153839 () Bool)

(assert (=> d!153839 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(assert (=> d!153839 true))

(declare-fun _$72!149 () Unit!48392)

(assert (=> d!153839 (= (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) _$72!149)))

(declare-fun bs!41684 () Bool)

(assert (= bs!41684 d!153839))

(assert (=> bs!41684 m!1320523))

(assert (=> d!153751 d!153839))

(assert (=> d!153751 d!153713))

(declare-fun b!1431026 () Bool)

(declare-fun e!807932 () SeekEntryResult!11323)

(assert (=> b!1431026 (= e!807932 (Intermediate!11323 false (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431027 () Bool)

(declare-fun lt!630001 () SeekEntryResult!11323)

(assert (=> b!1431027 (and (bvsge (index!47686 lt!630001) #b00000000000000000000000000000000) (bvslt (index!47686 lt!630001) (size!47594 lt!629787)))))

(declare-fun e!807934 () Bool)

(assert (=> b!1431027 (= e!807934 (= (select (arr!47044 lt!629787) (index!47686 lt!630001)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1431028 () Bool)

(assert (=> b!1431028 (and (bvsge (index!47686 lt!630001) #b00000000000000000000000000000000) (bvslt (index!47686 lt!630001) (size!47594 lt!629787)))))

(declare-fun res!965137 () Bool)

(assert (=> b!1431028 (= res!965137 (= (select (arr!47044 lt!629787) (index!47686 lt!630001)) lt!629789))))

(assert (=> b!1431028 (=> res!965137 e!807934)))

(declare-fun e!807931 () Bool)

(assert (=> b!1431028 (= e!807931 e!807934)))

(declare-fun b!1431029 () Bool)

(declare-fun e!807933 () SeekEntryResult!11323)

(assert (=> b!1431029 (= e!807933 (Intermediate!11323 true (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1431030 () Bool)

(assert (=> b!1431030 (and (bvsge (index!47686 lt!630001) #b00000000000000000000000000000000) (bvslt (index!47686 lt!630001) (size!47594 lt!629787)))))

(declare-fun res!965138 () Bool)

(assert (=> b!1431030 (= res!965138 (= (select (arr!47044 lt!629787) (index!47686 lt!630001)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1431030 (=> res!965138 e!807934)))

(declare-fun b!1431031 () Bool)

(assert (=> b!1431031 (= e!807932 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2608) lt!629789 lt!629787 mask!2608))))

(declare-fun b!1431032 () Bool)

(declare-fun e!807930 () Bool)

(assert (=> b!1431032 (= e!807930 e!807931)))

(declare-fun res!965139 () Bool)

(assert (=> b!1431032 (= res!965139 (and (is-Intermediate!11323 lt!630001) (not (undefined!12135 lt!630001)) (bvslt (x!129315 lt!630001) #b01111111111111111111111111111110) (bvsge (x!129315 lt!630001) #b00000000000000000000000000000000) (bvsge (x!129315 lt!630001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1431032 (=> (not res!965139) (not e!807931))))

(declare-fun b!1431033 () Bool)

(assert (=> b!1431033 (= e!807933 e!807932)))

(declare-fun c!132441 () Bool)

(declare-fun lt!630002 () (_ BitVec 64))

(assert (=> b!1431033 (= c!132441 (or (= lt!630002 lt!629789) (= (bvadd lt!630002 lt!630002) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!153841 () Bool)

(assert (=> d!153841 e!807930))

(declare-fun c!132440 () Bool)

(assert (=> d!153841 (= c!132440 (and (is-Intermediate!11323 lt!630001) (undefined!12135 lt!630001)))))

(assert (=> d!153841 (= lt!630001 e!807933)))

(declare-fun c!132442 () Bool)

(assert (=> d!153841 (= c!132442 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!153841 (= lt!630002 (select (arr!47044 lt!629787) (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608)))))

(assert (=> d!153841 (validMask!0 mask!2608)))

(assert (=> d!153841 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!629789 lt!629787 mask!2608) lt!630001)))

(declare-fun b!1431034 () Bool)

(assert (=> b!1431034 (= e!807930 (bvsge (x!129315 lt!630001) #b01111111111111111111111111111110))))

(assert (= (and d!153841 c!132442) b!1431029))

(assert (= (and d!153841 (not c!132442)) b!1431033))

(assert (= (and b!1431033 c!132441) b!1431026))

(assert (= (and b!1431033 (not c!132441)) b!1431031))

(assert (= (and d!153841 c!132440) b!1431034))

(assert (= (and d!153841 (not c!132440)) b!1431032))

(assert (= (and b!1431032 res!965139) b!1431028))

(assert (= (and b!1431028 (not res!965137)) b!1431030))

(assert (= (and b!1431030 (not res!965138)) b!1431027))

(declare-fun m!1320939 () Bool)

(assert (=> b!1431028 m!1320939))

(assert (=> d!153841 m!1320617))

(declare-fun m!1320941 () Bool)

(assert (=> d!153841 m!1320941))

(assert (=> d!153841 m!1320511))

(assert (=> b!1431031 m!1320617))

(declare-fun m!1320943 () Bool)

(assert (=> b!1431031 m!1320943))

(assert (=> b!1431031 m!1320943))

(declare-fun m!1320945 () Bool)

(assert (=> b!1431031 m!1320945))

(assert (=> b!1431030 m!1320939))

(assert (=> b!1431027 m!1320939))

(assert (=> b!1430701 d!153841))

(declare-fun d!153843 () Bool)

(declare-fun lt!630003 () (_ BitVec 32))

(assert (=> d!153843 (and (bvsge lt!630003 #b00000000000000000000000000000000) (bvslt lt!630003 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(assert (=> d!153843 (= lt!630003 (choose!52 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608))))

(assert (=> d!153843 (validMask!0 mask!2608)))

(assert (=> d!153843 (= (nextIndex!0 (toIndex!0 lt!629789 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!630003)))

(declare-fun bs!41685 () Bool)

(assert (= bs!41685 d!153843))

(assert (=> bs!41685 m!1320503))

(declare-fun m!1320947 () Bool)

(assert (=> bs!41685 m!1320947))

(assert (=> bs!41685 m!1320511))

(assert (=> b!1430701 d!153843))

(assert (=> b!1430579 d!153793))

(assert (=> d!153743 d!153713))

(push 1)

(assert (not d!153823))

(assert (not b!1430967))

(assert (not d!153841))

(assert (not bm!67449))

(assert (not d!153805))

(assert (not b!1430964))

(assert (not b!1430968))

(assert (not b!1430970))

(assert (not b!1431004))

(assert (not b!1431031))

(assert (not b!1430929))

(assert (not d!153815))

(assert (not d!153799))

(assert (not bm!67450))

(assert (not b!1431022))

(assert (not d!153831))

(assert (not b!1430930))

(assert (not b!1430949))

(assert (not d!153819))

(assert (not b!1430958))

(assert (not bm!67448))

(assert (not b!1430934))

(assert (not d!153801))

(assert (not b!1430928))

(assert (not b!1430933))

(assert (not d!153843))

(assert (not d!153809))

(assert (not d!153827))

(assert (not b!1430972))

(assert (not d!153839))

(assert (not d!153835))

(assert (not b!1430991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

