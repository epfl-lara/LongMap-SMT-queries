; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124402 () Bool)

(assert start!124402)

(declare-fun b!1439433 () Bool)

(declare-fun e!811817 () Bool)

(declare-fun e!811816 () Bool)

(assert (=> b!1439433 (= e!811817 e!811816)))

(declare-fun res!971978 () Bool)

(assert (=> b!1439433 (=> (not res!971978) (not e!811816))))

(declare-datatypes ((SeekEntryResult!11480 0))(
  ( (MissingZero!11480 (index!48312 (_ BitVec 32))) (Found!11480 (index!48313 (_ BitVec 32))) (Intermediate!11480 (undefined!12292 Bool) (index!48314 (_ BitVec 32)) (x!130044 (_ BitVec 32))) (Undefined!11480) (MissingVacant!11480 (index!48315 (_ BitVec 32))) )
))
(declare-fun lt!632610 () SeekEntryResult!11480)

(declare-datatypes ((array!97828 0))(
  ( (array!97829 (arr!47203 (Array (_ BitVec 32) (_ BitVec 64))) (size!47755 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97828)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97828 (_ BitVec 32)) SeekEntryResult!11480)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439433 (= res!971978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47203 a!2862) j!93) mask!2687) (select (arr!47203 a!2862) j!93) a!2862 mask!2687) lt!632610))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439433 (= lt!632610 (Intermediate!11480 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439434 () Bool)

(declare-fun res!971986 () Bool)

(assert (=> b!1439434 (=> (not res!971986) (not e!811817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97828 (_ BitVec 32)) Bool)

(assert (=> b!1439434 (= res!971986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971981 () Bool)

(assert (=> start!124402 (=> (not res!971981) (not e!811817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124402 (= res!971981 (validMask!0 mask!2687))))

(assert (=> start!124402 e!811817))

(assert (=> start!124402 true))

(declare-fun array_inv!36436 (array!97828) Bool)

(assert (=> start!124402 (array_inv!36436 a!2862)))

(declare-fun b!1439435 () Bool)

(declare-fun res!971983 () Bool)

(assert (=> b!1439435 (=> (not res!971983) (not e!811817))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439435 (= res!971983 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47755 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47755 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47755 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439436 () Bool)

(declare-fun res!971985 () Bool)

(assert (=> b!1439436 (=> (not res!971985) (not e!811817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439436 (= res!971985 (validKeyInArray!0 (select (arr!47203 a!2862) j!93)))))

(declare-fun b!1439437 () Bool)

(declare-fun res!971980 () Bool)

(assert (=> b!1439437 (=> (not res!971980) (not e!811817))))

(assert (=> b!1439437 (= res!971980 (validKeyInArray!0 (select (arr!47203 a!2862) i!1006)))))

(declare-fun b!1439438 () Bool)

(declare-fun res!971982 () Bool)

(assert (=> b!1439438 (=> (not res!971982) (not e!811816))))

(assert (=> b!1439438 (= res!971982 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47203 a!2862) j!93) a!2862 mask!2687) lt!632610))))

(declare-fun b!1439439 () Bool)

(assert (=> b!1439439 (= e!811816 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439440 () Bool)

(declare-fun res!971979 () Bool)

(assert (=> b!1439440 (=> (not res!971979) (not e!811817))))

(assert (=> b!1439440 (= res!971979 (and (= (size!47755 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47755 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47755 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439441 () Bool)

(declare-fun res!971984 () Bool)

(assert (=> b!1439441 (=> (not res!971984) (not e!811817))))

(declare-datatypes ((List!33782 0))(
  ( (Nil!33779) (Cons!33778 (h!35128 (_ BitVec 64)) (t!48468 List!33782)) )
))
(declare-fun arrayNoDuplicates!0 (array!97828 (_ BitVec 32) List!33782) Bool)

(assert (=> b!1439441 (= res!971984 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33779))))

(declare-fun b!1439442 () Bool)

(declare-fun res!971977 () Bool)

(assert (=> b!1439442 (=> (not res!971977) (not e!811816))))

(assert (=> b!1439442 (= res!971977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97829 (store (arr!47203 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47755 a!2862)) mask!2687) (Intermediate!11480 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (= (and start!124402 res!971981) b!1439440))

(assert (= (and b!1439440 res!971979) b!1439437))

(assert (= (and b!1439437 res!971980) b!1439436))

(assert (= (and b!1439436 res!971985) b!1439434))

(assert (= (and b!1439434 res!971986) b!1439441))

(assert (= (and b!1439441 res!971984) b!1439435))

(assert (= (and b!1439435 res!971983) b!1439433))

(assert (= (and b!1439433 res!971978) b!1439438))

(assert (= (and b!1439438 res!971982) b!1439442))

(assert (= (and b!1439442 res!971977) b!1439439))

(declare-fun m!1328049 () Bool)

(assert (=> b!1439433 m!1328049))

(assert (=> b!1439433 m!1328049))

(declare-fun m!1328051 () Bool)

(assert (=> b!1439433 m!1328051))

(assert (=> b!1439433 m!1328051))

(assert (=> b!1439433 m!1328049))

(declare-fun m!1328053 () Bool)

(assert (=> b!1439433 m!1328053))

(declare-fun m!1328055 () Bool)

(assert (=> b!1439442 m!1328055))

(declare-fun m!1328057 () Bool)

(assert (=> b!1439442 m!1328057))

(assert (=> b!1439442 m!1328057))

(declare-fun m!1328059 () Bool)

(assert (=> b!1439442 m!1328059))

(assert (=> b!1439442 m!1328059))

(assert (=> b!1439442 m!1328057))

(declare-fun m!1328061 () Bool)

(assert (=> b!1439442 m!1328061))

(assert (=> b!1439435 m!1328055))

(declare-fun m!1328063 () Bool)

(assert (=> b!1439435 m!1328063))

(declare-fun m!1328065 () Bool)

(assert (=> b!1439437 m!1328065))

(assert (=> b!1439437 m!1328065))

(declare-fun m!1328067 () Bool)

(assert (=> b!1439437 m!1328067))

(declare-fun m!1328069 () Bool)

(assert (=> b!1439434 m!1328069))

(declare-fun m!1328071 () Bool)

(assert (=> start!124402 m!1328071))

(declare-fun m!1328073 () Bool)

(assert (=> start!124402 m!1328073))

(assert (=> b!1439438 m!1328049))

(assert (=> b!1439438 m!1328049))

(declare-fun m!1328075 () Bool)

(assert (=> b!1439438 m!1328075))

(declare-fun m!1328077 () Bool)

(assert (=> b!1439441 m!1328077))

(assert (=> b!1439436 m!1328049))

(assert (=> b!1439436 m!1328049))

(declare-fun m!1328079 () Bool)

(assert (=> b!1439436 m!1328079))

(check-sat (not b!1439433) (not b!1439441) (not b!1439434) (not b!1439437) (not b!1439436) (not b!1439438) (not b!1439442) (not start!124402))
(check-sat)
