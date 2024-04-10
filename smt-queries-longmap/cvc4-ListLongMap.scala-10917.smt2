; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127768 () Bool)

(assert start!127768)

(declare-fun b!1501534 () Bool)

(declare-fun res!1022612 () Bool)

(declare-fun e!839960 () Bool)

(assert (=> b!1501534 (=> (not res!1022612) (not e!839960))))

(declare-datatypes ((array!100149 0))(
  ( (array!100150 (arr!48334 (Array (_ BitVec 32) (_ BitVec 64))) (size!48884 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100149)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501534 (= res!1022612 (validKeyInArray!0 (select (arr!48334 a!2850) j!87)))))

(declare-fun b!1501535 () Bool)

(declare-fun res!1022620 () Bool)

(assert (=> b!1501535 (=> (not res!1022620) (not e!839960))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501535 (= res!1022620 (validKeyInArray!0 (select (arr!48334 a!2850) i!996)))))

(declare-fun res!1022614 () Bool)

(assert (=> start!127768 (=> (not res!1022614) (not e!839960))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127768 (= res!1022614 (validMask!0 mask!2661))))

(assert (=> start!127768 e!839960))

(assert (=> start!127768 true))

(declare-fun array_inv!37362 (array!100149) Bool)

(assert (=> start!127768 (array_inv!37362 a!2850)))

(declare-fun b!1501536 () Bool)

(declare-fun e!839962 () Bool)

(declare-fun e!839959 () Bool)

(assert (=> b!1501536 (= e!839962 e!839959)))

(declare-fun res!1022617 () Bool)

(assert (=> b!1501536 (=> (not res!1022617) (not e!839959))))

(declare-fun lt!653200 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1501536 (= res!1022617 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653200 #b00000000000000000000000000000000) (bvslt lt!653200 (size!48884 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501536 (= lt!653200 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501537 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501537 (= e!839959 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(declare-datatypes ((SeekEntryResult!12544 0))(
  ( (MissingZero!12544 (index!52568 (_ BitVec 32))) (Found!12544 (index!52569 (_ BitVec 32))) (Intermediate!12544 (undefined!13356 Bool) (index!52570 (_ BitVec 32)) (x!134226 (_ BitVec 32))) (Undefined!12544) (MissingVacant!12544 (index!52571 (_ BitVec 32))) )
))
(declare-fun lt!653199 () SeekEntryResult!12544)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100149 (_ BitVec 32)) SeekEntryResult!12544)

(assert (=> b!1501537 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653200 vacantAfter!10 (select (store (arr!48334 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100150 (store (arr!48334 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48884 a!2850)) mask!2661) lt!653199)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50242 0))(
  ( (Unit!50243) )
))
(declare-fun lt!653198 () Unit!50242)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50242)

(assert (=> b!1501537 (= lt!653198 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653200 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501538 () Bool)

(assert (=> b!1501538 (= e!839960 e!839962)))

(declare-fun res!1022613 () Bool)

(assert (=> b!1501538 (=> (not res!1022613) (not e!839962))))

(assert (=> b!1501538 (= res!1022613 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48334 a!2850) j!87) a!2850 mask!2661) lt!653199))))

(assert (=> b!1501538 (= lt!653199 (Found!12544 j!87))))

(declare-fun b!1501539 () Bool)

(declare-fun res!1022618 () Bool)

(assert (=> b!1501539 (=> (not res!1022618) (not e!839960))))

