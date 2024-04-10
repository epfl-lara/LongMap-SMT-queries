; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128860 () Bool)

(assert start!128860)

(declare-fun e!843357 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1510171 () Bool)

(declare-datatypes ((array!100716 0))(
  ( (array!100717 (arr!48595 (Array (_ BitVec 32) (_ BitVec 64))) (size!49145 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100716)

(declare-datatypes ((SeekEntryResult!12766 0))(
  ( (MissingZero!12766 (index!53459 (_ BitVec 32))) (Found!12766 (index!53460 (_ BitVec 32))) (Intermediate!12766 (undefined!13578 Bool) (index!53461 (_ BitVec 32)) (x!135204 (_ BitVec 32))) (Undefined!12766) (MissingVacant!12766 (index!53462 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100716 (_ BitVec 32)) SeekEntryResult!12766)

(assert (=> b!1510171 (= e!843357 (= (seekEntry!0 (select (arr!48595 a!2804) j!70) a!2804 mask!2512) (Found!12766 j!70)))))

(declare-fun b!1510172 () Bool)

(declare-fun res!1030083 () Bool)

(declare-fun e!843358 () Bool)

(assert (=> b!1510172 (=> (not res!1030083) (not e!843358))))

(declare-datatypes ((List!35078 0))(
  ( (Nil!35075) (Cons!35074 (h!36486 (_ BitVec 64)) (t!49772 List!35078)) )
))
(declare-fun arrayNoDuplicates!0 (array!100716 (_ BitVec 32) List!35078) Bool)

(assert (=> b!1510172 (= res!1030083 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35075))))

(declare-fun b!1510173 () Bool)

(declare-fun res!1030081 () Bool)

(assert (=> b!1510173 (=> (not res!1030081) (not e!843358))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510173 (= res!1030081 (validKeyInArray!0 (select (arr!48595 a!2804) i!961)))))

(declare-fun b!1510174 () Bool)

(declare-fun e!843355 () Bool)

(assert (=> b!1510174 (= e!843358 e!843355)))

(declare-fun res!1030078 () Bool)

(assert (=> b!1510174 (=> (not res!1030078) (not e!843355))))

(declare-fun lt!655097 () SeekEntryResult!12766)

(declare-fun lt!655098 () SeekEntryResult!12766)

(assert (=> b!1510174 (= res!1030078 (= lt!655097 lt!655098))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510174 (= lt!655098 (Intermediate!12766 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100716 (_ BitVec 32)) SeekEntryResult!12766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510174 (= lt!655097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48595 a!2804) j!70) mask!2512) (select (arr!48595 a!2804) j!70) a!2804 mask!2512))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1510175 () Bool)

(assert (=> b!1510175 (= e!843355 (not (or (not (= (select (arr!48595 a!2804) j!70) (select (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48595 a!2804) index!487) (select (arr!48595 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1510175 e!843357))

(declare-fun res!1030076 () Bool)

(assert (=> b!1510175 (=> (not res!1030076) (not e!843357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100716 (_ BitVec 32)) Bool)

(assert (=> b!1510175 (= res!1030076 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50400 0))(
  ( (Unit!50401) )
))
(declare-fun lt!655099 () Unit!50400)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50400)

(assert (=> b!1510175 (= lt!655099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510177 () Bool)

(declare-fun res!1030080 () Bool)

(assert (=> b!1510177 (=> (not res!1030080) (not e!843358))))

(assert (=> b!1510177 (= res!1030080 (validKeyInArray!0 (select (arr!48595 a!2804) j!70)))))

(declare-fun b!1510178 () Bool)

(declare-fun res!1030079 () Bool)

(assert (=> b!1510178 (=> (not res!1030079) (not e!843355))))

(assert (=> b!1510178 (= res!1030079 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48595 a!2804) j!70) a!2804 mask!2512) lt!655098))))

(declare-fun b!1510179 () Bool)

(declare-fun res!1030075 () Bool)

(assert (=> b!1510179 (=> (not res!1030075) (not e!843355))))

(assert (=> b!1510179 (= res!1030075 (= lt!655097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100717 (store (arr!48595 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49145 a!2804)) mask!2512)))))

(declare-fun b!1510180 () Bool)

(declare-fun res!1030084 () Bool)

(assert (=> b!1510180 (=> (not res!1030084) (not e!843358))))

(assert (=> b!1510180 (= res!1030084 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49145 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49145 a!2804))))))

(declare-fun b!1510181 () Bool)

(declare-fun res!1030074 () Bool)

(assert (=> b!1510181 (=> (not res!1030074) (not e!843358))))

(assert (=> b!1510181 (= res!1030074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030082 () Bool)

(assert (=> start!128860 (=> (not res!1030082) (not e!843358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128860 (= res!1030082 (validMask!0 mask!2512))))

(assert (=> start!128860 e!843358))

(assert (=> start!128860 true))

(declare-fun array_inv!37623 (array!100716) Bool)

(assert (=> start!128860 (array_inv!37623 a!2804)))

(declare-fun b!1510176 () Bool)

(declare-fun res!1030077 () Bool)

(assert (=> b!1510176 (=> (not res!1030077) (not e!843358))))

(assert (=> b!1510176 (= res!1030077 (and (= (size!49145 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49145 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49145 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128860 res!1030082) b!1510176))

(assert (= (and b!1510176 res!1030077) b!1510173))

(assert (= (and b!1510173 res!1030081) b!1510177))

(assert (= (and b!1510177 res!1030080) b!1510181))

(assert (= (and b!1510181 res!1030074) b!1510172))

(assert (= (and b!1510172 res!1030083) b!1510180))

(assert (= (and b!1510180 res!1030084) b!1510174))

(assert (= (and b!1510174 res!1030078) b!1510178))

(assert (= (and b!1510178 res!1030079) b!1510179))

(assert (= (and b!1510179 res!1030075) b!1510175))

(assert (= (and b!1510175 res!1030076) b!1510171))

(declare-fun m!1392731 () Bool)

(assert (=> b!1510181 m!1392731))

(declare-fun m!1392733 () Bool)

(assert (=> b!1510179 m!1392733))

(declare-fun m!1392735 () Bool)

(assert (=> b!1510179 m!1392735))

(assert (=> b!1510179 m!1392735))

(declare-fun m!1392737 () Bool)

(assert (=> b!1510179 m!1392737))

(assert (=> b!1510179 m!1392737))

(assert (=> b!1510179 m!1392735))

(declare-fun m!1392739 () Bool)

(assert (=> b!1510179 m!1392739))

(declare-fun m!1392741 () Bool)

(assert (=> b!1510178 m!1392741))

(assert (=> b!1510178 m!1392741))

(declare-fun m!1392743 () Bool)

(assert (=> b!1510178 m!1392743))

(declare-fun m!1392745 () Bool)

(assert (=> b!1510173 m!1392745))

(assert (=> b!1510173 m!1392745))

(declare-fun m!1392747 () Bool)

(assert (=> b!1510173 m!1392747))

(declare-fun m!1392749 () Bool)

(assert (=> start!128860 m!1392749))

(declare-fun m!1392751 () Bool)

(assert (=> start!128860 m!1392751))

(declare-fun m!1392753 () Bool)

(assert (=> b!1510172 m!1392753))

(assert (=> b!1510175 m!1392741))

(declare-fun m!1392755 () Bool)

(assert (=> b!1510175 m!1392755))

(assert (=> b!1510175 m!1392733))

(declare-fun m!1392757 () Bool)

(assert (=> b!1510175 m!1392757))

(assert (=> b!1510175 m!1392735))

(declare-fun m!1392759 () Bool)

(assert (=> b!1510175 m!1392759))

(assert (=> b!1510177 m!1392741))

(assert (=> b!1510177 m!1392741))

(declare-fun m!1392761 () Bool)

(assert (=> b!1510177 m!1392761))

(assert (=> b!1510174 m!1392741))

(assert (=> b!1510174 m!1392741))

(declare-fun m!1392763 () Bool)

(assert (=> b!1510174 m!1392763))

(assert (=> b!1510174 m!1392763))

(assert (=> b!1510174 m!1392741))

(declare-fun m!1392765 () Bool)

(assert (=> b!1510174 m!1392765))

(assert (=> b!1510171 m!1392741))

(assert (=> b!1510171 m!1392741))

(declare-fun m!1392767 () Bool)

(assert (=> b!1510171 m!1392767))

(push 1)

(assert (not b!1510171))

