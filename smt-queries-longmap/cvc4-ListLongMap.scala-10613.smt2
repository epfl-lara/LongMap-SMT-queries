; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124820 () Bool)

(assert start!124820)

(declare-fun b!1448598 () Bool)

(declare-fun res!980143 () Bool)

(declare-fun e!815800 () Bool)

(assert (=> b!1448598 (=> (not res!980143) (not e!815800))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11674 0))(
  ( (MissingZero!11674 (index!49088 (_ BitVec 32))) (Found!11674 (index!49089 (_ BitVec 32))) (Intermediate!11674 (undefined!12486 Bool) (index!49090 (_ BitVec 32)) (x!130755 (_ BitVec 32))) (Undefined!11674) (MissingVacant!11674 (index!49091 (_ BitVec 32))) )
))
(declare-fun lt!635591 () SeekEntryResult!11674)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98268 0))(
  ( (array!98269 (arr!47422 (Array (_ BitVec 32) (_ BitVec 64))) (size!47972 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98268)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98268 (_ BitVec 32)) SeekEntryResult!11674)

(assert (=> b!1448598 (= res!980143 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635591))))

(declare-fun lt!635593 () array!98268)

(declare-fun e!815804 () Bool)

(declare-fun lt!635592 () (_ BitVec 64))

(declare-fun lt!635594 () SeekEntryResult!11674)

(declare-fun b!1448599 () Bool)

(assert (=> b!1448599 (= e!815804 (= lt!635594 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635592 lt!635593 mask!2687)))))

(declare-fun b!1448600 () Bool)

(declare-fun e!815796 () Bool)

(declare-fun e!815795 () Bool)

(assert (=> b!1448600 (= e!815796 e!815795)))

(declare-fun res!980140 () Bool)

