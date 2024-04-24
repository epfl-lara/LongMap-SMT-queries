; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129188 () Bool)

(assert start!129188)

(declare-fun b!1512441 () Bool)

(declare-fun res!1031173 () Bool)

(declare-fun e!844656 () Bool)

(assert (=> b!1512441 (=> (not res!1031173) (not e!844656))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100858 0))(
  ( (array!100859 (arr!48661 (Array (_ BitVec 32) (_ BitVec 64))) (size!49212 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100858)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1512441 (= res!1031173 (and (= (size!49212 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49212 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49212 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512442 () Bool)

(declare-fun res!1031171 () Bool)

(declare-fun e!844658 () Bool)

(assert (=> b!1512442 (=> (not res!1031171) (not e!844658))))

(declare-datatypes ((SeekEntryResult!12725 0))(
  ( (MissingZero!12725 (index!53295 (_ BitVec 32))) (Found!12725 (index!53296 (_ BitVec 32))) (Intermediate!12725 (undefined!13537 Bool) (index!53297 (_ BitVec 32)) (x!135240 (_ BitVec 32))) (Undefined!12725) (MissingVacant!12725 (index!53298 (_ BitVec 32))) )
))
(declare-fun lt!655877 () SeekEntryResult!12725)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12725)

(assert (=> b!1512442 (= res!1031171 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) lt!655877))))

(declare-fun e!844657 () Bool)

(declare-fun b!1512443 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12725)

(assert (=> b!1512443 (= e!844657 (= (seekEntry!0 (select (arr!48661 a!2804) j!70) a!2804 mask!2512) (Found!12725 j!70)))))

(declare-fun b!1512444 () Bool)

(declare-fun res!1031175 () Bool)

(assert (=> b!1512444 (=> (not res!1031175) (not e!844658))))

(declare-fun lt!655878 () SeekEntryResult!12725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512444 (= res!1031175 (= lt!655878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100859 (store (arr!48661 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49212 a!2804)) mask!2512)))))

(declare-fun b!1512445 () Bool)

(declare-fun res!1031177 () Bool)

(assert (=> b!1512445 (=> (not res!1031177) (not e!844656))))

(declare-datatypes ((List!35131 0))(
  ( (Nil!35128) (Cons!35127 (h!36554 (_ BitVec 64)) (t!49817 List!35131)) )
))
(declare-fun arrayNoDuplicates!0 (array!100858 (_ BitVec 32) List!35131) Bool)

(assert (=> b!1512445 (= res!1031177 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35128))))

(declare-fun b!1512446 () Bool)

(declare-fun res!1031167 () Bool)

(assert (=> b!1512446 (=> (not res!1031167) (not e!844656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512446 (= res!1031167 (validKeyInArray!0 (select (arr!48661 a!2804) i!961)))))

(declare-fun b!1512447 () Bool)

(declare-fun res!1031176 () Bool)

(assert (=> b!1512447 (=> (not res!1031176) (not e!844656))))

(assert (=> b!1512447 (= res!1031176 (validKeyInArray!0 (select (arr!48661 a!2804) j!70)))))

(declare-fun b!1512448 () Bool)

(declare-fun res!1031170 () Bool)

(assert (=> b!1512448 (=> (not res!1031170) (not e!844656))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512448 (= res!1031170 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49212 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49212 a!2804))))))

(declare-fun res!1031168 () Bool)

