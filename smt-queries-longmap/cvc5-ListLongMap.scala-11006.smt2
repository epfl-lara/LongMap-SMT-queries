; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128868 () Bool)

(assert start!128868)

(declare-fun b!1510305 () Bool)

(declare-fun res!1030211 () Bool)

(declare-fun e!843407 () Bool)

(assert (=> b!1510305 (=> (not res!1030211) (not e!843407))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100724 0))(
  ( (array!100725 (arr!48599 (Array (_ BitVec 32) (_ BitVec 64))) (size!49149 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100724)

(assert (=> b!1510305 (= res!1030211 (and (= (size!49149 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49149 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49149 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510306 () Bool)

(declare-fun res!1030208 () Bool)

(assert (=> b!1510306 (=> (not res!1030208) (not e!843407))))

(declare-datatypes ((List!35082 0))(
  ( (Nil!35079) (Cons!35078 (h!36490 (_ BitVec 64)) (t!49776 List!35082)) )
))
(declare-fun arrayNoDuplicates!0 (array!100724 (_ BitVec 32) List!35082) Bool)

(assert (=> b!1510306 (= res!1030208 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35079))))

(declare-fun b!1510307 () Bool)

(declare-fun e!843409 () Bool)

(assert (=> b!1510307 (= e!843407 e!843409)))

(declare-fun res!1030210 () Bool)

(assert (=> b!1510307 (=> (not res!1030210) (not e!843409))))

(declare-datatypes ((SeekEntryResult!12770 0))(
  ( (MissingZero!12770 (index!53475 (_ BitVec 32))) (Found!12770 (index!53476 (_ BitVec 32))) (Intermediate!12770 (undefined!13582 Bool) (index!53477 (_ BitVec 32)) (x!135224 (_ BitVec 32))) (Undefined!12770) (MissingVacant!12770 (index!53478 (_ BitVec 32))) )
))
(declare-fun lt!655133 () SeekEntryResult!12770)

(declare-fun lt!655134 () SeekEntryResult!12770)

(assert (=> b!1510307 (= res!1030210 (= lt!655133 lt!655134))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510307 (= lt!655134 (Intermediate!12770 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100724 (_ BitVec 32)) SeekEntryResult!12770)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510307 (= lt!655133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48599 a!2804) j!70) mask!2512) (select (arr!48599 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510308 () Bool)

(declare-fun res!1030214 () Bool)

(assert (=> b!1510308 (=> (not res!1030214) (not e!843407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100724 (_ BitVec 32)) Bool)

(assert (=> b!1510308 (= res!1030214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030217 () Bool)

(assert (=> start!128868 (=> (not res!1030217) (not e!843407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128868 (= res!1030217 (validMask!0 mask!2512))))

(assert (=> start!128868 e!843407))

(assert (=> start!128868 true))

(declare-fun array_inv!37627 (array!100724) Bool)

(assert (=> start!128868 (array_inv!37627 a!2804)))

(declare-fun e!843408 () Bool)

(declare-fun b!1510309 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510309 (= e!843408 (validKeyInArray!0 (select (store (arr!48599 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1510310 () Bool)

(assert (=> b!1510310 (= e!843409 (not e!843408))))

(declare-fun res!1030218 () Bool)

(assert (=> b!1510310 (=> res!1030218 e!843408)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510310 (= res!1030218 (or (not (= (select (arr!48599 a!2804) j!70) (select (store (arr!48599 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48599 a!2804) index!487) (select (arr!48599 a!2804) j!70))) (not (= j!70 index!487)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun e!843405 () Bool)

(assert (=> b!1510310 e!843405))

(declare-fun res!1030209 () Bool)

(assert (=> b!1510310 (=> (not res!1030209) (not e!843405))))

(assert (=> b!1510310 (= res!1030209 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50408 0))(
  ( (Unit!50409) )
))
(declare-fun lt!655135 () Unit!50408)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50408)

(assert (=> b!1510310 (= lt!655135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510311 () Bool)

(declare-fun res!1030219 () Bool)

(assert (=> b!1510311 (=> (not res!1030219) (not e!843407))))

(assert (=> b!1510311 (= res!1030219 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49149 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49149 a!2804))))))

(declare-fun b!1510312 () Bool)

(declare-fun res!1030215 () Bool)

(assert (=> b!1510312 (=> (not res!1030215) (not e!843407))))

(assert (=> b!1510312 (= res!1030215 (validKeyInArray!0 (select (arr!48599 a!2804) j!70)))))

(declare-fun b!1510313 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100724 (_ BitVec 32)) SeekEntryResult!12770)

(assert (=> b!1510313 (= e!843405 (= (seekEntry!0 (select (arr!48599 a!2804) j!70) a!2804 mask!2512) (Found!12770 j!70)))))

(declare-fun b!1510314 () Bool)

(declare-fun res!1030216 () Bool)

(assert (=> b!1510314 (=> (not res!1030216) (not e!843409))))

(assert (=> b!1510314 (= res!1030216 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48599 a!2804) j!70) a!2804 mask!2512) lt!655134))))

(declare-fun b!1510315 () Bool)

(declare-fun res!1030212 () Bool)

(assert (=> b!1510315 (=> (not res!1030212) (not e!843407))))

(assert (=> b!1510315 (= res!1030212 (validKeyInArray!0 (select (arr!48599 a!2804) i!961)))))

(declare-fun b!1510316 () Bool)

(declare-fun res!1030213 () Bool)

(assert (=> b!1510316 (=> (not res!1030213) (not e!843409))))

(assert (=> b!1510316 (= res!1030213 (= lt!655133 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48599 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48599 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100725 (store (arr!48599 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49149 a!2804)) mask!2512)))))

(assert (= (and start!128868 res!1030217) b!1510305))

(assert (= (and b!1510305 res!1030211) b!1510315))

(assert (= (and b!1510315 res!1030212) b!1510312))

(assert (= (and b!1510312 res!1030215) b!1510308))

(assert (= (and b!1510308 res!1030214) b!1510306))

(assert (= (and b!1510306 res!1030208) b!1510311))

(assert (= (and b!1510311 res!1030219) b!1510307))

(assert (= (and b!1510307 res!1030210) b!1510314))

(assert (= (and b!1510314 res!1030216) b!1510316))

(assert (= (and b!1510316 res!1030213) b!1510310))

(assert (= (and b!1510310 res!1030209) b!1510313))

(assert (= (and b!1510310 (not res!1030218)) b!1510309))

(declare-fun m!1392877 () Bool)

(assert (=> b!1510307 m!1392877))

(assert (=> b!1510307 m!1392877))

(declare-fun m!1392879 () Bool)

(assert (=> b!1510307 m!1392879))

(assert (=> b!1510307 m!1392879))

(assert (=> b!1510307 m!1392877))

(declare-fun m!1392881 () Bool)

(assert (=> b!1510307 m!1392881))

(assert (=> b!1510314 m!1392877))

(assert (=> b!1510314 m!1392877))

(declare-fun m!1392883 () Bool)

(assert (=> b!1510314 m!1392883))

(declare-fun m!1392885 () Bool)

(assert (=> b!1510308 m!1392885))

(assert (=> b!1510312 m!1392877))

(assert (=> b!1510312 m!1392877))

(declare-fun m!1392887 () Bool)

(assert (=> b!1510312 m!1392887))

(declare-fun m!1392889 () Bool)

(assert (=> b!1510316 m!1392889))

(declare-fun m!1392891 () Bool)

(assert (=> b!1510316 m!1392891))

(assert (=> b!1510316 m!1392891))

(declare-fun m!1392893 () Bool)

(assert (=> b!1510316 m!1392893))

(assert (=> b!1510316 m!1392893))

(assert (=> b!1510316 m!1392891))

(declare-fun m!1392895 () Bool)

(assert (=> b!1510316 m!1392895))

(assert (=> b!1510310 m!1392877))

(declare-fun m!1392897 () Bool)

(assert (=> b!1510310 m!1392897))

(assert (=> b!1510310 m!1392889))

(declare-fun m!1392899 () Bool)

(assert (=> b!1510310 m!1392899))

(assert (=> b!1510310 m!1392891))

(declare-fun m!1392901 () Bool)

(assert (=> b!1510310 m!1392901))

(assert (=> b!1510309 m!1392889))

(assert (=> b!1510309 m!1392891))

(assert (=> b!1510309 m!1392891))

(declare-fun m!1392903 () Bool)

(assert (=> b!1510309 m!1392903))

(declare-fun m!1392905 () Bool)

(assert (=> b!1510315 m!1392905))

(assert (=> b!1510315 m!1392905))

(declare-fun m!1392907 () Bool)

(assert (=> b!1510315 m!1392907))

(declare-fun m!1392909 () Bool)

(assert (=> b!1510306 m!1392909))

(declare-fun m!1392911 () Bool)

(assert (=> start!128868 m!1392911))

(declare-fun m!1392913 () Bool)

(assert (=> start!128868 m!1392913))

(assert (=> b!1510313 m!1392877))

(assert (=> b!1510313 m!1392877))

(declare-fun m!1392915 () Bool)

(assert (=> b!1510313 m!1392915))

(push 1)

