; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123736 () Bool)

(assert start!123736)

(declare-fun b!1434415 () Bool)

(declare-fun res!967887 () Bool)

(declare-fun e!809566 () Bool)

(assert (=> b!1434415 (=> (not res!967887) (not e!809566))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1434415 (= res!967887 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434416 () Bool)

(declare-fun e!809567 () Bool)

(declare-fun e!809569 () Bool)

(assert (=> b!1434416 (= e!809567 e!809569)))

(declare-fun res!967878 () Bool)

(assert (=> b!1434416 (=> (not res!967878) (not e!809569))))

(declare-datatypes ((SeekEntryResult!11380 0))(
  ( (MissingZero!11380 (index!47912 (_ BitVec 32))) (Found!11380 (index!47913 (_ BitVec 32))) (Intermediate!11380 (undefined!12192 Bool) (index!47914 (_ BitVec 32)) (x!129560 (_ BitVec 32))) (Undefined!11380) (MissingVacant!11380 (index!47915 (_ BitVec 32))) )
))
(declare-fun lt!631458 () SeekEntryResult!11380)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97594 0))(
  ( (array!97595 (arr!47101 (Array (_ BitVec 32) (_ BitVec 64))) (size!47651 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97594)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97594 (_ BitVec 32)) SeekEntryResult!11380)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434416 (= res!967878 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631458))))

