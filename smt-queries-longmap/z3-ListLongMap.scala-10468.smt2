; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123080 () Bool)

(assert start!123080)

(declare-fun b!1427310 () Bool)

(declare-fun e!806182 () Bool)

(declare-fun e!806179 () Bool)

(assert (=> b!1427310 (= e!806182 e!806179)))

(declare-fun res!962352 () Bool)

(assert (=> b!1427310 (=> (not res!962352) (not e!806179))))

(declare-datatypes ((array!97343 0))(
  ( (array!97344 (arr!46986 (Array (_ BitVec 32) (_ BitVec 64))) (size!47536 (_ BitVec 32))) )
))
(declare-fun lt!628524 () array!97343)

(declare-datatypes ((SeekEntryResult!11265 0))(
  ( (MissingZero!11265 (index!47452 (_ BitVec 32))) (Found!11265 (index!47453 (_ BitVec 32))) (Intermediate!11265 (undefined!12077 Bool) (index!47454 (_ BitVec 32)) (x!129087 (_ BitVec 32))) (Undefined!11265) (MissingVacant!11265 (index!47455 (_ BitVec 32))) )
))
(declare-fun lt!628520 () SeekEntryResult!11265)

(declare-fun lt!628523 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97343 (_ BitVec 32)) SeekEntryResult!11265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427310 (= res!962352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628523 mask!2608) lt!628523 lt!628524 mask!2608) lt!628520))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427310 (= lt!628520 (Intermediate!11265 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97343)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427310 (= lt!628523 (select (store (arr!46986 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427310 (= lt!628524 (array!97344 (store (arr!46986 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47536 a!2831)))))

(declare-fun res!962350 () Bool)

(declare-fun e!806180 () Bool)

(assert (=> start!123080 (=> (not res!962350) (not e!806180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123080 (= res!962350 (validMask!0 mask!2608))))

(assert (=> start!123080 e!806180))

(assert (=> start!123080 true))

(declare-fun array_inv!36014 (array!97343) Bool)

(assert (=> start!123080 (array_inv!36014 a!2831)))

(declare-fun b!1427311 () Bool)

(declare-fun res!962345 () Bool)

(assert (=> b!1427311 (=> (not res!962345) (not e!806180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427311 (= res!962345 (validKeyInArray!0 (select (arr!46986 a!2831) j!81)))))

(declare-fun b!1427312 () Bool)

(assert (=> b!1427312 (= e!806180 e!806182)))

(declare-fun res!962342 () Bool)

(assert (=> b!1427312 (=> (not res!962342) (not e!806182))))

(declare-fun lt!628521 () SeekEntryResult!11265)

(assert (=> b!1427312 (= res!962342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46986 a!2831) j!81) mask!2608) (select (arr!46986 a!2831) j!81) a!2831 mask!2608) lt!628521))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427312 (= lt!628521 (Intermediate!11265 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427313 () Bool)

(declare-fun res!962347 () Bool)

(assert (=> b!1427313 (=> (not res!962347) (not e!806180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97343 (_ BitVec 32)) Bool)

(assert (=> b!1427313 (= res!962347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427314 () Bool)

(declare-fun res!962349 () Bool)

(assert (=> b!1427314 (=> (not res!962349) (not e!806180))))

(assert (=> b!1427314 (= res!962349 (and (= (size!47536 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47536 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47536 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427315 () Bool)

(declare-fun res!962353 () Bool)

(assert (=> b!1427315 (=> (not res!962353) (not e!806179))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427315 (= res!962353 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46986 a!2831) j!81) a!2831 mask!2608) lt!628521))))

(declare-fun b!1427316 () Bool)

(declare-fun res!962343 () Bool)

(assert (=> b!1427316 (=> (not res!962343) (not e!806180))))

(declare-datatypes ((List!33496 0))(
  ( (Nil!33493) (Cons!33492 (h!34800 (_ BitVec 64)) (t!48190 List!33496)) )
))
(declare-fun arrayNoDuplicates!0 (array!97343 (_ BitVec 32) List!33496) Bool)

(assert (=> b!1427316 (= res!962343 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33493))))

(declare-fun b!1427317 () Bool)

(declare-fun res!962344 () Bool)

(assert (=> b!1427317 (=> (not res!962344) (not e!806179))))

(assert (=> b!1427317 (= res!962344 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628523 lt!628524 mask!2608) lt!628520))))

(declare-fun b!1427318 () Bool)

(assert (=> b!1427318 (= e!806179 (not true))))

(declare-fun e!806183 () Bool)

(assert (=> b!1427318 e!806183))

(declare-fun res!962341 () Bool)

(assert (=> b!1427318 (=> (not res!962341) (not e!806183))))

(assert (=> b!1427318 (= res!962341 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48276 0))(
  ( (Unit!48277) )
))
(declare-fun lt!628522 () Unit!48276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48276)

(assert (=> b!1427318 (= lt!628522 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427319 () Bool)

(declare-fun res!962346 () Bool)

(assert (=> b!1427319 (=> (not res!962346) (not e!806180))))

(assert (=> b!1427319 (= res!962346 (validKeyInArray!0 (select (arr!46986 a!2831) i!982)))))

(declare-fun b!1427320 () Bool)

(declare-fun res!962348 () Bool)

(assert (=> b!1427320 (=> (not res!962348) (not e!806180))))

(assert (=> b!1427320 (= res!962348 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47536 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47536 a!2831))))))

(declare-fun b!1427321 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97343 (_ BitVec 32)) SeekEntryResult!11265)

(assert (=> b!1427321 (= e!806183 (= (seekEntryOrOpen!0 (select (arr!46986 a!2831) j!81) a!2831 mask!2608) (Found!11265 j!81)))))

(declare-fun b!1427322 () Bool)

(declare-fun res!962351 () Bool)

(assert (=> b!1427322 (=> (not res!962351) (not e!806179))))

(assert (=> b!1427322 (= res!962351 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!123080 res!962350) b!1427314))

(assert (= (and b!1427314 res!962349) b!1427319))

(assert (= (and b!1427319 res!962346) b!1427311))

(assert (= (and b!1427311 res!962345) b!1427313))

(assert (= (and b!1427313 res!962347) b!1427316))

(assert (= (and b!1427316 res!962343) b!1427320))

(assert (= (and b!1427320 res!962348) b!1427312))

(assert (= (and b!1427312 res!962342) b!1427310))

(assert (= (and b!1427310 res!962352) b!1427315))

(assert (= (and b!1427315 res!962353) b!1427317))

(assert (= (and b!1427317 res!962344) b!1427322))

(assert (= (and b!1427322 res!962351) b!1427318))

(assert (= (and b!1427318 res!962341) b!1427321))

(declare-fun m!1317683 () Bool)

(assert (=> b!1427315 m!1317683))

(assert (=> b!1427315 m!1317683))

(declare-fun m!1317685 () Bool)

(assert (=> b!1427315 m!1317685))

(declare-fun m!1317687 () Bool)

(assert (=> b!1427313 m!1317687))

(assert (=> b!1427311 m!1317683))

(assert (=> b!1427311 m!1317683))

(declare-fun m!1317689 () Bool)

(assert (=> b!1427311 m!1317689))

(declare-fun m!1317691 () Bool)

(assert (=> b!1427310 m!1317691))

(assert (=> b!1427310 m!1317691))

(declare-fun m!1317693 () Bool)

(assert (=> b!1427310 m!1317693))

(declare-fun m!1317695 () Bool)

(assert (=> b!1427310 m!1317695))

(declare-fun m!1317697 () Bool)

(assert (=> b!1427310 m!1317697))

(assert (=> b!1427321 m!1317683))

(assert (=> b!1427321 m!1317683))

(declare-fun m!1317699 () Bool)

(assert (=> b!1427321 m!1317699))

(declare-fun m!1317701 () Bool)

(assert (=> b!1427318 m!1317701))

(declare-fun m!1317703 () Bool)

(assert (=> b!1427318 m!1317703))

(declare-fun m!1317705 () Bool)

(assert (=> b!1427319 m!1317705))

(assert (=> b!1427319 m!1317705))

(declare-fun m!1317707 () Bool)

(assert (=> b!1427319 m!1317707))

(declare-fun m!1317709 () Bool)

(assert (=> b!1427317 m!1317709))

(declare-fun m!1317711 () Bool)

(assert (=> start!123080 m!1317711))

(declare-fun m!1317713 () Bool)

(assert (=> start!123080 m!1317713))

(assert (=> b!1427312 m!1317683))

(assert (=> b!1427312 m!1317683))

(declare-fun m!1317715 () Bool)

(assert (=> b!1427312 m!1317715))

(assert (=> b!1427312 m!1317715))

(assert (=> b!1427312 m!1317683))

(declare-fun m!1317717 () Bool)

(assert (=> b!1427312 m!1317717))

(declare-fun m!1317719 () Bool)

(assert (=> b!1427316 m!1317719))

(check-sat (not b!1427311) (not b!1427313) (not b!1427317) (not b!1427321) (not b!1427318) (not b!1427315) (not b!1427310) (not start!123080) (not b!1427312) (not b!1427316) (not b!1427319))
(check-sat)
