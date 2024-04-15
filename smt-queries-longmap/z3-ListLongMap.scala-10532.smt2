; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124174 () Bool)

(assert start!124174)

(declare-fun b!1437361 () Bool)

(declare-fun res!970256 () Bool)

(declare-fun e!810931 () Bool)

(assert (=> b!1437361 (=> (not res!970256) (not e!810931))))

(declare-datatypes ((array!97717 0))(
  ( (array!97718 (arr!47152 (Array (_ BitVec 32) (_ BitVec 64))) (size!47704 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97717)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437361 (= res!970256 (validKeyInArray!0 (select (arr!47152 a!2862) i!1006)))))

(declare-fun b!1437362 () Bool)

(declare-fun res!970257 () Bool)

(assert (=> b!1437362 (=> (not res!970257) (not e!810931))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1437362 (= res!970257 (validKeyInArray!0 (select (arr!47152 a!2862) j!93)))))

(declare-fun b!1437363 () Bool)

(declare-fun e!810932 () Bool)

(assert (=> b!1437363 (= e!810932 false)))

(declare-fun lt!632105 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437363 (= lt!632105 (toIndex!0 (select (store (arr!47152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun res!970262 () Bool)

(assert (=> start!124174 (=> (not res!970262) (not e!810931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124174 (= res!970262 (validMask!0 mask!2687))))

(assert (=> start!124174 e!810931))

(assert (=> start!124174 true))

(declare-fun array_inv!36385 (array!97717) Bool)

(assert (=> start!124174 (array_inv!36385 a!2862)))

(declare-fun b!1437364 () Bool)

(assert (=> b!1437364 (= e!810931 e!810932)))

(declare-fun res!970261 () Bool)

(assert (=> b!1437364 (=> (not res!970261) (not e!810932))))

(declare-datatypes ((SeekEntryResult!11429 0))(
  ( (MissingZero!11429 (index!48108 (_ BitVec 32))) (Found!11429 (index!48109 (_ BitVec 32))) (Intermediate!11429 (undefined!12241 Bool) (index!48110 (_ BitVec 32)) (x!129839 (_ BitVec 32))) (Undefined!11429) (MissingVacant!11429 (index!48111 (_ BitVec 32))) )
))
(declare-fun lt!632106 () SeekEntryResult!11429)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97717 (_ BitVec 32)) SeekEntryResult!11429)

(assert (=> b!1437364 (= res!970261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47152 a!2862) j!93) mask!2687) (select (arr!47152 a!2862) j!93) a!2862 mask!2687) lt!632106))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437364 (= lt!632106 (Intermediate!11429 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437365 () Bool)

(declare-fun res!970259 () Bool)

(assert (=> b!1437365 (=> (not res!970259) (not e!810931))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1437365 (= res!970259 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47704 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47704 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47704 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47152 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437366 () Bool)

(declare-fun res!970264 () Bool)

(assert (=> b!1437366 (=> (not res!970264) (not e!810932))))

(assert (=> b!1437366 (= res!970264 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47152 a!2862) j!93) a!2862 mask!2687) lt!632106))))

(declare-fun b!1437367 () Bool)

(declare-fun res!970263 () Bool)

(assert (=> b!1437367 (=> (not res!970263) (not e!810931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97717 (_ BitVec 32)) Bool)

(assert (=> b!1437367 (= res!970263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437368 () Bool)

(declare-fun res!970260 () Bool)

(assert (=> b!1437368 (=> (not res!970260) (not e!810931))))

(declare-datatypes ((List!33731 0))(
  ( (Nil!33728) (Cons!33727 (h!35068 (_ BitVec 64)) (t!48417 List!33731)) )
))
(declare-fun arrayNoDuplicates!0 (array!97717 (_ BitVec 32) List!33731) Bool)

(assert (=> b!1437368 (= res!970260 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33728))))

(declare-fun b!1437369 () Bool)

(declare-fun res!970258 () Bool)

(assert (=> b!1437369 (=> (not res!970258) (not e!810931))))

(assert (=> b!1437369 (= res!970258 (and (= (size!47704 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47704 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47704 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124174 res!970262) b!1437369))

(assert (= (and b!1437369 res!970258) b!1437361))

(assert (= (and b!1437361 res!970256) b!1437362))

(assert (= (and b!1437362 res!970257) b!1437367))

(assert (= (and b!1437367 res!970263) b!1437368))

(assert (= (and b!1437368 res!970260) b!1437365))

(assert (= (and b!1437365 res!970259) b!1437364))

(assert (= (and b!1437364 res!970261) b!1437366))

(assert (= (and b!1437366 res!970264) b!1437363))

(declare-fun m!1326105 () Bool)

(assert (=> b!1437366 m!1326105))

(assert (=> b!1437366 m!1326105))

(declare-fun m!1326107 () Bool)

(assert (=> b!1437366 m!1326107))

(declare-fun m!1326109 () Bool)

(assert (=> b!1437365 m!1326109))

(declare-fun m!1326111 () Bool)

(assert (=> b!1437365 m!1326111))

(assert (=> b!1437363 m!1326109))

(declare-fun m!1326113 () Bool)

(assert (=> b!1437363 m!1326113))

(assert (=> b!1437363 m!1326113))

(declare-fun m!1326115 () Bool)

(assert (=> b!1437363 m!1326115))

(declare-fun m!1326117 () Bool)

(assert (=> start!124174 m!1326117))

(declare-fun m!1326119 () Bool)

(assert (=> start!124174 m!1326119))

(declare-fun m!1326121 () Bool)

(assert (=> b!1437368 m!1326121))

(assert (=> b!1437362 m!1326105))

(assert (=> b!1437362 m!1326105))

(declare-fun m!1326123 () Bool)

(assert (=> b!1437362 m!1326123))

(declare-fun m!1326125 () Bool)

(assert (=> b!1437367 m!1326125))

(assert (=> b!1437364 m!1326105))

(assert (=> b!1437364 m!1326105))

(declare-fun m!1326127 () Bool)

(assert (=> b!1437364 m!1326127))

(assert (=> b!1437364 m!1326127))

(assert (=> b!1437364 m!1326105))

(declare-fun m!1326129 () Bool)

(assert (=> b!1437364 m!1326129))

(declare-fun m!1326131 () Bool)

(assert (=> b!1437361 m!1326131))

(assert (=> b!1437361 m!1326131))

(declare-fun m!1326133 () Bool)

(assert (=> b!1437361 m!1326133))

(check-sat (not b!1437361) (not b!1437366) (not b!1437362) (not start!124174) (not b!1437363) (not b!1437368) (not b!1437367) (not b!1437364))
(check-sat)
