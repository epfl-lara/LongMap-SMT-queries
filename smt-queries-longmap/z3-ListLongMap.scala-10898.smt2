; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127952 () Bool)

(assert start!127952)

(declare-fun b!1501549 () Bool)

(declare-fun res!1021444 () Bool)

(declare-fun e!840516 () Bool)

(assert (=> b!1501549 (=> (not res!1021444) (not e!840516))))

(declare-datatypes ((array!100147 0))(
  ( (array!100148 (arr!48328 (Array (_ BitVec 32) (_ BitVec 64))) (size!48879 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100147)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501549 (= res!1021444 (not (= (select (arr!48328 a!2850) index!625) (select (arr!48328 a!2850) j!87))))))

(declare-fun b!1501550 () Bool)

(declare-fun e!840515 () Bool)

(assert (=> b!1501550 (= e!840516 e!840515)))

(declare-fun res!1021450 () Bool)

(assert (=> b!1501550 (=> (not res!1021450) (not e!840515))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653457 () (_ BitVec 32))

(assert (=> b!1501550 (= res!1021450 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653457 #b00000000000000000000000000000000) (bvslt lt!653457 (size!48879 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501550 (= lt!653457 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun res!1021445 () Bool)

(assert (=> start!127952 (=> (not res!1021445) (not e!840516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127952 (= res!1021445 (validMask!0 mask!2661))))

(assert (=> start!127952 e!840516))

(assert (=> start!127952 true))

(declare-fun array_inv!37609 (array!100147) Bool)

(assert (=> start!127952 (array_inv!37609 a!2850)))

(declare-fun b!1501551 () Bool)

(declare-fun res!1021446 () Bool)

(assert (=> b!1501551 (=> (not res!1021446) (not e!840516))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501551 (= res!1021446 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48879 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48879 a!2850)) (= (select (arr!48328 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48328 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48879 a!2850))))))

(declare-fun b!1501552 () Bool)

(declare-fun res!1021449 () Bool)

(assert (=> b!1501552 (=> (not res!1021449) (not e!840516))))

(declare-datatypes ((List!34807 0))(
  ( (Nil!34804) (Cons!34803 (h!36215 (_ BitVec 64)) (t!49493 List!34807)) )
))
(declare-fun arrayNoDuplicates!0 (array!100147 (_ BitVec 32) List!34807) Bool)

(assert (=> b!1501552 (= res!1021449 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34804))))

(declare-fun b!1501553 () Bool)

(declare-fun res!1021443 () Bool)

(assert (=> b!1501553 (=> (not res!1021443) (not e!840516))))

(declare-datatypes ((SeekEntryResult!12431 0))(
  ( (MissingZero!12431 (index!52116 (_ BitVec 32))) (Found!12431 (index!52117 (_ BitVec 32))) (Intermediate!12431 (undefined!13243 Bool) (index!52118 (_ BitVec 32)) (x!133998 (_ BitVec 32))) (Undefined!12431) (MissingVacant!12431 (index!52119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100147 (_ BitVec 32)) SeekEntryResult!12431)

(assert (=> b!1501553 (= res!1021443 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48328 a!2850) j!87) a!2850 mask!2661) (Found!12431 j!87)))))

(declare-fun b!1501554 () Bool)

(declare-fun res!1021442 () Bool)

(assert (=> b!1501554 (=> (not res!1021442) (not e!840516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100147 (_ BitVec 32)) Bool)

(assert (=> b!1501554 (= res!1021442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501555 () Bool)

(declare-fun res!1021451 () Bool)

(assert (=> b!1501555 (=> (not res!1021451) (not e!840516))))

(assert (=> b!1501555 (= res!1021451 (and (= (size!48879 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48879 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48879 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501556 () Bool)

(assert (=> b!1501556 (= e!840515 false)))

(declare-fun lt!653456 () SeekEntryResult!12431)

(assert (=> b!1501556 (= lt!653456 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653457 vacantBefore!10 (select (arr!48328 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501557 () Bool)

(declare-fun res!1021448 () Bool)

(assert (=> b!1501557 (=> (not res!1021448) (not e!840516))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501557 (= res!1021448 (validKeyInArray!0 (select (arr!48328 a!2850) i!996)))))

(declare-fun b!1501558 () Bool)

(declare-fun res!1021447 () Bool)

(assert (=> b!1501558 (=> (not res!1021447) (not e!840516))))

(assert (=> b!1501558 (= res!1021447 (validKeyInArray!0 (select (arr!48328 a!2850) j!87)))))

(assert (= (and start!127952 res!1021445) b!1501555))

(assert (= (and b!1501555 res!1021451) b!1501557))

(assert (= (and b!1501557 res!1021448) b!1501558))

(assert (= (and b!1501558 res!1021447) b!1501554))

(assert (= (and b!1501554 res!1021442) b!1501552))

(assert (= (and b!1501552 res!1021449) b!1501551))

(assert (= (and b!1501551 res!1021446) b!1501553))

(assert (= (and b!1501553 res!1021443) b!1501549))

(assert (= (and b!1501549 res!1021444) b!1501550))

(assert (= (and b!1501550 res!1021450) b!1501556))

(declare-fun m!1384693 () Bool)

(assert (=> b!1501556 m!1384693))

(assert (=> b!1501556 m!1384693))

(declare-fun m!1384695 () Bool)

(assert (=> b!1501556 m!1384695))

(declare-fun m!1384697 () Bool)

(assert (=> b!1501557 m!1384697))

(assert (=> b!1501557 m!1384697))

(declare-fun m!1384699 () Bool)

(assert (=> b!1501557 m!1384699))

(declare-fun m!1384701 () Bool)

(assert (=> b!1501549 m!1384701))

(assert (=> b!1501549 m!1384693))

(assert (=> b!1501558 m!1384693))

(assert (=> b!1501558 m!1384693))

(declare-fun m!1384703 () Bool)

(assert (=> b!1501558 m!1384703))

(declare-fun m!1384705 () Bool)

(assert (=> b!1501550 m!1384705))

(declare-fun m!1384707 () Bool)

(assert (=> b!1501551 m!1384707))

(declare-fun m!1384709 () Bool)

(assert (=> b!1501551 m!1384709))

(declare-fun m!1384711 () Bool)

(assert (=> b!1501551 m!1384711))

(assert (=> b!1501553 m!1384693))

(assert (=> b!1501553 m!1384693))

(declare-fun m!1384713 () Bool)

(assert (=> b!1501553 m!1384713))

(declare-fun m!1384715 () Bool)

(assert (=> b!1501552 m!1384715))

(declare-fun m!1384717 () Bool)

(assert (=> start!127952 m!1384717))

(declare-fun m!1384719 () Bool)

(assert (=> start!127952 m!1384719))

(declare-fun m!1384721 () Bool)

(assert (=> b!1501554 m!1384721))

(check-sat (not b!1501557) (not b!1501553) (not b!1501550) (not b!1501556) (not start!127952) (not b!1501554) (not b!1501558) (not b!1501552))
(check-sat)
