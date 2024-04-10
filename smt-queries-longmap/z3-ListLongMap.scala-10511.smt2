; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123884 () Bool)

(assert start!123884)

(declare-fun b!1435744 () Bool)

(declare-fun res!968750 () Bool)

(declare-fun e!810256 () Bool)

(assert (=> b!1435744 (=> (not res!968750) (not e!810256))))

(declare-datatypes ((array!97628 0))(
  ( (array!97629 (arr!47115 (Array (_ BitVec 32) (_ BitVec 64))) (size!47665 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97628)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435744 (= res!968750 (validKeyInArray!0 (select (arr!47115 a!2862) i!1006)))))

(declare-fun b!1435746 () Bool)

(assert (=> b!1435746 (= e!810256 (bvsgt #b00000000000000000000000000000000 (size!47665 a!2862)))))

(declare-fun b!1435743 () Bool)

(declare-fun res!968749 () Bool)

(assert (=> b!1435743 (=> (not res!968749) (not e!810256))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1435743 (= res!968749 (and (= (size!47665 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47665 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47665 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435745 () Bool)

(declare-fun res!968752 () Bool)

(assert (=> b!1435745 (=> (not res!968752) (not e!810256))))

(assert (=> b!1435745 (= res!968752 (validKeyInArray!0 (select (arr!47115 a!2862) j!93)))))

(declare-fun res!968751 () Bool)

(assert (=> start!123884 (=> (not res!968751) (not e!810256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123884 (= res!968751 (validMask!0 mask!2687))))

(assert (=> start!123884 e!810256))

(assert (=> start!123884 true))

(declare-fun array_inv!36143 (array!97628) Bool)

(assert (=> start!123884 (array_inv!36143 a!2862)))

(assert (= (and start!123884 res!968751) b!1435743))

(assert (= (and b!1435743 res!968749) b!1435744))

(assert (= (and b!1435744 res!968750) b!1435745))

(assert (= (and b!1435745 res!968752) b!1435746))

(declare-fun m!1325115 () Bool)

(assert (=> b!1435744 m!1325115))

(assert (=> b!1435744 m!1325115))

(declare-fun m!1325117 () Bool)

(assert (=> b!1435744 m!1325117))

(declare-fun m!1325119 () Bool)

(assert (=> b!1435745 m!1325119))

(assert (=> b!1435745 m!1325119))

(declare-fun m!1325121 () Bool)

(assert (=> b!1435745 m!1325121))

(declare-fun m!1325123 () Bool)

(assert (=> start!123884 m!1325123))

(declare-fun m!1325125 () Bool)

(assert (=> start!123884 m!1325125))

(check-sat (not start!123884) (not b!1435744) (not b!1435745))
(check-sat)
