; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127754 () Bool)

(assert start!127754)

(declare-fun b!1501303 () Bool)

(declare-fun res!1022383 () Bool)

(declare-fun e!839878 () Bool)

(assert (=> b!1501303 (=> (not res!1022383) (not e!839878))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((array!100135 0))(
  ( (array!100136 (arr!48327 (Array (_ BitVec 32) (_ BitVec 64))) (size!48877 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100135)

(assert (=> b!1501303 (= res!1022383 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48877 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48877 a!2850)) (= (select (arr!48327 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48327 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48877 a!2850))))))

(declare-fun b!1501304 () Bool)

(declare-fun res!1022380 () Bool)

(declare-fun e!839876 () Bool)

(assert (=> b!1501304 (=> (not res!1022380) (not e!839876))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501304 (= res!1022380 (not (= (select (arr!48327 a!2850) index!625) (select (arr!48327 a!2850) j!87))))))

(declare-fun b!1501305 () Bool)

(assert (=> b!1501305 (= e!839878 e!839876)))

(declare-fun res!1022387 () Bool)

(assert (=> b!1501305 (=> (not res!1022387) (not e!839876))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12537 0))(
  ( (MissingZero!12537 (index!52540 (_ BitVec 32))) (Found!12537 (index!52541 (_ BitVec 32))) (Intermediate!12537 (undefined!13349 Bool) (index!52542 (_ BitVec 32)) (x!134203 (_ BitVec 32))) (Undefined!12537) (MissingVacant!12537 (index!52543 (_ BitVec 32))) )
))
(declare-fun lt!653137 () SeekEntryResult!12537)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100135 (_ BitVec 32)) SeekEntryResult!12537)

(assert (=> b!1501305 (= res!1022387 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48327 a!2850) j!87) a!2850 mask!2661) lt!653137))))

(assert (=> b!1501305 (= lt!653137 (Found!12537 j!87))))

(declare-fun b!1501306 () Bool)

(declare-fun e!839877 () Bool)

(assert (=> b!1501306 (= e!839876 e!839877)))

(declare-fun res!1022379 () Bool)

(assert (=> b!1501306 (=> (not res!1022379) (not e!839877))))

(declare-fun lt!653136 () (_ BitVec 32))

