; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128926 () Bool)

(assert start!128926)

(declare-fun b!1511269 () Bool)

(declare-fun res!1031178 () Bool)

(declare-fun e!843763 () Bool)

(assert (=> b!1511269 (=> (not res!1031178) (not e!843763))))

(declare-datatypes ((array!100782 0))(
  ( (array!100783 (arr!48628 (Array (_ BitVec 32) (_ BitVec 64))) (size!49178 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100782)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100782 (_ BitVec 32)) Bool)

(assert (=> b!1511269 (= res!1031178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511270 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!843762 () Bool)

(declare-datatypes ((SeekEntryResult!12799 0))(
  ( (MissingZero!12799 (index!53591 (_ BitVec 32))) (Found!12799 (index!53592 (_ BitVec 32))) (Intermediate!12799 (undefined!13611 Bool) (index!53593 (_ BitVec 32)) (x!135325 (_ BitVec 32))) (Undefined!12799) (MissingVacant!12799 (index!53594 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100782 (_ BitVec 32)) SeekEntryResult!12799)

(assert (=> b!1511270 (= e!843762 (= (seekEntry!0 (select (arr!48628 a!2804) j!70) a!2804 mask!2512) (Found!12799 j!70)))))

(declare-fun b!1511271 () Bool)

(declare-fun res!1031180 () Bool)

(assert (=> b!1511271 (=> (not res!1031180) (not e!843763))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511271 (= res!1031180 (validKeyInArray!0 (select (arr!48628 a!2804) i!961)))))

(declare-fun res!1031175 () Bool)

(assert (=> start!128926 (=> (not res!1031175) (not e!843763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128926 (= res!1031175 (validMask!0 mask!2512))))

(assert (=> start!128926 e!843763))

(assert (=> start!128926 true))

(declare-fun array_inv!37656 (array!100782) Bool)

(assert (=> start!128926 (array_inv!37656 a!2804)))

(declare-fun b!1511272 () Bool)

(declare-fun e!843761 () Bool)

(assert (=> b!1511272 (= e!843763 e!843761)))

(declare-fun res!1031173 () Bool)

(assert (=> b!1511272 (=> (not res!1031173) (not e!843761))))

(declare-fun lt!655395 () SeekEntryResult!12799)

(declare-fun lt!655394 () SeekEntryResult!12799)

(assert (=> b!1511272 (= res!1031173 (= lt!655395 lt!655394))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511272 (= lt!655394 (Intermediate!12799 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100782 (_ BitVec 32)) SeekEntryResult!12799)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511272 (= lt!655395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48628 a!2804) j!70) mask!2512) (select (arr!48628 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511273 () Bool)

(declare-fun res!1031172 () Bool)

(assert (=> b!1511273 (=> (not res!1031172) (not e!843763))))

(declare-datatypes ((List!35111 0))(
  ( (Nil!35108) (Cons!35107 (h!36519 (_ BitVec 64)) (t!49805 List!35111)) )
))
(declare-fun arrayNoDuplicates!0 (array!100782 (_ BitVec 32) List!35111) Bool)

(assert (=> b!1511273 (= res!1031172 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35108))))

(declare-fun b!1511274 () Bool)

(declare-fun res!1031174 () Bool)

(assert (=> b!1511274 (=> (not res!1031174) (not e!843761))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511274 (= res!1031174 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48628 a!2804) j!70) a!2804 mask!2512) lt!655394))))

(declare-fun b!1511275 () Bool)

(declare-fun res!1031177 () Bool)

(assert (=> b!1511275 (=> (not res!1031177) (not e!843761))))

(assert (=> b!1511275 (= res!1031177 (= lt!655395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100783 (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49178 a!2804)) mask!2512)))))

(declare-fun b!1511276 () Bool)

(declare-fun res!1031182 () Bool)

(assert (=> b!1511276 (=> (not res!1031182) (not e!843763))))

(assert (=> b!1511276 (= res!1031182 (validKeyInArray!0 (select (arr!48628 a!2804) j!70)))))

(declare-fun b!1511277 () Bool)

(declare-fun res!1031176 () Bool)

(assert (=> b!1511277 (=> (not res!1031176) (not e!843763))))

(assert (=> b!1511277 (= res!1031176 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49178 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49178 a!2804))))))

