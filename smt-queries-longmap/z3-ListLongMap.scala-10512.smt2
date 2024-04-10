; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123890 () Bool)

(assert start!123890)

(declare-fun b!1435784 () Bool)

(declare-fun res!968794 () Bool)

(declare-fun e!810275 () Bool)

(assert (=> b!1435784 (=> (not res!968794) (not e!810275))))

(declare-datatypes ((array!97634 0))(
  ( (array!97635 (arr!47118 (Array (_ BitVec 32) (_ BitVec 64))) (size!47668 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97634)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435784 (= res!968794 (validKeyInArray!0 (select (arr!47118 a!2862) j!93)))))

(declare-fun res!968790 () Bool)

(assert (=> start!123890 (=> (not res!968790) (not e!810275))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123890 (= res!968790 (validMask!0 mask!2687))))

(assert (=> start!123890 e!810275))

(assert (=> start!123890 true))

(declare-fun array_inv!36146 (array!97634) Bool)

(assert (=> start!123890 (array_inv!36146 a!2862)))

(declare-fun b!1435785 () Bool)

(declare-fun res!968793 () Bool)

(assert (=> b!1435785 (=> (not res!968793) (not e!810275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97634 (_ BitVec 32)) Bool)

(assert (=> b!1435785 (= res!968793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435786 () Bool)

(declare-fun res!968791 () Bool)

(assert (=> b!1435786 (=> (not res!968791) (not e!810275))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1435786 (= res!968791 (and (= (size!47668 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47668 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47668 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435787 () Bool)

(declare-fun res!968792 () Bool)

(assert (=> b!1435787 (=> (not res!968792) (not e!810275))))

(assert (=> b!1435787 (= res!968792 (validKeyInArray!0 (select (arr!47118 a!2862) i!1006)))))

(declare-fun b!1435788 () Bool)

(assert (=> b!1435788 (= e!810275 (bvsgt #b00000000000000000000000000000000 (size!47668 a!2862)))))

(assert (= (and start!123890 res!968790) b!1435786))

(assert (= (and b!1435786 res!968791) b!1435787))

(assert (= (and b!1435787 res!968792) b!1435784))

(assert (= (and b!1435784 res!968794) b!1435785))

(assert (= (and b!1435785 res!968793) b!1435788))

(declare-fun m!1325153 () Bool)

(assert (=> b!1435784 m!1325153))

(assert (=> b!1435784 m!1325153))

(declare-fun m!1325155 () Bool)

(assert (=> b!1435784 m!1325155))

(declare-fun m!1325157 () Bool)

(assert (=> start!123890 m!1325157))

(declare-fun m!1325159 () Bool)

(assert (=> start!123890 m!1325159))

(declare-fun m!1325161 () Bool)

(assert (=> b!1435785 m!1325161))

(declare-fun m!1325163 () Bool)

(assert (=> b!1435787 m!1325163))

(assert (=> b!1435787 m!1325163))

(declare-fun m!1325165 () Bool)

(assert (=> b!1435787 m!1325165))

(check-sat (not b!1435787) (not start!123890) (not b!1435784) (not b!1435785))
(check-sat)
