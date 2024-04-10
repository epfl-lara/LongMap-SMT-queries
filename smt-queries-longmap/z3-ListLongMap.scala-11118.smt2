; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129874 () Bool)

(assert start!129874)

(declare-fun res!1042924 () Bool)

(declare-fun e!849737 () Bool)

(assert (=> start!129874 (=> (not res!1042924) (not e!849737))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129874 (= res!1042924 (validMask!0 mask!2512))))

(assert (=> start!129874 e!849737))

(assert (=> start!129874 true))

(declare-datatypes ((array!101413 0))(
  ( (array!101414 (arr!48936 (Array (_ BitVec 32) (_ BitVec 64))) (size!49486 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101413)

(declare-fun array_inv!37964 (array!101413) Bool)

(assert (=> start!129874 (array_inv!37964 a!2804)))

(declare-fun b!1524271 () Bool)

(declare-fun res!1042929 () Bool)

(declare-fun e!849738 () Bool)

(assert (=> b!1524271 (=> (not res!1042929) (not e!849738))))

(declare-datatypes ((SeekEntryResult!13101 0))(
  ( (MissingZero!13101 (index!54799 (_ BitVec 32))) (Found!13101 (index!54800 (_ BitVec 32))) (Intermediate!13101 (undefined!13913 Bool) (index!54801 (_ BitVec 32)) (x!136489 (_ BitVec 32))) (Undefined!13101) (MissingVacant!13101 (index!54802 (_ BitVec 32))) )
))
(declare-fun lt!660271 () SeekEntryResult!13101)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101413 (_ BitVec 32)) SeekEntryResult!13101)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524271 (= res!1042929 (= lt!660271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48936 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48936 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101414 (store (arr!48936 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49486 a!2804)) mask!2512)))))

(declare-fun b!1524272 () Bool)

(declare-fun res!1042931 () Bool)

(assert (=> b!1524272 (=> (not res!1042931) (not e!849738))))

(declare-fun lt!660270 () SeekEntryResult!13101)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524272 (= res!1042931 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48936 a!2804) j!70) a!2804 mask!2512) lt!660270))))

(declare-fun b!1524273 () Bool)

(declare-fun res!1042926 () Bool)

(assert (=> b!1524273 (=> (not res!1042926) (not e!849737))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524273 (= res!1042926 (validKeyInArray!0 (select (arr!48936 a!2804) i!961)))))

(declare-fun b!1524274 () Bool)

(declare-fun res!1042927 () Bool)

(assert (=> b!1524274 (=> (not res!1042927) (not e!849737))))

(assert (=> b!1524274 (= res!1042927 (and (= (size!49486 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49486 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49486 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524275 () Bool)

(declare-fun res!1042932 () Bool)

(assert (=> b!1524275 (=> (not res!1042932) (not e!849737))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524275 (= res!1042932 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49486 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49486 a!2804))))))

(declare-fun b!1524276 () Bool)

(declare-fun e!849739 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101413 (_ BitVec 32)) SeekEntryResult!13101)

(assert (=> b!1524276 (= e!849739 (= (seekEntry!0 (select (arr!48936 a!2804) j!70) a!2804 mask!2512) (Found!13101 j!70)))))

(declare-fun b!1524277 () Bool)

(declare-fun res!1042933 () Bool)

(assert (=> b!1524277 (=> (not res!1042933) (not e!849737))))

(declare-datatypes ((List!35419 0))(
  ( (Nil!35416) (Cons!35415 (h!36842 (_ BitVec 64)) (t!50113 List!35419)) )
))
(declare-fun arrayNoDuplicates!0 (array!101413 (_ BitVec 32) List!35419) Bool)

(assert (=> b!1524277 (= res!1042933 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35416))))

(declare-fun b!1524278 () Bool)

(declare-fun res!1042930 () Bool)

