; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127706 () Bool)

(assert start!127706)

(declare-fun b!1500551 () Bool)

(declare-fun e!839627 () Bool)

(assert (=> b!1500551 (= e!839627 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100087 0))(
  ( (array!100088 (arr!48303 (Array (_ BitVec 32) (_ BitVec 64))) (size!48853 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100087)

(declare-datatypes ((SeekEntryResult!12513 0))(
  ( (MissingZero!12513 (index!52444 (_ BitVec 32))) (Found!12513 (index!52445 (_ BitVec 32))) (Intermediate!12513 (undefined!13325 Bool) (index!52446 (_ BitVec 32)) (x!134115 (_ BitVec 32))) (Undefined!12513) (MissingVacant!12513 (index!52447 (_ BitVec 32))) )
))
(declare-fun lt!652960 () SeekEntryResult!12513)

(declare-fun lt!652959 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100087 (_ BitVec 32)) SeekEntryResult!12513)

(assert (=> b!1500551 (= lt!652960 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652959 vacantBefore!10 (select (arr!48303 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500552 () Bool)

(declare-fun res!1021632 () Bool)

(declare-fun e!839629 () Bool)

(assert (=> b!1500552 (=> (not res!1021632) (not e!839629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500552 (= res!1021632 (validKeyInArray!0 (select (arr!48303 a!2850) j!87)))))

(declare-fun res!1021627 () Bool)

(assert (=> start!127706 (=> (not res!1021627) (not e!839629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127706 (= res!1021627 (validMask!0 mask!2661))))

(assert (=> start!127706 e!839629))

(assert (=> start!127706 true))

(declare-fun array_inv!37331 (array!100087) Bool)

(assert (=> start!127706 (array_inv!37331 a!2850)))

(declare-fun b!1500553 () Bool)

(declare-fun res!1021636 () Bool)

(assert (=> b!1500553 (=> (not res!1021636) (not e!839629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100087 (_ BitVec 32)) Bool)

(assert (=> b!1500553 (= res!1021636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500554 () Bool)

(declare-fun res!1021630 () Bool)

(assert (=> b!1500554 (=> (not res!1021630) (not e!839629))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1500554 (= res!1021630 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48303 a!2850) j!87) a!2850 mask!2661) (Found!12513 j!87)))))

(declare-fun b!1500555 () Bool)

(declare-fun res!1021628 () Bool)

(assert (=> b!1500555 (=> (not res!1021628) (not e!839629))))

(declare-datatypes ((List!34795 0))(
  ( (Nil!34792) (Cons!34791 (h!36188 (_ BitVec 64)) (t!49489 List!34795)) )
))
(declare-fun arrayNoDuplicates!0 (array!100087 (_ BitVec 32) List!34795) Bool)

(assert (=> b!1500555 (= res!1021628 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34792))))

(declare-fun b!1500556 () Bool)

(assert (=> b!1500556 (= e!839629 e!839627)))

(declare-fun res!1021633 () Bool)

(assert (=> b!1500556 (=> (not res!1021633) (not e!839627))))

(assert (=> b!1500556 (= res!1021633 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652959 #b00000000000000000000000000000000) (bvslt lt!652959 (size!48853 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500556 (= lt!652959 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500557 () Bool)

(declare-fun res!1021631 () Bool)

(assert (=> b!1500557 (=> (not res!1021631) (not e!839629))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1500557 (= res!1021631 (and (= (size!48853 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48853 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48853 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500558 () Bool)

(declare-fun res!1021634 () Bool)

(assert (=> b!1500558 (=> (not res!1021634) (not e!839629))))

(assert (=> b!1500558 (= res!1021634 (not (= (select (arr!48303 a!2850) index!625) (select (arr!48303 a!2850) j!87))))))

(declare-fun b!1500559 () Bool)

(declare-fun res!1021629 () Bool)

(assert (=> b!1500559 (=> (not res!1021629) (not e!839629))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500559 (= res!1021629 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48853 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48853 a!2850)) (= (select (arr!48303 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48303 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48853 a!2850))))))

(declare-fun b!1500560 () Bool)

(declare-fun res!1021635 () Bool)

(assert (=> b!1500560 (=> (not res!1021635) (not e!839629))))

(assert (=> b!1500560 (= res!1021635 (validKeyInArray!0 (select (arr!48303 a!2850) i!996)))))

(assert (= (and start!127706 res!1021627) b!1500557))

(assert (= (and b!1500557 res!1021631) b!1500560))

(assert (= (and b!1500560 res!1021635) b!1500552))

(assert (= (and b!1500552 res!1021632) b!1500553))

(assert (= (and b!1500553 res!1021636) b!1500555))

(assert (= (and b!1500555 res!1021628) b!1500559))

(assert (= (and b!1500559 res!1021629) b!1500554))

(assert (= (and b!1500554 res!1021630) b!1500558))

(assert (= (and b!1500558 res!1021634) b!1500556))

(assert (= (and b!1500556 res!1021633) b!1500551))

(declare-fun m!1383745 () Bool)

(assert (=> b!1500552 m!1383745))

(assert (=> b!1500552 m!1383745))

(declare-fun m!1383747 () Bool)

(assert (=> b!1500552 m!1383747))

(declare-fun m!1383749 () Bool)

(assert (=> start!127706 m!1383749))

(declare-fun m!1383751 () Bool)

(assert (=> start!127706 m!1383751))

(declare-fun m!1383753 () Bool)

(assert (=> b!1500558 m!1383753))

(assert (=> b!1500558 m!1383745))

(assert (=> b!1500554 m!1383745))

(assert (=> b!1500554 m!1383745))

(declare-fun m!1383755 () Bool)

(assert (=> b!1500554 m!1383755))

(declare-fun m!1383757 () Bool)

(assert (=> b!1500559 m!1383757))

(declare-fun m!1383759 () Bool)

(assert (=> b!1500559 m!1383759))

(declare-fun m!1383761 () Bool)

(assert (=> b!1500559 m!1383761))

(declare-fun m!1383763 () Bool)

(assert (=> b!1500560 m!1383763))

(assert (=> b!1500560 m!1383763))

(declare-fun m!1383765 () Bool)

(assert (=> b!1500560 m!1383765))

(declare-fun m!1383767 () Bool)

(assert (=> b!1500556 m!1383767))

(declare-fun m!1383769 () Bool)

(assert (=> b!1500553 m!1383769))

(assert (=> b!1500551 m!1383745))

(assert (=> b!1500551 m!1383745))

(declare-fun m!1383771 () Bool)

(assert (=> b!1500551 m!1383771))

(declare-fun m!1383773 () Bool)

(assert (=> b!1500555 m!1383773))

(check-sat (not b!1500555) (not b!1500552) (not b!1500553) (not b!1500551) (not start!127706) (not b!1500554) (not b!1500560) (not b!1500556))
