; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125488 () Bool)

(assert start!125488)

(declare-fun res!996647 () Bool)

(declare-fun e!824469 () Bool)

(assert (=> start!125488 (=> (not res!996647) (not e!824469))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125488 (= res!996647 (validMask!0 mask!2687))))

(assert (=> start!125488 e!824469))

(assert (=> start!125488 true))

(declare-datatypes ((array!98936 0))(
  ( (array!98937 (arr!47756 (Array (_ BitVec 32) (_ BitVec 64))) (size!48306 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98936)

(declare-fun array_inv!36784 (array!98936) Bool)

(assert (=> start!125488 (array_inv!36784 a!2862)))

(declare-fun b!1468102 () Bool)

(declare-fun res!996644 () Bool)

(assert (=> b!1468102 (=> (not res!996644) (not e!824469))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468102 (= res!996644 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48306 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48306 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48306 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47756 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468103 () Bool)

(declare-fun res!996645 () Bool)

(declare-fun e!824470 () Bool)

(assert (=> b!1468103 (=> (not res!996645) (not e!824470))))

(declare-datatypes ((SeekEntryResult!11996 0))(
  ( (MissingZero!11996 (index!50376 (_ BitVec 32))) (Found!11996 (index!50377 (_ BitVec 32))) (Intermediate!11996 (undefined!12808 Bool) (index!50378 (_ BitVec 32)) (x!131973 (_ BitVec 32))) (Undefined!11996) (MissingVacant!11996 (index!50379 (_ BitVec 32))) )
))
(declare-fun lt!642216 () SeekEntryResult!11996)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98936 (_ BitVec 32)) SeekEntryResult!11996)

(assert (=> b!1468103 (= res!996645 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47756 a!2862) j!93) a!2862 mask!2687) lt!642216))))

(declare-fun b!1468104 () Bool)

(assert (=> b!1468104 (= e!824469 e!824470)))

(declare-fun res!996646 () Bool)

(assert (=> b!1468104 (=> (not res!996646) (not e!824470))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468104 (= res!996646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47756 a!2862) j!93) mask!2687) (select (arr!47756 a!2862) j!93) a!2862 mask!2687) lt!642216))))

(assert (=> b!1468104 (= lt!642216 (Intermediate!11996 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468105 () Bool)

(declare-fun res!996649 () Bool)

(assert (=> b!1468105 (=> (not res!996649) (not e!824469))))

(assert (=> b!1468105 (= res!996649 (and (= (size!48306 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48306 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48306 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468106 () Bool)

(declare-fun res!996643 () Bool)

(assert (=> b!1468106 (=> (not res!996643) (not e!824469))))

(declare-datatypes ((List!34257 0))(
  ( (Nil!34254) (Cons!34253 (h!35603 (_ BitVec 64)) (t!48951 List!34257)) )
))
(declare-fun arrayNoDuplicates!0 (array!98936 (_ BitVec 32) List!34257) Bool)

(assert (=> b!1468106 (= res!996643 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34254))))

(declare-fun b!1468107 () Bool)

(declare-fun res!996642 () Bool)

(assert (=> b!1468107 (=> (not res!996642) (not e!824469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98936 (_ BitVec 32)) Bool)

(assert (=> b!1468107 (= res!996642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468108 () Bool)

(declare-fun res!996648 () Bool)

(assert (=> b!1468108 (=> (not res!996648) (not e!824469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468108 (= res!996648 (validKeyInArray!0 (select (arr!47756 a!2862) j!93)))))

(declare-fun b!1468109 () Bool)

(declare-fun res!996641 () Bool)

(assert (=> b!1468109 (=> (not res!996641) (not e!824469))))

(assert (=> b!1468109 (= res!996641 (validKeyInArray!0 (select (arr!47756 a!2862) i!1006)))))

(declare-fun b!1468110 () Bool)

(assert (=> b!1468110 (= e!824470 false)))

(declare-fun lt!642215 () SeekEntryResult!11996)

(assert (=> b!1468110 (= lt!642215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47756 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47756 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98937 (store (arr!47756 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48306 a!2862)) mask!2687))))

(assert (= (and start!125488 res!996647) b!1468105))

(assert (= (and b!1468105 res!996649) b!1468109))

(assert (= (and b!1468109 res!996641) b!1468108))

(assert (= (and b!1468108 res!996648) b!1468107))

(assert (= (and b!1468107 res!996642) b!1468106))

(assert (= (and b!1468106 res!996643) b!1468102))

(assert (= (and b!1468102 res!996644) b!1468104))

(assert (= (and b!1468104 res!996646) b!1468103))

(assert (= (and b!1468103 res!996645) b!1468110))

(declare-fun m!1355101 () Bool)

(assert (=> b!1468103 m!1355101))

(assert (=> b!1468103 m!1355101))

(declare-fun m!1355103 () Bool)

(assert (=> b!1468103 m!1355103))

(assert (=> b!1468108 m!1355101))

(assert (=> b!1468108 m!1355101))

(declare-fun m!1355105 () Bool)

(assert (=> b!1468108 m!1355105))

(declare-fun m!1355107 () Bool)

(assert (=> b!1468102 m!1355107))

(declare-fun m!1355109 () Bool)

(assert (=> b!1468102 m!1355109))

(declare-fun m!1355111 () Bool)

(assert (=> b!1468109 m!1355111))

(assert (=> b!1468109 m!1355111))

(declare-fun m!1355113 () Bool)

(assert (=> b!1468109 m!1355113))

(declare-fun m!1355115 () Bool)

(assert (=> b!1468107 m!1355115))

(assert (=> b!1468104 m!1355101))

(assert (=> b!1468104 m!1355101))

(declare-fun m!1355117 () Bool)

(assert (=> b!1468104 m!1355117))

(assert (=> b!1468104 m!1355117))

(assert (=> b!1468104 m!1355101))

(declare-fun m!1355119 () Bool)

(assert (=> b!1468104 m!1355119))

(declare-fun m!1355121 () Bool)

(assert (=> start!125488 m!1355121))

(declare-fun m!1355123 () Bool)

(assert (=> start!125488 m!1355123))

(declare-fun m!1355125 () Bool)

(assert (=> b!1468106 m!1355125))

(assert (=> b!1468110 m!1355107))

(declare-fun m!1355127 () Bool)

(assert (=> b!1468110 m!1355127))

(assert (=> b!1468110 m!1355127))

(declare-fun m!1355129 () Bool)

(assert (=> b!1468110 m!1355129))

(assert (=> b!1468110 m!1355129))

(assert (=> b!1468110 m!1355127))

(declare-fun m!1355131 () Bool)

(assert (=> b!1468110 m!1355131))

(push 1)

