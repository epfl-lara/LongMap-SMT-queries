; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127808 () Bool)

(assert start!127808)

(declare-fun res!1020057 () Bool)

(declare-fun e!840056 () Bool)

(assert (=> start!127808 (=> (not res!1020057) (not e!840056))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127808 (= res!1020057 (validMask!0 mask!2661))))

(assert (=> start!127808 e!840056))

(assert (=> start!127808 true))

(declare-datatypes ((array!100034 0))(
  ( (array!100035 (arr!48273 (Array (_ BitVec 32) (_ BitVec 64))) (size!48824 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100034)

(declare-fun array_inv!37554 (array!100034) Bool)

(assert (=> start!127808 (array_inv!37554 a!2850)))

(declare-fun b!1500078 () Bool)

(declare-fun res!1020058 () Bool)

(assert (=> b!1500078 (=> (not res!1020058) (not e!840056))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500078 (= res!1020058 (validKeyInArray!0 (select (arr!48273 a!2850) j!87)))))

(declare-fun b!1500079 () Bool)

(declare-fun res!1020059 () Bool)

(assert (=> b!1500079 (=> (not res!1020059) (not e!840056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100034 (_ BitVec 32)) Bool)

(assert (=> b!1500079 (= res!1020059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500080 () Bool)

(declare-fun res!1020056 () Bool)

(assert (=> b!1500080 (=> (not res!1020056) (not e!840056))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500080 (= res!1020056 (and (= (size!48824 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48824 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48824 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500081 () Bool)

(declare-fun res!1020055 () Bool)

(assert (=> b!1500081 (=> (not res!1020055) (not e!840056))))

(assert (=> b!1500081 (= res!1020055 (validKeyInArray!0 (select (arr!48273 a!2850) i!996)))))

(declare-fun b!1500082 () Bool)

(assert (=> b!1500082 (= e!840056 false)))

(declare-fun lt!653271 () Bool)

(declare-datatypes ((List!34752 0))(
  ( (Nil!34749) (Cons!34748 (h!36160 (_ BitVec 64)) (t!49438 List!34752)) )
))
(declare-fun arrayNoDuplicates!0 (array!100034 (_ BitVec 32) List!34752) Bool)

(assert (=> b!1500082 (= lt!653271 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34749))))

(assert (= (and start!127808 res!1020057) b!1500080))

(assert (= (and b!1500080 res!1020056) b!1500081))

(assert (= (and b!1500081 res!1020055) b!1500078))

(assert (= (and b!1500078 res!1020058) b!1500079))

(assert (= (and b!1500079 res!1020059) b!1500082))

(declare-fun m!1383205 () Bool)

(assert (=> b!1500079 m!1383205))

(declare-fun m!1383207 () Bool)

(assert (=> b!1500078 m!1383207))

(assert (=> b!1500078 m!1383207))

(declare-fun m!1383209 () Bool)

(assert (=> b!1500078 m!1383209))

(declare-fun m!1383211 () Bool)

(assert (=> b!1500081 m!1383211))

(assert (=> b!1500081 m!1383211))

(declare-fun m!1383213 () Bool)

(assert (=> b!1500081 m!1383213))

(declare-fun m!1383215 () Bool)

(assert (=> b!1500082 m!1383215))

(declare-fun m!1383217 () Bool)

(assert (=> start!127808 m!1383217))

(declare-fun m!1383219 () Bool)

(assert (=> start!127808 m!1383219))

(push 1)

(assert (not b!1500081))

(assert (not start!127808))

(assert (not b!1500082))

(assert (not b!1500079))

(assert (not b!1500078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

