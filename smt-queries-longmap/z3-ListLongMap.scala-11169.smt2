; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130938 () Bool)

(assert start!130938)

(declare-fun b!1534608 () Bool)

(declare-fun res!1050262 () Bool)

(declare-fun e!855186 () Bool)

(assert (=> b!1534608 (=> (not res!1050262) (not e!855186))))

(declare-datatypes ((array!101854 0))(
  ( (array!101855 (arr!49141 (Array (_ BitVec 32) (_ BitVec 64))) (size!49692 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101854)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534608 (= res!1050262 (validKeyInArray!0 (select (arr!49141 a!2792) i!951)))))

(declare-fun b!1534609 () Bool)

(declare-fun res!1050261 () Bool)

(assert (=> b!1534609 (=> (not res!1050261) (not e!855186))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534609 (= res!1050261 (validKeyInArray!0 (select (arr!49141 a!2792) j!64)))))

(declare-fun res!1050264 () Bool)

(assert (=> start!130938 (=> (not res!1050264) (not e!855186))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130938 (= res!1050264 (validMask!0 mask!2480))))

(assert (=> start!130938 e!855186))

(assert (=> start!130938 true))

(declare-fun array_inv!38422 (array!101854) Bool)

(assert (=> start!130938 (array_inv!38422 a!2792)))

(declare-fun b!1534607 () Bool)

(declare-fun res!1050263 () Bool)

(assert (=> b!1534607 (=> (not res!1050263) (not e!855186))))

(assert (=> b!1534607 (= res!1050263 (and (= (size!49692 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49692 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49692 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534610 () Bool)

(assert (=> b!1534610 (= e!855186 (bvsgt #b00000000000000000000000000000000 (size!49692 a!2792)))))

(assert (= (and start!130938 res!1050264) b!1534607))

(assert (= (and b!1534607 res!1050263) b!1534608))

(assert (= (and b!1534608 res!1050262) b!1534609))

(assert (= (and b!1534609 res!1050261) b!1534610))

(declare-fun m!1417207 () Bool)

(assert (=> b!1534608 m!1417207))

(assert (=> b!1534608 m!1417207))

(declare-fun m!1417209 () Bool)

(assert (=> b!1534608 m!1417209))

(declare-fun m!1417211 () Bool)

(assert (=> b!1534609 m!1417211))

(assert (=> b!1534609 m!1417211))

(declare-fun m!1417213 () Bool)

(assert (=> b!1534609 m!1417213))

(declare-fun m!1417215 () Bool)

(assert (=> start!130938 m!1417215))

(declare-fun m!1417217 () Bool)

(assert (=> start!130938 m!1417217))

(check-sat (not b!1534608) (not start!130938) (not b!1534609))
(check-sat)
