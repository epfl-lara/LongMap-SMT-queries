; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127796 () Bool)

(assert start!127796)

(declare-fun b!1501867 () Bool)

(declare-fun res!1022947 () Bool)

(declare-fun e!840090 () Bool)

(assert (=> b!1501867 (=> (not res!1022947) (not e!840090))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100177 0))(
  ( (array!100178 (arr!48348 (Array (_ BitVec 32) (_ BitVec 64))) (size!48898 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100177)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501867 (= res!1022947 (and (= (size!48898 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48898 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48898 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501868 () Bool)

(declare-fun res!1022944 () Bool)

(assert (=> b!1501868 (=> (not res!1022944) (not e!840090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100177 (_ BitVec 32)) Bool)

(assert (=> b!1501868 (= res!1022944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1022946 () Bool)

(assert (=> start!127796 (=> (not res!1022946) (not e!840090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127796 (= res!1022946 (validMask!0 mask!2661))))

(assert (=> start!127796 e!840090))

(assert (=> start!127796 true))

(declare-fun array_inv!37376 (array!100177) Bool)

(assert (=> start!127796 (array_inv!37376 a!2850)))

(declare-fun b!1501869 () Bool)

(declare-fun res!1022943 () Bool)

(assert (=> b!1501869 (=> (not res!1022943) (not e!840090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501869 (= res!1022943 (validKeyInArray!0 (select (arr!48348 a!2850) j!87)))))

(declare-fun b!1501870 () Bool)

(assert (=> b!1501870 (= e!840090 false)))

(declare-fun lt!653278 () Bool)

(declare-datatypes ((List!34840 0))(
  ( (Nil!34837) (Cons!34836 (h!36233 (_ BitVec 64)) (t!49534 List!34840)) )
))
(declare-fun arrayNoDuplicates!0 (array!100177 (_ BitVec 32) List!34840) Bool)

(assert (=> b!1501870 (= lt!653278 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34837))))

(declare-fun b!1501871 () Bool)

(declare-fun res!1022945 () Bool)

(assert (=> b!1501871 (=> (not res!1022945) (not e!840090))))

(assert (=> b!1501871 (= res!1022945 (validKeyInArray!0 (select (arr!48348 a!2850) i!996)))))

(assert (= (and start!127796 res!1022946) b!1501867))

(assert (= (and b!1501867 res!1022947) b!1501871))

(assert (= (and b!1501871 res!1022945) b!1501869))

(assert (= (and b!1501869 res!1022943) b!1501868))

(assert (= (and b!1501868 res!1022944) b!1501870))

(declare-fun m!1385147 () Bool)

(assert (=> b!1501869 m!1385147))

(assert (=> b!1501869 m!1385147))

(declare-fun m!1385149 () Bool)

(assert (=> b!1501869 m!1385149))

(declare-fun m!1385151 () Bool)

(assert (=> b!1501868 m!1385151))

(declare-fun m!1385153 () Bool)

(assert (=> b!1501870 m!1385153))

(declare-fun m!1385155 () Bool)

(assert (=> start!127796 m!1385155))

(declare-fun m!1385157 () Bool)

(assert (=> start!127796 m!1385157))

(declare-fun m!1385159 () Bool)

(assert (=> b!1501871 m!1385159))

(assert (=> b!1501871 m!1385159))

(declare-fun m!1385161 () Bool)

(assert (=> b!1501871 m!1385161))

(check-sat (not b!1501869) (not b!1501870) (not b!1501871) (not b!1501868) (not start!127796))
