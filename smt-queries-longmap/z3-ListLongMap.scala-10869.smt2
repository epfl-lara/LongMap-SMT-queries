; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127388 () Bool)

(assert start!127388)

(declare-fun b!1497676 () Bool)

(declare-fun res!1018807 () Bool)

(declare-fun e!838663 () Bool)

(assert (=> b!1497676 (=> (not res!1018807) (not e!838663))))

(declare-datatypes ((array!99850 0))(
  ( (array!99851 (arr!48189 (Array (_ BitVec 32) (_ BitVec 64))) (size!48739 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99850)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99850 (_ BitVec 32)) Bool)

(assert (=> b!1497676 (= res!1018807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497677 () Bool)

(assert (=> b!1497677 (= e!838663 (bvsgt #b00000000000000000000000000000000 (size!48739 a!2850)))))

(declare-fun b!1497678 () Bool)

(declare-fun res!1018808 () Bool)

(assert (=> b!1497678 (=> (not res!1018808) (not e!838663))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497678 (= res!1018808 (validKeyInArray!0 (select (arr!48189 a!2850) j!87)))))

(declare-fun res!1018810 () Bool)

(assert (=> start!127388 (=> (not res!1018810) (not e!838663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127388 (= res!1018810 (validMask!0 mask!2661))))

(assert (=> start!127388 e!838663))

(assert (=> start!127388 true))

(declare-fun array_inv!37217 (array!99850) Bool)

(assert (=> start!127388 (array_inv!37217 a!2850)))

(declare-fun b!1497679 () Bool)

(declare-fun res!1018809 () Bool)

(assert (=> b!1497679 (=> (not res!1018809) (not e!838663))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497679 (= res!1018809 (validKeyInArray!0 (select (arr!48189 a!2850) i!996)))))

(declare-fun b!1497680 () Bool)

(declare-fun res!1018806 () Bool)

(assert (=> b!1497680 (=> (not res!1018806) (not e!838663))))

(assert (=> b!1497680 (= res!1018806 (and (= (size!48739 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48739 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48739 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127388 res!1018810) b!1497680))

(assert (= (and b!1497680 res!1018806) b!1497679))

(assert (= (and b!1497679 res!1018809) b!1497678))

(assert (= (and b!1497678 res!1018808) b!1497676))

(assert (= (and b!1497676 res!1018807) b!1497677))

(declare-fun m!1380765 () Bool)

(assert (=> b!1497676 m!1380765))

(declare-fun m!1380767 () Bool)

(assert (=> b!1497678 m!1380767))

(assert (=> b!1497678 m!1380767))

(declare-fun m!1380769 () Bool)

(assert (=> b!1497678 m!1380769))

(declare-fun m!1380771 () Bool)

(assert (=> start!127388 m!1380771))

(declare-fun m!1380773 () Bool)

(assert (=> start!127388 m!1380773))

(declare-fun m!1380775 () Bool)

(assert (=> b!1497679 m!1380775))

(assert (=> b!1497679 m!1380775))

(declare-fun m!1380777 () Bool)

(assert (=> b!1497679 m!1380777))

(check-sat (not b!1497678) (not b!1497679) (not start!127388) (not b!1497676))
(check-sat)