(assert (=> start!129188 (=> (not res!1031168) (not e!844656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129188 (= res!1031168 (validMask!0 mask!2512))))

(assert (=> start!129188 e!844656))

(assert (=> start!129188 true))

(declare-fun array_inv!37942 (array!100858) Bool)

(assert (=> start!129188 (array_inv!37942 a!2804)))

(declare-fun b!1512449 () Bool)

(assert (=> b!1512449 (= e!844656 e!844658)))

(declare-fun res!1031172 () Bool)

(assert (=> b!1512449 (=> (not res!1031172) (not e!844658))))

(assert (=> b!1512449 (= res!1031172 (= lt!655878 lt!655877))))

(assert (=> b!1512449 (= lt!655877 (Intermediate!12725 false resIndex!21 resX!21))))

(assert (=> b!1512449 (= lt!655878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48661 a!2804) j!70) mask!2512) (select (arr!48661 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512450 () Bool)

(declare-fun res!1031169 () Bool)

(assert (=> b!1512450 (=> (not res!1031169) (not e!844656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100858 (_ BitVec 32)) Bool)

(assert (=> b!1512450 (= res!1031169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512451 () Bool)

(assert (=> b!1512451 (= e!844658 (not true))))

(assert (=> b!1512451 e!844657))

(declare-fun res!1031174 () Bool)

(assert (=> b!1512451 (=> (not res!1031174) (not e!844657))))

(assert (=> b!1512451 (= res!1031174 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50353 0))(
  ( (Unit!50354) )
))
(declare-fun lt!655879 () Unit!50353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50353)

(assert (=> b!1512451 (= lt!655879 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129188 res!1031168) b!1512441))

(assert (= (and b!1512441 res!1031173) b!1512446))

(assert (= (and b!1512446 res!1031167) b!1512447))

(assert (= (and b!1512447 res!1031176) b!1512450))

(assert (= (and b!1512450 res!1031169) b!1512445))

(assert (= (and b!1512445 res!1031177) b!1512448))

(assert (= (and b!1512448 res!1031170) b!1512449))

(assert (= (and b!1512449 res!1031172) b!1512442))

(assert (= (and b!1512442 res!1031171) b!1512444))

(assert (= (and b!1512444 res!1031175) b!1512451))

(assert (= (and b!1512451 res!1031174) b!1512443))

(declare-fun m!1395015 () Bool)

(assert (=> b!1512442 m!1395015))

(assert (=> b!1512442 m!1395015))

(declare-fun m!1395017 () Bool)

(assert (=> b!1512442 m!1395017))

(assert (=> b!1512443 m!1395015))

(assert (=> b!1512443 m!1395015))

(declare-fun m!1395019 () Bool)

(assert (=> b!1512443 m!1395019))

(declare-fun m!1395021 () Bool)

(assert (=> b!1512445 m!1395021))

(declare-fun m!1395023 () Bool)

(assert (=> b!1512451 m!1395023))

(declare-fun m!1395025 () Bool)

(assert (=> b!1512451 m!1395025))

(assert (=> b!1512449 m!1395015))

(assert (=> b!1512449 m!1395015))

(declare-fun m!1395027 () Bool)

(assert (=> b!1512449 m!1395027))

(assert (=> b!1512449 m!1395027))

(assert (=> b!1512449 m!1395015))

(declare-fun m!1395029 () Bool)

(assert (=> b!1512449 m!1395029))

(declare-fun m!1395031 () Bool)

(assert (=> b!1512450 m!1395031))

(declare-fun m!1395033 () Bool)

(assert (=> start!129188 m!1395033))

(declare-fun m!1395035 () Bool)

(assert (=> start!129188 m!1395035))

(declare-fun m!1395037 () Bool)

(assert (=> b!1512446 m!1395037))

(assert (=> b!1512446 m!1395037))

(declare-fun m!1395039 () Bool)

(assert (=> b!1512446 m!1395039))

(declare-fun m!1395041 () Bool)

(assert (=> b!1512444 m!1395041))

(declare-fun m!1395043 () Bool)

(assert (=> b!1512444 m!1395043))

(assert (=> b!1512444 m!1395043))

(declare-fun m!1395045 () Bool)

(assert (=> b!1512444 m!1395045))

(assert (=> b!1512444 m!1395045))

(assert (=> b!1512444 m!1395043))

(declare-fun m!1395047 () Bool)

(assert (=> b!1512444 m!1395047))

(assert (=> b!1512447 m!1395015))

(assert (=> b!1512447 m!1395015))

(declare-fun m!1395049 () Bool)

(assert (=> b!1512447 m!1395049))

(check-sat (not b!1512443) (not b!1512449) (not b!1512451) (not b!1512450) (not start!129188) (not b!1512444) (not b!1512445) (not b!1512446) (not b!1512447) (not b!1512442))
(check-sat)
