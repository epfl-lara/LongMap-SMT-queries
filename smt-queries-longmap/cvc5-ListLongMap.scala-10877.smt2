; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127524 () Bool)

(assert start!127524)

(declare-fun b!1498243 () Bool)

(declare-fun e!838951 () Bool)

(assert (=> b!1498243 (= e!838951 false)))

(declare-fun lt!652618 () Bool)

(declare-datatypes ((array!99905 0))(
  ( (array!99906 (arr!48212 (Array (_ BitVec 32) (_ BitVec 64))) (size!48762 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99905)

(declare-datatypes ((List!34704 0))(
  ( (Nil!34701) (Cons!34700 (h!36097 (_ BitVec 64)) (t!49398 List!34704)) )
))
(declare-fun arrayNoDuplicates!0 (array!99905 (_ BitVec 32) List!34704) Bool)

(assert (=> b!1498243 (= lt!652618 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34701))))

(declare-fun b!1498244 () Bool)

(declare-fun res!1019319 () Bool)

(assert (=> b!1498244 (=> (not res!1019319) (not e!838951))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99905 (_ BitVec 32)) Bool)

(assert (=> b!1498244 (= res!1019319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498245 () Bool)

(declare-fun res!1019322 () Bool)

(assert (=> b!1498245 (=> (not res!1019322) (not e!838951))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498245 (= res!1019322 (and (= (size!48762 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48762 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48762 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498246 () Bool)

(declare-fun res!1019320 () Bool)

(assert (=> b!1498246 (=> (not res!1019320) (not e!838951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498246 (= res!1019320 (validKeyInArray!0 (select (arr!48212 a!2850) j!87)))))

(declare-fun res!1019321 () Bool)

(assert (=> start!127524 (=> (not res!1019321) (not e!838951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127524 (= res!1019321 (validMask!0 mask!2661))))

(assert (=> start!127524 e!838951))

(assert (=> start!127524 true))

(declare-fun array_inv!37240 (array!99905) Bool)

(assert (=> start!127524 (array_inv!37240 a!2850)))

(declare-fun b!1498247 () Bool)

(declare-fun res!1019323 () Bool)

(assert (=> b!1498247 (=> (not res!1019323) (not e!838951))))

(assert (=> b!1498247 (= res!1019323 (validKeyInArray!0 (select (arr!48212 a!2850) i!996)))))

(assert (= (and start!127524 res!1019321) b!1498245))

(assert (= (and b!1498245 res!1019322) b!1498247))

(assert (= (and b!1498247 res!1019323) b!1498246))

(assert (= (and b!1498246 res!1019320) b!1498244))

(assert (= (and b!1498244 res!1019319) b!1498243))

(declare-fun m!1381333 () Bool)

(assert (=> b!1498244 m!1381333))

(declare-fun m!1381335 () Bool)

(assert (=> b!1498247 m!1381335))

(assert (=> b!1498247 m!1381335))

(declare-fun m!1381337 () Bool)

(assert (=> b!1498247 m!1381337))

(declare-fun m!1381339 () Bool)

(assert (=> b!1498246 m!1381339))

(assert (=> b!1498246 m!1381339))

(declare-fun m!1381341 () Bool)

(assert (=> b!1498246 m!1381341))

(declare-fun m!1381343 () Bool)

(assert (=> start!127524 m!1381343))

(declare-fun m!1381345 () Bool)

(assert (=> start!127524 m!1381345))

(declare-fun m!1381347 () Bool)

(assert (=> b!1498243 m!1381347))

(push 1)

(assert (not start!127524))

(assert (not b!1498244))

(assert (not b!1498243))

(assert (not b!1498246))

(assert (not b!1498247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

