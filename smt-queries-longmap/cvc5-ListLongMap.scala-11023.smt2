; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128970 () Bool)

(assert start!128970)

(declare-fun b!1512080 () Bool)

(declare-fun res!1031987 () Bool)

(declare-fun e!844071 () Bool)

(assert (=> b!1512080 (=> (not res!1031987) (not e!844071))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100826 0))(
  ( (array!100827 (arr!48650 (Array (_ BitVec 32) (_ BitVec 64))) (size!49200 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100826)

(assert (=> b!1512080 (= res!1031987 (and (= (size!49200 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49200 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49200 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512081 () Bool)

(declare-fun res!1031991 () Bool)

(declare-fun e!844073 () Bool)

(assert (=> b!1512081 (=> (not res!1031991) (not e!844073))))

(declare-datatypes ((SeekEntryResult!12821 0))(
  ( (MissingZero!12821 (index!53679 (_ BitVec 32))) (Found!12821 (index!53680 (_ BitVec 32))) (Intermediate!12821 (undefined!13633 Bool) (index!53681 (_ BitVec 32)) (x!135411 (_ BitVec 32))) (Undefined!12821) (MissingVacant!12821 (index!53682 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100826 (_ BitVec 32)) SeekEntryResult!12821)

(assert (=> b!1512081 (= res!1031991 (= (seekEntry!0 (select (arr!48650 a!2804) j!70) a!2804 mask!2512) (Found!12821 j!70)))))

(declare-fun b!1512082 () Bool)

(declare-fun res!1031993 () Bool)

(assert (=> b!1512082 (=> (not res!1031993) (not e!844071))))

(declare-datatypes ((List!35133 0))(
  ( (Nil!35130) (Cons!35129 (h!36541 (_ BitVec 64)) (t!49827 List!35133)) )
))
(declare-fun arrayNoDuplicates!0 (array!100826 (_ BitVec 32) List!35133) Bool)

(assert (=> b!1512082 (= res!1031993 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35130))))

(declare-fun b!1512083 () Bool)

(declare-fun e!844075 () Bool)

(assert (=> b!1512083 (= e!844075 (not true))))

(assert (=> b!1512083 e!844073))

(declare-fun res!1031984 () Bool)

(assert (=> b!1512083 (=> (not res!1031984) (not e!844073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100826 (_ BitVec 32)) Bool)

(assert (=> b!1512083 (= res!1031984 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50510 0))(
  ( (Unit!50511) )
))
(declare-fun lt!655593 () Unit!50510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50510)

(assert (=> b!1512083 (= lt!655593 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512084 () Bool)

(declare-fun res!1031985 () Bool)

(assert (=> b!1512084 (=> (not res!1031985) (not e!844075))))

(declare-fun lt!655594 () SeekEntryResult!12821)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100826 (_ BitVec 32)) SeekEntryResult!12821)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512084 (= res!1031985 (= lt!655594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48650 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48650 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100827 (store (arr!48650 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49200 a!2804)) mask!2512)))))

(declare-fun b!1512086 () Bool)

(declare-fun res!1031988 () Bool)

(assert (=> b!1512086 (=> (not res!1031988) (not e!844071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512086 (= res!1031988 (validKeyInArray!0 (select (arr!48650 a!2804) j!70)))))

(declare-fun b!1512087 () Bool)

(declare-fun res!1031995 () Bool)

(assert (=> b!1512087 (=> (not res!1031995) (not e!844071))))

(assert (=> b!1512087 (= res!1031995 (validKeyInArray!0 (select (arr!48650 a!2804) i!961)))))

(declare-fun b!1512088 () Bool)

(declare-fun e!844072 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100826 (_ BitVec 32)) SeekEntryResult!12821)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100826 (_ BitVec 32)) SeekEntryResult!12821)

(assert (=> b!1512088 (= e!844072 (= (seekEntryOrOpen!0 (select (arr!48650 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48650 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512089 () Bool)

(declare-fun res!1031983 () Bool)

(assert (=> b!1512089 (=> (not res!1031983) (not e!844071))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512089 (= res!1031983 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49200 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49200 a!2804))))))

(declare-fun b!1512090 () Bool)

(assert (=> b!1512090 (= e!844073 e!844072)))

(declare-fun res!1031994 () Bool)

(assert (=> b!1512090 (=> res!1031994 e!844072)))

(assert (=> b!1512090 (= res!1031994 (or (not (= (select (arr!48650 a!2804) j!70) (select (store (arr!48650 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48650 a!2804) index!487) (select (arr!48650 a!2804) j!70)) (not (= (select (arr!48650 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1031986 () Bool)

(assert (=> start!128970 (=> (not res!1031986) (not e!844071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128970 (= res!1031986 (validMask!0 mask!2512))))

(assert (=> start!128970 e!844071))

(assert (=> start!128970 true))

(declare-fun array_inv!37678 (array!100826) Bool)

(assert (=> start!128970 (array_inv!37678 a!2804)))

(declare-fun b!1512085 () Bool)

(declare-fun res!1031990 () Bool)

(assert (=> b!1512085 (=> (not res!1031990) (not e!844075))))

(declare-fun lt!655592 () SeekEntryResult!12821)

(assert (=> b!1512085 (= res!1031990 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48650 a!2804) j!70) a!2804 mask!2512) lt!655592))))

(declare-fun b!1512091 () Bool)

(assert (=> b!1512091 (= e!844071 e!844075)))

(declare-fun res!1031989 () Bool)

(assert (=> b!1512091 (=> (not res!1031989) (not e!844075))))

(assert (=> b!1512091 (= res!1031989 (= lt!655594 lt!655592))))

(assert (=> b!1512091 (= lt!655592 (Intermediate!12821 false resIndex!21 resX!21))))

(assert (=> b!1512091 (= lt!655594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48650 a!2804) j!70) mask!2512) (select (arr!48650 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512092 () Bool)

(declare-fun res!1031992 () Bool)

(assert (=> b!1512092 (=> (not res!1031992) (not e!844071))))

(assert (=> b!1512092 (= res!1031992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128970 res!1031986) b!1512080))

(assert (= (and b!1512080 res!1031987) b!1512087))

(assert (= (and b!1512087 res!1031995) b!1512086))

(assert (= (and b!1512086 res!1031988) b!1512092))

(assert (= (and b!1512092 res!1031992) b!1512082))

(assert (= (and b!1512082 res!1031993) b!1512089))

(assert (= (and b!1512089 res!1031983) b!1512091))

(assert (= (and b!1512091 res!1031989) b!1512085))

(assert (= (and b!1512085 res!1031990) b!1512084))

(assert (= (and b!1512084 res!1031985) b!1512083))

(assert (= (and b!1512083 res!1031984) b!1512081))

(assert (= (and b!1512081 res!1031991) b!1512090))

(assert (= (and b!1512090 (not res!1031994)) b!1512088))

(declare-fun m!1394821 () Bool)

(assert (=> b!1512084 m!1394821))

(declare-fun m!1394823 () Bool)

(assert (=> b!1512084 m!1394823))

(assert (=> b!1512084 m!1394823))

(declare-fun m!1394825 () Bool)

(assert (=> b!1512084 m!1394825))

(assert (=> b!1512084 m!1394825))

(assert (=> b!1512084 m!1394823))

(declare-fun m!1394827 () Bool)

(assert (=> b!1512084 m!1394827))

(declare-fun m!1394829 () Bool)

(assert (=> b!1512090 m!1394829))

(assert (=> b!1512090 m!1394821))

(assert (=> b!1512090 m!1394823))

(declare-fun m!1394831 () Bool)

(assert (=> b!1512090 m!1394831))

(assert (=> b!1512088 m!1394829))

(assert (=> b!1512088 m!1394829))

(declare-fun m!1394833 () Bool)

(assert (=> b!1512088 m!1394833))

(assert (=> b!1512088 m!1394829))

(declare-fun m!1394835 () Bool)

(assert (=> b!1512088 m!1394835))

(declare-fun m!1394837 () Bool)

(assert (=> b!1512083 m!1394837))

(declare-fun m!1394839 () Bool)

(assert (=> b!1512083 m!1394839))

(assert (=> b!1512085 m!1394829))

(assert (=> b!1512085 m!1394829))

(declare-fun m!1394841 () Bool)

(assert (=> b!1512085 m!1394841))

(declare-fun m!1394843 () Bool)

(assert (=> b!1512082 m!1394843))

(assert (=> b!1512081 m!1394829))

(assert (=> b!1512081 m!1394829))

(declare-fun m!1394845 () Bool)

(assert (=> b!1512081 m!1394845))

(assert (=> b!1512086 m!1394829))

(assert (=> b!1512086 m!1394829))

(declare-fun m!1394847 () Bool)

(assert (=> b!1512086 m!1394847))

(declare-fun m!1394849 () Bool)

(assert (=> b!1512092 m!1394849))

(declare-fun m!1394851 () Bool)

(assert (=> b!1512087 m!1394851))

(assert (=> b!1512087 m!1394851))

(declare-fun m!1394853 () Bool)

(assert (=> b!1512087 m!1394853))

(declare-fun m!1394855 () Bool)

(assert (=> start!128970 m!1394855))

(declare-fun m!1394857 () Bool)

(assert (=> start!128970 m!1394857))

(assert (=> b!1512091 m!1394829))

(assert (=> b!1512091 m!1394829))

(declare-fun m!1394859 () Bool)

(assert (=> b!1512091 m!1394859))

(assert (=> b!1512091 m!1394859))

(assert (=> b!1512091 m!1394829))

(declare-fun m!1394861 () Bool)

(assert (=> b!1512091 m!1394861))

(push 1)

