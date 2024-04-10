; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125480 () Bool)

(assert start!125480)

(declare-fun b!1467994 () Bool)

(declare-fun res!996538 () Bool)

(declare-fun e!824434 () Bool)

(assert (=> b!1467994 (=> (not res!996538) (not e!824434))))

(declare-datatypes ((array!98928 0))(
  ( (array!98929 (arr!47752 (Array (_ BitVec 32) (_ BitVec 64))) (size!48302 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98928)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467994 (= res!996538 (validKeyInArray!0 (select (arr!47752 a!2862) i!1006)))))

(declare-fun b!1467995 () Bool)

(declare-fun res!996537 () Bool)

(assert (=> b!1467995 (=> (not res!996537) (not e!824434))))

(declare-datatypes ((List!34253 0))(
  ( (Nil!34250) (Cons!34249 (h!35599 (_ BitVec 64)) (t!48947 List!34253)) )
))
(declare-fun arrayNoDuplicates!0 (array!98928 (_ BitVec 32) List!34253) Bool)

(assert (=> b!1467995 (= res!996537 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34250))))

(declare-fun b!1467996 () Bool)

(declare-fun res!996536 () Bool)

(assert (=> b!1467996 (=> (not res!996536) (not e!824434))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98928 (_ BitVec 32)) Bool)

(assert (=> b!1467996 (= res!996536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996541 () Bool)

(assert (=> start!125480 (=> (not res!996541) (not e!824434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125480 (= res!996541 (validMask!0 mask!2687))))

(assert (=> start!125480 e!824434))

(assert (=> start!125480 true))

(declare-fun array_inv!36780 (array!98928) Bool)

(assert (=> start!125480 (array_inv!36780 a!2862)))

(declare-fun b!1467997 () Bool)

(declare-fun e!824435 () Bool)

(assert (=> b!1467997 (= e!824435 false)))

(declare-fun lt!642191 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467997 (= lt!642191 (toIndex!0 (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1467998 () Bool)

(assert (=> b!1467998 (= e!824434 e!824435)))

(declare-fun res!996533 () Bool)

(assert (=> b!1467998 (=> (not res!996533) (not e!824435))))

(declare-datatypes ((SeekEntryResult!11992 0))(
  ( (MissingZero!11992 (index!50360 (_ BitVec 32))) (Found!11992 (index!50361 (_ BitVec 32))) (Intermediate!11992 (undefined!12804 Bool) (index!50362 (_ BitVec 32)) (x!131953 (_ BitVec 32))) (Undefined!11992) (MissingVacant!11992 (index!50363 (_ BitVec 32))) )
))
(declare-fun lt!642192 () SeekEntryResult!11992)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98928 (_ BitVec 32)) SeekEntryResult!11992)

(assert (=> b!1467998 (= res!996533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47752 a!2862) j!93) mask!2687) (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642192))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1467998 (= lt!642192 (Intermediate!11992 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467999 () Bool)

(declare-fun res!996539 () Bool)

(assert (=> b!1467999 (=> (not res!996539) (not e!824434))))

(assert (=> b!1467999 (= res!996539 (validKeyInArray!0 (select (arr!47752 a!2862) j!93)))))

(declare-fun b!1468000 () Bool)

(declare-fun res!996540 () Bool)

(assert (=> b!1468000 (=> (not res!996540) (not e!824434))))

(assert (=> b!1468000 (= res!996540 (and (= (size!48302 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48302 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48302 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468001 () Bool)

(declare-fun res!996534 () Bool)

(assert (=> b!1468001 (=> (not res!996534) (not e!824435))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468001 (= res!996534 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642192))))

(declare-fun b!1468002 () Bool)

(declare-fun res!996535 () Bool)

(assert (=> b!1468002 (=> (not res!996535) (not e!824434))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468002 (= res!996535 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48302 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48302 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48302 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125480 res!996541) b!1468000))

(assert (= (and b!1468000 res!996540) b!1467994))

(assert (= (and b!1467994 res!996538) b!1467999))

(assert (= (and b!1467999 res!996539) b!1467996))

(assert (= (and b!1467996 res!996536) b!1467995))

(assert (= (and b!1467995 res!996537) b!1468002))

(assert (= (and b!1468002 res!996535) b!1467998))

(assert (= (and b!1467998 res!996533) b!1468001))

(assert (= (and b!1468001 res!996534) b!1467997))

(declare-fun m!1354975 () Bool)

(assert (=> b!1468002 m!1354975))

(declare-fun m!1354977 () Bool)

(assert (=> b!1468002 m!1354977))

(declare-fun m!1354979 () Bool)

(assert (=> b!1467995 m!1354979))

(declare-fun m!1354981 () Bool)

(assert (=> b!1467994 m!1354981))

(assert (=> b!1467994 m!1354981))

(declare-fun m!1354983 () Bool)

(assert (=> b!1467994 m!1354983))

(declare-fun m!1354985 () Bool)

(assert (=> b!1467996 m!1354985))

(declare-fun m!1354987 () Bool)

(assert (=> b!1467998 m!1354987))

(assert (=> b!1467998 m!1354987))

(declare-fun m!1354989 () Bool)

(assert (=> b!1467998 m!1354989))

(assert (=> b!1467998 m!1354989))

(assert (=> b!1467998 m!1354987))

(declare-fun m!1354991 () Bool)

(assert (=> b!1467998 m!1354991))

(assert (=> b!1468001 m!1354987))

(assert (=> b!1468001 m!1354987))

(declare-fun m!1354993 () Bool)

(assert (=> b!1468001 m!1354993))

(assert (=> b!1467997 m!1354975))

(declare-fun m!1354995 () Bool)

(assert (=> b!1467997 m!1354995))

(assert (=> b!1467997 m!1354995))

(declare-fun m!1354997 () Bool)

(assert (=> b!1467997 m!1354997))

(assert (=> b!1467999 m!1354987))

(assert (=> b!1467999 m!1354987))

(declare-fun m!1354999 () Bool)

(assert (=> b!1467999 m!1354999))

(declare-fun m!1355001 () Bool)

(assert (=> start!125480 m!1355001))

(declare-fun m!1355003 () Bool)

(assert (=> start!125480 m!1355003))

(push 1)

(assert (not b!1468001))

(assert (not b!1467996))

(assert (not b!1467994))

(assert (not b!1467998))

(assert (not b!1467997))

(assert (not start!125480))

(assert (not b!1467999))

(assert (not b!1467995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

