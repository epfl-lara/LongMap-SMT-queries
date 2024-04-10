; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127702 () Bool)

(assert start!127702)

(declare-fun b!1500491 () Bool)

(declare-fun res!1021571 () Bool)

(declare-fun e!839611 () Bool)

(assert (=> b!1500491 (=> (not res!1021571) (not e!839611))))

(declare-datatypes ((array!100083 0))(
  ( (array!100084 (arr!48301 (Array (_ BitVec 32) (_ BitVec 64))) (size!48851 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100083)

(declare-datatypes ((List!34793 0))(
  ( (Nil!34790) (Cons!34789 (h!36186 (_ BitVec 64)) (t!49487 List!34793)) )
))
(declare-fun arrayNoDuplicates!0 (array!100083 (_ BitVec 32) List!34793) Bool)

(assert (=> b!1500491 (= res!1021571 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34790))))

(declare-fun b!1500493 () Bool)

(declare-fun res!1021572 () Bool)

(assert (=> b!1500493 (=> (not res!1021572) (not e!839611))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500493 (= res!1021572 (and (= (size!48851 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48851 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48851 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500494 () Bool)

(declare-fun e!839610 () Bool)

(assert (=> b!1500494 (= e!839611 e!839610)))

(declare-fun res!1021574 () Bool)

(assert (=> b!1500494 (=> (not res!1021574) (not e!839610))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652947 () (_ BitVec 32))

(assert (=> b!1500494 (= res!1021574 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652947 #b00000000000000000000000000000000) (bvslt lt!652947 (size!48851 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500494 (= lt!652947 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500495 () Bool)

(declare-fun res!1021575 () Bool)

(assert (=> b!1500495 (=> (not res!1021575) (not e!839611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100083 (_ BitVec 32)) Bool)

(assert (=> b!1500495 (= res!1021575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500496 () Bool)

(declare-fun res!1021568 () Bool)

(assert (=> b!1500496 (=> (not res!1021568) (not e!839611))))

(assert (=> b!1500496 (= res!1021568 (not (= (select (arr!48301 a!2850) index!625) (select (arr!48301 a!2850) j!87))))))

(declare-fun b!1500492 () Bool)

(assert (=> b!1500492 (= e!839610 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12511 0))(
  ( (MissingZero!12511 (index!52436 (_ BitVec 32))) (Found!12511 (index!52437 (_ BitVec 32))) (Intermediate!12511 (undefined!13323 Bool) (index!52438 (_ BitVec 32)) (x!134105 (_ BitVec 32))) (Undefined!12511) (MissingVacant!12511 (index!52439 (_ BitVec 32))) )
))
(declare-fun lt!652948 () SeekEntryResult!12511)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100083 (_ BitVec 32)) SeekEntryResult!12511)

(assert (=> b!1500492 (= lt!652948 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652947 vacantBefore!10 (select (arr!48301 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1021567 () Bool)

(assert (=> start!127702 (=> (not res!1021567) (not e!839611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127702 (= res!1021567 (validMask!0 mask!2661))))

(assert (=> start!127702 e!839611))

(assert (=> start!127702 true))

(declare-fun array_inv!37329 (array!100083) Bool)

(assert (=> start!127702 (array_inv!37329 a!2850)))

(declare-fun b!1500497 () Bool)

(declare-fun res!1021573 () Bool)

(assert (=> b!1500497 (=> (not res!1021573) (not e!839611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500497 (= res!1021573 (validKeyInArray!0 (select (arr!48301 a!2850) i!996)))))

(declare-fun b!1500498 () Bool)

(declare-fun res!1021569 () Bool)

(assert (=> b!1500498 (=> (not res!1021569) (not e!839611))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500498 (= res!1021569 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48851 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48851 a!2850)) (= (select (arr!48301 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48301 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48851 a!2850))))))

(declare-fun b!1500499 () Bool)

(declare-fun res!1021576 () Bool)

(assert (=> b!1500499 (=> (not res!1021576) (not e!839611))))

(assert (=> b!1500499 (= res!1021576 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48301 a!2850) j!87) a!2850 mask!2661) (Found!12511 j!87)))))

(declare-fun b!1500500 () Bool)

(declare-fun res!1021570 () Bool)

(assert (=> b!1500500 (=> (not res!1021570) (not e!839611))))

(assert (=> b!1500500 (= res!1021570 (validKeyInArray!0 (select (arr!48301 a!2850) j!87)))))

(assert (= (and start!127702 res!1021567) b!1500493))

(assert (= (and b!1500493 res!1021572) b!1500497))

(assert (= (and b!1500497 res!1021573) b!1500500))

(assert (= (and b!1500500 res!1021570) b!1500495))

(assert (= (and b!1500495 res!1021575) b!1500491))

(assert (= (and b!1500491 res!1021571) b!1500498))

(assert (= (and b!1500498 res!1021569) b!1500499))

(assert (= (and b!1500499 res!1021576) b!1500496))

(assert (= (and b!1500496 res!1021568) b!1500494))

(assert (= (and b!1500494 res!1021574) b!1500492))

(declare-fun m!1383685 () Bool)

(assert (=> b!1500499 m!1383685))

(assert (=> b!1500499 m!1383685))

(declare-fun m!1383687 () Bool)

(assert (=> b!1500499 m!1383687))

(declare-fun m!1383689 () Bool)

(assert (=> b!1500496 m!1383689))

(assert (=> b!1500496 m!1383685))

(declare-fun m!1383691 () Bool)

(assert (=> b!1500497 m!1383691))

(assert (=> b!1500497 m!1383691))

(declare-fun m!1383693 () Bool)

(assert (=> b!1500497 m!1383693))

(declare-fun m!1383695 () Bool)

(assert (=> b!1500498 m!1383695))

(declare-fun m!1383697 () Bool)

(assert (=> b!1500498 m!1383697))

(declare-fun m!1383699 () Bool)

(assert (=> b!1500498 m!1383699))

(assert (=> b!1500492 m!1383685))

(assert (=> b!1500492 m!1383685))

(declare-fun m!1383701 () Bool)

(assert (=> b!1500492 m!1383701))

(declare-fun m!1383703 () Bool)

(assert (=> b!1500494 m!1383703))

(declare-fun m!1383705 () Bool)

(assert (=> b!1500491 m!1383705))

(declare-fun m!1383707 () Bool)

(assert (=> start!127702 m!1383707))

(declare-fun m!1383709 () Bool)

(assert (=> start!127702 m!1383709))

(declare-fun m!1383711 () Bool)

(assert (=> b!1500495 m!1383711))

(assert (=> b!1500500 m!1383685))

(assert (=> b!1500500 m!1383685))

(declare-fun m!1383713 () Bool)

(assert (=> b!1500500 m!1383713))

(push 1)

(assert (not b!1500497))

(assert (not b!1500494))

(assert (not b!1500491))

(assert (not start!127702))

(assert (not b!1500492))

(assert (not b!1500500))

(assert (not b!1500499))

(assert (not b!1500495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

