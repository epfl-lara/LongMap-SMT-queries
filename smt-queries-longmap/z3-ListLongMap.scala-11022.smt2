; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128912 () Bool)

(assert start!128912)

(declare-fun res!1031734 () Bool)

(declare-fun e!843807 () Bool)

(assert (=> start!128912 (=> (not res!1031734) (not e!843807))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128912 (= res!1031734 (validMask!0 mask!2512))))

(assert (=> start!128912 e!843807))

(assert (=> start!128912 true))

(declare-datatypes ((array!100768 0))(
  ( (array!100769 (arr!48622 (Array (_ BitVec 32) (_ BitVec 64))) (size!49174 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100768)

(declare-fun array_inv!37855 (array!100768) Bool)

(assert (=> start!128912 (array_inv!37855 a!2804)))

(declare-fun b!1511616 () Bool)

(declare-fun res!1031731 () Bool)

(declare-fun e!843806 () Bool)

(assert (=> b!1511616 (=> (not res!1031731) (not e!843806))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12816 0))(
  ( (MissingZero!12816 (index!53659 (_ BitVec 32))) (Found!12816 (index!53660 (_ BitVec 32))) (Intermediate!12816 (undefined!13628 Bool) (index!53661 (_ BitVec 32)) (x!135392 (_ BitVec 32))) (Undefined!12816) (MissingVacant!12816 (index!53662 (_ BitVec 32))) )
))
(declare-fun lt!655272 () SeekEntryResult!12816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12816)

(assert (=> b!1511616 (= res!1031731 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48622 a!2804) j!70) a!2804 mask!2512) lt!655272))))

(declare-fun b!1511617 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun e!843808 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511617 (= e!843808 (validKeyInArray!0 (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1511618 () Bool)

(declare-fun res!1031737 () Bool)

(assert (=> b!1511618 (=> (not res!1031737) (not e!843807))))

(assert (=> b!1511618 (= res!1031737 (validKeyInArray!0 (select (arr!48622 a!2804) j!70)))))

(declare-fun b!1511619 () Bool)

(declare-fun res!1031738 () Bool)

(assert (=> b!1511619 (=> (not res!1031738) (not e!843807))))

(assert (=> b!1511619 (= res!1031738 (validKeyInArray!0 (select (arr!48622 a!2804) i!961)))))

(declare-fun b!1511620 () Bool)

(declare-fun res!1031726 () Bool)

(assert (=> b!1511620 (=> (not res!1031726) (not e!843807))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511620 (= res!1031726 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49174 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49174 a!2804))))))

(declare-fun b!1511621 () Bool)

(declare-fun e!843809 () Bool)

(declare-fun e!843805 () Bool)

(assert (=> b!1511621 (= e!843809 e!843805)))

(declare-fun res!1031736 () Bool)

(assert (=> b!1511621 (=> res!1031736 e!843805)))

