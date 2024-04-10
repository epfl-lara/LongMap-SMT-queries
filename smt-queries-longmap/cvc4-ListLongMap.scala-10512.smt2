; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123892 () Bool)

(assert start!123892)

(declare-fun b!1435799 () Bool)

(declare-fun res!968805 () Bool)

(declare-fun e!810281 () Bool)

(assert (=> b!1435799 (=> (not res!968805) (not e!810281))))

(declare-datatypes ((array!97636 0))(
  ( (array!97637 (arr!47119 (Array (_ BitVec 32) (_ BitVec 64))) (size!47669 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97636)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97636 (_ BitVec 32)) Bool)

(assert (=> b!1435799 (= res!968805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435800 () Bool)

(declare-fun res!968806 () Bool)

(assert (=> b!1435800 (=> (not res!968806) (not e!810281))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435800 (= res!968806 (validKeyInArray!0 (select (arr!47119 a!2862) j!93)))))

(declare-fun b!1435801 () Bool)

(assert (=> b!1435801 (= e!810281 (bvsgt #b00000000000000000000000000000000 (size!47669 a!2862)))))

(declare-fun b!1435803 () Bool)

(declare-fun res!968807 () Bool)

(assert (=> b!1435803 (=> (not res!968807) (not e!810281))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435803 (= res!968807 (validKeyInArray!0 (select (arr!47119 a!2862) i!1006)))))

(declare-fun b!1435802 () Bool)

(declare-fun res!968808 () Bool)

(assert (=> b!1435802 (=> (not res!968808) (not e!810281))))

(assert (=> b!1435802 (= res!968808 (and (= (size!47669 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47669 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47669 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!968809 () Bool)

(assert (=> start!123892 (=> (not res!968809) (not e!810281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123892 (= res!968809 (validMask!0 mask!2687))))

(assert (=> start!123892 e!810281))

(assert (=> start!123892 true))

(declare-fun array_inv!36147 (array!97636) Bool)

(assert (=> start!123892 (array_inv!36147 a!2862)))

(assert (= (and start!123892 res!968809) b!1435802))

(assert (= (and b!1435802 res!968808) b!1435803))

(assert (= (and b!1435803 res!968807) b!1435800))

(assert (= (and b!1435800 res!968806) b!1435799))

(assert (= (and b!1435799 res!968805) b!1435801))

(declare-fun m!1325167 () Bool)

(assert (=> b!1435799 m!1325167))

(declare-fun m!1325169 () Bool)

(assert (=> b!1435800 m!1325169))

(assert (=> b!1435800 m!1325169))

(declare-fun m!1325171 () Bool)

(assert (=> b!1435800 m!1325171))

(declare-fun m!1325173 () Bool)

(assert (=> b!1435803 m!1325173))

(assert (=> b!1435803 m!1325173))

(declare-fun m!1325175 () Bool)

(assert (=> b!1435803 m!1325175))

(declare-fun m!1325177 () Bool)

(assert (=> start!123892 m!1325177))

(declare-fun m!1325179 () Bool)

(assert (=> start!123892 m!1325179))

(push 1)

(assert (not start!123892))

(assert (not b!1435799))

(assert (not b!1435800))

(assert (not b!1435803))

(check-sat)

(pop 1)

