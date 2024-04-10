; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127766 () Bool)

(assert start!127766)

(declare-fun b!1501501 () Bool)

(declare-fun e!839948 () Bool)

(declare-fun e!839949 () Bool)

(assert (=> b!1501501 (= e!839948 e!839949)))

(declare-fun res!1022586 () Bool)

(assert (=> b!1501501 (=> (not res!1022586) (not e!839949))))

(declare-datatypes ((array!100147 0))(
  ( (array!100148 (arr!48333 (Array (_ BitVec 32) (_ BitVec 64))) (size!48883 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100147)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653190 () (_ BitVec 32))

(assert (=> b!1501501 (= res!1022586 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653190 #b00000000000000000000000000000000) (bvslt lt!653190 (size!48883 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501501 (= lt!653190 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501502 () Bool)

(declare-fun e!839950 () Bool)

(assert (=> b!1501502 (= e!839950 e!839948)))

(declare-fun res!1022577 () Bool)

(assert (=> b!1501502 (=> (not res!1022577) (not e!839948))))

(declare-datatypes ((SeekEntryResult!12543 0))(
  ( (MissingZero!12543 (index!52564 (_ BitVec 32))) (Found!12543 (index!52565 (_ BitVec 32))) (Intermediate!12543 (undefined!13355 Bool) (index!52566 (_ BitVec 32)) (x!134225 (_ BitVec 32))) (Undefined!12543) (MissingVacant!12543 (index!52567 (_ BitVec 32))) )
))
(declare-fun lt!653191 () SeekEntryResult!12543)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100147 (_ BitVec 32)) SeekEntryResult!12543)

(assert (=> b!1501502 (= res!1022577 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48333 a!2850) j!87) a!2850 mask!2661) lt!653191))))

(assert (=> b!1501502 (= lt!653191 (Found!12543 j!87))))

(declare-fun b!1501503 () Bool)

(declare-fun res!1022583 () Bool)

(assert (=> b!1501503 (=> (not res!1022583) (not e!839950))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501503 (= res!1022583 (validKeyInArray!0 (select (arr!48333 a!2850) i!996)))))

(declare-fun b!1501504 () Bool)

(declare-fun res!1022578 () Bool)

(assert (=> b!1501504 (=> (not res!1022578) (not e!839948))))

(assert (=> b!1501504 (= res!1022578 (not (= (select (arr!48333 a!2850) index!625) (select (arr!48333 a!2850) j!87))))))

(declare-fun b!1501505 () Bool)

(declare-fun res!1022580 () Bool)

(assert (=> b!1501505 (=> (not res!1022580) (not e!839950))))

(declare-datatypes ((List!34825 0))(
  ( (Nil!34822) (Cons!34821 (h!36218 (_ BitVec 64)) (t!49519 List!34825)) )
))
(declare-fun arrayNoDuplicates!0 (array!100147 (_ BitVec 32) List!34825) Bool)

(assert (=> b!1501505 (= res!1022580 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34822))))

(declare-fun b!1501506 () Bool)

(declare-fun res!1022582 () Bool)

(assert (=> b!1501506 (=> (not res!1022582) (not e!839950))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501506 (= res!1022582 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48883 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48883 a!2850)) (= (select (arr!48333 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48333 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48883 a!2850))))))

(declare-fun b!1501508 () Bool)

(declare-fun res!1022587 () Bool)

(assert (=> b!1501508 (=> (not res!1022587) (not e!839950))))

