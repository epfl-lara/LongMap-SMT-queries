; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129774 () Bool)

(assert start!129774)

(declare-fun b!1523248 () Bool)

(declare-fun e!849269 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101370 0))(
  ( (array!101371 (arr!48916 (Array (_ BitVec 32) (_ BitVec 64))) (size!49466 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101370)

(declare-datatypes ((SeekEntryResult!13081 0))(
  ( (MissingZero!13081 (index!54719 (_ BitVec 32))) (Found!13081 (index!54720 (_ BitVec 32))) (Intermediate!13081 (undefined!13893 Bool) (index!54721 (_ BitVec 32)) (x!136407 (_ BitVec 32))) (Undefined!13081) (MissingVacant!13081 (index!54722 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101370 (_ BitVec 32)) SeekEntryResult!13081)

(assert (=> b!1523248 (= e!849269 (= (seekEntry!0 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) (Found!13081 j!70)))))

(declare-fun b!1523249 () Bool)

(declare-fun res!1042159 () Bool)

(declare-fun e!849271 () Bool)

(assert (=> b!1523249 (=> (not res!1042159) (not e!849271))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!659901 () SeekEntryResult!13081)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101370 (_ BitVec 32)) SeekEntryResult!13081)

(assert (=> b!1523249 (= res!1042159 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48916 a!2804) j!70) a!2804 mask!2512) lt!659901))))

(declare-fun b!1523250 () Bool)

(declare-fun res!1042161 () Bool)

(assert (=> b!1523250 (=> (not res!1042161) (not e!849271))))

(declare-fun lt!659902 () SeekEntryResult!13081)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523250 (= res!1042161 (= lt!659902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101371 (store (arr!48916 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49466 a!2804)) mask!2512)))))

(declare-fun b!1523251 () Bool)

(declare-fun res!1042164 () Bool)

(declare-fun e!849270 () Bool)

(assert (=> b!1523251 (=> (not res!1042164) (not e!849270))))

