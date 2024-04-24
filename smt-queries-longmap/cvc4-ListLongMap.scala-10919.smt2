; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128080 () Bool)

(assert start!128080)

(declare-fun b!1503542 () Bool)

(declare-fun e!841163 () Bool)

(declare-fun e!841165 () Bool)

(assert (=> b!1503542 (= e!841163 e!841165)))

(declare-fun res!1023444 () Bool)

(assert (=> b!1503542 (=> (not res!1023444) (not e!841165))))

(declare-datatypes ((array!100275 0))(
  ( (array!100276 (arr!48392 (Array (_ BitVec 32) (_ BitVec 64))) (size!48943 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100275)

(declare-fun lt!653908 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1503542 (= res!1023444 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653908 #b00000000000000000000000000000000) (bvslt lt!653908 (size!48943 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503542 (= lt!653908 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1503543 () Bool)

(declare-fun e!841167 () Bool)

(assert (=> b!1503543 (= e!841167 e!841163)))

(declare-fun res!1023435 () Bool)

(assert (=> b!1503543 (=> (not res!1023435) (not e!841163))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12495 0))(
  ( (MissingZero!12495 (index!52372 (_ BitVec 32))) (Found!12495 (index!52373 (_ BitVec 32))) (Intermediate!12495 (undefined!13307 Bool) (index!52374 (_ BitVec 32)) (x!134230 (_ BitVec 32))) (Undefined!12495) (MissingVacant!12495 (index!52375 (_ BitVec 32))) )
))
(declare-fun lt!653910 () SeekEntryResult!12495)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100275 (_ BitVec 32)) SeekEntryResult!12495)

(assert (=> b!1503543 (= res!1023435 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48392 a!2850) j!87) a!2850 mask!2661) lt!653910))))

(assert (=> b!1503543 (= lt!653910 (Found!12495 j!87))))

(declare-fun b!1503544 () Bool)

(declare-fun res!1023446 () Bool)

(assert (=> b!1503544 (=> (not res!1023446) (not e!841163))))

(assert (=> b!1503544 (= res!1023446 (not (= (select (arr!48392 a!2850) index!625) (select (arr!48392 a!2850) j!87))))))

(declare-fun b!1503545 () Bool)

(declare-fun res!1023438 () Bool)

(assert (=> b!1503545 (=> (not res!1023438) (not e!841167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503545 (= res!1023438 (validKeyInArray!0 (select (arr!48392 a!2850) j!87)))))

(declare-fun b!1503546 () Bool)

(declare-fun res!1023441 () Bool)

(assert (=> b!1503546 (=> (not res!1023441) (not e!841165))))

(assert (=> b!1503546 (= res!1023441 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 (select (arr!48392 a!2850) j!87) a!2850 mask!2661) lt!653910))))

(declare-fun res!1023443 () Bool)

