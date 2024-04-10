; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127382 () Bool)

(assert start!127382)

(declare-fun b!1497638 () Bool)

(declare-fun e!838645 () Bool)

(declare-datatypes ((array!99844 0))(
  ( (array!99845 (arr!48186 (Array (_ BitVec 32) (_ BitVec 64))) (size!48736 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99844)

(assert (=> b!1497638 (= e!838645 (bvsgt #b00000000000000000000000000000000 (size!48736 a!2850)))))

(declare-fun b!1497636 () Bool)

(declare-fun res!1018768 () Bool)

(assert (=> b!1497636 (=> (not res!1018768) (not e!838645))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497636 (= res!1018768 (validKeyInArray!0 (select (arr!48186 a!2850) i!996)))))

(declare-fun res!1018765 () Bool)

(assert (=> start!127382 (=> (not res!1018765) (not e!838645))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127382 (= res!1018765 (validMask!0 mask!2661))))

(assert (=> start!127382 e!838645))

(assert (=> start!127382 true))

(declare-fun array_inv!37214 (array!99844) Bool)

(assert (=> start!127382 (array_inv!37214 a!2850)))

(declare-fun b!1497637 () Bool)

(declare-fun res!1018766 () Bool)

(assert (=> b!1497637 (=> (not res!1018766) (not e!838645))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497637 (= res!1018766 (validKeyInArray!0 (select (arr!48186 a!2850) j!87)))))

(declare-fun b!1497635 () Bool)

(declare-fun res!1018767 () Bool)

(assert (=> b!1497635 (=> (not res!1018767) (not e!838645))))

(assert (=> b!1497635 (= res!1018767 (and (= (size!48736 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48736 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48736 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127382 res!1018765) b!1497635))

(assert (= (and b!1497635 res!1018767) b!1497636))

(assert (= (and b!1497636 res!1018768) b!1497637))

(assert (= (and b!1497637 res!1018766) b!1497638))

(declare-fun m!1380727 () Bool)

(assert (=> b!1497636 m!1380727))

(assert (=> b!1497636 m!1380727))

(declare-fun m!1380729 () Bool)

(assert (=> b!1497636 m!1380729))

(declare-fun m!1380731 () Bool)

(assert (=> start!127382 m!1380731))

(declare-fun m!1380733 () Bool)

(assert (=> start!127382 m!1380733))

(declare-fun m!1380735 () Bool)

(assert (=> b!1497637 m!1380735))

(assert (=> b!1497637 m!1380735))

(declare-fun m!1380737 () Bool)

(assert (=> b!1497637 m!1380737))

(check-sat (not b!1497636) (not b!1497637) (not start!127382))
(check-sat)
