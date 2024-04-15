; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128660 () Bool)

(assert start!128660)

(declare-fun b!1508069 () Bool)

(declare-fun res!1028285 () Bool)

(declare-fun e!842481 () Bool)

(assert (=> b!1508069 (=> (not res!1028285) (not e!842481))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100555 0))(
  ( (array!100556 (arr!48517 (Array (_ BitVec 32) (_ BitVec 64))) (size!49069 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100555)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508069 (= res!1028285 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49069 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49069 a!2804))))))

(declare-fun b!1508070 () Bool)

(declare-fun res!1028288 () Bool)

(assert (=> b!1508070 (=> (not res!1028288) (not e!842481))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100555 (_ BitVec 32)) Bool)

(assert (=> b!1508070 (= res!1028288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508071 () Bool)

(declare-fun res!1028291 () Bool)

(assert (=> b!1508071 (=> (not res!1028291) (not e!842481))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1508071 (= res!1028291 (and (= (size!49069 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49069 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49069 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508072 () Bool)

(declare-fun e!842480 () Bool)

(assert (=> b!1508072 (= e!842480 false)))

(declare-fun lt!654330 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508072 (= lt!654330 (toIndex!0 (select (store (arr!48517 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508073 () Bool)

(declare-fun res!1028283 () Bool)

(assert (=> b!1508073 (=> (not res!1028283) (not e!842480))))

(declare-datatypes ((SeekEntryResult!12711 0))(
  ( (MissingZero!12711 (index!53239 (_ BitVec 32))) (Found!12711 (index!53240 (_ BitVec 32))) (Intermediate!12711 (undefined!13523 Bool) (index!53241 (_ BitVec 32)) (x!135001 (_ BitVec 32))) (Undefined!12711) (MissingVacant!12711 (index!53242 (_ BitVec 32))) )
))
(declare-fun lt!654329 () SeekEntryResult!12711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100555 (_ BitVec 32)) SeekEntryResult!12711)

(assert (=> b!1508073 (= res!1028283 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48517 a!2804) j!70) a!2804 mask!2512) lt!654329))))

(declare-fun b!1508074 () Bool)

(declare-fun res!1028284 () Bool)

(assert (=> b!1508074 (=> (not res!1028284) (not e!842481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508074 (= res!1028284 (validKeyInArray!0 (select (arr!48517 a!2804) i!961)))))

(declare-fun res!1028287 () Bool)

(assert (=> start!128660 (=> (not res!1028287) (not e!842481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128660 (= res!1028287 (validMask!0 mask!2512))))

(assert (=> start!128660 e!842481))

(assert (=> start!128660 true))

(declare-fun array_inv!37750 (array!100555) Bool)

(assert (=> start!128660 (array_inv!37750 a!2804)))

(declare-fun b!1508075 () Bool)

(declare-fun res!1028286 () Bool)

(assert (=> b!1508075 (=> (not res!1028286) (not e!842481))))

(assert (=> b!1508075 (= res!1028286 (validKeyInArray!0 (select (arr!48517 a!2804) j!70)))))

(declare-fun b!1508076 () Bool)

(assert (=> b!1508076 (= e!842481 e!842480)))

(declare-fun res!1028290 () Bool)

(assert (=> b!1508076 (=> (not res!1028290) (not e!842480))))

(assert (=> b!1508076 (= res!1028290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48517 a!2804) j!70) mask!2512) (select (arr!48517 a!2804) j!70) a!2804 mask!2512) lt!654329))))

(assert (=> b!1508076 (= lt!654329 (Intermediate!12711 false resIndex!21 resX!21))))

(declare-fun b!1508077 () Bool)

(declare-fun res!1028289 () Bool)

(assert (=> b!1508077 (=> (not res!1028289) (not e!842481))))

(declare-datatypes ((List!35078 0))(
  ( (Nil!35075) (Cons!35074 (h!36484 (_ BitVec 64)) (t!49764 List!35078)) )
))
(declare-fun arrayNoDuplicates!0 (array!100555 (_ BitVec 32) List!35078) Bool)

(assert (=> b!1508077 (= res!1028289 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35075))))

(assert (= (and start!128660 res!1028287) b!1508071))

(assert (= (and b!1508071 res!1028291) b!1508074))

(assert (= (and b!1508074 res!1028284) b!1508075))

(assert (= (and b!1508075 res!1028286) b!1508070))

(assert (= (and b!1508070 res!1028288) b!1508077))

(assert (= (and b!1508077 res!1028289) b!1508069))

(assert (= (and b!1508069 res!1028285) b!1508076))

(assert (= (and b!1508076 res!1028290) b!1508073))

(assert (= (and b!1508073 res!1028283) b!1508072))

(declare-fun m!1390007 () Bool)

(assert (=> b!1508075 m!1390007))

(assert (=> b!1508075 m!1390007))

(declare-fun m!1390009 () Bool)

(assert (=> b!1508075 m!1390009))

(declare-fun m!1390011 () Bool)

(assert (=> b!1508077 m!1390011))

(assert (=> b!1508076 m!1390007))

(assert (=> b!1508076 m!1390007))

(declare-fun m!1390013 () Bool)

(assert (=> b!1508076 m!1390013))

(assert (=> b!1508076 m!1390013))

(assert (=> b!1508076 m!1390007))

(declare-fun m!1390015 () Bool)

(assert (=> b!1508076 m!1390015))

(declare-fun m!1390017 () Bool)

(assert (=> start!128660 m!1390017))

(declare-fun m!1390019 () Bool)

(assert (=> start!128660 m!1390019))

(assert (=> b!1508073 m!1390007))

(assert (=> b!1508073 m!1390007))

(declare-fun m!1390021 () Bool)

(assert (=> b!1508073 m!1390021))

(declare-fun m!1390023 () Bool)

(assert (=> b!1508074 m!1390023))

(assert (=> b!1508074 m!1390023))

(declare-fun m!1390025 () Bool)

(assert (=> b!1508074 m!1390025))

(declare-fun m!1390027 () Bool)

(assert (=> b!1508070 m!1390027))

(declare-fun m!1390029 () Bool)

(assert (=> b!1508072 m!1390029))

(declare-fun m!1390031 () Bool)

(assert (=> b!1508072 m!1390031))

(assert (=> b!1508072 m!1390031))

(declare-fun m!1390033 () Bool)

(assert (=> b!1508072 m!1390033))

(check-sat (not b!1508074) (not b!1508070) (not b!1508076) (not start!128660) (not b!1508072) (not b!1508073) (not b!1508077) (not b!1508075))
(check-sat)
