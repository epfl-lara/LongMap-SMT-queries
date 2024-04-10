; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127626 () Bool)

(assert start!127626)

(declare-fun b!1499351 () Bool)

(declare-fun res!1020436 () Bool)

(declare-fun e!839268 () Bool)

(assert (=> b!1499351 (=> (not res!1020436) (not e!839268))))

(declare-datatypes ((array!100007 0))(
  ( (array!100008 (arr!48263 (Array (_ BitVec 32) (_ BitVec 64))) (size!48813 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100007)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100007 (_ BitVec 32)) Bool)

(assert (=> b!1499351 (= res!1020436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499352 () Bool)

(declare-fun res!1020428 () Bool)

(assert (=> b!1499352 (=> (not res!1020428) (not e!839268))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12473 0))(
  ( (MissingZero!12473 (index!52284 (_ BitVec 32))) (Found!12473 (index!52285 (_ BitVec 32))) (Intermediate!12473 (undefined!13285 Bool) (index!52286 (_ BitVec 32)) (x!133971 (_ BitVec 32))) (Undefined!12473) (MissingVacant!12473 (index!52287 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100007 (_ BitVec 32)) SeekEntryResult!12473)

(assert (=> b!1499352 (= res!1020428 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48263 a!2850) j!87) a!2850 mask!2661) (Found!12473 j!87)))))

(declare-fun b!1499353 () Bool)

(declare-fun res!1020435 () Bool)

(assert (=> b!1499353 (=> (not res!1020435) (not e!839268))))

(assert (=> b!1499353 (= res!1020435 (not (= (select (arr!48263 a!2850) index!625) (select (arr!48263 a!2850) j!87))))))

(declare-fun res!1020433 () Bool)

(assert (=> start!127626 (=> (not res!1020433) (not e!839268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127626 (= res!1020433 (validMask!0 mask!2661))))

(assert (=> start!127626 e!839268))

(assert (=> start!127626 true))

(declare-fun array_inv!37291 (array!100007) Bool)

(assert (=> start!127626 (array_inv!37291 a!2850)))

(declare-fun b!1499354 () Bool)

(declare-fun e!839267 () Bool)

(assert (=> b!1499354 (= e!839268 e!839267)))

(declare-fun res!1020430 () Bool)

(assert (=> b!1499354 (=> (not res!1020430) (not e!839267))))

(declare-fun lt!652719 () (_ BitVec 32))

(assert (=> b!1499354 (= res!1020430 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652719 #b00000000000000000000000000000000) (bvslt lt!652719 (size!48813 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499354 (= lt!652719 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499355 () Bool)

(declare-fun res!1020431 () Bool)

(assert (=> b!1499355 (=> (not res!1020431) (not e!839268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499355 (= res!1020431 (validKeyInArray!0 (select (arr!48263 a!2850) j!87)))))

(declare-fun b!1499356 () Bool)

(declare-fun res!1020434 () Bool)

(assert (=> b!1499356 (=> (not res!1020434) (not e!839268))))

(declare-datatypes ((List!34755 0))(
  ( (Nil!34752) (Cons!34751 (h!36148 (_ BitVec 64)) (t!49449 List!34755)) )
))
(declare-fun arrayNoDuplicates!0 (array!100007 (_ BitVec 32) List!34755) Bool)

(assert (=> b!1499356 (= res!1020434 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34752))))

(declare-fun b!1499357 () Bool)

(declare-fun res!1020432 () Bool)

(assert (=> b!1499357 (=> (not res!1020432) (not e!839268))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1499357 (= res!1020432 (validKeyInArray!0 (select (arr!48263 a!2850) i!996)))))

(declare-fun b!1499358 () Bool)

(declare-fun res!1020429 () Bool)

(assert (=> b!1499358 (=> (not res!1020429) (not e!839268))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499358 (= res!1020429 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48813 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48813 a!2850)) (= (select (arr!48263 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48263 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48813 a!2850))))))

(declare-fun b!1499359 () Bool)

(assert (=> b!1499359 (= e!839267 false)))

(declare-fun lt!652720 () SeekEntryResult!12473)

(assert (=> b!1499359 (= lt!652720 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652719 vacantBefore!10 (select (arr!48263 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499360 () Bool)

(declare-fun res!1020427 () Bool)

(assert (=> b!1499360 (=> (not res!1020427) (not e!839268))))

(assert (=> b!1499360 (= res!1020427 (and (= (size!48813 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48813 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48813 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127626 res!1020433) b!1499360))

(assert (= (and b!1499360 res!1020427) b!1499357))

(assert (= (and b!1499357 res!1020432) b!1499355))

(assert (= (and b!1499355 res!1020431) b!1499351))

(assert (= (and b!1499351 res!1020436) b!1499356))

(assert (= (and b!1499356 res!1020434) b!1499358))

(assert (= (and b!1499358 res!1020429) b!1499352))

(assert (= (and b!1499352 res!1020428) b!1499353))

(assert (= (and b!1499353 res!1020435) b!1499354))

(assert (= (and b!1499354 res!1020430) b!1499359))

(declare-fun m!1382545 () Bool)

(assert (=> b!1499359 m!1382545))

(assert (=> b!1499359 m!1382545))

(declare-fun m!1382547 () Bool)

(assert (=> b!1499359 m!1382547))

(declare-fun m!1382549 () Bool)

(assert (=> start!127626 m!1382549))

(declare-fun m!1382551 () Bool)

(assert (=> start!127626 m!1382551))

(assert (=> b!1499355 m!1382545))

(assert (=> b!1499355 m!1382545))

(declare-fun m!1382553 () Bool)

(assert (=> b!1499355 m!1382553))

(declare-fun m!1382555 () Bool)

(assert (=> b!1499351 m!1382555))

(declare-fun m!1382557 () Bool)

(assert (=> b!1499354 m!1382557))

(assert (=> b!1499352 m!1382545))

(assert (=> b!1499352 m!1382545))

(declare-fun m!1382559 () Bool)

(assert (=> b!1499352 m!1382559))

(declare-fun m!1382561 () Bool)

(assert (=> b!1499353 m!1382561))

(assert (=> b!1499353 m!1382545))

(declare-fun m!1382563 () Bool)

(assert (=> b!1499357 m!1382563))

(assert (=> b!1499357 m!1382563))

(declare-fun m!1382565 () Bool)

(assert (=> b!1499357 m!1382565))

(declare-fun m!1382567 () Bool)

(assert (=> b!1499356 m!1382567))

(declare-fun m!1382569 () Bool)

(assert (=> b!1499358 m!1382569))

(declare-fun m!1382571 () Bool)

(assert (=> b!1499358 m!1382571))

(declare-fun m!1382573 () Bool)

(assert (=> b!1499358 m!1382573))

(push 1)

