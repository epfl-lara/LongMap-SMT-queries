; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123946 () Bool)

(assert start!123946)

(declare-fun b!1435316 () Bool)

(declare-fun e!810239 () Bool)

(declare-fun e!810235 () Bool)

(assert (=> b!1435316 (= e!810239 (not e!810235))))

(declare-fun res!967945 () Bool)

(assert (=> b!1435316 (=> res!967945 e!810235)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97685 0))(
  ( (array!97686 (arr!47143 (Array (_ BitVec 32) (_ BitVec 64))) (size!47694 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97685)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435316 (= res!967945 (or (= (select (arr!47143 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47143 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47143 a!2831) index!585) (select (arr!47143 a!2831) j!81)) (= (select (store (arr!47143 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810237 () Bool)

(assert (=> b!1435316 e!810237))

(declare-fun res!967949 () Bool)

(assert (=> b!1435316 (=> (not res!967949) (not e!810237))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97685 (_ BitVec 32)) Bool)

(assert (=> b!1435316 (= res!967949 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48425 0))(
  ( (Unit!48426) )
))
(declare-fun lt!631758 () Unit!48425)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48425)

(assert (=> b!1435316 (= lt!631758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435317 () Bool)

(declare-datatypes ((SeekEntryResult!11324 0))(
  ( (MissingZero!11324 (index!47688 (_ BitVec 32))) (Found!11324 (index!47689 (_ BitVec 32))) (Intermediate!11324 (undefined!12136 Bool) (index!47690 (_ BitVec 32)) (x!129504 (_ BitVec 32))) (Undefined!11324) (MissingVacant!11324 (index!47691 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97685 (_ BitVec 32)) SeekEntryResult!11324)

(assert (=> b!1435317 (= e!810237 (= (seekEntryOrOpen!0 (select (arr!47143 a!2831) j!81) a!2831 mask!2608) (Found!11324 j!81)))))

(declare-fun b!1435318 () Bool)

(declare-fun res!967946 () Bool)

(declare-fun e!810238 () Bool)

(assert (=> b!1435318 (=> (not res!967946) (not e!810238))))

(declare-datatypes ((List!33640 0))(
  ( (Nil!33637) (Cons!33636 (h!34976 (_ BitVec 64)) (t!48326 List!33640)) )
))
(declare-fun arrayNoDuplicates!0 (array!97685 (_ BitVec 32) List!33640) Bool)

(assert (=> b!1435318 (= res!967946 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33637))))

(declare-fun b!1435319 () Bool)

(declare-fun e!810234 () Bool)

(assert (=> b!1435319 (= e!810234 e!810239)))

(declare-fun res!967954 () Bool)

(assert (=> b!1435319 (=> (not res!967954) (not e!810239))))

(declare-fun lt!631755 () SeekEntryResult!11324)

(declare-fun lt!631756 () (_ BitVec 64))

(declare-fun lt!631760 () array!97685)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97685 (_ BitVec 32)) SeekEntryResult!11324)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435319 (= res!967954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631756 mask!2608) lt!631756 lt!631760 mask!2608) lt!631755))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435319 (= lt!631755 (Intermediate!11324 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435319 (= lt!631756 (select (store (arr!47143 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435319 (= lt!631760 (array!97686 (store (arr!47143 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47694 a!2831)))))

(declare-fun b!1435320 () Bool)

(declare-fun res!967947 () Bool)

(assert (=> b!1435320 (=> (not res!967947) (not e!810238))))

(assert (=> b!1435320 (= res!967947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435321 () Bool)

(assert (=> b!1435321 (= e!810235 true)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!631757 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435321 (= lt!631757 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1435322 () Bool)

(assert (=> b!1435322 (= e!810238 e!810234)))

(declare-fun res!967944 () Bool)

(assert (=> b!1435322 (=> (not res!967944) (not e!810234))))

(declare-fun lt!631759 () SeekEntryResult!11324)

(assert (=> b!1435322 (= res!967944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47143 a!2831) j!81) mask!2608) (select (arr!47143 a!2831) j!81) a!2831 mask!2608) lt!631759))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435322 (= lt!631759 (Intermediate!11324 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435323 () Bool)

(declare-fun res!967948 () Bool)

(assert (=> b!1435323 (=> (not res!967948) (not e!810239))))

(assert (=> b!1435323 (= res!967948 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47143 a!2831) j!81) a!2831 mask!2608) lt!631759))))

(declare-fun b!1435324 () Bool)

(declare-fun res!967951 () Bool)

(assert (=> b!1435324 (=> (not res!967951) (not e!810238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435324 (= res!967951 (validKeyInArray!0 (select (arr!47143 a!2831) i!982)))))

(declare-fun b!1435325 () Bool)

(declare-fun res!967943 () Bool)

(assert (=> b!1435325 (=> (not res!967943) (not e!810239))))

(assert (=> b!1435325 (= res!967943 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631756 lt!631760 mask!2608) lt!631755))))

(declare-fun res!967952 () Bool)

(assert (=> start!123946 (=> (not res!967952) (not e!810238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123946 (= res!967952 (validMask!0 mask!2608))))

(assert (=> start!123946 e!810238))

(assert (=> start!123946 true))

(declare-fun array_inv!36424 (array!97685) Bool)

(assert (=> start!123946 (array_inv!36424 a!2831)))

(declare-fun b!1435326 () Bool)

(declare-fun res!967953 () Bool)

(assert (=> b!1435326 (=> (not res!967953) (not e!810238))))

(assert (=> b!1435326 (= res!967953 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47694 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47694 a!2831))))))

(declare-fun b!1435327 () Bool)

(declare-fun res!967942 () Bool)

(assert (=> b!1435327 (=> (not res!967942) (not e!810239))))

(assert (=> b!1435327 (= res!967942 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435328 () Bool)

(declare-fun res!967941 () Bool)

(assert (=> b!1435328 (=> (not res!967941) (not e!810238))))

(assert (=> b!1435328 (= res!967941 (validKeyInArray!0 (select (arr!47143 a!2831) j!81)))))

(declare-fun b!1435329 () Bool)

(declare-fun res!967950 () Bool)

(assert (=> b!1435329 (=> (not res!967950) (not e!810238))))

(assert (=> b!1435329 (= res!967950 (and (= (size!47694 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47694 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47694 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123946 res!967952) b!1435329))

(assert (= (and b!1435329 res!967950) b!1435324))

(assert (= (and b!1435324 res!967951) b!1435328))

(assert (= (and b!1435328 res!967941) b!1435320))

(assert (= (and b!1435320 res!967947) b!1435318))

(assert (= (and b!1435318 res!967946) b!1435326))

(assert (= (and b!1435326 res!967953) b!1435322))

(assert (= (and b!1435322 res!967944) b!1435319))

(assert (= (and b!1435319 res!967954) b!1435323))

(assert (= (and b!1435323 res!967948) b!1435325))

(assert (= (and b!1435325 res!967943) b!1435327))

(assert (= (and b!1435327 res!967942) b!1435316))

(assert (= (and b!1435316 res!967949) b!1435317))

(assert (= (and b!1435316 (not res!967945)) b!1435321))

(declare-fun m!1325035 () Bool)

(assert (=> b!1435328 m!1325035))

(assert (=> b!1435328 m!1325035))

(declare-fun m!1325037 () Bool)

(assert (=> b!1435328 m!1325037))

(declare-fun m!1325039 () Bool)

(assert (=> b!1435321 m!1325039))

(declare-fun m!1325041 () Bool)

(assert (=> b!1435324 m!1325041))

(assert (=> b!1435324 m!1325041))

(declare-fun m!1325043 () Bool)

(assert (=> b!1435324 m!1325043))

(assert (=> b!1435323 m!1325035))

(assert (=> b!1435323 m!1325035))

(declare-fun m!1325045 () Bool)

(assert (=> b!1435323 m!1325045))

(declare-fun m!1325047 () Bool)

(assert (=> start!123946 m!1325047))

(declare-fun m!1325049 () Bool)

(assert (=> start!123946 m!1325049))

(declare-fun m!1325051 () Bool)

(assert (=> b!1435320 m!1325051))

(declare-fun m!1325053 () Bool)

(assert (=> b!1435325 m!1325053))

(assert (=> b!1435317 m!1325035))

(assert (=> b!1435317 m!1325035))

(declare-fun m!1325055 () Bool)

(assert (=> b!1435317 m!1325055))

(declare-fun m!1325057 () Bool)

(assert (=> b!1435319 m!1325057))

(assert (=> b!1435319 m!1325057))

(declare-fun m!1325059 () Bool)

(assert (=> b!1435319 m!1325059))

(declare-fun m!1325061 () Bool)

(assert (=> b!1435319 m!1325061))

(declare-fun m!1325063 () Bool)

(assert (=> b!1435319 m!1325063))

(assert (=> b!1435322 m!1325035))

(assert (=> b!1435322 m!1325035))

(declare-fun m!1325065 () Bool)

(assert (=> b!1435322 m!1325065))

(assert (=> b!1435322 m!1325065))

(assert (=> b!1435322 m!1325035))

(declare-fun m!1325067 () Bool)

(assert (=> b!1435322 m!1325067))

(assert (=> b!1435316 m!1325061))

(declare-fun m!1325069 () Bool)

(assert (=> b!1435316 m!1325069))

(declare-fun m!1325071 () Bool)

(assert (=> b!1435316 m!1325071))

(declare-fun m!1325073 () Bool)

(assert (=> b!1435316 m!1325073))

(assert (=> b!1435316 m!1325035))

(declare-fun m!1325075 () Bool)

(assert (=> b!1435316 m!1325075))

(declare-fun m!1325077 () Bool)

(assert (=> b!1435318 m!1325077))

(check-sat (not b!1435316) (not b!1435318) (not b!1435321) (not b!1435325) (not b!1435320) (not b!1435319) (not b!1435323) (not b!1435324) (not b!1435322) (not start!123946) (not b!1435328) (not b!1435317))
(check-sat)
