; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125772 () Bool)

(assert start!125772)

(declare-fun res!997336 () Bool)

(declare-fun e!825559 () Bool)

(assert (=> start!125772 (=> (not res!997336) (not e!825559))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125772 (= res!997336 (validMask!0 mask!2687))))

(assert (=> start!125772 e!825559))

(assert (=> start!125772 true))

(declare-datatypes ((array!99058 0))(
  ( (array!99059 (arr!47812 (Array (_ BitVec 32) (_ BitVec 64))) (size!48363 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99058)

(declare-fun array_inv!37093 (array!99058) Bool)

(assert (=> start!125772 (array_inv!37093 a!2862)))

(declare-fun b!1469891 () Bool)

(declare-fun res!997334 () Bool)

(assert (=> b!1469891 (=> (not res!997334) (not e!825559))))

(declare-datatypes ((List!34300 0))(
  ( (Nil!34297) (Cons!34296 (h!35660 (_ BitVec 64)) (t!48986 List!34300)) )
))
(declare-fun arrayNoDuplicates!0 (array!99058 (_ BitVec 32) List!34300) Bool)

(assert (=> b!1469891 (= res!997334 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34297))))

(declare-fun b!1469892 () Bool)

(declare-fun res!997340 () Bool)

(assert (=> b!1469892 (=> (not res!997340) (not e!825559))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469892 (= res!997340 (validKeyInArray!0 (select (arr!47812 a!2862) i!1006)))))

(declare-fun b!1469893 () Bool)

(declare-fun res!997338 () Bool)

(assert (=> b!1469893 (=> (not res!997338) (not e!825559))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469893 (= res!997338 (and (= (size!48363 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48363 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48363 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469894 () Bool)

(declare-fun e!825561 () Bool)

(assert (=> b!1469894 (= e!825559 e!825561)))

(declare-fun res!997332 () Bool)

(assert (=> b!1469894 (=> (not res!997332) (not e!825561))))

(declare-datatypes ((SeekEntryResult!11949 0))(
  ( (MissingZero!11949 (index!50188 (_ BitVec 32))) (Found!11949 (index!50189 (_ BitVec 32))) (Intermediate!11949 (undefined!12761 Bool) (index!50190 (_ BitVec 32)) (x!131967 (_ BitVec 32))) (Undefined!11949) (MissingVacant!11949 (index!50191 (_ BitVec 32))) )
))
(declare-fun lt!642870 () SeekEntryResult!11949)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99058 (_ BitVec 32)) SeekEntryResult!11949)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469894 (= res!997332 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47812 a!2862) j!93) mask!2687) (select (arr!47812 a!2862) j!93) a!2862 mask!2687) lt!642870))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469894 (= lt!642870 (Intermediate!11949 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469895 () Bool)

(declare-fun res!997337 () Bool)

(assert (=> b!1469895 (=> (not res!997337) (not e!825559))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469895 (= res!997337 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48363 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48363 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48363 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469896 () Bool)

(declare-fun res!997339 () Bool)

(assert (=> b!1469896 (=> (not res!997339) (not e!825559))))

(assert (=> b!1469896 (= res!997339 (validKeyInArray!0 (select (arr!47812 a!2862) j!93)))))

(declare-fun b!1469897 () Bool)

(assert (=> b!1469897 (= e!825561 false)))

(declare-fun lt!642871 () SeekEntryResult!11949)

(assert (=> b!1469897 (= lt!642871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99059 (store (arr!47812 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48363 a!2862)) mask!2687))))

(declare-fun b!1469898 () Bool)

(declare-fun res!997333 () Bool)

(assert (=> b!1469898 (=> (not res!997333) (not e!825559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99058 (_ BitVec 32)) Bool)

(assert (=> b!1469898 (= res!997333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469899 () Bool)

(declare-fun res!997335 () Bool)

(assert (=> b!1469899 (=> (not res!997335) (not e!825561))))

(assert (=> b!1469899 (= res!997335 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47812 a!2862) j!93) a!2862 mask!2687) lt!642870))))

(assert (= (and start!125772 res!997336) b!1469893))

(assert (= (and b!1469893 res!997338) b!1469892))

(assert (= (and b!1469892 res!997340) b!1469896))

(assert (= (and b!1469896 res!997339) b!1469898))

(assert (= (and b!1469898 res!997333) b!1469891))

(assert (= (and b!1469891 res!997334) b!1469895))

(assert (= (and b!1469895 res!997337) b!1469894))

(assert (= (and b!1469894 res!997332) b!1469899))

(assert (= (and b!1469899 res!997335) b!1469897))

(declare-fun m!1356883 () Bool)

(assert (=> b!1469896 m!1356883))

(assert (=> b!1469896 m!1356883))

(declare-fun m!1356885 () Bool)

(assert (=> b!1469896 m!1356885))

(declare-fun m!1356887 () Bool)

(assert (=> b!1469897 m!1356887))

(declare-fun m!1356889 () Bool)

(assert (=> b!1469897 m!1356889))

(assert (=> b!1469897 m!1356889))

(declare-fun m!1356891 () Bool)

(assert (=> b!1469897 m!1356891))

(assert (=> b!1469897 m!1356891))

(assert (=> b!1469897 m!1356889))

(declare-fun m!1356893 () Bool)

(assert (=> b!1469897 m!1356893))

(assert (=> b!1469894 m!1356883))

(assert (=> b!1469894 m!1356883))

(declare-fun m!1356895 () Bool)

(assert (=> b!1469894 m!1356895))

(assert (=> b!1469894 m!1356895))

(assert (=> b!1469894 m!1356883))

(declare-fun m!1356897 () Bool)

(assert (=> b!1469894 m!1356897))

(declare-fun m!1356899 () Bool)

(assert (=> start!125772 m!1356899))

(declare-fun m!1356901 () Bool)

(assert (=> start!125772 m!1356901))

(declare-fun m!1356903 () Bool)

(assert (=> b!1469892 m!1356903))

(assert (=> b!1469892 m!1356903))

(declare-fun m!1356905 () Bool)

(assert (=> b!1469892 m!1356905))

(declare-fun m!1356907 () Bool)

(assert (=> b!1469898 m!1356907))

(assert (=> b!1469899 m!1356883))

(assert (=> b!1469899 m!1356883))

(declare-fun m!1356909 () Bool)

(assert (=> b!1469899 m!1356909))

(assert (=> b!1469895 m!1356887))

(declare-fun m!1356911 () Bool)

(assert (=> b!1469895 m!1356911))

(declare-fun m!1356913 () Bool)

(assert (=> b!1469891 m!1356913))

(check-sat (not b!1469894) (not b!1469891) (not b!1469898) (not b!1469896) (not b!1469899) (not start!125772) (not b!1469897) (not b!1469892))
(check-sat)
