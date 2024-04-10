; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127384 () Bool)

(assert start!127384)

(declare-fun b!1497647 () Bool)

(declare-fun res!1018777 () Bool)

(declare-fun e!838650 () Bool)

(assert (=> b!1497647 (=> (not res!1018777) (not e!838650))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99846 0))(
  ( (array!99847 (arr!48187 (Array (_ BitVec 32) (_ BitVec 64))) (size!48737 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99846)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497647 (= res!1018777 (and (= (size!48737 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48737 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48737 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1018778 () Bool)

(assert (=> start!127384 (=> (not res!1018778) (not e!838650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127384 (= res!1018778 (validMask!0 mask!2661))))

(assert (=> start!127384 e!838650))

(assert (=> start!127384 true))

(declare-fun array_inv!37215 (array!99846) Bool)

(assert (=> start!127384 (array_inv!37215 a!2850)))

(declare-fun b!1497649 () Bool)

(declare-fun res!1018779 () Bool)

(assert (=> b!1497649 (=> (not res!1018779) (not e!838650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497649 (= res!1018779 (validKeyInArray!0 (select (arr!48187 a!2850) j!87)))))

(declare-fun b!1497650 () Bool)

(assert (=> b!1497650 (= e!838650 (bvsgt #b00000000000000000000000000000000 (size!48737 a!2850)))))

(declare-fun b!1497648 () Bool)

(declare-fun res!1018780 () Bool)

(assert (=> b!1497648 (=> (not res!1018780) (not e!838650))))

(assert (=> b!1497648 (= res!1018780 (validKeyInArray!0 (select (arr!48187 a!2850) i!996)))))

(assert (= (and start!127384 res!1018778) b!1497647))

(assert (= (and b!1497647 res!1018777) b!1497648))

(assert (= (and b!1497648 res!1018780) b!1497649))

(assert (= (and b!1497649 res!1018779) b!1497650))

(declare-fun m!1380739 () Bool)

(assert (=> start!127384 m!1380739))

(declare-fun m!1380741 () Bool)

(assert (=> start!127384 m!1380741))

(declare-fun m!1380743 () Bool)

(assert (=> b!1497649 m!1380743))

(assert (=> b!1497649 m!1380743))

(declare-fun m!1380745 () Bool)

(assert (=> b!1497649 m!1380745))

(declare-fun m!1380747 () Bool)

(assert (=> b!1497648 m!1380747))

(assert (=> b!1497648 m!1380747))

(declare-fun m!1380749 () Bool)

(assert (=> b!1497648 m!1380749))

(push 1)

(assert (not start!127384))

(assert (not b!1497648))

(assert (not b!1497649))

(check-sat)

(pop 1)

(push 1)

(check-sat)

