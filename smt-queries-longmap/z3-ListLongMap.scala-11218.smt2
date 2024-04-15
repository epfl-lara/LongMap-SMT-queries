; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130890 () Bool)

(assert start!130890)

(declare-fun res!1052897 () Bool)

(declare-fun e!854751 () Bool)

(assert (=> start!130890 (=> (not res!1052897) (not e!854751))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130890 (= res!1052897 (validMask!0 mask!2480))))

(assert (=> start!130890 e!854751))

(assert (=> start!130890 true))

(declare-datatypes ((array!101986 0))(
  ( (array!101987 (arr!49210 (Array (_ BitVec 32) (_ BitVec 64))) (size!49762 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101986)

(declare-fun array_inv!38443 (array!101986) Bool)

(assert (=> start!130890 (array_inv!38443 a!2792)))

(declare-fun b!1535622 () Bool)

(declare-fun res!1052902 () Bool)

(assert (=> b!1535622 (=> (not res!1052902) (not e!854751))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535622 (= res!1052902 (validKeyInArray!0 (select (arr!49210 a!2792) i!951)))))

(declare-fun b!1535623 () Bool)

(declare-fun res!1052899 () Bool)

(assert (=> b!1535623 (=> (not res!1052899) (not e!854751))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535623 (= res!1052899 (validKeyInArray!0 (select (arr!49210 a!2792) j!64)))))

(declare-fun b!1535624 () Bool)

(declare-fun e!854755 () Bool)

(assert (=> b!1535624 (= e!854751 e!854755)))

(declare-fun res!1052896 () Bool)

(assert (=> b!1535624 (=> (not res!1052896) (not e!854755))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13367 0))(
  ( (MissingZero!13367 (index!55863 (_ BitVec 32))) (Found!13367 (index!55864 (_ BitVec 32))) (Intermediate!13367 (undefined!14179 Bool) (index!55865 (_ BitVec 32)) (x!137604 (_ BitVec 32))) (Undefined!13367) (MissingVacant!13367 (index!55866 (_ BitVec 32))) )
))
(declare-fun lt!663879 () SeekEntryResult!13367)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101986 (_ BitVec 32)) SeekEntryResult!13367)

(assert (=> b!1535624 (= res!1052896 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49210 a!2792) j!64) a!2792 mask!2480) lt!663879))))

(assert (=> b!1535624 (= lt!663879 (Found!13367 j!64))))

(declare-fun b!1535625 () Bool)

(declare-fun e!854753 () Bool)

(assert (=> b!1535625 (= e!854753 (not true))))

(declare-fun lt!663877 () (_ BitVec 32))

(declare-fun lt!663878 () SeekEntryResult!13367)

(assert (=> b!1535625 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663877 vacantIndex!5 (select (store (arr!49210 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!101987 (store (arr!49210 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49762 a!2792)) mask!2480) lt!663878)))

(declare-datatypes ((Unit!51141 0))(
  ( (Unit!51142) )
))
(declare-fun lt!663876 () Unit!51141)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51141)

(assert (=> b!1535625 (= lt!663876 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!663877 vacantIndex!5 mask!2480))))

(declare-fun b!1535626 () Bool)

(declare-fun res!1052894 () Bool)