(assert (=> b!1434416 (= lt!631458 (Intermediate!11380 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434417 () Bool)

(declare-fun e!809565 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97594 (_ BitVec 32)) SeekEntryResult!11380)

(assert (=> b!1434417 (= e!809565 (= (seekEntryOrOpen!0 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) (Found!11380 j!81)))))

(declare-fun b!1434418 () Bool)

(declare-fun e!809568 () Bool)

(declare-fun e!809570 () Bool)

(assert (=> b!1434418 (= e!809568 e!809570)))

(declare-fun res!967889 () Bool)

(assert (=> b!1434418 (=> res!967889 e!809570)))

(declare-fun lt!631453 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1434418 (= res!967889 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631453 #b00000000000000000000000000000000) (bvsge lt!631453 (size!47651 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434418 (= lt!631453 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434419 () Bool)

(assert (=> b!1434419 (= e!809566 (not e!809568))))

(declare-fun res!967884 () Bool)

(assert (=> b!1434419 (=> res!967884 e!809568)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434419 (= res!967884 (or (= (select (arr!47101 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47101 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47101 a!2831) index!585) (select (arr!47101 a!2831) j!81)) (= (select (store (arr!47101 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434419 e!809565))

(declare-fun res!967882 () Bool)

(assert (=> b!1434419 (=> (not res!967882) (not e!809565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97594 (_ BitVec 32)) Bool)

(assert (=> b!1434419 (= res!967882 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48506 0))(
  ( (Unit!48507) )
))
(declare-fun lt!631455 () Unit!48506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48506)

(assert (=> b!1434419 (= lt!631455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434420 () Bool)

(declare-fun res!967881 () Bool)

(assert (=> b!1434420 (=> (not res!967881) (not e!809567))))

(assert (=> b!1434420 (= res!967881 (and (= (size!47651 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47651 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47651 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434421 () Bool)

(declare-fun res!967885 () Bool)

(assert (=> b!1434421 (=> (not res!967885) (not e!809567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434421 (= res!967885 (validKeyInArray!0 (select (arr!47101 a!2831) i!982)))))

(declare-fun b!1434422 () Bool)

(declare-fun res!967890 () Bool)

(assert (=> b!1434422 (=> (not res!967890) (not e!809567))))

(assert (=> b!1434422 (= res!967890 (validKeyInArray!0 (select (arr!47101 a!2831) j!81)))))

(declare-fun b!1434423 () Bool)

(declare-fun res!967883 () Bool)

(assert (=> b!1434423 (=> (not res!967883) (not e!809567))))

(assert (=> b!1434423 (= res!967883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!967877 () Bool)

(assert (=> start!123736 (=> (not res!967877) (not e!809567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123736 (= res!967877 (validMask!0 mask!2608))))

(assert (=> start!123736 e!809567))

(assert (=> start!123736 true))

(declare-fun array_inv!36129 (array!97594) Bool)

(assert (=> start!123736 (array_inv!36129 a!2831)))

(declare-fun b!1434424 () Bool)

(declare-fun res!967880 () Bool)

(assert (=> b!1434424 (=> (not res!967880) (not e!809566))))

(declare-fun lt!631457 () SeekEntryResult!11380)

(declare-fun lt!631456 () (_ BitVec 64))

(declare-fun lt!631454 () array!97594)

(assert (=> b!1434424 (= res!967880 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631456 lt!631454 mask!2608) lt!631457))))

(declare-fun b!1434425 () Bool)

(declare-fun res!967888 () Bool)

(assert (=> b!1434425 (=> (not res!967888) (not e!809567))))

(declare-datatypes ((List!33611 0))(
  ( (Nil!33608) (Cons!33607 (h!34936 (_ BitVec 64)) (t!48305 List!33611)) )
))
(declare-fun arrayNoDuplicates!0 (array!97594 (_ BitVec 32) List!33611) Bool)

(assert (=> b!1434425 (= res!967888 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33608))))

(declare-fun b!1434426 () Bool)

(assert (=> b!1434426 (= e!809570 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631453 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631458))))

(declare-fun b!1434427 () Bool)

(declare-fun res!967879 () Bool)

(assert (=> b!1434427 (=> (not res!967879) (not e!809566))))

(assert (=> b!1434427 (= res!967879 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631458))))

(declare-fun b!1434428 () Bool)

(declare-fun res!967891 () Bool)

(assert (=> b!1434428 (=> (not res!967891) (not e!809567))))

(assert (=> b!1434428 (= res!967891 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47651 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47651 a!2831))))))

(declare-fun b!1434429 () Bool)

(assert (=> b!1434429 (= e!809569 e!809566)))

(declare-fun res!967886 () Bool)

(assert (=> b!1434429 (=> (not res!967886) (not e!809566))))

(assert (=> b!1434429 (= res!967886 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631456 mask!2608) lt!631456 lt!631454 mask!2608) lt!631457))))

(assert (=> b!1434429 (= lt!631457 (Intermediate!11380 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434429 (= lt!631456 (select (store (arr!47101 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434429 (= lt!631454 (array!97595 (store (arr!47101 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47651 a!2831)))))

(assert (= (and start!123736 res!967877) b!1434420))

(assert (= (and b!1434420 res!967881) b!1434421))

(assert (= (and b!1434421 res!967885) b!1434422))

(assert (= (and b!1434422 res!967890) b!1434423))

(assert (= (and b!1434423 res!967883) b!1434425))

(assert (= (and b!1434425 res!967888) b!1434428))

(assert (= (and b!1434428 res!967891) b!1434416))

(assert (= (and b!1434416 res!967878) b!1434429))

(assert (= (and b!1434429 res!967886) b!1434427))

(assert (= (and b!1434427 res!967879) b!1434424))

(assert (= (and b!1434424 res!967880) b!1434415))

(assert (= (and b!1434415 res!967887) b!1434419))

(assert (= (and b!1434419 res!967882) b!1434417))

(assert (= (and b!1434419 (not res!967884)) b!1434418))

(assert (= (and b!1434418 (not res!967889)) b!1434426))

(declare-fun m!1324037 () Bool)

(assert (=> b!1434423 m!1324037))

(declare-fun m!1324039 () Bool)

(assert (=> b!1434425 m!1324039))

(declare-fun m!1324041 () Bool)

(assert (=> b!1434416 m!1324041))

(assert (=> b!1434416 m!1324041))

(declare-fun m!1324043 () Bool)

(assert (=> b!1434416 m!1324043))

(assert (=> b!1434416 m!1324043))

(assert (=> b!1434416 m!1324041))

(declare-fun m!1324045 () Bool)

(assert (=> b!1434416 m!1324045))

(assert (=> b!1434427 m!1324041))

(assert (=> b!1434427 m!1324041))

(declare-fun m!1324047 () Bool)

(assert (=> b!1434427 m!1324047))

(declare-fun m!1324049 () Bool)

(assert (=> b!1434429 m!1324049))

(assert (=> b!1434429 m!1324049))

(declare-fun m!1324051 () Bool)

(assert (=> b!1434429 m!1324051))

(declare-fun m!1324053 () Bool)

(assert (=> b!1434429 m!1324053))

(declare-fun m!1324055 () Bool)

(assert (=> b!1434429 m!1324055))

(declare-fun m!1324057 () Bool)

(assert (=> b!1434421 m!1324057))

(assert (=> b!1434421 m!1324057))

(declare-fun m!1324059 () Bool)

(assert (=> b!1434421 m!1324059))

(assert (=> b!1434417 m!1324041))

(assert (=> b!1434417 m!1324041))

(declare-fun m!1324061 () Bool)

(assert (=> b!1434417 m!1324061))

(declare-fun m!1324063 () Bool)

(assert (=> b!1434424 m!1324063))

(assert (=> b!1434426 m!1324041))

(assert (=> b!1434426 m!1324041))

(declare-fun m!1324065 () Bool)

(assert (=> b!1434426 m!1324065))

(assert (=> b!1434419 m!1324053))

(declare-fun m!1324067 () Bool)

(assert (=> b!1434419 m!1324067))

(declare-fun m!1324069 () Bool)

(assert (=> b!1434419 m!1324069))

(declare-fun m!1324071 () Bool)

(assert (=> b!1434419 m!1324071))

(assert (=> b!1434419 m!1324041))

(declare-fun m!1324073 () Bool)

(assert (=> b!1434419 m!1324073))

(declare-fun m!1324075 () Bool)

(assert (=> start!123736 m!1324075))

(declare-fun m!1324077 () Bool)

(assert (=> start!123736 m!1324077))

(assert (=> b!1434422 m!1324041))

(assert (=> b!1434422 m!1324041))

(declare-fun m!1324079 () Bool)

(assert (=> b!1434422 m!1324079))

(declare-fun m!1324081 () Bool)

(assert (=> b!1434418 m!1324081))

(push 1)

(assert (not b!1434416))

(assert (not b!1434429))

(assert (not b!1434418))

(assert (not b!1434426))

(assert (not start!123736))

(assert (not b!1434419))

(assert (not b!1434417))

(assert (not b!1434427))

(assert (not b!1434423))

(assert (not b!1434422))

(assert (not b!1434424))

(assert (not b!1434421))

(assert (not b!1434425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154205 () Bool)

(assert (=> d!154205 (= (validKeyInArray!0 (select (arr!47101 a!2831) j!81)) (and (not (= (select (arr!47101 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47101 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434422 d!154205))

(declare-fun d!154209 () Bool)

(assert (=> d!154209 (= (validKeyInArray!0 (select (arr!47101 a!2831) i!982)) (and (not (= (select (arr!47101 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47101 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434421 d!154209))

(declare-fun b!1434501 () Bool)

(declare-fun e!809618 () Bool)

(declare-fun e!809620 () Bool)

(assert (=> b!1434501 (= e!809618 e!809620)))

(declare-fun lt!631494 () (_ BitVec 64))

(assert (=> b!1434501 (= lt!631494 (select (arr!47101 a!2831) j!81))))

(declare-fun lt!631495 () Unit!48506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97594 (_ BitVec 64) (_ BitVec 32)) Unit!48506)

(assert (=> b!1434501 (= lt!631495 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631494 j!81))))

(declare-fun arrayContainsKey!0 (array!97594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1434501 (arrayContainsKey!0 a!2831 lt!631494 #b00000000000000000000000000000000)))

(declare-fun lt!631496 () Unit!48506)

(assert (=> b!1434501 (= lt!631496 lt!631495)))

(declare-fun res!967924 () Bool)

(assert (=> b!1434501 (= res!967924 (= (seekEntryOrOpen!0 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) (Found!11380 j!81)))))

(assert (=> b!1434501 (=> (not res!967924) (not e!809620))))

(declare-fun b!1434502 () Bool)

(declare-fun call!67528 () Bool)

(assert (=> b!1434502 (= e!809618 call!67528)))

(declare-fun b!1434503 () Bool)

(assert (=> b!1434503 (= e!809620 call!67528)))

(declare-fun bm!67525 () Bool)

(assert (=> bm!67525 (= call!67528 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1434504 () Bool)

(declare-fun e!809619 () Bool)

(assert (=> b!1434504 (= e!809619 e!809618)))

(declare-fun c!132789 () Bool)

(assert (=> b!1434504 (= c!132789 (validKeyInArray!0 (select (arr!47101 a!2831) j!81)))))

(declare-fun d!154211 () Bool)

(declare-fun res!967925 () Bool)

(assert (=> d!154211 (=> res!967925 e!809619)))

(assert (=> d!154211 (= res!967925 (bvsge j!81 (size!47651 a!2831)))))

(assert (=> d!154211 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809619)))

(assert (= (and d!154211 (not res!967925)) b!1434504))

(assert (= (and b!1434504 c!132789) b!1434501))

(assert (= (and b!1434504 (not c!132789)) b!1434502))

(assert (= (and b!1434501 res!967924) b!1434503))

(assert (= (or b!1434503 b!1434502) bm!67525))

(assert (=> b!1434501 m!1324041))

(declare-fun m!1324113 () Bool)

(assert (=> b!1434501 m!1324113))

(declare-fun m!1324117 () Bool)

(assert (=> b!1434501 m!1324117))

(assert (=> b!1434501 m!1324041))

(assert (=> b!1434501 m!1324061))

(declare-fun m!1324121 () Bool)

(assert (=> bm!67525 m!1324121))

(assert (=> b!1434504 m!1324041))

(assert (=> b!1434504 m!1324041))

(assert (=> b!1434504 m!1324079))

(assert (=> b!1434419 d!154211))

(declare-fun d!154217 () Bool)

(assert (=> d!154217 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631504 () Unit!48506)

(declare-fun choose!38 (array!97594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48506)

(assert (=> d!154217 (= lt!631504 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154217 (validMask!0 mask!2608)))

(assert (=> d!154217 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631504)))

(declare-fun bs!41764 () Bool)

(assert (= bs!41764 d!154217))

(assert (=> bs!41764 m!1324071))

(declare-fun m!1324137 () Bool)

(assert (=> bs!41764 m!1324137))

(assert (=> bs!41764 m!1324075))

(assert (=> b!1434419 d!154217))

(declare-fun d!154227 () Bool)

(declare-fun e!809679 () Bool)

(assert (=> d!154227 e!809679))

(declare-fun c!132826 () Bool)

(declare-fun lt!631536 () SeekEntryResult!11380)

(assert (=> d!154227 (= c!132826 (and (is-Intermediate!11380 lt!631536) (undefined!12192 lt!631536)))))

(declare-fun e!809677 () SeekEntryResult!11380)

(assert (=> d!154227 (= lt!631536 e!809677)))

(declare-fun c!132825 () Bool)

(assert (=> d!154227 (= c!132825 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631537 () (_ BitVec 64))

(assert (=> d!154227 (= lt!631537 (select (arr!47101 lt!631454) (toIndex!0 lt!631456 mask!2608)))))

(assert (=> d!154227 (validMask!0 mask!2608)))

(assert (=> d!154227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631456 mask!2608) lt!631456 lt!631454 mask!2608) lt!631536)))

(declare-fun b!1434602 () Bool)

(assert (=> b!1434602 (and (bvsge (index!47914 lt!631536) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631536) (size!47651 lt!631454)))))

(declare-fun res!967958 () Bool)

(assert (=> b!1434602 (= res!967958 (= (select (arr!47101 lt!631454) (index!47914 lt!631536)) lt!631456))))

(declare-fun e!809675 () Bool)

(assert (=> b!1434602 (=> res!967958 e!809675)))

(declare-fun e!809678 () Bool)

(assert (=> b!1434602 (= e!809678 e!809675)))

(declare-fun b!1434603 () Bool)

(assert (=> b!1434603 (= e!809679 (bvsge (x!129560 lt!631536) #b01111111111111111111111111111110))))

(declare-fun b!1434604 () Bool)

(declare-fun e!809676 () SeekEntryResult!11380)

(assert (=> b!1434604 (= e!809676 (Intermediate!11380 false (toIndex!0 lt!631456 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434605 () Bool)

(assert (=> b!1434605 (= e!809677 (Intermediate!11380 true (toIndex!0 lt!631456 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434606 () Bool)

(assert (=> b!1434606 (= e!809676 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631456 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631456 lt!631454 mask!2608))))

(declare-fun b!1434607 () Bool)

(assert (=> b!1434607 (and (bvsge (index!47914 lt!631536) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631536) (size!47651 lt!631454)))))

(declare-fun res!967957 () Bool)

(assert (=> b!1434607 (= res!967957 (= (select (arr!47101 lt!631454) (index!47914 lt!631536)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434607 (=> res!967957 e!809675)))

(declare-fun b!1434608 () Bool)

(assert (=> b!1434608 (= e!809679 e!809678)))

(declare-fun res!967956 () Bool)

(assert (=> b!1434608 (= res!967956 (and (is-Intermediate!11380 lt!631536) (not (undefined!12192 lt!631536)) (bvslt (x!129560 lt!631536) #b01111111111111111111111111111110) (bvsge (x!129560 lt!631536) #b00000000000000000000000000000000) (bvsge (x!129560 lt!631536) #b00000000000000000000000000000000)))))

(assert (=> b!1434608 (=> (not res!967956) (not e!809678))))

(declare-fun b!1434609 () Bool)

(assert (=> b!1434609 (= e!809677 e!809676)))

(declare-fun c!132824 () Bool)

(assert (=> b!1434609 (= c!132824 (or (= lt!631537 lt!631456) (= (bvadd lt!631537 lt!631537) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434610 () Bool)

(assert (=> b!1434610 (and (bvsge (index!47914 lt!631536) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631536) (size!47651 lt!631454)))))

(assert (=> b!1434610 (= e!809675 (= (select (arr!47101 lt!631454) (index!47914 lt!631536)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154227 c!132825) b!1434605))

(assert (= (and d!154227 (not c!132825)) b!1434609))

(assert (= (and b!1434609 c!132824) b!1434604))

(assert (= (and b!1434609 (not c!132824)) b!1434606))

(assert (= (and d!154227 c!132826) b!1434603))

(assert (= (and d!154227 (not c!132826)) b!1434608))

(assert (= (and b!1434608 res!967956) b!1434602))

(assert (= (and b!1434602 (not res!967958)) b!1434607))

(assert (= (and b!1434607 (not res!967957)) b!1434610))

(assert (=> b!1434606 m!1324049))

(declare-fun m!1324167 () Bool)

(assert (=> b!1434606 m!1324167))

(assert (=> b!1434606 m!1324167))

(declare-fun m!1324169 () Bool)

(assert (=> b!1434606 m!1324169))

(declare-fun m!1324171 () Bool)

(assert (=> b!1434602 m!1324171))

(assert (=> d!154227 m!1324049))

(declare-fun m!1324173 () Bool)

(assert (=> d!154227 m!1324173))

(assert (=> d!154227 m!1324075))

(assert (=> b!1434607 m!1324171))

(assert (=> b!1434610 m!1324171))

(assert (=> b!1434429 d!154227))

(declare-fun d!154243 () Bool)

(declare-fun lt!631552 () (_ BitVec 32))

(declare-fun lt!631551 () (_ BitVec 32))

(assert (=> d!154243 (= lt!631552 (bvmul (bvxor lt!631551 (bvlshr lt!631551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154243 (= lt!631551 ((_ extract 31 0) (bvand (bvxor lt!631456 (bvlshr lt!631456 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154243 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967959 (let ((h!34939 ((_ extract 31 0) (bvand (bvxor lt!631456 (bvlshr lt!631456 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129568 (bvmul (bvxor h!34939 (bvlshr h!34939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129568 (bvlshr x!129568 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967959 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967959 #b00000000000000000000000000000000))))))

(assert (=> d!154243 (= (toIndex!0 lt!631456 mask!2608) (bvand (bvxor lt!631552 (bvlshr lt!631552 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434429 d!154243))

(declare-fun d!154251 () Bool)

(declare-fun lt!631555 () (_ BitVec 32))

(assert (=> d!154251 (and (bvsge lt!631555 #b00000000000000000000000000000000) (bvslt lt!631555 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154251 (= lt!631555 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154251 (validMask!0 mask!2608)))

(assert (=> d!154251 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631555)))

(declare-fun bs!41766 () Bool)

(assert (= bs!41766 d!154251))

(declare-fun m!1324205 () Bool)

(assert (=> bs!41766 m!1324205))

(assert (=> bs!41766 m!1324075))

(assert (=> b!1434418 d!154251))

(declare-fun d!154255 () Bool)

(assert (=> d!154255 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123736 d!154255))

(declare-fun d!154261 () Bool)

(assert (=> d!154261 (= (array_inv!36129 a!2831) (bvsge (size!47651 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123736 d!154261))

(declare-fun d!154263 () Bool)

(declare-fun lt!631583 () SeekEntryResult!11380)

(assert (=> d!154263 (and (or (is-Undefined!11380 lt!631583) (not (is-Found!11380 lt!631583)) (and (bvsge (index!47913 lt!631583) #b00000000000000000000000000000000) (bvslt (index!47913 lt!631583) (size!47651 a!2831)))) (or (is-Undefined!11380 lt!631583) (is-Found!11380 lt!631583) (not (is-MissingZero!11380 lt!631583)) (and (bvsge (index!47912 lt!631583) #b00000000000000000000000000000000) (bvslt (index!47912 lt!631583) (size!47651 a!2831)))) (or (is-Undefined!11380 lt!631583) (is-Found!11380 lt!631583) (is-MissingZero!11380 lt!631583) (not (is-MissingVacant!11380 lt!631583)) (and (bvsge (index!47915 lt!631583) #b00000000000000000000000000000000) (bvslt (index!47915 lt!631583) (size!47651 a!2831)))) (or (is-Undefined!11380 lt!631583) (ite (is-Found!11380 lt!631583) (= (select (arr!47101 a!2831) (index!47913 lt!631583)) (select (arr!47101 a!2831) j!81)) (ite (is-MissingZero!11380 lt!631583) (= (select (arr!47101 a!2831) (index!47912 lt!631583)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11380 lt!631583) (= (select (arr!47101 a!2831) (index!47915 lt!631583)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!809728 () SeekEntryResult!11380)

(assert (=> d!154263 (= lt!631583 e!809728)))

(declare-fun c!132853 () Bool)

(declare-fun lt!631582 () SeekEntryResult!11380)

(assert (=> d!154263 (= c!132853 (and (is-Intermediate!11380 lt!631582) (undefined!12192 lt!631582)))))

(assert (=> d!154263 (= lt!631582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) (select (arr!47101 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154263 (validMask!0 mask!2608)))

(assert (=> d!154263 (= (seekEntryOrOpen!0 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631583)))

(declare-fun b!1434687 () Bool)

(declare-fun e!809730 () SeekEntryResult!11380)

(assert (=> b!1434687 (= e!809730 (Found!11380 (index!47914 lt!631582)))))

(declare-fun b!1434688 () Bool)

(assert (=> b!1434688 (= e!809728 Undefined!11380)))

(declare-fun b!1434689 () Bool)

(declare-fun c!132852 () Bool)

(declare-fun lt!631581 () (_ BitVec 64))

(assert (=> b!1434689 (= c!132852 (= lt!631581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809729 () SeekEntryResult!11380)

(assert (=> b!1434689 (= e!809730 e!809729)))

(declare-fun b!1434690 () Bool)

(assert (=> b!1434690 (= e!809728 e!809730)))

(assert (=> b!1434690 (= lt!631581 (select (arr!47101 a!2831) (index!47914 lt!631582)))))

(declare-fun c!132854 () Bool)

(assert (=> b!1434690 (= c!132854 (= lt!631581 (select (arr!47101 a!2831) j!81)))))

(declare-fun b!1434691 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97594 (_ BitVec 32)) SeekEntryResult!11380)

(assert (=> b!1434691 (= e!809729 (seekKeyOrZeroReturnVacant!0 (x!129560 lt!631582) (index!47914 lt!631582) (index!47914 lt!631582) (select (arr!47101 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434692 () Bool)

(assert (=> b!1434692 (= e!809729 (MissingZero!11380 (index!47914 lt!631582)))))

(assert (= (and d!154263 c!132853) b!1434688))

(assert (= (and d!154263 (not c!132853)) b!1434690))

(assert (= (and b!1434690 c!132854) b!1434687))

(assert (= (and b!1434690 (not c!132854)) b!1434689))

(assert (= (and b!1434689 c!132852) b!1434692))

(assert (= (and b!1434689 (not c!132852)) b!1434691))

(declare-fun m!1324231 () Bool)

(assert (=> d!154263 m!1324231))

(declare-fun m!1324233 () Bool)

(assert (=> d!154263 m!1324233))

(declare-fun m!1324235 () Bool)

(assert (=> d!154263 m!1324235))

(assert (=> d!154263 m!1324075))

(assert (=> d!154263 m!1324041))

(assert (=> d!154263 m!1324043))

(assert (=> d!154263 m!1324043))

(assert (=> d!154263 m!1324041))

(assert (=> d!154263 m!1324045))

(declare-fun m!1324237 () Bool)

(assert (=> b!1434690 m!1324237))

(assert (=> b!1434691 m!1324041))

(declare-fun m!1324239 () Bool)

(assert (=> b!1434691 m!1324239))

(assert (=> b!1434417 d!154263))

(declare-fun d!154277 () Bool)

(declare-fun e!809735 () Bool)

(assert (=> d!154277 e!809735))

(declare-fun c!132857 () Bool)

(declare-fun lt!631584 () SeekEntryResult!11380)

(assert (=> d!154277 (= c!132857 (and (is-Intermediate!11380 lt!631584) (undefined!12192 lt!631584)))))

(declare-fun e!809733 () SeekEntryResult!11380)

(assert (=> d!154277 (= lt!631584 e!809733)))

(declare-fun c!132856 () Bool)

(assert (=> d!154277 (= c!132856 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631585 () (_ BitVec 64))

(assert (=> d!154277 (= lt!631585 (select (arr!47101 a!2831) index!585))))

(assert (=> d!154277 (validMask!0 mask!2608)))

(assert (=> d!154277 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631584)))

(declare-fun b!1434693 () Bool)

(assert (=> b!1434693 (and (bvsge (index!47914 lt!631584) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631584) (size!47651 a!2831)))))

(declare-fun res!967988 () Bool)

(assert (=> b!1434693 (= res!967988 (= (select (arr!47101 a!2831) (index!47914 lt!631584)) (select (arr!47101 a!2831) j!81)))))

(declare-fun e!809731 () Bool)

(assert (=> b!1434693 (=> res!967988 e!809731)))

(declare-fun e!809734 () Bool)

(assert (=> b!1434693 (= e!809734 e!809731)))

(declare-fun b!1434694 () Bool)

(assert (=> b!1434694 (= e!809735 (bvsge (x!129560 lt!631584) #b01111111111111111111111111111110))))

(declare-fun b!1434695 () Bool)

(declare-fun e!809732 () SeekEntryResult!11380)

(assert (=> b!1434695 (= e!809732 (Intermediate!11380 false index!585 x!605))))

(declare-fun b!1434696 () Bool)

(assert (=> b!1434696 (= e!809733 (Intermediate!11380 true index!585 x!605))))

(declare-fun b!1434697 () Bool)

(assert (=> b!1434697 (= e!809732 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47101 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434698 () Bool)

(assert (=> b!1434698 (and (bvsge (index!47914 lt!631584) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631584) (size!47651 a!2831)))))

(declare-fun res!967987 () Bool)

(assert (=> b!1434698 (= res!967987 (= (select (arr!47101 a!2831) (index!47914 lt!631584)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434698 (=> res!967987 e!809731)))

(declare-fun b!1434699 () Bool)

(assert (=> b!1434699 (= e!809735 e!809734)))

(declare-fun res!967986 () Bool)

(assert (=> b!1434699 (= res!967986 (and (is-Intermediate!11380 lt!631584) (not (undefined!12192 lt!631584)) (bvslt (x!129560 lt!631584) #b01111111111111111111111111111110) (bvsge (x!129560 lt!631584) #b00000000000000000000000000000000) (bvsge (x!129560 lt!631584) x!605)))))

(assert (=> b!1434699 (=> (not res!967986) (not e!809734))))

(declare-fun b!1434700 () Bool)

(assert (=> b!1434700 (= e!809733 e!809732)))

(declare-fun c!132855 () Bool)

(assert (=> b!1434700 (= c!132855 (or (= lt!631585 (select (arr!47101 a!2831) j!81)) (= (bvadd lt!631585 lt!631585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434701 () Bool)

(assert (=> b!1434701 (and (bvsge (index!47914 lt!631584) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631584) (size!47651 a!2831)))))

(assert (=> b!1434701 (= e!809731 (= (select (arr!47101 a!2831) (index!47914 lt!631584)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154277 c!132856) b!1434696))

(assert (= (and d!154277 (not c!132856)) b!1434700))

(assert (= (and b!1434700 c!132855) b!1434695))

(assert (= (and b!1434700 (not c!132855)) b!1434697))

(assert (= (and d!154277 c!132857) b!1434694))

(assert (= (and d!154277 (not c!132857)) b!1434699))

(assert (= (and b!1434699 res!967986) b!1434693))

(assert (= (and b!1434693 (not res!967988)) b!1434698))

(assert (= (and b!1434698 (not res!967987)) b!1434701))

(assert (=> b!1434697 m!1324081))

(assert (=> b!1434697 m!1324081))

(assert (=> b!1434697 m!1324041))

(declare-fun m!1324241 () Bool)

(assert (=> b!1434697 m!1324241))

(declare-fun m!1324243 () Bool)

(assert (=> b!1434693 m!1324243))

(assert (=> d!154277 m!1324069))

(assert (=> d!154277 m!1324075))

(assert (=> b!1434698 m!1324243))

(assert (=> b!1434701 m!1324243))

(assert (=> b!1434427 d!154277))

(declare-fun d!154279 () Bool)

(declare-fun e!809740 () Bool)

(assert (=> d!154279 e!809740))

(declare-fun c!132860 () Bool)

(declare-fun lt!631586 () SeekEntryResult!11380)

(assert (=> d!154279 (= c!132860 (and (is-Intermediate!11380 lt!631586) (undefined!12192 lt!631586)))))

(declare-fun e!809738 () SeekEntryResult!11380)

(assert (=> d!154279 (= lt!631586 e!809738)))

(declare-fun c!132859 () Bool)

(assert (=> d!154279 (= c!132859 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631587 () (_ BitVec 64))

(assert (=> d!154279 (= lt!631587 (select (arr!47101 a!2831) (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608)))))

(assert (=> d!154279 (validMask!0 mask!2608)))

(assert (=> d!154279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631586)))

(declare-fun b!1434702 () Bool)

(assert (=> b!1434702 (and (bvsge (index!47914 lt!631586) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631586) (size!47651 a!2831)))))

(declare-fun res!967991 () Bool)

(assert (=> b!1434702 (= res!967991 (= (select (arr!47101 a!2831) (index!47914 lt!631586)) (select (arr!47101 a!2831) j!81)))))

(declare-fun e!809736 () Bool)

(assert (=> b!1434702 (=> res!967991 e!809736)))

(declare-fun e!809739 () Bool)

(assert (=> b!1434702 (= e!809739 e!809736)))

(declare-fun b!1434703 () Bool)

(assert (=> b!1434703 (= e!809740 (bvsge (x!129560 lt!631586) #b01111111111111111111111111111110))))

(declare-fun b!1434704 () Bool)

(declare-fun e!809737 () SeekEntryResult!11380)

(assert (=> b!1434704 (= e!809737 (Intermediate!11380 false (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434705 () Bool)

(assert (=> b!1434705 (= e!809738 (Intermediate!11380 true (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1434706 () Bool)

(assert (=> b!1434706 (= e!809737 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47101 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1434707 () Bool)

(assert (=> b!1434707 (and (bvsge (index!47914 lt!631586) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631586) (size!47651 a!2831)))))

(declare-fun res!967990 () Bool)

(assert (=> b!1434707 (= res!967990 (= (select (arr!47101 a!2831) (index!47914 lt!631586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1434707 (=> res!967990 e!809736)))

(declare-fun b!1434708 () Bool)

(assert (=> b!1434708 (= e!809740 e!809739)))

(declare-fun res!967989 () Bool)

(assert (=> b!1434708 (= res!967989 (and (is-Intermediate!11380 lt!631586) (not (undefined!12192 lt!631586)) (bvslt (x!129560 lt!631586) #b01111111111111111111111111111110) (bvsge (x!129560 lt!631586) #b00000000000000000000000000000000) (bvsge (x!129560 lt!631586) #b00000000000000000000000000000000)))))

(assert (=> b!1434708 (=> (not res!967989) (not e!809739))))

(declare-fun b!1434709 () Bool)

(assert (=> b!1434709 (= e!809738 e!809737)))

(declare-fun c!132858 () Bool)

(assert (=> b!1434709 (= c!132858 (or (= lt!631587 (select (arr!47101 a!2831) j!81)) (= (bvadd lt!631587 lt!631587) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1434710 () Bool)

(assert (=> b!1434710 (and (bvsge (index!47914 lt!631586) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631586) (size!47651 a!2831)))))

(assert (=> b!1434710 (= e!809736 (= (select (arr!47101 a!2831) (index!47914 lt!631586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!154279 c!132859) b!1434705))

(assert (= (and d!154279 (not c!132859)) b!1434709))

(assert (= (and b!1434709 c!132858) b!1434704))

(assert (= (and b!1434709 (not c!132858)) b!1434706))

(assert (= (and d!154279 c!132860) b!1434703))

(assert (= (and d!154279 (not c!132860)) b!1434708))

(assert (= (and b!1434708 res!967989) b!1434702))

(assert (= (and b!1434702 (not res!967991)) b!1434707))

(assert (= (and b!1434707 (not res!967990)) b!1434710))

(assert (=> b!1434706 m!1324043))

(declare-fun m!1324245 () Bool)

(assert (=> b!1434706 m!1324245))

(assert (=> b!1434706 m!1324245))

(assert (=> b!1434706 m!1324041))

(declare-fun m!1324247 () Bool)

(assert (=> b!1434706 m!1324247))

(declare-fun m!1324249 () Bool)

(assert (=> b!1434702 m!1324249))

(assert (=> d!154279 m!1324043))

(declare-fun m!1324251 () Bool)

(assert (=> d!154279 m!1324251))

(assert (=> d!154279 m!1324075))

(assert (=> b!1434707 m!1324249))

(assert (=> b!1434710 m!1324249))

(assert (=> b!1434416 d!154279))

(declare-fun d!154281 () Bool)

(declare-fun lt!631589 () (_ BitVec 32))

(declare-fun lt!631588 () (_ BitVec 32))

(assert (=> d!154281 (= lt!631589 (bvmul (bvxor lt!631588 (bvlshr lt!631588 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154281 (= lt!631588 ((_ extract 31 0) (bvand (bvxor (select (arr!47101 a!2831) j!81) (bvlshr (select (arr!47101 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154281 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967959 (let ((h!34939 ((_ extract 31 0) (bvand (bvxor (select (arr!47101 a!2831) j!81) (bvlshr (select (arr!47101 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129568 (bvmul (bvxor h!34939 (bvlshr h!34939 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129568 (bvlshr x!129568 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967959 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967959 #b00000000000000000000000000000000))))))

(assert (=> d!154281 (= (toIndex!0 (select (arr!47101 a!2831) j!81) mask!2608) (bvand (bvxor lt!631589 (bvlshr lt!631589 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434416 d!154281))

(declare-fun d!154283 () Bool)

(declare-fun e!809745 () Bool)

(assert (=> d!154283 e!809745))

(declare-fun c!132863 () Bool)

(declare-fun lt!631590 () SeekEntryResult!11380)

(assert (=> d!154283 (= c!132863 (and (is-Intermediate!11380 lt!631590) (undefined!12192 lt!631590)))))

(declare-fun e!809743 () SeekEntryResult!11380)

(assert (=> d!154283 (= lt!631590 e!809743)))

(declare-fun c!132862 () Bool)

(assert (=> d!154283 (= c!132862 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(declare-fun lt!631591 () (_ BitVec 64))

(assert (=> d!154283 (= lt!631591 (select (arr!47101 a!2831) lt!631453))))

(assert (=> d!154283 (validMask!0 mask!2608)))

(assert (=> d!154283 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631453 (select (arr!47101 a!2831) j!81) a!2831 mask!2608) lt!631590)))

(declare-fun b!1434711 () Bool)

(assert (=> b!1434711 (and (bvsge (index!47914 lt!631590) #b00000000000000000000000000000000) (bvslt (index!47914 lt!631590) (size!47651 a!2831)))))

(declare-fun res!967994 () Bool)

(assert (=> b!1434711 (= res!967994 (= (select (arr!47101 a!2831) (index!47914 lt!631590)) (select (arr!47101 a!2831) j!81)))))

