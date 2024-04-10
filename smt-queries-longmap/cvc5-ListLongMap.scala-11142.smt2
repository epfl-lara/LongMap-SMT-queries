; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130214 () Bool)

(assert start!130214)

(declare-fun b!1528391 () Bool)

(declare-fun e!851857 () Bool)

(declare-fun e!851859 () Bool)

(assert (=> b!1528391 (= e!851857 e!851859)))

(declare-fun res!1046106 () Bool)

(assert (=> b!1528391 (=> (not res!1046106) (not e!851859))))

(declare-datatypes ((SeekEntryResult!13172 0))(
  ( (MissingZero!13172 (index!55083 (_ BitVec 32))) (Found!13172 (index!55084 (_ BitVec 32))) (Intermediate!13172 (undefined!13984 Bool) (index!55085 (_ BitVec 32)) (x!136779 (_ BitVec 32))) (Undefined!13172) (MissingVacant!13172 (index!55086 (_ BitVec 32))) )
))
(declare-fun lt!661950 () SeekEntryResult!13172)

(declare-fun lt!661945 () SeekEntryResult!13172)

(assert (=> b!1528391 (= res!1046106 (= lt!661950 lt!661945))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528391 (= lt!661945 (Intermediate!13172 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101564 0))(
  ( (array!101565 (arr!49007 (Array (_ BitVec 32) (_ BitVec 64))) (size!49557 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101564)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101564 (_ BitVec 32)) SeekEntryResult!13172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528391 (= lt!661950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49007 a!2804) j!70) mask!2512) (select (arr!49007 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528392 () Bool)

(declare-fun res!1046110 () Bool)

(assert (=> b!1528392 (=> (not res!1046110) (not e!851857))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528392 (= res!1046110 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49557 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49557 a!2804))))))

(declare-fun res!1046099 () Bool)

(assert (=> start!130214 (=> (not res!1046099) (not e!851857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130214 (= res!1046099 (validMask!0 mask!2512))))

(assert (=> start!130214 e!851857))

(assert (=> start!130214 true))

(declare-fun array_inv!38035 (array!101564) Bool)

(assert (=> start!130214 (array_inv!38035 a!2804)))

(declare-fun b!1528393 () Bool)

(declare-fun e!851854 () Bool)

(declare-fun e!851856 () Bool)

(assert (=> b!1528393 (= e!851854 e!851856)))

(declare-fun res!1046101 () Bool)

(assert (=> b!1528393 (=> res!1046101 e!851856)))

(declare-fun lt!661947 () SeekEntryResult!13172)

(assert (=> b!1528393 (= res!1046101 (not (= lt!661947 (Found!13172 j!70))))))

(declare-fun lt!661948 () SeekEntryResult!13172)

(declare-fun lt!661944 () SeekEntryResult!13172)

(assert (=> b!1528393 (= lt!661948 lt!661944)))

(declare-fun lt!661951 () (_ BitVec 64))

(declare-fun lt!661942 () array!101564)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101564 (_ BitVec 32)) SeekEntryResult!13172)

