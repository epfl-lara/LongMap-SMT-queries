; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125472 () Bool)

(assert start!125472)

(declare-fun b!1467886 () Bool)

(declare-fun e!824398 () Bool)

(declare-fun e!824397 () Bool)

(assert (=> b!1467886 (= e!824398 e!824397)))

(declare-fun res!996428 () Bool)

(assert (=> b!1467886 (=> (not res!996428) (not e!824397))))

(declare-datatypes ((SeekEntryResult!11988 0))(
  ( (MissingZero!11988 (index!50344 (_ BitVec 32))) (Found!11988 (index!50345 (_ BitVec 32))) (Intermediate!11988 (undefined!12800 Bool) (index!50346 (_ BitVec 32)) (x!131941 (_ BitVec 32))) (Undefined!11988) (MissingVacant!11988 (index!50347 (_ BitVec 32))) )
))
(declare-fun lt!642167 () SeekEntryResult!11988)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98920 0))(
  ( (array!98921 (arr!47748 (Array (_ BitVec 32) (_ BitVec 64))) (size!48298 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98920)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98920 (_ BitVec 32)) SeekEntryResult!11988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467886 (= res!996428 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47748 a!2862) j!93) mask!2687) (select (arr!47748 a!2862) j!93) a!2862 mask!2687) lt!642167))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467886 (= lt!642167 (Intermediate!11988 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467887 () Bool)

(declare-fun res!996427 () Bool)

(assert (=> b!1467887 (=> (not res!996427) (not e!824397))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1467887 (= res!996427 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47748 a!2862) j!93) a!2862 mask!2687) lt!642167))))

(declare-fun b!1467888 () Bool)

(declare-fun res!996426 () Bool)

(assert (=> b!1467888 (=> (not res!996426) (not e!824398))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467888 (= res!996426 (and (= (size!48298 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48298 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48298 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467890 () Bool)

(declare-fun res!996429 () Bool)

(assert (=> b!1467890 (=> (not res!996429) (not e!824398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467890 (= res!996429 (validKeyInArray!0 (select (arr!47748 a!2862) i!1006)))))

(declare-fun b!1467891 () Bool)

(declare-fun res!996431 () Bool)

(assert (=> b!1467891 (=> (not res!996431) (not e!824398))))

(assert (=> b!1467891 (= res!996431 (validKeyInArray!0 (select (arr!47748 a!2862) j!93)))))

(declare-fun b!1467892 () Bool)

(declare-fun res!996432 () Bool)

(assert (=> b!1467892 (=> (not res!996432) (not e!824398))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467892 (= res!996432 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48298 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48298 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48298 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47748 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467889 () Bool)

(declare-fun res!996430 () Bool)

(assert (=> b!1467889 (=> (not res!996430) (not e!824398))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98920 (_ BitVec 32)) Bool)

(assert (=> b!1467889 (= res!996430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996433 () Bool)

(assert (=> start!125472 (=> (not res!996433) (not e!824398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125472 (= res!996433 (validMask!0 mask!2687))))

(assert (=> start!125472 e!824398))

(assert (=> start!125472 true))

(declare-fun array_inv!36776 (array!98920) Bool)

(assert (=> start!125472 (array_inv!36776 a!2862)))

(declare-fun b!1467893 () Bool)

(declare-fun res!996425 () Bool)

(assert (=> b!1467893 (=> (not res!996425) (not e!824398))))

(declare-datatypes ((List!34249 0))(
  ( (Nil!34246) (Cons!34245 (h!35595 (_ BitVec 64)) (t!48943 List!34249)) )
))
(declare-fun arrayNoDuplicates!0 (array!98920 (_ BitVec 32) List!34249) Bool)

(assert (=> b!1467893 (= res!996425 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34246))))

(declare-fun b!1467894 () Bool)

(assert (=> b!1467894 (= e!824397 false)))

(declare-fun lt!642168 () (_ BitVec 32))

(assert (=> b!1467894 (= lt!642168 (toIndex!0 (select (store (arr!47748 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!125472 res!996433) b!1467888))

(assert (= (and b!1467888 res!996426) b!1467890))

(assert (= (and b!1467890 res!996429) b!1467891))

(assert (= (and b!1467891 res!996431) b!1467889))

(assert (= (and b!1467889 res!996430) b!1467893))

(assert (= (and b!1467893 res!996425) b!1467892))

(assert (= (and b!1467892 res!996432) b!1467886))

(assert (= (and b!1467886 res!996428) b!1467887))

(assert (= (and b!1467887 res!996427) b!1467894))

(declare-fun m!1354855 () Bool)

(assert (=> b!1467887 m!1354855))

(assert (=> b!1467887 m!1354855))

(declare-fun m!1354857 () Bool)

(assert (=> b!1467887 m!1354857))

(declare-fun m!1354859 () Bool)

(assert (=> b!1467892 m!1354859))

(declare-fun m!1354861 () Bool)

(assert (=> b!1467892 m!1354861))

(declare-fun m!1354863 () Bool)

(assert (=> b!1467893 m!1354863))

(declare-fun m!1354865 () Bool)

(assert (=> b!1467890 m!1354865))

(assert (=> b!1467890 m!1354865))

(declare-fun m!1354867 () Bool)

(assert (=> b!1467890 m!1354867))

(assert (=> b!1467886 m!1354855))

(assert (=> b!1467886 m!1354855))

(declare-fun m!1354869 () Bool)

(assert (=> b!1467886 m!1354869))

(assert (=> b!1467886 m!1354869))

(assert (=> b!1467886 m!1354855))

(declare-fun m!1354871 () Bool)

(assert (=> b!1467886 m!1354871))

(assert (=> b!1467891 m!1354855))

(assert (=> b!1467891 m!1354855))

(declare-fun m!1354873 () Bool)

(assert (=> b!1467891 m!1354873))

(assert (=> b!1467894 m!1354859))

(declare-fun m!1354875 () Bool)

(assert (=> b!1467894 m!1354875))

(assert (=> b!1467894 m!1354875))

(declare-fun m!1354877 () Bool)

(assert (=> b!1467894 m!1354877))

(declare-fun m!1354879 () Bool)

(assert (=> start!125472 m!1354879))

(declare-fun m!1354881 () Bool)

(assert (=> start!125472 m!1354881))

(declare-fun m!1354883 () Bool)

(assert (=> b!1467889 m!1354883))

(check-sat (not b!1467891) (not start!125472) (not b!1467890) (not b!1467894) (not b!1467887) (not b!1467886) (not b!1467893) (not b!1467889))
(check-sat)
