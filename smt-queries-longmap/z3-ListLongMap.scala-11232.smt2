; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131026 () Bool)

(assert start!131026)

(declare-fun b!1537363 () Bool)

(declare-fun e!855604 () Bool)

(declare-fun e!855607 () Bool)

(assert (=> b!1537363 (= e!855604 e!855607)))

(declare-fun res!1054452 () Bool)

(assert (=> b!1537363 (=> (not res!1054452) (not e!855607))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102124 0))(
  ( (array!102125 (arr!49278 (Array (_ BitVec 32) (_ BitVec 64))) (size!49828 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102124)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13410 0))(
  ( (MissingZero!13410 (index!56035 (_ BitVec 32))) (Found!13410 (index!56036 (_ BitVec 32))) (Intermediate!13410 (undefined!14222 Bool) (index!56037 (_ BitVec 32)) (x!137764 (_ BitVec 32))) (Undefined!13410) (MissingVacant!13410 (index!56038 (_ BitVec 32))) )
))
(declare-fun lt!664688 () SeekEntryResult!13410)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102124 (_ BitVec 32)) SeekEntryResult!13410)

(assert (=> b!1537363 (= res!1054452 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49278 a!2792) j!64) a!2792 mask!2480) lt!664688))))

(assert (=> b!1537363 (= lt!664688 (Found!13410 j!64))))

(declare-fun b!1537364 () Bool)

(declare-fun res!1054454 () Bool)

