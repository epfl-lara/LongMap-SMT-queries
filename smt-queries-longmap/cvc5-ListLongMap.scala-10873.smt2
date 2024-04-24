; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127772 () Bool)

(assert start!127772)

(declare-fun b!1499781 () Bool)

(declare-fun res!1019758 () Bool)

(declare-fun e!839948 () Bool)

(assert (=> b!1499781 (=> (not res!1019758) (not e!839948))))

(declare-datatypes ((array!99998 0))(
  ( (array!99999 (arr!48255 (Array (_ BitVec 32) (_ BitVec 64))) (size!48806 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99998)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499781 (= res!1019758 (validKeyInArray!0 (select (arr!48255 a!2850) j!87)))))

(declare-fun b!1499782 () Bool)

(assert (=> b!1499782 (= e!839948 false)))

(declare-fun lt!653244 () Bool)

(declare-datatypes ((List!34734 0))(
  ( (Nil!34731) (Cons!34730 (h!36142 (_ BitVec 64)) (t!49420 List!34734)) )
))
(declare-fun arrayNoDuplicates!0 (array!99998 (_ BitVec 32) List!34734) Bool)

(assert (=> b!1499782 (= lt!653244 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34731))))

(declare-fun res!1019762 () Bool)

(assert (=> start!127772 (=> (not res!1019762) (not e!839948))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127772 (= res!1019762 (validMask!0 mask!2661))))

(assert (=> start!127772 e!839948))

(assert (=> start!127772 true))

(declare-fun array_inv!37536 (array!99998) Bool)

(assert (=> start!127772 (array_inv!37536 a!2850)))

(declare-fun b!1499783 () Bool)

(declare-fun res!1019761 () Bool)

(assert (=> b!1499783 (=> (not res!1019761) (not e!839948))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499783 (= res!1019761 (and (= (size!48806 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48806 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48806 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499784 () Bool)

(declare-fun res!1019759 () Bool)

(assert (=> b!1499784 (=> (not res!1019759) (not e!839948))))

(assert (=> b!1499784 (= res!1019759 (validKeyInArray!0 (select (arr!48255 a!2850) i!996)))))

(declare-fun b!1499785 () Bool)

(declare-fun res!1019760 () Bool)

(assert (=> b!1499785 (=> (not res!1019760) (not e!839948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99998 (_ BitVec 32)) Bool)

(assert (=> b!1499785 (= res!1019760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127772 res!1019762) b!1499783))

(assert (= (and b!1499783 res!1019761) b!1499784))

(assert (= (and b!1499784 res!1019759) b!1499781))

(assert (= (and b!1499781 res!1019758) b!1499785))

(assert (= (and b!1499785 res!1019760) b!1499782))

(declare-fun m!1382863 () Bool)

(assert (=> b!1499785 m!1382863))

(declare-fun m!1382865 () Bool)

(assert (=> start!127772 m!1382865))

(declare-fun m!1382867 () Bool)

(assert (=> start!127772 m!1382867))

(declare-fun m!1382869 () Bool)

(assert (=> b!1499782 m!1382869))

(declare-fun m!1382871 () Bool)

(assert (=> b!1499781 m!1382871))

(assert (=> b!1499781 m!1382871))

(declare-fun m!1382873 () Bool)

(assert (=> b!1499781 m!1382873))

(declare-fun m!1382875 () Bool)

(assert (=> b!1499784 m!1382875))

(assert (=> b!1499784 m!1382875))

(declare-fun m!1382877 () Bool)

(assert (=> b!1499784 m!1382877))

(push 1)

(assert (not b!1499781))

(assert (not b!1499785))

(assert (not start!127772))

(assert (not b!1499784))

(assert (not b!1499782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

