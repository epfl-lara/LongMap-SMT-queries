; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124752 () Bool)

(assert start!124752)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!813291 () Bool)

(declare-datatypes ((array!98095 0))(
  ( (array!98096 (arr!47332 (Array (_ BitVec 32) (_ BitVec 64))) (size!47883 (_ BitVec 32))) )
))
(declare-fun lt!633620 () array!98095)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1442509 () Bool)

(declare-datatypes ((SeekEntryResult!11481 0))(
  ( (MissingZero!11481 (index!48316 (_ BitVec 32))) (Found!11481 (index!48317 (_ BitVec 32))) (Intermediate!11481 (undefined!12293 Bool) (index!48318 (_ BitVec 32)) (x!130210 (_ BitVec 32))) (Undefined!11481) (MissingVacant!11481 (index!48319 (_ BitVec 32))) )
))
(declare-fun lt!633622 () SeekEntryResult!11481)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633618 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98095 (_ BitVec 32)) SeekEntryResult!11481)

(assert (=> b!1442509 (= e!813291 (not (= lt!633622 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633618 lt!633620 mask!2687))))))

(declare-fun b!1442510 () Bool)

(declare-fun res!974073 () Bool)

(declare-fun e!813292 () Bool)

(assert (=> b!1442510 (=> (not res!974073) (not e!813292))))

(declare-fun a!2862 () array!98095)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442510 (= res!974073 (validKeyInArray!0 (select (arr!47332 a!2862) i!1006)))))

(declare-fun b!1442511 () Bool)

(declare-fun e!813293 () Bool)

(assert (=> b!1442511 (= e!813293 false)))

(declare-fun lt!633621 () Bool)

(assert (=> b!1442511 (= lt!633621 e!813291)))

(declare-fun c!133738 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442511 (= c!133738 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442512 () Bool)

(declare-fun res!974072 () Bool)

(assert (=> b!1442512 (=> (not res!974072) (not e!813292))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442512 (= res!974072 (validKeyInArray!0 (select (arr!47332 a!2862) j!93)))))

(declare-fun b!1442513 () Bool)

(declare-fun res!974077 () Bool)

(declare-fun e!813294 () Bool)

(assert (=> b!1442513 (=> (not res!974077) (not e!813294))))

(declare-fun lt!633619 () SeekEntryResult!11481)

(assert (=> b!1442513 (= res!974077 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47332 a!2862) j!93) a!2862 mask!2687) lt!633619))))

(declare-fun b!1442514 () Bool)

(declare-fun res!974076 () Bool)

(assert (=> b!1442514 (=> (not res!974076) (not e!813292))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442514 (= res!974076 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47883 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47883 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47883 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442515 () Bool)

(declare-fun res!974079 () Bool)

(assert (=> b!1442515 (=> (not res!974079) (not e!813292))))

(declare-datatypes ((List!33820 0))(
  ( (Nil!33817) (Cons!33816 (h!35177 (_ BitVec 64)) (t!48506 List!33820)) )
))
(declare-fun arrayNoDuplicates!0 (array!98095 (_ BitVec 32) List!33820) Bool)

(assert (=> b!1442515 (= res!974079 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33817))))

(declare-fun b!1442516 () Bool)

(declare-fun e!813290 () Bool)

(assert (=> b!1442516 (= e!813290 e!813294)))

(declare-fun res!974074 () Bool)

(assert (=> b!1442516 (=> (not res!974074) (not e!813294))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442516 (= res!974074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47332 a!2862) j!93) mask!2687) (select (arr!47332 a!2862) j!93) a!2862 mask!2687) lt!633619))))

