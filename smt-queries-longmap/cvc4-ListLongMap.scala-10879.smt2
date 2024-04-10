; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127540 () Bool)

(assert start!127540)

(declare-fun b!1498373 () Bool)

(declare-fun res!1019450 () Bool)

(declare-fun e!838999 () Bool)

(assert (=> b!1498373 (=> (not res!1019450) (not e!838999))))

(declare-datatypes ((array!99921 0))(
  ( (array!99922 (arr!48220 (Array (_ BitVec 32) (_ BitVec 64))) (size!48770 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99921)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498373 (= res!1019450 (validKeyInArray!0 (select (arr!48220 a!2850) i!996)))))

(declare-fun b!1498374 () Bool)

(declare-fun res!1019451 () Bool)

(assert (=> b!1498374 (=> (not res!1019451) (not e!838999))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498374 (= res!1019451 (validKeyInArray!0 (select (arr!48220 a!2850) j!87)))))

(declare-fun b!1498375 () Bool)

(declare-fun res!1019449 () Bool)

(assert (=> b!1498375 (=> (not res!1019449) (not e!838999))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1498375 (= res!1019449 (and (= (size!48770 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48770 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48770 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498376 () Bool)

(declare-fun res!1019452 () Bool)

(assert (=> b!1498376 (=> (not res!1019452) (not e!838999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99921 (_ BitVec 32)) Bool)

(assert (=> b!1498376 (= res!1019452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019448 () Bool)

(assert (=> start!127540 (=> (not res!1019448) (not e!838999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127540 (= res!1019448 (validMask!0 mask!2661))))

(assert (=> start!127540 e!838999))

(assert (=> start!127540 true))

(declare-fun array_inv!37248 (array!99921) Bool)

(assert (=> start!127540 (array_inv!37248 a!2850)))

(declare-fun b!1498372 () Bool)

(assert (=> b!1498372 (= e!838999 false)))

(declare-fun lt!652633 () Bool)

(declare-datatypes ((List!34712 0))(
  ( (Nil!34709) (Cons!34708 (h!36105 (_ BitVec 64)) (t!49406 List!34712)) )
))
(declare-fun arrayNoDuplicates!0 (array!99921 (_ BitVec 32) List!34712) Bool)

(assert (=> b!1498372 (= lt!652633 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34709))))

(assert (= (and start!127540 res!1019448) b!1498375))

(assert (= (and b!1498375 res!1019449) b!1498373))

(assert (= (and b!1498373 res!1019450) b!1498374))

(assert (= (and b!1498374 res!1019451) b!1498376))

(assert (= (and b!1498376 res!1019452) b!1498372))

(declare-fun m!1381479 () Bool)

(assert (=> b!1498372 m!1381479))

(declare-fun m!1381481 () Bool)

(assert (=> b!1498376 m!1381481))

(declare-fun m!1381483 () Bool)

(assert (=> start!127540 m!1381483))

(declare-fun m!1381485 () Bool)

(assert (=> start!127540 m!1381485))

(declare-fun m!1381487 () Bool)

(assert (=> b!1498373 m!1381487))

(assert (=> b!1498373 m!1381487))

(declare-fun m!1381489 () Bool)

(assert (=> b!1498373 m!1381489))

(declare-fun m!1381491 () Bool)

(assert (=> b!1498374 m!1381491))

(assert (=> b!1498374 m!1381491))

(declare-fun m!1381493 () Bool)

(assert (=> b!1498374 m!1381493))

(push 1)

(assert (not b!1498372))

(assert (not start!127540))

(assert (not b!1498373))

(assert (not b!1498374))

(assert (not b!1498376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

