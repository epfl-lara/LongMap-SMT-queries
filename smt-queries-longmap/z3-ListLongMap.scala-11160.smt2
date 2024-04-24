; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130824 () Bool)

(assert start!130824)

(declare-fun b!1533216 () Bool)

(declare-fun res!1049075 () Bool)

(declare-fun e!854482 () Bool)

(assert (=> b!1533216 (=> (not res!1049075) (not e!854482))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101797 0))(
  ( (array!101798 (arr!49114 (Array (_ BitVec 32) (_ BitVec 64))) (size!49665 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101797)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13172 0))(
  ( (MissingZero!13172 (index!55083 (_ BitVec 32))) (Found!13172 (index!55084 (_ BitVec 32))) (Intermediate!13172 (undefined!13984 Bool) (index!55085 (_ BitVec 32)) (x!136988 (_ BitVec 32))) (Undefined!13172) (MissingVacant!13172 (index!55086 (_ BitVec 32))) )
))
(declare-fun lt!663906 () SeekEntryResult!13172)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101797 (_ BitVec 32)) SeekEntryResult!13172)

(assert (=> b!1533216 (= res!1049075 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49114 a!2804) j!70) a!2804 mask!2512) lt!663906))))

(declare-fun b!1533217 () Bool)

(declare-fun e!854481 () Bool)

(assert (=> b!1533217 (= e!854481 true)))

(declare-fun lt!663904 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533217 (= lt!663904 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1533218 () Bool)

(declare-fun e!854485 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101797 (_ BitVec 32)) SeekEntryResult!13172)

(assert (=> b!1533218 (= e!854485 (= (seekEntry!0 (select (arr!49114 a!2804) j!70) a!2804 mask!2512) (Found!13172 j!70)))))

(declare-fun b!1533219 () Bool)

(declare-fun e!854484 () Bool)

(assert (=> b!1533219 (= e!854484 e!854482)))

(declare-fun res!1049071 () Bool)

(assert (=> b!1533219 (=> (not res!1049071) (not e!854482))))

(declare-fun lt!663905 () SeekEntryResult!13172)