(assert (=> b!1501508 (= res!1022587 (and (= (size!48883 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48883 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48883 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501509 () Bool)

(assert (=> b!1501509 (= e!839949 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(assert (=> b!1501509 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653190 vacantAfter!10 (select (store (arr!48333 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100148 (store (arr!48333 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48883 a!2850)) mask!2661) lt!653191)))

(declare-datatypes ((Unit!50240 0))(
  ( (Unit!50241) )
))
(declare-fun lt!653189 () Unit!50240)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50240)

(assert (=> b!1501509 (= lt!653189 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653190 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501510 () Bool)

(declare-fun res!1022584 () Bool)

(assert (=> b!1501510 (=> (not res!1022584) (not e!839949))))

(assert (=> b!1501510 (= res!1022584 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653190 vacantBefore!10 (select (arr!48333 a!2850) j!87) a!2850 mask!2661) lt!653191))))

(declare-fun b!1501511 () Bool)

(declare-fun res!1022585 () Bool)

(assert (=> b!1501511 (=> (not res!1022585) (not e!839950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100147 (_ BitVec 32)) Bool)

(assert (=> b!1501511 (= res!1022585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501507 () Bool)

(declare-fun res!1022581 () Bool)

(assert (=> b!1501507 (=> (not res!1022581) (not e!839950))))

(assert (=> b!1501507 (= res!1022581 (validKeyInArray!0 (select (arr!48333 a!2850) j!87)))))

(declare-fun res!1022579 () Bool)

(assert (=> start!127766 (=> (not res!1022579) (not e!839950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127766 (= res!1022579 (validMask!0 mask!2661))))

(assert (=> start!127766 e!839950))

(assert (=> start!127766 true))

(declare-fun array_inv!37361 (array!100147) Bool)

(assert (=> start!127766 (array_inv!37361 a!2850)))

(assert (= (and start!127766 res!1022579) b!1501508))

(assert (= (and b!1501508 res!1022587) b!1501503))

(assert (= (and b!1501503 res!1022583) b!1501507))

(assert (= (and b!1501507 res!1022581) b!1501511))

(assert (= (and b!1501511 res!1022585) b!1501505))

(assert (= (and b!1501505 res!1022580) b!1501506))

(assert (= (and b!1501506 res!1022582) b!1501502))

(assert (= (and b!1501502 res!1022577) b!1501504))

(assert (= (and b!1501504 res!1022578) b!1501501))

(assert (= (and b!1501501 res!1022586) b!1501510))

(assert (= (and b!1501510 res!1022584) b!1501509))

(declare-fun m!1384741 () Bool)

(assert (=> b!1501510 m!1384741))

(assert (=> b!1501510 m!1384741))

(declare-fun m!1384743 () Bool)

(assert (=> b!1501510 m!1384743))

(declare-fun m!1384745 () Bool)

(assert (=> b!1501504 m!1384745))

(assert (=> b!1501504 m!1384741))

(declare-fun m!1384747 () Bool)

(assert (=> b!1501503 m!1384747))

(assert (=> b!1501503 m!1384747))

(declare-fun m!1384749 () Bool)

(assert (=> b!1501503 m!1384749))

(declare-fun m!1384751 () Bool)

(assert (=> b!1501505 m!1384751))

(declare-fun m!1384753 () Bool)

(assert (=> b!1501511 m!1384753))

(declare-fun m!1384755 () Bool)

(assert (=> b!1501506 m!1384755))

(declare-fun m!1384757 () Bool)

(assert (=> b!1501506 m!1384757))

(declare-fun m!1384759 () Bool)

(assert (=> b!1501506 m!1384759))

(declare-fun m!1384761 () Bool)

(assert (=> start!127766 m!1384761))

(declare-fun m!1384763 () Bool)

(assert (=> start!127766 m!1384763))

(assert (=> b!1501509 m!1384757))

(declare-fun m!1384765 () Bool)

(assert (=> b!1501509 m!1384765))

(assert (=> b!1501509 m!1384765))

(declare-fun m!1384767 () Bool)

(assert (=> b!1501509 m!1384767))

(declare-fun m!1384769 () Bool)

(assert (=> b!1501509 m!1384769))

(assert (=> b!1501507 m!1384741))

(assert (=> b!1501507 m!1384741))

(declare-fun m!1384771 () Bool)

(assert (=> b!1501507 m!1384771))

(declare-fun m!1384773 () Bool)

(assert (=> b!1501501 m!1384773))

(assert (=> b!1501502 m!1384741))

(assert (=> b!1501502 m!1384741))

(declare-fun m!1384775 () Bool)

(assert (=> b!1501502 m!1384775))

(check-sat (not b!1501507) (not b!1501505) (not b!1501509) (not start!127766) (not b!1501511) (not b!1501501) (not b!1501510) (not b!1501502) (not b!1501503))
(check-sat)