(assert (=> b!1535626 (=> (not res!1052894) (not e!854751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101986 (_ BitVec 32)) Bool)

(assert (=> b!1535626 (= res!1052894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535627 () Bool)

(declare-fun e!854752 () Bool)

(assert (=> b!1535627 (= e!854752 e!854753)))

(declare-fun res!1052898 () Bool)

(assert (=> b!1535627 (=> (not res!1052898) (not e!854753))))

(assert (=> b!1535627 (= res!1052898 (= lt!663878 lt!663879))))

(assert (=> b!1535627 (= lt!663878 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663877 vacantIndex!5 (select (arr!49210 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535628 () Bool)

(declare-fun res!1052893 () Bool)

(assert (=> b!1535628 (=> (not res!1052893) (not e!854755))))

(assert (=> b!1535628 (= res!1052893 (not (= (select (arr!49210 a!2792) index!463) (select (arr!49210 a!2792) j!64))))))

(declare-fun b!1535629 () Bool)

(declare-fun res!1052901 () Bool)

(assert (=> b!1535629 (=> (not res!1052901) (not e!854751))))

(assert (=> b!1535629 (= res!1052901 (and (= (size!49762 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49762 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49762 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535630 () Bool)

(declare-fun res!1052892 () Bool)

(assert (=> b!1535630 (=> (not res!1052892) (not e!854751))))

(assert (=> b!1535630 (= res!1052892 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49762 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49762 a!2792)) (= (select (arr!49210 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535631 () Bool)

(assert (=> b!1535631 (= e!854755 e!854752)))

(declare-fun res!1052900 () Bool)

(assert (=> b!1535631 (=> (not res!1052900) (not e!854752))))

(assert (=> b!1535631 (= res!1052900 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663877 #b00000000000000000000000000000000) (bvslt lt!663877 (size!49762 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535631 (= lt!663877 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535632 () Bool)

(declare-fun res!1052895 () Bool)

(assert (=> b!1535632 (=> (not res!1052895) (not e!854751))))

(declare-datatypes ((List!35762 0))(
  ( (Nil!35759) (Cons!35758 (h!37204 (_ BitVec 64)) (t!50448 List!35762)) )
))
(declare-fun arrayNoDuplicates!0 (array!101986 (_ BitVec 32) List!35762) Bool)

(assert (=> b!1535632 (= res!1052895 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35759))))

(assert (= (and start!130890 res!1052897) b!1535629))

(assert (= (and b!1535629 res!1052901) b!1535622))

(assert (= (and b!1535622 res!1052902) b!1535623))

(assert (= (and b!1535623 res!1052899) b!1535626))

(assert (= (and b!1535626 res!1052894) b!1535632))

(assert (= (and b!1535632 res!1052895) b!1535630))

(assert (= (and b!1535630 res!1052892) b!1535624))

(assert (= (and b!1535624 res!1052896) b!1535628))

(assert (= (and b!1535628 res!1052893) b!1535631))

(assert (= (and b!1535631 res!1052900) b!1535627))

(assert (= (and b!1535627 res!1052898) b!1535625))

(declare-fun m!1417493 () Bool)

(assert (=> b!1535632 m!1417493))

(declare-fun m!1417495 () Bool)

(assert (=> b!1535627 m!1417495))

(assert (=> b!1535627 m!1417495))

(declare-fun m!1417497 () Bool)

(assert (=> b!1535627 m!1417497))

(declare-fun m!1417499 () Bool)

(assert (=> b!1535625 m!1417499))

(declare-fun m!1417501 () Bool)

(assert (=> b!1535625 m!1417501))

(assert (=> b!1535625 m!1417501))

(declare-fun m!1417503 () Bool)

(assert (=> b!1535625 m!1417503))

(declare-fun m!1417505 () Bool)

(assert (=> b!1535625 m!1417505))

(assert (=> b!1535624 m!1417495))

(assert (=> b!1535624 m!1417495))

(declare-fun m!1417507 () Bool)

(assert (=> b!1535624 m!1417507))

(declare-fun m!1417509 () Bool)

(assert (=> b!1535626 m!1417509))

(declare-fun m!1417511 () Bool)

(assert (=> b!1535630 m!1417511))

(declare-fun m!1417513 () Bool)

(assert (=> b!1535628 m!1417513))

(assert (=> b!1535628 m!1417495))

(declare-fun m!1417515 () Bool)

(assert (=> b!1535622 m!1417515))

(assert (=> b!1535622 m!1417515))

(declare-fun m!1417517 () Bool)

(assert (=> b!1535622 m!1417517))

(assert (=> b!1535623 m!1417495))

(assert (=> b!1535623 m!1417495))

(declare-fun m!1417519 () Bool)

(assert (=> b!1535623 m!1417519))

(declare-fun m!1417521 () Bool)

(assert (=> b!1535631 m!1417521))

(declare-fun m!1417523 () Bool)

(assert (=> start!130890 m!1417523))

(declare-fun m!1417525 () Bool)

(assert (=> start!130890 m!1417525))

(check-sat (not b!1535623) (not b!1535624) (not b!1535631) (not b!1535626) (not b!1535627) (not b!1535632) (not b!1535625) (not start!130890) (not b!1535622))
(check-sat)
