; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127958 () Bool)

(assert start!127958)

(declare-fun b!1501640 () Bool)

(declare-fun res!1021538 () Bool)

(declare-fun e!840541 () Bool)

(assert (=> b!1501640 (=> (not res!1021538) (not e!840541))))

(declare-datatypes ((array!100153 0))(
  ( (array!100154 (arr!48331 (Array (_ BitVec 32) (_ BitVec 64))) (size!48882 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100153)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501640 (= res!1021538 (validKeyInArray!0 (select (arr!48331 a!2850) j!87)))))

(declare-fun b!1501641 () Bool)

(declare-fun res!1021541 () Bool)

(assert (=> b!1501641 (=> (not res!1021541) (not e!840541))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12434 0))(
  ( (MissingZero!12434 (index!52128 (_ BitVec 32))) (Found!12434 (index!52129 (_ BitVec 32))) (Intermediate!12434 (undefined!13246 Bool) (index!52130 (_ BitVec 32)) (x!134009 (_ BitVec 32))) (Undefined!12434) (MissingVacant!12434 (index!52131 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100153 (_ BitVec 32)) SeekEntryResult!12434)

(assert (=> b!1501641 (= res!1021541 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48331 a!2850) j!87) a!2850 mask!2661) (Found!12434 j!87)))))

(declare-fun b!1501642 () Bool)

(declare-fun res!1021533 () Bool)

(assert (=> b!1501642 (=> (not res!1021533) (not e!840541))))

(assert (=> b!1501642 (= res!1021533 (not (= (select (arr!48331 a!2850) index!625) (select (arr!48331 a!2850) j!87))))))

(declare-fun b!1501643 () Bool)

(declare-fun e!840542 () Bool)

(assert (=> b!1501643 (= e!840541 e!840542)))

(declare-fun res!1021534 () Bool)

(assert (=> b!1501643 (=> (not res!1021534) (not e!840542))))

(declare-fun lt!653474 () (_ BitVec 32))

(assert (=> b!1501643 (= res!1021534 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653474 #b00000000000000000000000000000000) (bvslt lt!653474 (size!48882 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501643 (= lt!653474 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501644 () Bool)

(declare-fun res!1021535 () Bool)

(assert (=> b!1501644 (=> (not res!1021535) (not e!840541))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501644 (= res!1021535 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48882 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48882 a!2850)) (= (select (arr!48331 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48331 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48882 a!2850))))))

(declare-fun res!1021532 () Bool)

(assert (=> start!127958 (=> (not res!1021532) (not e!840541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127958 (= res!1021532 (validMask!0 mask!2661))))

(assert (=> start!127958 e!840541))

(assert (=> start!127958 true))

(declare-fun array_inv!37612 (array!100153) Bool)

(assert (=> start!127958 (array_inv!37612 a!2850)))

(declare-fun b!1501639 () Bool)

(declare-fun res!1021540 () Bool)

(assert (=> b!1501639 (=> (not res!1021540) (not e!840541))))

(assert (=> b!1501639 (= res!1021540 (validKeyInArray!0 (select (arr!48331 a!2850) i!996)))))

(declare-fun b!1501645 () Bool)

(declare-fun res!1021536 () Bool)

(assert (=> b!1501645 (=> (not res!1021536) (not e!840541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100153 (_ BitVec 32)) Bool)

(assert (=> b!1501645 (= res!1021536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501646 () Bool)

(assert (=> b!1501646 (= e!840542 false)))

(declare-fun lt!653475 () SeekEntryResult!12434)

(assert (=> b!1501646 (= lt!653475 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653474 vacantBefore!10 (select (arr!48331 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501647 () Bool)

(declare-fun res!1021537 () Bool)

(assert (=> b!1501647 (=> (not res!1021537) (not e!840541))))

(assert (=> b!1501647 (= res!1021537 (and (= (size!48882 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48882 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48882 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501648 () Bool)

(declare-fun res!1021539 () Bool)

(assert (=> b!1501648 (=> (not res!1021539) (not e!840541))))

(declare-datatypes ((List!34810 0))(
  ( (Nil!34807) (Cons!34806 (h!36218 (_ BitVec 64)) (t!49496 List!34810)) )
))
(declare-fun arrayNoDuplicates!0 (array!100153 (_ BitVec 32) List!34810) Bool)

(assert (=> b!1501648 (= res!1021539 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34807))))

(assert (= (and start!127958 res!1021532) b!1501647))

(assert (= (and b!1501647 res!1021537) b!1501639))

(assert (= (and b!1501639 res!1021540) b!1501640))

(assert (= (and b!1501640 res!1021538) b!1501645))

(assert (= (and b!1501645 res!1021536) b!1501648))

(assert (= (and b!1501648 res!1021539) b!1501644))

(assert (= (and b!1501644 res!1021535) b!1501641))

(assert (= (and b!1501641 res!1021541) b!1501642))

(assert (= (and b!1501642 res!1021533) b!1501643))

(assert (= (and b!1501643 res!1021534) b!1501646))

(declare-fun m!1384783 () Bool)

(assert (=> b!1501639 m!1384783))

(assert (=> b!1501639 m!1384783))

(declare-fun m!1384785 () Bool)

(assert (=> b!1501639 m!1384785))

(declare-fun m!1384787 () Bool)

(assert (=> b!1501643 m!1384787))

(declare-fun m!1384789 () Bool)

(assert (=> b!1501642 m!1384789))

(declare-fun m!1384791 () Bool)

(assert (=> b!1501642 m!1384791))

(declare-fun m!1384793 () Bool)

(assert (=> b!1501648 m!1384793))

(declare-fun m!1384795 () Bool)

(assert (=> b!1501645 m!1384795))

(declare-fun m!1384797 () Bool)

(assert (=> start!127958 m!1384797))

(declare-fun m!1384799 () Bool)

(assert (=> start!127958 m!1384799))

(assert (=> b!1501640 m!1384791))

(assert (=> b!1501640 m!1384791))

(declare-fun m!1384801 () Bool)

(assert (=> b!1501640 m!1384801))

(assert (=> b!1501646 m!1384791))

(assert (=> b!1501646 m!1384791))

(declare-fun m!1384803 () Bool)

(assert (=> b!1501646 m!1384803))

(declare-fun m!1384805 () Bool)

(assert (=> b!1501644 m!1384805))

(declare-fun m!1384807 () Bool)

(assert (=> b!1501644 m!1384807))

(declare-fun m!1384809 () Bool)

(assert (=> b!1501644 m!1384809))

(assert (=> b!1501641 m!1384791))

(assert (=> b!1501641 m!1384791))

(declare-fun m!1384811 () Bool)

(assert (=> b!1501641 m!1384811))

(check-sat (not b!1501641) (not b!1501648) (not start!127958) (not b!1501640) (not b!1501643) (not b!1501639) (not b!1501645) (not b!1501646))
(check-sat)
