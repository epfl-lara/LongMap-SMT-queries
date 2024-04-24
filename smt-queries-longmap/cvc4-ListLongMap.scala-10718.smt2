; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125726 () Bool)

(assert start!125726)

(declare-fun b!1469305 () Bool)

(declare-fun e!825383 () Bool)

(assert (=> b!1469305 (= e!825383 false)))

(declare-datatypes ((array!99012 0))(
  ( (array!99013 (arr!47789 (Array (_ BitVec 32) (_ BitVec 64))) (size!48340 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99012)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11926 0))(
  ( (MissingZero!11926 (index!50096 (_ BitVec 32))) (Found!11926 (index!50097 (_ BitVec 32))) (Intermediate!11926 (undefined!12738 Bool) (index!50098 (_ BitVec 32)) (x!131880 (_ BitVec 32))) (Undefined!11926) (MissingVacant!11926 (index!50099 (_ BitVec 32))) )
))
(declare-fun lt!642763 () SeekEntryResult!11926)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99012 (_ BitVec 32)) SeekEntryResult!11926)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469305 (= lt!642763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47789 a!2862) j!93) mask!2687) (select (arr!47789 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1469306 () Bool)

(declare-fun res!996748 () Bool)

(assert (=> b!1469306 (=> (not res!996748) (not e!825383))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469306 (= res!996748 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48340 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48340 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48340 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47789 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469307 () Bool)

(declare-fun res!996747 () Bool)

(assert (=> b!1469307 (=> (not res!996747) (not e!825383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469307 (= res!996747 (validKeyInArray!0 (select (arr!47789 a!2862) i!1006)))))

(declare-fun res!996749 () Bool)

(assert (=> start!125726 (=> (not res!996749) (not e!825383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125726 (= res!996749 (validMask!0 mask!2687))))

(assert (=> start!125726 e!825383))

(assert (=> start!125726 true))

(declare-fun array_inv!37070 (array!99012) Bool)

(assert (=> start!125726 (array_inv!37070 a!2862)))

(declare-fun b!1469308 () Bool)

(declare-fun res!996746 () Bool)

(assert (=> b!1469308 (=> (not res!996746) (not e!825383))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99012 (_ BitVec 32)) Bool)

(assert (=> b!1469308 (= res!996746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469309 () Bool)

(declare-fun res!996751 () Bool)

(assert (=> b!1469309 (=> (not res!996751) (not e!825383))))

(assert (=> b!1469309 (= res!996751 (and (= (size!48340 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48340 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48340 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469310 () Bool)

(declare-fun res!996752 () Bool)

(assert (=> b!1469310 (=> (not res!996752) (not e!825383))))

(declare-datatypes ((List!34277 0))(
  ( (Nil!34274) (Cons!34273 (h!35637 (_ BitVec 64)) (t!48963 List!34277)) )
))
(declare-fun arrayNoDuplicates!0 (array!99012 (_ BitVec 32) List!34277) Bool)

(assert (=> b!1469310 (= res!996752 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34274))))

(declare-fun b!1469311 () Bool)

(declare-fun res!996750 () Bool)

(assert (=> b!1469311 (=> (not res!996750) (not e!825383))))

(assert (=> b!1469311 (= res!996750 (validKeyInArray!0 (select (arr!47789 a!2862) j!93)))))

(assert (= (and start!125726 res!996749) b!1469309))

(assert (= (and b!1469309 res!996751) b!1469307))

(assert (= (and b!1469307 res!996747) b!1469311))

(assert (= (and b!1469311 res!996750) b!1469308))

(assert (= (and b!1469308 res!996746) b!1469310))

(assert (= (and b!1469310 res!996752) b!1469306))

(assert (= (and b!1469306 res!996748) b!1469305))

(declare-fun m!1356229 () Bool)

(assert (=> b!1469311 m!1356229))

(assert (=> b!1469311 m!1356229))

(declare-fun m!1356231 () Bool)

(assert (=> b!1469311 m!1356231))

(declare-fun m!1356233 () Bool)

(assert (=> b!1469306 m!1356233))

(declare-fun m!1356235 () Bool)

(assert (=> b!1469306 m!1356235))

(declare-fun m!1356237 () Bool)

(assert (=> b!1469307 m!1356237))

(assert (=> b!1469307 m!1356237))

(declare-fun m!1356239 () Bool)

(assert (=> b!1469307 m!1356239))

(declare-fun m!1356241 () Bool)

(assert (=> b!1469308 m!1356241))

(declare-fun m!1356243 () Bool)

(assert (=> b!1469310 m!1356243))

(assert (=> b!1469305 m!1356229))

(assert (=> b!1469305 m!1356229))

(declare-fun m!1356245 () Bool)

(assert (=> b!1469305 m!1356245))

(assert (=> b!1469305 m!1356245))

(assert (=> b!1469305 m!1356229))

(declare-fun m!1356247 () Bool)

(assert (=> b!1469305 m!1356247))

(declare-fun m!1356249 () Bool)

(assert (=> start!125726 m!1356249))

(declare-fun m!1356251 () Bool)

(assert (=> start!125726 m!1356251))

(push 1)

(assert (not start!125726))

(assert (not b!1469307))

(assert (not b!1469308))

(assert (not b!1469305))

(assert (not b!1469310))

(assert (not b!1469311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