(assert (=> b!1442516 (= lt!633619 (Intermediate!11481 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!974081 () Bool)

(assert (=> start!124752 (=> (not res!974081) (not e!813292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124752 (= res!974081 (validMask!0 mask!2687))))

(assert (=> start!124752 e!813292))

(assert (=> start!124752 true))

(declare-fun array_inv!36613 (array!98095) Bool)

(assert (=> start!124752 (array_inv!36613 a!2862)))

(declare-fun b!1442517 () Bool)

(declare-fun res!974080 () Bool)

(assert (=> b!1442517 (=> (not res!974080) (not e!813292))))

(assert (=> b!1442517 (= res!974080 (and (= (size!47883 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47883 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47883 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442518 () Bool)

(assert (=> b!1442518 (= e!813294 e!813293)))

(declare-fun res!974071 () Bool)

(assert (=> b!1442518 (=> (not res!974071) (not e!813293))))

(assert (=> b!1442518 (= res!974071 (= lt!633622 (Intermediate!11481 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442518 (= lt!633622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633618 mask!2687) lt!633618 lt!633620 mask!2687))))

(assert (=> b!1442518 (= lt!633618 (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442519 () Bool)

(assert (=> b!1442519 (= e!813292 e!813290)))

(declare-fun res!974075 () Bool)

(assert (=> b!1442519 (=> (not res!974075) (not e!813290))))

(assert (=> b!1442519 (= res!974075 (= (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442519 (= lt!633620 (array!98096 (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47883 a!2862)))))

(declare-fun b!1442520 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98095 (_ BitVec 32)) SeekEntryResult!11481)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98095 (_ BitVec 32)) SeekEntryResult!11481)

(assert (=> b!1442520 (= e!813291 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633618 lt!633620 mask!2687) (seekEntryOrOpen!0 lt!633618 lt!633620 mask!2687))))))

(declare-fun b!1442521 () Bool)

(declare-fun res!974078 () Bool)

(assert (=> b!1442521 (=> (not res!974078) (not e!813292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98095 (_ BitVec 32)) Bool)

(assert (=> b!1442521 (= res!974078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124752 res!974081) b!1442517))

(assert (= (and b!1442517 res!974080) b!1442510))

(assert (= (and b!1442510 res!974073) b!1442512))

(assert (= (and b!1442512 res!974072) b!1442521))

(assert (= (and b!1442521 res!974078) b!1442515))

(assert (= (and b!1442515 res!974079) b!1442514))

(assert (= (and b!1442514 res!974076) b!1442519))

(assert (= (and b!1442519 res!974075) b!1442516))

(assert (= (and b!1442516 res!974074) b!1442513))

(assert (= (and b!1442513 res!974077) b!1442518))

(assert (= (and b!1442518 res!974071) b!1442511))

(assert (= (and b!1442511 c!133738) b!1442509))

(assert (= (and b!1442511 (not c!133738)) b!1442520))

(declare-fun m!1331851 () Bool)

(assert (=> b!1442515 m!1331851))

(declare-fun m!1331853 () Bool)

(assert (=> b!1442510 m!1331853))

(assert (=> b!1442510 m!1331853))

(declare-fun m!1331855 () Bool)

(assert (=> b!1442510 m!1331855))

(declare-fun m!1331857 () Bool)

(assert (=> b!1442520 m!1331857))

(declare-fun m!1331859 () Bool)

(assert (=> b!1442520 m!1331859))

(declare-fun m!1331861 () Bool)

(assert (=> b!1442512 m!1331861))

(assert (=> b!1442512 m!1331861))

(declare-fun m!1331863 () Bool)

(assert (=> b!1442512 m!1331863))

(declare-fun m!1331865 () Bool)

(assert (=> b!1442519 m!1331865))

(declare-fun m!1331867 () Bool)

(assert (=> b!1442519 m!1331867))

(assert (=> b!1442516 m!1331861))

(assert (=> b!1442516 m!1331861))

(declare-fun m!1331869 () Bool)

(assert (=> b!1442516 m!1331869))

(assert (=> b!1442516 m!1331869))

(assert (=> b!1442516 m!1331861))

(declare-fun m!1331871 () Bool)

(assert (=> b!1442516 m!1331871))

(declare-fun m!1331873 () Bool)

(assert (=> start!124752 m!1331873))

(declare-fun m!1331875 () Bool)

(assert (=> start!124752 m!1331875))

(declare-fun m!1331877 () Bool)

(assert (=> b!1442509 m!1331877))

(assert (=> b!1442513 m!1331861))

(assert (=> b!1442513 m!1331861))

(declare-fun m!1331879 () Bool)

(assert (=> b!1442513 m!1331879))

(declare-fun m!1331881 () Bool)

(assert (=> b!1442518 m!1331881))

(assert (=> b!1442518 m!1331881))

(declare-fun m!1331883 () Bool)

(assert (=> b!1442518 m!1331883))

(assert (=> b!1442518 m!1331865))

(declare-fun m!1331885 () Bool)

(assert (=> b!1442518 m!1331885))

(declare-fun m!1331887 () Bool)

(assert (=> b!1442521 m!1331887))

(check-sat (not b!1442510) (not b!1442516) (not b!1442521) (not b!1442520) (not start!124752) (not b!1442509) (not b!1442518) (not b!1442512) (not b!1442513) (not b!1442515))
(check-sat)
