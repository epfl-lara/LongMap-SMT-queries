; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128924 () Bool)

(assert start!128924)

(declare-fun b!1511857 () Bool)

(declare-fun res!1031967 () Bool)

(declare-fun e!843902 () Bool)

(assert (=> b!1511857 (=> (not res!1031967) (not e!843902))))

(declare-datatypes ((array!100780 0))(
  ( (array!100781 (arr!48628 (Array (_ BitVec 32) (_ BitVec 64))) (size!49180 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100780)

(declare-datatypes ((List!35189 0))(
  ( (Nil!35186) (Cons!35185 (h!36598 (_ BitVec 64)) (t!49875 List!35189)) )
))
(declare-fun arrayNoDuplicates!0 (array!100780 (_ BitVec 32) List!35189) Bool)

(assert (=> b!1511857 (= res!1031967 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35186))))

(declare-fun b!1511858 () Bool)

(declare-fun e!843904 () Bool)

(declare-fun e!843905 () Bool)

(assert (=> b!1511858 (= e!843904 e!843905)))

(declare-fun res!1031974 () Bool)

(assert (=> b!1511858 (=> res!1031974 e!843905)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511858 (= res!1031974 (or (not (= (select (arr!48628 a!2804) j!70) (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48628 a!2804) index!487) (select (arr!48628 a!2804) j!70)) (not (= (select (arr!48628 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511859 () Bool)

(declare-fun res!1031971 () Bool)

(assert (=> b!1511859 (=> (not res!1031971) (not e!843902))))

(assert (=> b!1511859 (= res!1031971 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49180 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49180 a!2804))))))

(declare-fun b!1511860 () Bool)

(declare-fun res!1031966 () Bool)

(assert (=> b!1511860 (=> (not res!1031966) (not e!843902))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1511860 (= res!1031966 (and (= (size!49180 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49180 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49180 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511861 () Bool)

(declare-fun res!1031968 () Bool)

(declare-fun e!843903 () Bool)

(assert (=> b!1511861 (=> (not res!1031968) (not e!843903))))

(declare-datatypes ((SeekEntryResult!12822 0))(
  ( (MissingZero!12822 (index!53683 (_ BitVec 32))) (Found!12822 (index!53684 (_ BitVec 32))) (Intermediate!12822 (undefined!13634 Bool) (index!53685 (_ BitVec 32)) (x!135414 (_ BitVec 32))) (Undefined!12822) (MissingVacant!12822 (index!53686 (_ BitVec 32))) )
))
(declare-fun lt!655325 () SeekEntryResult!12822)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511861 (= res!1031968 (= lt!655325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100781 (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49180 a!2804)) mask!2512)))))

(declare-fun res!1031978 () Bool)

(assert (=> start!128924 (=> (not res!1031978) (not e!843902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128924 (= res!1031978 (validMask!0 mask!2512))))

(assert (=> start!128924 e!843902))

(assert (=> start!128924 true))

(declare-fun array_inv!37861 (array!100780) Bool)

(assert (=> start!128924 (array_inv!37861 a!2804)))

(declare-fun b!1511862 () Bool)

(declare-fun res!1031972 () Bool)

(assert (=> b!1511862 (=> (not res!1031972) (not e!843903))))

(declare-fun lt!655324 () SeekEntryResult!12822)

(assert (=> b!1511862 (= res!1031972 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48628 a!2804) j!70) a!2804 mask!2512) lt!655324))))

(declare-fun b!1511863 () Bool)

(declare-fun res!1031973 () Bool)

(assert (=> b!1511863 (=> (not res!1031973) (not e!843902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511863 (= res!1031973 (validKeyInArray!0 (select (arr!48628 a!2804) j!70)))))

(declare-fun b!1511864 () Bool)

(declare-fun res!1031975 () Bool)

(assert (=> b!1511864 (=> (not res!1031975) (not e!843904))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12822)

(assert (=> b!1511864 (= res!1031975 (= (seekEntry!0 (select (arr!48628 a!2804) j!70) a!2804 mask!2512) (Found!12822 j!70)))))

(declare-fun b!1511865 () Bool)

(assert (=> b!1511865 (= e!843902 e!843903)))

(declare-fun res!1031977 () Bool)

(assert (=> b!1511865 (=> (not res!1031977) (not e!843903))))

(assert (=> b!1511865 (= res!1031977 (= lt!655325 lt!655324))))

(assert (=> b!1511865 (= lt!655324 (Intermediate!12822 false resIndex!21 resX!21))))

(assert (=> b!1511865 (= lt!655325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48628 a!2804) j!70) mask!2512) (select (arr!48628 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511866 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12822)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100780 (_ BitVec 32)) SeekEntryResult!12822)

(assert (=> b!1511866 (= e!843905 (= (seekEntryOrOpen!0 (select (arr!48628 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48628 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511867 () Bool)

(declare-fun res!1031970 () Bool)

(assert (=> b!1511867 (=> (not res!1031970) (not e!843902))))

(assert (=> b!1511867 (= res!1031970 (validKeyInArray!0 (select (arr!48628 a!2804) i!961)))))

(declare-fun b!1511868 () Bool)

(assert (=> b!1511868 (= e!843903 (not (or (not (= (select (arr!48628 a!2804) j!70) (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48628 a!2804) index!487) (select (arr!48628 a!2804) j!70)) (not (= (select (arr!48628 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1511868 e!843904))

(declare-fun res!1031976 () Bool)

(assert (=> b!1511868 (=> (not res!1031976) (not e!843904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100780 (_ BitVec 32)) Bool)

(assert (=> b!1511868 (= res!1031976 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50351 0))(
  ( (Unit!50352) )
))
(declare-fun lt!655326 () Unit!50351)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50351)

(assert (=> b!1511868 (= lt!655326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511869 () Bool)

(declare-fun res!1031969 () Bool)

(assert (=> b!1511869 (=> (not res!1031969) (not e!843902))))

(assert (=> b!1511869 (= res!1031969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128924 res!1031978) b!1511860))

(assert (= (and b!1511860 res!1031966) b!1511867))

(assert (= (and b!1511867 res!1031970) b!1511863))

(assert (= (and b!1511863 res!1031973) b!1511869))

(assert (= (and b!1511869 res!1031969) b!1511857))

(assert (= (and b!1511857 res!1031967) b!1511859))

(assert (= (and b!1511859 res!1031971) b!1511865))

(assert (= (and b!1511865 res!1031977) b!1511862))

(assert (= (and b!1511862 res!1031972) b!1511861))

(assert (= (and b!1511861 res!1031968) b!1511868))

(assert (= (and b!1511868 res!1031976) b!1511864))

(assert (= (and b!1511864 res!1031975) b!1511858))

(assert (= (and b!1511858 (not res!1031974)) b!1511866))

(declare-fun m!1394039 () Bool)

(assert (=> b!1511863 m!1394039))

(assert (=> b!1511863 m!1394039))

(declare-fun m!1394041 () Bool)

(assert (=> b!1511863 m!1394041))

(assert (=> b!1511862 m!1394039))

(assert (=> b!1511862 m!1394039))

(declare-fun m!1394043 () Bool)

(assert (=> b!1511862 m!1394043))

(assert (=> b!1511864 m!1394039))

(assert (=> b!1511864 m!1394039))

(declare-fun m!1394045 () Bool)

(assert (=> b!1511864 m!1394045))

(assert (=> b!1511868 m!1394039))

(declare-fun m!1394047 () Bool)

(assert (=> b!1511868 m!1394047))

(declare-fun m!1394049 () Bool)

(assert (=> b!1511868 m!1394049))

(declare-fun m!1394051 () Bool)

(assert (=> b!1511868 m!1394051))

(declare-fun m!1394053 () Bool)

(assert (=> b!1511868 m!1394053))

(declare-fun m!1394055 () Bool)

(assert (=> b!1511868 m!1394055))

(assert (=> b!1511865 m!1394039))

(assert (=> b!1511865 m!1394039))

(declare-fun m!1394057 () Bool)

(assert (=> b!1511865 m!1394057))

(assert (=> b!1511865 m!1394057))

(assert (=> b!1511865 m!1394039))

(declare-fun m!1394059 () Bool)

(assert (=> b!1511865 m!1394059))

(declare-fun m!1394061 () Bool)

(assert (=> b!1511857 m!1394061))

(assert (=> b!1511866 m!1394039))

(assert (=> b!1511866 m!1394039))

(declare-fun m!1394063 () Bool)

(assert (=> b!1511866 m!1394063))

(assert (=> b!1511866 m!1394039))

(declare-fun m!1394065 () Bool)

(assert (=> b!1511866 m!1394065))

(assert (=> b!1511861 m!1394049))

(assert (=> b!1511861 m!1394053))

(assert (=> b!1511861 m!1394053))

(declare-fun m!1394067 () Bool)

(assert (=> b!1511861 m!1394067))

(assert (=> b!1511861 m!1394067))

(assert (=> b!1511861 m!1394053))

(declare-fun m!1394069 () Bool)

(assert (=> b!1511861 m!1394069))

(declare-fun m!1394071 () Bool)

(assert (=> b!1511869 m!1394071))

(declare-fun m!1394073 () Bool)

(assert (=> start!128924 m!1394073))

(declare-fun m!1394075 () Bool)

(assert (=> start!128924 m!1394075))

(assert (=> b!1511858 m!1394039))

(assert (=> b!1511858 m!1394049))

(assert (=> b!1511858 m!1394053))

(assert (=> b!1511858 m!1394051))

(declare-fun m!1394077 () Bool)

(assert (=> b!1511867 m!1394077))

(assert (=> b!1511867 m!1394077))

(declare-fun m!1394079 () Bool)

(assert (=> b!1511867 m!1394079))

(check-sat (not b!1511857) (not b!1511869) (not b!1511862) (not b!1511867) (not b!1511868) (not b!1511866) (not b!1511864) (not b!1511861) (not start!128924) (not b!1511863) (not b!1511865))
(check-sat)
