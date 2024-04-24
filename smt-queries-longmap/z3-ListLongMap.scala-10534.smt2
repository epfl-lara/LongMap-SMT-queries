; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124434 () Bool)

(assert start!124434)

(declare-fun res!970998 () Bool)

(declare-fun e!811941 () Bool)

(assert (=> start!124434 (=> (not res!970998) (not e!811941))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124434 (= res!970998 (validMask!0 mask!2687))))

(assert (=> start!124434 e!811941))

(assert (=> start!124434 true))

(declare-datatypes ((array!97894 0))(
  ( (array!97895 (arr!47236 (Array (_ BitVec 32) (_ BitVec 64))) (size!47787 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97894)

(declare-fun array_inv!36517 (array!97894) Bool)

(assert (=> start!124434 (array_inv!36517 a!2862)))

(declare-fun b!1439045 () Bool)

(declare-fun res!971001 () Bool)

(assert (=> b!1439045 (=> (not res!971001) (not e!811941))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439045 (= res!971001 (validKeyInArray!0 (select (arr!47236 a!2862) j!93)))))

(declare-fun b!1439046 () Bool)

(declare-fun res!971006 () Bool)

(assert (=> b!1439046 (=> (not res!971006) (not e!811941))))

(declare-datatypes ((List!33724 0))(
  ( (Nil!33721) (Cons!33720 (h!35072 (_ BitVec 64)) (t!48410 List!33724)) )
))
(declare-fun arrayNoDuplicates!0 (array!97894 (_ BitVec 32) List!33724) Bool)

(assert (=> b!1439046 (= res!971006 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33721))))

(declare-fun b!1439047 () Bool)

(declare-fun res!970999 () Bool)

(assert (=> b!1439047 (=> (not res!970999) (not e!811941))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439047 (= res!970999 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47787 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47787 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47787 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439048 () Bool)

(declare-fun e!811940 () Bool)

(assert (=> b!1439048 (= e!811940 false)))

(declare-fun lt!632853 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439048 (= lt!632853 (toIndex!0 (select (store (arr!47236 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1439049 () Bool)

(declare-fun res!971000 () Bool)

(assert (=> b!1439049 (=> (not res!971000) (not e!811941))))

(assert (=> b!1439049 (= res!971000 (and (= (size!47787 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47787 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47787 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439050 () Bool)

(declare-fun res!971003 () Bool)

(assert (=> b!1439050 (=> (not res!971003) (not e!811940))))

(declare-datatypes ((SeekEntryResult!11385 0))(
  ( (MissingZero!11385 (index!47932 (_ BitVec 32))) (Found!11385 (index!47933 (_ BitVec 32))) (Intermediate!11385 (undefined!12197 Bool) (index!47934 (_ BitVec 32)) (x!129840 (_ BitVec 32))) (Undefined!11385) (MissingVacant!11385 (index!47935 (_ BitVec 32))) )
))
(declare-fun lt!632854 () SeekEntryResult!11385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97894 (_ BitVec 32)) SeekEntryResult!11385)

(assert (=> b!1439050 (= res!971003 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47236 a!2862) j!93) a!2862 mask!2687) lt!632854))))

(declare-fun b!1439051 () Bool)

(declare-fun res!971004 () Bool)

(assert (=> b!1439051 (=> (not res!971004) (not e!811941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97894 (_ BitVec 32)) Bool)

(assert (=> b!1439051 (= res!971004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439052 () Bool)

(assert (=> b!1439052 (= e!811941 e!811940)))

(declare-fun res!971005 () Bool)

(assert (=> b!1439052 (=> (not res!971005) (not e!811940))))

(assert (=> b!1439052 (= res!971005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47236 a!2862) j!93) mask!2687) (select (arr!47236 a!2862) j!93) a!2862 mask!2687) lt!632854))))

(assert (=> b!1439052 (= lt!632854 (Intermediate!11385 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439053 () Bool)

(declare-fun res!971002 () Bool)

(assert (=> b!1439053 (=> (not res!971002) (not e!811941))))

(assert (=> b!1439053 (= res!971002 (validKeyInArray!0 (select (arr!47236 a!2862) i!1006)))))

(assert (= (and start!124434 res!970998) b!1439049))

(assert (= (and b!1439049 res!971000) b!1439053))

(assert (= (and b!1439053 res!971002) b!1439045))

(assert (= (and b!1439045 res!971001) b!1439051))

(assert (= (and b!1439051 res!971004) b!1439046))

(assert (= (and b!1439046 res!971006) b!1439047))

(assert (= (and b!1439047 res!970999) b!1439052))

(assert (= (and b!1439052 res!971005) b!1439050))

(assert (= (and b!1439050 res!971003) b!1439048))

(declare-fun m!1328401 () Bool)

(assert (=> b!1439053 m!1328401))

(assert (=> b!1439053 m!1328401))

(declare-fun m!1328403 () Bool)

(assert (=> b!1439053 m!1328403))

(declare-fun m!1328405 () Bool)

(assert (=> b!1439051 m!1328405))

(declare-fun m!1328407 () Bool)

(assert (=> b!1439048 m!1328407))

(declare-fun m!1328409 () Bool)

(assert (=> b!1439048 m!1328409))

(assert (=> b!1439048 m!1328409))

(declare-fun m!1328411 () Bool)

(assert (=> b!1439048 m!1328411))

(declare-fun m!1328413 () Bool)

(assert (=> b!1439046 m!1328413))

(declare-fun m!1328415 () Bool)

(assert (=> start!124434 m!1328415))

(declare-fun m!1328417 () Bool)

(assert (=> start!124434 m!1328417))

(assert (=> b!1439047 m!1328407))

(declare-fun m!1328419 () Bool)

(assert (=> b!1439047 m!1328419))

(declare-fun m!1328421 () Bool)

(assert (=> b!1439045 m!1328421))

(assert (=> b!1439045 m!1328421))

(declare-fun m!1328423 () Bool)

(assert (=> b!1439045 m!1328423))

(assert (=> b!1439050 m!1328421))

(assert (=> b!1439050 m!1328421))

(declare-fun m!1328425 () Bool)

(assert (=> b!1439050 m!1328425))

(assert (=> b!1439052 m!1328421))

(assert (=> b!1439052 m!1328421))

(declare-fun m!1328427 () Bool)

(assert (=> b!1439052 m!1328427))

(assert (=> b!1439052 m!1328427))

(assert (=> b!1439052 m!1328421))

(declare-fun m!1328429 () Bool)

(assert (=> b!1439052 m!1328429))

(check-sat (not b!1439050) (not b!1439046) (not b!1439051) (not b!1439053) (not b!1439052) (not start!124434) (not b!1439045) (not b!1439048))
(check-sat)
