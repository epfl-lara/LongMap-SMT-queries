; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125470 () Bool)

(assert start!125470)

(declare-fun b!1467859 () Bool)

(declare-fun res!996403 () Bool)

(declare-fun e!824389 () Bool)

(assert (=> b!1467859 (=> (not res!996403) (not e!824389))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98918 0))(
  ( (array!98919 (arr!47747 (Array (_ BitVec 32) (_ BitVec 64))) (size!48297 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98918)

(assert (=> b!1467859 (= res!996403 (and (= (size!48297 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48297 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48297 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467860 () Bool)

(declare-fun res!996401 () Bool)

(assert (=> b!1467860 (=> (not res!996401) (not e!824389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98918 (_ BitVec 32)) Bool)

(assert (=> b!1467860 (= res!996401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467861 () Bool)

(declare-fun res!996399 () Bool)

(declare-fun e!824390 () Bool)

(assert (=> b!1467861 (=> (not res!996399) (not e!824390))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11987 0))(
  ( (MissingZero!11987 (index!50340 (_ BitVec 32))) (Found!11987 (index!50341 (_ BitVec 32))) (Intermediate!11987 (undefined!12799 Bool) (index!50342 (_ BitVec 32)) (x!131940 (_ BitVec 32))) (Undefined!11987) (MissingVacant!11987 (index!50343 (_ BitVec 32))) )
))
(declare-fun lt!642161 () SeekEntryResult!11987)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98918 (_ BitVec 32)) SeekEntryResult!11987)

(assert (=> b!1467861 (= res!996399 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47747 a!2862) j!93) a!2862 mask!2687) lt!642161))))

(declare-fun b!1467862 () Bool)

(declare-fun res!996402 () Bool)

(assert (=> b!1467862 (=> (not res!996402) (not e!824389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467862 (= res!996402 (validKeyInArray!0 (select (arr!47747 a!2862) j!93)))))

(declare-fun b!1467863 () Bool)

(declare-fun res!996400 () Bool)

(assert (=> b!1467863 (=> (not res!996400) (not e!824389))))

(declare-datatypes ((List!34248 0))(
  ( (Nil!34245) (Cons!34244 (h!35594 (_ BitVec 64)) (t!48942 List!34248)) )
))
(declare-fun arrayNoDuplicates!0 (array!98918 (_ BitVec 32) List!34248) Bool)

(assert (=> b!1467863 (= res!996400 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34245))))

(declare-fun res!996406 () Bool)

(assert (=> start!125470 (=> (not res!996406) (not e!824389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125470 (= res!996406 (validMask!0 mask!2687))))

(assert (=> start!125470 e!824389))

(assert (=> start!125470 true))

(declare-fun array_inv!36775 (array!98918) Bool)

(assert (=> start!125470 (array_inv!36775 a!2862)))

(declare-fun b!1467864 () Bool)

(declare-fun res!996404 () Bool)

(assert (=> b!1467864 (=> (not res!996404) (not e!824389))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467864 (= res!996404 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48297 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48297 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48297 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47747 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467865 () Bool)

(declare-fun res!996405 () Bool)

(assert (=> b!1467865 (=> (not res!996405) (not e!824389))))

(assert (=> b!1467865 (= res!996405 (validKeyInArray!0 (select (arr!47747 a!2862) i!1006)))))

(declare-fun b!1467866 () Bool)

(assert (=> b!1467866 (= e!824389 e!824390)))

(declare-fun res!996398 () Bool)

(assert (=> b!1467866 (=> (not res!996398) (not e!824390))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467866 (= res!996398 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47747 a!2862) j!93) mask!2687) (select (arr!47747 a!2862) j!93) a!2862 mask!2687) lt!642161))))

(assert (=> b!1467866 (= lt!642161 (Intermediate!11987 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467867 () Bool)

(assert (=> b!1467867 (= e!824390 false)))

(declare-fun lt!642162 () (_ BitVec 32))

(assert (=> b!1467867 (= lt!642162 (toIndex!0 (select (store (arr!47747 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!125470 res!996406) b!1467859))

(assert (= (and b!1467859 res!996403) b!1467865))

(assert (= (and b!1467865 res!996405) b!1467862))

(assert (= (and b!1467862 res!996402) b!1467860))

(assert (= (and b!1467860 res!996401) b!1467863))

(assert (= (and b!1467863 res!996400) b!1467864))

(assert (= (and b!1467864 res!996404) b!1467866))

(assert (= (and b!1467866 res!996398) b!1467861))

(assert (= (and b!1467861 res!996399) b!1467867))

(declare-fun m!1354825 () Bool)

(assert (=> b!1467862 m!1354825))

(assert (=> b!1467862 m!1354825))

(declare-fun m!1354827 () Bool)

(assert (=> b!1467862 m!1354827))

(declare-fun m!1354829 () Bool)

(assert (=> b!1467867 m!1354829))

(declare-fun m!1354831 () Bool)

(assert (=> b!1467867 m!1354831))

(assert (=> b!1467867 m!1354831))

(declare-fun m!1354833 () Bool)

(assert (=> b!1467867 m!1354833))

(assert (=> b!1467861 m!1354825))

(assert (=> b!1467861 m!1354825))

(declare-fun m!1354835 () Bool)

(assert (=> b!1467861 m!1354835))

(assert (=> b!1467866 m!1354825))

(assert (=> b!1467866 m!1354825))

(declare-fun m!1354837 () Bool)

(assert (=> b!1467866 m!1354837))

(assert (=> b!1467866 m!1354837))

(assert (=> b!1467866 m!1354825))

(declare-fun m!1354839 () Bool)

(assert (=> b!1467866 m!1354839))

(declare-fun m!1354841 () Bool)

(assert (=> b!1467863 m!1354841))

(assert (=> b!1467864 m!1354829))

(declare-fun m!1354843 () Bool)

(assert (=> b!1467864 m!1354843))

(declare-fun m!1354845 () Bool)

(assert (=> b!1467860 m!1354845))

(declare-fun m!1354847 () Bool)

(assert (=> b!1467865 m!1354847))

(assert (=> b!1467865 m!1354847))

(declare-fun m!1354849 () Bool)

(assert (=> b!1467865 m!1354849))

(declare-fun m!1354851 () Bool)

(assert (=> start!125470 m!1354851))

(declare-fun m!1354853 () Bool)

(assert (=> start!125470 m!1354853))

(push 1)

