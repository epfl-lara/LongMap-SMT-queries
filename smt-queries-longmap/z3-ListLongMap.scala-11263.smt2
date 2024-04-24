; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131784 () Bool)

(assert start!131784)

(declare-fun b!1542745 () Bool)

(declare-fun res!1057860 () Bool)

(declare-fun e!858189 () Bool)

(assert (=> b!1542745 (=> (not res!1057860) (not e!858189))))

(declare-datatypes ((array!102440 0))(
  ( (array!102441 (arr!49423 (Array (_ BitVec 32) (_ BitVec 64))) (size!49974 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102440)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542745 (= res!1057860 (validKeyInArray!0 (select (arr!49423 a!2792) i!951)))))

(declare-fun b!1542746 () Bool)

(declare-fun e!858186 () Bool)

(declare-fun e!858190 () Bool)

(assert (=> b!1542746 (= e!858186 e!858190)))

(declare-fun res!1057866 () Bool)

(assert (=> b!1542746 (=> (not res!1057866) (not e!858190))))

(declare-fun lt!666207 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1542746 (= res!1057866 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666207 #b00000000000000000000000000000000) (bvslt lt!666207 (size!49974 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542746 (= lt!666207 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542747 () Bool)

(declare-fun res!1057869 () Bool)

(assert (=> b!1542747 (=> (not res!1057869) (not e!858189))))

(declare-datatypes ((List!35884 0))(
  ( (Nil!35881) (Cons!35880 (h!37343 (_ BitVec 64)) (t!50570 List!35884)) )
))
(declare-fun arrayNoDuplicates!0 (array!102440 (_ BitVec 32) List!35884) Bool)

(assert (=> b!1542747 (= res!1057869 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35881))))

(declare-fun res!1057864 () Bool)

(assert (=> start!131784 (=> (not res!1057864) (not e!858189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131784 (= res!1057864 (validMask!0 mask!2480))))

(assert (=> start!131784 e!858189))

(assert (=> start!131784 true))

(declare-fun array_inv!38704 (array!102440) Bool)

(assert (=> start!131784 (array_inv!38704 a!2792)))

(declare-fun b!1542748 () Bool)

(declare-fun e!858187 () Bool)

(assert (=> b!1542748 (= e!858187 (not true))))

(declare-datatypes ((SeekEntryResult!13444 0))(
  ( (MissingZero!13444 (index!56171 (_ BitVec 32))) (Found!13444 (index!56172 (_ BitVec 32))) (Intermediate!13444 (undefined!14256 Bool) (index!56173 (_ BitVec 32)) (x!138116 (_ BitVec 32))) (Undefined!13444) (MissingVacant!13444 (index!56174 (_ BitVec 32))) )
))
(declare-fun lt!666208 () SeekEntryResult!13444)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102440 (_ BitVec 32)) SeekEntryResult!13444)

(assert (=> b!1542748 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666207 vacantIndex!5 (select (store (arr!49423 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102441 (store (arr!49423 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49974 a!2792)) mask!2480) lt!666208)))

(declare-datatypes ((Unit!51361 0))(
  ( (Unit!51362) )
))
(declare-fun lt!666210 () Unit!51361)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51361)

(assert (=> b!1542748 (= lt!666210 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666207 vacantIndex!5 mask!2480))))

(declare-fun b!1542749 () Bool)

(declare-fun res!1057868 () Bool)

(assert (=> b!1542749 (=> (not res!1057868) (not e!858189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102440 (_ BitVec 32)) Bool)

(assert (=> b!1542749 (= res!1057868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542750 () Bool)

(declare-fun res!1057867 () Bool)

(assert (=> b!1542750 (=> (not res!1057867) (not e!858189))))

(assert (=> b!1542750 (= res!1057867 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49974 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49974 a!2792)) (= (select (arr!49423 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542751 () Bool)

(declare-fun res!1057861 () Bool)

(assert (=> b!1542751 (=> (not res!1057861) (not e!858189))))

(assert (=> b!1542751 (= res!1057861 (validKeyInArray!0 (select (arr!49423 a!2792) j!64)))))

(declare-fun b!1542752 () Bool)

(assert (=> b!1542752 (= e!858189 e!858186)))

(declare-fun res!1057862 () Bool)

(assert (=> b!1542752 (=> (not res!1057862) (not e!858186))))

(declare-fun lt!666209 () SeekEntryResult!13444)

(assert (=> b!1542752 (= res!1057862 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49423 a!2792) j!64) a!2792 mask!2480) lt!666209))))

(assert (=> b!1542752 (= lt!666209 (Found!13444 j!64))))

(declare-fun b!1542753 () Bool)

(declare-fun res!1057865 () Bool)

(assert (=> b!1542753 (=> (not res!1057865) (not e!858186))))

(assert (=> b!1542753 (= res!1057865 (not (= (select (arr!49423 a!2792) index!463) (select (arr!49423 a!2792) j!64))))))

(declare-fun b!1542754 () Bool)

(declare-fun res!1057863 () Bool)

(assert (=> b!1542754 (=> (not res!1057863) (not e!858189))))

(assert (=> b!1542754 (= res!1057863 (and (= (size!49974 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49974 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49974 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542755 () Bool)

(assert (=> b!1542755 (= e!858190 e!858187)))

(declare-fun res!1057859 () Bool)

(assert (=> b!1542755 (=> (not res!1057859) (not e!858187))))

(assert (=> b!1542755 (= res!1057859 (= lt!666208 lt!666209))))

(assert (=> b!1542755 (= lt!666208 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666207 vacantIndex!5 (select (arr!49423 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131784 res!1057864) b!1542754))

(assert (= (and b!1542754 res!1057863) b!1542745))

(assert (= (and b!1542745 res!1057860) b!1542751))

(assert (= (and b!1542751 res!1057861) b!1542749))

(assert (= (and b!1542749 res!1057868) b!1542747))

(assert (= (and b!1542747 res!1057869) b!1542750))

(assert (= (and b!1542750 res!1057867) b!1542752))

(assert (= (and b!1542752 res!1057862) b!1542753))

(assert (= (and b!1542753 res!1057865) b!1542746))

(assert (= (and b!1542746 res!1057866) b!1542755))

(assert (= (and b!1542755 res!1057859) b!1542748))

(declare-fun m!1424669 () Bool)

(assert (=> b!1542749 m!1424669))

(declare-fun m!1424671 () Bool)

(assert (=> b!1542755 m!1424671))

(assert (=> b!1542755 m!1424671))

(declare-fun m!1424673 () Bool)

(assert (=> b!1542755 m!1424673))

(assert (=> b!1542752 m!1424671))

(assert (=> b!1542752 m!1424671))

(declare-fun m!1424675 () Bool)

(assert (=> b!1542752 m!1424675))

(declare-fun m!1424677 () Bool)

(assert (=> b!1542745 m!1424677))

(assert (=> b!1542745 m!1424677))

(declare-fun m!1424679 () Bool)

(assert (=> b!1542745 m!1424679))

(assert (=> b!1542751 m!1424671))

(assert (=> b!1542751 m!1424671))

(declare-fun m!1424681 () Bool)

(assert (=> b!1542751 m!1424681))

(declare-fun m!1424683 () Bool)

(assert (=> b!1542748 m!1424683))

(declare-fun m!1424685 () Bool)

(assert (=> b!1542748 m!1424685))

(assert (=> b!1542748 m!1424685))

(declare-fun m!1424687 () Bool)

(assert (=> b!1542748 m!1424687))

(declare-fun m!1424689 () Bool)

(assert (=> b!1542748 m!1424689))

(declare-fun m!1424691 () Bool)

(assert (=> b!1542750 m!1424691))

(declare-fun m!1424693 () Bool)

(assert (=> start!131784 m!1424693))

(declare-fun m!1424695 () Bool)

(assert (=> start!131784 m!1424695))

(declare-fun m!1424697 () Bool)

(assert (=> b!1542753 m!1424697))

(assert (=> b!1542753 m!1424671))

(declare-fun m!1424699 () Bool)

(assert (=> b!1542747 m!1424699))

(declare-fun m!1424701 () Bool)

(assert (=> b!1542746 m!1424701))

(check-sat (not b!1542755) (not b!1542752) (not b!1542746) (not b!1542745) (not b!1542749) (not start!131784) (not b!1542747) (not b!1542748) (not b!1542751))
(check-sat)
