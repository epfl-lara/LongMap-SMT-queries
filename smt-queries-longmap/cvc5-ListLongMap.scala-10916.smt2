; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127758 () Bool)

(assert start!127758)

(declare-fun b!1501369 () Bool)

(declare-fun res!1022454 () Bool)

(declare-fun e!839901 () Bool)

(assert (=> b!1501369 (=> (not res!1022454) (not e!839901))))

(declare-datatypes ((array!100139 0))(
  ( (array!100140 (arr!48329 (Array (_ BitVec 32) (_ BitVec 64))) (size!48879 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100139)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501369 (= res!1022454 (validKeyInArray!0 (select (arr!48329 a!2850) j!87)))))

(declare-fun b!1501370 () Bool)

(declare-fun res!1022446 () Bool)

(assert (=> b!1501370 (=> (not res!1022446) (not e!839901))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501370 (= res!1022446 (validKeyInArray!0 (select (arr!48329 a!2850) i!996)))))

(declare-fun b!1501371 () Bool)

(declare-fun res!1022447 () Bool)

(assert (=> b!1501371 (=> (not res!1022447) (not e!839901))))

(declare-datatypes ((List!34821 0))(
  ( (Nil!34818) (Cons!34817 (h!36214 (_ BitVec 64)) (t!49515 List!34821)) )
))
(declare-fun arrayNoDuplicates!0 (array!100139 (_ BitVec 32) List!34821) Bool)

(assert (=> b!1501371 (= res!1022447 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34818))))

(declare-fun b!1501372 () Bool)

(declare-fun res!1022451 () Bool)

(declare-fun e!839899 () Bool)

(assert (=> b!1501372 (=> (not res!1022451) (not e!839899))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501372 (= res!1022451 (not (= (select (arr!48329 a!2850) index!625) (select (arr!48329 a!2850) j!87))))))

(declare-fun b!1501373 () Bool)

(declare-fun e!839900 () Bool)

(assert (=> b!1501373 (= e!839899 e!839900)))

(declare-fun res!1022453 () Bool)

(assert (=> b!1501373 (=> (not res!1022453) (not e!839900))))

(declare-fun lt!653155 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1501373 (= res!1022453 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653155 #b00000000000000000000000000000000) (bvslt lt!653155 (size!48879 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501373 (= lt!653155 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501374 () Bool)

(assert (=> b!1501374 (= e!839900 (not true))))

(declare-datatypes ((SeekEntryResult!12539 0))(
  ( (MissingZero!12539 (index!52548 (_ BitVec 32))) (Found!12539 (index!52549 (_ BitVec 32))) (Intermediate!12539 (undefined!13351 Bool) (index!52550 (_ BitVec 32)) (x!134213 (_ BitVec 32))) (Undefined!12539) (MissingVacant!12539 (index!52551 (_ BitVec 32))) )
))
(declare-fun lt!653154 () SeekEntryResult!12539)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100139 (_ BitVec 32)) SeekEntryResult!12539)

(assert (=> b!1501374 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653155 vacantAfter!10 (select (store (arr!48329 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100140 (store (arr!48329 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48879 a!2850)) mask!2661) lt!653154)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50232 0))(
  ( (Unit!50233) )
))
(declare-fun lt!653153 () Unit!50232)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50232)

(assert (=> b!1501374 (= lt!653153 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653155 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501375 () Bool)

(declare-fun res!1022445 () Bool)

(assert (=> b!1501375 (=> (not res!1022445) (not e!839900))))

(assert (=> b!1501375 (= res!1022445 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653155 vacantBefore!10 (select (arr!48329 a!2850) j!87) a!2850 mask!2661) lt!653154))))

(declare-fun res!1022448 () Bool)

