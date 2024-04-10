; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129770 () Bool)

(assert start!129770)

(declare-fun res!1042099 () Bool)

(declare-fun e!849246 () Bool)

(assert (=> start!129770 (=> (not res!1042099) (not e!849246))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129770 (= res!1042099 (validMask!0 mask!2512))))

(assert (=> start!129770 e!849246))

(assert (=> start!129770 true))

(declare-datatypes ((array!101366 0))(
  ( (array!101367 (arr!48914 (Array (_ BitVec 32) (_ BitVec 64))) (size!49464 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101366)

(declare-fun array_inv!37942 (array!101366) Bool)

(assert (=> start!129770 (array_inv!37942 a!2804)))

(declare-fun b!1523182 () Bool)

(declare-fun res!1042091 () Bool)

(declare-fun e!849244 () Bool)

(assert (=> b!1523182 (=> (not res!1042091) (not e!849244))))

(declare-datatypes ((SeekEntryResult!13079 0))(
  ( (MissingZero!13079 (index!54711 (_ BitVec 32))) (Found!13079 (index!54712 (_ BitVec 32))) (Intermediate!13079 (undefined!13891 Bool) (index!54713 (_ BitVec 32)) (x!136405 (_ BitVec 32))) (Undefined!13079) (MissingVacant!13079 (index!54714 (_ BitVec 32))) )
))
(declare-fun lt!659884 () SeekEntryResult!13079)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101366 (_ BitVec 32)) SeekEntryResult!13079)

(assert (=> b!1523182 (= res!1042091 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48914 a!2804) j!70) a!2804 mask!2512) lt!659884))))

(declare-fun b!1523183 () Bool)

(declare-fun res!1042098 () Bool)

(assert (=> b!1523183 (=> (not res!1042098) (not e!849246))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523183 (= res!1042098 (validKeyInArray!0 (select (arr!48914 a!2804) i!961)))))

(declare-fun b!1523184 () Bool)

(declare-fun res!1042092 () Bool)

(assert (=> b!1523184 (=> (not res!1042092) (not e!849246))))

