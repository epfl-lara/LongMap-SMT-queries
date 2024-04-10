; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129028 () Bool)

(assert start!129028)

(declare-fun b!1513237 () Bool)

(declare-fun res!1033144 () Bool)

(declare-fun e!844569 () Bool)

(assert (=> b!1513237 (=> (not res!1033144) (not e!844569))))

(declare-datatypes ((array!100884 0))(
  ( (array!100885 (arr!48679 (Array (_ BitVec 32) (_ BitVec 64))) (size!49229 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100884)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513237 (= res!1033144 (validKeyInArray!0 (select (arr!48679 a!2804) i!961)))))

(declare-fun lt!655905 () (_ BitVec 64))

(declare-fun lt!655907 () array!100884)

(declare-fun b!1513238 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844570 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12850 0))(
  ( (MissingZero!12850 (index!53795 (_ BitVec 32))) (Found!12850 (index!53796 (_ BitVec 32))) (Intermediate!12850 (undefined!13662 Bool) (index!53797 (_ BitVec 32)) (x!135512 (_ BitVec 32))) (Undefined!12850) (MissingVacant!12850 (index!53798 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100884 (_ BitVec 32)) SeekEntryResult!12850)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100884 (_ BitVec 32)) SeekEntryResult!12850)

(assert (=> b!1513238 (= e!844570 (= (seekEntryOrOpen!0 lt!655905 lt!655907 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655905 lt!655907 mask!2512)))))

(declare-fun b!1513239 () Bool)

(declare-fun res!1033141 () Bool)

(declare-fun e!844567 () Bool)

(assert (=> b!1513239 (=> (not res!1033141) (not e!844567))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100884 (_ BitVec 32)) SeekEntryResult!12850)

(assert (=> b!1513239 (= res!1033141 (= (seekEntry!0 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) (Found!12850 j!70)))))

(declare-fun b!1513240 () Bool)

(declare-fun res!1033153 () Bool)

(assert (=> b!1513240 (=> (not res!1033153) (not e!844569))))

(declare-datatypes ((List!35162 0))(
  ( (Nil!35159) (Cons!35158 (h!36570 (_ BitVec 64)) (t!49856 List!35162)) )
))
(declare-fun arrayNoDuplicates!0 (array!100884 (_ BitVec 32) List!35162) Bool)

(assert (=> b!1513240 (= res!1033153 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35159))))

(declare-fun res!1033149 () Bool)

(assert (=> start!129028 (=> (not res!1033149) (not e!844569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129028 (= res!1033149 (validMask!0 mask!2512))))

(assert (=> start!129028 e!844569))

(assert (=> start!129028 true))

(declare-fun array_inv!37707 (array!100884) Bool)

(assert (=> start!129028 (array_inv!37707 a!2804)))

(declare-fun b!1513241 () Bool)

(declare-fun res!1033145 () Bool)

(declare-fun e!844572 () Bool)

(assert (=> b!1513241 (=> (not res!1033145) (not e!844572))))

(declare-fun lt!655906 () SeekEntryResult!12850)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100884 (_ BitVec 32)) SeekEntryResult!12850)

(assert (=> b!1513241 (= res!1033145 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) lt!655906))))

(declare-fun b!1513242 () Bool)

(declare-fun res!1033140 () Bool)

(assert (=> b!1513242 (=> (not res!1033140) (not e!844569))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513242 (= res!1033140 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49229 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49229 a!2804))))))

(declare-fun b!1513243 () Bool)

(declare-fun e!844571 () Bool)

(assert (=> b!1513243 (= e!844572 e!844571)))

(declare-fun res!1033150 () Bool)

(assert (=> b!1513243 (=> (not res!1033150) (not e!844571))))

(declare-fun lt!655909 () SeekEntryResult!12850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513243 (= res!1033150 (= lt!655909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655905 mask!2512) lt!655905 lt!655907 mask!2512)))))

