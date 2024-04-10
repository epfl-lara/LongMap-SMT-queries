; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127794 () Bool)

(assert start!127794)

(declare-fun b!1501852 () Bool)

(declare-fun e!840085 () Bool)

(assert (=> b!1501852 (= e!840085 false)))

(declare-fun lt!653275 () Bool)

(declare-datatypes ((array!100175 0))(
  ( (array!100176 (arr!48347 (Array (_ BitVec 32) (_ BitVec 64))) (size!48897 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100175)

(declare-datatypes ((List!34839 0))(
  ( (Nil!34836) (Cons!34835 (h!36232 (_ BitVec 64)) (t!49533 List!34839)) )
))
(declare-fun arrayNoDuplicates!0 (array!100175 (_ BitVec 32) List!34839) Bool)

(assert (=> b!1501852 (= lt!653275 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34836))))

(declare-fun b!1501853 () Bool)

(declare-fun res!1022928 () Bool)

(assert (=> b!1501853 (=> (not res!1022928) (not e!840085))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501853 (= res!1022928 (validKeyInArray!0 (select (arr!48347 a!2850) j!87)))))

(declare-fun b!1501854 () Bool)

(declare-fun res!1022931 () Bool)

(assert (=> b!1501854 (=> (not res!1022931) (not e!840085))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501854 (= res!1022931 (validKeyInArray!0 (select (arr!48347 a!2850) i!996)))))

(declare-fun b!1501855 () Bool)

(declare-fun res!1022930 () Bool)

(assert (=> b!1501855 (=> (not res!1022930) (not e!840085))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1501855 (= res!1022930 (and (= (size!48897 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48897 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48897 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022929 () Bool)

(assert (=> start!127794 (=> (not res!1022929) (not e!840085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127794 (= res!1022929 (validMask!0 mask!2661))))

(assert (=> start!127794 e!840085))

(assert (=> start!127794 true))

(declare-fun array_inv!37375 (array!100175) Bool)

(assert (=> start!127794 (array_inv!37375 a!2850)))

(declare-fun b!1501856 () Bool)

(declare-fun res!1022932 () Bool)

(assert (=> b!1501856 (=> (not res!1022932) (not e!840085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100175 (_ BitVec 32)) Bool)

(assert (=> b!1501856 (= res!1022932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127794 res!1022929) b!1501855))

(assert (= (and b!1501855 res!1022930) b!1501854))

(assert (= (and b!1501854 res!1022931) b!1501853))

(assert (= (and b!1501853 res!1022928) b!1501856))

(assert (= (and b!1501856 res!1022932) b!1501852))

(declare-fun m!1385131 () Bool)

(assert (=> b!1501854 m!1385131))

(assert (=> b!1501854 m!1385131))

(declare-fun m!1385133 () Bool)

(assert (=> b!1501854 m!1385133))

(declare-fun m!1385135 () Bool)

(assert (=> b!1501853 m!1385135))

(assert (=> b!1501853 m!1385135))

(declare-fun m!1385137 () Bool)

(assert (=> b!1501853 m!1385137))

(declare-fun m!1385139 () Bool)

(assert (=> b!1501852 m!1385139))

(declare-fun m!1385141 () Bool)

(assert (=> start!127794 m!1385141))

(declare-fun m!1385143 () Bool)

(assert (=> start!127794 m!1385143))

(declare-fun m!1385145 () Bool)

(assert (=> b!1501856 m!1385145))

(push 1)

(assert (not b!1501856))

(assert (not b!1501853))

(assert (not b!1501854))

(assert (not b!1501852))

(assert (not start!127794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

