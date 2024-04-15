; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128762 () Bool)

(assert start!128762)

(declare-fun b!1509088 () Bool)

(declare-fun res!1029200 () Bool)

(declare-fun e!842881 () Bool)

(assert (=> b!1509088 (=> (not res!1029200) (not e!842881))))

(declare-datatypes ((array!100618 0))(
  ( (array!100619 (arr!48547 (Array (_ BitVec 32) (_ BitVec 64))) (size!49099 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100618)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100618 (_ BitVec 32)) Bool)

(assert (=> b!1509088 (= res!1029200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1029206 () Bool)

(assert (=> start!128762 (=> (not res!1029206) (not e!842881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128762 (= res!1029206 (validMask!0 mask!2512))))

(assert (=> start!128762 e!842881))

(assert (=> start!128762 true))

(declare-fun array_inv!37780 (array!100618) Bool)

(assert (=> start!128762 (array_inv!37780 a!2804)))

(declare-fun b!1509089 () Bool)

(declare-fun res!1029198 () Bool)

(assert (=> b!1509089 (=> (not res!1029198) (not e!842881))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509089 (= res!1029198 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49099 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49099 a!2804))))))

(declare-fun b!1509090 () Bool)

(declare-fun res!1029203 () Bool)

(assert (=> b!1509090 (=> (not res!1029203) (not e!842881))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509090 (= res!1029203 (validKeyInArray!0 (select (arr!48547 a!2804) i!961)))))

(declare-fun b!1509091 () Bool)

(declare-fun res!1029202 () Bool)

(declare-fun e!842883 () Bool)

(assert (=> b!1509091 (=> (not res!1029202) (not e!842883))))

(declare-datatypes ((SeekEntryResult!12741 0))(
  ( (MissingZero!12741 (index!53359 (_ BitVec 32))) (Found!12741 (index!53360 (_ BitVec 32))) (Intermediate!12741 (undefined!13553 Bool) (index!53361 (_ BitVec 32)) (x!135117 (_ BitVec 32))) (Undefined!12741) (MissingVacant!12741 (index!53362 (_ BitVec 32))) )
))
(declare-fun lt!654596 () SeekEntryResult!12741)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100618 (_ BitVec 32)) SeekEntryResult!12741)

(assert (=> b!1509091 (= res!1029202 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48547 a!2804) j!70) a!2804 mask!2512) lt!654596))))

(declare-fun b!1509092 () Bool)

(declare-fun res!1029201 () Bool)

(assert (=> b!1509092 (=> (not res!1029201) (not e!842883))))

(declare-fun lt!654597 () SeekEntryResult!12741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509092 (= res!1029201 (= lt!654597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100619 (store (arr!48547 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49099 a!2804)) mask!2512)))))

(declare-fun b!1509093 () Bool)

(assert (=> b!1509093 (= e!842881 e!842883)))

(declare-fun res!1029197 () Bool)

(assert (=> b!1509093 (=> (not res!1029197) (not e!842883))))

(assert (=> b!1509093 (= res!1029197 (= lt!654597 lt!654596))))

(assert (=> b!1509093 (= lt!654596 (Intermediate!12741 false resIndex!21 resX!21))))

(assert (=> b!1509093 (= lt!654597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48547 a!2804) j!70) mask!2512) (select (arr!48547 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509094 () Bool)

(declare-fun res!1029204 () Bool)

(assert (=> b!1509094 (=> (not res!1029204) (not e!842881))))

(declare-datatypes ((List!35108 0))(
  ( (Nil!35105) (Cons!35104 (h!36517 (_ BitVec 64)) (t!49794 List!35108)) )
))
(declare-fun arrayNoDuplicates!0 (array!100618 (_ BitVec 32) List!35108) Bool)

(assert (=> b!1509094 (= res!1029204 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35105))))

(declare-fun b!1509095 () Bool)

(declare-fun res!1029199 () Bool)

(assert (=> b!1509095 (=> (not res!1029199) (not e!842881))))

(assert (=> b!1509095 (= res!1029199 (validKeyInArray!0 (select (arr!48547 a!2804) j!70)))))

(declare-fun b!1509096 () Bool)

(assert (=> b!1509096 (= e!842883 (not true))))

(assert (=> b!1509096 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50189 0))(
  ( (Unit!50190) )
))
(declare-fun lt!654595 () Unit!50189)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100618 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50189)

(assert (=> b!1509096 (= lt!654595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509097 () Bool)

(declare-fun res!1029205 () Bool)

(assert (=> b!1509097 (=> (not res!1029205) (not e!842881))))

(assert (=> b!1509097 (= res!1029205 (and (= (size!49099 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49099 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49099 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128762 res!1029206) b!1509097))

(assert (= (and b!1509097 res!1029205) b!1509090))

(assert (= (and b!1509090 res!1029203) b!1509095))

(assert (= (and b!1509095 res!1029199) b!1509088))

(assert (= (and b!1509088 res!1029200) b!1509094))

(assert (= (and b!1509094 res!1029204) b!1509089))

(assert (= (and b!1509089 res!1029198) b!1509093))

(assert (= (and b!1509093 res!1029197) b!1509091))

(assert (= (and b!1509091 res!1029202) b!1509092))

(assert (= (and b!1509092 res!1029201) b!1509096))

(declare-fun m!1390997 () Bool)

(assert (=> b!1509091 m!1390997))

(assert (=> b!1509091 m!1390997))

(declare-fun m!1390999 () Bool)

(assert (=> b!1509091 m!1390999))

(declare-fun m!1391001 () Bool)

(assert (=> b!1509088 m!1391001))

(assert (=> b!1509093 m!1390997))

(assert (=> b!1509093 m!1390997))

(declare-fun m!1391003 () Bool)

(assert (=> b!1509093 m!1391003))

(assert (=> b!1509093 m!1391003))

(assert (=> b!1509093 m!1390997))

(declare-fun m!1391005 () Bool)

(assert (=> b!1509093 m!1391005))

(declare-fun m!1391007 () Bool)

(assert (=> b!1509096 m!1391007))

(declare-fun m!1391009 () Bool)

(assert (=> b!1509096 m!1391009))

(declare-fun m!1391011 () Bool)

(assert (=> b!1509092 m!1391011))

(declare-fun m!1391013 () Bool)

(assert (=> b!1509092 m!1391013))

(assert (=> b!1509092 m!1391013))

(declare-fun m!1391015 () Bool)

(assert (=> b!1509092 m!1391015))

(assert (=> b!1509092 m!1391015))

(assert (=> b!1509092 m!1391013))

(declare-fun m!1391017 () Bool)

(assert (=> b!1509092 m!1391017))

(declare-fun m!1391019 () Bool)

(assert (=> start!128762 m!1391019))

(declare-fun m!1391021 () Bool)

(assert (=> start!128762 m!1391021))

(assert (=> b!1509095 m!1390997))

(assert (=> b!1509095 m!1390997))

(declare-fun m!1391023 () Bool)

(assert (=> b!1509095 m!1391023))

(declare-fun m!1391025 () Bool)

(assert (=> b!1509094 m!1391025))

(declare-fun m!1391027 () Bool)

(assert (=> b!1509090 m!1391027))

(assert (=> b!1509090 m!1391027))

(declare-fun m!1391029 () Bool)

(assert (=> b!1509090 m!1391029))

(check-sat (not b!1509090) (not b!1509094) (not b!1509088) (not b!1509093) (not b!1509092) (not start!128762) (not b!1509091) (not b!1509096) (not b!1509095))
(check-sat)
