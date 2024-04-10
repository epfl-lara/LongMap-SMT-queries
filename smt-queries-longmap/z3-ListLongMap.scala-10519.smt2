; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124050 () Bool)

(assert start!124050)

(declare-fun b!1436431 () Bool)

(declare-fun res!969348 () Bool)

(declare-fun e!810614 () Bool)

(assert (=> b!1436431 (=> (not res!969348) (not e!810614))))

(declare-datatypes ((array!97687 0))(
  ( (array!97688 (arr!47139 (Array (_ BitVec 32) (_ BitVec 64))) (size!47689 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97687)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436431 (= res!969348 (validKeyInArray!0 (select (arr!47139 a!2862) j!93)))))

(declare-fun b!1436432 () Bool)

(declare-fun res!969352 () Bool)

(assert (=> b!1436432 (=> (not res!969352) (not e!810614))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436432 (= res!969352 (and (= (size!47689 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47689 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47689 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436433 () Bool)

(declare-fun res!969351 () Bool)

(assert (=> b!1436433 (=> (not res!969351) (not e!810614))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436433 (= res!969351 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47689 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47689 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47689 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47139 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436434 () Bool)

(declare-fun res!969347 () Bool)

(assert (=> b!1436434 (=> (not res!969347) (not e!810614))))

(assert (=> b!1436434 (= res!969347 (validKeyInArray!0 (select (arr!47139 a!2862) i!1006)))))

(declare-fun b!1436435 () Bool)

(declare-fun res!969349 () Bool)

(assert (=> b!1436435 (=> (not res!969349) (not e!810614))))

(declare-datatypes ((List!33640 0))(
  ( (Nil!33637) (Cons!33636 (h!34971 (_ BitVec 64)) (t!48334 List!33640)) )
))
(declare-fun arrayNoDuplicates!0 (array!97687 (_ BitVec 32) List!33640) Bool)

(assert (=> b!1436435 (= res!969349 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33637))))

(declare-fun b!1436436 () Bool)

(assert (=> b!1436436 (= e!810614 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632127 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436436 (= lt!632127 (toIndex!0 (select (arr!47139 a!2862) j!93) mask!2687))))

(declare-fun b!1436430 () Bool)

(declare-fun res!969350 () Bool)

(assert (=> b!1436430 (=> (not res!969350) (not e!810614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97687 (_ BitVec 32)) Bool)

(assert (=> b!1436430 (= res!969350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969346 () Bool)

(assert (=> start!124050 (=> (not res!969346) (not e!810614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124050 (= res!969346 (validMask!0 mask!2687))))

(assert (=> start!124050 e!810614))

(assert (=> start!124050 true))

(declare-fun array_inv!36167 (array!97687) Bool)

(assert (=> start!124050 (array_inv!36167 a!2862)))

(assert (= (and start!124050 res!969346) b!1436432))

(assert (= (and b!1436432 res!969352) b!1436434))

(assert (= (and b!1436434 res!969347) b!1436431))

(assert (= (and b!1436431 res!969348) b!1436430))

(assert (= (and b!1436430 res!969350) b!1436435))

(assert (= (and b!1436435 res!969349) b!1436433))

(assert (= (and b!1436433 res!969351) b!1436436))

(declare-fun m!1325741 () Bool)

(assert (=> start!124050 m!1325741))

(declare-fun m!1325743 () Bool)

(assert (=> start!124050 m!1325743))

(declare-fun m!1325745 () Bool)

(assert (=> b!1436434 m!1325745))

(assert (=> b!1436434 m!1325745))

(declare-fun m!1325747 () Bool)

(assert (=> b!1436434 m!1325747))

(declare-fun m!1325749 () Bool)

(assert (=> b!1436431 m!1325749))

(assert (=> b!1436431 m!1325749))

(declare-fun m!1325751 () Bool)

(assert (=> b!1436431 m!1325751))

(declare-fun m!1325753 () Bool)

(assert (=> b!1436430 m!1325753))

(assert (=> b!1436436 m!1325749))

(assert (=> b!1436436 m!1325749))

(declare-fun m!1325755 () Bool)

(assert (=> b!1436436 m!1325755))

(declare-fun m!1325757 () Bool)

(assert (=> b!1436435 m!1325757))

(declare-fun m!1325759 () Bool)

(assert (=> b!1436433 m!1325759))

(declare-fun m!1325761 () Bool)

(assert (=> b!1436433 m!1325761))

(check-sat (not b!1436435) (not b!1436431) (not b!1436436) (not start!124050) (not b!1436430) (not b!1436434))
(check-sat)