(assert (=> start!128080 (=> (not res!1023443) (not e!841167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128080 (= res!1023443 (validMask!0 mask!2661))))

(assert (=> start!128080 e!841167))

(assert (=> start!128080 true))

(declare-fun array_inv!37673 (array!100275) Bool)

(assert (=> start!128080 (array_inv!37673 a!2850)))

(declare-fun b!1503547 () Bool)

(declare-fun res!1023442 () Bool)

(assert (=> b!1503547 (=> (not res!1023442) (not e!841167))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503547 (= res!1023442 (and (= (size!48943 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48943 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48943 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503548 () Bool)

(declare-fun res!1023439 () Bool)

(assert (=> b!1503548 (=> (not res!1023439) (not e!841167))))

(assert (=> b!1503548 (= res!1023439 (validKeyInArray!0 (select (arr!48392 a!2850) i!996)))))

(declare-fun b!1503549 () Bool)

(declare-fun res!1023445 () Bool)

(assert (=> b!1503549 (=> (not res!1023445) (not e!841167))))

(declare-datatypes ((List!34871 0))(
  ( (Nil!34868) (Cons!34867 (h!36279 (_ BitVec 64)) (t!49557 List!34871)) )
))
(declare-fun arrayNoDuplicates!0 (array!100275 (_ BitVec 32) List!34871) Bool)

(assert (=> b!1503549 (= res!1023445 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34868))))

(declare-fun b!1503550 () Bool)

(declare-fun res!1023437 () Bool)

(assert (=> b!1503550 (=> (not res!1023437) (not e!841167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100275 (_ BitVec 32)) Bool)

(assert (=> b!1503550 (= res!1023437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503551 () Bool)

(declare-fun e!841166 () Bool)

(assert (=> b!1503551 (= e!841166 (validKeyInArray!0 (select (store (arr!48392 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)))))

(declare-fun b!1503552 () Bool)

(declare-fun res!1023440 () Bool)

(assert (=> b!1503552 (=> (not res!1023440) (not e!841167))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503552 (= res!1023440 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48943 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48943 a!2850)) (= (select (arr!48392 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48392 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48943 a!2850))))))

(declare-fun b!1503553 () Bool)

(assert (=> b!1503553 (= e!841165 (not e!841166))))

(declare-fun res!1023436 () Bool)

(assert (=> b!1503553 (=> res!1023436 e!841166)))

(assert (=> b!1503553 (= res!1023436 (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (=> b!1503553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantAfter!10 (select (store (arr!48392 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100276 (store (arr!48392 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48943 a!2850)) mask!2661) lt!653910)))

(declare-datatypes ((Unit!50181 0))(
  ( (Unit!50182) )
))
(declare-fun lt!653909 () Unit!50181)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50181)

(assert (=> b!1503553 (= lt!653909 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653908 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (= (and start!128080 res!1023443) b!1503547))

(assert (= (and b!1503547 res!1023442) b!1503548))

(assert (= (and b!1503548 res!1023439) b!1503545))

(assert (= (and b!1503545 res!1023438) b!1503550))

(assert (= (and b!1503550 res!1023437) b!1503549))

(assert (= (and b!1503549 res!1023445) b!1503552))

(assert (= (and b!1503552 res!1023440) b!1503543))

(assert (= (and b!1503543 res!1023435) b!1503544))

(assert (= (and b!1503544 res!1023446) b!1503542))

(assert (= (and b!1503542 res!1023444) b!1503546))

(assert (= (and b!1503546 res!1023441) b!1503553))

(assert (= (and b!1503553 (not res!1023436)) b!1503551))

(declare-fun m!1386747 () Bool)

(assert (=> b!1503551 m!1386747))

(declare-fun m!1386749 () Bool)

(assert (=> b!1503551 m!1386749))

(assert (=> b!1503551 m!1386749))

(declare-fun m!1386751 () Bool)

(assert (=> b!1503551 m!1386751))

(declare-fun m!1386753 () Bool)

(assert (=> b!1503546 m!1386753))

(assert (=> b!1503546 m!1386753))

(declare-fun m!1386755 () Bool)

(assert (=> b!1503546 m!1386755))

(assert (=> b!1503553 m!1386747))

(assert (=> b!1503553 m!1386749))

(assert (=> b!1503553 m!1386749))

(declare-fun m!1386757 () Bool)

(assert (=> b!1503553 m!1386757))

(declare-fun m!1386759 () Bool)

(assert (=> b!1503553 m!1386759))

(declare-fun m!1386761 () Bool)

(assert (=> b!1503550 m!1386761))

(assert (=> b!1503545 m!1386753))

(assert (=> b!1503545 m!1386753))

(declare-fun m!1386763 () Bool)

(assert (=> b!1503545 m!1386763))

(declare-fun m!1386765 () Bool)

(assert (=> b!1503548 m!1386765))

(assert (=> b!1503548 m!1386765))

(declare-fun m!1386767 () Bool)

(assert (=> b!1503548 m!1386767))

(declare-fun m!1386769 () Bool)

(assert (=> b!1503542 m!1386769))

(declare-fun m!1386771 () Bool)

(assert (=> b!1503544 m!1386771))

(assert (=> b!1503544 m!1386753))

(declare-fun m!1386773 () Bool)

(assert (=> b!1503552 m!1386773))

(assert (=> b!1503552 m!1386747))

(declare-fun m!1386775 () Bool)

(assert (=> b!1503552 m!1386775))

(declare-fun m!1386777 () Bool)

(assert (=> start!128080 m!1386777))

(declare-fun m!1386779 () Bool)

(assert (=> start!128080 m!1386779))

(declare-fun m!1386781 () Bool)

(assert (=> b!1503549 m!1386781))

(assert (=> b!1503543 m!1386753))

(assert (=> b!1503543 m!1386753))

(declare-fun m!1386783 () Bool)

(assert (=> b!1503543 m!1386783))

(push 1)

(assert (not b!1503550))

(assert (not start!128080))

(assert (not b!1503549))

(assert (not b!1503543))

(assert (not b!1503551))

(assert (not b!1503542))

(assert (not b!1503553))

(assert (not b!1503545))

(assert (not b!1503548))

(assert (not b!1503546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