(assert (=> b!1501539 (= res!1022618 (and (= (size!48884 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48884 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48884 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501540 () Bool)

(declare-fun res!1022610 () Bool)

(assert (=> b!1501540 (=> (not res!1022610) (not e!839962))))

(assert (=> b!1501540 (= res!1022610 (not (= (select (arr!48334 a!2850) index!625) (select (arr!48334 a!2850) j!87))))))

(declare-fun b!1501541 () Bool)

(declare-fun res!1022616 () Bool)

(assert (=> b!1501541 (=> (not res!1022616) (not e!839960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100149 (_ BitVec 32)) Bool)

(assert (=> b!1501541 (= res!1022616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501542 () Bool)

(declare-fun res!1022619 () Bool)

(assert (=> b!1501542 (=> (not res!1022619) (not e!839960))))

(declare-datatypes ((List!34826 0))(
  ( (Nil!34823) (Cons!34822 (h!36219 (_ BitVec 64)) (t!49520 List!34826)) )
))
(declare-fun arrayNoDuplicates!0 (array!100149 (_ BitVec 32) List!34826) Bool)

(assert (=> b!1501542 (= res!1022619 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34823))))

(declare-fun b!1501543 () Bool)

(declare-fun res!1022615 () Bool)

(assert (=> b!1501543 (=> (not res!1022615) (not e!839959))))

(assert (=> b!1501543 (= res!1022615 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653200 vacantBefore!10 (select (arr!48334 a!2850) j!87) a!2850 mask!2661) lt!653199))))

(declare-fun b!1501544 () Bool)

(declare-fun res!1022611 () Bool)

(assert (=> b!1501544 (=> (not res!1022611) (not e!839960))))

(assert (=> b!1501544 (= res!1022611 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48884 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48884 a!2850)) (= (select (arr!48334 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48334 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48884 a!2850))))))

(assert (= (and start!127768 res!1022614) b!1501539))

(assert (= (and b!1501539 res!1022618) b!1501535))

(assert (= (and b!1501535 res!1022620) b!1501534))

(assert (= (and b!1501534 res!1022612) b!1501541))

(assert (= (and b!1501541 res!1022616) b!1501542))

(assert (= (and b!1501542 res!1022619) b!1501544))

(assert (= (and b!1501544 res!1022611) b!1501538))

(assert (= (and b!1501538 res!1022613) b!1501540))

(assert (= (and b!1501540 res!1022610) b!1501536))

(assert (= (and b!1501536 res!1022617) b!1501543))

(assert (= (and b!1501543 res!1022615) b!1501537))

(declare-fun m!1384777 () Bool)

(assert (=> b!1501536 m!1384777))

(declare-fun m!1384779 () Bool)

(assert (=> b!1501537 m!1384779))

(declare-fun m!1384781 () Bool)

(assert (=> b!1501537 m!1384781))

(assert (=> b!1501537 m!1384781))

(declare-fun m!1384783 () Bool)

(assert (=> b!1501537 m!1384783))

(declare-fun m!1384785 () Bool)

(assert (=> b!1501537 m!1384785))

(declare-fun m!1384787 () Bool)

(assert (=> start!127768 m!1384787))

(declare-fun m!1384789 () Bool)

(assert (=> start!127768 m!1384789))

(declare-fun m!1384791 () Bool)

(assert (=> b!1501542 m!1384791))

(declare-fun m!1384793 () Bool)

(assert (=> b!1501543 m!1384793))

(assert (=> b!1501543 m!1384793))

(declare-fun m!1384795 () Bool)

(assert (=> b!1501543 m!1384795))

(declare-fun m!1384797 () Bool)

(assert (=> b!1501540 m!1384797))

(assert (=> b!1501540 m!1384793))

(assert (=> b!1501538 m!1384793))

(assert (=> b!1501538 m!1384793))

(declare-fun m!1384799 () Bool)

(assert (=> b!1501538 m!1384799))

(declare-fun m!1384801 () Bool)

(assert (=> b!1501541 m!1384801))

(declare-fun m!1384803 () Bool)

(assert (=> b!1501535 m!1384803))

(assert (=> b!1501535 m!1384803))

(declare-fun m!1384805 () Bool)

(assert (=> b!1501535 m!1384805))

(declare-fun m!1384807 () Bool)

(assert (=> b!1501544 m!1384807))

(assert (=> b!1501544 m!1384779))

(declare-fun m!1384809 () Bool)

(assert (=> b!1501544 m!1384809))

(assert (=> b!1501534 m!1384793))

(assert (=> b!1501534 m!1384793))

(declare-fun m!1384811 () Bool)

(assert (=> b!1501534 m!1384811))

(push 1)

(assert (not b!1501535))

(assert (not b!1501543))

(assert (not b!1501542))

(assert (not start!127768))

(assert (not b!1501538))

(assert (not b!1501534))

(assert (not b!1501537))

(assert (not b!1501541))

(assert (not b!1501536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

