; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125778 () Bool)

(assert start!125778)

(declare-fun b!1469972 () Bool)

(declare-fun res!997420 () Bool)

(declare-fun e!825588 () Bool)

(assert (=> b!1469972 (=> (not res!997420) (not e!825588))))

(declare-datatypes ((array!99064 0))(
  ( (array!99065 (arr!47815 (Array (_ BitVec 32) (_ BitVec 64))) (size!48366 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99064)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469972 (= res!997420 (validKeyInArray!0 (select (arr!47815 a!2862) i!1006)))))

(declare-fun b!1469973 () Bool)

(declare-fun e!825587 () Bool)

(assert (=> b!1469973 (= e!825588 e!825587)))

(declare-fun res!997413 () Bool)

(assert (=> b!1469973 (=> (not res!997413) (not e!825587))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11952 0))(
  ( (MissingZero!11952 (index!50200 (_ BitVec 32))) (Found!11952 (index!50201 (_ BitVec 32))) (Intermediate!11952 (undefined!12764 Bool) (index!50202 (_ BitVec 32)) (x!131978 (_ BitVec 32))) (Undefined!11952) (MissingVacant!11952 (index!50203 (_ BitVec 32))) )
))
(declare-fun lt!642888 () SeekEntryResult!11952)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99064 (_ BitVec 32)) SeekEntryResult!11952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469973 (= res!997413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47815 a!2862) j!93) mask!2687) (select (arr!47815 a!2862) j!93) a!2862 mask!2687) lt!642888))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469973 (= lt!642888 (Intermediate!11952 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469974 () Bool)

(assert (=> b!1469974 (= e!825587 false)))

(declare-fun lt!642889 () SeekEntryResult!11952)

(assert (=> b!1469974 (= lt!642889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99065 (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48366 a!2862)) mask!2687))))

(declare-fun b!1469975 () Bool)

(declare-fun res!997418 () Bool)

(assert (=> b!1469975 (=> (not res!997418) (not e!825588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99064 (_ BitVec 32)) Bool)

(assert (=> b!1469975 (= res!997418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469976 () Bool)

(declare-fun res!997417 () Bool)

(assert (=> b!1469976 (=> (not res!997417) (not e!825587))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469976 (= res!997417 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47815 a!2862) j!93) a!2862 mask!2687) lt!642888))))

(declare-fun b!1469977 () Bool)

(declare-fun res!997421 () Bool)

(assert (=> b!1469977 (=> (not res!997421) (not e!825588))))

(assert (=> b!1469977 (= res!997421 (and (= (size!48366 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48366 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48366 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469978 () Bool)

(declare-fun res!997415 () Bool)

(assert (=> b!1469978 (=> (not res!997415) (not e!825588))))

(declare-datatypes ((List!34303 0))(
  ( (Nil!34300) (Cons!34299 (h!35663 (_ BitVec 64)) (t!48989 List!34303)) )
))
(declare-fun arrayNoDuplicates!0 (array!99064 (_ BitVec 32) List!34303) Bool)

(assert (=> b!1469978 (= res!997415 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34300))))

(declare-fun res!997414 () Bool)

(assert (=> start!125778 (=> (not res!997414) (not e!825588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125778 (= res!997414 (validMask!0 mask!2687))))

(assert (=> start!125778 e!825588))

(assert (=> start!125778 true))

(declare-fun array_inv!37096 (array!99064) Bool)

(assert (=> start!125778 (array_inv!37096 a!2862)))

(declare-fun b!1469979 () Bool)

(declare-fun res!997419 () Bool)

(assert (=> b!1469979 (=> (not res!997419) (not e!825588))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469979 (= res!997419 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48366 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48366 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48366 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47815 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469980 () Bool)

(declare-fun res!997416 () Bool)

(assert (=> b!1469980 (=> (not res!997416) (not e!825588))))

(assert (=> b!1469980 (= res!997416 (validKeyInArray!0 (select (arr!47815 a!2862) j!93)))))

(assert (= (and start!125778 res!997414) b!1469977))

(assert (= (and b!1469977 res!997421) b!1469972))

(assert (= (and b!1469972 res!997420) b!1469980))

(assert (= (and b!1469980 res!997416) b!1469975))

(assert (= (and b!1469975 res!997418) b!1469978))

(assert (= (and b!1469978 res!997415) b!1469979))

(assert (= (and b!1469979 res!997419) b!1469973))

(assert (= (and b!1469973 res!997413) b!1469976))

(assert (= (and b!1469976 res!997417) b!1469974))

(declare-fun m!1356979 () Bool)

(assert (=> b!1469979 m!1356979))

(declare-fun m!1356981 () Bool)

(assert (=> b!1469979 m!1356981))

(declare-fun m!1356983 () Bool)

(assert (=> b!1469972 m!1356983))

(assert (=> b!1469972 m!1356983))

(declare-fun m!1356985 () Bool)

(assert (=> b!1469972 m!1356985))

(declare-fun m!1356987 () Bool)

(assert (=> b!1469975 m!1356987))

(declare-fun m!1356989 () Bool)

(assert (=> b!1469973 m!1356989))

(assert (=> b!1469973 m!1356989))

(declare-fun m!1356991 () Bool)

(assert (=> b!1469973 m!1356991))

(assert (=> b!1469973 m!1356991))

(assert (=> b!1469973 m!1356989))

(declare-fun m!1356993 () Bool)

(assert (=> b!1469973 m!1356993))

(assert (=> b!1469976 m!1356989))

(assert (=> b!1469976 m!1356989))

(declare-fun m!1356995 () Bool)

(assert (=> b!1469976 m!1356995))

(assert (=> b!1469980 m!1356989))

(assert (=> b!1469980 m!1356989))

(declare-fun m!1356997 () Bool)

(assert (=> b!1469980 m!1356997))

(assert (=> b!1469974 m!1356979))

(declare-fun m!1356999 () Bool)

(assert (=> b!1469974 m!1356999))

(assert (=> b!1469974 m!1356999))

(declare-fun m!1357001 () Bool)

(assert (=> b!1469974 m!1357001))

(assert (=> b!1469974 m!1357001))

(assert (=> b!1469974 m!1356999))

(declare-fun m!1357003 () Bool)

(assert (=> b!1469974 m!1357003))

(declare-fun m!1357005 () Bool)

(assert (=> start!125778 m!1357005))

(declare-fun m!1357007 () Bool)

(assert (=> start!125778 m!1357007))

(declare-fun m!1357009 () Bool)

(assert (=> b!1469978 m!1357009))

(check-sat (not b!1469974) (not b!1469980) (not b!1469973) (not b!1469975) (not b!1469976) (not start!125778) (not b!1469972) (not b!1469978))
(check-sat)
