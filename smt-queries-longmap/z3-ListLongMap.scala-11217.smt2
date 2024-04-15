; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130884 () Bool)

(assert start!130884)

(declare-fun res!1052806 () Bool)

(declare-fun e!854720 () Bool)

(assert (=> start!130884 (=> (not res!1052806) (not e!854720))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130884 (= res!1052806 (validMask!0 mask!2480))))

(assert (=> start!130884 e!854720))

(assert (=> start!130884 true))

(declare-datatypes ((array!101980 0))(
  ( (array!101981 (arr!49207 (Array (_ BitVec 32) (_ BitVec 64))) (size!49759 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101980)

(declare-fun array_inv!38440 (array!101980) Bool)

(assert (=> start!130884 (array_inv!38440 a!2792)))

(declare-fun b!1535530 () Bool)

(declare-fun e!854722 () Bool)

(assert (=> b!1535530 (= e!854722 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663855 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13364 0))(
  ( (MissingZero!13364 (index!55851 (_ BitVec 32))) (Found!13364 (index!55852 (_ BitVec 32))) (Intermediate!13364 (undefined!14176 Bool) (index!55853 (_ BitVec 32)) (x!137593 (_ BitVec 32))) (Undefined!13364) (MissingVacant!13364 (index!55854 (_ BitVec 32))) )
))
(declare-fun lt!663854 () SeekEntryResult!13364)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101980 (_ BitVec 32)) SeekEntryResult!13364)

(assert (=> b!1535530 (= lt!663854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663855 vacantIndex!5 (select (arr!49207 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535531 () Bool)

(declare-fun res!1052805 () Bool)

(assert (=> b!1535531 (=> (not res!1052805) (not e!854720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535531 (= res!1052805 (validKeyInArray!0 (select (arr!49207 a!2792) j!64)))))

(declare-fun b!1535532 () Bool)

(declare-fun res!1052809 () Bool)

(assert (=> b!1535532 (=> (not res!1052809) (not e!854720))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535532 (= res!1052809 (validKeyInArray!0 (select (arr!49207 a!2792) i!951)))))

(declare-fun b!1535533 () Bool)

(assert (=> b!1535533 (= e!854720 e!854722)))

(declare-fun res!1052801 () Bool)

(assert (=> b!1535533 (=> (not res!1052801) (not e!854722))))

(assert (=> b!1535533 (= res!1052801 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663855 #b00000000000000000000000000000000) (bvslt lt!663855 (size!49759 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535533 (= lt!663855 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535534 () Bool)

(declare-fun res!1052803 () Bool)

(assert (=> b!1535534 (=> (not res!1052803) (not e!854720))))

(declare-datatypes ((List!35759 0))(
  ( (Nil!35756) (Cons!35755 (h!37201 (_ BitVec 64)) (t!50445 List!35759)) )
))
(declare-fun arrayNoDuplicates!0 (array!101980 (_ BitVec 32) List!35759) Bool)

(assert (=> b!1535534 (= res!1052803 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35756))))

(declare-fun b!1535535 () Bool)

(declare-fun res!1052807 () Bool)

(assert (=> b!1535535 (=> (not res!1052807) (not e!854720))))

(assert (=> b!1535535 (= res!1052807 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49759 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49759 a!2792)) (= (select (arr!49207 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535536 () Bool)

(declare-fun res!1052808 () Bool)

(assert (=> b!1535536 (=> (not res!1052808) (not e!854720))))

(assert (=> b!1535536 (= res!1052808 (not (= (select (arr!49207 a!2792) index!463) (select (arr!49207 a!2792) j!64))))))

(declare-fun b!1535537 () Bool)

(declare-fun res!1052800 () Bool)

(assert (=> b!1535537 (=> (not res!1052800) (not e!854720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101980 (_ BitVec 32)) Bool)

(assert (=> b!1535537 (= res!1052800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535538 () Bool)

(declare-fun res!1052804 () Bool)

(assert (=> b!1535538 (=> (not res!1052804) (not e!854720))))

(assert (=> b!1535538 (= res!1052804 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49207 a!2792) j!64) a!2792 mask!2480) (Found!13364 j!64)))))

(declare-fun b!1535539 () Bool)

(declare-fun res!1052802 () Bool)

(assert (=> b!1535539 (=> (not res!1052802) (not e!854720))))

(assert (=> b!1535539 (= res!1052802 (and (= (size!49759 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49759 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49759 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130884 res!1052806) b!1535539))

(assert (= (and b!1535539 res!1052802) b!1535532))

(assert (= (and b!1535532 res!1052809) b!1535531))

(assert (= (and b!1535531 res!1052805) b!1535537))

(assert (= (and b!1535537 res!1052800) b!1535534))

(assert (= (and b!1535534 res!1052803) b!1535535))

(assert (= (and b!1535535 res!1052807) b!1535538))

(assert (= (and b!1535538 res!1052804) b!1535536))

(assert (= (and b!1535536 res!1052808) b!1535533))

(assert (= (and b!1535533 res!1052801) b!1535530))

(declare-fun m!1417415 () Bool)

(assert (=> b!1535537 m!1417415))

(declare-fun m!1417417 () Bool)

(assert (=> b!1535536 m!1417417))

(declare-fun m!1417419 () Bool)

(assert (=> b!1535536 m!1417419))

(assert (=> b!1535538 m!1417419))

(assert (=> b!1535538 m!1417419))

(declare-fun m!1417421 () Bool)

(assert (=> b!1535538 m!1417421))

(declare-fun m!1417423 () Bool)

(assert (=> b!1535535 m!1417423))

(assert (=> b!1535530 m!1417419))

(assert (=> b!1535530 m!1417419))

(declare-fun m!1417425 () Bool)

(assert (=> b!1535530 m!1417425))

(declare-fun m!1417427 () Bool)

(assert (=> b!1535532 m!1417427))

(assert (=> b!1535532 m!1417427))

(declare-fun m!1417429 () Bool)

(assert (=> b!1535532 m!1417429))

(declare-fun m!1417431 () Bool)

(assert (=> b!1535533 m!1417431))

(assert (=> b!1535531 m!1417419))

(assert (=> b!1535531 m!1417419))

(declare-fun m!1417433 () Bool)

(assert (=> b!1535531 m!1417433))

(declare-fun m!1417435 () Bool)

(assert (=> start!130884 m!1417435))

(declare-fun m!1417437 () Bool)

(assert (=> start!130884 m!1417437))

(declare-fun m!1417439 () Bool)

(assert (=> b!1535534 m!1417439))

(check-sat (not b!1535534) (not b!1535530) (not b!1535532) (not b!1535531) (not b!1535533) (not b!1535538) (not b!1535537) (not start!130884))
(check-sat)
