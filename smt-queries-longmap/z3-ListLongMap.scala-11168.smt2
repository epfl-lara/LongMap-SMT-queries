; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130500 () Bool)

(assert start!130500)

(declare-fun b!1531896 () Bool)

(declare-fun res!1049233 () Bool)

(declare-fun e!853519 () Bool)

(assert (=> b!1531896 (=> (not res!1049233) (not e!853519))))

(declare-datatypes ((SeekEntryResult!13248 0))(
  ( (MissingZero!13248 (index!55387 (_ BitVec 32))) (Found!13248 (index!55388 (_ BitVec 32))) (Intermediate!13248 (undefined!14060 Bool) (index!55389 (_ BitVec 32)) (x!137085 (_ BitVec 32))) (Undefined!13248) (MissingVacant!13248 (index!55390 (_ BitVec 32))) )
))
(declare-fun lt!663304 () SeekEntryResult!13248)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101677 0))(
  ( (array!101678 (arr!49060 (Array (_ BitVec 32) (_ BitVec 64))) (size!49612 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101677)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13248)

(assert (=> b!1531896 (= res!1049233 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) lt!663304))))

(declare-fun b!1531897 () Bool)

(declare-fun res!1049226 () Bool)

(declare-fun e!853518 () Bool)

(assert (=> b!1531897 (=> res!1049226 e!853518)))

(declare-fun lt!663305 () (_ BitVec 32))

(assert (=> b!1531897 (= res!1049226 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663305 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) lt!663304)))))

(declare-fun b!1531898 () Bool)

(declare-fun e!853521 () Bool)

(assert (=> b!1531898 (= e!853521 e!853518)))

(declare-fun res!1049225 () Bool)

(assert (=> b!1531898 (=> res!1049225 e!853518)))

