; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124114 () Bool)

(assert start!124114)

(declare-fun b!1437104 () Bool)

(declare-fun res!969272 () Bool)

(declare-fun e!811127 () Bool)

(assert (=> b!1437104 (=> (not res!969272) (not e!811127))))

(declare-datatypes ((array!97739 0))(
  ( (array!97740 (arr!47167 (Array (_ BitVec 32) (_ BitVec 64))) (size!47718 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97739)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437104 (= res!969272 (validKeyInArray!0 (select (arr!47167 a!2862) j!93)))))

(declare-fun res!969271 () Bool)

(assert (=> start!124114 (=> (not res!969271) (not e!811127))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124114 (= res!969271 (validMask!0 mask!2687))))

(assert (=> start!124114 e!811127))

(assert (=> start!124114 true))

(declare-fun array_inv!36448 (array!97739) Bool)

(assert (=> start!124114 (array_inv!36448 a!2862)))

(declare-fun b!1437103 () Bool)

(declare-fun res!969273 () Bool)

(assert (=> b!1437103 (=> (not res!969273) (not e!811127))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437103 (= res!969273 (validKeyInArray!0 (select (arr!47167 a!2862) i!1006)))))

(declare-fun b!1437105 () Bool)

(assert (=> b!1437105 (= e!811127 (bvsgt #b00000000000000000000000000000000 (size!47718 a!2862)))))

(declare-fun b!1437102 () Bool)

(declare-fun res!969274 () Bool)

(assert (=> b!1437102 (=> (not res!969274) (not e!811127))))

(assert (=> b!1437102 (= res!969274 (and (= (size!47718 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47718 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47718 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124114 res!969271) b!1437102))

(assert (= (and b!1437102 res!969274) b!1437103))

(assert (= (and b!1437103 res!969273) b!1437104))

(assert (= (and b!1437104 res!969272) b!1437105))

(declare-fun m!1326601 () Bool)

(assert (=> b!1437104 m!1326601))

(assert (=> b!1437104 m!1326601))

(declare-fun m!1326603 () Bool)

(assert (=> b!1437104 m!1326603))

(declare-fun m!1326605 () Bool)

(assert (=> start!124114 m!1326605))

(declare-fun m!1326607 () Bool)

(assert (=> start!124114 m!1326607))

(declare-fun m!1326609 () Bool)

(assert (=> b!1437103 m!1326609))

(assert (=> b!1437103 m!1326609))

(declare-fun m!1326611 () Bool)

(assert (=> b!1437103 m!1326611))

(check-sat (not b!1437103) (not b!1437104) (not start!124114))
(check-sat)
