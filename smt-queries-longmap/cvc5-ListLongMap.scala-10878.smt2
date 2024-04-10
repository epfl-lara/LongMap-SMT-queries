; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127530 () Bool)

(assert start!127530)

(declare-fun res!1019369 () Bool)

(declare-fun e!838968 () Bool)

(assert (=> start!127530 (=> (not res!1019369) (not e!838968))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127530 (= res!1019369 (validMask!0 mask!2661))))

(assert (=> start!127530 e!838968))

(assert (=> start!127530 true))

(declare-datatypes ((array!99911 0))(
  ( (array!99912 (arr!48215 (Array (_ BitVec 32) (_ BitVec 64))) (size!48765 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99911)

(declare-fun array_inv!37243 (array!99911) Bool)

(assert (=> start!127530 (array_inv!37243 a!2850)))

(declare-fun b!1498290 () Bool)

(declare-fun res!1019368 () Bool)

(assert (=> b!1498290 (=> (not res!1019368) (not e!838968))))

(declare-datatypes ((List!34707 0))(
  ( (Nil!34704) (Cons!34703 (h!36100 (_ BitVec 64)) (t!49401 List!34707)) )
))
(declare-fun arrayNoDuplicates!0 (array!99911 (_ BitVec 32) List!34707) Bool)

(assert (=> b!1498290 (= res!1019368 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34704))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun b!1498291 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498291 (= e!838968 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48765 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48765 a!2850)) (= (select (arr!48215 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48215 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48765 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantBefore!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498292 () Bool)

(declare-fun res!1019370 () Bool)

(assert (=> b!1498292 (=> (not res!1019370) (not e!838968))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498292 (= res!1019370 (validKeyInArray!0 (select (arr!48215 a!2850) j!87)))))

(declare-fun b!1498293 () Bool)

(declare-fun res!1019371 () Bool)

(assert (=> b!1498293 (=> (not res!1019371) (not e!838968))))

(assert (=> b!1498293 (= res!1019371 (and (= (size!48765 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48765 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48765 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498294 () Bool)

(declare-fun res!1019366 () Bool)

(assert (=> b!1498294 (=> (not res!1019366) (not e!838968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99911 (_ BitVec 32)) Bool)

(assert (=> b!1498294 (= res!1019366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498295 () Bool)

(declare-fun res!1019367 () Bool)

(assert (=> b!1498295 (=> (not res!1019367) (not e!838968))))

(assert (=> b!1498295 (= res!1019367 (validKeyInArray!0 (select (arr!48215 a!2850) i!996)))))

(assert (= (and start!127530 res!1019369) b!1498293))

(assert (= (and b!1498293 res!1019371) b!1498295))

(assert (= (and b!1498295 res!1019367) b!1498292))

(assert (= (and b!1498292 res!1019370) b!1498294))

(assert (= (and b!1498294 res!1019366) b!1498290))

(assert (= (and b!1498290 res!1019368) b!1498291))

(declare-fun m!1381381 () Bool)

(assert (=> b!1498290 m!1381381))

(declare-fun m!1381383 () Bool)

(assert (=> start!127530 m!1381383))

(declare-fun m!1381385 () Bool)

(assert (=> start!127530 m!1381385))

(declare-fun m!1381387 () Bool)

(assert (=> b!1498292 m!1381387))

(assert (=> b!1498292 m!1381387))

(declare-fun m!1381389 () Bool)

(assert (=> b!1498292 m!1381389))

(declare-fun m!1381391 () Bool)

(assert (=> b!1498291 m!1381391))

(declare-fun m!1381393 () Bool)

(assert (=> b!1498291 m!1381393))

(declare-fun m!1381395 () Bool)

(assert (=> b!1498291 m!1381395))

(declare-fun m!1381397 () Bool)

(assert (=> b!1498294 m!1381397))

(declare-fun m!1381399 () Bool)

(assert (=> b!1498295 m!1381399))

(assert (=> b!1498295 m!1381399))

(declare-fun m!1381401 () Bool)

(assert (=> b!1498295 m!1381401))

(push 1)

(assert (not start!127530))

(assert (not b!1498295))

(assert (not b!1498294))

(assert (not b!1498292))

(assert (not b!1498290))

(check-sat)

(pop 1)

(push 1)

(check-sat)

