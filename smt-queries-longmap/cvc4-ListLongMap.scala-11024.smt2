; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128980 () Bool)

(assert start!128980)

(declare-fun b!1512275 () Bool)

(declare-fun res!1032185 () Bool)

(declare-fun e!844150 () Bool)

(assert (=> b!1512275 (=> (not res!1032185) (not e!844150))))

(declare-datatypes ((array!100836 0))(
  ( (array!100837 (arr!48655 (Array (_ BitVec 32) (_ BitVec 64))) (size!49205 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100836)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100836 (_ BitVec 32)) Bool)

(assert (=> b!1512275 (= res!1032185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512276 () Bool)

(declare-fun res!1032184 () Bool)

(declare-fun e!844148 () Bool)

(assert (=> b!1512276 (=> (not res!1032184) (not e!844148))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12826 0))(
  ( (MissingZero!12826 (index!53699 (_ BitVec 32))) (Found!12826 (index!53700 (_ BitVec 32))) (Intermediate!12826 (undefined!13638 Bool) (index!53701 (_ BitVec 32)) (x!135424 (_ BitVec 32))) (Undefined!12826) (MissingVacant!12826 (index!53702 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100836 (_ BitVec 32)) SeekEntryResult!12826)

(assert (=> b!1512276 (= res!1032184 (= (seekEntry!0 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) (Found!12826 j!70)))))

(declare-fun b!1512277 () Bool)

(declare-fun res!1032182 () Bool)

(assert (=> b!1512277 (=> (not res!1032182) (not e!844150))))

(declare-datatypes ((List!35138 0))(
  ( (Nil!35135) (Cons!35134 (h!36546 (_ BitVec 64)) (t!49832 List!35138)) )
))
(declare-fun arrayNoDuplicates!0 (array!100836 (_ BitVec 32) List!35138) Bool)

(assert (=> b!1512277 (= res!1032182 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35135))))

(declare-fun b!1512278 () Bool)

(declare-fun e!844146 () Bool)

(assert (=> b!1512278 (= e!844148 e!844146)))

(declare-fun res!1032180 () Bool)

(assert (=> b!1512278 (=> res!1032180 e!844146)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512278 (= res!1032180 (or (not (= (select (arr!48655 a!2804) j!70) (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48655 a!2804) index!487) (select (arr!48655 a!2804) j!70)) (not (= (select (arr!48655 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512279 () Bool)

(declare-fun e!844149 () Bool)

(assert (=> b!1512279 (= e!844150 e!844149)))

(declare-fun res!1032188 () Bool)

(assert (=> b!1512279 (=> (not res!1032188) (not e!844149))))

(declare-fun lt!655638 () SeekEntryResult!12826)

(declare-fun lt!655637 () SeekEntryResult!12826)

(assert (=> b!1512279 (= res!1032188 (= lt!655638 lt!655637))))

(assert (=> b!1512279 (= lt!655637 (Intermediate!12826 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100836 (_ BitVec 32)) SeekEntryResult!12826)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512279 (= lt!655638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48655 a!2804) j!70) mask!2512) (select (arr!48655 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512280 () Bool)

(declare-fun res!1032178 () Bool)

(assert (=> b!1512280 (=> (not res!1032178) (not e!844150))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512280 (= res!1032178 (validKeyInArray!0 (select (arr!48655 a!2804) j!70)))))

(declare-fun b!1512281 () Bool)

(declare-fun res!1032183 () Bool)

(assert (=> b!1512281 (=> (not res!1032183) (not e!844150))))

(assert (=> b!1512281 (= res!1032183 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49205 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49205 a!2804))))))

(declare-fun b!1512282 () Bool)

(declare-fun res!1032187 () Bool)

(assert (=> b!1512282 (=> (not res!1032187) (not e!844149))))

(assert (=> b!1512282 (= res!1032187 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) lt!655637))))

(declare-fun b!1512283 () Bool)

(assert (=> b!1512283 (= e!844149 (not (or (not (= (select (arr!48655 a!2804) j!70) (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48655 a!2804) index!487) (select (arr!48655 a!2804) j!70)) (not (= (select (arr!48655 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1512283 e!844148))

(declare-fun res!1032186 () Bool)

(assert (=> b!1512283 (=> (not res!1032186) (not e!844148))))

(assert (=> b!1512283 (= res!1032186 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50520 0))(
  ( (Unit!50521) )
))
(declare-fun lt!655639 () Unit!50520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50520)

(assert (=> b!1512283 (= lt!655639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1032181 () Bool)

(assert (=> start!128980 (=> (not res!1032181) (not e!844150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128980 (= res!1032181 (validMask!0 mask!2512))))

(assert (=> start!128980 e!844150))

(assert (=> start!128980 true))

(declare-fun array_inv!37683 (array!100836) Bool)

(assert (=> start!128980 (array_inv!37683 a!2804)))

(declare-fun b!1512284 () Bool)

(declare-fun res!1032179 () Bool)

(assert (=> b!1512284 (=> (not res!1032179) (not e!844149))))

(assert (=> b!1512284 (= res!1032179 (= lt!655638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100837 (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49205 a!2804)) mask!2512)))))

(declare-fun b!1512285 () Bool)

(declare-fun res!1032190 () Bool)

(assert (=> b!1512285 (=> (not res!1032190) (not e!844150))))

(assert (=> b!1512285 (= res!1032190 (and (= (size!49205 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49205 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49205 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512286 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100836 (_ BitVec 32)) SeekEntryResult!12826)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100836 (_ BitVec 32)) SeekEntryResult!12826)

(assert (=> b!1512286 (= e!844146 (= (seekEntryOrOpen!0 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48655 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512287 () Bool)

(declare-fun res!1032189 () Bool)

(assert (=> b!1512287 (=> (not res!1032189) (not e!844150))))

(assert (=> b!1512287 (= res!1032189 (validKeyInArray!0 (select (arr!48655 a!2804) i!961)))))

(assert (= (and start!128980 res!1032181) b!1512285))

(assert (= (and b!1512285 res!1032190) b!1512287))

(assert (= (and b!1512287 res!1032189) b!1512280))

(assert (= (and b!1512280 res!1032178) b!1512275))

(assert (= (and b!1512275 res!1032185) b!1512277))

(assert (= (and b!1512277 res!1032182) b!1512281))

(assert (= (and b!1512281 res!1032183) b!1512279))

(assert (= (and b!1512279 res!1032188) b!1512282))

(assert (= (and b!1512282 res!1032187) b!1512284))

(assert (= (and b!1512284 res!1032179) b!1512283))

(assert (= (and b!1512283 res!1032186) b!1512276))

(assert (= (and b!1512276 res!1032184) b!1512278))

(assert (= (and b!1512278 (not res!1032180)) b!1512286))

(declare-fun m!1395031 () Bool)

(assert (=> start!128980 m!1395031))

(declare-fun m!1395033 () Bool)

(assert (=> start!128980 m!1395033))

(declare-fun m!1395035 () Bool)

(assert (=> b!1512277 m!1395035))

(declare-fun m!1395037 () Bool)

(assert (=> b!1512287 m!1395037))

(assert (=> b!1512287 m!1395037))

(declare-fun m!1395039 () Bool)

(assert (=> b!1512287 m!1395039))

(declare-fun m!1395041 () Bool)

(assert (=> b!1512286 m!1395041))

(assert (=> b!1512286 m!1395041))

(declare-fun m!1395043 () Bool)

(assert (=> b!1512286 m!1395043))

(assert (=> b!1512286 m!1395041))

(declare-fun m!1395045 () Bool)

(assert (=> b!1512286 m!1395045))

(assert (=> b!1512282 m!1395041))

(assert (=> b!1512282 m!1395041))

(declare-fun m!1395047 () Bool)

(assert (=> b!1512282 m!1395047))

(declare-fun m!1395049 () Bool)

(assert (=> b!1512275 m!1395049))

(declare-fun m!1395051 () Bool)

(assert (=> b!1512284 m!1395051))

(declare-fun m!1395053 () Bool)

(assert (=> b!1512284 m!1395053))

(assert (=> b!1512284 m!1395053))

(declare-fun m!1395055 () Bool)

(assert (=> b!1512284 m!1395055))

(assert (=> b!1512284 m!1395055))

(assert (=> b!1512284 m!1395053))

(declare-fun m!1395057 () Bool)

(assert (=> b!1512284 m!1395057))

(assert (=> b!1512279 m!1395041))

(assert (=> b!1512279 m!1395041))

(declare-fun m!1395059 () Bool)

(assert (=> b!1512279 m!1395059))

(assert (=> b!1512279 m!1395059))

(assert (=> b!1512279 m!1395041))

(declare-fun m!1395061 () Bool)

(assert (=> b!1512279 m!1395061))

(assert (=> b!1512283 m!1395041))

(declare-fun m!1395063 () Bool)

(assert (=> b!1512283 m!1395063))

(assert (=> b!1512283 m!1395051))

(declare-fun m!1395065 () Bool)

(assert (=> b!1512283 m!1395065))

(assert (=> b!1512283 m!1395053))

(declare-fun m!1395067 () Bool)

(assert (=> b!1512283 m!1395067))

(assert (=> b!1512278 m!1395041))

(assert (=> b!1512278 m!1395051))

(assert (=> b!1512278 m!1395053))

(assert (=> b!1512278 m!1395065))

(assert (=> b!1512280 m!1395041))

(assert (=> b!1512280 m!1395041))

(declare-fun m!1395069 () Bool)

(assert (=> b!1512280 m!1395069))

(assert (=> b!1512276 m!1395041))

(assert (=> b!1512276 m!1395041))

(declare-fun m!1395071 () Bool)

(assert (=> b!1512276 m!1395071))

(push 1)

(assert (not b!1512275))

