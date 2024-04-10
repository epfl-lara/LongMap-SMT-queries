; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127800 () Bool)

(assert start!127800)

(declare-fun b!1501897 () Bool)

(declare-fun res!1022973 () Bool)

(declare-fun e!840102 () Bool)

(assert (=> b!1501897 (=> (not res!1022973) (not e!840102))))

(declare-datatypes ((array!100181 0))(
  ( (array!100182 (arr!48350 (Array (_ BitVec 32) (_ BitVec 64))) (size!48900 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100181)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501897 (= res!1022973 (validKeyInArray!0 (select (arr!48350 a!2850) j!87)))))

(declare-fun b!1501898 () Bool)

(declare-fun res!1022977 () Bool)

(assert (=> b!1501898 (=> (not res!1022977) (not e!840102))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501898 (= res!1022977 (and (= (size!48900 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48900 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48900 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1022974 () Bool)

(assert (=> start!127800 (=> (not res!1022974) (not e!840102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127800 (= res!1022974 (validMask!0 mask!2661))))

(assert (=> start!127800 e!840102))

(assert (=> start!127800 true))

(declare-fun array_inv!37378 (array!100181) Bool)

(assert (=> start!127800 (array_inv!37378 a!2850)))

(declare-fun b!1501899 () Bool)

(declare-fun res!1022976 () Bool)

(assert (=> b!1501899 (=> (not res!1022976) (not e!840102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100181 (_ BitVec 32)) Bool)

(assert (=> b!1501899 (= res!1022976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501900 () Bool)

(assert (=> b!1501900 (= e!840102 false)))

(declare-fun lt!653284 () Bool)

(declare-datatypes ((List!34842 0))(
  ( (Nil!34839) (Cons!34838 (h!36235 (_ BitVec 64)) (t!49536 List!34842)) )
))
(declare-fun arrayNoDuplicates!0 (array!100181 (_ BitVec 32) List!34842) Bool)

(assert (=> b!1501900 (= lt!653284 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34839))))

(declare-fun b!1501901 () Bool)

(declare-fun res!1022975 () Bool)

(assert (=> b!1501901 (=> (not res!1022975) (not e!840102))))

(assert (=> b!1501901 (= res!1022975 (validKeyInArray!0 (select (arr!48350 a!2850) i!996)))))

(assert (= (and start!127800 res!1022974) b!1501898))

(assert (= (and b!1501898 res!1022977) b!1501901))

(assert (= (and b!1501901 res!1022975) b!1501897))

(assert (= (and b!1501897 res!1022973) b!1501899))

(assert (= (and b!1501899 res!1022976) b!1501900))

(declare-fun m!1385179 () Bool)

(assert (=> start!127800 m!1385179))

(declare-fun m!1385181 () Bool)

(assert (=> start!127800 m!1385181))

(declare-fun m!1385183 () Bool)

(assert (=> b!1501899 m!1385183))

(declare-fun m!1385185 () Bool)

(assert (=> b!1501901 m!1385185))

(assert (=> b!1501901 m!1385185))

(declare-fun m!1385187 () Bool)

(assert (=> b!1501901 m!1385187))

(declare-fun m!1385189 () Bool)

(assert (=> b!1501897 m!1385189))

(assert (=> b!1501897 m!1385189))

(declare-fun m!1385191 () Bool)

(assert (=> b!1501897 m!1385191))

(declare-fun m!1385193 () Bool)

(assert (=> b!1501900 m!1385193))

(push 1)

(assert (not b!1501899))

(assert (not b!1501900))

(assert (not b!1501901))

(assert (not b!1501897))

(assert (not start!127800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