(assert (=> b!1524278 (=> (not res!1042930) (not e!849737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101413 (_ BitVec 32)) Bool)

(assert (=> b!1524278 (= res!1042930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524279 () Bool)

(assert (=> b!1524279 (= e!849737 e!849738)))

(declare-fun res!1042928 () Bool)

(assert (=> b!1524279 (=> (not res!1042928) (not e!849738))))

(assert (=> b!1524279 (= res!1042928 (= lt!660271 lt!660270))))

(assert (=> b!1524279 (= lt!660270 (Intermediate!13101 false resIndex!21 resX!21))))

(assert (=> b!1524279 (= lt!660271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48936 a!2804) j!70) mask!2512) (select (arr!48936 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524280 () Bool)

(declare-fun res!1042923 () Bool)

(assert (=> b!1524280 (=> (not res!1042923) (not e!849737))))

(assert (=> b!1524280 (= res!1042923 (validKeyInArray!0 (select (arr!48936 a!2804) j!70)))))

(declare-fun b!1524281 () Bool)

(assert (=> b!1524281 (= e!849738 (not true))))

(assert (=> b!1524281 e!849739))

(declare-fun res!1042925 () Bool)

(assert (=> b!1524281 (=> (not res!1042925) (not e!849739))))

(assert (=> b!1524281 (= res!1042925 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50986 0))(
  ( (Unit!50987) )
))
(declare-fun lt!660269 () Unit!50986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50986)

(assert (=> b!1524281 (= lt!660269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129874 res!1042924) b!1524274))

(assert (= (and b!1524274 res!1042927) b!1524273))

(assert (= (and b!1524273 res!1042926) b!1524280))

(assert (= (and b!1524280 res!1042923) b!1524278))

(assert (= (and b!1524278 res!1042930) b!1524277))

(assert (= (and b!1524277 res!1042933) b!1524275))

(assert (= (and b!1524275 res!1042932) b!1524279))

(assert (= (and b!1524279 res!1042928) b!1524272))

(assert (= (and b!1524272 res!1042931) b!1524271))

(assert (= (and b!1524271 res!1042929) b!1524281))

(assert (= (and b!1524281 res!1042925) b!1524276))

(declare-fun m!1407303 () Bool)

(assert (=> b!1524276 m!1407303))

(assert (=> b!1524276 m!1407303))

(declare-fun m!1407305 () Bool)

(assert (=> b!1524276 m!1407305))

(assert (=> b!1524280 m!1407303))

(assert (=> b!1524280 m!1407303))

(declare-fun m!1407307 () Bool)

(assert (=> b!1524280 m!1407307))

(declare-fun m!1407309 () Bool)

(assert (=> b!1524271 m!1407309))

(declare-fun m!1407311 () Bool)

(assert (=> b!1524271 m!1407311))

(assert (=> b!1524271 m!1407311))

(declare-fun m!1407313 () Bool)

(assert (=> b!1524271 m!1407313))

(assert (=> b!1524271 m!1407313))

(assert (=> b!1524271 m!1407311))

(declare-fun m!1407315 () Bool)

(assert (=> b!1524271 m!1407315))

(assert (=> b!1524272 m!1407303))

(assert (=> b!1524272 m!1407303))

(declare-fun m!1407317 () Bool)

(assert (=> b!1524272 m!1407317))

(assert (=> b!1524279 m!1407303))

(assert (=> b!1524279 m!1407303))

(declare-fun m!1407319 () Bool)

(assert (=> b!1524279 m!1407319))

(assert (=> b!1524279 m!1407319))

(assert (=> b!1524279 m!1407303))

(declare-fun m!1407321 () Bool)

(assert (=> b!1524279 m!1407321))

(declare-fun m!1407323 () Bool)

(assert (=> b!1524281 m!1407323))

(declare-fun m!1407325 () Bool)

(assert (=> b!1524281 m!1407325))

(declare-fun m!1407327 () Bool)

(assert (=> b!1524277 m!1407327))

(declare-fun m!1407329 () Bool)

(assert (=> b!1524278 m!1407329))

(declare-fun m!1407331 () Bool)

(assert (=> b!1524273 m!1407331))

(assert (=> b!1524273 m!1407331))

(declare-fun m!1407333 () Bool)

(assert (=> b!1524273 m!1407333))

(declare-fun m!1407335 () Bool)

(assert (=> start!129874 m!1407335))

(declare-fun m!1407337 () Bool)

(assert (=> start!129874 m!1407337))

(check-sat (not b!1524273) (not start!129874) (not b!1524278) (not b!1524277) (not b!1524280) (not b!1524279) (not b!1524276) (not b!1524272) (not b!1524271) (not b!1524281))