(assert (=> b!1523251 (= res!1042164 (and (= (size!49466 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49466 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49466 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1042165 () Bool)

(assert (=> start!129774 (=> (not res!1042165) (not e!849270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129774 (= res!1042165 (validMask!0 mask!2512))))

(assert (=> start!129774 e!849270))

(assert (=> start!129774 true))

(declare-fun array_inv!37944 (array!101370) Bool)

(assert (=> start!129774 (array_inv!37944 a!2804)))

(declare-fun b!1523252 () Bool)

(declare-fun res!1042155 () Bool)

(assert (=> b!1523252 (=> (not res!1042155) (not e!849270))))

(declare-datatypes ((List!35399 0))(
  ( (Nil!35396) (Cons!35395 (h!36819 (_ BitVec 64)) (t!50093 List!35399)) )
))
(declare-fun arrayNoDuplicates!0 (array!101370 (_ BitVec 32) List!35399) Bool)

(assert (=> b!1523252 (= res!1042155 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35396))))

(declare-fun b!1523253 () Bool)

(assert (=> b!1523253 (= e!849271 (not true))))

(assert (=> b!1523253 e!849269))

(declare-fun res!1042158 () Bool)

(assert (=> b!1523253 (=> (not res!1042158) (not e!849269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101370 (_ BitVec 32)) Bool)

(assert (=> b!1523253 (= res!1042158 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50946 0))(
  ( (Unit!50947) )
))
(declare-fun lt!659900 () Unit!50946)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50946)

(assert (=> b!1523253 (= lt!659900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523254 () Bool)

(declare-fun res!1042163 () Bool)

(assert (=> b!1523254 (=> (not res!1042163) (not e!849270))))

(assert (=> b!1523254 (= res!1042163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523255 () Bool)

(declare-fun res!1042162 () Bool)

(assert (=> b!1523255 (=> (not res!1042162) (not e!849270))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523255 (= res!1042162 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49466 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49466 a!2804))))))

(declare-fun b!1523256 () Bool)

(assert (=> b!1523256 (= e!849270 e!849271)))

(declare-fun res!1042157 () Bool)

(assert (=> b!1523256 (=> (not res!1042157) (not e!849271))))

(assert (=> b!1523256 (= res!1042157 (= lt!659902 lt!659901))))

(assert (=> b!1523256 (= lt!659901 (Intermediate!13081 false resIndex!21 resX!21))))

(assert (=> b!1523256 (= lt!659902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48916 a!2804) j!70) mask!2512) (select (arr!48916 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523257 () Bool)

(declare-fun res!1042156 () Bool)

(assert (=> b!1523257 (=> (not res!1042156) (not e!849270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523257 (= res!1042156 (validKeyInArray!0 (select (arr!48916 a!2804) i!961)))))

(declare-fun b!1523258 () Bool)

(declare-fun res!1042160 () Bool)

(assert (=> b!1523258 (=> (not res!1042160) (not e!849270))))

(assert (=> b!1523258 (= res!1042160 (validKeyInArray!0 (select (arr!48916 a!2804) j!70)))))

(assert (= (and start!129774 res!1042165) b!1523251))

(assert (= (and b!1523251 res!1042164) b!1523257))

(assert (= (and b!1523257 res!1042156) b!1523258))

(assert (= (and b!1523258 res!1042160) b!1523254))

(assert (= (and b!1523254 res!1042163) b!1523252))

(assert (= (and b!1523252 res!1042155) b!1523255))

(assert (= (and b!1523255 res!1042162) b!1523256))

(assert (= (and b!1523256 res!1042157) b!1523249))

(assert (= (and b!1523249 res!1042159) b!1523250))

(assert (= (and b!1523250 res!1042161) b!1523253))

(assert (= (and b!1523253 res!1042158) b!1523248))

(declare-fun m!1406349 () Bool)

(assert (=> b!1523257 m!1406349))

(assert (=> b!1523257 m!1406349))

(declare-fun m!1406351 () Bool)

(assert (=> b!1523257 m!1406351))

(declare-fun m!1406353 () Bool)

(assert (=> b!1523248 m!1406353))

(assert (=> b!1523248 m!1406353))

(declare-fun m!1406355 () Bool)

(assert (=> b!1523248 m!1406355))

(assert (=> b!1523256 m!1406353))

(assert (=> b!1523256 m!1406353))

(declare-fun m!1406357 () Bool)

(assert (=> b!1523256 m!1406357))

(assert (=> b!1523256 m!1406357))

(assert (=> b!1523256 m!1406353))

(declare-fun m!1406359 () Bool)

(assert (=> b!1523256 m!1406359))

(declare-fun m!1406361 () Bool)

(assert (=> b!1523254 m!1406361))

(assert (=> b!1523249 m!1406353))

(assert (=> b!1523249 m!1406353))

(declare-fun m!1406363 () Bool)

(assert (=> b!1523249 m!1406363))

(declare-fun m!1406365 () Bool)

(assert (=> start!129774 m!1406365))

(declare-fun m!1406367 () Bool)

(assert (=> start!129774 m!1406367))

(assert (=> b!1523258 m!1406353))

(assert (=> b!1523258 m!1406353))

(declare-fun m!1406369 () Bool)

(assert (=> b!1523258 m!1406369))

(declare-fun m!1406371 () Bool)

(assert (=> b!1523252 m!1406371))

(declare-fun m!1406373 () Bool)

(assert (=> b!1523253 m!1406373))

(declare-fun m!1406375 () Bool)

(assert (=> b!1523253 m!1406375))

(declare-fun m!1406377 () Bool)

(assert (=> b!1523250 m!1406377))

(declare-fun m!1406379 () Bool)

(assert (=> b!1523250 m!1406379))

(assert (=> b!1523250 m!1406379))

(declare-fun m!1406381 () Bool)

(assert (=> b!1523250 m!1406381))

(assert (=> b!1523250 m!1406381))

(assert (=> b!1523250 m!1406379))

(declare-fun m!1406383 () Bool)

(assert (=> b!1523250 m!1406383))

(push 1)

