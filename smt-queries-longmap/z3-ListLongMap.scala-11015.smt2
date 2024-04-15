; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128870 () Bool)

(assert start!128870)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!843523 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100726 0))(
  ( (array!100727 (arr!48601 (Array (_ BitVec 32) (_ BitVec 64))) (size!49153 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100726)

(declare-fun b!1510863 () Bool)

(declare-datatypes ((SeekEntryResult!12795 0))(
  ( (MissingZero!12795 (index!53575 (_ BitVec 32))) (Found!12795 (index!53576 (_ BitVec 32))) (Intermediate!12795 (undefined!13607 Bool) (index!53577 (_ BitVec 32)) (x!135315 (_ BitVec 32))) (Undefined!12795) (MissingVacant!12795 (index!53578 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100726 (_ BitVec 32)) SeekEntryResult!12795)

(assert (=> b!1510863 (= e!843523 (= (seekEntry!0 (select (arr!48601 a!2804) j!70) a!2804 mask!2512) (Found!12795 j!70)))))

(declare-fun b!1510865 () Bool)

(declare-fun e!843522 () Bool)

(declare-fun e!843524 () Bool)

(assert (=> b!1510865 (= e!843522 e!843524)))

(declare-fun res!1030975 () Bool)

(assert (=> b!1510865 (=> (not res!1030975) (not e!843524))))

(declare-fun lt!655082 () SeekEntryResult!12795)

(declare-fun lt!655083 () SeekEntryResult!12795)

(assert (=> b!1510865 (= res!1030975 (= lt!655082 lt!655083))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510865 (= lt!655083 (Intermediate!12795 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100726 (_ BitVec 32)) SeekEntryResult!12795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510865 (= lt!655082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48601 a!2804) j!70) mask!2512) (select (arr!48601 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510866 () Bool)

(declare-fun res!1030977 () Bool)

(assert (=> b!1510866 (=> (not res!1030977) (not e!843522))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510866 (= res!1030977 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49153 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49153 a!2804))))))

(declare-fun b!1510867 () Bool)

(declare-fun res!1030978 () Bool)

(assert (=> b!1510867 (=> (not res!1030978) (not e!843524))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510867 (= res!1030978 (= lt!655082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100727 (store (arr!48601 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49153 a!2804)) mask!2512)))))

(declare-fun b!1510868 () Bool)

(declare-fun res!1030974 () Bool)

(assert (=> b!1510868 (=> (not res!1030974) (not e!843522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510868 (= res!1030974 (validKeyInArray!0 (select (arr!48601 a!2804) i!961)))))

(declare-fun b!1510869 () Bool)

(declare-fun res!1030982 () Bool)

(assert (=> b!1510869 (=> (not res!1030982) (not e!843522))))

(assert (=> b!1510869 (= res!1030982 (validKeyInArray!0 (select (arr!48601 a!2804) j!70)))))

(declare-fun b!1510870 () Bool)

(declare-fun res!1030972 () Bool)

(assert (=> b!1510870 (=> (not res!1030972) (not e!843522))))

(declare-datatypes ((List!35162 0))(
  ( (Nil!35159) (Cons!35158 (h!36571 (_ BitVec 64)) (t!49848 List!35162)) )
))
(declare-fun arrayNoDuplicates!0 (array!100726 (_ BitVec 32) List!35162) Bool)

(assert (=> b!1510870 (= res!1030972 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35159))))

(declare-fun b!1510871 () Bool)

(declare-fun res!1030976 () Bool)

(assert (=> b!1510871 (=> (not res!1030976) (not e!843522))))

(assert (=> b!1510871 (= res!1030976 (and (= (size!49153 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49153 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49153 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1030979 () Bool)

(assert (=> start!128870 (=> (not res!1030979) (not e!843522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128870 (= res!1030979 (validMask!0 mask!2512))))

(assert (=> start!128870 e!843522))

(assert (=> start!128870 true))

(declare-fun array_inv!37834 (array!100726) Bool)

(assert (=> start!128870 (array_inv!37834 a!2804)))

(declare-fun b!1510864 () Bool)

(declare-fun res!1030980 () Bool)

(assert (=> b!1510864 (=> (not res!1030980) (not e!843524))))

(assert (=> b!1510864 (= res!1030980 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48601 a!2804) j!70) a!2804 mask!2512) lt!655083))))

(declare-fun b!1510872 () Bool)

(declare-fun res!1030981 () Bool)

(assert (=> b!1510872 (=> (not res!1030981) (not e!843522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100726 (_ BitVec 32)) Bool)

(assert (=> b!1510872 (= res!1030981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510873 () Bool)

(assert (=> b!1510873 (= e!843524 (not true))))

(assert (=> b!1510873 e!843523))

(declare-fun res!1030973 () Bool)

(assert (=> b!1510873 (=> (not res!1030973) (not e!843523))))

(assert (=> b!1510873 (= res!1030973 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50297 0))(
  ( (Unit!50298) )
))
(declare-fun lt!655081 () Unit!50297)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100726 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50297)

(assert (=> b!1510873 (= lt!655081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128870 res!1030979) b!1510871))

(assert (= (and b!1510871 res!1030976) b!1510868))

(assert (= (and b!1510868 res!1030974) b!1510869))

(assert (= (and b!1510869 res!1030982) b!1510872))

(assert (= (and b!1510872 res!1030981) b!1510870))

(assert (= (and b!1510870 res!1030972) b!1510866))

(assert (= (and b!1510866 res!1030977) b!1510865))

(assert (= (and b!1510865 res!1030975) b!1510864))

(assert (= (and b!1510864 res!1030980) b!1510867))

(assert (= (and b!1510867 res!1030978) b!1510873))

(assert (= (and b!1510873 res!1030973) b!1510863))

(declare-fun m!1392971 () Bool)

(assert (=> b!1510872 m!1392971))

(declare-fun m!1392973 () Bool)

(assert (=> b!1510864 m!1392973))

(assert (=> b!1510864 m!1392973))

(declare-fun m!1392975 () Bool)

(assert (=> b!1510864 m!1392975))

(assert (=> b!1510869 m!1392973))

(assert (=> b!1510869 m!1392973))

(declare-fun m!1392977 () Bool)

(assert (=> b!1510869 m!1392977))

(declare-fun m!1392979 () Bool)

(assert (=> b!1510870 m!1392979))

(declare-fun m!1392981 () Bool)

(assert (=> b!1510873 m!1392981))

(declare-fun m!1392983 () Bool)

(assert (=> b!1510873 m!1392983))

(declare-fun m!1392985 () Bool)

(assert (=> start!128870 m!1392985))

(declare-fun m!1392987 () Bool)

(assert (=> start!128870 m!1392987))

(declare-fun m!1392989 () Bool)

(assert (=> b!1510867 m!1392989))

(declare-fun m!1392991 () Bool)

(assert (=> b!1510867 m!1392991))

(assert (=> b!1510867 m!1392991))

(declare-fun m!1392993 () Bool)

(assert (=> b!1510867 m!1392993))

(assert (=> b!1510867 m!1392993))

(assert (=> b!1510867 m!1392991))

(declare-fun m!1392995 () Bool)

(assert (=> b!1510867 m!1392995))

(declare-fun m!1392997 () Bool)

(assert (=> b!1510868 m!1392997))

(assert (=> b!1510868 m!1392997))

(declare-fun m!1392999 () Bool)

(assert (=> b!1510868 m!1392999))

(assert (=> b!1510863 m!1392973))

(assert (=> b!1510863 m!1392973))

(declare-fun m!1393001 () Bool)

(assert (=> b!1510863 m!1393001))

(assert (=> b!1510865 m!1392973))

(assert (=> b!1510865 m!1392973))

(declare-fun m!1393003 () Bool)

(assert (=> b!1510865 m!1393003))

(assert (=> b!1510865 m!1393003))

(assert (=> b!1510865 m!1392973))

(declare-fun m!1393005 () Bool)

(assert (=> b!1510865 m!1393005))

(check-sat (not b!1510865) (not start!128870) (not b!1510867) (not b!1510863) (not b!1510869) (not b!1510864) (not b!1510872) (not b!1510873) (not b!1510870) (not b!1510868))
(check-sat)
