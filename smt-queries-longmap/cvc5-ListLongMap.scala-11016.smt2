; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128928 () Bool)

(assert start!128928)

(declare-fun b!1511302 () Bool)

(declare-fun res!1031215 () Bool)

(declare-fun e!843775 () Bool)

(assert (=> b!1511302 (=> (not res!1031215) (not e!843775))))

(declare-datatypes ((array!100784 0))(
  ( (array!100785 (arr!48629 (Array (_ BitVec 32) (_ BitVec 64))) (size!49179 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100784)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511302 (= res!1031215 (validKeyInArray!0 (select (arr!48629 a!2804) i!961)))))

(declare-fun b!1511303 () Bool)

(declare-fun res!1031208 () Bool)

(assert (=> b!1511303 (=> (not res!1031208) (not e!843775))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511303 (= res!1031208 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49179 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49179 a!2804))))))

(declare-fun b!1511304 () Bool)

(declare-fun e!843772 () Bool)

(assert (=> b!1511304 (= e!843772 (not true))))

(declare-fun e!843773 () Bool)

(assert (=> b!1511304 e!843773))

(declare-fun res!1031212 () Bool)

(assert (=> b!1511304 (=> (not res!1031212) (not e!843773))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100784 (_ BitVec 32)) Bool)

(assert (=> b!1511304 (= res!1031212 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50468 0))(
  ( (Unit!50469) )
))
(declare-fun lt!655403 () Unit!50468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100784 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50468)

