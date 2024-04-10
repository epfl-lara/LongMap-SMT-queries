; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125482 () Bool)

(assert start!125482)

(declare-fun b!1468021 () Bool)

(declare-fun e!824443 () Bool)

(declare-fun e!824442 () Bool)

(assert (=> b!1468021 (= e!824443 e!824442)))

(declare-fun res!996566 () Bool)

(assert (=> b!1468021 (=> (not res!996566) (not e!824442))))

(declare-datatypes ((SeekEntryResult!11993 0))(
  ( (MissingZero!11993 (index!50364 (_ BitVec 32))) (Found!11993 (index!50365 (_ BitVec 32))) (Intermediate!11993 (undefined!12805 Bool) (index!50366 (_ BitVec 32)) (x!131962 (_ BitVec 32))) (Undefined!11993) (MissingVacant!11993 (index!50367 (_ BitVec 32))) )
))
(declare-fun lt!642197 () SeekEntryResult!11993)

(declare-datatypes ((array!98930 0))(
  ( (array!98931 (arr!47753 (Array (_ BitVec 32) (_ BitVec 64))) (size!48303 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98930)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98930 (_ BitVec 32)) SeekEntryResult!11993)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468021 (= res!996566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47753 a!2862) j!93) mask!2687) (select (arr!47753 a!2862) j!93) a!2862 mask!2687) lt!642197))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468021 (= lt!642197 (Intermediate!11993 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468022 () Bool)

(declare-fun res!996568 () Bool)

(assert (=> b!1468022 (=> (not res!996568) (not e!824443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468022 (= res!996568 (validKeyInArray!0 (select (arr!47753 a!2862) j!93)))))

(declare-fun b!1468023 () Bool)

(declare-fun res!996562 () Bool)

(assert (=> b!1468023 (=> (not res!996562) (not e!824442))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468023 (= res!996562 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47753 a!2862) j!93) a!2862 mask!2687) lt!642197))))

(declare-fun res!996565 () Bool)

(assert (=> start!125482 (=> (not res!996565) (not e!824443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125482 (= res!996565 (validMask!0 mask!2687))))

(assert (=> start!125482 e!824443))

(assert (=> start!125482 true))

(declare-fun array_inv!36781 (array!98930) Bool)

(assert (=> start!125482 (array_inv!36781 a!2862)))

(declare-fun b!1468024 () Bool)

(declare-fun res!996560 () Bool)

(assert (=> b!1468024 (=> (not res!996560) (not e!824443))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468024 (= res!996560 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48303 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48303 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48303 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47753 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468025 () Bool)

(declare-fun res!996567 () Bool)

(assert (=> b!1468025 (=> (not res!996567) (not e!824443))))

(assert (=> b!1468025 (= res!996567 (and (= (size!48303 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48303 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48303 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468026 () Bool)

(assert (=> b!1468026 (= e!824442 false)))

(declare-fun lt!642198 () SeekEntryResult!11993)

(assert (=> b!1468026 (= lt!642198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47753 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47753 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98931 (store (arr!47753 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48303 a!2862)) mask!2687))))

(declare-fun b!1468027 () Bool)

(declare-fun res!996564 () Bool)

(assert (=> b!1468027 (=> (not res!996564) (not e!824443))))

(declare-datatypes ((List!34254 0))(
  ( (Nil!34251) (Cons!34250 (h!35600 (_ BitVec 64)) (t!48948 List!34254)) )
))
(declare-fun arrayNoDuplicates!0 (array!98930 (_ BitVec 32) List!34254) Bool)

(assert (=> b!1468027 (= res!996564 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34251))))

(declare-fun b!1468028 () Bool)

(declare-fun res!996563 () Bool)

(assert (=> b!1468028 (=> (not res!996563) (not e!824443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98930 (_ BitVec 32)) Bool)

(assert (=> b!1468028 (= res!996563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468029 () Bool)

(declare-fun res!996561 () Bool)

(assert (=> b!1468029 (=> (not res!996561) (not e!824443))))

(assert (=> b!1468029 (= res!996561 (validKeyInArray!0 (select (arr!47753 a!2862) i!1006)))))

(assert (= (and start!125482 res!996565) b!1468025))

(assert (= (and b!1468025 res!996567) b!1468029))

(assert (= (and b!1468029 res!996561) b!1468022))

(assert (= (and b!1468022 res!996568) b!1468028))

(assert (= (and b!1468028 res!996563) b!1468027))

(assert (= (and b!1468027 res!996564) b!1468024))

(assert (= (and b!1468024 res!996560) b!1468021))

(assert (= (and b!1468021 res!996566) b!1468023))

(assert (= (and b!1468023 res!996562) b!1468026))

(declare-fun m!1355005 () Bool)

(assert (=> b!1468023 m!1355005))

(assert (=> b!1468023 m!1355005))

(declare-fun m!1355007 () Bool)

(assert (=> b!1468023 m!1355007))

(declare-fun m!1355009 () Bool)

(assert (=> b!1468029 m!1355009))

(assert (=> b!1468029 m!1355009))

(declare-fun m!1355011 () Bool)

(assert (=> b!1468029 m!1355011))

(declare-fun m!1355013 () Bool)

(assert (=> b!1468027 m!1355013))

(declare-fun m!1355015 () Bool)

(assert (=> b!1468024 m!1355015))

(declare-fun m!1355017 () Bool)

(assert (=> b!1468024 m!1355017))

(assert (=> b!1468026 m!1355015))

(declare-fun m!1355019 () Bool)

(assert (=> b!1468026 m!1355019))

(assert (=> b!1468026 m!1355019))

(declare-fun m!1355021 () Bool)

(assert (=> b!1468026 m!1355021))

(assert (=> b!1468026 m!1355021))

(assert (=> b!1468026 m!1355019))

(declare-fun m!1355023 () Bool)

(assert (=> b!1468026 m!1355023))

(assert (=> b!1468022 m!1355005))

(assert (=> b!1468022 m!1355005))

(declare-fun m!1355025 () Bool)

(assert (=> b!1468022 m!1355025))

(declare-fun m!1355027 () Bool)

(assert (=> start!125482 m!1355027))

(declare-fun m!1355029 () Bool)

(assert (=> start!125482 m!1355029))

(assert (=> b!1468021 m!1355005))

(assert (=> b!1468021 m!1355005))

(declare-fun m!1355031 () Bool)

(assert (=> b!1468021 m!1355031))

(assert (=> b!1468021 m!1355031))

(assert (=> b!1468021 m!1355005))

(declare-fun m!1355033 () Bool)

(assert (=> b!1468021 m!1355033))

(declare-fun m!1355035 () Bool)

(assert (=> b!1468028 m!1355035))

(push 1)