(assert (=> b!1513243 (= lt!655905 (select (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513243 (= lt!655907 (array!100885 (store (arr!48679 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49229 a!2804)))))

(declare-fun b!1513244 () Bool)

(assert (=> b!1513244 (= e!844569 e!844572)))

(declare-fun res!1033151 () Bool)

(assert (=> b!1513244 (=> (not res!1033151) (not e!844572))))

(assert (=> b!1513244 (= res!1033151 (= lt!655909 lt!655906))))

(assert (=> b!1513244 (= lt!655906 (Intermediate!12850 false resIndex!21 resX!21))))

(assert (=> b!1513244 (= lt!655909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48679 a!2804) j!70) mask!2512) (select (arr!48679 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513245 () Bool)

(declare-fun e!844573 () Bool)

(assert (=> b!1513245 (= e!844567 e!844573)))

(declare-fun res!1033142 () Bool)

(assert (=> b!1513245 (=> res!1033142 e!844573)))

(assert (=> b!1513245 (= res!1033142 (or (not (= (select (arr!48679 a!2804) j!70) lt!655905)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48679 a!2804) index!487) (select (arr!48679 a!2804) j!70)) (not (= (select (arr!48679 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513246 () Bool)

(declare-fun res!1033147 () Bool)

(assert (=> b!1513246 (=> (not res!1033147) (not e!844569))))

(assert (=> b!1513246 (= res!1033147 (validKeyInArray!0 (select (arr!48679 a!2804) j!70)))))

(declare-fun b!1513247 () Bool)

(declare-fun res!1033152 () Bool)

(assert (=> b!1513247 (=> (not res!1033152) (not e!844569))))

(assert (=> b!1513247 (= res!1033152 (and (= (size!49229 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49229 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49229 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513248 () Bool)

(declare-fun res!1033143 () Bool)

(assert (=> b!1513248 (=> (not res!1033143) (not e!844569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100884 (_ BitVec 32)) Bool)

(assert (=> b!1513248 (= res!1033143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513249 () Bool)

(assert (=> b!1513249 (= e!844573 e!844570)))

(declare-fun res!1033146 () Bool)

(assert (=> b!1513249 (=> (not res!1033146) (not e!844570))))

(assert (=> b!1513249 (= res!1033146 (= (seekEntryOrOpen!0 (select (arr!48679 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48679 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513250 () Bool)

(assert (=> b!1513250 (= e!844571 (not true))))

(assert (=> b!1513250 e!844567))

(declare-fun res!1033148 () Bool)

(assert (=> b!1513250 (=> (not res!1033148) (not e!844567))))

(assert (=> b!1513250 (= res!1033148 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50568 0))(
  ( (Unit!50569) )
))
(declare-fun lt!655908 () Unit!50568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50568)

(assert (=> b!1513250 (= lt!655908 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129028 res!1033149) b!1513247))

(assert (= (and b!1513247 res!1033152) b!1513237))

(assert (= (and b!1513237 res!1033144) b!1513246))

(assert (= (and b!1513246 res!1033147) b!1513248))

(assert (= (and b!1513248 res!1033143) b!1513240))

(assert (= (and b!1513240 res!1033153) b!1513242))

(assert (= (and b!1513242 res!1033140) b!1513244))

(assert (= (and b!1513244 res!1033151) b!1513241))

(assert (= (and b!1513241 res!1033145) b!1513243))

(assert (= (and b!1513243 res!1033150) b!1513250))

(assert (= (and b!1513250 res!1033148) b!1513239))

(assert (= (and b!1513239 res!1033141) b!1513245))

(assert (= (and b!1513245 (not res!1033142)) b!1513249))

(assert (= (and b!1513249 res!1033146) b!1513238))

(declare-fun m!1396077 () Bool)

(assert (=> b!1513240 m!1396077))

(declare-fun m!1396079 () Bool)

(assert (=> b!1513244 m!1396079))

(assert (=> b!1513244 m!1396079))

(declare-fun m!1396081 () Bool)

(assert (=> b!1513244 m!1396081))

(assert (=> b!1513244 m!1396081))

(assert (=> b!1513244 m!1396079))

(declare-fun m!1396083 () Bool)

(assert (=> b!1513244 m!1396083))

(declare-fun m!1396085 () Bool)

(assert (=> b!1513250 m!1396085))

(declare-fun m!1396087 () Bool)

(assert (=> b!1513250 m!1396087))

(declare-fun m!1396089 () Bool)

(assert (=> b!1513238 m!1396089))

(declare-fun m!1396091 () Bool)

(assert (=> b!1513238 m!1396091))

(assert (=> b!1513245 m!1396079))

(declare-fun m!1396093 () Bool)

(assert (=> b!1513245 m!1396093))

(assert (=> b!1513239 m!1396079))

(assert (=> b!1513239 m!1396079))

(declare-fun m!1396095 () Bool)

(assert (=> b!1513239 m!1396095))

(declare-fun m!1396097 () Bool)

(assert (=> b!1513243 m!1396097))

(assert (=> b!1513243 m!1396097))

(declare-fun m!1396099 () Bool)

(assert (=> b!1513243 m!1396099))

(declare-fun m!1396101 () Bool)

(assert (=> b!1513243 m!1396101))

(declare-fun m!1396103 () Bool)

(assert (=> b!1513243 m!1396103))

(assert (=> b!1513246 m!1396079))

(assert (=> b!1513246 m!1396079))

(declare-fun m!1396105 () Bool)

(assert (=> b!1513246 m!1396105))

(declare-fun m!1396107 () Bool)

(assert (=> start!129028 m!1396107))

(declare-fun m!1396109 () Bool)

(assert (=> start!129028 m!1396109))

(assert (=> b!1513249 m!1396079))

(assert (=> b!1513249 m!1396079))

(declare-fun m!1396111 () Bool)

(assert (=> b!1513249 m!1396111))

(assert (=> b!1513249 m!1396079))

(declare-fun m!1396113 () Bool)

(assert (=> b!1513249 m!1396113))

(declare-fun m!1396115 () Bool)

(assert (=> b!1513248 m!1396115))

(declare-fun m!1396117 () Bool)

(assert (=> b!1513237 m!1396117))

(assert (=> b!1513237 m!1396117))

(declare-fun m!1396119 () Bool)

(assert (=> b!1513237 m!1396119))

(assert (=> b!1513241 m!1396079))

(assert (=> b!1513241 m!1396079))

(declare-fun m!1396121 () Bool)

(assert (=> b!1513241 m!1396121))

(push 1)