(declare-fun b!1511278 () Bool)

(assert (=> b!1511278 (= e!843761 (not true))))

(assert (=> b!1511278 e!843762))

(declare-fun res!1031181 () Bool)

(assert (=> b!1511278 (=> (not res!1031181) (not e!843762))))

(assert (=> b!1511278 (= res!1031181 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50466 0))(
  ( (Unit!50467) )
))
(declare-fun lt!655396 () Unit!50466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50466)

(assert (=> b!1511278 (= lt!655396 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511279 () Bool)

(declare-fun res!1031179 () Bool)

(assert (=> b!1511279 (=> (not res!1031179) (not e!843763))))

(assert (=> b!1511279 (= res!1031179 (and (= (size!49178 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49178 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49178 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128926 res!1031175) b!1511279))

(assert (= (and b!1511279 res!1031179) b!1511271))

(assert (= (and b!1511271 res!1031180) b!1511276))

(assert (= (and b!1511276 res!1031182) b!1511269))

(assert (= (and b!1511269 res!1031178) b!1511273))

(assert (= (and b!1511273 res!1031172) b!1511277))

(assert (= (and b!1511277 res!1031176) b!1511272))

(assert (= (and b!1511272 res!1031173) b!1511274))

(assert (= (and b!1511274 res!1031174) b!1511275))

(assert (= (and b!1511275 res!1031177) b!1511278))

(assert (= (and b!1511278 res!1031181) b!1511270))

(declare-fun m!1393951 () Bool)

(assert (=> b!1511269 m!1393951))

(declare-fun m!1393953 () Bool)

(assert (=> b!1511271 m!1393953))

(assert (=> b!1511271 m!1393953))

(declare-fun m!1393955 () Bool)

(assert (=> b!1511271 m!1393955))

(declare-fun m!1393957 () Bool)

(assert (=> start!128926 m!1393957))

(declare-fun m!1393959 () Bool)

(assert (=> start!128926 m!1393959))

(declare-fun m!1393961 () Bool)

(assert (=> b!1511275 m!1393961))

(declare-fun m!1393963 () Bool)

(assert (=> b!1511275 m!1393963))

(assert (=> b!1511275 m!1393963))

(declare-fun m!1393965 () Bool)

(assert (=> b!1511275 m!1393965))

(assert (=> b!1511275 m!1393965))

(assert (=> b!1511275 m!1393963))

(declare-fun m!1393967 () Bool)

(assert (=> b!1511275 m!1393967))

(declare-fun m!1393969 () Bool)

(assert (=> b!1511276 m!1393969))

(assert (=> b!1511276 m!1393969))

(declare-fun m!1393971 () Bool)

(assert (=> b!1511276 m!1393971))

(assert (=> b!1511274 m!1393969))

(assert (=> b!1511274 m!1393969))

(declare-fun m!1393973 () Bool)

(assert (=> b!1511274 m!1393973))

(declare-fun m!1393975 () Bool)

(assert (=> b!1511278 m!1393975))

(declare-fun m!1393977 () Bool)

(assert (=> b!1511278 m!1393977))

(assert (=> b!1511270 m!1393969))

(assert (=> b!1511270 m!1393969))

(declare-fun m!1393979 () Bool)

(assert (=> b!1511270 m!1393979))

(declare-fun m!1393981 () Bool)

(assert (=> b!1511273 m!1393981))

(assert (=> b!1511272 m!1393969))

(assert (=> b!1511272 m!1393969))

(declare-fun m!1393983 () Bool)

(assert (=> b!1511272 m!1393983))

(assert (=> b!1511272 m!1393983))

(assert (=> b!1511272 m!1393969))

(declare-fun m!1393985 () Bool)

(assert (=> b!1511272 m!1393985))

(push 1)

(assert (not b!1511278))

(assert (not b!1511272))