(assert (=> b!1448600 (=> res!980140 e!815795)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1448600 (= res!980140 (or (and (= (select (arr!47422 a!2862) index!646) (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47422 a!2862) index!646) (select (arr!47422 a!2862) j!93))) (not (= (select (arr!47422 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448601 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!815797 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448601 (= e!815797 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448602 () Bool)

(declare-fun res!980136 () Bool)

(declare-fun e!815798 () Bool)

(assert (=> b!1448602 (=> (not res!980136) (not e!815798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98268 (_ BitVec 32)) Bool)

(assert (=> b!1448602 (= res!980136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!980132 () Bool)

(assert (=> start!124820 (=> (not res!980132) (not e!815798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124820 (= res!980132 (validMask!0 mask!2687))))

(assert (=> start!124820 e!815798))

(assert (=> start!124820 true))

(declare-fun array_inv!36450 (array!98268) Bool)

(assert (=> start!124820 (array_inv!36450 a!2862)))

(declare-fun b!1448603 () Bool)

(declare-fun res!980137 () Bool)

(declare-fun e!815802 () Bool)

(assert (=> b!1448603 (=> (not res!980137) (not e!815802))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448603 (= res!980137 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448604 () Bool)

(declare-fun e!815803 () Bool)

(assert (=> b!1448604 (= e!815798 e!815803)))

(declare-fun res!980141 () Bool)

(assert (=> b!1448604 (=> (not res!980141) (not e!815803))))

(assert (=> b!1448604 (= res!980141 (= (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448604 (= lt!635593 (array!98269 (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47972 a!2862)))))

(declare-fun b!1448605 () Bool)

(declare-fun res!980128 () Bool)

(assert (=> b!1448605 (=> (not res!980128) (not e!815798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448605 (= res!980128 (validKeyInArray!0 (select (arr!47422 a!2862) j!93)))))

(declare-fun b!1448606 () Bool)

(declare-fun res!980129 () Bool)

(assert (=> b!1448606 (=> (not res!980129) (not e!815798))))

(assert (=> b!1448606 (= res!980129 (validKeyInArray!0 (select (arr!47422 a!2862) i!1006)))))

(declare-fun b!1448607 () Bool)

(declare-fun res!980130 () Bool)

(assert (=> b!1448607 (=> (not res!980130) (not e!815798))))

(declare-datatypes ((List!33923 0))(
  ( (Nil!33920) (Cons!33919 (h!35269 (_ BitVec 64)) (t!48617 List!33923)) )
))
(declare-fun arrayNoDuplicates!0 (array!98268 (_ BitVec 32) List!33923) Bool)

(assert (=> b!1448607 (= res!980130 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33920))))

(declare-fun b!1448608 () Bool)

(assert (=> b!1448608 (= e!815800 e!815802)))

(declare-fun res!980133 () Bool)

(assert (=> b!1448608 (=> (not res!980133) (not e!815802))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448608 (= res!980133 (= lt!635594 (Intermediate!11674 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448608 (= lt!635594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635592 mask!2687) lt!635592 lt!635593 mask!2687))))

(assert (=> b!1448608 (= lt!635592 (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448609 () Bool)

(declare-fun res!980134 () Bool)

(assert (=> b!1448609 (=> (not res!980134) (not e!815802))))

(assert (=> b!1448609 (= res!980134 e!815804)))

(declare-fun c!133746 () Bool)

(assert (=> b!1448609 (= c!133746 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448610 () Bool)

(declare-fun e!815799 () Bool)

(assert (=> b!1448610 (= e!815802 (not e!815799))))

(declare-fun res!980142 () Bool)

(assert (=> b!1448610 (=> res!980142 e!815799)))

(assert (=> b!1448610 (= res!980142 (or (and (= (select (arr!47422 a!2862) index!646) (select (store (arr!47422 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47422 a!2862) index!646) (select (arr!47422 a!2862) j!93))) (not (= (select (arr!47422 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448610 e!815796))

(declare-fun res!980131 () Bool)

(assert (=> b!1448610 (=> (not res!980131) (not e!815796))))

(declare-fun lt!635589 () SeekEntryResult!11674)

(assert (=> b!1448610 (= res!980131 (and (= lt!635589 (Found!11674 j!93)) (or (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47422 a!2862) intermediateBeforeIndex!19) (select (arr!47422 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98268 (_ BitVec 32)) SeekEntryResult!11674)

(assert (=> b!1448610 (= lt!635589 (seekEntryOrOpen!0 (select (arr!47422 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448610 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48844 0))(
  ( (Unit!48845) )
))
(declare-fun lt!635595 () Unit!48844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48844)

(assert (=> b!1448610 (= lt!635595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448611 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98268 (_ BitVec 32)) SeekEntryResult!11674)

(assert (=> b!1448611 (= e!815804 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635592 lt!635593 mask!2687) (seekEntryOrOpen!0 lt!635592 lt!635593 mask!2687)))))

(declare-fun b!1448612 () Bool)

(assert (=> b!1448612 (= e!815795 e!815797)))

(declare-fun res!980127 () Bool)

(assert (=> b!1448612 (=> (not res!980127) (not e!815797))))

(assert (=> b!1448612 (= res!980127 (= lt!635589 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47422 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448613 () Bool)

(declare-fun res!980139 () Bool)

(assert (=> b!1448613 (=> (not res!980139) (not e!815798))))

(assert (=> b!1448613 (= res!980139 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47972 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47972 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47972 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448614 () Bool)

(assert (=> b!1448614 (= e!815803 e!815800)))

(declare-fun res!980138 () Bool)

(assert (=> b!1448614 (=> (not res!980138) (not e!815800))))

(assert (=> b!1448614 (= res!980138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47422 a!2862) j!93) mask!2687) (select (arr!47422 a!2862) j!93) a!2862 mask!2687) lt!635591))))

(assert (=> b!1448614 (= lt!635591 (Intermediate!11674 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448615 () Bool)

(declare-fun res!980135 () Bool)

(assert (=> b!1448615 (=> (not res!980135) (not e!815798))))

(assert (=> b!1448615 (= res!980135 (and (= (size!47972 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47972 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47972 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448616 () Bool)

(assert (=> b!1448616 (= e!815799 true)))

(declare-fun lt!635590 () SeekEntryResult!11674)

(assert (=> b!1448616 (= lt!635590 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47422 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124820 res!980132) b!1448615))

(assert (= (and b!1448615 res!980135) b!1448606))

(assert (= (and b!1448606 res!980129) b!1448605))

(assert (= (and b!1448605 res!980128) b!1448602))

(assert (= (and b!1448602 res!980136) b!1448607))

(assert (= (and b!1448607 res!980130) b!1448613))

(assert (= (and b!1448613 res!980139) b!1448604))

(assert (= (and b!1448604 res!980141) b!1448614))

(assert (= (and b!1448614 res!980138) b!1448598))

(assert (= (and b!1448598 res!980143) b!1448608))

(assert (= (and b!1448608 res!980133) b!1448609))

(assert (= (and b!1448609 c!133746) b!1448599))

(assert (= (and b!1448609 (not c!133746)) b!1448611))

(assert (= (and b!1448609 res!980134) b!1448603))

(assert (= (and b!1448603 res!980137) b!1448610))

(assert (= (and b!1448610 res!980131) b!1448600))

(assert (= (and b!1448600 (not res!980140)) b!1448612))

(assert (= (and b!1448612 res!980127) b!1448601))

(assert (= (and b!1448610 (not res!980142)) b!1448616))

(declare-fun m!1337353 () Bool)

(assert (=> b!1448612 m!1337353))

(assert (=> b!1448612 m!1337353))

(declare-fun m!1337355 () Bool)

(assert (=> b!1448612 m!1337355))

(declare-fun m!1337357 () Bool)

(assert (=> b!1448599 m!1337357))

(declare-fun m!1337359 () Bool)

(assert (=> start!124820 m!1337359))

(declare-fun m!1337361 () Bool)

(assert (=> start!124820 m!1337361))

(assert (=> b!1448616 m!1337353))

(assert (=> b!1448616 m!1337353))

(declare-fun m!1337363 () Bool)

(assert (=> b!1448616 m!1337363))

(declare-fun m!1337365 () Bool)

(assert (=> b!1448602 m!1337365))

(declare-fun m!1337367 () Bool)

(assert (=> b!1448607 m!1337367))

(declare-fun m!1337369 () Bool)

(assert (=> b!1448604 m!1337369))

(declare-fun m!1337371 () Bool)

(assert (=> b!1448604 m!1337371))

(declare-fun m!1337373 () Bool)

(assert (=> b!1448600 m!1337373))

(assert (=> b!1448600 m!1337369))

(declare-fun m!1337375 () Bool)

(assert (=> b!1448600 m!1337375))

(assert (=> b!1448600 m!1337353))

(declare-fun m!1337377 () Bool)

(assert (=> b!1448606 m!1337377))

(assert (=> b!1448606 m!1337377))

(declare-fun m!1337379 () Bool)

(assert (=> b!1448606 m!1337379))

(declare-fun m!1337381 () Bool)

(assert (=> b!1448611 m!1337381))

(declare-fun m!1337383 () Bool)

(assert (=> b!1448611 m!1337383))

(assert (=> b!1448614 m!1337353))

(assert (=> b!1448614 m!1337353))

(declare-fun m!1337385 () Bool)

(assert (=> b!1448614 m!1337385))

(assert (=> b!1448614 m!1337385))

(assert (=> b!1448614 m!1337353))

(declare-fun m!1337387 () Bool)

(assert (=> b!1448614 m!1337387))

(declare-fun m!1337389 () Bool)

(assert (=> b!1448608 m!1337389))

(assert (=> b!1448608 m!1337389))

(declare-fun m!1337391 () Bool)

(assert (=> b!1448608 m!1337391))

(assert (=> b!1448608 m!1337369))

(declare-fun m!1337393 () Bool)

(assert (=> b!1448608 m!1337393))

(declare-fun m!1337395 () Bool)

(assert (=> b!1448610 m!1337395))

(assert (=> b!1448610 m!1337369))

(declare-fun m!1337397 () Bool)

(assert (=> b!1448610 m!1337397))

(assert (=> b!1448610 m!1337375))

(assert (=> b!1448610 m!1337373))

(assert (=> b!1448610 m!1337353))

(declare-fun m!1337399 () Bool)

(assert (=> b!1448610 m!1337399))

(declare-fun m!1337401 () Bool)

(assert (=> b!1448610 m!1337401))

(assert (=> b!1448610 m!1337353))

(assert (=> b!1448605 m!1337353))

(assert (=> b!1448605 m!1337353))

(declare-fun m!1337403 () Bool)

(assert (=> b!1448605 m!1337403))

(assert (=> b!1448598 m!1337353))

(assert (=> b!1448598 m!1337353))

(declare-fun m!1337405 () Bool)

(assert (=> b!1448598 m!1337405))

(push 1)