(assert (=> b!1501306 (= res!1022379 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653136 #b00000000000000000000000000000000) (bvslt lt!653136 (size!48877 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501306 (= lt!653136 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501307 () Bool)

(declare-fun res!1022381 () Bool)

(assert (=> b!1501307 (=> (not res!1022381) (not e!839878))))

(declare-datatypes ((List!34819 0))(
  ( (Nil!34816) (Cons!34815 (h!36212 (_ BitVec 64)) (t!49513 List!34819)) )
))
(declare-fun arrayNoDuplicates!0 (array!100135 (_ BitVec 32) List!34819) Bool)

(assert (=> b!1501307 (= res!1022381 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34816))))

(declare-fun res!1022384 () Bool)

(assert (=> start!127754 (=> (not res!1022384) (not e!839878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127754 (= res!1022384 (validMask!0 mask!2661))))

(assert (=> start!127754 e!839878))

(assert (=> start!127754 true))

(declare-fun array_inv!37355 (array!100135) Bool)

(assert (=> start!127754 (array_inv!37355 a!2850)))

(declare-fun b!1501308 () Bool)

(assert (=> b!1501308 (= e!839877 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(assert (=> b!1501308 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653136 vacantAfter!10 (select (store (arr!48327 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100136 (store (arr!48327 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48877 a!2850)) mask!2661) lt!653137)))

(declare-datatypes ((Unit!50228 0))(
  ( (Unit!50229) )
))
(declare-fun lt!653135 () Unit!50228)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100135 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50228)

(assert (=> b!1501308 (= lt!653135 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653136 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501309 () Bool)

(declare-fun res!1022386 () Bool)

(assert (=> b!1501309 (=> (not res!1022386) (not e!839877))))

(assert (=> b!1501309 (= res!1022386 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653136 vacantBefore!10 (select (arr!48327 a!2850) j!87) a!2850 mask!2661) lt!653137))))

(declare-fun b!1501310 () Bool)

(declare-fun res!1022389 () Bool)

(assert (=> b!1501310 (=> (not res!1022389) (not e!839878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501310 (= res!1022389 (validKeyInArray!0 (select (arr!48327 a!2850) j!87)))))

(declare-fun b!1501311 () Bool)

(declare-fun res!1022382 () Bool)

(assert (=> b!1501311 (=> (not res!1022382) (not e!839878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100135 (_ BitVec 32)) Bool)

(assert (=> b!1501311 (= res!1022382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501312 () Bool)

(declare-fun res!1022385 () Bool)

(assert (=> b!1501312 (=> (not res!1022385) (not e!839878))))

(assert (=> b!1501312 (= res!1022385 (validKeyInArray!0 (select (arr!48327 a!2850) i!996)))))

(declare-fun b!1501313 () Bool)

(declare-fun res!1022388 () Bool)

(assert (=> b!1501313 (=> (not res!1022388) (not e!839878))))

(assert (=> b!1501313 (= res!1022388 (and (= (size!48877 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48877 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48877 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127754 res!1022384) b!1501313))

(assert (= (and b!1501313 res!1022388) b!1501312))

(assert (= (and b!1501312 res!1022385) b!1501310))

(assert (= (and b!1501310 res!1022389) b!1501311))

(assert (= (and b!1501311 res!1022382) b!1501307))

(assert (= (and b!1501307 res!1022381) b!1501303))

(assert (= (and b!1501303 res!1022383) b!1501305))

(assert (= (and b!1501305 res!1022387) b!1501304))

(assert (= (and b!1501304 res!1022380) b!1501306))

(assert (= (and b!1501306 res!1022379) b!1501309))

(assert (= (and b!1501309 res!1022386) b!1501308))

(declare-fun m!1384525 () Bool)

(assert (=> b!1501307 m!1384525))

(declare-fun m!1384527 () Bool)

(assert (=> b!1501309 m!1384527))

(assert (=> b!1501309 m!1384527))

(declare-fun m!1384529 () Bool)

(assert (=> b!1501309 m!1384529))

(assert (=> b!1501305 m!1384527))

(assert (=> b!1501305 m!1384527))

(declare-fun m!1384531 () Bool)

(assert (=> b!1501305 m!1384531))

(declare-fun m!1384533 () Bool)

(assert (=> b!1501308 m!1384533))

(declare-fun m!1384535 () Bool)

(assert (=> b!1501308 m!1384535))

(assert (=> b!1501308 m!1384535))

(declare-fun m!1384537 () Bool)

(assert (=> b!1501308 m!1384537))

(declare-fun m!1384539 () Bool)

(assert (=> b!1501308 m!1384539))

(declare-fun m!1384541 () Bool)

(assert (=> b!1501312 m!1384541))

(assert (=> b!1501312 m!1384541))

(declare-fun m!1384543 () Bool)

(assert (=> b!1501312 m!1384543))

(declare-fun m!1384545 () Bool)

(assert (=> b!1501311 m!1384545))

(declare-fun m!1384547 () Bool)

(assert (=> b!1501306 m!1384547))

(declare-fun m!1384549 () Bool)

(assert (=> b!1501304 m!1384549))

(assert (=> b!1501304 m!1384527))

(declare-fun m!1384551 () Bool)

(assert (=> b!1501303 m!1384551))

(assert (=> b!1501303 m!1384533))

(declare-fun m!1384553 () Bool)

(assert (=> b!1501303 m!1384553))

(declare-fun m!1384555 () Bool)

(assert (=> start!127754 m!1384555))

(declare-fun m!1384557 () Bool)

(assert (=> start!127754 m!1384557))

(assert (=> b!1501310 m!1384527))

(assert (=> b!1501310 m!1384527))

(declare-fun m!1384559 () Bool)

(assert (=> b!1501310 m!1384559))

(check-sat (not start!127754) (not b!1501310) (not b!1501311) (not b!1501307) (not b!1501306) (not b!1501305) (not b!1501309) (not b!1501308) (not b!1501312))
(check-sat)
