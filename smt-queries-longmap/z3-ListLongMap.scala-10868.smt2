; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127656 () Bool)

(assert start!127656)

(declare-fun b!1499348 () Bool)

(declare-fun res!1019372 () Bool)

(declare-fun e!839712 () Bool)

(assert (=> b!1499348 (=> (not res!1019372) (not e!839712))))

(declare-datatypes ((array!99957 0))(
  ( (array!99958 (arr!48238 (Array (_ BitVec 32) (_ BitVec 64))) (size!48789 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99957)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499348 (= res!1019372 (validKeyInArray!0 (select (arr!48238 a!2850) i!996)))))

(declare-fun b!1499350 () Bool)

(assert (=> b!1499350 (= e!839712 (bvsgt #b00000000000000000000000000000000 (size!48789 a!2850)))))

(declare-fun b!1499347 () Bool)

(declare-fun res!1019374 () Bool)

(assert (=> b!1499347 (=> (not res!1019374) (not e!839712))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499347 (= res!1019374 (and (= (size!48789 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48789 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48789 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1019373 () Bool)

(assert (=> start!127656 (=> (not res!1019373) (not e!839712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127656 (= res!1019373 (validMask!0 mask!2661))))

(assert (=> start!127656 e!839712))

(assert (=> start!127656 true))

(declare-fun array_inv!37519 (array!99957) Bool)

(assert (=> start!127656 (array_inv!37519 a!2850)))

(declare-fun b!1499349 () Bool)

(declare-fun res!1019375 () Bool)

(assert (=> b!1499349 (=> (not res!1019375) (not e!839712))))

(assert (=> b!1499349 (= res!1019375 (validKeyInArray!0 (select (arr!48238 a!2850) j!87)))))

(assert (= (and start!127656 res!1019373) b!1499347))

(assert (= (and b!1499347 res!1019374) b!1499348))

(assert (= (and b!1499348 res!1019372) b!1499349))

(assert (= (and b!1499349 res!1019375) b!1499350))

(declare-fun m!1382457 () Bool)

(assert (=> b!1499348 m!1382457))

(assert (=> b!1499348 m!1382457))

(declare-fun m!1382459 () Bool)

(assert (=> b!1499348 m!1382459))

(declare-fun m!1382461 () Bool)

(assert (=> start!127656 m!1382461))

(declare-fun m!1382463 () Bool)

(assert (=> start!127656 m!1382463))

(declare-fun m!1382465 () Bool)

(assert (=> b!1499349 m!1382465))

(assert (=> b!1499349 m!1382465))

(declare-fun m!1382467 () Bool)

(assert (=> b!1499349 m!1382467))

(check-sat (not start!127656) (not b!1499348) (not b!1499349))
(check-sat)
