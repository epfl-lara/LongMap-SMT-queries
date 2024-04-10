; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127792 () Bool)

(assert start!127792)

(declare-fun b!1501837 () Bool)

(declare-fun res!1022916 () Bool)

(declare-fun e!840079 () Bool)

(assert (=> b!1501837 (=> (not res!1022916) (not e!840079))))

(declare-datatypes ((array!100173 0))(
  ( (array!100174 (arr!48346 (Array (_ BitVec 32) (_ BitVec 64))) (size!48896 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100173)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501837 (= res!1022916 (validKeyInArray!0 (select (arr!48346 a!2850) j!87)))))

(declare-fun b!1501838 () Bool)

(declare-fun res!1022914 () Bool)

(assert (=> b!1501838 (=> (not res!1022914) (not e!840079))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100173 (_ BitVec 32)) Bool)

(assert (=> b!1501838 (= res!1022914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1022917 () Bool)

(assert (=> start!127792 (=> (not res!1022917) (not e!840079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127792 (= res!1022917 (validMask!0 mask!2661))))

(assert (=> start!127792 e!840079))

(assert (=> start!127792 true))

(declare-fun array_inv!37374 (array!100173) Bool)

(assert (=> start!127792 (array_inv!37374 a!2850)))

(declare-fun b!1501839 () Bool)

(assert (=> b!1501839 (= e!840079 false)))

(declare-fun lt!653272 () Bool)

(declare-datatypes ((List!34838 0))(
  ( (Nil!34835) (Cons!34834 (h!36231 (_ BitVec 64)) (t!49532 List!34838)) )
))
(declare-fun arrayNoDuplicates!0 (array!100173 (_ BitVec 32) List!34838) Bool)

(assert (=> b!1501839 (= lt!653272 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34835))))

(declare-fun b!1501840 () Bool)

(declare-fun res!1022915 () Bool)

(assert (=> b!1501840 (=> (not res!1022915) (not e!840079))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501840 (= res!1022915 (and (= (size!48896 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48896 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48896 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501841 () Bool)

(declare-fun res!1022913 () Bool)

(assert (=> b!1501841 (=> (not res!1022913) (not e!840079))))

(assert (=> b!1501841 (= res!1022913 (validKeyInArray!0 (select (arr!48346 a!2850) i!996)))))

(assert (= (and start!127792 res!1022917) b!1501840))

(assert (= (and b!1501840 res!1022915) b!1501841))

(assert (= (and b!1501841 res!1022913) b!1501837))

(assert (= (and b!1501837 res!1022916) b!1501838))

(assert (= (and b!1501838 res!1022914) b!1501839))

(declare-fun m!1385115 () Bool)

(assert (=> b!1501841 m!1385115))

(assert (=> b!1501841 m!1385115))

(declare-fun m!1385117 () Bool)

(assert (=> b!1501841 m!1385117))

(declare-fun m!1385119 () Bool)

(assert (=> b!1501839 m!1385119))

(declare-fun m!1385121 () Bool)

(assert (=> start!127792 m!1385121))

(declare-fun m!1385123 () Bool)

(assert (=> start!127792 m!1385123))

(declare-fun m!1385125 () Bool)

(assert (=> b!1501837 m!1385125))

(assert (=> b!1501837 m!1385125))

(declare-fun m!1385127 () Bool)

(assert (=> b!1501837 m!1385127))

(declare-fun m!1385129 () Bool)

(assert (=> b!1501838 m!1385129))

(push 1)

(assert (not b!1501837))

(assert (not b!1501839))

(assert (not b!1501841))

(assert (not b!1501838))

(assert (not start!127792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

