; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125574 () Bool)

(assert start!125574)

(declare-fun b!1469319 () Bool)

(declare-fun e!824900 () Bool)

(declare-fun e!824899 () Bool)

(assert (=> b!1469319 (= e!824900 e!824899)))

(declare-fun res!997830 () Bool)

(assert (=> b!1469319 (=> (not res!997830) (not e!824899))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12039 0))(
  ( (MissingZero!12039 (index!50548 (_ BitVec 32))) (Found!12039 (index!50549 (_ BitVec 32))) (Intermediate!12039 (undefined!12851 Bool) (index!50550 (_ BitVec 32)) (x!132128 (_ BitVec 32))) (Undefined!12039) (MissingVacant!12039 (index!50551 (_ BitVec 32))) )
))
(declare-fun lt!642516 () SeekEntryResult!12039)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469319 (= res!997830 (= lt!642516 (Intermediate!12039 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99022 0))(
  ( (array!99023 (arr!47799 (Array (_ BitVec 32) (_ BitVec 64))) (size!48349 (_ BitVec 32))) )
))
(declare-fun lt!642517 () array!99022)

(declare-fun lt!642518 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99022 (_ BitVec 32)) SeekEntryResult!12039)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469319 (= lt!642516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642518 mask!2687) lt!642518 lt!642517 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99022)

