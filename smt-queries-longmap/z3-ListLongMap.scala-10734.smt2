; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125544 () Bool)

(assert start!125544)

(declare-fun b!1468858 () Bool)

(declare-fun res!997401 () Bool)

(declare-fun e!824722 () Bool)

(assert (=> b!1468858 (=> (not res!997401) (not e!824722))))

(declare-datatypes ((array!98992 0))(
  ( (array!98993 (arr!47784 (Array (_ BitVec 32) (_ BitVec 64))) (size!48334 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98992)

(declare-datatypes ((List!34285 0))(
  ( (Nil!34282) (Cons!34281 (h!35631 (_ BitVec 64)) (t!48979 List!34285)) )
))
(declare-fun arrayNoDuplicates!0 (array!98992 (_ BitVec 32) List!34285) Bool)

(assert (=> b!1468858 (= res!997401 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34282))))

(declare-fun b!1468859 () Bool)

(declare-fun res!997402 () Bool)

(assert (=> b!1468859 (=> (not res!997402) (not e!824722))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468859 (= res!997402 (and (= (size!48334 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48334 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48334 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468860 () Bool)

(declare-fun res!997399 () Bool)

(assert (=> b!1468860 (=> (not res!997399) (not e!824722))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468860 (= res!997399 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48334 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48334 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48334 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47784 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468862 () Bool)

(declare-fun e!824721 () Bool)

(assert (=> b!1468862 (= e!824721 false)))

(declare-datatypes ((SeekEntryResult!12024 0))(
  ( (MissingZero!12024 (index!50488 (_ BitVec 32))) (Found!12024 (index!50489 (_ BitVec 32))) (Intermediate!12024 (undefined!12836 Bool) (index!50490 (_ BitVec 32)) (x!132073 (_ BitVec 32))) (Undefined!12024) (MissingVacant!12024 (index!50491 (_ BitVec 32))) )
))
(declare-fun lt!642384 () SeekEntryResult!12024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98992 (_ BitVec 32)) SeekEntryResult!12024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468862 (= lt!642384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47784 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47784 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98993 (store (arr!47784 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48334 a!2862)) mask!2687))))

(declare-fun b!1468863 () Bool)

(declare-fun res!997404 () Bool)

(assert (=> b!1468863 (=> (not res!997404) (not e!824722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98992 (_ BitVec 32)) Bool)

(assert (=> b!1468863 (= res!997404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468864 () Bool)

(declare-fun res!997403 () Bool)

(assert (=> b!1468864 (=> (not res!997403) (not e!824722))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468864 (= res!997403 (validKeyInArray!0 (select (arr!47784 a!2862) j!93)))))

(declare-fun b!1468865 () Bool)

(declare-fun res!997400 () Bool)

(assert (=> b!1468865 (=> (not res!997400) (not e!824722))))

(assert (=> b!1468865 (= res!997400 (validKeyInArray!0 (select (arr!47784 a!2862) i!1006)))))

(declare-fun b!1468866 () Bool)

(declare-fun res!997398 () Bool)

(assert (=> b!1468866 (=> (not res!997398) (not e!824721))))

(declare-fun lt!642383 () SeekEntryResult!12024)

(assert (=> b!1468866 (= res!997398 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47784 a!2862) j!93) a!2862 mask!2687) lt!642383))))

(declare-fun b!1468861 () Bool)

(assert (=> b!1468861 (= e!824722 e!824721)))

(declare-fun res!997405 () Bool)

(assert (=> b!1468861 (=> (not res!997405) (not e!824721))))

(assert (=> b!1468861 (= res!997405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47784 a!2862) j!93) mask!2687) (select (arr!47784 a!2862) j!93) a!2862 mask!2687) lt!642383))))

(assert (=> b!1468861 (= lt!642383 (Intermediate!12024 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997397 () Bool)

(assert (=> start!125544 (=> (not res!997397) (not e!824722))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125544 (= res!997397 (validMask!0 mask!2687))))

(assert (=> start!125544 e!824722))

(assert (=> start!125544 true))

(declare-fun array_inv!36812 (array!98992) Bool)

(assert (=> start!125544 (array_inv!36812 a!2862)))

(assert (= (and start!125544 res!997397) b!1468859))

(assert (= (and b!1468859 res!997402) b!1468865))

(assert (= (and b!1468865 res!997400) b!1468864))

(assert (= (and b!1468864 res!997403) b!1468863))

(assert (= (and b!1468863 res!997404) b!1468858))

(assert (= (and b!1468858 res!997401) b!1468860))

(assert (= (and b!1468860 res!997399) b!1468861))

(assert (= (and b!1468861 res!997405) b!1468866))

(assert (= (and b!1468866 res!997398) b!1468862))

(declare-fun m!1355997 () Bool)

(assert (=> b!1468858 m!1355997))

(declare-fun m!1355999 () Bool)

(assert (=> b!1468860 m!1355999))

(declare-fun m!1356001 () Bool)

(assert (=> b!1468860 m!1356001))

(declare-fun m!1356003 () Bool)

(assert (=> b!1468864 m!1356003))

(assert (=> b!1468864 m!1356003))

(declare-fun m!1356005 () Bool)

(assert (=> b!1468864 m!1356005))

(declare-fun m!1356007 () Bool)

(assert (=> b!1468865 m!1356007))

(assert (=> b!1468865 m!1356007))

(declare-fun m!1356009 () Bool)

(assert (=> b!1468865 m!1356009))

(declare-fun m!1356011 () Bool)

(assert (=> start!125544 m!1356011))

(declare-fun m!1356013 () Bool)

(assert (=> start!125544 m!1356013))

(assert (=> b!1468866 m!1356003))

(assert (=> b!1468866 m!1356003))

(declare-fun m!1356015 () Bool)

(assert (=> b!1468866 m!1356015))

(assert (=> b!1468862 m!1355999))

(declare-fun m!1356017 () Bool)

(assert (=> b!1468862 m!1356017))

(assert (=> b!1468862 m!1356017))

(declare-fun m!1356019 () Bool)

(assert (=> b!1468862 m!1356019))

(assert (=> b!1468862 m!1356019))

(assert (=> b!1468862 m!1356017))

(declare-fun m!1356021 () Bool)

(assert (=> b!1468862 m!1356021))

(declare-fun m!1356023 () Bool)

(assert (=> b!1468863 m!1356023))

(assert (=> b!1468861 m!1356003))

(assert (=> b!1468861 m!1356003))

(declare-fun m!1356025 () Bool)

(assert (=> b!1468861 m!1356025))

(assert (=> b!1468861 m!1356025))

(assert (=> b!1468861 m!1356003))

(declare-fun m!1356027 () Bool)

(assert (=> b!1468861 m!1356027))

(check-sat (not b!1468862) (not b!1468866) (not b!1468858) (not start!125544) (not b!1468865) (not b!1468864) (not b!1468861) (not b!1468863))
(check-sat)