(assert (=> b!1528393 (= lt!661944 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661951 lt!661942 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101564 (_ BitVec 32)) SeekEntryResult!13172)

(assert (=> b!1528393 (= lt!661948 (seekEntryOrOpen!0 lt!661951 lt!661942 mask!2512))))

(declare-fun lt!661943 () SeekEntryResult!13172)

(assert (=> b!1528393 (= lt!661943 lt!661947)))

(assert (=> b!1528393 (= lt!661947 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49007 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528393 (= lt!661943 (seekEntryOrOpen!0 (select (arr!49007 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528394 () Bool)

(declare-fun res!1046108 () Bool)

(assert (=> b!1528394 (=> (not res!1046108) (not e!851857))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528394 (= res!1046108 (validKeyInArray!0 (select (arr!49007 a!2804) i!961)))))

(declare-fun b!1528395 () Bool)

(declare-fun res!1046103 () Bool)

(assert (=> b!1528395 (=> (not res!1046103) (not e!851857))))

(assert (=> b!1528395 (= res!1046103 (and (= (size!49557 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49557 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49557 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528396 () Bool)

(assert (=> b!1528396 (= e!851856 true)))

(assert (=> b!1528396 (= lt!661944 lt!661947)))

(declare-datatypes ((Unit!51128 0))(
  ( (Unit!51129) )
))
(declare-fun lt!661949 () Unit!51128)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51128)

(assert (=> b!1528396 (= lt!661949 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528397 () Bool)

(declare-fun e!851858 () Bool)

(assert (=> b!1528397 (= e!851858 (not e!851854))))

(declare-fun res!1046107 () Bool)

(assert (=> b!1528397 (=> res!1046107 e!851854)))

(assert (=> b!1528397 (= res!1046107 (or (not (= (select (arr!49007 a!2804) j!70) lt!661951)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49007 a!2804) index!487) (select (arr!49007 a!2804) j!70)) (not (= (select (arr!49007 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851855 () Bool)

(assert (=> b!1528397 e!851855))

(declare-fun res!1046104 () Bool)

(assert (=> b!1528397 (=> (not res!1046104) (not e!851855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101564 (_ BitVec 32)) Bool)

(assert (=> b!1528397 (= res!1046104 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!661946 () Unit!51128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101564 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51128)

(assert (=> b!1528397 (= lt!661946 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528398 () Bool)

(declare-fun res!1046100 () Bool)

(assert (=> b!1528398 (=> (not res!1046100) (not e!851857))))

(assert (=> b!1528398 (= res!1046100 (validKeyInArray!0 (select (arr!49007 a!2804) j!70)))))

(declare-fun b!1528399 () Bool)

(declare-fun res!1046105 () Bool)

(assert (=> b!1528399 (=> (not res!1046105) (not e!851859))))

(assert (=> b!1528399 (= res!1046105 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49007 a!2804) j!70) a!2804 mask!2512) lt!661945))))

(declare-fun b!1528400 () Bool)

(declare-fun res!1046098 () Bool)

(assert (=> b!1528400 (=> (not res!1046098) (not e!851857))))

(declare-datatypes ((List!35490 0))(
  ( (Nil!35487) (Cons!35486 (h!36922 (_ BitVec 64)) (t!50184 List!35490)) )
))
(declare-fun arrayNoDuplicates!0 (array!101564 (_ BitVec 32) List!35490) Bool)

(assert (=> b!1528400 (= res!1046098 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35487))))

(declare-fun b!1528401 () Bool)

(assert (=> b!1528401 (= e!851859 e!851858)))

(declare-fun res!1046109 () Bool)

(assert (=> b!1528401 (=> (not res!1046109) (not e!851858))))

(assert (=> b!1528401 (= res!1046109 (= lt!661950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661951 mask!2512) lt!661951 lt!661942 mask!2512)))))

(assert (=> b!1528401 (= lt!661951 (select (store (arr!49007 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528401 (= lt!661942 (array!101565 (store (arr!49007 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49557 a!2804)))))

(declare-fun b!1528402 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101564 (_ BitVec 32)) SeekEntryResult!13172)

(assert (=> b!1528402 (= e!851855 (= (seekEntry!0 (select (arr!49007 a!2804) j!70) a!2804 mask!2512) (Found!13172 j!70)))))

(declare-fun b!1528403 () Bool)

(declare-fun res!1046102 () Bool)

(assert (=> b!1528403 (=> (not res!1046102) (not e!851857))))

(assert (=> b!1528403 (= res!1046102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130214 res!1046099) b!1528395))

(assert (= (and b!1528395 res!1046103) b!1528394))

(assert (= (and b!1528394 res!1046108) b!1528398))

(assert (= (and b!1528398 res!1046100) b!1528403))

(assert (= (and b!1528403 res!1046102) b!1528400))

(assert (= (and b!1528400 res!1046098) b!1528392))

(assert (= (and b!1528392 res!1046110) b!1528391))

(assert (= (and b!1528391 res!1046106) b!1528399))

(assert (= (and b!1528399 res!1046105) b!1528401))

(assert (= (and b!1528401 res!1046109) b!1528397))

(assert (= (and b!1528397 res!1046104) b!1528402))

(assert (= (and b!1528397 (not res!1046107)) b!1528393))

(assert (= (and b!1528393 (not res!1046101)) b!1528396))

(declare-fun m!1411215 () Bool)

(assert (=> b!1528391 m!1411215))

(assert (=> b!1528391 m!1411215))

(declare-fun m!1411217 () Bool)

(assert (=> b!1528391 m!1411217))

(assert (=> b!1528391 m!1411217))

(assert (=> b!1528391 m!1411215))

(declare-fun m!1411219 () Bool)

(assert (=> b!1528391 m!1411219))

(declare-fun m!1411221 () Bool)

(assert (=> b!1528403 m!1411221))

(assert (=> b!1528399 m!1411215))

(assert (=> b!1528399 m!1411215))

(declare-fun m!1411223 () Bool)

(assert (=> b!1528399 m!1411223))

(declare-fun m!1411225 () Bool)

(assert (=> b!1528400 m!1411225))

(assert (=> b!1528398 m!1411215))

(assert (=> b!1528398 m!1411215))

(declare-fun m!1411227 () Bool)

(assert (=> b!1528398 m!1411227))

(assert (=> b!1528393 m!1411215))

(declare-fun m!1411229 () Bool)

(assert (=> b!1528393 m!1411229))

(assert (=> b!1528393 m!1411215))

(declare-fun m!1411231 () Bool)

(assert (=> b!1528393 m!1411231))

(declare-fun m!1411233 () Bool)

(assert (=> b!1528393 m!1411233))

(assert (=> b!1528393 m!1411215))

(declare-fun m!1411235 () Bool)

(assert (=> b!1528393 m!1411235))

(assert (=> b!1528397 m!1411215))

(declare-fun m!1411237 () Bool)

(assert (=> b!1528397 m!1411237))

(declare-fun m!1411239 () Bool)

(assert (=> b!1528397 m!1411239))

(declare-fun m!1411241 () Bool)

(assert (=> b!1528397 m!1411241))

(declare-fun m!1411243 () Bool)

(assert (=> b!1528396 m!1411243))

(declare-fun m!1411245 () Bool)

(assert (=> start!130214 m!1411245))

(declare-fun m!1411247 () Bool)

(assert (=> start!130214 m!1411247))

(declare-fun m!1411249 () Bool)

(assert (=> b!1528394 m!1411249))

(assert (=> b!1528394 m!1411249))

(declare-fun m!1411251 () Bool)

(assert (=> b!1528394 m!1411251))

(declare-fun m!1411253 () Bool)

(assert (=> b!1528401 m!1411253))

(assert (=> b!1528401 m!1411253))

(declare-fun m!1411255 () Bool)

(assert (=> b!1528401 m!1411255))

(declare-fun m!1411257 () Bool)

(assert (=> b!1528401 m!1411257))

(declare-fun m!1411259 () Bool)

(assert (=> b!1528401 m!1411259))

(assert (=> b!1528402 m!1411215))

(assert (=> b!1528402 m!1411215))

(declare-fun m!1411261 () Bool)

(assert (=> b!1528402 m!1411261))

(push 1)

