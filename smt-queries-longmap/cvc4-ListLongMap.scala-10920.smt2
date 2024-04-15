; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127738 () Bool)

(assert start!127738)

(declare-fun b!1501461 () Bool)

(declare-fun res!1022725 () Bool)

(declare-fun e!839855 () Bool)

(assert (=> b!1501461 (=> (not res!1022725) (not e!839855))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100113 0))(
  ( (array!100114 (arr!48317 (Array (_ BitVec 32) (_ BitVec 64))) (size!48869 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100113)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501461 (= res!1022725 (and (= (size!48869 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48869 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48869 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022729 () Bool)

(assert (=> start!127738 (=> (not res!1022729) (not e!839855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127738 (= res!1022729 (validMask!0 mask!2661))))

(assert (=> start!127738 e!839855))

(assert (=> start!127738 true))

(declare-fun array_inv!37550 (array!100113) Bool)

(assert (=> start!127738 (array_inv!37550 a!2850)))

(declare-fun b!1501462 () Bool)

(declare-fun res!1022728 () Bool)

(assert (=> b!1501462 (=> (not res!1022728) (not e!839855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501462 (= res!1022728 (validKeyInArray!0 (select (arr!48317 a!2850) i!996)))))

(declare-fun b!1501463 () Bool)

(declare-fun res!1022727 () Bool)

(assert (=> b!1501463 (=> (not res!1022727) (not e!839855))))

(assert (=> b!1501463 (= res!1022727 (validKeyInArray!0 (select (arr!48317 a!2850) j!87)))))

(declare-fun b!1501464 () Bool)

(assert (=> b!1501464 (= e!839855 false)))

(declare-fun lt!652981 () Bool)

(declare-datatypes ((List!34887 0))(
  ( (Nil!34884) (Cons!34883 (h!36281 (_ BitVec 64)) (t!49573 List!34887)) )
))
(declare-fun arrayNoDuplicates!0 (array!100113 (_ BitVec 32) List!34887) Bool)

(assert (=> b!1501464 (= lt!652981 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34884))))

(declare-fun b!1501465 () Bool)

(declare-fun res!1022726 () Bool)

(assert (=> b!1501465 (=> (not res!1022726) (not e!839855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100113 (_ BitVec 32)) Bool)

(assert (=> b!1501465 (= res!1022726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127738 res!1022729) b!1501461))

(assert (= (and b!1501461 res!1022725) b!1501462))

(assert (= (and b!1501462 res!1022728) b!1501463))

(assert (= (and b!1501463 res!1022727) b!1501465))

(assert (= (and b!1501465 res!1022726) b!1501464))

(declare-fun m!1384181 () Bool)

(assert (=> b!1501464 m!1384181))

(declare-fun m!1384183 () Bool)

(assert (=> b!1501462 m!1384183))

(assert (=> b!1501462 m!1384183))

(declare-fun m!1384185 () Bool)

(assert (=> b!1501462 m!1384185))

(declare-fun m!1384187 () Bool)

(assert (=> b!1501465 m!1384187))

(declare-fun m!1384189 () Bool)

(assert (=> start!127738 m!1384189))

(declare-fun m!1384191 () Bool)

(assert (=> start!127738 m!1384191))

(declare-fun m!1384193 () Bool)

(assert (=> b!1501463 m!1384193))

(assert (=> b!1501463 m!1384193))

(declare-fun m!1384195 () Bool)

(assert (=> b!1501463 m!1384195))

(push 1)

(assert (not b!1501463))

(assert (not b!1501464))

(assert (not b!1501462))

(assert (not b!1501465))

(assert (not start!127738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

