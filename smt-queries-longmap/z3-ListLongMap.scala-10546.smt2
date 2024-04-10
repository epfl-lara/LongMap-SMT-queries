; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124416 () Bool)

(assert start!124416)

(declare-fun b!1439401 () Bool)

(declare-fun res!971835 () Bool)

(declare-fun e!811861 () Bool)

(assert (=> b!1439401 (=> (not res!971835) (not e!811861))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97864 0))(
  ( (array!97865 (arr!47220 (Array (_ BitVec 32) (_ BitVec 64))) (size!47770 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97864)

(assert (=> b!1439401 (= res!971835 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47770 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47770 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47770 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439402 () Bool)

(declare-fun res!971830 () Bool)

(assert (=> b!1439402 (=> (not res!971830) (not e!811861))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439402 (= res!971830 (validKeyInArray!0 (select (arr!47220 a!2862) j!93)))))

(declare-fun b!1439403 () Bool)

(declare-fun res!971833 () Bool)

(assert (=> b!1439403 (=> (not res!971833) (not e!811861))))

(assert (=> b!1439403 (= res!971833 (validKeyInArray!0 (select (arr!47220 a!2862) i!1006)))))

(declare-fun b!1439404 () Bool)

(declare-fun res!971828 () Bool)

(assert (=> b!1439404 (=> (not res!971828) (not e!811861))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97864 (_ BitVec 32)) Bool)

(assert (=> b!1439404 (= res!971828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971834 () Bool)

(assert (=> start!124416 (=> (not res!971834) (not e!811861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124416 (= res!971834 (validMask!0 mask!2687))))

(assert (=> start!124416 e!811861))

(assert (=> start!124416 true))

(declare-fun array_inv!36248 (array!97864) Bool)

(assert (=> start!124416 (array_inv!36248 a!2862)))

(declare-fun b!1439405 () Bool)

(declare-fun res!971829 () Bool)

(assert (=> b!1439405 (=> (not res!971829) (not e!811861))))

(declare-datatypes ((List!33721 0))(
  ( (Nil!33718) (Cons!33717 (h!35067 (_ BitVec 64)) (t!48415 List!33721)) )
))
(declare-fun arrayNoDuplicates!0 (array!97864 (_ BitVec 32) List!33721) Bool)

(assert (=> b!1439405 (= res!971829 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33718))))

(declare-fun b!1439406 () Bool)

(declare-fun e!811862 () Bool)

(assert (=> b!1439406 (= e!811862 false)))

(declare-datatypes ((SeekEntryResult!11472 0))(
  ( (MissingZero!11472 (index!48280 (_ BitVec 32))) (Found!11472 (index!48281 (_ BitVec 32))) (Intermediate!11472 (undefined!12284 Bool) (index!48282 (_ BitVec 32)) (x!130017 (_ BitVec 32))) (Undefined!11472) (MissingVacant!11472 (index!48283 (_ BitVec 32))) )
))
(declare-fun lt!632808 () SeekEntryResult!11472)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97864 (_ BitVec 32)) SeekEntryResult!11472)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439406 (= lt!632808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97865 (store (arr!47220 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47770 a!2862)) mask!2687))))

(declare-fun b!1439407 () Bool)

(declare-fun res!971831 () Bool)

(assert (=> b!1439407 (=> (not res!971831) (not e!811861))))

(assert (=> b!1439407 (= res!971831 (and (= (size!47770 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47770 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47770 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439408 () Bool)

(assert (=> b!1439408 (= e!811861 e!811862)))

(declare-fun res!971836 () Bool)

(assert (=> b!1439408 (=> (not res!971836) (not e!811862))))

(declare-fun lt!632807 () SeekEntryResult!11472)

(assert (=> b!1439408 (= res!971836 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47220 a!2862) j!93) mask!2687) (select (arr!47220 a!2862) j!93) a!2862 mask!2687) lt!632807))))

(assert (=> b!1439408 (= lt!632807 (Intermediate!11472 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439409 () Bool)

(declare-fun res!971832 () Bool)

(assert (=> b!1439409 (=> (not res!971832) (not e!811862))))

(assert (=> b!1439409 (= res!971832 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47220 a!2862) j!93) a!2862 mask!2687) lt!632807))))

(assert (= (and start!124416 res!971834) b!1439407))

(assert (= (and b!1439407 res!971831) b!1439403))

(assert (= (and b!1439403 res!971833) b!1439402))

(assert (= (and b!1439402 res!971830) b!1439404))

(assert (= (and b!1439404 res!971828) b!1439405))

(assert (= (and b!1439405 res!971829) b!1439401))

(assert (= (and b!1439401 res!971835) b!1439408))

(assert (= (and b!1439408 res!971836) b!1439409))

(assert (= (and b!1439409 res!971832) b!1439406))

(declare-fun m!1328469 () Bool)

(assert (=> b!1439408 m!1328469))

(assert (=> b!1439408 m!1328469))

(declare-fun m!1328471 () Bool)

(assert (=> b!1439408 m!1328471))

(assert (=> b!1439408 m!1328471))

(assert (=> b!1439408 m!1328469))

(declare-fun m!1328473 () Bool)

(assert (=> b!1439408 m!1328473))

(declare-fun m!1328475 () Bool)

(assert (=> start!124416 m!1328475))

(declare-fun m!1328477 () Bool)

(assert (=> start!124416 m!1328477))

(declare-fun m!1328479 () Bool)

(assert (=> b!1439405 m!1328479))

(declare-fun m!1328481 () Bool)

(assert (=> b!1439401 m!1328481))

(declare-fun m!1328483 () Bool)

(assert (=> b!1439401 m!1328483))

(assert (=> b!1439409 m!1328469))

(assert (=> b!1439409 m!1328469))

(declare-fun m!1328485 () Bool)

(assert (=> b!1439409 m!1328485))

(assert (=> b!1439402 m!1328469))

(assert (=> b!1439402 m!1328469))

(declare-fun m!1328487 () Bool)

(assert (=> b!1439402 m!1328487))

(declare-fun m!1328489 () Bool)

(assert (=> b!1439403 m!1328489))

(assert (=> b!1439403 m!1328489))

(declare-fun m!1328491 () Bool)

(assert (=> b!1439403 m!1328491))

(assert (=> b!1439406 m!1328481))

(declare-fun m!1328493 () Bool)

(assert (=> b!1439406 m!1328493))

(assert (=> b!1439406 m!1328493))

(declare-fun m!1328495 () Bool)

(assert (=> b!1439406 m!1328495))

(assert (=> b!1439406 m!1328495))

(assert (=> b!1439406 m!1328493))

(declare-fun m!1328497 () Bool)

(assert (=> b!1439406 m!1328497))

(declare-fun m!1328499 () Bool)

(assert (=> b!1439404 m!1328499))

(check-sat (not b!1439403) (not b!1439408) (not b!1439405) (not b!1439406) (not b!1439402) (not b!1439409) (not b!1439404) (not start!124416))
(check-sat)