(assert (=> b!1511621 (= res!1031736 (or (not (= (select (arr!48622 a!2804) j!70) (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48622 a!2804) index!487) (select (arr!48622 a!2804) j!70)) (not (= (select (arr!48622 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511622 () Bool)

(assert (=> b!1511622 (= e!843806 (not e!843808))))

(declare-fun res!1031733 () Bool)

(assert (=> b!1511622 (=> res!1031733 e!843808)))

(assert (=> b!1511622 (= res!1031733 (or (not (= (select (arr!48622 a!2804) j!70) (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48622 a!2804) index!487) (select (arr!48622 a!2804) j!70)) (not (= (select (arr!48622 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(assert (=> b!1511622 e!843809))

(declare-fun res!1031728 () Bool)

(assert (=> b!1511622 (=> (not res!1031728) (not e!843809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100768 (_ BitVec 32)) Bool)

(assert (=> b!1511622 (= res!1031728 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50339 0))(
  ( (Unit!50340) )
))
(declare-fun lt!655270 () Unit!50339)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50339)

(assert (=> b!1511622 (= lt!655270 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511623 () Bool)

(declare-fun res!1031727 () Bool)

(assert (=> b!1511623 (=> (not res!1031727) (not e!843809))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12816)

(assert (=> b!1511623 (= res!1031727 (= (seekEntry!0 (select (arr!48622 a!2804) j!70) a!2804 mask!2512) (Found!12816 j!70)))))

(declare-fun b!1511624 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12816)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100768 (_ BitVec 32)) SeekEntryResult!12816)

(assert (=> b!1511624 (= e!843805 (= (seekEntryOrOpen!0 (select (arr!48622 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48622 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511625 () Bool)

(declare-fun res!1031729 () Bool)

(assert (=> b!1511625 (=> (not res!1031729) (not e!843806))))

(declare-fun lt!655271 () SeekEntryResult!12816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511625 (= res!1031729 (= lt!655271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100769 (store (arr!48622 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49174 a!2804)) mask!2512)))))

(declare-fun b!1511626 () Bool)

(assert (=> b!1511626 (= e!843807 e!843806)))

(declare-fun res!1031735 () Bool)

(assert (=> b!1511626 (=> (not res!1031735) (not e!843806))))

(assert (=> b!1511626 (= res!1031735 (= lt!655271 lt!655272))))

(assert (=> b!1511626 (= lt!655272 (Intermediate!12816 false resIndex!21 resX!21))))

(assert (=> b!1511626 (= lt!655271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48622 a!2804) j!70) mask!2512) (select (arr!48622 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511627 () Bool)

(declare-fun res!1031732 () Bool)

(assert (=> b!1511627 (=> (not res!1031732) (not e!843807))))

(declare-datatypes ((List!35183 0))(
  ( (Nil!35180) (Cons!35179 (h!36592 (_ BitVec 64)) (t!49869 List!35183)) )
))
(declare-fun arrayNoDuplicates!0 (array!100768 (_ BitVec 32) List!35183) Bool)

(assert (=> b!1511627 (= res!1031732 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35180))))

(declare-fun b!1511628 () Bool)

(declare-fun res!1031730 () Bool)

(assert (=> b!1511628 (=> (not res!1031730) (not e!843807))))

(assert (=> b!1511628 (= res!1031730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511629 () Bool)

(declare-fun res!1031725 () Bool)

(assert (=> b!1511629 (=> (not res!1031725) (not e!843807))))

(assert (=> b!1511629 (= res!1031725 (and (= (size!49174 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49174 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49174 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128912 res!1031734) b!1511629))

(assert (= (and b!1511629 res!1031725) b!1511619))

(assert (= (and b!1511619 res!1031738) b!1511618))

(assert (= (and b!1511618 res!1031737) b!1511628))

(assert (= (and b!1511628 res!1031730) b!1511627))

(assert (= (and b!1511627 res!1031732) b!1511620))

(assert (= (and b!1511620 res!1031726) b!1511626))

(assert (= (and b!1511626 res!1031735) b!1511616))

(assert (= (and b!1511616 res!1031731) b!1511625))

(assert (= (and b!1511625 res!1031729) b!1511622))

(assert (= (and b!1511622 res!1031728) b!1511623))

(assert (= (and b!1511623 res!1031727) b!1511621))

(assert (= (and b!1511621 (not res!1031736)) b!1511624))

(assert (= (and b!1511622 (not res!1031733)) b!1511617))

(declare-fun m!1393781 () Bool)

(assert (=> b!1511619 m!1393781))

(assert (=> b!1511619 m!1393781))

(declare-fun m!1393783 () Bool)

(assert (=> b!1511619 m!1393783))

(declare-fun m!1393785 () Bool)

(assert (=> b!1511621 m!1393785))

(declare-fun m!1393787 () Bool)

(assert (=> b!1511621 m!1393787))

(declare-fun m!1393789 () Bool)

(assert (=> b!1511621 m!1393789))

(declare-fun m!1393791 () Bool)

(assert (=> b!1511621 m!1393791))

(assert (=> b!1511622 m!1393785))

(declare-fun m!1393793 () Bool)

(assert (=> b!1511622 m!1393793))

(assert (=> b!1511622 m!1393787))

(assert (=> b!1511622 m!1393791))

(assert (=> b!1511622 m!1393789))

(declare-fun m!1393795 () Bool)

(assert (=> b!1511622 m!1393795))

(assert (=> b!1511623 m!1393785))

(assert (=> b!1511623 m!1393785))

(declare-fun m!1393797 () Bool)

(assert (=> b!1511623 m!1393797))

(assert (=> b!1511617 m!1393787))

(assert (=> b!1511617 m!1393789))

(assert (=> b!1511617 m!1393789))

(declare-fun m!1393799 () Bool)

(assert (=> b!1511617 m!1393799))

(assert (=> b!1511624 m!1393785))

(assert (=> b!1511624 m!1393785))

(declare-fun m!1393801 () Bool)

(assert (=> b!1511624 m!1393801))

(assert (=> b!1511624 m!1393785))

(declare-fun m!1393803 () Bool)

(assert (=> b!1511624 m!1393803))

(assert (=> b!1511625 m!1393787))

(assert (=> b!1511625 m!1393789))

(assert (=> b!1511625 m!1393789))

(declare-fun m!1393805 () Bool)

(assert (=> b!1511625 m!1393805))

(assert (=> b!1511625 m!1393805))

(assert (=> b!1511625 m!1393789))

(declare-fun m!1393807 () Bool)

(assert (=> b!1511625 m!1393807))

(assert (=> b!1511626 m!1393785))

(assert (=> b!1511626 m!1393785))

(declare-fun m!1393809 () Bool)

(assert (=> b!1511626 m!1393809))

(assert (=> b!1511626 m!1393809))

(assert (=> b!1511626 m!1393785))

(declare-fun m!1393811 () Bool)

(assert (=> b!1511626 m!1393811))

(assert (=> b!1511618 m!1393785))

(assert (=> b!1511618 m!1393785))

(declare-fun m!1393813 () Bool)

(assert (=> b!1511618 m!1393813))

(assert (=> b!1511616 m!1393785))

(assert (=> b!1511616 m!1393785))

(declare-fun m!1393815 () Bool)

(assert (=> b!1511616 m!1393815))

(declare-fun m!1393817 () Bool)

(assert (=> start!128912 m!1393817))

(declare-fun m!1393819 () Bool)

(assert (=> start!128912 m!1393819))

(declare-fun m!1393821 () Bool)

(assert (=> b!1511627 m!1393821))

(declare-fun m!1393823 () Bool)

(assert (=> b!1511628 m!1393823))

(check-sat (not b!1511622) (not b!1511625) (not b!1511626) (not b!1511618) (not b!1511627) (not b!1511616) (not start!128912) (not b!1511623) (not b!1511628) (not b!1511617) (not b!1511619) (not b!1511624))
(check-sat)