(assert (=> b!1533219 (= res!1049071 (= lt!663905 lt!663906))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1533219 (= lt!663906 (Intermediate!13172 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1533219 (= lt!663905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49114 a!2804) j!70) mask!2512) (select (arr!49114 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1533220 () Bool)

(declare-fun res!1049079 () Bool)

(assert (=> b!1533220 (=> (not res!1049079) (not e!854484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101797 (_ BitVec 32)) Bool)

(assert (=> b!1533220 (= res!1049079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1533221 () Bool)

(declare-fun res!1049082 () Bool)

(assert (=> b!1533221 (=> (not res!1049082) (not e!854484))))

(assert (=> b!1533221 (= res!1049082 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49665 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49665 a!2804))))))

(declare-fun res!1049074 () Bool)

(assert (=> start!130824 (=> (not res!1049074) (not e!854484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130824 (= res!1049074 (validMask!0 mask!2512))))

(assert (=> start!130824 e!854484))

(assert (=> start!130824 true))

(declare-fun array_inv!38395 (array!101797) Bool)

(assert (=> start!130824 (array_inv!38395 a!2804)))

(declare-fun b!1533222 () Bool)

(declare-fun res!1049076 () Bool)

(assert (=> b!1533222 (=> (not res!1049076) (not e!854482))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1533222 (= res!1049076 (= lt!663905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49114 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49114 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101798 (store (arr!49114 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49665 a!2804)) mask!2512)))))

(declare-fun b!1533223 () Bool)

(declare-fun res!1049081 () Bool)

(assert (=> b!1533223 (=> (not res!1049081) (not e!854484))))

(assert (=> b!1533223 (= res!1049081 (and (= (size!49665 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49665 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49665 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1533224 () Bool)

(declare-fun res!1049073 () Bool)

(assert (=> b!1533224 (=> (not res!1049073) (not e!854484))))

(declare-datatypes ((List!35584 0))(
  ( (Nil!35581) (Cons!35580 (h!37040 (_ BitVec 64)) (t!50270 List!35584)) )
))
(declare-fun arrayNoDuplicates!0 (array!101797 (_ BitVec 32) List!35584) Bool)

(assert (=> b!1533224 (= res!1049073 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35581))))

(declare-fun b!1533225 () Bool)

(declare-fun res!1049077 () Bool)

(assert (=> b!1533225 (=> (not res!1049077) (not e!854484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533225 (= res!1049077 (validKeyInArray!0 (select (arr!49114 a!2804) i!961)))))

(declare-fun b!1533226 () Bool)

(declare-fun res!1049072 () Bool)

(assert (=> b!1533226 (=> (not res!1049072) (not e!854484))))

(assert (=> b!1533226 (= res!1049072 (validKeyInArray!0 (select (arr!49114 a!2804) j!70)))))

(declare-fun b!1533227 () Bool)

(assert (=> b!1533227 (= e!854482 (not e!854481))))

(declare-fun res!1049080 () Bool)

(assert (=> b!1533227 (=> res!1049080 e!854481)))

(assert (=> b!1533227 (= res!1049080 (or (not (= (select (arr!49114 a!2804) j!70) (select (store (arr!49114 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1533227 e!854485))

(declare-fun res!1049078 () Bool)

(assert (=> b!1533227 (=> (not res!1049078) (not e!854485))))

(assert (=> b!1533227 (= res!1049078 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51163 0))(
  ( (Unit!51164) )
))
(declare-fun lt!663903 () Unit!51163)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51163)

(assert (=> b!1533227 (= lt!663903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130824 res!1049074) b!1533223))

(assert (= (and b!1533223 res!1049081) b!1533225))

(assert (= (and b!1533225 res!1049077) b!1533226))

(assert (= (and b!1533226 res!1049072) b!1533220))

(assert (= (and b!1533220 res!1049079) b!1533224))

(assert (= (and b!1533224 res!1049073) b!1533221))

(assert (= (and b!1533221 res!1049082) b!1533219))

(assert (= (and b!1533219 res!1049071) b!1533216))

(assert (= (and b!1533216 res!1049075) b!1533222))

(assert (= (and b!1533222 res!1049076) b!1533227))

(assert (= (and b!1533227 res!1049078) b!1533218))

(assert (= (and b!1533227 (not res!1049080)) b!1533217))

(declare-fun m!1415845 () Bool)

(assert (=> b!1533218 m!1415845))

(assert (=> b!1533218 m!1415845))

(declare-fun m!1415847 () Bool)

(assert (=> b!1533218 m!1415847))

(declare-fun m!1415849 () Bool)

(assert (=> b!1533222 m!1415849))

(declare-fun m!1415851 () Bool)

(assert (=> b!1533222 m!1415851))

(assert (=> b!1533222 m!1415851))

(declare-fun m!1415853 () Bool)

(assert (=> b!1533222 m!1415853))

(assert (=> b!1533222 m!1415853))

(assert (=> b!1533222 m!1415851))

(declare-fun m!1415855 () Bool)

(assert (=> b!1533222 m!1415855))

(declare-fun m!1415857 () Bool)

(assert (=> b!1533224 m!1415857))

(assert (=> b!1533226 m!1415845))

(assert (=> b!1533226 m!1415845))

(declare-fun m!1415859 () Bool)

(assert (=> b!1533226 m!1415859))

(declare-fun m!1415861 () Bool)

(assert (=> b!1533225 m!1415861))

(assert (=> b!1533225 m!1415861))

(declare-fun m!1415863 () Bool)

(assert (=> b!1533225 m!1415863))

(assert (=> b!1533227 m!1415845))

(declare-fun m!1415865 () Bool)

(assert (=> b!1533227 m!1415865))

(assert (=> b!1533227 m!1415849))

(assert (=> b!1533227 m!1415851))

(declare-fun m!1415867 () Bool)

(assert (=> b!1533227 m!1415867))

(declare-fun m!1415869 () Bool)

(assert (=> b!1533217 m!1415869))

(assert (=> b!1533219 m!1415845))

(assert (=> b!1533219 m!1415845))

(declare-fun m!1415871 () Bool)

(assert (=> b!1533219 m!1415871))

(assert (=> b!1533219 m!1415871))

(assert (=> b!1533219 m!1415845))

(declare-fun m!1415873 () Bool)

(assert (=> b!1533219 m!1415873))

(declare-fun m!1415875 () Bool)

(assert (=> b!1533220 m!1415875))

(declare-fun m!1415877 () Bool)

(assert (=> start!130824 m!1415877))

(declare-fun m!1415879 () Bool)

(assert (=> start!130824 m!1415879))

(assert (=> b!1533216 m!1415845))

(assert (=> b!1533216 m!1415845))

(declare-fun m!1415881 () Bool)

(assert (=> b!1533216 m!1415881))

(check-sat (not b!1533226) (not b!1533227) (not b!1533218) (not b!1533219) (not b!1533222) (not start!130824) (not b!1533224) (not b!1533216) (not b!1533217) (not b!1533225) (not b!1533220))
(check-sat)
