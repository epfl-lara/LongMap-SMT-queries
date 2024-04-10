; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123798 () Bool)

(assert start!123798)

(declare-fun b!1434798 () Bool)

(declare-fun res!968045 () Bool)

(declare-fun e!809792 () Bool)

(assert (=> b!1434798 (=> res!968045 e!809792)))

(declare-fun lt!631622 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11381 0))(
  ( (MissingZero!11381 (index!47916 (_ BitVec 32))) (Found!11381 (index!47917 (_ BitVec 32))) (Intermediate!11381 (undefined!12193 Bool) (index!47918 (_ BitVec 32)) (x!129578 (_ BitVec 32))) (Undefined!11381) (MissingVacant!11381 (index!47919 (_ BitVec 32))) )
))
(declare-fun lt!631621 () SeekEntryResult!11381)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97599 0))(
  ( (array!97600 (arr!47102 (Array (_ BitVec 32) (_ BitVec 64))) (size!47652 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97599)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97599 (_ BitVec 32)) SeekEntryResult!11381)

(assert (=> b!1434798 (= res!968045 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631622 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631621)))))

(declare-fun b!1434799 () Bool)

(declare-fun res!968051 () Bool)

(declare-fun e!809789 () Bool)

(assert (=> b!1434799 (=> (not res!968051) (not e!809789))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434799 (= res!968051 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434800 () Bool)

(declare-fun res!968044 () Bool)

(declare-fun e!809793 () Bool)

(assert (=> b!1434800 (=> (not res!968044) (not e!809793))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434800 (= res!968044 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47652 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47652 a!2831))))))

(declare-fun b!1434801 () Bool)

(declare-fun e!809790 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97599 (_ BitVec 32)) SeekEntryResult!11381)

(assert (=> b!1434801 (= e!809790 (= (seekEntryOrOpen!0 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) (Found!11381 j!81)))))

(declare-fun b!1434802 () Bool)

(declare-fun e!809794 () Bool)

(assert (=> b!1434802 (= e!809793 e!809794)))

(declare-fun res!968053 () Bool)

(assert (=> b!1434802 (=> (not res!968053) (not e!809794))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434802 (= res!968053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631621))))

(assert (=> b!1434802 (= lt!631621 (Intermediate!11381 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434803 () Bool)

(assert (=> b!1434803 (= e!809794 e!809789)))

(declare-fun res!968042 () Bool)

(assert (=> b!1434803 (=> (not res!968042) (not e!809789))))

(declare-fun lt!631623 () (_ BitVec 64))

(declare-fun lt!631620 () array!97599)

(declare-fun lt!631619 () SeekEntryResult!11381)

(assert (=> b!1434803 (= res!968042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631623 mask!2608) lt!631623 lt!631620 mask!2608) lt!631619))))

