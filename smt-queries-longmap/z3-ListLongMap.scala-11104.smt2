; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129648 () Bool)

(assert start!129648)

(declare-fun b!1522074 () Bool)

(declare-fun res!1041296 () Bool)

(declare-fun e!848732 () Bool)

(assert (=> b!1522074 (=> (not res!1041296) (not e!848732))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101323 0))(
  ( (array!101324 (arr!48894 (Array (_ BitVec 32) (_ BitVec 64))) (size!49444 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101323)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522074 (= res!1041296 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49444 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49444 a!2804))))))

(declare-fun b!1522075 () Bool)

(declare-fun res!1041297 () Bool)

(declare-fun e!848733 () Bool)

(assert (=> b!1522075 (=> (not res!1041297) (not e!848733))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13059 0))(
  ( (MissingZero!13059 (index!54631 (_ BitVec 32))) (Found!13059 (index!54632 (_ BitVec 32))) (Intermediate!13059 (undefined!13871 Bool) (index!54633 (_ BitVec 32)) (x!136319 (_ BitVec 32))) (Undefined!13059) (MissingVacant!13059 (index!54634 (_ BitVec 32))) )
))
(declare-fun lt!659488 () SeekEntryResult!13059)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101323 (_ BitVec 32)) SeekEntryResult!13059)

(assert (=> b!1522075 (= res!1041297 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48894 a!2804) j!70) a!2804 mask!2512) lt!659488))))

(declare-fun b!1522076 () Bool)

(declare-fun res!1041303 () Bool)

(assert (=> b!1522076 (=> (not res!1041303) (not e!848732))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522076 (= res!1041303 (and (= (size!49444 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49444 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49444 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522077 () Bool)

(declare-fun res!1041299 () Bool)

(assert (=> b!1522077 (=> (not res!1041299) (not e!848732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522077 (= res!1041299 (validKeyInArray!0 (select (arr!48894 a!2804) j!70)))))

(declare-fun b!1522078 () Bool)

(declare-fun res!1041302 () Bool)

(assert (=> b!1522078 (=> (not res!1041302) (not e!848732))))

(declare-datatypes ((List!35377 0))(
  ( (Nil!35374) (Cons!35373 (h!36794 (_ BitVec 64)) (t!50071 List!35377)) )
))
(declare-fun arrayNoDuplicates!0 (array!101323 (_ BitVec 32) List!35377) Bool)

(assert (=> b!1522078 (= res!1041302 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35374))))

(declare-fun res!1041298 () Bool)

(assert (=> start!129648 (=> (not res!1041298) (not e!848732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129648 (= res!1041298 (validMask!0 mask!2512))))

(assert (=> start!129648 e!848732))

(assert (=> start!129648 true))

(declare-fun array_inv!37922 (array!101323) Bool)

(assert (=> start!129648 (array_inv!37922 a!2804)))

(declare-fun b!1522079 () Bool)

(declare-fun res!1041300 () Bool)

(assert (=> b!1522079 (=> (not res!1041300) (not e!848732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101323 (_ BitVec 32)) Bool)

(assert (=> b!1522079 (= res!1041300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522080 () Bool)

(assert (=> b!1522080 (= e!848732 e!848733)))

(declare-fun res!1041301 () Bool)

(assert (=> b!1522080 (=> (not res!1041301) (not e!848733))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522080 (= res!1041301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48894 a!2804) j!70) mask!2512) (select (arr!48894 a!2804) j!70) a!2804 mask!2512) lt!659488))))

(assert (=> b!1522080 (= lt!659488 (Intermediate!13059 false resIndex!21 resX!21))))

(declare-fun b!1522081 () Bool)

(declare-fun res!1041304 () Bool)

(assert (=> b!1522081 (=> (not res!1041304) (not e!848732))))

(assert (=> b!1522081 (= res!1041304 (validKeyInArray!0 (select (arr!48894 a!2804) i!961)))))

(declare-fun b!1522082 () Bool)

(assert (=> b!1522082 (= e!848733 false)))

(declare-fun lt!659487 () SeekEntryResult!13059)

(assert (=> b!1522082 (= lt!659487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48894 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48894 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101324 (store (arr!48894 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49444 a!2804)) mask!2512))))

(assert (= (and start!129648 res!1041298) b!1522076))

(assert (= (and b!1522076 res!1041303) b!1522081))

(assert (= (and b!1522081 res!1041304) b!1522077))

(assert (= (and b!1522077 res!1041299) b!1522079))

(assert (= (and b!1522079 res!1041300) b!1522078))

(assert (= (and b!1522078 res!1041302) b!1522074))

(assert (= (and b!1522074 res!1041296) b!1522080))

(assert (= (and b!1522080 res!1041301) b!1522075))

(assert (= (and b!1522075 res!1041297) b!1522082))

(declare-fun m!1405199 () Bool)

(assert (=> b!1522082 m!1405199))

(declare-fun m!1405201 () Bool)

(assert (=> b!1522082 m!1405201))

(assert (=> b!1522082 m!1405201))

(declare-fun m!1405203 () Bool)

(assert (=> b!1522082 m!1405203))

(assert (=> b!1522082 m!1405203))

(assert (=> b!1522082 m!1405201))

(declare-fun m!1405205 () Bool)

(assert (=> b!1522082 m!1405205))

(declare-fun m!1405207 () Bool)

(assert (=> b!1522081 m!1405207))

(assert (=> b!1522081 m!1405207))

(declare-fun m!1405209 () Bool)

(assert (=> b!1522081 m!1405209))

(declare-fun m!1405211 () Bool)

(assert (=> b!1522077 m!1405211))

(assert (=> b!1522077 m!1405211))

(declare-fun m!1405213 () Bool)

(assert (=> b!1522077 m!1405213))

(assert (=> b!1522075 m!1405211))

(assert (=> b!1522075 m!1405211))

(declare-fun m!1405215 () Bool)

(assert (=> b!1522075 m!1405215))

(declare-fun m!1405217 () Bool)

(assert (=> start!129648 m!1405217))

(declare-fun m!1405219 () Bool)

(assert (=> start!129648 m!1405219))

(declare-fun m!1405221 () Bool)

(assert (=> b!1522079 m!1405221))

(declare-fun m!1405223 () Bool)

(assert (=> b!1522078 m!1405223))

(assert (=> b!1522080 m!1405211))

(assert (=> b!1522080 m!1405211))

(declare-fun m!1405225 () Bool)

(assert (=> b!1522080 m!1405225))

(assert (=> b!1522080 m!1405225))

(assert (=> b!1522080 m!1405211))

(declare-fun m!1405227 () Bool)

(assert (=> b!1522080 m!1405227))

(check-sat (not b!1522079) (not b!1522082) (not start!129648) (not b!1522081) (not b!1522075) (not b!1522080) (not b!1522077) (not b!1522078))
(check-sat)
