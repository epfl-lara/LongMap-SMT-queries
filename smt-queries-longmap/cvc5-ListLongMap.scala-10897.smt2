; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127644 () Bool)

(assert start!127644)

(declare-fun b!1499621 () Bool)

(declare-fun e!839349 () Bool)

(assert (=> b!1499621 (= e!839349 false)))

(declare-datatypes ((array!100025 0))(
  ( (array!100026 (arr!48272 (Array (_ BitVec 32) (_ BitVec 64))) (size!48822 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100025)

(declare-fun lt!652774 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12482 0))(
  ( (MissingZero!12482 (index!52320 (_ BitVec 32))) (Found!12482 (index!52321 (_ BitVec 32))) (Intermediate!12482 (undefined!13294 Bool) (index!52322 (_ BitVec 32)) (x!134004 (_ BitVec 32))) (Undefined!12482) (MissingVacant!12482 (index!52323 (_ BitVec 32))) )
))
(declare-fun lt!652773 () SeekEntryResult!12482)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100025 (_ BitVec 32)) SeekEntryResult!12482)

(assert (=> b!1499621 (= lt!652773 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652774 vacantBefore!10 (select (arr!48272 a!2850) j!87) a!2850 mask!2661))))

(declare-fun res!1020706 () Bool)

(declare-fun e!839350 () Bool)

(assert (=> start!127644 (=> (not res!1020706) (not e!839350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127644 (= res!1020706 (validMask!0 mask!2661))))

(assert (=> start!127644 e!839350))

(assert (=> start!127644 true))

(declare-fun array_inv!37300 (array!100025) Bool)

(assert (=> start!127644 (array_inv!37300 a!2850)))

(declare-fun b!1499622 () Bool)

(declare-fun res!1020704 () Bool)

(assert (=> b!1499622 (=> (not res!1020704) (not e!839350))))

(declare-datatypes ((List!34764 0))(
  ( (Nil!34761) (Cons!34760 (h!36157 (_ BitVec 64)) (t!49458 List!34764)) )
))
(declare-fun arrayNoDuplicates!0 (array!100025 (_ BitVec 32) List!34764) Bool)

(assert (=> b!1499622 (= res!1020704 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34761))))

(declare-fun b!1499623 () Bool)

(declare-fun res!1020698 () Bool)

(assert (=> b!1499623 (=> (not res!1020698) (not e!839350))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499623 (= res!1020698 (validKeyInArray!0 (select (arr!48272 a!2850) i!996)))))

(declare-fun b!1499624 () Bool)

(declare-fun res!1020697 () Bool)

(assert (=> b!1499624 (=> (not res!1020697) (not e!839350))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1499624 (= res!1020697 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48272 a!2850) j!87) a!2850 mask!2661) (Found!12482 j!87)))))

(declare-fun b!1499625 () Bool)

(assert (=> b!1499625 (= e!839350 e!839349)))

(declare-fun res!1020699 () Bool)

(assert (=> b!1499625 (=> (not res!1020699) (not e!839349))))

(assert (=> b!1499625 (= res!1020699 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652774 #b00000000000000000000000000000000) (bvslt lt!652774 (size!48822 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499625 (= lt!652774 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499626 () Bool)

(declare-fun res!1020703 () Bool)

(assert (=> b!1499626 (=> (not res!1020703) (not e!839350))))

(assert (=> b!1499626 (= res!1020703 (and (= (size!48822 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48822 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48822 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499627 () Bool)

(declare-fun res!1020702 () Bool)

(assert (=> b!1499627 (=> (not res!1020702) (not e!839350))))

(assert (=> b!1499627 (= res!1020702 (not (= (select (arr!48272 a!2850) index!625) (select (arr!48272 a!2850) j!87))))))

(declare-fun b!1499628 () Bool)

(declare-fun res!1020701 () Bool)

(assert (=> b!1499628 (=> (not res!1020701) (not e!839350))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499628 (= res!1020701 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48822 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48822 a!2850)) (= (select (arr!48272 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48272 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48822 a!2850))))))

(declare-fun b!1499629 () Bool)

(declare-fun res!1020700 () Bool)

(assert (=> b!1499629 (=> (not res!1020700) (not e!839350))))

(assert (=> b!1499629 (= res!1020700 (validKeyInArray!0 (select (arr!48272 a!2850) j!87)))))

(declare-fun b!1499630 () Bool)

(declare-fun res!1020705 () Bool)

(assert (=> b!1499630 (=> (not res!1020705) (not e!839350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100025 (_ BitVec 32)) Bool)

(assert (=> b!1499630 (= res!1020705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127644 res!1020706) b!1499626))

(assert (= (and b!1499626 res!1020703) b!1499623))

(assert (= (and b!1499623 res!1020698) b!1499629))

(assert (= (and b!1499629 res!1020700) b!1499630))

(assert (= (and b!1499630 res!1020705) b!1499622))

(assert (= (and b!1499622 res!1020704) b!1499628))

(assert (= (and b!1499628 res!1020701) b!1499624))

(assert (= (and b!1499624 res!1020697) b!1499627))

(assert (= (and b!1499627 res!1020702) b!1499625))

(assert (= (and b!1499625 res!1020699) b!1499621))

(declare-fun m!1382815 () Bool)

(assert (=> b!1499630 m!1382815))

(declare-fun m!1382817 () Bool)

(assert (=> b!1499627 m!1382817))

(declare-fun m!1382819 () Bool)

(assert (=> b!1499627 m!1382819))

(assert (=> b!1499624 m!1382819))

(assert (=> b!1499624 m!1382819))

(declare-fun m!1382821 () Bool)

(assert (=> b!1499624 m!1382821))

(declare-fun m!1382823 () Bool)

(assert (=> b!1499628 m!1382823))

(declare-fun m!1382825 () Bool)

(assert (=> b!1499628 m!1382825))

(declare-fun m!1382827 () Bool)

(assert (=> b!1499628 m!1382827))

(declare-fun m!1382829 () Bool)

(assert (=> start!127644 m!1382829))

(declare-fun m!1382831 () Bool)

(assert (=> start!127644 m!1382831))

(assert (=> b!1499629 m!1382819))

(assert (=> b!1499629 m!1382819))

(declare-fun m!1382833 () Bool)

(assert (=> b!1499629 m!1382833))

(declare-fun m!1382835 () Bool)

(assert (=> b!1499622 m!1382835))

(declare-fun m!1382837 () Bool)

(assert (=> b!1499625 m!1382837))

(assert (=> b!1499621 m!1382819))

(assert (=> b!1499621 m!1382819))

(declare-fun m!1382839 () Bool)

(assert (=> b!1499621 m!1382839))

(declare-fun m!1382841 () Bool)

(assert (=> b!1499623 m!1382841))

(assert (=> b!1499623 m!1382841))

(declare-fun m!1382843 () Bool)

(assert (=> b!1499623 m!1382843))

(push 1)

