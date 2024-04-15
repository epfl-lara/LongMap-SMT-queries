; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130008 () Bool)

(assert start!130008)

(declare-fun lt!660670 () (_ BitVec 64))

(declare-fun e!850468 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun b!1525791 () Bool)

(declare-datatypes ((array!101419 0))(
  ( (array!101420 (arr!48937 (Array (_ BitVec 32) (_ BitVec 64))) (size!49489 (_ BitVec 32))) )
))
(declare-fun lt!660671 () array!101419)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13125 0))(
  ( (MissingZero!13125 (index!54895 (_ BitVec 32))) (Found!13125 (index!54896 (_ BitVec 32))) (Intermediate!13125 (undefined!13937 Bool) (index!54897 (_ BitVec 32)) (x!136598 (_ BitVec 32))) (Undefined!13125) (MissingVacant!13125 (index!54898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101419 (_ BitVec 32)) SeekEntryResult!13125)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101419 (_ BitVec 32)) SeekEntryResult!13125)

(assert (=> b!1525791 (= e!850468 (= (seekEntryOrOpen!0 lt!660670 lt!660671 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660670 lt!660671 mask!2512)))))

(declare-fun b!1525792 () Bool)

(declare-fun e!850467 () Bool)

(declare-fun e!850469 () Bool)

(assert (=> b!1525792 (= e!850467 e!850469)))

(declare-fun res!1044010 () Bool)