(assert (=> b!1469319 (= lt!642518 (select (store (arr!47799 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469320 () Bool)

(declare-fun res!997832 () Bool)

(declare-fun e!824898 () Bool)

(assert (=> b!1469320 (=> (not res!997832) (not e!824898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469320 (= res!997832 (validKeyInArray!0 (select (arr!47799 a!2862) j!93)))))

(declare-fun b!1469321 () Bool)

(declare-fun res!997837 () Bool)

(assert (=> b!1469321 (=> (not res!997837) (not e!824900))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642515 () SeekEntryResult!12039)

(assert (=> b!1469321 (= res!997837 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47799 a!2862) j!93) a!2862 mask!2687) lt!642515))))

(declare-fun b!1469322 () Bool)

(declare-fun e!824902 () Bool)

(assert (=> b!1469322 (= e!824898 e!824902)))

(declare-fun res!997840 () Bool)

(assert (=> b!1469322 (=> (not res!997840) (not e!824902))))

(assert (=> b!1469322 (= res!997840 (= (select (store (arr!47799 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469322 (= lt!642517 (array!99023 (store (arr!47799 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48349 a!2862)))))

(declare-fun e!824903 () Bool)

(declare-fun b!1469323 () Bool)

(assert (=> b!1469323 (= e!824903 (not (= lt!642516 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642518 lt!642517 mask!2687))))))

(declare-fun b!1469324 () Bool)

(assert (=> b!1469324 (= e!824902 e!824900)))

(declare-fun res!997838 () Bool)

(assert (=> b!1469324 (=> (not res!997838) (not e!824900))))

(assert (=> b!1469324 (= res!997838 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47799 a!2862) j!93) mask!2687) (select (arr!47799 a!2862) j!93) a!2862 mask!2687) lt!642515))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469324 (= lt!642515 (Intermediate!12039 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469326 () Bool)

(declare-fun res!997831 () Bool)

(assert (=> b!1469326 (=> (not res!997831) (not e!824898))))

(assert (=> b!1469326 (= res!997831 (and (= (size!48349 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48349 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48349 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469327 () Bool)

(declare-fun res!997835 () Bool)

(assert (=> b!1469327 (=> (not res!997835) (not e!824898))))

(assert (=> b!1469327 (= res!997835 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48349 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48349 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48349 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469328 () Bool)

(declare-fun res!997834 () Bool)

(assert (=> b!1469328 (=> (not res!997834) (not e!824898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99022 (_ BitVec 32)) Bool)

(assert (=> b!1469328 (= res!997834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469329 () Bool)

(declare-fun res!997839 () Bool)

(assert (=> b!1469329 (=> (not res!997839) (not e!824898))))

(assert (=> b!1469329 (= res!997839 (validKeyInArray!0 (select (arr!47799 a!2862) i!1006)))))

(declare-fun res!997833 () Bool)

(assert (=> start!125574 (=> (not res!997833) (not e!824898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125574 (= res!997833 (validMask!0 mask!2687))))

(assert (=> start!125574 e!824898))

(assert (=> start!125574 true))

(declare-fun array_inv!36827 (array!99022) Bool)

(assert (=> start!125574 (array_inv!36827 a!2862)))

(declare-fun b!1469325 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99022 (_ BitVec 32)) SeekEntryResult!12039)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99022 (_ BitVec 32)) SeekEntryResult!12039)

(assert (=> b!1469325 (= e!824903 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642518 lt!642517 mask!2687) (seekEntryOrOpen!0 lt!642518 lt!642517 mask!2687))))))

(declare-fun b!1469330 () Bool)

(declare-fun res!997836 () Bool)

(assert (=> b!1469330 (=> (not res!997836) (not e!824898))))

(declare-datatypes ((List!34300 0))(
  ( (Nil!34297) (Cons!34296 (h!35646 (_ BitVec 64)) (t!48994 List!34300)) )
))
(declare-fun arrayNoDuplicates!0 (array!99022 (_ BitVec 32) List!34300) Bool)

(assert (=> b!1469330 (= res!997836 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34297))))

(declare-fun b!1469331 () Bool)

(assert (=> b!1469331 (= e!824899 false)))

(declare-fun lt!642519 () Bool)

(assert (=> b!1469331 (= lt!642519 e!824903)))

(declare-fun c!135255 () Bool)

(assert (=> b!1469331 (= c!135255 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125574 res!997833) b!1469326))

(assert (= (and b!1469326 res!997831) b!1469329))

(assert (= (and b!1469329 res!997839) b!1469320))

(assert (= (and b!1469320 res!997832) b!1469328))

(assert (= (and b!1469328 res!997834) b!1469330))

(assert (= (and b!1469330 res!997836) b!1469327))

(assert (= (and b!1469327 res!997835) b!1469322))

(assert (= (and b!1469322 res!997840) b!1469324))

(assert (= (and b!1469324 res!997838) b!1469321))

(assert (= (and b!1469321 res!997837) b!1469319))

(assert (= (and b!1469319 res!997830) b!1469331))

(assert (= (and b!1469331 c!135255) b!1469323))

(assert (= (and b!1469331 (not c!135255)) b!1469325))

(declare-fun m!1356501 () Bool)

(assert (=> b!1469322 m!1356501))

(declare-fun m!1356503 () Bool)

(assert (=> b!1469322 m!1356503))

(declare-fun m!1356505 () Bool)

(assert (=> b!1469321 m!1356505))

(assert (=> b!1469321 m!1356505))

(declare-fun m!1356507 () Bool)

(assert (=> b!1469321 m!1356507))

(declare-fun m!1356509 () Bool)

(assert (=> b!1469319 m!1356509))

(assert (=> b!1469319 m!1356509))

(declare-fun m!1356511 () Bool)

(assert (=> b!1469319 m!1356511))

(assert (=> b!1469319 m!1356501))

(declare-fun m!1356513 () Bool)

(assert (=> b!1469319 m!1356513))

(declare-fun m!1356515 () Bool)

(assert (=> b!1469328 m!1356515))

(declare-fun m!1356517 () Bool)

(assert (=> b!1469325 m!1356517))

(declare-fun m!1356519 () Bool)

(assert (=> b!1469325 m!1356519))

(declare-fun m!1356521 () Bool)

(assert (=> b!1469323 m!1356521))

(declare-fun m!1356523 () Bool)

(assert (=> start!125574 m!1356523))

(declare-fun m!1356525 () Bool)

(assert (=> start!125574 m!1356525))

(declare-fun m!1356527 () Bool)

(assert (=> b!1469330 m!1356527))

(declare-fun m!1356529 () Bool)

(assert (=> b!1469329 m!1356529))

(assert (=> b!1469329 m!1356529))

(declare-fun m!1356531 () Bool)

(assert (=> b!1469329 m!1356531))

(assert (=> b!1469324 m!1356505))

(assert (=> b!1469324 m!1356505))

(declare-fun m!1356533 () Bool)

(assert (=> b!1469324 m!1356533))

(assert (=> b!1469324 m!1356533))

(assert (=> b!1469324 m!1356505))

(declare-fun m!1356535 () Bool)

(assert (=> b!1469324 m!1356535))

(assert (=> b!1469320 m!1356505))

(assert (=> b!1469320 m!1356505))

(declare-fun m!1356537 () Bool)

(assert (=> b!1469320 m!1356537))

(check-sat (not b!1469329) (not start!125574) (not b!1469319) (not b!1469321) (not b!1469320) (not b!1469328) (not b!1469325) (not b!1469330) (not b!1469324) (not b!1469323))
(check-sat)