(assert (=> b!1434803 (= lt!631619 (Intermediate!11381 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434803 (= lt!631623 (select (store (arr!47102 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434803 (= lt!631620 (array!97600 (store (arr!47102 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47652 a!2831)))))

(declare-fun b!1434804 () Bool)

(declare-fun e!809795 () Bool)

(assert (=> b!1434804 (= e!809789 (not e!809795))))

(declare-fun res!968043 () Bool)

(assert (=> b!1434804 (=> res!968043 e!809795)))

(assert (=> b!1434804 (= res!968043 (or (= (select (arr!47102 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47102 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47102 a!2831) index!585) (select (arr!47102 a!2831) j!81)) (= (select (store (arr!47102 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434804 e!809790))

(declare-fun res!968047 () Bool)

(assert (=> b!1434804 (=> (not res!968047) (not e!809790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97599 (_ BitVec 32)) Bool)

(assert (=> b!1434804 (= res!968047 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48508 0))(
  ( (Unit!48509) )
))
(declare-fun lt!631618 () Unit!48508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48508)

(assert (=> b!1434804 (= lt!631618 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434805 () Bool)

(declare-fun res!968055 () Bool)

(assert (=> b!1434805 (=> (not res!968055) (not e!809793))))

(assert (=> b!1434805 (= res!968055 (and (= (size!47652 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47652 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47652 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1434806 () Bool)

(declare-fun res!968054 () Bool)

(assert (=> b!1434806 (=> (not res!968054) (not e!809793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434806 (= res!968054 (validKeyInArray!0 (select (arr!47102 a!2831) j!81)))))

(declare-fun b!1434807 () Bool)

(assert (=> b!1434807 (= e!809792 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631622 lt!631623 lt!631620 mask!2608) lt!631619))))

(declare-fun b!1434808 () Bool)

(declare-fun res!968056 () Bool)

(assert (=> b!1434808 (=> (not res!968056) (not e!809789))))

(assert (=> b!1434808 (= res!968056 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631621))))

(declare-fun b!1434809 () Bool)

(declare-fun res!968049 () Bool)

(assert (=> b!1434809 (=> (not res!968049) (not e!809793))))

(assert (=> b!1434809 (= res!968049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!968041 () Bool)

(assert (=> start!123798 (=> (not res!968041) (not e!809793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123798 (= res!968041 (validMask!0 mask!2608))))

(assert (=> start!123798 e!809793))

(assert (=> start!123798 true))

(declare-fun array_inv!36130 (array!97599) Bool)

(assert (=> start!123798 (array_inv!36130 a!2831)))

(declare-fun b!1434810 () Bool)

(declare-fun res!968046 () Bool)

(assert (=> b!1434810 (=> (not res!968046) (not e!809793))))

(declare-datatypes ((List!33612 0))(
  ( (Nil!33609) (Cons!33608 (h!34940 (_ BitVec 64)) (t!48306 List!33612)) )
))
(declare-fun arrayNoDuplicates!0 (array!97599 (_ BitVec 32) List!33612) Bool)

(assert (=> b!1434810 (= res!968046 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33609))))

(declare-fun b!1434811 () Bool)

(assert (=> b!1434811 (= e!809795 e!809792)))

(declare-fun res!968048 () Bool)

(assert (=> b!1434811 (=> res!968048 e!809792)))

(assert (=> b!1434811 (= res!968048 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631622 #b00000000000000000000000000000000) (bvsge lt!631622 (size!47652 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434811 (= lt!631622 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1434812 () Bool)

(declare-fun res!968050 () Bool)

(assert (=> b!1434812 (=> (not res!968050) (not e!809793))))

(assert (=> b!1434812 (= res!968050 (validKeyInArray!0 (select (arr!47102 a!2831) i!982)))))

(declare-fun b!1434813 () Bool)

(declare-fun res!968052 () Bool)

(assert (=> b!1434813 (=> (not res!968052) (not e!809789))))

(assert (=> b!1434813 (= res!968052 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631623 lt!631620 mask!2608) lt!631619))))

(assert (= (and start!123798 res!968041) b!1434805))

(assert (= (and b!1434805 res!968055) b!1434812))

(assert (= (and b!1434812 res!968050) b!1434806))

(assert (= (and b!1434806 res!968054) b!1434809))

(assert (= (and b!1434809 res!968049) b!1434810))

(assert (= (and b!1434810 res!968046) b!1434800))

(assert (= (and b!1434800 res!968044) b!1434802))

(assert (= (and b!1434802 res!968053) b!1434803))

(assert (= (and b!1434803 res!968042) b!1434808))

(assert (= (and b!1434808 res!968056) b!1434813))

(assert (= (and b!1434813 res!968052) b!1434799))

(assert (= (and b!1434799 res!968051) b!1434804))

(assert (= (and b!1434804 res!968047) b!1434801))

(assert (= (and b!1434804 (not res!968043)) b!1434811))

(assert (= (and b!1434811 (not res!968048)) b!1434798))

(assert (= (and b!1434798 (not res!968045)) b!1434807))

(declare-fun m!1324293 () Bool)

(assert (=> b!1434806 m!1324293))

(assert (=> b!1434806 m!1324293))

(declare-fun m!1324295 () Bool)

(assert (=> b!1434806 m!1324295))

(declare-fun m!1324297 () Bool)

(assert (=> b!1434810 m!1324297))

(declare-fun m!1324299 () Bool)

(assert (=> b!1434813 m!1324299))

(assert (=> b!1434802 m!1324293))

(assert (=> b!1434802 m!1324293))

(declare-fun m!1324301 () Bool)

(assert (=> b!1434802 m!1324301))

(assert (=> b!1434802 m!1324301))

(assert (=> b!1434802 m!1324293))

(declare-fun m!1324303 () Bool)

(assert (=> b!1434802 m!1324303))

(assert (=> b!1434798 m!1324293))

(assert (=> b!1434798 m!1324293))

(declare-fun m!1324305 () Bool)

(assert (=> b!1434798 m!1324305))

(declare-fun m!1324307 () Bool)

(assert (=> b!1434807 m!1324307))

(declare-fun m!1324309 () Bool)

(assert (=> b!1434811 m!1324309))

(assert (=> b!1434808 m!1324293))

(assert (=> b!1434808 m!1324293))

(declare-fun m!1324311 () Bool)

(assert (=> b!1434808 m!1324311))

(assert (=> b!1434801 m!1324293))

(assert (=> b!1434801 m!1324293))

(declare-fun m!1324313 () Bool)

(assert (=> b!1434801 m!1324313))

(declare-fun m!1324315 () Bool)

(assert (=> b!1434803 m!1324315))

(assert (=> b!1434803 m!1324315))

(declare-fun m!1324317 () Bool)

(assert (=> b!1434803 m!1324317))

(declare-fun m!1324319 () Bool)

(assert (=> b!1434803 m!1324319))

(declare-fun m!1324321 () Bool)

(assert (=> b!1434803 m!1324321))

(declare-fun m!1324323 () Bool)

(assert (=> b!1434812 m!1324323))

(assert (=> b!1434812 m!1324323))

(declare-fun m!1324325 () Bool)

(assert (=> b!1434812 m!1324325))

(declare-fun m!1324327 () Bool)

(assert (=> start!123798 m!1324327))

(declare-fun m!1324329 () Bool)

(assert (=> start!123798 m!1324329))

(declare-fun m!1324331 () Bool)

(assert (=> b!1434809 m!1324331))

(assert (=> b!1434804 m!1324319))

(declare-fun m!1324333 () Bool)

(assert (=> b!1434804 m!1324333))

(declare-fun m!1324335 () Bool)

(assert (=> b!1434804 m!1324335))

(declare-fun m!1324337 () Bool)

(assert (=> b!1434804 m!1324337))

(assert (=> b!1434804 m!1324293))

(declare-fun m!1324339 () Bool)

(assert (=> b!1434804 m!1324339))

(push 1)

(assert (not b!1434806))

(assert (not b!1434810))

(assert (not b!1434813))

(assert (not start!123798))

(assert (not b!1434803))

(assert (not b!1434808))

(assert (not b!1434801))

(assert (not b!1434798))

(assert (not b!1434812))

(assert (not b!1434804))

(assert (not b!1434809))

(assert (not b!1434811))

(assert (not b!1434802))

(assert (not b!1434807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154309 () Bool)

(assert (=> d!154309 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!123798 d!154309))

(declare-fun d!154319 () Bool)

(assert (=> d!154319 (= (array_inv!36130 a!2831) (bvsge (size!47652 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!123798 d!154319))

(declare-fun d!154321 () Bool)

(assert (=> d!154321 (= (validKeyInArray!0 (select (arr!47102 a!2831) j!81)) (and (not (= (select (arr!47102 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47102 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434806 d!154321))

(declare-fun b!1435020 () Bool)

(declare-fun e!809908 () Bool)

(declare-fun call!67552 () Bool)

(assert (=> b!1435020 (= e!809908 call!67552)))

(declare-fun bm!67549 () Bool)

(assert (=> bm!67549 (= call!67552 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154325 () Bool)

(declare-fun res!968193 () Bool)

(declare-fun e!809909 () Bool)

(assert (=> d!154325 (=> res!968193 e!809909)))

(assert (=> d!154325 (= res!968193 (bvsge j!81 (size!47652 a!2831)))))

(assert (=> d!154325 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!809909)))

(declare-fun b!1435021 () Bool)

(declare-fun e!809910 () Bool)

(assert (=> b!1435021 (= e!809910 call!67552)))

(declare-fun b!1435022 () Bool)

(assert (=> b!1435022 (= e!809909 e!809910)))

(declare-fun c!132915 () Bool)

(assert (=> b!1435022 (= c!132915 (validKeyInArray!0 (select (arr!47102 a!2831) j!81)))))

(declare-fun b!1435023 () Bool)

(assert (=> b!1435023 (= e!809910 e!809908)))

(declare-fun lt!631714 () (_ BitVec 64))

(assert (=> b!1435023 (= lt!631714 (select (arr!47102 a!2831) j!81))))

(declare-fun lt!631712 () Unit!48508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97599 (_ BitVec 64) (_ BitVec 32)) Unit!48508)

(assert (=> b!1435023 (= lt!631712 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631714 j!81))))

(declare-fun arrayContainsKey!0 (array!97599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1435023 (arrayContainsKey!0 a!2831 lt!631714 #b00000000000000000000000000000000)))

(declare-fun lt!631713 () Unit!48508)

(assert (=> b!1435023 (= lt!631713 lt!631712)))

(declare-fun res!968194 () Bool)

(assert (=> b!1435023 (= res!968194 (= (seekEntryOrOpen!0 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) (Found!11381 j!81)))))

(assert (=> b!1435023 (=> (not res!968194) (not e!809908))))

(assert (= (and d!154325 (not res!968193)) b!1435022))

(assert (= (and b!1435022 c!132915) b!1435023))

(assert (= (and b!1435022 (not c!132915)) b!1435021))

(assert (= (and b!1435023 res!968194) b!1435020))

(assert (= (or b!1435020 b!1435021) bm!67549))

(declare-fun m!1324493 () Bool)

(assert (=> bm!67549 m!1324493))

(assert (=> b!1435022 m!1324293))

(assert (=> b!1435022 m!1324293))

(assert (=> b!1435022 m!1324295))

(assert (=> b!1435023 m!1324293))

(declare-fun m!1324495 () Bool)

(assert (=> b!1435023 m!1324495))

(declare-fun m!1324497 () Bool)

(assert (=> b!1435023 m!1324497))

(assert (=> b!1435023 m!1324293))

(assert (=> b!1435023 m!1324313))

(assert (=> b!1434804 d!154325))

(declare-fun d!154335 () Bool)

(assert (=> d!154335 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-fun lt!631721 () Unit!48508)

(declare-fun choose!38 (array!97599 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48508)

(assert (=> d!154335 (= lt!631721 (choose!38 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (=> d!154335 (validMask!0 mask!2608)))

(assert (=> d!154335 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81) lt!631721)))

(declare-fun bs!41774 () Bool)

(assert (= bs!41774 d!154335))

(assert (=> bs!41774 m!1324337))

(declare-fun m!1324499 () Bool)

(assert (=> bs!41774 m!1324499))

(assert (=> bs!41774 m!1324327))

(assert (=> b!1434804 d!154335))

(declare-fun b!1435159 () Bool)

(declare-fun e!809986 () SeekEntryResult!11381)

(assert (=> b!1435159 (= e!809986 (Intermediate!11381 true (toIndex!0 lt!631623 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435160 () Bool)

(declare-fun e!809988 () Bool)

(declare-fun lt!631775 () SeekEntryResult!11381)

(assert (=> b!1435160 (= e!809988 (bvsge (x!129578 lt!631775) #b01111111111111111111111111111110))))

(declare-fun b!1435161 () Bool)

(assert (=> b!1435161 (and (bvsge (index!47918 lt!631775) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631775) (size!47652 lt!631620)))))

(declare-fun res!968238 () Bool)

(assert (=> b!1435161 (= res!968238 (= (select (arr!47102 lt!631620) (index!47918 lt!631775)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809987 () Bool)

(assert (=> b!1435161 (=> res!968238 e!809987)))

(declare-fun b!1435162 () Bool)

(declare-fun e!809989 () Bool)

(assert (=> b!1435162 (= e!809988 e!809989)))

(declare-fun res!968237 () Bool)

(assert (=> b!1435162 (= res!968237 (and (is-Intermediate!11381 lt!631775) (not (undefined!12193 lt!631775)) (bvslt (x!129578 lt!631775) #b01111111111111111111111111111110) (bvsge (x!129578 lt!631775) #b00000000000000000000000000000000) (bvsge (x!129578 lt!631775) #b00000000000000000000000000000000)))))

(assert (=> b!1435162 (=> (not res!968237) (not e!809989))))

(declare-fun b!1435163 () Bool)

(assert (=> b!1435163 (and (bvsge (index!47918 lt!631775) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631775) (size!47652 lt!631620)))))

(assert (=> b!1435163 (= e!809987 (= (select (arr!47102 lt!631620) (index!47918 lt!631775)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435164 () Bool)

(declare-fun e!809990 () SeekEntryResult!11381)

(assert (=> b!1435164 (= e!809986 e!809990)))

(declare-fun c!132964 () Bool)

(declare-fun lt!631774 () (_ BitVec 64))

(assert (=> b!1435164 (= c!132964 (or (= lt!631774 lt!631623) (= (bvadd lt!631774 lt!631774) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435158 () Bool)

(assert (=> b!1435158 (and (bvsge (index!47918 lt!631775) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631775) (size!47652 lt!631620)))))

(declare-fun res!968239 () Bool)

(assert (=> b!1435158 (= res!968239 (= (select (arr!47102 lt!631620) (index!47918 lt!631775)) lt!631623))))

(assert (=> b!1435158 (=> res!968239 e!809987)))

(assert (=> b!1435158 (= e!809989 e!809987)))

(declare-fun d!154337 () Bool)

(assert (=> d!154337 e!809988))

(declare-fun c!132965 () Bool)

(assert (=> d!154337 (= c!132965 (and (is-Intermediate!11381 lt!631775) (undefined!12193 lt!631775)))))

(assert (=> d!154337 (= lt!631775 e!809986)))

(declare-fun c!132963 () Bool)

(assert (=> d!154337 (= c!132963 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154337 (= lt!631774 (select (arr!47102 lt!631620) (toIndex!0 lt!631623 mask!2608)))))

(assert (=> d!154337 (validMask!0 mask!2608)))

(assert (=> d!154337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631623 mask!2608) lt!631623 lt!631620 mask!2608) lt!631775)))

(declare-fun b!1435165 () Bool)

(assert (=> b!1435165 (= e!809990 (Intermediate!11381 false (toIndex!0 lt!631623 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435166 () Bool)

(assert (=> b!1435166 (= e!809990 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631623 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631623 lt!631620 mask!2608))))

(assert (= (and d!154337 c!132963) b!1435159))

(assert (= (and d!154337 (not c!132963)) b!1435164))

(assert (= (and b!1435164 c!132964) b!1435165))

(assert (= (and b!1435164 (not c!132964)) b!1435166))

(assert (= (and d!154337 c!132965) b!1435160))

(assert (= (and d!154337 (not c!132965)) b!1435162))

(assert (= (and b!1435162 res!968237) b!1435158))

(assert (= (and b!1435158 (not res!968239)) b!1435161))

(assert (= (and b!1435161 (not res!968238)) b!1435163))

(declare-fun m!1324589 () Bool)

(assert (=> b!1435163 m!1324589))

(assert (=> b!1435161 m!1324589))

(assert (=> b!1435158 m!1324589))

(assert (=> b!1435166 m!1324315))

(declare-fun m!1324591 () Bool)

(assert (=> b!1435166 m!1324591))

(assert (=> b!1435166 m!1324591))

(declare-fun m!1324593 () Bool)

(assert (=> b!1435166 m!1324593))

(assert (=> d!154337 m!1324315))

(declare-fun m!1324595 () Bool)

(assert (=> d!154337 m!1324595))

(assert (=> d!154337 m!1324327))

(assert (=> b!1434803 d!154337))

(declare-fun d!154369 () Bool)

(declare-fun lt!631783 () (_ BitVec 32))

(declare-fun lt!631782 () (_ BitVec 32))

(assert (=> d!154369 (= lt!631783 (bvmul (bvxor lt!631782 (bvlshr lt!631782 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154369 (= lt!631782 ((_ extract 31 0) (bvand (bvxor lt!631623 (bvlshr lt!631623 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154369 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968240 (let ((h!34945 ((_ extract 31 0) (bvand (bvxor lt!631623 (bvlshr lt!631623 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129588 (bvmul (bvxor h!34945 (bvlshr h!34945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129588 (bvlshr x!129588 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968240 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968240 #b00000000000000000000000000000000))))))

(assert (=> d!154369 (= (toIndex!0 lt!631623 mask!2608) (bvand (bvxor lt!631783 (bvlshr lt!631783 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434803 d!154369))

(declare-fun e!809991 () SeekEntryResult!11381)

(declare-fun b!1435168 () Bool)

(assert (=> b!1435168 (= e!809991 (Intermediate!11381 true (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435169 () Bool)

(declare-fun e!809993 () Bool)

(declare-fun lt!631785 () SeekEntryResult!11381)

(assert (=> b!1435169 (= e!809993 (bvsge (x!129578 lt!631785) #b01111111111111111111111111111110))))

(declare-fun b!1435170 () Bool)

(assert (=> b!1435170 (and (bvsge (index!47918 lt!631785) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631785) (size!47652 a!2831)))))

(declare-fun res!968242 () Bool)

(assert (=> b!1435170 (= res!968242 (= (select (arr!47102 a!2831) (index!47918 lt!631785)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809992 () Bool)

(assert (=> b!1435170 (=> res!968242 e!809992)))

(declare-fun b!1435171 () Bool)

(declare-fun e!809994 () Bool)

(assert (=> b!1435171 (= e!809993 e!809994)))

(declare-fun res!968241 () Bool)

(assert (=> b!1435171 (= res!968241 (and (is-Intermediate!11381 lt!631785) (not (undefined!12193 lt!631785)) (bvslt (x!129578 lt!631785) #b01111111111111111111111111111110) (bvsge (x!129578 lt!631785) #b00000000000000000000000000000000) (bvsge (x!129578 lt!631785) #b00000000000000000000000000000000)))))

(assert (=> b!1435171 (=> (not res!968241) (not e!809994))))

(declare-fun b!1435172 () Bool)

(assert (=> b!1435172 (and (bvsge (index!47918 lt!631785) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631785) (size!47652 a!2831)))))

(assert (=> b!1435172 (= e!809992 (= (select (arr!47102 a!2831) (index!47918 lt!631785)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435173 () Bool)

(declare-fun e!809995 () SeekEntryResult!11381)

(assert (=> b!1435173 (= e!809991 e!809995)))

(declare-fun c!132967 () Bool)

(declare-fun lt!631784 () (_ BitVec 64))

(assert (=> b!1435173 (= c!132967 (or (= lt!631784 (select (arr!47102 a!2831) j!81)) (= (bvadd lt!631784 lt!631784) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435167 () Bool)

(assert (=> b!1435167 (and (bvsge (index!47918 lt!631785) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631785) (size!47652 a!2831)))))

(declare-fun res!968243 () Bool)

(assert (=> b!1435167 (= res!968243 (= (select (arr!47102 a!2831) (index!47918 lt!631785)) (select (arr!47102 a!2831) j!81)))))

(assert (=> b!1435167 (=> res!968243 e!809992)))

(assert (=> b!1435167 (= e!809994 e!809992)))

(declare-fun d!154371 () Bool)

(assert (=> d!154371 e!809993))

(declare-fun c!132968 () Bool)

(assert (=> d!154371 (= c!132968 (and (is-Intermediate!11381 lt!631785) (undefined!12193 lt!631785)))))

(assert (=> d!154371 (= lt!631785 e!809991)))

(declare-fun c!132966 () Bool)

(assert (=> d!154371 (= c!132966 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154371 (= lt!631784 (select (arr!47102 a!2831) (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608)))))

(assert (=> d!154371 (validMask!0 mask!2608)))

(assert (=> d!154371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631785)))

(declare-fun b!1435174 () Bool)

(assert (=> b!1435174 (= e!809995 (Intermediate!11381 false (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1435175 () Bool)

(assert (=> b!1435175 (= e!809995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47102 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154371 c!132966) b!1435168))

(assert (= (and d!154371 (not c!132966)) b!1435173))

(assert (= (and b!1435173 c!132967) b!1435174))

(assert (= (and b!1435173 (not c!132967)) b!1435175))

(assert (= (and d!154371 c!132968) b!1435169))

(assert (= (and d!154371 (not c!132968)) b!1435171))

(assert (= (and b!1435171 res!968241) b!1435167))

(assert (= (and b!1435167 (not res!968243)) b!1435170))

(assert (= (and b!1435170 (not res!968242)) b!1435172))

(declare-fun m!1324597 () Bool)

(assert (=> b!1435172 m!1324597))

(assert (=> b!1435170 m!1324597))

(assert (=> b!1435167 m!1324597))

(assert (=> b!1435175 m!1324301))

(declare-fun m!1324599 () Bool)

(assert (=> b!1435175 m!1324599))

(assert (=> b!1435175 m!1324599))

(assert (=> b!1435175 m!1324293))

(declare-fun m!1324601 () Bool)

(assert (=> b!1435175 m!1324601))

(assert (=> d!154371 m!1324301))

(declare-fun m!1324603 () Bool)

(assert (=> d!154371 m!1324603))

(assert (=> d!154371 m!1324327))

(assert (=> b!1434802 d!154371))

(declare-fun d!154373 () Bool)

(declare-fun lt!631787 () (_ BitVec 32))

(declare-fun lt!631786 () (_ BitVec 32))

(assert (=> d!154373 (= lt!631787 (bvmul (bvxor lt!631786 (bvlshr lt!631786 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154373 (= lt!631786 ((_ extract 31 0) (bvand (bvxor (select (arr!47102 a!2831) j!81) (bvlshr (select (arr!47102 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154373 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!968240 (let ((h!34945 ((_ extract 31 0) (bvand (bvxor (select (arr!47102 a!2831) j!81) (bvlshr (select (arr!47102 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129588 (bvmul (bvxor h!34945 (bvlshr h!34945 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129588 (bvlshr x!129588 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!968240 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!968240 #b00000000000000000000000000000000))))))

(assert (=> d!154373 (= (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) (bvand (bvxor lt!631787 (bvlshr lt!631787 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1434802 d!154373))

(declare-fun b!1435177 () Bool)

(declare-fun e!809996 () SeekEntryResult!11381)

(assert (=> b!1435177 (= e!809996 (Intermediate!11381 true index!585 x!605))))

(declare-fun b!1435178 () Bool)

(declare-fun e!809998 () Bool)

(declare-fun lt!631789 () SeekEntryResult!11381)

(assert (=> b!1435178 (= e!809998 (bvsge (x!129578 lt!631789) #b01111111111111111111111111111110))))

(declare-fun b!1435179 () Bool)

(assert (=> b!1435179 (and (bvsge (index!47918 lt!631789) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631789) (size!47652 lt!631620)))))

(declare-fun res!968245 () Bool)

(assert (=> b!1435179 (= res!968245 (= (select (arr!47102 lt!631620) (index!47918 lt!631789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!809997 () Bool)

(assert (=> b!1435179 (=> res!968245 e!809997)))

(declare-fun b!1435180 () Bool)

(declare-fun e!809999 () Bool)

(assert (=> b!1435180 (= e!809998 e!809999)))

(declare-fun res!968244 () Bool)

(assert (=> b!1435180 (= res!968244 (and (is-Intermediate!11381 lt!631789) (not (undefined!12193 lt!631789)) (bvslt (x!129578 lt!631789) #b01111111111111111111111111111110) (bvsge (x!129578 lt!631789) #b00000000000000000000000000000000) (bvsge (x!129578 lt!631789) x!605)))))

(assert (=> b!1435180 (=> (not res!968244) (not e!809999))))

(declare-fun b!1435181 () Bool)

(assert (=> b!1435181 (and (bvsge (index!47918 lt!631789) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631789) (size!47652 lt!631620)))))

(assert (=> b!1435181 (= e!809997 (= (select (arr!47102 lt!631620) (index!47918 lt!631789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435182 () Bool)

(declare-fun e!810000 () SeekEntryResult!11381)

(assert (=> b!1435182 (= e!809996 e!810000)))

(declare-fun c!132970 () Bool)

(declare-fun lt!631788 () (_ BitVec 64))

(assert (=> b!1435182 (= c!132970 (or (= lt!631788 lt!631623) (= (bvadd lt!631788 lt!631788) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435176 () Bool)

(assert (=> b!1435176 (and (bvsge (index!47918 lt!631789) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631789) (size!47652 lt!631620)))))

(declare-fun res!968246 () Bool)

(assert (=> b!1435176 (= res!968246 (= (select (arr!47102 lt!631620) (index!47918 lt!631789)) lt!631623))))

(assert (=> b!1435176 (=> res!968246 e!809997)))

(assert (=> b!1435176 (= e!809999 e!809997)))

(declare-fun d!154375 () Bool)

(assert (=> d!154375 e!809998))

(declare-fun c!132971 () Bool)

(assert (=> d!154375 (= c!132971 (and (is-Intermediate!11381 lt!631789) (undefined!12193 lt!631789)))))

(assert (=> d!154375 (= lt!631789 e!809996)))

(declare-fun c!132969 () Bool)

(assert (=> d!154375 (= c!132969 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154375 (= lt!631788 (select (arr!47102 lt!631620) index!585))))

(assert (=> d!154375 (validMask!0 mask!2608)))

(assert (=> d!154375 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631623 lt!631620 mask!2608) lt!631789)))

(declare-fun b!1435183 () Bool)

(assert (=> b!1435183 (= e!810000 (Intermediate!11381 false index!585 x!605))))

(declare-fun b!1435184 () Bool)

(assert (=> b!1435184 (= e!810000 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631623 lt!631620 mask!2608))))

(assert (= (and d!154375 c!132969) b!1435177))

(assert (= (and d!154375 (not c!132969)) b!1435182))

(assert (= (and b!1435182 c!132970) b!1435183))

(assert (= (and b!1435182 (not c!132970)) b!1435184))

(assert (= (and d!154375 c!132971) b!1435178))

(assert (= (and d!154375 (not c!132971)) b!1435180))

(assert (= (and b!1435180 res!968244) b!1435176))

(assert (= (and b!1435176 (not res!968246)) b!1435179))

(assert (= (and b!1435179 (not res!968245)) b!1435181))

(declare-fun m!1324605 () Bool)

(assert (=> b!1435181 m!1324605))

(assert (=> b!1435179 m!1324605))

(assert (=> b!1435176 m!1324605))

(assert (=> b!1435184 m!1324309))

(assert (=> b!1435184 m!1324309))

(declare-fun m!1324607 () Bool)

(assert (=> b!1435184 m!1324607))

(declare-fun m!1324609 () Bool)

(assert (=> d!154375 m!1324609))

(assert (=> d!154375 m!1324327))

(assert (=> b!1434813 d!154375))

(declare-fun d!154379 () Bool)

(assert (=> d!154379 (= (validKeyInArray!0 (select (arr!47102 a!2831) i!982)) (and (not (= (select (arr!47102 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47102 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1434812 d!154379))

(declare-fun d!154381 () Bool)

(declare-fun lt!631800 () SeekEntryResult!11381)

(assert (=> d!154381 (and (or (is-Undefined!11381 lt!631800) (not (is-Found!11381 lt!631800)) (and (bvsge (index!47917 lt!631800) #b00000000000000000000000000000000) (bvslt (index!47917 lt!631800) (size!47652 a!2831)))) (or (is-Undefined!11381 lt!631800) (is-Found!11381 lt!631800) (not (is-MissingZero!11381 lt!631800)) (and (bvsge (index!47916 lt!631800) #b00000000000000000000000000000000) (bvslt (index!47916 lt!631800) (size!47652 a!2831)))) (or (is-Undefined!11381 lt!631800) (is-Found!11381 lt!631800) (is-MissingZero!11381 lt!631800) (not (is-MissingVacant!11381 lt!631800)) (and (bvsge (index!47919 lt!631800) #b00000000000000000000000000000000) (bvslt (index!47919 lt!631800) (size!47652 a!2831)))) (or (is-Undefined!11381 lt!631800) (ite (is-Found!11381 lt!631800) (= (select (arr!47102 a!2831) (index!47917 lt!631800)) (select (arr!47102 a!2831) j!81)) (ite (is-MissingZero!11381 lt!631800) (= (select (arr!47102 a!2831) (index!47916 lt!631800)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11381 lt!631800) (= (select (arr!47102 a!2831) (index!47919 lt!631800)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!810025 () SeekEntryResult!11381)

(assert (=> d!154381 (= lt!631800 e!810025)))

(declare-fun c!132984 () Bool)

(declare-fun lt!631799 () SeekEntryResult!11381)

(assert (=> d!154381 (= c!132984 (and (is-Intermediate!11381 lt!631799) (undefined!12193 lt!631799)))))

(assert (=> d!154381 (= lt!631799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47102 a!2831) j!81) mask!2608) (select (arr!47102 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154381 (validMask!0 mask!2608)))

(assert (=> d!154381 (= (seekEntryOrOpen!0 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631800)))

(declare-fun e!810024 () SeekEntryResult!11381)

(declare-fun b!1435221 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97599 (_ BitVec 32)) SeekEntryResult!11381)

(assert (=> b!1435221 (= e!810024 (seekKeyOrZeroReturnVacant!0 (x!129578 lt!631799) (index!47918 lt!631799) (index!47918 lt!631799) (select (arr!47102 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1435222 () Bool)

(assert (=> b!1435222 (= e!810025 Undefined!11381)))

(declare-fun b!1435223 () Bool)

(declare-fun c!132986 () Bool)

(declare-fun lt!631798 () (_ BitVec 64))

(assert (=> b!1435223 (= c!132986 (= lt!631798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810026 () SeekEntryResult!11381)

(assert (=> b!1435223 (= e!810026 e!810024)))

(declare-fun b!1435224 () Bool)

(assert (=> b!1435224 (= e!810026 (Found!11381 (index!47918 lt!631799)))))

(declare-fun b!1435225 () Bool)

(assert (=> b!1435225 (= e!810025 e!810026)))

(assert (=> b!1435225 (= lt!631798 (select (arr!47102 a!2831) (index!47918 lt!631799)))))

(declare-fun c!132985 () Bool)

(assert (=> b!1435225 (= c!132985 (= lt!631798 (select (arr!47102 a!2831) j!81)))))

(declare-fun b!1435226 () Bool)

(assert (=> b!1435226 (= e!810024 (MissingZero!11381 (index!47918 lt!631799)))))

(assert (= (and d!154381 c!132984) b!1435222))

(assert (= (and d!154381 (not c!132984)) b!1435225))

(assert (= (and b!1435225 c!132985) b!1435224))

(assert (= (and b!1435225 (not c!132985)) b!1435223))

(assert (= (and b!1435223 c!132986) b!1435226))

(assert (= (and b!1435223 (not c!132986)) b!1435221))

(assert (=> d!154381 m!1324301))

(assert (=> d!154381 m!1324293))

(assert (=> d!154381 m!1324303))

(assert (=> d!154381 m!1324327))

(assert (=> d!154381 m!1324293))

(assert (=> d!154381 m!1324301))

(declare-fun m!1324619 () Bool)

(assert (=> d!154381 m!1324619))

(declare-fun m!1324621 () Bool)

(assert (=> d!154381 m!1324621))

(declare-fun m!1324623 () Bool)

(assert (=> d!154381 m!1324623))

(assert (=> b!1435221 m!1324293))

(declare-fun m!1324625 () Bool)

(assert (=> b!1435221 m!1324625))

(declare-fun m!1324627 () Bool)

(assert (=> b!1435225 m!1324627))

(assert (=> b!1434801 d!154381))

(declare-fun d!154389 () Bool)

(declare-fun lt!631803 () (_ BitVec 32))

(assert (=> d!154389 (and (bvsge lt!631803 #b00000000000000000000000000000000) (bvslt lt!631803 (bvadd mask!2608 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!154389 (= lt!631803 (choose!52 index!585 x!605 mask!2608))))

(assert (=> d!154389 (validMask!0 mask!2608)))

(assert (=> d!154389 (= (nextIndex!0 index!585 x!605 mask!2608) lt!631803)))

(declare-fun bs!41776 () Bool)

(assert (= bs!41776 d!154389))

(declare-fun m!1324629 () Bool)

(assert (=> bs!41776 m!1324629))

(assert (=> bs!41776 m!1324327))

(assert (=> b!1434811 d!154389))

(declare-fun b!1435237 () Bool)

(declare-fun e!810035 () Bool)

(declare-fun call!67560 () Bool)

(assert (=> b!1435237 (= e!810035 call!67560)))

(declare-fun b!1435238 () Bool)

(declare-fun e!810037 () Bool)

(assert (=> b!1435238 (= e!810037 e!810035)))

(declare-fun c!132989 () Bool)

(assert (=> b!1435238 (= c!132989 (validKeyInArray!0 (select (arr!47102 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435239 () Bool)

(declare-fun e!810036 () Bool)

(assert (=> b!1435239 (= e!810036 e!810037)))

(declare-fun res!968267 () Bool)

(assert (=> b!1435239 (=> (not res!968267) (not e!810037))))

(declare-fun e!810038 () Bool)

(assert (=> b!1435239 (= res!968267 (not e!810038))))

(declare-fun res!968266 () Bool)

(assert (=> b!1435239 (=> (not res!968266) (not e!810038))))

(assert (=> b!1435239 (= res!968266 (validKeyInArray!0 (select (arr!47102 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!154391 () Bool)

(declare-fun res!968265 () Bool)

(assert (=> d!154391 (=> res!968265 e!810036)))

(assert (=> d!154391 (= res!968265 (bvsge #b00000000000000000000000000000000 (size!47652 a!2831)))))

(assert (=> d!154391 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33609) e!810036)))

(declare-fun bm!67557 () Bool)

(assert (=> bm!67557 (= call!67560 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132989 (Cons!33608 (select (arr!47102 a!2831) #b00000000000000000000000000000000) Nil!33609) Nil!33609)))))

(declare-fun b!1435240 () Bool)

(declare-fun contains!9875 (List!33612 (_ BitVec 64)) Bool)

(assert (=> b!1435240 (= e!810038 (contains!9875 Nil!33609 (select (arr!47102 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435241 () Bool)

(assert (=> b!1435241 (= e!810035 call!67560)))

(assert (= (and d!154391 (not res!968265)) b!1435239))

(assert (= (and b!1435239 res!968266) b!1435240))

(assert (= (and b!1435239 res!968267) b!1435238))

(assert (= (and b!1435238 c!132989) b!1435241))

(assert (= (and b!1435238 (not c!132989)) b!1435237))

(assert (= (or b!1435241 b!1435237) bm!67557))

(declare-fun m!1324631 () Bool)

(assert (=> b!1435238 m!1324631))

(assert (=> b!1435238 m!1324631))

(declare-fun m!1324633 () Bool)

(assert (=> b!1435238 m!1324633))

(assert (=> b!1435239 m!1324631))

(assert (=> b!1435239 m!1324631))

(assert (=> b!1435239 m!1324633))

(assert (=> bm!67557 m!1324631))

(declare-fun m!1324635 () Bool)

(assert (=> bm!67557 m!1324635))

(assert (=> b!1435240 m!1324631))

(assert (=> b!1435240 m!1324631))

(declare-fun m!1324637 () Bool)

(assert (=> b!1435240 m!1324637))

(assert (=> b!1434810 d!154391))

(declare-fun b!1435243 () Bool)

(declare-fun e!810039 () SeekEntryResult!11381)

(assert (=> b!1435243 (= e!810039 (Intermediate!11381 true lt!631622 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435244 () Bool)

(declare-fun e!810041 () Bool)

(declare-fun lt!631805 () SeekEntryResult!11381)

(assert (=> b!1435244 (= e!810041 (bvsge (x!129578 lt!631805) #b01111111111111111111111111111110))))

(declare-fun b!1435245 () Bool)

(assert (=> b!1435245 (and (bvsge (index!47918 lt!631805) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631805) (size!47652 a!2831)))))

(declare-fun res!968269 () Bool)

(assert (=> b!1435245 (= res!968269 (= (select (arr!47102 a!2831) (index!47918 lt!631805)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810040 () Bool)

(assert (=> b!1435245 (=> res!968269 e!810040)))

(declare-fun b!1435246 () Bool)

(declare-fun e!810042 () Bool)

(assert (=> b!1435246 (= e!810041 e!810042)))

(declare-fun res!968268 () Bool)

(assert (=> b!1435246 (= res!968268 (and (is-Intermediate!11381 lt!631805) (not (undefined!12193 lt!631805)) (bvslt (x!129578 lt!631805) #b01111111111111111111111111111110) (bvsge (x!129578 lt!631805) #b00000000000000000000000000000000) (bvsge (x!129578 lt!631805) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1435246 (=> (not res!968268) (not e!810042))))

(declare-fun b!1435247 () Bool)

(assert (=> b!1435247 (and (bvsge (index!47918 lt!631805) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631805) (size!47652 a!2831)))))

(assert (=> b!1435247 (= e!810040 (= (select (arr!47102 a!2831) (index!47918 lt!631805)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435248 () Bool)

(declare-fun e!810043 () SeekEntryResult!11381)

(assert (=> b!1435248 (= e!810039 e!810043)))

(declare-fun c!132991 () Bool)

(declare-fun lt!631804 () (_ BitVec 64))

(assert (=> b!1435248 (= c!132991 (or (= lt!631804 (select (arr!47102 a!2831) j!81)) (= (bvadd lt!631804 lt!631804) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435242 () Bool)

(assert (=> b!1435242 (and (bvsge (index!47918 lt!631805) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631805) (size!47652 a!2831)))))

(declare-fun res!968270 () Bool)

(assert (=> b!1435242 (= res!968270 (= (select (arr!47102 a!2831) (index!47918 lt!631805)) (select (arr!47102 a!2831) j!81)))))

(assert (=> b!1435242 (=> res!968270 e!810040)))

(assert (=> b!1435242 (= e!810042 e!810040)))

(declare-fun d!154393 () Bool)

(assert (=> d!154393 e!810041))

(declare-fun c!132992 () Bool)

(assert (=> d!154393 (= c!132992 (and (is-Intermediate!11381 lt!631805) (undefined!12193 lt!631805)))))

(assert (=> d!154393 (= lt!631805 e!810039)))

(declare-fun c!132990 () Bool)

(assert (=> d!154393 (= c!132990 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154393 (= lt!631804 (select (arr!47102 a!2831) lt!631622))))

(assert (=> d!154393 (validMask!0 mask!2608)))

(assert (=> d!154393 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631622 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631805)))

(declare-fun b!1435249 () Bool)

(assert (=> b!1435249 (= e!810043 (Intermediate!11381 false lt!631622 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435250 () Bool)

(assert (=> b!1435250 (= e!810043 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631622 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) (select (arr!47102 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154393 c!132990) b!1435243))

(assert (= (and d!154393 (not c!132990)) b!1435248))

(assert (= (and b!1435248 c!132991) b!1435249))

(assert (= (and b!1435248 (not c!132991)) b!1435250))

(assert (= (and d!154393 c!132992) b!1435244))

(assert (= (and d!154393 (not c!132992)) b!1435246))

(assert (= (and b!1435246 res!968268) b!1435242))

(assert (= (and b!1435242 (not res!968270)) b!1435245))

(assert (= (and b!1435245 (not res!968269)) b!1435247))

(declare-fun m!1324639 () Bool)

(assert (=> b!1435247 m!1324639))

(assert (=> b!1435245 m!1324639))

(assert (=> b!1435242 m!1324639))

(declare-fun m!1324641 () Bool)

(assert (=> b!1435250 m!1324641))

(assert (=> b!1435250 m!1324641))

(assert (=> b!1435250 m!1324293))

(declare-fun m!1324643 () Bool)

(assert (=> b!1435250 m!1324643))

(declare-fun m!1324645 () Bool)

(assert (=> d!154393 m!1324645))

(assert (=> d!154393 m!1324327))

(assert (=> b!1434798 d!154393))

(declare-fun b!1435251 () Bool)

(declare-fun e!810044 () Bool)

(declare-fun call!67561 () Bool)

(assert (=> b!1435251 (= e!810044 call!67561)))

(declare-fun bm!67558 () Bool)

(assert (=> bm!67558 (= call!67561 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun d!154395 () Bool)

(declare-fun res!968271 () Bool)

(declare-fun e!810045 () Bool)

(assert (=> d!154395 (=> res!968271 e!810045)))

(assert (=> d!154395 (= res!968271 (bvsge #b00000000000000000000000000000000 (size!47652 a!2831)))))

(assert (=> d!154395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!810045)))

(declare-fun b!1435252 () Bool)

(declare-fun e!810046 () Bool)

(assert (=> b!1435252 (= e!810046 call!67561)))

(declare-fun b!1435253 () Bool)

(assert (=> b!1435253 (= e!810045 e!810046)))

(declare-fun c!132993 () Bool)

(assert (=> b!1435253 (= c!132993 (validKeyInArray!0 (select (arr!47102 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1435254 () Bool)

(assert (=> b!1435254 (= e!810046 e!810044)))

(declare-fun lt!631808 () (_ BitVec 64))

(assert (=> b!1435254 (= lt!631808 (select (arr!47102 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631806 () Unit!48508)

(assert (=> b!1435254 (= lt!631806 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631808 #b00000000000000000000000000000000))))

(assert (=> b!1435254 (arrayContainsKey!0 a!2831 lt!631808 #b00000000000000000000000000000000)))

(declare-fun lt!631807 () Unit!48508)

(assert (=> b!1435254 (= lt!631807 lt!631806)))

(declare-fun res!968272 () Bool)

(assert (=> b!1435254 (= res!968272 (= (seekEntryOrOpen!0 (select (arr!47102 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11381 #b00000000000000000000000000000000)))))

(assert (=> b!1435254 (=> (not res!968272) (not e!810044))))

(assert (= (and d!154395 (not res!968271)) b!1435253))

(assert (= (and b!1435253 c!132993) b!1435254))

(assert (= (and b!1435253 (not c!132993)) b!1435252))

(assert (= (and b!1435254 res!968272) b!1435251))

(assert (= (or b!1435251 b!1435252) bm!67558))

(declare-fun m!1324647 () Bool)

(assert (=> bm!67558 m!1324647))

(assert (=> b!1435253 m!1324631))

(assert (=> b!1435253 m!1324631))

(assert (=> b!1435253 m!1324633))

(assert (=> b!1435254 m!1324631))

(declare-fun m!1324649 () Bool)

(assert (=> b!1435254 m!1324649))

(declare-fun m!1324651 () Bool)

(assert (=> b!1435254 m!1324651))

(assert (=> b!1435254 m!1324631))

(declare-fun m!1324653 () Bool)

(assert (=> b!1435254 m!1324653))

(assert (=> b!1434809 d!154395))

(declare-fun b!1435256 () Bool)

(declare-fun e!810047 () SeekEntryResult!11381)

(assert (=> b!1435256 (= e!810047 (Intermediate!11381 true index!585 x!605))))

(declare-fun b!1435257 () Bool)

(declare-fun e!810049 () Bool)

(declare-fun lt!631810 () SeekEntryResult!11381)

(assert (=> b!1435257 (= e!810049 (bvsge (x!129578 lt!631810) #b01111111111111111111111111111110))))

(declare-fun b!1435258 () Bool)

(assert (=> b!1435258 (and (bvsge (index!47918 lt!631810) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631810) (size!47652 a!2831)))))

(declare-fun res!968274 () Bool)

(assert (=> b!1435258 (= res!968274 (= (select (arr!47102 a!2831) (index!47918 lt!631810)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810048 () Bool)

(assert (=> b!1435258 (=> res!968274 e!810048)))

(declare-fun b!1435259 () Bool)

(declare-fun e!810050 () Bool)

(assert (=> b!1435259 (= e!810049 e!810050)))

(declare-fun res!968273 () Bool)

(assert (=> b!1435259 (= res!968273 (and (is-Intermediate!11381 lt!631810) (not (undefined!12193 lt!631810)) (bvslt (x!129578 lt!631810) #b01111111111111111111111111111110) (bvsge (x!129578 lt!631810) #b00000000000000000000000000000000) (bvsge (x!129578 lt!631810) x!605)))))

(assert (=> b!1435259 (=> (not res!968273) (not e!810050))))

(declare-fun b!1435260 () Bool)

(assert (=> b!1435260 (and (bvsge (index!47918 lt!631810) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631810) (size!47652 a!2831)))))

(assert (=> b!1435260 (= e!810048 (= (select (arr!47102 a!2831) (index!47918 lt!631810)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435261 () Bool)

(declare-fun e!810051 () SeekEntryResult!11381)

(assert (=> b!1435261 (= e!810047 e!810051)))

(declare-fun lt!631809 () (_ BitVec 64))

(declare-fun c!132995 () Bool)

(assert (=> b!1435261 (= c!132995 (or (= lt!631809 (select (arr!47102 a!2831) j!81)) (= (bvadd lt!631809 lt!631809) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435255 () Bool)

(assert (=> b!1435255 (and (bvsge (index!47918 lt!631810) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631810) (size!47652 a!2831)))))

(declare-fun res!968275 () Bool)

(assert (=> b!1435255 (= res!968275 (= (select (arr!47102 a!2831) (index!47918 lt!631810)) (select (arr!47102 a!2831) j!81)))))

(assert (=> b!1435255 (=> res!968275 e!810048)))

(assert (=> b!1435255 (= e!810050 e!810048)))

(declare-fun d!154397 () Bool)

(assert (=> d!154397 e!810049))

(declare-fun c!132996 () Bool)

(assert (=> d!154397 (= c!132996 (and (is-Intermediate!11381 lt!631810) (undefined!12193 lt!631810)))))

(assert (=> d!154397 (= lt!631810 e!810047)))

(declare-fun c!132994 () Bool)

(assert (=> d!154397 (= c!132994 (bvsge x!605 #b01111111111111111111111111111110))))

(assert (=> d!154397 (= lt!631809 (select (arr!47102 a!2831) index!585))))

(assert (=> d!154397 (validMask!0 mask!2608)))

(assert (=> d!154397 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47102 a!2831) j!81) a!2831 mask!2608) lt!631810)))

(declare-fun b!1435262 () Bool)

(assert (=> b!1435262 (= e!810051 (Intermediate!11381 false index!585 x!605))))

(declare-fun b!1435263 () Bool)

(assert (=> b!1435263 (= e!810051 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47102 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and d!154397 c!132994) b!1435256))

(assert (= (and d!154397 (not c!132994)) b!1435261))

(assert (= (and b!1435261 c!132995) b!1435262))

(assert (= (and b!1435261 (not c!132995)) b!1435263))

(assert (= (and d!154397 c!132996) b!1435257))

(assert (= (and d!154397 (not c!132996)) b!1435259))

(assert (= (and b!1435259 res!968273) b!1435255))

(assert (= (and b!1435255 (not res!968275)) b!1435258))

(assert (= (and b!1435258 (not res!968274)) b!1435260))

(declare-fun m!1324655 () Bool)

(assert (=> b!1435260 m!1324655))

(assert (=> b!1435258 m!1324655))

(assert (=> b!1435255 m!1324655))

(assert (=> b!1435263 m!1324309))

(assert (=> b!1435263 m!1324309))

(assert (=> b!1435263 m!1324293))

(declare-fun m!1324657 () Bool)

(assert (=> b!1435263 m!1324657))

(assert (=> d!154397 m!1324335))

(assert (=> d!154397 m!1324327))

(assert (=> b!1434808 d!154397))

(declare-fun b!1435265 () Bool)

(declare-fun e!810052 () SeekEntryResult!11381)

(assert (=> b!1435265 (= e!810052 (Intermediate!11381 true lt!631622 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435266 () Bool)

(declare-fun e!810054 () Bool)

(declare-fun lt!631812 () SeekEntryResult!11381)

(assert (=> b!1435266 (= e!810054 (bvsge (x!129578 lt!631812) #b01111111111111111111111111111110))))

(declare-fun b!1435267 () Bool)

(assert (=> b!1435267 (and (bvsge (index!47918 lt!631812) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631812) (size!47652 lt!631620)))))

(declare-fun res!968277 () Bool)

(assert (=> b!1435267 (= res!968277 (= (select (arr!47102 lt!631620) (index!47918 lt!631812)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!810053 () Bool)

(assert (=> b!1435267 (=> res!968277 e!810053)))

(declare-fun b!1435268 () Bool)

(declare-fun e!810055 () Bool)

(assert (=> b!1435268 (= e!810054 e!810055)))

(declare-fun res!968276 () Bool)

(assert (=> b!1435268 (= res!968276 (and (is-Intermediate!11381 lt!631812) (not (undefined!12193 lt!631812)) (bvslt (x!129578 lt!631812) #b01111111111111111111111111111110) (bvsge (x!129578 lt!631812) #b00000000000000000000000000000000) (bvsge (x!129578 lt!631812) (bvadd #b00000000000000000000000000000001 x!605))))))

(assert (=> b!1435268 (=> (not res!968276) (not e!810055))))

(declare-fun b!1435269 () Bool)

(assert (=> b!1435269 (and (bvsge (index!47918 lt!631812) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631812) (size!47652 lt!631620)))))

(assert (=> b!1435269 (= e!810053 (= (select (arr!47102 lt!631620) (index!47918 lt!631812)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1435270 () Bool)

(declare-fun e!810056 () SeekEntryResult!11381)

(assert (=> b!1435270 (= e!810052 e!810056)))

(declare-fun c!132998 () Bool)

(declare-fun lt!631811 () (_ BitVec 64))

(assert (=> b!1435270 (= c!132998 (or (= lt!631811 lt!631623) (= (bvadd lt!631811 lt!631811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1435264 () Bool)

(assert (=> b!1435264 (and (bvsge (index!47918 lt!631812) #b00000000000000000000000000000000) (bvslt (index!47918 lt!631812) (size!47652 lt!631620)))))

(declare-fun res!968278 () Bool)

(assert (=> b!1435264 (= res!968278 (= (select (arr!47102 lt!631620) (index!47918 lt!631812)) lt!631623))))

(assert (=> b!1435264 (=> res!968278 e!810053)))

(assert (=> b!1435264 (= e!810055 e!810053)))

(declare-fun d!154399 () Bool)

(assert (=> d!154399 e!810054))

(declare-fun c!132999 () Bool)

(assert (=> d!154399 (= c!132999 (and (is-Intermediate!11381 lt!631812) (undefined!12193 lt!631812)))))

(assert (=> d!154399 (= lt!631812 e!810052)))

(declare-fun c!132997 () Bool)

(assert (=> d!154399 (= c!132997 (bvsge (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110))))

(assert (=> d!154399 (= lt!631811 (select (arr!47102 lt!631620) lt!631622))))

(assert (=> d!154399 (validMask!0 mask!2608)))

(assert (=> d!154399 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631622 lt!631623 lt!631620 mask!2608) lt!631812)))

(declare-fun b!1435271 () Bool)

(assert (=> b!1435271 (= e!810056 (Intermediate!11381 false lt!631622 (bvadd #b00000000000000000000000000000001 x!605)))))

(declare-fun b!1435272 () Bool)

(assert (=> b!1435272 (= e!810056 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605 #b00000000000000000000000000000001) (nextIndex!0 lt!631622 (bvadd #b00000000000000000000000000000001 x!605) mask!2608) lt!631623 lt!631620 mask!2608))))

(assert (= (and d!154399 c!132997) b!1435265))

(assert (= (and d!154399 (not c!132997)) b!1435270))

(assert (= (and b!1435270 c!132998) b!1435271))

(assert (= (and b!1435270 (not c!132998)) b!1435272))

(assert (= (and d!154399 c!132999) b!1435266))

(assert (= (and d!154399 (not c!132999)) b!1435268))

(assert (= (and b!1435268 res!968276) b!1435264))

(assert (= (and b!1435264 (not res!968278)) b!1435267))

(assert (= (and b!1435267 (not res!968277)) b!1435269))

(declare-fun m!1324659 () Bool)

(assert (=> b!1435269 m!1324659))

(assert (=> b!1435267 m!1324659))

(assert (=> b!1435264 m!1324659))

(assert (=> b!1435272 m!1324641))

(assert (=> b!1435272 m!1324641))

(declare-fun m!1324661 () Bool)

(assert (=> b!1435272 m!1324661))

(declare-fun m!1324663 () Bool)

(assert (=> d!154399 m!1324663))

(assert (=> d!154399 m!1324327))

(assert (=> b!1434807 d!154399))

(push 1)

(assert (not b!1435166))

(assert (not bm!67558))

(assert (not b!1435023))

(assert (not b!1435022))

(assert (not b!1435263))

(assert (not d!154393))

(assert (not b!1435240))

(assert (not d!154389))

(assert (not d!154381))

(assert (not b!1435184))

(assert (not d!154399))

(assert (not d!154375))

(assert (not b!1435272))

(assert (not b!1435175))

(assert (not d!154337))

(assert (not b!1435238))

(assert (not b!1435253))

(assert (not d!154335))

(assert (not bm!67557))

(assert (not b!1435221))

(assert (not d!154397))

(assert (not b!1435250))

(assert (not b!1435254))

(assert (not d!154371))

(assert (not b!1435239))

(assert (not bm!67549))

(check-sat)

(pop 1)

(push 1)

(check-sat)

