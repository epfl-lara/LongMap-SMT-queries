; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123882 () Bool)

(assert start!123882)

(declare-fun b!1435731 () Bool)

(declare-fun res!968739 () Bool)

(declare-fun e!810250 () Bool)

(assert (=> b!1435731 (=> (not res!968739) (not e!810250))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97626 0))(
  ( (array!97627 (arr!47114 (Array (_ BitVec 32) (_ BitVec 64))) (size!47664 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97626)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1435731 (= res!968739 (and (= (size!47664 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47664 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47664 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435733 () Bool)

(declare-fun res!968740 () Bool)

(assert (=> b!1435733 (=> (not res!968740) (not e!810250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435733 (= res!968740 (validKeyInArray!0 (select (arr!47114 a!2862) j!93)))))

(declare-fun b!1435732 () Bool)

(declare-fun res!968737 () Bool)

(assert (=> b!1435732 (=> (not res!968737) (not e!810250))))

(assert (=> b!1435732 (= res!968737 (validKeyInArray!0 (select (arr!47114 a!2862) i!1006)))))

(declare-fun res!968738 () Bool)

(assert (=> start!123882 (=> (not res!968738) (not e!810250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123882 (= res!968738 (validMask!0 mask!2687))))

(assert (=> start!123882 e!810250))

(assert (=> start!123882 true))

(declare-fun array_inv!36142 (array!97626) Bool)

(assert (=> start!123882 (array_inv!36142 a!2862)))

(declare-fun b!1435734 () Bool)

(assert (=> b!1435734 (= e!810250 (bvsgt #b00000000000000000000000000000000 (size!47664 a!2862)))))

(assert (= (and start!123882 res!968738) b!1435731))

(assert (= (and b!1435731 res!968739) b!1435732))

(assert (= (and b!1435732 res!968737) b!1435733))

(assert (= (and b!1435733 res!968740) b!1435734))

(declare-fun m!1325103 () Bool)

(assert (=> b!1435733 m!1325103))

(assert (=> b!1435733 m!1325103))

(declare-fun m!1325105 () Bool)

(assert (=> b!1435733 m!1325105))

(declare-fun m!1325107 () Bool)

(assert (=> b!1435732 m!1325107))

(assert (=> b!1435732 m!1325107))

(declare-fun m!1325109 () Bool)

(assert (=> b!1435732 m!1325109))

(declare-fun m!1325111 () Bool)

(assert (=> start!123882 m!1325111))

(declare-fun m!1325113 () Bool)

(assert (=> start!123882 m!1325113))

(push 1)

(assert (not start!123882))

(assert (not b!1435732))

(assert (not b!1435733))

(check-sat)

(pop 1)