(assert (=> b!1525792 (=> res!1044010 e!850469)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101419)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525792 (= res!1044010 (or (not (= (select (arr!48937 a!2804) j!70) lt!660670)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48937 a!2804) index!487) (select (arr!48937 a!2804) j!70)) (not (= (select (arr!48937 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525793 () Bool)

(declare-fun res!1044021 () Bool)

(declare-fun e!850471 () Bool)

(assert (=> b!1525793 (=> (not res!1044021) (not e!850471))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525793 (= res!1044021 (validKeyInArray!0 (select (arr!48937 a!2804) i!961)))))

(declare-fun res!1044017 () Bool)

(assert (=> start!130008 (=> (not res!1044017) (not e!850471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130008 (= res!1044017 (validMask!0 mask!2512))))

(assert (=> start!130008 e!850471))

(assert (=> start!130008 true))

(declare-fun array_inv!38170 (array!101419) Bool)

(assert (=> start!130008 (array_inv!38170 a!2804)))

(declare-fun b!1525794 () Bool)

(declare-fun e!850470 () Bool)

(assert (=> b!1525794 (= e!850470 (not true))))

(assert (=> b!1525794 e!850467))

(declare-fun res!1044013 () Bool)

(assert (=> b!1525794 (=> (not res!1044013) (not e!850467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101419 (_ BitVec 32)) Bool)

(assert (=> b!1525794 (= res!1044013 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50873 0))(
  ( (Unit!50874) )
))
(declare-fun lt!660672 () Unit!50873)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50873)

(assert (=> b!1525794 (= lt!660672 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525795 () Bool)

(declare-fun res!1044015 () Bool)

(assert (=> b!1525795 (=> (not res!1044015) (not e!850467))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101419 (_ BitVec 32)) SeekEntryResult!13125)

(assert (=> b!1525795 (= res!1044015 (= (seekEntry!0 (select (arr!48937 a!2804) j!70) a!2804 mask!2512) (Found!13125 j!70)))))

(declare-fun b!1525796 () Bool)

(declare-fun e!850465 () Bool)

(assert (=> b!1525796 (= e!850465 e!850470)))

(declare-fun res!1044016 () Bool)

(assert (=> b!1525796 (=> (not res!1044016) (not e!850470))))

(declare-fun lt!660669 () SeekEntryResult!13125)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101419 (_ BitVec 32)) SeekEntryResult!13125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525796 (= res!1044016 (= lt!660669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660670 mask!2512) lt!660670 lt!660671 mask!2512)))))

(assert (=> b!1525796 (= lt!660670 (select (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525796 (= lt!660671 (array!101420 (store (arr!48937 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49489 a!2804)))))

(declare-fun b!1525797 () Bool)

(declare-fun res!1044018 () Bool)

(assert (=> b!1525797 (=> (not res!1044018) (not e!850471))))

(assert (=> b!1525797 (= res!1044018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525798 () Bool)

(declare-fun res!1044009 () Bool)

(assert (=> b!1525798 (=> (not res!1044009) (not e!850471))))

(assert (=> b!1525798 (= res!1044009 (and (= (size!49489 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49489 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49489 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525799 () Bool)

(assert (=> b!1525799 (= e!850469 e!850468)))

(declare-fun res!1044022 () Bool)

(assert (=> b!1525799 (=> (not res!1044022) (not e!850468))))

(assert (=> b!1525799 (= res!1044022 (= (seekEntryOrOpen!0 (select (arr!48937 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48937 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525800 () Bool)

(declare-fun res!1044020 () Bool)

(assert (=> b!1525800 (=> (not res!1044020) (not e!850471))))

(assert (=> b!1525800 (= res!1044020 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49489 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49489 a!2804))))))

(declare-fun b!1525801 () Bool)

(assert (=> b!1525801 (= e!850471 e!850465)))

(declare-fun res!1044012 () Bool)

(assert (=> b!1525801 (=> (not res!1044012) (not e!850465))))

(declare-fun lt!660668 () SeekEntryResult!13125)

(assert (=> b!1525801 (= res!1044012 (= lt!660669 lt!660668))))

(assert (=> b!1525801 (= lt!660668 (Intermediate!13125 false resIndex!21 resX!21))))

(assert (=> b!1525801 (= lt!660669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48937 a!2804) j!70) mask!2512) (select (arr!48937 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525802 () Bool)

(declare-fun res!1044019 () Bool)

(assert (=> b!1525802 (=> (not res!1044019) (not e!850465))))

(assert (=> b!1525802 (= res!1044019 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48937 a!2804) j!70) a!2804 mask!2512) lt!660668))))

(declare-fun b!1525803 () Bool)

(declare-fun res!1044011 () Bool)

(assert (=> b!1525803 (=> (not res!1044011) (not e!850471))))

(declare-datatypes ((List!35498 0))(
  ( (Nil!35495) (Cons!35494 (h!36928 (_ BitVec 64)) (t!50184 List!35498)) )
))
(declare-fun arrayNoDuplicates!0 (array!101419 (_ BitVec 32) List!35498) Bool)

(assert (=> b!1525803 (= res!1044011 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35495))))

(declare-fun b!1525804 () Bool)

(declare-fun res!1044014 () Bool)

(assert (=> b!1525804 (=> (not res!1044014) (not e!850471))))

(assert (=> b!1525804 (= res!1044014 (validKeyInArray!0 (select (arr!48937 a!2804) j!70)))))

(assert (= (and start!130008 res!1044017) b!1525798))

(assert (= (and b!1525798 res!1044009) b!1525793))

(assert (= (and b!1525793 res!1044021) b!1525804))

(assert (= (and b!1525804 res!1044014) b!1525797))

(assert (= (and b!1525797 res!1044018) b!1525803))

(assert (= (and b!1525803 res!1044011) b!1525800))

(assert (= (and b!1525800 res!1044020) b!1525801))

(assert (= (and b!1525801 res!1044012) b!1525802))

(assert (= (and b!1525802 res!1044019) b!1525796))

(assert (= (and b!1525796 res!1044016) b!1525794))

(assert (= (and b!1525794 res!1044013) b!1525795))

(assert (= (and b!1525795 res!1044015) b!1525792))

(assert (= (and b!1525792 (not res!1044010)) b!1525799))

(assert (= (and b!1525799 res!1044022) b!1525791))

(declare-fun m!1407983 () Bool)

(assert (=> b!1525802 m!1407983))

(assert (=> b!1525802 m!1407983))

(declare-fun m!1407985 () Bool)

(assert (=> b!1525802 m!1407985))

(declare-fun m!1407987 () Bool)

(assert (=> b!1525791 m!1407987))

(declare-fun m!1407989 () Bool)

(assert (=> b!1525791 m!1407989))

(assert (=> b!1525801 m!1407983))

(assert (=> b!1525801 m!1407983))

(declare-fun m!1407991 () Bool)

(assert (=> b!1525801 m!1407991))

(assert (=> b!1525801 m!1407991))

(assert (=> b!1525801 m!1407983))

(declare-fun m!1407993 () Bool)

(assert (=> b!1525801 m!1407993))

(declare-fun m!1407995 () Bool)

(assert (=> b!1525793 m!1407995))

(assert (=> b!1525793 m!1407995))

(declare-fun m!1407997 () Bool)

(assert (=> b!1525793 m!1407997))

(declare-fun m!1407999 () Bool)

(assert (=> b!1525803 m!1407999))

(assert (=> b!1525792 m!1407983))

(declare-fun m!1408001 () Bool)

(assert (=> b!1525792 m!1408001))

(declare-fun m!1408003 () Bool)

(assert (=> b!1525796 m!1408003))

(assert (=> b!1525796 m!1408003))

(declare-fun m!1408005 () Bool)

(assert (=> b!1525796 m!1408005))

(declare-fun m!1408007 () Bool)

(assert (=> b!1525796 m!1408007))

(declare-fun m!1408009 () Bool)

(assert (=> b!1525796 m!1408009))

(declare-fun m!1408011 () Bool)

(assert (=> start!130008 m!1408011))

(declare-fun m!1408013 () Bool)

(assert (=> start!130008 m!1408013))

(assert (=> b!1525804 m!1407983))

(assert (=> b!1525804 m!1407983))

(declare-fun m!1408015 () Bool)

(assert (=> b!1525804 m!1408015))

(declare-fun m!1408017 () Bool)

(assert (=> b!1525794 m!1408017))

(declare-fun m!1408019 () Bool)

(assert (=> b!1525794 m!1408019))

(declare-fun m!1408021 () Bool)

(assert (=> b!1525797 m!1408021))

(assert (=> b!1525799 m!1407983))

(assert (=> b!1525799 m!1407983))

(declare-fun m!1408023 () Bool)

(assert (=> b!1525799 m!1408023))

(assert (=> b!1525799 m!1407983))

(declare-fun m!1408025 () Bool)

(assert (=> b!1525799 m!1408025))

(assert (=> b!1525795 m!1407983))

(assert (=> b!1525795 m!1407983))

(declare-fun m!1408027 () Bool)

(assert (=> b!1525795 m!1408027))

(check-sat (not b!1525791) (not b!1525796) (not b!1525794) (not b!1525799) (not start!130008) (not b!1525795) (not b!1525803) (not b!1525797) (not b!1525802) (not b!1525793) (not b!1525801) (not b!1525804))
(check-sat)
