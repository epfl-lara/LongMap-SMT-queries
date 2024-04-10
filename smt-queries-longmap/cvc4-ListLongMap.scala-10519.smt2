; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124052 () Bool)

(assert start!124052)

(declare-fun b!1436451 () Bool)

(declare-fun res!969368 () Bool)

(declare-fun e!810620 () Bool)

(assert (=> b!1436451 (=> (not res!969368) (not e!810620))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97689 0))(
  ( (array!97690 (arr!47140 (Array (_ BitVec 32) (_ BitVec 64))) (size!47690 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97689)

(assert (=> b!1436451 (= res!969368 (and (= (size!47690 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47690 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47690 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436452 () Bool)

(declare-fun res!969369 () Bool)

(assert (=> b!1436452 (=> (not res!969369) (not e!810620))))

(declare-datatypes ((List!33641 0))(
  ( (Nil!33638) (Cons!33637 (h!34972 (_ BitVec 64)) (t!48335 List!33641)) )
))
(declare-fun arrayNoDuplicates!0 (array!97689 (_ BitVec 32) List!33641) Bool)

(assert (=> b!1436452 (= res!969369 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33638))))

(declare-fun b!1436453 () Bool)

(assert (=> b!1436453 (= e!810620 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632130 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436453 (= lt!632130 (toIndex!0 (select (arr!47140 a!2862) j!93) mask!2687))))

(declare-fun b!1436454 () Bool)

(declare-fun res!969367 () Bool)

(assert (=> b!1436454 (=> (not res!969367) (not e!810620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97689 (_ BitVec 32)) Bool)

(assert (=> b!1436454 (= res!969367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969370 () Bool)

(assert (=> start!124052 (=> (not res!969370) (not e!810620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124052 (= res!969370 (validMask!0 mask!2687))))

(assert (=> start!124052 e!810620))

(assert (=> start!124052 true))

(declare-fun array_inv!36168 (array!97689) Bool)

(assert (=> start!124052 (array_inv!36168 a!2862)))

(declare-fun b!1436455 () Bool)

(declare-fun res!969373 () Bool)

(assert (=> b!1436455 (=> (not res!969373) (not e!810620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436455 (= res!969373 (validKeyInArray!0 (select (arr!47140 a!2862) j!93)))))

(declare-fun b!1436456 () Bool)

(declare-fun res!969371 () Bool)

(assert (=> b!1436456 (=> (not res!969371) (not e!810620))))

(assert (=> b!1436456 (= res!969371 (validKeyInArray!0 (select (arr!47140 a!2862) i!1006)))))

(declare-fun b!1436457 () Bool)

(declare-fun res!969372 () Bool)

(assert (=> b!1436457 (=> (not res!969372) (not e!810620))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436457 (= res!969372 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47690 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47690 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47690 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47140 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124052 res!969370) b!1436451))

(assert (= (and b!1436451 res!969368) b!1436456))

(assert (= (and b!1436456 res!969371) b!1436455))

(assert (= (and b!1436455 res!969373) b!1436454))

(assert (= (and b!1436454 res!969367) b!1436452))

(assert (= (and b!1436452 res!969369) b!1436457))

(assert (= (and b!1436457 res!969372) b!1436453))

(declare-fun m!1325763 () Bool)

(assert (=> b!1436453 m!1325763))

(assert (=> b!1436453 m!1325763))

(declare-fun m!1325765 () Bool)

(assert (=> b!1436453 m!1325765))

(assert (=> b!1436455 m!1325763))

(assert (=> b!1436455 m!1325763))

(declare-fun m!1325767 () Bool)

(assert (=> b!1436455 m!1325767))

(declare-fun m!1325769 () Bool)

(assert (=> start!124052 m!1325769))

(declare-fun m!1325771 () Bool)

(assert (=> start!124052 m!1325771))

(declare-fun m!1325773 () Bool)

(assert (=> b!1436452 m!1325773))

(declare-fun m!1325775 () Bool)

(assert (=> b!1436456 m!1325775))

(assert (=> b!1436456 m!1325775))

(declare-fun m!1325777 () Bool)

(assert (=> b!1436456 m!1325777))

(declare-fun m!1325779 () Bool)

(assert (=> b!1436454 m!1325779))

(declare-fun m!1325781 () Bool)

(assert (=> b!1436457 m!1325781))

(declare-fun m!1325783 () Bool)

(assert (=> b!1436457 m!1325783))

(push 1)

(assert (not b!1436452))

(assert (not b!1436455))

(assert (not b!1436456))

(assert (not b!1436454))

(assert (not start!124052))

(assert (not b!1436453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