(assert (=> b!1537364 (=> (not res!1054454) (not e!855604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102124 (_ BitVec 32)) Bool)

(assert (=> b!1537364 (= res!1054454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1054453 () Bool)

(assert (=> start!131026 (=> (not res!1054453) (not e!855604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131026 (= res!1054453 (validMask!0 mask!2480))))

(assert (=> start!131026 e!855604))

(assert (=> start!131026 true))

(declare-fun array_inv!38306 (array!102124) Bool)

(assert (=> start!131026 (array_inv!38306 a!2792)))

(declare-fun b!1537365 () Bool)

(declare-fun e!855603 () Bool)

(assert (=> b!1537365 (= e!855607 e!855603)))

(declare-fun res!1054458 () Bool)

(assert (=> b!1537365 (=> (not res!1054458) (not e!855603))))

(declare-fun lt!664687 () (_ BitVec 32))

(assert (=> b!1537365 (= res!1054458 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664687 #b00000000000000000000000000000000) (bvslt lt!664687 (size!49828 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537365 (= lt!664687 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1537366 () Bool)

(declare-fun res!1054450 () Bool)

(assert (=> b!1537366 (=> (not res!1054450) (not e!855607))))

(assert (=> b!1537366 (= res!1054450 (not (= (select (arr!49278 a!2792) index!463) (select (arr!49278 a!2792) j!64))))))

(declare-fun b!1537367 () Bool)

(declare-fun res!1054455 () Bool)

(assert (=> b!1537367 (=> (not res!1054455) (not e!855604))))

(assert (=> b!1537367 (= res!1054455 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49828 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49828 a!2792)) (= (select (arr!49278 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537368 () Bool)

(declare-fun res!1054449 () Bool)

(assert (=> b!1537368 (=> (not res!1054449) (not e!855604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537368 (= res!1054449 (validKeyInArray!0 (select (arr!49278 a!2792) j!64)))))

(declare-fun b!1537369 () Bool)

(declare-fun res!1054457 () Bool)

(assert (=> b!1537369 (=> (not res!1054457) (not e!855604))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537369 (= res!1054457 (and (= (size!49828 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49828 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49828 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537370 () Bool)

(declare-fun e!855606 () Bool)

(assert (=> b!1537370 (= e!855603 e!855606)))

(declare-fun res!1054456 () Bool)

(assert (=> b!1537370 (=> (not res!1054456) (not e!855606))))

(declare-fun lt!664690 () SeekEntryResult!13410)

(assert (=> b!1537370 (= res!1054456 (= lt!664690 lt!664688))))

(assert (=> b!1537370 (= lt!664690 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664687 vacantIndex!5 (select (arr!49278 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537371 () Bool)

(declare-fun res!1054451 () Bool)

(assert (=> b!1537371 (=> (not res!1054451) (not e!855604))))

(declare-datatypes ((List!35752 0))(
  ( (Nil!35749) (Cons!35748 (h!37193 (_ BitVec 64)) (t!50446 List!35752)) )
))
(declare-fun arrayNoDuplicates!0 (array!102124 (_ BitVec 32) List!35752) Bool)

(assert (=> b!1537371 (= res!1054451 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35749))))

(declare-fun b!1537372 () Bool)

(declare-fun res!1054459 () Bool)

(assert (=> b!1537372 (=> (not res!1054459) (not e!855604))))

(assert (=> b!1537372 (= res!1054459 (validKeyInArray!0 (select (arr!49278 a!2792) i!951)))))

(declare-fun b!1537373 () Bool)

(assert (=> b!1537373 (= e!855606 (not true))))

(assert (=> b!1537373 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664687 vacantIndex!5 (select (store (arr!49278 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102125 (store (arr!49278 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49828 a!2792)) mask!2480) lt!664690)))

(declare-datatypes ((Unit!51392 0))(
  ( (Unit!51393) )
))
(declare-fun lt!664689 () Unit!51392)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51392)

(assert (=> b!1537373 (= lt!664689 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664687 vacantIndex!5 mask!2480))))

(assert (= (and start!131026 res!1054453) b!1537369))

(assert (= (and b!1537369 res!1054457) b!1537372))

(assert (= (and b!1537372 res!1054459) b!1537368))

(assert (= (and b!1537368 res!1054449) b!1537364))

(assert (= (and b!1537364 res!1054454) b!1537371))

(assert (= (and b!1537371 res!1054451) b!1537367))

(assert (= (and b!1537367 res!1054455) b!1537363))

(assert (= (and b!1537363 res!1054452) b!1537366))

(assert (= (and b!1537366 res!1054450) b!1537365))

(assert (= (and b!1537365 res!1054458) b!1537370))

(assert (= (and b!1537370 res!1054456) b!1537373))

(declare-fun m!1419865 () Bool)

(assert (=> b!1537366 m!1419865))

(declare-fun m!1419867 () Bool)

(assert (=> b!1537366 m!1419867))

(assert (=> b!1537363 m!1419867))

(assert (=> b!1537363 m!1419867))

(declare-fun m!1419869 () Bool)

(assert (=> b!1537363 m!1419869))

(declare-fun m!1419871 () Bool)

(assert (=> start!131026 m!1419871))

(declare-fun m!1419873 () Bool)

(assert (=> start!131026 m!1419873))

(declare-fun m!1419875 () Bool)

(assert (=> b!1537372 m!1419875))

(assert (=> b!1537372 m!1419875))

(declare-fun m!1419877 () Bool)

(assert (=> b!1537372 m!1419877))

(assert (=> b!1537370 m!1419867))

(assert (=> b!1537370 m!1419867))

(declare-fun m!1419879 () Bool)

(assert (=> b!1537370 m!1419879))

(declare-fun m!1419881 () Bool)

(assert (=> b!1537371 m!1419881))

(declare-fun m!1419883 () Bool)

(assert (=> b!1537365 m!1419883))

(declare-fun m!1419885 () Bool)

(assert (=> b!1537373 m!1419885))

(declare-fun m!1419887 () Bool)

(assert (=> b!1537373 m!1419887))

(assert (=> b!1537373 m!1419887))

(declare-fun m!1419889 () Bool)

(assert (=> b!1537373 m!1419889))

(declare-fun m!1419891 () Bool)

(assert (=> b!1537373 m!1419891))

(assert (=> b!1537368 m!1419867))

(assert (=> b!1537368 m!1419867))

(declare-fun m!1419893 () Bool)

(assert (=> b!1537368 m!1419893))

(declare-fun m!1419895 () Bool)

(assert (=> b!1537367 m!1419895))

(declare-fun m!1419897 () Bool)

(assert (=> b!1537364 m!1419897))

(check-sat (not b!1537371) (not b!1537364) (not b!1537373) (not start!131026) (not b!1537365) (not b!1537372) (not b!1537363) (not b!1537368) (not b!1537370))
(check-sat)