(assert (=> start!127758 (=> (not res!1022448) (not e!839901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127758 (= res!1022448 (validMask!0 mask!2661))))

(assert (=> start!127758 e!839901))

(assert (=> start!127758 true))

(declare-fun array_inv!37357 (array!100139) Bool)

(assert (=> start!127758 (array_inv!37357 a!2850)))

(declare-fun b!1501376 () Bool)

(declare-fun res!1022455 () Bool)

(assert (=> b!1501376 (=> (not res!1022455) (not e!839901))))

(assert (=> b!1501376 (= res!1022455 (and (= (size!48879 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48879 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48879 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501377 () Bool)

(declare-fun res!1022450 () Bool)

(assert (=> b!1501377 (=> (not res!1022450) (not e!839901))))

(assert (=> b!1501377 (= res!1022450 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48879 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48879 a!2850)) (= (select (arr!48329 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48329 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48879 a!2850))))))

(declare-fun b!1501378 () Bool)

(assert (=> b!1501378 (= e!839901 e!839899)))

(declare-fun res!1022449 () Bool)

(assert (=> b!1501378 (=> (not res!1022449) (not e!839899))))

(assert (=> b!1501378 (= res!1022449 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48329 a!2850) j!87) a!2850 mask!2661) lt!653154))))

(assert (=> b!1501378 (= lt!653154 (Found!12539 j!87))))

(declare-fun b!1501379 () Bool)

(declare-fun res!1022452 () Bool)

(assert (=> b!1501379 (=> (not res!1022452) (not e!839901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100139 (_ BitVec 32)) Bool)

(assert (=> b!1501379 (= res!1022452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127758 res!1022448) b!1501376))

(assert (= (and b!1501376 res!1022455) b!1501370))

(assert (= (and b!1501370 res!1022446) b!1501369))

(assert (= (and b!1501369 res!1022454) b!1501379))

(assert (= (and b!1501379 res!1022452) b!1501371))

(assert (= (and b!1501371 res!1022447) b!1501377))

(assert (= (and b!1501377 res!1022450) b!1501378))

(assert (= (and b!1501378 res!1022449) b!1501372))

(assert (= (and b!1501372 res!1022451) b!1501373))

(assert (= (and b!1501373 res!1022453) b!1501375))

(assert (= (and b!1501375 res!1022445) b!1501374))

(declare-fun m!1384597 () Bool)

(assert (=> b!1501370 m!1384597))

(assert (=> b!1501370 m!1384597))

(declare-fun m!1384599 () Bool)

(assert (=> b!1501370 m!1384599))

(declare-fun m!1384601 () Bool)

(assert (=> b!1501378 m!1384601))

(assert (=> b!1501378 m!1384601))

(declare-fun m!1384603 () Bool)

(assert (=> b!1501378 m!1384603))

(declare-fun m!1384605 () Bool)

(assert (=> b!1501379 m!1384605))

(declare-fun m!1384607 () Bool)

(assert (=> start!127758 m!1384607))

(declare-fun m!1384609 () Bool)

(assert (=> start!127758 m!1384609))

(assert (=> b!1501369 m!1384601))

(assert (=> b!1501369 m!1384601))

(declare-fun m!1384611 () Bool)

(assert (=> b!1501369 m!1384611))

(declare-fun m!1384613 () Bool)

(assert (=> b!1501374 m!1384613))

(declare-fun m!1384615 () Bool)

(assert (=> b!1501374 m!1384615))

(assert (=> b!1501374 m!1384615))

(declare-fun m!1384617 () Bool)

(assert (=> b!1501374 m!1384617))

(declare-fun m!1384619 () Bool)

(assert (=> b!1501374 m!1384619))

(declare-fun m!1384621 () Bool)

(assert (=> b!1501377 m!1384621))

(assert (=> b!1501377 m!1384613))

(declare-fun m!1384623 () Bool)

(assert (=> b!1501377 m!1384623))

(declare-fun m!1384625 () Bool)

(assert (=> b!1501373 m!1384625))

(declare-fun m!1384627 () Bool)

(assert (=> b!1501372 m!1384627))

(assert (=> b!1501372 m!1384601))

(assert (=> b!1501375 m!1384601))

(assert (=> b!1501375 m!1384601))

(declare-fun m!1384629 () Bool)

(assert (=> b!1501375 m!1384629))

(declare-fun m!1384631 () Bool)

(assert (=> b!1501371 m!1384631))

(push 1)