(assert (=> b!1511304 (= lt!655403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511305 () Bool)

(declare-datatypes ((SeekEntryResult!12800 0))(
  ( (MissingZero!12800 (index!53595 (_ BitVec 32))) (Found!12800 (index!53596 (_ BitVec 32))) (Intermediate!12800 (undefined!13612 Bool) (index!53597 (_ BitVec 32)) (x!135334 (_ BitVec 32))) (Undefined!12800) (MissingVacant!12800 (index!53598 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100784 (_ BitVec 32)) SeekEntryResult!12800)

(assert (=> b!1511305 (= e!843773 (= (seekEntry!0 (select (arr!48629 a!2804) j!70) a!2804 mask!2512) (Found!12800 j!70)))))

(declare-fun b!1511306 () Bool)

(declare-fun res!1031209 () Bool)

(assert (=> b!1511306 (=> (not res!1031209) (not e!843775))))

(assert (=> b!1511306 (= res!1031209 (and (= (size!49179 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49179 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49179 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511307 () Bool)

(declare-fun res!1031213 () Bool)

(assert (=> b!1511307 (=> (not res!1031213) (not e!843772))))

(declare-fun lt!655405 () SeekEntryResult!12800)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100784 (_ BitVec 32)) SeekEntryResult!12800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511307 (= res!1031213 (= lt!655405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48629 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48629 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100785 (store (arr!48629 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49179 a!2804)) mask!2512)))))

(declare-fun b!1511308 () Bool)

(assert (=> b!1511308 (= e!843775 e!843772)))

(declare-fun res!1031205 () Bool)

(assert (=> b!1511308 (=> (not res!1031205) (not e!843772))))

(declare-fun lt!655404 () SeekEntryResult!12800)

(assert (=> b!1511308 (= res!1031205 (= lt!655405 lt!655404))))

(assert (=> b!1511308 (= lt!655404 (Intermediate!12800 false resIndex!21 resX!21))))

(assert (=> b!1511308 (= lt!655405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48629 a!2804) j!70) mask!2512) (select (arr!48629 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1031206 () Bool)

(assert (=> start!128928 (=> (not res!1031206) (not e!843775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128928 (= res!1031206 (validMask!0 mask!2512))))

(assert (=> start!128928 e!843775))

(assert (=> start!128928 true))

(declare-fun array_inv!37657 (array!100784) Bool)

(assert (=> start!128928 (array_inv!37657 a!2804)))

(declare-fun b!1511309 () Bool)

(declare-fun res!1031207 () Bool)

(assert (=> b!1511309 (=> (not res!1031207) (not e!843775))))

(assert (=> b!1511309 (= res!1031207 (validKeyInArray!0 (select (arr!48629 a!2804) j!70)))))

(declare-fun b!1511310 () Bool)

(declare-fun res!1031210 () Bool)

(assert (=> b!1511310 (=> (not res!1031210) (not e!843775))))

(assert (=> b!1511310 (= res!1031210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511311 () Bool)

(declare-fun res!1031211 () Bool)

(assert (=> b!1511311 (=> (not res!1031211) (not e!843772))))

(assert (=> b!1511311 (= res!1031211 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48629 a!2804) j!70) a!2804 mask!2512) lt!655404))))

(declare-fun b!1511312 () Bool)

(declare-fun res!1031214 () Bool)

(assert (=> b!1511312 (=> (not res!1031214) (not e!843775))))

(declare-datatypes ((List!35112 0))(
  ( (Nil!35109) (Cons!35108 (h!36520 (_ BitVec 64)) (t!49806 List!35112)) )
))
(declare-fun arrayNoDuplicates!0 (array!100784 (_ BitVec 32) List!35112) Bool)

(assert (=> b!1511312 (= res!1031214 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35109))))

(assert (= (and start!128928 res!1031206) b!1511306))

(assert (= (and b!1511306 res!1031209) b!1511302))

(assert (= (and b!1511302 res!1031215) b!1511309))

(assert (= (and b!1511309 res!1031207) b!1511310))

(assert (= (and b!1511310 res!1031210) b!1511312))

(assert (= (and b!1511312 res!1031214) b!1511303))

(assert (= (and b!1511303 res!1031208) b!1511308))

(assert (= (and b!1511308 res!1031205) b!1511311))

(assert (= (and b!1511311 res!1031211) b!1511307))

(assert (= (and b!1511307 res!1031213) b!1511304))

(assert (= (and b!1511304 res!1031212) b!1511305))

(declare-fun m!1393987 () Bool)

(assert (=> b!1511308 m!1393987))

(assert (=> b!1511308 m!1393987))

(declare-fun m!1393989 () Bool)

(assert (=> b!1511308 m!1393989))

(assert (=> b!1511308 m!1393989))

(assert (=> b!1511308 m!1393987))

(declare-fun m!1393991 () Bool)

(assert (=> b!1511308 m!1393991))

(declare-fun m!1393993 () Bool)

(assert (=> start!128928 m!1393993))

(declare-fun m!1393995 () Bool)

(assert (=> start!128928 m!1393995))

(declare-fun m!1393997 () Bool)

(assert (=> b!1511310 m!1393997))

(assert (=> b!1511311 m!1393987))

(assert (=> b!1511311 m!1393987))

(declare-fun m!1393999 () Bool)

(assert (=> b!1511311 m!1393999))

(declare-fun m!1394001 () Bool)

(assert (=> b!1511307 m!1394001))

(declare-fun m!1394003 () Bool)

(assert (=> b!1511307 m!1394003))

(assert (=> b!1511307 m!1394003))

(declare-fun m!1394005 () Bool)

(assert (=> b!1511307 m!1394005))

(assert (=> b!1511307 m!1394005))

(assert (=> b!1511307 m!1394003))

(declare-fun m!1394007 () Bool)

(assert (=> b!1511307 m!1394007))

(declare-fun m!1394009 () Bool)

(assert (=> b!1511302 m!1394009))

(assert (=> b!1511302 m!1394009))

(declare-fun m!1394011 () Bool)

(assert (=> b!1511302 m!1394011))

(declare-fun m!1394013 () Bool)

(assert (=> b!1511312 m!1394013))

(assert (=> b!1511305 m!1393987))

(assert (=> b!1511305 m!1393987))

(declare-fun m!1394015 () Bool)

(assert (=> b!1511305 m!1394015))

(assert (=> b!1511309 m!1393987))

(assert (=> b!1511309 m!1393987))

(declare-fun m!1394017 () Bool)

(assert (=> b!1511309 m!1394017))

(declare-fun m!1394019 () Bool)

(assert (=> b!1511304 m!1394019))

(declare-fun m!1394021 () Bool)

(assert (=> b!1511304 m!1394021))

(push 1)

