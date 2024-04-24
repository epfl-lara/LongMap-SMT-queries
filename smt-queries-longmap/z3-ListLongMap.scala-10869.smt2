; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127662 () Bool)

(assert start!127662)

(declare-fun b!1499385 () Bool)

(declare-fun res!1019410 () Bool)

(declare-fun e!839729 () Bool)

(assert (=> b!1499385 (=> (not res!1019410) (not e!839729))))

(declare-datatypes ((array!99963 0))(
  ( (array!99964 (arr!48241 (Array (_ BitVec 32) (_ BitVec 64))) (size!48792 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99963)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99963 (_ BitVec 32)) Bool)

(assert (=> b!1499385 (= res!1019410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499386 () Bool)

(assert (=> b!1499386 (= e!839729 (bvsgt #b00000000000000000000000000000000 (size!48792 a!2850)))))

(declare-fun b!1499387 () Bool)

(declare-fun res!1019412 () Bool)

(assert (=> b!1499387 (=> (not res!1019412) (not e!839729))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499387 (= res!1019412 (and (= (size!48792 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48792 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48792 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499388 () Bool)

(declare-fun res!1019414 () Bool)

(assert (=> b!1499388 (=> (not res!1019414) (not e!839729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499388 (= res!1019414 (validKeyInArray!0 (select (arr!48241 a!2850) i!996)))))

(declare-fun res!1019411 () Bool)

(assert (=> start!127662 (=> (not res!1019411) (not e!839729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127662 (= res!1019411 (validMask!0 mask!2661))))

(assert (=> start!127662 e!839729))

(assert (=> start!127662 true))

(declare-fun array_inv!37522 (array!99963) Bool)

(assert (=> start!127662 (array_inv!37522 a!2850)))

(declare-fun b!1499389 () Bool)

(declare-fun res!1019413 () Bool)

(assert (=> b!1499389 (=> (not res!1019413) (not e!839729))))

(assert (=> b!1499389 (= res!1019413 (validKeyInArray!0 (select (arr!48241 a!2850) j!87)))))

(assert (= (and start!127662 res!1019411) b!1499387))

(assert (= (and b!1499387 res!1019412) b!1499388))

(assert (= (and b!1499388 res!1019414) b!1499389))

(assert (= (and b!1499389 res!1019413) b!1499385))

(assert (= (and b!1499385 res!1019410) b!1499386))

(declare-fun m!1382493 () Bool)

(assert (=> b!1499385 m!1382493))

(declare-fun m!1382495 () Bool)

(assert (=> b!1499388 m!1382495))

(assert (=> b!1499388 m!1382495))

(declare-fun m!1382497 () Bool)

(assert (=> b!1499388 m!1382497))

(declare-fun m!1382499 () Bool)

(assert (=> start!127662 m!1382499))

(declare-fun m!1382501 () Bool)

(assert (=> start!127662 m!1382501))

(declare-fun m!1382503 () Bool)

(assert (=> b!1499389 m!1382503))

(assert (=> b!1499389 m!1382503))

(declare-fun m!1382505 () Bool)

(assert (=> b!1499389 m!1382505))

(check-sat (not b!1499388) (not b!1499389) (not start!127662) (not b!1499385))
(check-sat)
