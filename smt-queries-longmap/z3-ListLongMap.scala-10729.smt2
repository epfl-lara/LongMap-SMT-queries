; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125482 () Bool)

(assert start!125482)

(declare-fun b!1468231 () Bool)

(declare-fun res!996890 () Bool)

(declare-fun e!824461 () Bool)

(assert (=> b!1468231 (=> (not res!996890) (not e!824461))))

(declare-datatypes ((array!98908 0))(
  ( (array!98909 (arr!47743 (Array (_ BitVec 32) (_ BitVec 64))) (size!48295 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98908)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468231 (= res!996890 (validKeyInArray!0 (select (arr!47743 a!2862) j!93)))))

(declare-fun b!1468232 () Bool)

(declare-fun res!996888 () Bool)

(assert (=> b!1468232 (=> (not res!996888) (not e!824461))))

(declare-datatypes ((List!34322 0))(
  ( (Nil!34319) (Cons!34318 (h!35668 (_ BitVec 64)) (t!49008 List!34322)) )
))
(declare-fun arrayNoDuplicates!0 (array!98908 (_ BitVec 32) List!34322) Bool)

(assert (=> b!1468232 (= res!996888 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34319))))

(declare-fun b!1468233 () Bool)

(declare-fun res!996887 () Bool)

(assert (=> b!1468233 (=> (not res!996887) (not e!824461))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468233 (= res!996887 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48295 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48295 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48295 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468234 () Bool)

(declare-fun res!996891 () Bool)

(assert (=> b!1468234 (=> (not res!996891) (not e!824461))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98908 (_ BitVec 32)) Bool)

(assert (=> b!1468234 (= res!996891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468235 () Bool)

(declare-fun res!996895 () Bool)

(assert (=> b!1468235 (=> (not res!996895) (not e!824461))))

(assert (=> b!1468235 (= res!996895 (and (= (size!48295 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48295 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48295 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468236 () Bool)

(declare-fun res!996893 () Bool)

(declare-fun e!824462 () Bool)

(assert (=> b!1468236 (=> (not res!996893) (not e!824462))))

(declare-datatypes ((SeekEntryResult!12008 0))(
  ( (MissingZero!12008 (index!50424 (_ BitVec 32))) (Found!12008 (index!50425 (_ BitVec 32))) (Intermediate!12008 (undefined!12820 Bool) (index!50426 (_ BitVec 32)) (x!132012 (_ BitVec 32))) (Undefined!12008) (MissingVacant!12008 (index!50427 (_ BitVec 32))) )
))
(declare-fun lt!642053 () SeekEntryResult!12008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98908 (_ BitVec 32)) SeekEntryResult!12008)

(assert (=> b!1468236 (= res!996893 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47743 a!2862) j!93) a!2862 mask!2687) lt!642053))))

(declare-fun res!996889 () Bool)

(assert (=> start!125482 (=> (not res!996889) (not e!824461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125482 (= res!996889 (validMask!0 mask!2687))))

(assert (=> start!125482 e!824461))

(assert (=> start!125482 true))

(declare-fun array_inv!36976 (array!98908) Bool)

(assert (=> start!125482 (array_inv!36976 a!2862)))

(declare-fun b!1468237 () Bool)

(assert (=> b!1468237 (= e!824461 e!824462)))

(declare-fun res!996894 () Bool)

(assert (=> b!1468237 (=> (not res!996894) (not e!824462))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468237 (= res!996894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47743 a!2862) j!93) mask!2687) (select (arr!47743 a!2862) j!93) a!2862 mask!2687) lt!642053))))

(assert (=> b!1468237 (= lt!642053 (Intermediate!12008 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468238 () Bool)

(declare-fun res!996892 () Bool)

(assert (=> b!1468238 (=> (not res!996892) (not e!824461))))

(assert (=> b!1468238 (= res!996892 (validKeyInArray!0 (select (arr!47743 a!2862) i!1006)))))

(declare-fun b!1468239 () Bool)

(assert (=> b!1468239 (= e!824462 false)))

(declare-fun lt!642054 () SeekEntryResult!12008)

(assert (=> b!1468239 (= lt!642054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98909 (store (arr!47743 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48295 a!2862)) mask!2687))))

(assert (= (and start!125482 res!996889) b!1468235))

(assert (= (and b!1468235 res!996895) b!1468238))

(assert (= (and b!1468238 res!996892) b!1468231))

(assert (= (and b!1468231 res!996890) b!1468234))

(assert (= (and b!1468234 res!996891) b!1468232))

(assert (= (and b!1468232 res!996888) b!1468233))

(assert (= (and b!1468233 res!996887) b!1468237))

(assert (= (and b!1468237 res!996894) b!1468236))

(assert (= (and b!1468236 res!996893) b!1468239))

(declare-fun m!1354809 () Bool)

(assert (=> start!125482 m!1354809))

(declare-fun m!1354811 () Bool)

(assert (=> start!125482 m!1354811))

(declare-fun m!1354813 () Bool)

(assert (=> b!1468238 m!1354813))

(assert (=> b!1468238 m!1354813))

(declare-fun m!1354815 () Bool)

(assert (=> b!1468238 m!1354815))

(declare-fun m!1354817 () Bool)

(assert (=> b!1468237 m!1354817))

(assert (=> b!1468237 m!1354817))

(declare-fun m!1354819 () Bool)

(assert (=> b!1468237 m!1354819))

(assert (=> b!1468237 m!1354819))

(assert (=> b!1468237 m!1354817))

(declare-fun m!1354821 () Bool)

(assert (=> b!1468237 m!1354821))

(declare-fun m!1354823 () Bool)

(assert (=> b!1468232 m!1354823))

(assert (=> b!1468231 m!1354817))

(assert (=> b!1468231 m!1354817))

(declare-fun m!1354825 () Bool)

(assert (=> b!1468231 m!1354825))

(declare-fun m!1354827 () Bool)

(assert (=> b!1468233 m!1354827))

(declare-fun m!1354829 () Bool)

(assert (=> b!1468233 m!1354829))

(declare-fun m!1354831 () Bool)

(assert (=> b!1468234 m!1354831))

(assert (=> b!1468239 m!1354827))

(declare-fun m!1354833 () Bool)

(assert (=> b!1468239 m!1354833))

(assert (=> b!1468239 m!1354833))

(declare-fun m!1354835 () Bool)

(assert (=> b!1468239 m!1354835))

(assert (=> b!1468239 m!1354835))

(assert (=> b!1468239 m!1354833))

(declare-fun m!1354837 () Bool)

(assert (=> b!1468239 m!1354837))

(assert (=> b!1468236 m!1354817))

(assert (=> b!1468236 m!1354817))

(declare-fun m!1354839 () Bool)

(assert (=> b!1468236 m!1354839))

(check-sat (not b!1468238) (not start!125482) (not b!1468236) (not b!1468234) (not b!1468239) (not b!1468237) (not b!1468231) (not b!1468232))
(check-sat)
