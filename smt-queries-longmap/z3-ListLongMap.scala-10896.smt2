; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127940 () Bool)

(assert start!127940)

(declare-fun b!1501369 () Bool)

(declare-fun res!1021264 () Bool)

(declare-fun e!840461 () Bool)

(assert (=> b!1501369 (=> (not res!1021264) (not e!840461))))

(declare-datatypes ((array!100135 0))(
  ( (array!100136 (arr!48322 (Array (_ BitVec 32) (_ BitVec 64))) (size!48873 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100135)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501369 (= res!1021264 (validKeyInArray!0 (select (arr!48322 a!2850) i!996)))))

(declare-fun b!1501370 () Bool)

(declare-fun res!1021262 () Bool)

(assert (=> b!1501370 (=> (not res!1021262) (not e!840461))))

(declare-datatypes ((List!34801 0))(
  ( (Nil!34798) (Cons!34797 (h!36209 (_ BitVec 64)) (t!49487 List!34801)) )
))
(declare-fun arrayNoDuplicates!0 (array!100135 (_ BitVec 32) List!34801) Bool)

(assert (=> b!1501370 (= res!1021262 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34798))))

(declare-fun b!1501371 () Bool)

(declare-fun res!1021271 () Bool)

(assert (=> b!1501371 (=> (not res!1021271) (not e!840461))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12425 0))(
  ( (MissingZero!12425 (index!52092 (_ BitVec 32))) (Found!12425 (index!52093 (_ BitVec 32))) (Intermediate!12425 (undefined!13237 Bool) (index!52094 (_ BitVec 32)) (x!133976 (_ BitVec 32))) (Undefined!12425) (MissingVacant!12425 (index!52095 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100135 (_ BitVec 32)) SeekEntryResult!12425)

(assert (=> b!1501371 (= res!1021271 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48322 a!2850) j!87) a!2850 mask!2661) (Found!12425 j!87)))))

(declare-fun b!1501372 () Bool)

(declare-fun res!1021265 () Bool)

(assert (=> b!1501372 (=> (not res!1021265) (not e!840461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100135 (_ BitVec 32)) Bool)

(assert (=> b!1501372 (= res!1021265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501373 () Bool)

(declare-fun res!1021263 () Bool)

(assert (=> b!1501373 (=> (not res!1021263) (not e!840461))))

(assert (=> b!1501373 (= res!1021263 (not (= (select (arr!48322 a!2850) index!625) (select (arr!48322 a!2850) j!87))))))

(declare-fun b!1501374 () Bool)

(declare-fun res!1021269 () Bool)

(assert (=> b!1501374 (=> (not res!1021269) (not e!840461))))

(assert (=> b!1501374 (= res!1021269 (and (= (size!48873 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48873 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48873 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501375 () Bool)

(declare-fun e!840460 () Bool)

(assert (=> b!1501375 (= e!840460 false)))

(declare-fun lt!653420 () (_ BitVec 32))

(declare-fun lt!653421 () SeekEntryResult!12425)

(assert (=> b!1501375 (= lt!653421 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653420 vacantBefore!10 (select (arr!48322 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021266 () Bool)

(assert (=> start!127940 (=> (not res!1021266) (not e!840461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127940 (= res!1021266 (validMask!0 mask!2661))))

(assert (=> start!127940 e!840461))

(assert (=> start!127940 true))

(declare-fun array_inv!37603 (array!100135) Bool)

(assert (=> start!127940 (array_inv!37603 a!2850)))

(declare-fun b!1501376 () Bool)

(declare-fun res!1021267 () Bool)

(assert (=> b!1501376 (=> (not res!1021267) (not e!840461))))

(assert (=> b!1501376 (= res!1021267 (validKeyInArray!0 (select (arr!48322 a!2850) j!87)))))

(declare-fun b!1501377 () Bool)

(assert (=> b!1501377 (= e!840461 e!840460)))

(declare-fun res!1021268 () Bool)

(assert (=> b!1501377 (=> (not res!1021268) (not e!840460))))

(assert (=> b!1501377 (= res!1021268 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653420 #b00000000000000000000000000000000) (bvslt lt!653420 (size!48873 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501377 (= lt!653420 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501378 () Bool)

(declare-fun res!1021270 () Bool)

(assert (=> b!1501378 (=> (not res!1021270) (not e!840461))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501378 (= res!1021270 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48873 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48873 a!2850)) (= (select (arr!48322 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48322 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48873 a!2850))))))

(assert (= (and start!127940 res!1021266) b!1501374))

(assert (= (and b!1501374 res!1021269) b!1501369))

(assert (= (and b!1501369 res!1021264) b!1501376))

(assert (= (and b!1501376 res!1021267) b!1501372))

(assert (= (and b!1501372 res!1021265) b!1501370))

(assert (= (and b!1501370 res!1021262) b!1501378))

(assert (= (and b!1501378 res!1021270) b!1501371))

(assert (= (and b!1501371 res!1021271) b!1501373))

(assert (= (and b!1501373 res!1021263) b!1501377))

(assert (= (and b!1501377 res!1021268) b!1501375))

(declare-fun m!1384513 () Bool)

(assert (=> b!1501378 m!1384513))

(declare-fun m!1384515 () Bool)

(assert (=> b!1501378 m!1384515))

(declare-fun m!1384517 () Bool)

(assert (=> b!1501378 m!1384517))

(declare-fun m!1384519 () Bool)

(assert (=> start!127940 m!1384519))

(declare-fun m!1384521 () Bool)

(assert (=> start!127940 m!1384521))

(declare-fun m!1384523 () Bool)

(assert (=> b!1501371 m!1384523))

(assert (=> b!1501371 m!1384523))

(declare-fun m!1384525 () Bool)

(assert (=> b!1501371 m!1384525))

(declare-fun m!1384527 () Bool)

(assert (=> b!1501372 m!1384527))

(declare-fun m!1384529 () Bool)

(assert (=> b!1501377 m!1384529))

(assert (=> b!1501375 m!1384523))

(assert (=> b!1501375 m!1384523))

(declare-fun m!1384531 () Bool)

(assert (=> b!1501375 m!1384531))

(declare-fun m!1384533 () Bool)

(assert (=> b!1501370 m!1384533))

(declare-fun m!1384535 () Bool)

(assert (=> b!1501369 m!1384535))

(assert (=> b!1501369 m!1384535))

(declare-fun m!1384537 () Bool)

(assert (=> b!1501369 m!1384537))

(assert (=> b!1501376 m!1384523))

(assert (=> b!1501376 m!1384523))

(declare-fun m!1384539 () Bool)

(assert (=> b!1501376 m!1384539))

(declare-fun m!1384541 () Bool)

(assert (=> b!1501373 m!1384541))

(assert (=> b!1501373 m!1384523))

(check-sat (not b!1501375) (not b!1501372) (not b!1501376) (not b!1501377) (not b!1501369) (not start!127940) (not b!1501371) (not b!1501370))
(check-sat)
