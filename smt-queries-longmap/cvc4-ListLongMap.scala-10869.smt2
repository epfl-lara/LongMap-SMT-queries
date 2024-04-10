; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127390 () Bool)

(assert start!127390)

(declare-fun b!1497691 () Bool)

(declare-fun res!1018823 () Bool)

(declare-fun e!838669 () Bool)

(assert (=> b!1497691 (=> (not res!1018823) (not e!838669))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99852 0))(
  ( (array!99853 (arr!48190 (Array (_ BitVec 32) (_ BitVec 64))) (size!48740 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99852)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497691 (= res!1018823 (and (= (size!48740 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48740 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48740 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1018821 () Bool)

(assert (=> start!127390 (=> (not res!1018821) (not e!838669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127390 (= res!1018821 (validMask!0 mask!2661))))

(assert (=> start!127390 e!838669))

(assert (=> start!127390 true))

(declare-fun array_inv!37218 (array!99852) Bool)

(assert (=> start!127390 (array_inv!37218 a!2850)))

(declare-fun b!1497692 () Bool)

(declare-fun res!1018824 () Bool)

(assert (=> b!1497692 (=> (not res!1018824) (not e!838669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497692 (= res!1018824 (validKeyInArray!0 (select (arr!48190 a!2850) j!87)))))

(declare-fun b!1497693 () Bool)

(assert (=> b!1497693 (= e!838669 (bvsgt #b00000000000000000000000000000000 (size!48740 a!2850)))))

(declare-fun b!1497694 () Bool)

(declare-fun res!1018825 () Bool)

(assert (=> b!1497694 (=> (not res!1018825) (not e!838669))))

(assert (=> b!1497694 (= res!1018825 (validKeyInArray!0 (select (arr!48190 a!2850) i!996)))))

(declare-fun b!1497695 () Bool)

(declare-fun res!1018822 () Bool)

(assert (=> b!1497695 (=> (not res!1018822) (not e!838669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99852 (_ BitVec 32)) Bool)

(assert (=> b!1497695 (= res!1018822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127390 res!1018821) b!1497691))

(assert (= (and b!1497691 res!1018823) b!1497694))

(assert (= (and b!1497694 res!1018825) b!1497692))

(assert (= (and b!1497692 res!1018824) b!1497695))

(assert (= (and b!1497695 res!1018822) b!1497693))

(declare-fun m!1380779 () Bool)

(assert (=> start!127390 m!1380779))

(declare-fun m!1380781 () Bool)

(assert (=> start!127390 m!1380781))

(declare-fun m!1380783 () Bool)

(assert (=> b!1497692 m!1380783))

(assert (=> b!1497692 m!1380783))

(declare-fun m!1380785 () Bool)

(assert (=> b!1497692 m!1380785))

(declare-fun m!1380787 () Bool)

(assert (=> b!1497694 m!1380787))

(assert (=> b!1497694 m!1380787))

(declare-fun m!1380789 () Bool)

(assert (=> b!1497694 m!1380789))

(declare-fun m!1380791 () Bool)

(assert (=> b!1497695 m!1380791))

(push 1)

(assert (not b!1497694))

(assert (not b!1497695))

(assert (not b!1497692))

(assert (not start!127390))

(check-sat)

(pop 1)

(push 1)

