; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124960 () Bool)

(assert start!124960)

(declare-fun b!1452512 () Bool)

(declare-fun res!983634 () Bool)

(declare-fun e!817669 () Bool)

(assert (=> b!1452512 (=> (not res!983634) (not e!817669))))

(declare-datatypes ((array!98408 0))(
  ( (array!98409 (arr!47492 (Array (_ BitVec 32) (_ BitVec 64))) (size!48042 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98408)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452512 (= res!983634 (validKeyInArray!0 (select (arr!47492 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!636969 () (_ BitVec 64))

(declare-fun b!1452513 () Bool)

(declare-fun e!817667 () Bool)

(declare-fun lt!636967 () array!98408)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11744 0))(
  ( (MissingZero!11744 (index!49368 (_ BitVec 32))) (Found!11744 (index!49369 (_ BitVec 32))) (Intermediate!11744 (undefined!12556 Bool) (index!49370 (_ BitVec 32)) (x!131017 (_ BitVec 32))) (Undefined!11744) (MissingVacant!11744 (index!49371 (_ BitVec 32))) )
))
(declare-fun lt!636965 () SeekEntryResult!11744)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98408 (_ BitVec 32)) SeekEntryResult!11744)

(assert (=> b!1452513 (= e!817667 (= lt!636965 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636969 lt!636967 mask!2687)))))

(declare-fun b!1452514 () Bool)

(declare-fun res!983623 () Bool)

(assert (=> b!1452514 (=> (not res!983623) (not e!817669))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1452514 (= res!983623 (and (= (size!48042 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48042 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48042 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452515 () Bool)

(declare-fun res!983625 () Bool)

(assert (=> b!1452515 (=> (not res!983625) (not e!817669))))

(declare-datatypes ((List!33993 0))(
  ( (Nil!33990) (Cons!33989 (h!35339 (_ BitVec 64)) (t!48687 List!33993)) )
))
(declare-fun arrayNoDuplicates!0 (array!98408 (_ BitVec 32) List!33993) Bool)

(assert (=> b!1452515 (= res!983625 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33990))))

(declare-fun b!1452516 () Bool)

(declare-fun res!983629 () Bool)

(declare-fun e!817665 () Bool)

(assert (=> b!1452516 (=> (not res!983629) (not e!817665))))

(declare-fun lt!636968 () SeekEntryResult!11744)

(assert (=> b!1452516 (= res!983629 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47492 a!2862) j!93) a!2862 mask!2687) lt!636968))))

(declare-fun b!1452518 () Bool)

(declare-fun e!817668 () Bool)

(assert (=> b!1452518 (= e!817668 e!817665)))

(declare-fun res!983626 () Bool)

(assert (=> b!1452518 (=> (not res!983626) (not e!817665))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452518 (= res!983626 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47492 a!2862) j!93) mask!2687) (select (arr!47492 a!2862) j!93) a!2862 mask!2687) lt!636968))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452518 (= lt!636968 (Intermediate!11744 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452519 () Bool)

(assert (=> b!1452519 (= e!817669 e!817668)))

(declare-fun res!983632 () Bool)

(assert (=> b!1452519 (=> (not res!983632) (not e!817668))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452519 (= res!983632 (= (select (store (arr!47492 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452519 (= lt!636967 (array!98409 (store (arr!47492 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48042 a!2862)))))

(declare-fun b!1452520 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98408 (_ BitVec 32)) SeekEntryResult!11744)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98408 (_ BitVec 32)) SeekEntryResult!11744)

(assert (=> b!1452520 (= e!817667 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636969 lt!636967 mask!2687) (seekEntryOrOpen!0 lt!636969 lt!636967 mask!2687)))))

(declare-fun b!1452521 () Bool)

(declare-fun res!983627 () Bool)

(declare-fun e!817670 () Bool)

(assert (=> b!1452521 (=> (not res!983627) (not e!817670))))

(assert (=> b!1452521 (= res!983627 e!817667)))

(declare-fun c!133956 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452521 (= c!133956 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452522 () Bool)

(assert (=> b!1452522 (= e!817665 e!817670)))

(declare-fun res!983633 () Bool)

(assert (=> b!1452522 (=> (not res!983633) (not e!817670))))

(assert (=> b!1452522 (= res!983633 (= lt!636965 (Intermediate!11744 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452522 (= lt!636965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636969 mask!2687) lt!636969 lt!636967 mask!2687))))

(assert (=> b!1452522 (= lt!636969 (select (store (arr!47492 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452523 () Bool)

(declare-fun res!983630 () Bool)

(assert (=> b!1452523 (=> (not res!983630) (not e!817670))))

(assert (=> b!1452523 (= res!983630 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452524 () Bool)

(assert (=> b!1452524 (= e!817670 (not (or (and (= (select (arr!47492 a!2862) index!646) (select (store (arr!47492 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47492 a!2862) index!646) (select (arr!47492 a!2862) j!93))) (= (select (arr!47492 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!817664 () Bool)

(assert (=> b!1452524 e!817664))

(declare-fun res!983635 () Bool)

(assert (=> b!1452524 (=> (not res!983635) (not e!817664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98408 (_ BitVec 32)) Bool)

(assert (=> b!1452524 (= res!983635 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48984 0))(
  ( (Unit!48985) )
))
(declare-fun lt!636966 () Unit!48984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98408 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48984)

(assert (=> b!1452524 (= lt!636966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452525 () Bool)

(declare-fun res!983622 () Bool)

(assert (=> b!1452525 (=> (not res!983622) (not e!817669))))

(assert (=> b!1452525 (= res!983622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452526 () Bool)

(declare-fun res!983624 () Bool)

(assert (=> b!1452526 (=> (not res!983624) (not e!817664))))

(assert (=> b!1452526 (= res!983624 (= (seekEntryOrOpen!0 (select (arr!47492 a!2862) j!93) a!2862 mask!2687) (Found!11744 j!93)))))

(declare-fun res!983621 () Bool)

(assert (=> start!124960 (=> (not res!983621) (not e!817669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124960 (= res!983621 (validMask!0 mask!2687))))

(assert (=> start!124960 e!817669))

(assert (=> start!124960 true))

(declare-fun array_inv!36520 (array!98408) Bool)

(assert (=> start!124960 (array_inv!36520 a!2862)))

(declare-fun b!1452517 () Bool)

(declare-fun res!983628 () Bool)

(assert (=> b!1452517 (=> (not res!983628) (not e!817669))))

(assert (=> b!1452517 (= res!983628 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48042 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48042 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48042 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452527 () Bool)

(declare-fun res!983631 () Bool)

(assert (=> b!1452527 (=> (not res!983631) (not e!817669))))

(assert (=> b!1452527 (= res!983631 (validKeyInArray!0 (select (arr!47492 a!2862) j!93)))))

(declare-fun b!1452528 () Bool)

(assert (=> b!1452528 (= e!817664 (and (or (= (select (arr!47492 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47492 a!2862) intermediateBeforeIndex!19) (select (arr!47492 a!2862) j!93))) (or (and (= (select (arr!47492 a!2862) index!646) (select (store (arr!47492 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47492 a!2862) index!646) (select (arr!47492 a!2862) j!93))) (= (select (arr!47492 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47492 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124960 res!983621) b!1452514))

(assert (= (and b!1452514 res!983623) b!1452512))

(assert (= (and b!1452512 res!983634) b!1452527))

(assert (= (and b!1452527 res!983631) b!1452525))

(assert (= (and b!1452525 res!983622) b!1452515))

(assert (= (and b!1452515 res!983625) b!1452517))

(assert (= (and b!1452517 res!983628) b!1452519))

(assert (= (and b!1452519 res!983632) b!1452518))

(assert (= (and b!1452518 res!983626) b!1452516))

(assert (= (and b!1452516 res!983629) b!1452522))

(assert (= (and b!1452522 res!983633) b!1452521))

(assert (= (and b!1452521 c!133956) b!1452513))

(assert (= (and b!1452521 (not c!133956)) b!1452520))

(assert (= (and b!1452521 res!983627) b!1452523))

(assert (= (and b!1452523 res!983630) b!1452524))

(assert (= (and b!1452524 res!983635) b!1452526))

(assert (= (and b!1452526 res!983624) b!1452528))

(declare-fun m!1341085 () Bool)

(assert (=> start!124960 m!1341085))

(declare-fun m!1341087 () Bool)

(assert (=> start!124960 m!1341087))

(declare-fun m!1341089 () Bool)

(assert (=> b!1452524 m!1341089))

(declare-fun m!1341091 () Bool)

(assert (=> b!1452524 m!1341091))

(declare-fun m!1341093 () Bool)

(assert (=> b!1452524 m!1341093))

(declare-fun m!1341095 () Bool)

(assert (=> b!1452524 m!1341095))

(declare-fun m!1341097 () Bool)

(assert (=> b!1452524 m!1341097))

(declare-fun m!1341099 () Bool)

(assert (=> b!1452524 m!1341099))

(declare-fun m!1341101 () Bool)

(assert (=> b!1452520 m!1341101))

(declare-fun m!1341103 () Bool)

(assert (=> b!1452520 m!1341103))

(assert (=> b!1452527 m!1341099))

(assert (=> b!1452527 m!1341099))

(declare-fun m!1341105 () Bool)

(assert (=> b!1452527 m!1341105))

(assert (=> b!1452516 m!1341099))

(assert (=> b!1452516 m!1341099))

(declare-fun m!1341107 () Bool)

(assert (=> b!1452516 m!1341107))

(declare-fun m!1341109 () Bool)

(assert (=> b!1452525 m!1341109))

(assert (=> b!1452528 m!1341091))

(declare-fun m!1341111 () Bool)

(assert (=> b!1452528 m!1341111))

(assert (=> b!1452528 m!1341093))

(assert (=> b!1452528 m!1341095))

(assert (=> b!1452528 m!1341099))

(declare-fun m!1341113 () Bool)

(assert (=> b!1452513 m!1341113))

(assert (=> b!1452526 m!1341099))

(assert (=> b!1452526 m!1341099))

(declare-fun m!1341115 () Bool)

(assert (=> b!1452526 m!1341115))

(declare-fun m!1341117 () Bool)

(assert (=> b!1452512 m!1341117))

(assert (=> b!1452512 m!1341117))

(declare-fun m!1341119 () Bool)

(assert (=> b!1452512 m!1341119))

(declare-fun m!1341121 () Bool)

(assert (=> b!1452515 m!1341121))

(assert (=> b!1452518 m!1341099))

(assert (=> b!1452518 m!1341099))

(declare-fun m!1341123 () Bool)

(assert (=> b!1452518 m!1341123))

(assert (=> b!1452518 m!1341123))

(assert (=> b!1452518 m!1341099))

(declare-fun m!1341125 () Bool)

(assert (=> b!1452518 m!1341125))

(declare-fun m!1341127 () Bool)

(assert (=> b!1452522 m!1341127))

(assert (=> b!1452522 m!1341127))

(declare-fun m!1341129 () Bool)

(assert (=> b!1452522 m!1341129))

(assert (=> b!1452522 m!1341091))

(declare-fun m!1341131 () Bool)

(assert (=> b!1452522 m!1341131))

(assert (=> b!1452519 m!1341091))

(declare-fun m!1341133 () Bool)

(assert (=> b!1452519 m!1341133))

(push 1)

(assert (not b!1452512))

(assert (not b!1452526))

(assert (not b!1452527))

(assert (not b!1452524))

(assert (not b!1452516))

(assert (not b!1452520))

(assert (not b!1452518))

(assert (not b!1452515))

(assert (not start!124960))

(assert (not b!1452513))

(assert (not b!1452525))

(assert (not b!1452522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

