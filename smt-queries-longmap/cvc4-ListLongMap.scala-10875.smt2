; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127516 () Bool)

(assert start!127516)

(declare-fun b!1498174 () Bool)

(declare-fun res!1019251 () Bool)

(declare-fun e!838927 () Bool)

(assert (=> b!1498174 (=> (not res!1019251) (not e!838927))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!99897 0))(
  ( (array!99898 (arr!48208 (Array (_ BitVec 32) (_ BitVec 64))) (size!48758 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99897)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498174 (= res!1019251 (and (= (size!48758 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48758 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48758 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498175 () Bool)

(assert (=> b!1498175 (= e!838927 false)))

(declare-fun lt!652615 () Bool)

(declare-datatypes ((List!34700 0))(
  ( (Nil!34697) (Cons!34696 (h!36093 (_ BitVec 64)) (t!49394 List!34700)) )
))
(declare-fun arrayNoDuplicates!0 (array!99897 (_ BitVec 32) List!34700) Bool)

(assert (=> b!1498175 (= lt!652615 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34697))))

(declare-fun b!1498177 () Bool)

(declare-fun res!1019254 () Bool)

(assert (=> b!1498177 (=> (not res!1019254) (not e!838927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498177 (= res!1019254 (validKeyInArray!0 (select (arr!48208 a!2850) i!996)))))

(declare-fun b!1498178 () Bool)

(declare-fun res!1019252 () Bool)

(assert (=> b!1498178 (=> (not res!1019252) (not e!838927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99897 (_ BitVec 32)) Bool)

(assert (=> b!1498178 (= res!1019252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019253 () Bool)

(assert (=> start!127516 (=> (not res!1019253) (not e!838927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127516 (= res!1019253 (validMask!0 mask!2661))))

(assert (=> start!127516 e!838927))

(assert (=> start!127516 true))

(declare-fun array_inv!37236 (array!99897) Bool)

(assert (=> start!127516 (array_inv!37236 a!2850)))

(declare-fun b!1498176 () Bool)

(declare-fun res!1019250 () Bool)

(assert (=> b!1498176 (=> (not res!1019250) (not e!838927))))

(assert (=> b!1498176 (= res!1019250 (validKeyInArray!0 (select (arr!48208 a!2850) j!87)))))

(assert (= (and start!127516 res!1019253) b!1498174))

(assert (= (and b!1498174 res!1019251) b!1498177))

(assert (= (and b!1498177 res!1019254) b!1498176))

(assert (= (and b!1498176 res!1019250) b!1498178))

(assert (= (and b!1498178 res!1019252) b!1498175))

(declare-fun m!1381251 () Bool)

(assert (=> b!1498175 m!1381251))

(declare-fun m!1381253 () Bool)

(assert (=> b!1498176 m!1381253))

(assert (=> b!1498176 m!1381253))

(declare-fun m!1381255 () Bool)

(assert (=> b!1498176 m!1381255))

(declare-fun m!1381257 () Bool)

(assert (=> start!127516 m!1381257))

(declare-fun m!1381259 () Bool)

(assert (=> start!127516 m!1381259))

(declare-fun m!1381261 () Bool)

(assert (=> b!1498177 m!1381261))

(assert (=> b!1498177 m!1381261))

(declare-fun m!1381263 () Bool)

(assert (=> b!1498177 m!1381263))

(declare-fun m!1381265 () Bool)

(assert (=> b!1498178 m!1381265))

(push 1)

(assert (not b!1498176))

(assert (not start!127516))

(assert (not b!1498177))

(assert (not b!1498175))

(assert (not b!1498178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

