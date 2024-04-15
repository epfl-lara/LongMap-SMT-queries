; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124894 () Bool)

(assert start!124894)

(declare-fun b!1451392 () Bool)

(declare-fun e!817170 () Bool)

(declare-fun lt!636462 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451392 (= e!817170 (validKeyInArray!0 lt!636462))))

(declare-fun b!1451393 () Bool)

(declare-fun res!982729 () Bool)

(declare-fun e!817169 () Bool)

(assert (=> b!1451393 (=> (not res!982729) (not e!817169))))

(declare-datatypes ((array!98320 0))(
  ( (array!98321 (arr!47449 (Array (_ BitVec 32) (_ BitVec 64))) (size!48001 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98320)

(declare-datatypes ((List!34028 0))(
  ( (Nil!34025) (Cons!34024 (h!35374 (_ BitVec 64)) (t!48714 List!34028)) )
))
(declare-fun arrayNoDuplicates!0 (array!98320 (_ BitVec 32) List!34028) Bool)

(assert (=> b!1451393 (= res!982729 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34025))))

(declare-fun b!1451394 () Bool)

(declare-fun e!817163 () Bool)

(declare-fun e!817168 () Bool)

(assert (=> b!1451394 (= e!817163 e!817168)))

(declare-fun res!982736 () Bool)

(assert (=> b!1451394 (=> (not res!982736) (not e!817168))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11726 0))(
  ( (MissingZero!11726 (index!49296 (_ BitVec 32))) (Found!11726 (index!49297 (_ BitVec 32))) (Intermediate!11726 (undefined!12538 Bool) (index!49298 (_ BitVec 32)) (x!130946 (_ BitVec 32))) (Undefined!11726) (MissingVacant!11726 (index!49299 (_ BitVec 32))) )
))
(declare-fun lt!636464 () SeekEntryResult!11726)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451394 (= res!982736 (= lt!636464 (Intermediate!11726 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636461 () array!98320)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98320 (_ BitVec 32)) SeekEntryResult!11726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451394 (= lt!636464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636462 mask!2687) lt!636462 lt!636461 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451394 (= lt!636462 (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451395 () Bool)

(assert (=> b!1451395 (= e!817168 (not e!817170))))

(declare-fun res!982726 () Bool)

(assert (=> b!1451395 (=> res!982726 e!817170)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1451395 (= res!982726 (or (and (= (select (arr!47449 a!2862) index!646) (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47449 a!2862) index!646) (select (arr!47449 a!2862) j!93))) (= (select (arr!47449 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun e!817165 () Bool)

(assert (=> b!1451395 e!817165))

(declare-fun res!982731 () Bool)

(assert (=> b!1451395 (=> (not res!982731) (not e!817165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98320 (_ BitVec 32)) Bool)

(assert (=> b!1451395 (= res!982731 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48789 0))(
  ( (Unit!48790) )
))
(declare-fun lt!636463 () Unit!48789)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48789)

(assert (=> b!1451395 (= lt!636463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451396 () Bool)

(declare-fun res!982738 () Bool)

(assert (=> b!1451396 (=> (not res!982738) (not e!817165))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98320 (_ BitVec 32)) SeekEntryResult!11726)

(assert (=> b!1451396 (= res!982738 (= (seekEntryOrOpen!0 (select (arr!47449 a!2862) j!93) a!2862 mask!2687) (Found!11726 j!93)))))

(declare-fun b!1451397 () Bool)

(declare-fun res!982732 () Bool)

(assert (=> b!1451397 (=> (not res!982732) (not e!817168))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451397 (= res!982732 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451398 () Bool)

(declare-fun res!982730 () Bool)

(assert (=> b!1451398 (=> (not res!982730) (not e!817168))))

(declare-fun e!817167 () Bool)

(assert (=> b!1451398 (= res!982730 e!817167)))

(declare-fun c!133846 () Bool)

(assert (=> b!1451398 (= c!133846 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451399 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98320 (_ BitVec 32)) SeekEntryResult!11726)

(assert (=> b!1451399 (= e!817167 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636462 lt!636461 mask!2687) (seekEntryOrOpen!0 lt!636462 lt!636461 mask!2687)))))

(declare-fun b!1451400 () Bool)

(declare-fun res!982727 () Bool)

(assert (=> b!1451400 (=> (not res!982727) (not e!817163))))

(declare-fun lt!636465 () SeekEntryResult!11726)

(assert (=> b!1451400 (= res!982727 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!636465))))

(declare-fun b!1451401 () Bool)

(declare-fun res!982740 () Bool)

(assert (=> b!1451401 (=> (not res!982740) (not e!817169))))

(assert (=> b!1451401 (= res!982740 (validKeyInArray!0 (select (arr!47449 a!2862) j!93)))))

(declare-fun res!982737 () Bool)

(assert (=> start!124894 (=> (not res!982737) (not e!817169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124894 (= res!982737 (validMask!0 mask!2687))))

(assert (=> start!124894 e!817169))

(assert (=> start!124894 true))

(declare-fun array_inv!36682 (array!98320) Bool)

(assert (=> start!124894 (array_inv!36682 a!2862)))

(declare-fun b!1451402 () Bool)

(declare-fun res!982735 () Bool)

(assert (=> b!1451402 (=> (not res!982735) (not e!817169))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1451402 (= res!982735 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48001 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48001 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48001 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451403 () Bool)

(declare-fun res!982741 () Bool)

(assert (=> b!1451403 (=> (not res!982741) (not e!817169))))

(assert (=> b!1451403 (= res!982741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451404 () Bool)

(declare-fun e!817164 () Bool)

(assert (=> b!1451404 (= e!817169 e!817164)))

(declare-fun res!982734 () Bool)

(assert (=> b!1451404 (=> (not res!982734) (not e!817164))))

(assert (=> b!1451404 (= res!982734 (= (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451404 (= lt!636461 (array!98321 (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48001 a!2862)))))

(declare-fun b!1451405 () Bool)

(declare-fun res!982739 () Bool)

(assert (=> b!1451405 (=> (not res!982739) (not e!817169))))

(assert (=> b!1451405 (= res!982739 (and (= (size!48001 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48001 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48001 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451406 () Bool)

(assert (=> b!1451406 (= e!817164 e!817163)))

(declare-fun res!982733 () Bool)

(assert (=> b!1451406 (=> (not res!982733) (not e!817163))))

(assert (=> b!1451406 (= res!982733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47449 a!2862) j!93) mask!2687) (select (arr!47449 a!2862) j!93) a!2862 mask!2687) lt!636465))))

(assert (=> b!1451406 (= lt!636465 (Intermediate!11726 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451407 () Bool)

(assert (=> b!1451407 (= e!817167 (= lt!636464 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636462 lt!636461 mask!2687)))))

(declare-fun b!1451408 () Bool)

(declare-fun res!982728 () Bool)

(assert (=> b!1451408 (=> (not res!982728) (not e!817169))))

(assert (=> b!1451408 (= res!982728 (validKeyInArray!0 (select (arr!47449 a!2862) i!1006)))))

(declare-fun b!1451409 () Bool)

(assert (=> b!1451409 (= e!817165 (and (or (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47449 a!2862) intermediateBeforeIndex!19) (select (arr!47449 a!2862) j!93))) (or (and (= (select (arr!47449 a!2862) index!646) (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47449 a!2862) index!646) (select (arr!47449 a!2862) j!93))) (= (select (arr!47449 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47449 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124894 res!982737) b!1451405))

(assert (= (and b!1451405 res!982739) b!1451408))

(assert (= (and b!1451408 res!982728) b!1451401))

(assert (= (and b!1451401 res!982740) b!1451403))

(assert (= (and b!1451403 res!982741) b!1451393))

(assert (= (and b!1451393 res!982729) b!1451402))

(assert (= (and b!1451402 res!982735) b!1451404))

(assert (= (and b!1451404 res!982734) b!1451406))

(assert (= (and b!1451406 res!982733) b!1451400))

(assert (= (and b!1451400 res!982727) b!1451394))

(assert (= (and b!1451394 res!982736) b!1451398))

(assert (= (and b!1451398 c!133846) b!1451407))

(assert (= (and b!1451398 (not c!133846)) b!1451399))

(assert (= (and b!1451398 res!982730) b!1451397))

(assert (= (and b!1451397 res!982732) b!1451395))

(assert (= (and b!1451395 res!982731) b!1451396))

(assert (= (and b!1451396 res!982738) b!1451409))

(assert (= (and b!1451395 (not res!982726)) b!1451392))

(declare-fun m!1339503 () Bool)

(assert (=> b!1451407 m!1339503))

(declare-fun m!1339505 () Bool)

(assert (=> b!1451400 m!1339505))

(assert (=> b!1451400 m!1339505))

(declare-fun m!1339507 () Bool)

(assert (=> b!1451400 m!1339507))

(assert (=> b!1451406 m!1339505))

(assert (=> b!1451406 m!1339505))

(declare-fun m!1339509 () Bool)

(assert (=> b!1451406 m!1339509))

(assert (=> b!1451406 m!1339509))

(assert (=> b!1451406 m!1339505))

(declare-fun m!1339511 () Bool)

(assert (=> b!1451406 m!1339511))

(declare-fun m!1339513 () Bool)

(assert (=> b!1451392 m!1339513))

(declare-fun m!1339515 () Bool)

(assert (=> b!1451399 m!1339515))

(declare-fun m!1339517 () Bool)

(assert (=> b!1451399 m!1339517))

(declare-fun m!1339519 () Bool)

(assert (=> b!1451395 m!1339519))

(declare-fun m!1339521 () Bool)

(assert (=> b!1451395 m!1339521))

(declare-fun m!1339523 () Bool)

(assert (=> b!1451395 m!1339523))

(declare-fun m!1339525 () Bool)

(assert (=> b!1451395 m!1339525))

(declare-fun m!1339527 () Bool)

(assert (=> b!1451395 m!1339527))

(assert (=> b!1451395 m!1339505))

(declare-fun m!1339529 () Bool)

(assert (=> start!124894 m!1339529))

(declare-fun m!1339531 () Bool)

(assert (=> start!124894 m!1339531))

(declare-fun m!1339533 () Bool)

(assert (=> b!1451408 m!1339533))

(assert (=> b!1451408 m!1339533))

(declare-fun m!1339535 () Bool)

(assert (=> b!1451408 m!1339535))

(declare-fun m!1339537 () Bool)

(assert (=> b!1451393 m!1339537))

(assert (=> b!1451409 m!1339521))

(declare-fun m!1339539 () Bool)

(assert (=> b!1451409 m!1339539))

(assert (=> b!1451409 m!1339523))

(assert (=> b!1451409 m!1339525))

(assert (=> b!1451409 m!1339505))

(declare-fun m!1339541 () Bool)

(assert (=> b!1451394 m!1339541))

(assert (=> b!1451394 m!1339541))

(declare-fun m!1339543 () Bool)

(assert (=> b!1451394 m!1339543))

(assert (=> b!1451394 m!1339521))

(declare-fun m!1339545 () Bool)

(assert (=> b!1451394 m!1339545))

(assert (=> b!1451396 m!1339505))

(assert (=> b!1451396 m!1339505))

(declare-fun m!1339547 () Bool)

(assert (=> b!1451396 m!1339547))

(assert (=> b!1451404 m!1339521))

(declare-fun m!1339549 () Bool)

(assert (=> b!1451404 m!1339549))

(declare-fun m!1339551 () Bool)

(assert (=> b!1451403 m!1339551))

(assert (=> b!1451401 m!1339505))

(assert (=> b!1451401 m!1339505))

(declare-fun m!1339553 () Bool)

(assert (=> b!1451401 m!1339553))

(check-sat (not start!124894) (not b!1451407) (not b!1451395) (not b!1451394) (not b!1451401) (not b!1451392) (not b!1451400) (not b!1451406) (not b!1451408) (not b!1451393) (not b!1451396) (not b!1451399) (not b!1451403))
(check-sat)
