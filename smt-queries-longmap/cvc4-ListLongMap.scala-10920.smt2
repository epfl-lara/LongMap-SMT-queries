; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127786 () Bool)

(assert start!127786)

(declare-fun b!1501792 () Bool)

(declare-fun e!840060 () Bool)

(assert (=> b!1501792 (= e!840060 false)))

(declare-fun lt!653263 () Bool)

(declare-datatypes ((array!100167 0))(
  ( (array!100168 (arr!48343 (Array (_ BitVec 32) (_ BitVec 64))) (size!48893 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100167)

(declare-datatypes ((List!34835 0))(
  ( (Nil!34832) (Cons!34831 (h!36228 (_ BitVec 64)) (t!49529 List!34835)) )
))
(declare-fun arrayNoDuplicates!0 (array!100167 (_ BitVec 32) List!34835) Bool)

(assert (=> b!1501792 (= lt!653263 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34832))))

(declare-fun b!1501793 () Bool)

(declare-fun res!1022871 () Bool)

(assert (=> b!1501793 (=> (not res!1022871) (not e!840060))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501793 (= res!1022871 (validKeyInArray!0 (select (arr!48343 a!2850) i!996)))))

(declare-fun b!1501794 () Bool)

(declare-fun res!1022872 () Bool)

(assert (=> b!1501794 (=> (not res!1022872) (not e!840060))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100167 (_ BitVec 32)) Bool)

(assert (=> b!1501794 (= res!1022872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501795 () Bool)

(declare-fun res!1022870 () Bool)

(assert (=> b!1501795 (=> (not res!1022870) (not e!840060))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501795 (= res!1022870 (validKeyInArray!0 (select (arr!48343 a!2850) j!87)))))

(declare-fun b!1501796 () Bool)

(declare-fun res!1022868 () Bool)

(assert (=> b!1501796 (=> (not res!1022868) (not e!840060))))

(assert (=> b!1501796 (= res!1022868 (and (= (size!48893 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48893 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48893 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022869 () Bool)

(assert (=> start!127786 (=> (not res!1022869) (not e!840060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127786 (= res!1022869 (validMask!0 mask!2661))))

(assert (=> start!127786 e!840060))

(assert (=> start!127786 true))

(declare-fun array_inv!37371 (array!100167) Bool)

(assert (=> start!127786 (array_inv!37371 a!2850)))

(assert (= (and start!127786 res!1022869) b!1501796))

(assert (= (and b!1501796 res!1022868) b!1501793))

(assert (= (and b!1501793 res!1022871) b!1501795))

(assert (= (and b!1501795 res!1022870) b!1501794))

(assert (= (and b!1501794 res!1022872) b!1501792))

(declare-fun m!1385067 () Bool)

(assert (=> b!1501794 m!1385067))

(declare-fun m!1385069 () Bool)

(assert (=> b!1501793 m!1385069))

(assert (=> b!1501793 m!1385069))

(declare-fun m!1385071 () Bool)

(assert (=> b!1501793 m!1385071))

(declare-fun m!1385073 () Bool)

(assert (=> b!1501795 m!1385073))

(assert (=> b!1501795 m!1385073))

(declare-fun m!1385075 () Bool)

(assert (=> b!1501795 m!1385075))

(declare-fun m!1385077 () Bool)

(assert (=> start!127786 m!1385077))

(declare-fun m!1385079 () Bool)

(assert (=> start!127786 m!1385079))

(declare-fun m!1385081 () Bool)

(assert (=> b!1501792 m!1385081))

(push 1)

(assert (not b!1501792))

(assert (not b!1501794))

(assert (not b!1501795))

(assert (not start!127786))

(assert (not b!1501793))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

