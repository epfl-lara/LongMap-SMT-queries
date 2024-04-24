; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131778 () Bool)

(assert start!131778)

(declare-fun res!1057760 () Bool)

(declare-fun e!858145 () Bool)

(assert (=> start!131778 (=> (not res!1057760) (not e!858145))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131778 (= res!1057760 (validMask!0 mask!2480))))

(assert (=> start!131778 e!858145))

(assert (=> start!131778 true))

(declare-datatypes ((array!102434 0))(
  ( (array!102435 (arr!49420 (Array (_ BitVec 32) (_ BitVec 64))) (size!49971 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102434)

(declare-fun array_inv!38701 (array!102434) Bool)

(assert (=> start!131778 (array_inv!38701 a!2792)))

(declare-fun b!1542646 () Bool)

(declare-fun res!1057763 () Bool)

(assert (=> b!1542646 (=> (not res!1057763) (not e!858145))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1542646 (= res!1057763 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49971 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49971 a!2792)) (= (select (arr!49420 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542647 () Bool)

(declare-fun res!1057762 () Bool)

(assert (=> b!1542647 (=> (not res!1057762) (not e!858145))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542647 (= res!1057762 (validKeyInArray!0 (select (arr!49420 a!2792) i!951)))))

(declare-fun b!1542648 () Bool)

(declare-fun res!1057767 () Bool)

(assert (=> b!1542648 (=> (not res!1057767) (not e!858145))))

(declare-datatypes ((List!35881 0))(
  ( (Nil!35878) (Cons!35877 (h!37340 (_ BitVec 64)) (t!50567 List!35881)) )
))
(declare-fun arrayNoDuplicates!0 (array!102434 (_ BitVec 32) List!35881) Bool)

(assert (=> b!1542648 (= res!1057767 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35878))))

(declare-fun b!1542649 () Bool)

(declare-fun e!858141 () Bool)

(assert (=> b!1542649 (= e!858141 (not true))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!666173 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13441 0))(
  ( (MissingZero!13441 (index!56159 (_ BitVec 32))) (Found!13441 (index!56160 (_ BitVec 32))) (Intermediate!13441 (undefined!14253 Bool) (index!56161 (_ BitVec 32)) (x!138105 (_ BitVec 32))) (Undefined!13441) (MissingVacant!13441 (index!56162 (_ BitVec 32))) )
))
(declare-fun lt!666171 () SeekEntryResult!13441)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102434 (_ BitVec 32)) SeekEntryResult!13441)

(assert (=> b!1542649 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666173 vacantIndex!5 (select (store (arr!49420 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102435 (store (arr!49420 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49971 a!2792)) mask!2480) lt!666171)))

(declare-datatypes ((Unit!51355 0))(
  ( (Unit!51356) )
))
(declare-fun lt!666174 () Unit!51355)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51355)

(assert (=> b!1542649 (= lt!666174 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666173 vacantIndex!5 mask!2480))))

(declare-fun b!1542650 () Bool)

(declare-fun res!1057761 () Bool)

(declare-fun e!858144 () Bool)

(assert (=> b!1542650 (=> (not res!1057761) (not e!858144))))

(assert (=> b!1542650 (= res!1057761 (not (= (select (arr!49420 a!2792) index!463) (select (arr!49420 a!2792) j!64))))))

(declare-fun b!1542651 () Bool)

(declare-fun res!1057765 () Bool)

(assert (=> b!1542651 (=> (not res!1057765) (not e!858145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102434 (_ BitVec 32)) Bool)

(assert (=> b!1542651 (= res!1057765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542652 () Bool)

(assert (=> b!1542652 (= e!858145 e!858144)))

(declare-fun res!1057768 () Bool)

(assert (=> b!1542652 (=> (not res!1057768) (not e!858144))))

(declare-fun lt!666172 () SeekEntryResult!13441)

(assert (=> b!1542652 (= res!1057768 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49420 a!2792) j!64) a!2792 mask!2480) lt!666172))))

(assert (=> b!1542652 (= lt!666172 (Found!13441 j!64))))

(declare-fun b!1542653 () Bool)

(declare-fun e!858143 () Bool)

(assert (=> b!1542653 (= e!858144 e!858143)))

(declare-fun res!1057770 () Bool)

(assert (=> b!1542653 (=> (not res!1057770) (not e!858143))))

(assert (=> b!1542653 (= res!1057770 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666173 #b00000000000000000000000000000000) (bvslt lt!666173 (size!49971 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542653 (= lt!666173 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542654 () Bool)

(declare-fun res!1057766 () Bool)

(assert (=> b!1542654 (=> (not res!1057766) (not e!858145))))

(assert (=> b!1542654 (= res!1057766 (validKeyInArray!0 (select (arr!49420 a!2792) j!64)))))

(declare-fun b!1542655 () Bool)

(declare-fun res!1057769 () Bool)

(assert (=> b!1542655 (=> (not res!1057769) (not e!858145))))

(assert (=> b!1542655 (= res!1057769 (and (= (size!49971 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49971 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49971 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542656 () Bool)

(assert (=> b!1542656 (= e!858143 e!858141)))

(declare-fun res!1057764 () Bool)

(assert (=> b!1542656 (=> (not res!1057764) (not e!858141))))

(assert (=> b!1542656 (= res!1057764 (= lt!666171 lt!666172))))

(assert (=> b!1542656 (= lt!666171 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666173 vacantIndex!5 (select (arr!49420 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131778 res!1057760) b!1542655))

(assert (= (and b!1542655 res!1057769) b!1542647))

(assert (= (and b!1542647 res!1057762) b!1542654))

(assert (= (and b!1542654 res!1057766) b!1542651))

(assert (= (and b!1542651 res!1057765) b!1542648))

(assert (= (and b!1542648 res!1057767) b!1542646))

(assert (= (and b!1542646 res!1057763) b!1542652))

(assert (= (and b!1542652 res!1057768) b!1542650))

(assert (= (and b!1542650 res!1057761) b!1542653))

(assert (= (and b!1542653 res!1057770) b!1542656))

(assert (= (and b!1542656 res!1057764) b!1542649))

(declare-fun m!1424567 () Bool)

(assert (=> b!1542651 m!1424567))

(declare-fun m!1424569 () Bool)

(assert (=> b!1542654 m!1424569))

(assert (=> b!1542654 m!1424569))

(declare-fun m!1424571 () Bool)

(assert (=> b!1542654 m!1424571))

(declare-fun m!1424573 () Bool)

(assert (=> b!1542646 m!1424573))

(declare-fun m!1424575 () Bool)

(assert (=> b!1542653 m!1424575))

(declare-fun m!1424577 () Bool)

(assert (=> b!1542650 m!1424577))

(assert (=> b!1542650 m!1424569))

(assert (=> b!1542652 m!1424569))

(assert (=> b!1542652 m!1424569))

(declare-fun m!1424579 () Bool)

(assert (=> b!1542652 m!1424579))

(declare-fun m!1424581 () Bool)

(assert (=> b!1542648 m!1424581))

(declare-fun m!1424583 () Bool)

(assert (=> b!1542649 m!1424583))

(declare-fun m!1424585 () Bool)

(assert (=> b!1542649 m!1424585))

(assert (=> b!1542649 m!1424585))

(declare-fun m!1424587 () Bool)

(assert (=> b!1542649 m!1424587))

(declare-fun m!1424589 () Bool)

(assert (=> b!1542649 m!1424589))

(assert (=> b!1542656 m!1424569))

(assert (=> b!1542656 m!1424569))

(declare-fun m!1424591 () Bool)

(assert (=> b!1542656 m!1424591))

(declare-fun m!1424593 () Bool)

(assert (=> start!131778 m!1424593))

(declare-fun m!1424595 () Bool)

(assert (=> start!131778 m!1424595))

(declare-fun m!1424597 () Bool)

(assert (=> b!1542647 m!1424597))

(assert (=> b!1542647 m!1424597))

(declare-fun m!1424599 () Bool)

(assert (=> b!1542647 m!1424599))

(check-sat (not b!1542647) (not b!1542656) (not b!1542652) (not b!1542653) (not b!1542649) (not start!131778) (not b!1542648) (not b!1542654) (not b!1542651))
(check-sat)
