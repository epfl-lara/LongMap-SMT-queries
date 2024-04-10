; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131006 () Bool)

(assert start!131006)

(declare-fun b!1537033 () Bool)

(declare-fun res!1054125 () Bool)

(declare-fun e!855453 () Bool)

(assert (=> b!1537033 (=> (not res!1054125) (not e!855453))))

(declare-datatypes ((array!102104 0))(
  ( (array!102105 (arr!49268 (Array (_ BitVec 32) (_ BitVec 64))) (size!49818 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102104)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537033 (= res!1054125 (validKeyInArray!0 (select (arr!49268 a!2792) i!951)))))

(declare-fun b!1537034 () Bool)

(declare-fun res!1054121 () Bool)

(assert (=> b!1537034 (=> (not res!1054121) (not e!855453))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1537034 (= res!1054121 (and (= (size!49818 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49818 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49818 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537035 () Bool)

(declare-fun res!1054122 () Bool)

(declare-fun e!855456 () Bool)

(assert (=> b!1537035 (=> (not res!1054122) (not e!855456))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537035 (= res!1054122 (not (= (select (arr!49268 a!2792) index!463) (select (arr!49268 a!2792) j!64))))))

(declare-fun b!1537036 () Bool)

(declare-fun res!1054123 () Bool)

(assert (=> b!1537036 (=> (not res!1054123) (not e!855453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102104 (_ BitVec 32)) Bool)

(assert (=> b!1537036 (= res!1054123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537037 () Bool)

(declare-fun res!1054119 () Bool)

(assert (=> b!1537037 (=> (not res!1054119) (not e!855453))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1537037 (= res!1054119 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49818 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49818 a!2792)) (= (select (arr!49268 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537038 () Bool)

(declare-fun e!855457 () Bool)

(declare-fun e!855454 () Bool)

(assert (=> b!1537038 (= e!855457 e!855454)))

(declare-fun res!1054120 () Bool)

(assert (=> b!1537038 (=> (not res!1054120) (not e!855454))))

(declare-datatypes ((SeekEntryResult!13400 0))(
  ( (MissingZero!13400 (index!55995 (_ BitVec 32))) (Found!13400 (index!55996 (_ BitVec 32))) (Intermediate!13400 (undefined!14212 Bool) (index!55997 (_ BitVec 32)) (x!137730 (_ BitVec 32))) (Undefined!13400) (MissingVacant!13400 (index!55998 (_ BitVec 32))) )
))
(declare-fun lt!664567 () SeekEntryResult!13400)

(declare-fun lt!664570 () SeekEntryResult!13400)

(assert (=> b!1537038 (= res!1054120 (= lt!664567 lt!664570))))

(declare-fun lt!664569 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102104 (_ BitVec 32)) SeekEntryResult!13400)

(assert (=> b!1537038 (= lt!664567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664569 vacantIndex!5 (select (arr!49268 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537039 () Bool)

(assert (=> b!1537039 (= e!855454 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(assert (=> b!1537039 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664569 vacantIndex!5 (select (store (arr!49268 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102105 (store (arr!49268 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49818 a!2792)) mask!2480) lt!664567)))

(declare-datatypes ((Unit!51372 0))(
  ( (Unit!51373) )
))
(declare-fun lt!664568 () Unit!51372)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51372)

(assert (=> b!1537039 (= lt!664568 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664569 vacantIndex!5 mask!2480))))

(declare-fun b!1537040 () Bool)

(assert (=> b!1537040 (= e!855456 e!855457)))

(declare-fun res!1054126 () Bool)

(assert (=> b!1537040 (=> (not res!1054126) (not e!855457))))

(assert (=> b!1537040 (= res!1054126 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664569 #b00000000000000000000000000000000) (bvslt lt!664569 (size!49818 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537040 (= lt!664569 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537042 () Bool)

(declare-fun res!1054124 () Bool)

(assert (=> b!1537042 (=> (not res!1054124) (not e!855453))))

(declare-datatypes ((List!35742 0))(
  ( (Nil!35739) (Cons!35738 (h!37183 (_ BitVec 64)) (t!50436 List!35742)) )
))
(declare-fun arrayNoDuplicates!0 (array!102104 (_ BitVec 32) List!35742) Bool)

(assert (=> b!1537042 (= res!1054124 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35739))))

(declare-fun b!1537043 () Bool)

(assert (=> b!1537043 (= e!855453 e!855456)))

(declare-fun res!1054127 () Bool)

(assert (=> b!1537043 (=> (not res!1054127) (not e!855456))))

(assert (=> b!1537043 (= res!1054127 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49268 a!2792) j!64) a!2792 mask!2480) lt!664570))))

(assert (=> b!1537043 (= lt!664570 (Found!13400 j!64))))

(declare-fun b!1537041 () Bool)

(declare-fun res!1054129 () Bool)

(assert (=> b!1537041 (=> (not res!1054129) (not e!855453))))

(assert (=> b!1537041 (= res!1054129 (validKeyInArray!0 (select (arr!49268 a!2792) j!64)))))

(declare-fun res!1054128 () Bool)

(assert (=> start!131006 (=> (not res!1054128) (not e!855453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131006 (= res!1054128 (validMask!0 mask!2480))))

(assert (=> start!131006 e!855453))

(assert (=> start!131006 true))

(declare-fun array_inv!38296 (array!102104) Bool)

(assert (=> start!131006 (array_inv!38296 a!2792)))

(assert (= (and start!131006 res!1054128) b!1537034))

(assert (= (and b!1537034 res!1054121) b!1537033))

(assert (= (and b!1537033 res!1054125) b!1537041))

(assert (= (and b!1537041 res!1054129) b!1537036))

(assert (= (and b!1537036 res!1054123) b!1537042))

(assert (= (and b!1537042 res!1054124) b!1537037))

(assert (= (and b!1537037 res!1054119) b!1537043))

(assert (= (and b!1537043 res!1054127) b!1537035))

(assert (= (and b!1537035 res!1054122) b!1537040))

(assert (= (and b!1537040 res!1054126) b!1537038))

(assert (= (and b!1537038 res!1054120) b!1537039))

(declare-fun m!1419525 () Bool)

(assert (=> b!1537033 m!1419525))

(assert (=> b!1537033 m!1419525))

(declare-fun m!1419527 () Bool)

(assert (=> b!1537033 m!1419527))

(declare-fun m!1419529 () Bool)

(assert (=> b!1537040 m!1419529))

(declare-fun m!1419531 () Bool)

(assert (=> start!131006 m!1419531))

(declare-fun m!1419533 () Bool)

(assert (=> start!131006 m!1419533))

(declare-fun m!1419535 () Bool)

(assert (=> b!1537035 m!1419535))

(declare-fun m!1419537 () Bool)

(assert (=> b!1537035 m!1419537))

(declare-fun m!1419539 () Bool)

(assert (=> b!1537036 m!1419539))

(assert (=> b!1537041 m!1419537))

(assert (=> b!1537041 m!1419537))

(declare-fun m!1419541 () Bool)

(assert (=> b!1537041 m!1419541))

(declare-fun m!1419543 () Bool)

(assert (=> b!1537037 m!1419543))

(assert (=> b!1537038 m!1419537))

(assert (=> b!1537038 m!1419537))

(declare-fun m!1419545 () Bool)

(assert (=> b!1537038 m!1419545))

(assert (=> b!1537043 m!1419537))

(assert (=> b!1537043 m!1419537))

(declare-fun m!1419547 () Bool)

(assert (=> b!1537043 m!1419547))

(declare-fun m!1419549 () Bool)

(assert (=> b!1537042 m!1419549))

(declare-fun m!1419551 () Bool)

(assert (=> b!1537039 m!1419551))

(declare-fun m!1419553 () Bool)

(assert (=> b!1537039 m!1419553))

(assert (=> b!1537039 m!1419553))

(declare-fun m!1419555 () Bool)

(assert (=> b!1537039 m!1419555))

(declare-fun m!1419557 () Bool)

(assert (=> b!1537039 m!1419557))

(push 1)

(assert (not b!1537036))

(assert (not b!1537040))

(assert (not b!1537039))

(assert (not b!1537038))

(assert (not b!1537041))

(assert (not b!1537043))

(assert (not b!1537042))

(assert (not start!131006))

(assert (not b!1537033))

(check-sat)

(pop 1)

(push 1)

(check-sat)

