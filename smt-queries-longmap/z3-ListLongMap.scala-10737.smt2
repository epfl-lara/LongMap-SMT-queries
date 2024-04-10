; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125562 () Bool)

(assert start!125562)

(declare-fun b!1469101 () Bool)

(declare-fun res!997643 () Bool)

(declare-fun e!824804 () Bool)

(assert (=> b!1469101 (=> (not res!997643) (not e!824804))))

(declare-datatypes ((array!99010 0))(
  ( (array!99011 (arr!47793 (Array (_ BitVec 32) (_ BitVec 64))) (size!48343 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99010)

(declare-datatypes ((List!34294 0))(
  ( (Nil!34291) (Cons!34290 (h!35640 (_ BitVec 64)) (t!48988 List!34294)) )
))
(declare-fun arrayNoDuplicates!0 (array!99010 (_ BitVec 32) List!34294) Bool)

(assert (=> b!1469101 (= res!997643 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34291))))

(declare-fun b!1469102 () Bool)

(declare-fun e!824803 () Bool)

(assert (=> b!1469102 (= e!824804 e!824803)))

(declare-fun res!997640 () Bool)

(assert (=> b!1469102 (=> (not res!997640) (not e!824803))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12033 0))(
  ( (MissingZero!12033 (index!50524 (_ BitVec 32))) (Found!12033 (index!50525 (_ BitVec 32))) (Intermediate!12033 (undefined!12845 Bool) (index!50526 (_ BitVec 32)) (x!132106 (_ BitVec 32))) (Undefined!12033) (MissingVacant!12033 (index!50527 (_ BitVec 32))) )
))
(declare-fun lt!642438 () SeekEntryResult!12033)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99010 (_ BitVec 32)) SeekEntryResult!12033)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469102 (= res!997640 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47793 a!2862) j!93) mask!2687) (select (arr!47793 a!2862) j!93) a!2862 mask!2687) lt!642438))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469102 (= lt!642438 (Intermediate!12033 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469103 () Bool)

(declare-fun res!997646 () Bool)

(assert (=> b!1469103 (=> (not res!997646) (not e!824804))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469103 (= res!997646 (validKeyInArray!0 (select (arr!47793 a!2862) i!1006)))))

(declare-fun b!1469104 () Bool)

(declare-fun res!997642 () Bool)

(assert (=> b!1469104 (=> (not res!997642) (not e!824804))))

(assert (=> b!1469104 (= res!997642 (validKeyInArray!0 (select (arr!47793 a!2862) j!93)))))

(declare-fun b!1469105 () Bool)

(declare-fun res!997645 () Bool)

(assert (=> b!1469105 (=> (not res!997645) (not e!824804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99010 (_ BitVec 32)) Bool)

(assert (=> b!1469105 (= res!997645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469106 () Bool)

(assert (=> b!1469106 (= e!824803 false)))

(declare-fun lt!642437 () SeekEntryResult!12033)

(assert (=> b!1469106 (= lt!642437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47793 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47793 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99011 (store (arr!47793 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48343 a!2862)) mask!2687))))

(declare-fun b!1469107 () Bool)

(declare-fun res!997647 () Bool)

(assert (=> b!1469107 (=> (not res!997647) (not e!824804))))

(assert (=> b!1469107 (= res!997647 (and (= (size!48343 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48343 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48343 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469108 () Bool)

(declare-fun res!997648 () Bool)

(assert (=> b!1469108 (=> (not res!997648) (not e!824803))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469108 (= res!997648 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47793 a!2862) j!93) a!2862 mask!2687) lt!642438))))

(declare-fun res!997641 () Bool)

(assert (=> start!125562 (=> (not res!997641) (not e!824804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125562 (= res!997641 (validMask!0 mask!2687))))

(assert (=> start!125562 e!824804))

(assert (=> start!125562 true))

(declare-fun array_inv!36821 (array!99010) Bool)

(assert (=> start!125562 (array_inv!36821 a!2862)))

(declare-fun b!1469109 () Bool)

(declare-fun res!997644 () Bool)

(assert (=> b!1469109 (=> (not res!997644) (not e!824804))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469109 (= res!997644 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48343 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48343 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48343 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47793 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125562 res!997641) b!1469107))

(assert (= (and b!1469107 res!997647) b!1469103))

(assert (= (and b!1469103 res!997646) b!1469104))

(assert (= (and b!1469104 res!997642) b!1469105))

(assert (= (and b!1469105 res!997645) b!1469101))

(assert (= (and b!1469101 res!997643) b!1469109))

(assert (= (and b!1469109 res!997644) b!1469102))

(assert (= (and b!1469102 res!997640) b!1469108))

(assert (= (and b!1469108 res!997648) b!1469106))

(declare-fun m!1356285 () Bool)

(assert (=> b!1469105 m!1356285))

(declare-fun m!1356287 () Bool)

(assert (=> start!125562 m!1356287))

(declare-fun m!1356289 () Bool)

(assert (=> start!125562 m!1356289))

(declare-fun m!1356291 () Bool)

(assert (=> b!1469106 m!1356291))

(declare-fun m!1356293 () Bool)

(assert (=> b!1469106 m!1356293))

(assert (=> b!1469106 m!1356293))

(declare-fun m!1356295 () Bool)

(assert (=> b!1469106 m!1356295))

(assert (=> b!1469106 m!1356295))

(assert (=> b!1469106 m!1356293))

(declare-fun m!1356297 () Bool)

(assert (=> b!1469106 m!1356297))

(declare-fun m!1356299 () Bool)

(assert (=> b!1469103 m!1356299))

(assert (=> b!1469103 m!1356299))

(declare-fun m!1356301 () Bool)

(assert (=> b!1469103 m!1356301))

(declare-fun m!1356303 () Bool)

(assert (=> b!1469102 m!1356303))

(assert (=> b!1469102 m!1356303))

(declare-fun m!1356305 () Bool)

(assert (=> b!1469102 m!1356305))

(assert (=> b!1469102 m!1356305))

(assert (=> b!1469102 m!1356303))

(declare-fun m!1356307 () Bool)

(assert (=> b!1469102 m!1356307))

(declare-fun m!1356309 () Bool)

(assert (=> b!1469101 m!1356309))

(assert (=> b!1469104 m!1356303))

(assert (=> b!1469104 m!1356303))

(declare-fun m!1356311 () Bool)

(assert (=> b!1469104 m!1356311))

(assert (=> b!1469109 m!1356291))

(declare-fun m!1356313 () Bool)

(assert (=> b!1469109 m!1356313))

(assert (=> b!1469108 m!1356303))

(assert (=> b!1469108 m!1356303))

(declare-fun m!1356315 () Bool)

(assert (=> b!1469108 m!1356315))

(check-sat (not b!1469108) (not b!1469106) (not b!1469104) (not start!125562) (not b!1469102) (not b!1469103) (not b!1469105) (not b!1469101))
(check-sat)