(assert (=> b!1523184 (= res!1042092 (and (= (size!49464 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49464 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49464 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523185 () Bool)

(assert (=> b!1523185 (= e!849246 e!849244)))

(declare-fun res!1042093 () Bool)

(assert (=> b!1523185 (=> (not res!1042093) (not e!849244))))

(declare-fun lt!659883 () SeekEntryResult!13079)

(assert (=> b!1523185 (= res!1042093 (= lt!659883 lt!659884))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523185 (= lt!659884 (Intermediate!13079 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523185 (= lt!659883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48914 a!2804) j!70) mask!2512) (select (arr!48914 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523186 () Bool)

(declare-fun e!849247 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101366 (_ BitVec 32)) SeekEntryResult!13079)

(assert (=> b!1523186 (= e!849247 (= (seekEntry!0 (select (arr!48914 a!2804) j!70) a!2804 mask!2512) (Found!13079 j!70)))))

(declare-fun b!1523187 () Bool)

(assert (=> b!1523187 (= e!849244 (not true))))

(assert (=> b!1523187 e!849247))

(declare-fun res!1042095 () Bool)

(assert (=> b!1523187 (=> (not res!1042095) (not e!849247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101366 (_ BitVec 32)) Bool)

(assert (=> b!1523187 (= res!1042095 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50942 0))(
  ( (Unit!50943) )
))
(declare-fun lt!659882 () Unit!50942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50942)

(assert (=> b!1523187 (= lt!659882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523188 () Bool)

(declare-fun res!1042089 () Bool)

(assert (=> b!1523188 (=> (not res!1042089) (not e!849246))))

(declare-datatypes ((List!35397 0))(
  ( (Nil!35394) (Cons!35393 (h!36817 (_ BitVec 64)) (t!50091 List!35397)) )
))
(declare-fun arrayNoDuplicates!0 (array!101366 (_ BitVec 32) List!35397) Bool)

(assert (=> b!1523188 (= res!1042089 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35394))))

(declare-fun b!1523189 () Bool)

(declare-fun res!1042090 () Bool)

(assert (=> b!1523189 (=> (not res!1042090) (not e!849246))))

(assert (=> b!1523189 (= res!1042090 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49464 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49464 a!2804))))))

(declare-fun b!1523190 () Bool)

(declare-fun res!1042096 () Bool)

(assert (=> b!1523190 (=> (not res!1042096) (not e!849246))))

(assert (=> b!1523190 (= res!1042096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523191 () Bool)

(declare-fun res!1042094 () Bool)

(assert (=> b!1523191 (=> (not res!1042094) (not e!849244))))

(assert (=> b!1523191 (= res!1042094 (= lt!659883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48914 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48914 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101367 (store (arr!48914 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49464 a!2804)) mask!2512)))))

(declare-fun b!1523192 () Bool)

(declare-fun res!1042097 () Bool)

(assert (=> b!1523192 (=> (not res!1042097) (not e!849246))))

(assert (=> b!1523192 (= res!1042097 (validKeyInArray!0 (select (arr!48914 a!2804) j!70)))))

(assert (= (and start!129770 res!1042099) b!1523184))

(assert (= (and b!1523184 res!1042092) b!1523183))

(assert (= (and b!1523183 res!1042098) b!1523192))

(assert (= (and b!1523192 res!1042097) b!1523190))

(assert (= (and b!1523190 res!1042096) b!1523188))

(assert (= (and b!1523188 res!1042089) b!1523189))

(assert (= (and b!1523189 res!1042090) b!1523185))

(assert (= (and b!1523185 res!1042093) b!1523182))

(assert (= (and b!1523182 res!1042091) b!1523191))

(assert (= (and b!1523191 res!1042094) b!1523187))

(assert (= (and b!1523187 res!1042095) b!1523186))

(declare-fun m!1406277 () Bool)

(assert (=> b!1523191 m!1406277))

(declare-fun m!1406279 () Bool)

(assert (=> b!1523191 m!1406279))

(assert (=> b!1523191 m!1406279))

(declare-fun m!1406281 () Bool)

(assert (=> b!1523191 m!1406281))

(assert (=> b!1523191 m!1406281))

(assert (=> b!1523191 m!1406279))

(declare-fun m!1406283 () Bool)

(assert (=> b!1523191 m!1406283))

(declare-fun m!1406285 () Bool)

(assert (=> b!1523190 m!1406285))

(declare-fun m!1406287 () Bool)

(assert (=> b!1523187 m!1406287))

(declare-fun m!1406289 () Bool)

(assert (=> b!1523187 m!1406289))

(declare-fun m!1406291 () Bool)

(assert (=> b!1523192 m!1406291))

(assert (=> b!1523192 m!1406291))

(declare-fun m!1406293 () Bool)

(assert (=> b!1523192 m!1406293))

(assert (=> b!1523182 m!1406291))

(assert (=> b!1523182 m!1406291))

(declare-fun m!1406295 () Bool)

(assert (=> b!1523182 m!1406295))

(assert (=> b!1523186 m!1406291))

(assert (=> b!1523186 m!1406291))

(declare-fun m!1406297 () Bool)

(assert (=> b!1523186 m!1406297))

(assert (=> b!1523185 m!1406291))

(assert (=> b!1523185 m!1406291))

(declare-fun m!1406299 () Bool)

(assert (=> b!1523185 m!1406299))

(assert (=> b!1523185 m!1406299))

(assert (=> b!1523185 m!1406291))

(declare-fun m!1406301 () Bool)

(assert (=> b!1523185 m!1406301))

(declare-fun m!1406303 () Bool)

(assert (=> b!1523188 m!1406303))

(declare-fun m!1406305 () Bool)

(assert (=> b!1523183 m!1406305))

(assert (=> b!1523183 m!1406305))

(declare-fun m!1406307 () Bool)

(assert (=> b!1523183 m!1406307))

(declare-fun m!1406309 () Bool)

(assert (=> start!129770 m!1406309))

(declare-fun m!1406311 () Bool)

(assert (=> start!129770 m!1406311))

(push 1)