(assert (=> b!1531898 (= res!1049225 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663305 #b00000000000000000000000000000000) (bvsge lt!663305 (size!49612 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531898 (= lt!663305 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531899 () Bool)

(declare-fun e!853522 () Bool)

(assert (=> b!1531899 (= e!853522 e!853519)))

(declare-fun res!1049231 () Bool)

(assert (=> b!1531899 (=> (not res!1049231) (not e!853519))))

(declare-fun lt!663309 () SeekEntryResult!13248)

(assert (=> b!1531899 (= res!1049231 (= lt!663309 lt!663304))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531899 (= lt!663304 (Intermediate!13248 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531899 (= lt!663309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49060 a!2804) j!70) mask!2512) (select (arr!49060 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531900 () Bool)

(declare-fun res!1049221 () Bool)

(assert (=> b!1531900 (=> (not res!1049221) (not e!853522))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531900 (= res!1049221 (and (= (size!49612 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49612 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49612 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531901 () Bool)

(declare-fun res!1049223 () Bool)

(assert (=> b!1531901 (=> (not res!1049223) (not e!853522))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531901 (= res!1049223 (validKeyInArray!0 (select (arr!49060 a!2804) i!961)))))

(declare-fun b!1531902 () Bool)

(declare-fun res!1049227 () Bool)

(assert (=> b!1531902 (=> (not res!1049227) (not e!853522))))

(assert (=> b!1531902 (= res!1049227 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49612 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49612 a!2804))))))

(declare-fun b!1531903 () Bool)

(declare-fun e!853520 () Bool)

(assert (=> b!1531903 (= e!853519 e!853520)))

(declare-fun res!1049222 () Bool)

(assert (=> b!1531903 (=> (not res!1049222) (not e!853520))))

(declare-fun lt!663303 () (_ BitVec 64))

(declare-fun lt!663308 () array!101677)

(assert (=> b!1531903 (= res!1049222 (= lt!663309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663303 mask!2512) lt!663303 lt!663308 mask!2512)))))

(assert (=> b!1531903 (= lt!663303 (select (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531903 (= lt!663308 (array!101678 (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49612 a!2804)))))

(declare-fun b!1531904 () Bool)

(assert (=> b!1531904 (= e!853520 (not e!853521))))

(declare-fun res!1049230 () Bool)

(assert (=> b!1531904 (=> res!1049230 e!853521)))

(assert (=> b!1531904 (= res!1049230 (or (not (= (select (arr!49060 a!2804) j!70) lt!663303)) (= x!534 resX!21)))))

(declare-fun e!853517 () Bool)

(assert (=> b!1531904 e!853517))

(declare-fun res!1049229 () Bool)

(assert (=> b!1531904 (=> (not res!1049229) (not e!853517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101677 (_ BitVec 32)) Bool)

(assert (=> b!1531904 (= res!1049229 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51119 0))(
  ( (Unit!51120) )
))
(declare-fun lt!663307 () Unit!51119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51119)

(assert (=> b!1531904 (= lt!663307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531905 () Bool)

(declare-fun res!1049232 () Bool)

(assert (=> b!1531905 (=> (not res!1049232) (not e!853522))))

(assert (=> b!1531905 (= res!1049232 (validKeyInArray!0 (select (arr!49060 a!2804) j!70)))))

(declare-fun b!1531906 () Bool)

(assert (=> b!1531906 (= e!853518 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13248)

(assert (=> b!1531906 (= (seekEntryOrOpen!0 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663303 lt!663308 mask!2512))))

(declare-fun lt!663306 () Unit!51119)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101677 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51119)

(assert (=> b!1531906 (= lt!663306 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663305 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1049220 () Bool)

(assert (=> start!130500 (=> (not res!1049220) (not e!853522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130500 (= res!1049220 (validMask!0 mask!2512))))

(assert (=> start!130500 e!853522))

(assert (=> start!130500 true))

(declare-fun array_inv!38293 (array!101677) Bool)

(assert (=> start!130500 (array_inv!38293 a!2804)))

(declare-fun b!1531907 () Bool)

(declare-fun res!1049224 () Bool)

(assert (=> b!1531907 (=> (not res!1049224) (not e!853522))))

(assert (=> b!1531907 (= res!1049224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531908 () Bool)

(declare-fun res!1049228 () Bool)

(assert (=> b!1531908 (=> (not res!1049228) (not e!853522))))

(declare-datatypes ((List!35621 0))(
  ( (Nil!35618) (Cons!35617 (h!37063 (_ BitVec 64)) (t!50307 List!35621)) )
))
(declare-fun arrayNoDuplicates!0 (array!101677 (_ BitVec 32) List!35621) Bool)

(assert (=> b!1531908 (= res!1049228 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35618))))

(declare-fun b!1531909 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101677 (_ BitVec 32)) SeekEntryResult!13248)

(assert (=> b!1531909 (= e!853517 (= (seekEntry!0 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) (Found!13248 j!70)))))

(assert (= (and start!130500 res!1049220) b!1531900))

(assert (= (and b!1531900 res!1049221) b!1531901))

(assert (= (and b!1531901 res!1049223) b!1531905))

(assert (= (and b!1531905 res!1049232) b!1531907))

(assert (= (and b!1531907 res!1049224) b!1531908))

(assert (= (and b!1531908 res!1049228) b!1531902))

(assert (= (and b!1531902 res!1049227) b!1531899))

(assert (= (and b!1531899 res!1049231) b!1531896))

(assert (= (and b!1531896 res!1049233) b!1531903))

(assert (= (and b!1531903 res!1049222) b!1531904))

(assert (= (and b!1531904 res!1049229) b!1531909))

(assert (= (and b!1531904 (not res!1049230)) b!1531898))

(assert (= (and b!1531898 (not res!1049225)) b!1531897))

(assert (= (and b!1531897 (not res!1049226)) b!1531906))

(declare-fun m!1414019 () Bool)

(assert (=> start!130500 m!1414019))

(declare-fun m!1414021 () Bool)

(assert (=> start!130500 m!1414021))

(declare-fun m!1414023 () Bool)

(assert (=> b!1531898 m!1414023))

(declare-fun m!1414025 () Bool)

(assert (=> b!1531903 m!1414025))

(assert (=> b!1531903 m!1414025))

(declare-fun m!1414027 () Bool)

(assert (=> b!1531903 m!1414027))

(declare-fun m!1414029 () Bool)

(assert (=> b!1531903 m!1414029))

(declare-fun m!1414031 () Bool)

(assert (=> b!1531903 m!1414031))

(declare-fun m!1414033 () Bool)

(assert (=> b!1531908 m!1414033))

(declare-fun m!1414035 () Bool)

(assert (=> b!1531899 m!1414035))

(assert (=> b!1531899 m!1414035))

(declare-fun m!1414037 () Bool)

(assert (=> b!1531899 m!1414037))

(assert (=> b!1531899 m!1414037))

(assert (=> b!1531899 m!1414035))

(declare-fun m!1414039 () Bool)

(assert (=> b!1531899 m!1414039))

(assert (=> b!1531904 m!1414035))

(declare-fun m!1414041 () Bool)

(assert (=> b!1531904 m!1414041))

(declare-fun m!1414043 () Bool)

(assert (=> b!1531904 m!1414043))

(assert (=> b!1531897 m!1414035))

(assert (=> b!1531897 m!1414035))

(declare-fun m!1414045 () Bool)

(assert (=> b!1531897 m!1414045))

(assert (=> b!1531905 m!1414035))

(assert (=> b!1531905 m!1414035))

(declare-fun m!1414047 () Bool)

(assert (=> b!1531905 m!1414047))

(assert (=> b!1531909 m!1414035))

(assert (=> b!1531909 m!1414035))

(declare-fun m!1414049 () Bool)

(assert (=> b!1531909 m!1414049))

(declare-fun m!1414051 () Bool)

(assert (=> b!1531901 m!1414051))

(assert (=> b!1531901 m!1414051))

(declare-fun m!1414053 () Bool)

(assert (=> b!1531901 m!1414053))

(assert (=> b!1531906 m!1414035))

(assert (=> b!1531906 m!1414035))

(declare-fun m!1414055 () Bool)

(assert (=> b!1531906 m!1414055))

(declare-fun m!1414057 () Bool)

(assert (=> b!1531906 m!1414057))

(declare-fun m!1414059 () Bool)

(assert (=> b!1531906 m!1414059))

(declare-fun m!1414061 () Bool)

(assert (=> b!1531907 m!1414061))

(assert (=> b!1531896 m!1414035))

(assert (=> b!1531896 m!1414035))

(declare-fun m!1414063 () Bool)

(assert (=> b!1531896 m!1414063))

(check-sat (not b!1531903) (not b!1531898) (not b!1531897) (not b!1531909) (not b!1531906) (not b!1531901) (not b!1531907) (not b!1531908) (not b!1531904) (not b!1531905) (not b!1531899) (not b!1531896) (not start!130500))
(check-sat)
