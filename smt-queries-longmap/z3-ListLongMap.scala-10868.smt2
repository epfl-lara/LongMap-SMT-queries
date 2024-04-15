; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127334 () Bool)

(assert start!127334)

(declare-fun b!1497310 () Bool)

(declare-fun res!1018628 () Bool)

(declare-fun e!838442 () Bool)

(assert (=> b!1497310 (=> (not res!1018628) (not e!838442))))

(declare-datatypes ((array!99790 0))(
  ( (array!99791 (arr!48160 (Array (_ BitVec 32) (_ BitVec 64))) (size!48712 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99790)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497310 (= res!1018628 (validKeyInArray!0 (select (arr!48160 a!2850) i!996)))))

(declare-fun b!1497312 () Bool)

(assert (=> b!1497312 (= e!838442 (bvsgt #b00000000000000000000000000000000 (size!48712 a!2850)))))

(declare-fun b!1497309 () Bool)

(declare-fun res!1018630 () Bool)

(assert (=> b!1497309 (=> (not res!1018630) (not e!838442))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497309 (= res!1018630 (and (= (size!48712 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48712 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48712 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1018629 () Bool)

(assert (=> start!127334 (=> (not res!1018629) (not e!838442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127334 (= res!1018629 (validMask!0 mask!2661))))

(assert (=> start!127334 e!838442))

(assert (=> start!127334 true))

(declare-fun array_inv!37393 (array!99790) Bool)

(assert (=> start!127334 (array_inv!37393 a!2850)))

(declare-fun b!1497311 () Bool)

(declare-fun res!1018627 () Bool)

(assert (=> b!1497311 (=> (not res!1018627) (not e!838442))))

(assert (=> b!1497311 (= res!1018627 (validKeyInArray!0 (select (arr!48160 a!2850) j!87)))))

(assert (= (and start!127334 res!1018629) b!1497309))

(assert (= (and b!1497309 res!1018630) b!1497310))

(assert (= (and b!1497310 res!1018628) b!1497311))

(assert (= (and b!1497311 res!1018627) b!1497312))

(declare-fun m!1379865 () Bool)

(assert (=> b!1497310 m!1379865))

(assert (=> b!1497310 m!1379865))

(declare-fun m!1379867 () Bool)

(assert (=> b!1497310 m!1379867))

(declare-fun m!1379869 () Bool)

(assert (=> start!127334 m!1379869))

(declare-fun m!1379871 () Bool)

(assert (=> start!127334 m!1379871))

(declare-fun m!1379873 () Bool)

(assert (=> b!1497311 m!1379873))

(assert (=> b!1497311 m!1379873))

(declare-fun m!1379875 () Bool)

(assert (=> b!1497311 m!1379875))

(check-sat (not b!1497311) (not b!1497310) (not start!127334))
(check-sat)
