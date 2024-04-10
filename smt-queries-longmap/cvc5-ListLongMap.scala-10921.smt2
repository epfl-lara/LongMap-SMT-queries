; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127788 () Bool)

(assert start!127788)

(declare-fun b!1501807 () Bool)

(declare-fun res!1022887 () Bool)

(declare-fun e!840066 () Bool)

(assert (=> b!1501807 (=> (not res!1022887) (not e!840066))))

(declare-datatypes ((array!100169 0))(
  ( (array!100170 (arr!48344 (Array (_ BitVec 32) (_ BitVec 64))) (size!48894 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100169)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501807 (= res!1022887 (validKeyInArray!0 (select (arr!48344 a!2850) i!996)))))

(declare-fun b!1501808 () Bool)

(declare-fun res!1022884 () Bool)

(assert (=> b!1501808 (=> (not res!1022884) (not e!840066))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501808 (= res!1022884 (validKeyInArray!0 (select (arr!48344 a!2850) j!87)))))

(declare-fun res!1022886 () Bool)

(assert (=> start!127788 (=> (not res!1022886) (not e!840066))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127788 (= res!1022886 (validMask!0 mask!2661))))

(assert (=> start!127788 e!840066))

(assert (=> start!127788 true))

(declare-fun array_inv!37372 (array!100169) Bool)

(assert (=> start!127788 (array_inv!37372 a!2850)))

(declare-fun b!1501809 () Bool)

(declare-fun res!1022885 () Bool)

(assert (=> b!1501809 (=> (not res!1022885) (not e!840066))))

(assert (=> b!1501809 (= res!1022885 (and (= (size!48894 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48894 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48894 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501810 () Bool)

(assert (=> b!1501810 (= e!840066 false)))

(declare-fun lt!653266 () Bool)

(declare-datatypes ((List!34836 0))(
  ( (Nil!34833) (Cons!34832 (h!36229 (_ BitVec 64)) (t!49530 List!34836)) )
))
(declare-fun arrayNoDuplicates!0 (array!100169 (_ BitVec 32) List!34836) Bool)

(assert (=> b!1501810 (= lt!653266 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34833))))

(declare-fun b!1501811 () Bool)

(declare-fun res!1022883 () Bool)

(assert (=> b!1501811 (=> (not res!1022883) (not e!840066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100169 (_ BitVec 32)) Bool)

(assert (=> b!1501811 (= res!1022883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127788 res!1022886) b!1501809))

(assert (= (and b!1501809 res!1022885) b!1501807))

(assert (= (and b!1501807 res!1022887) b!1501808))

(assert (= (and b!1501808 res!1022884) b!1501811))

(assert (= (and b!1501811 res!1022883) b!1501810))

(declare-fun m!1385083 () Bool)

(assert (=> b!1501808 m!1385083))

(assert (=> b!1501808 m!1385083))

(declare-fun m!1385085 () Bool)

(assert (=> b!1501808 m!1385085))

(declare-fun m!1385087 () Bool)

(assert (=> b!1501807 m!1385087))

(assert (=> b!1501807 m!1385087))

(declare-fun m!1385089 () Bool)

(assert (=> b!1501807 m!1385089))

(declare-fun m!1385091 () Bool)

(assert (=> b!1501811 m!1385091))

(declare-fun m!1385093 () Bool)

(assert (=> start!127788 m!1385093))

(declare-fun m!1385095 () Bool)

(assert (=> start!127788 m!1385095))

(declare-fun m!1385097 () Bool)

(assert (=> b!1501810 m!1385097))

(push 1)

(assert (not start!127788))

(assert (not b!1501808))

(assert (not b!1501810))

(assert (not b!1501811))

(assert (not b!1501807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

