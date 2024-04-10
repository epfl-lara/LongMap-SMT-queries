; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129656 () Bool)

(assert start!129656)

(declare-fun res!1041414 () Bool)

(declare-fun e!848768 () Bool)

(assert (=> start!129656 (=> (not res!1041414) (not e!848768))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129656 (= res!1041414 (validMask!0 mask!2512))))

(assert (=> start!129656 e!848768))

(assert (=> start!129656 true))

(declare-datatypes ((array!101331 0))(
  ( (array!101332 (arr!48898 (Array (_ BitVec 32) (_ BitVec 64))) (size!49448 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101331)

(declare-fun array_inv!37926 (array!101331) Bool)

(assert (=> start!129656 (array_inv!37926 a!2804)))

(declare-fun b!1522190 () Bool)

(declare-fun res!1041419 () Bool)

(assert (=> b!1522190 (=> (not res!1041419) (not e!848768))))

(declare-datatypes ((List!35381 0))(
  ( (Nil!35378) (Cons!35377 (h!36798 (_ BitVec 64)) (t!50075 List!35381)) )
))
(declare-fun arrayNoDuplicates!0 (array!101331 (_ BitVec 32) List!35381) Bool)

(assert (=> b!1522190 (= res!1041419 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35378))))

(declare-fun b!1522191 () Bool)

(declare-fun res!1041412 () Bool)

(assert (=> b!1522191 (=> (not res!1041412) (not e!848768))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1522191 (= res!1041412 (and (= (size!49448 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49448 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49448 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522192 () Bool)

(declare-fun e!848769 () Bool)

(assert (=> b!1522192 (= e!848768 e!848769)))

(declare-fun res!1041417 () Bool)

(assert (=> b!1522192 (=> (not res!1041417) (not e!848769))))

(declare-datatypes ((SeekEntryResult!13063 0))(
  ( (MissingZero!13063 (index!54647 (_ BitVec 32))) (Found!13063 (index!54648 (_ BitVec 32))) (Intermediate!13063 (undefined!13875 Bool) (index!54649 (_ BitVec 32)) (x!136331 (_ BitVec 32))) (Undefined!13063) (MissingVacant!13063 (index!54650 (_ BitVec 32))) )
))
(declare-fun lt!659519 () SeekEntryResult!13063)

(declare-fun lt!659520 () SeekEntryResult!13063)

(assert (=> b!1522192 (= res!1041417 (= lt!659519 lt!659520))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522192 (= lt!659520 (Intermediate!13063 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101331 (_ BitVec 32)) SeekEntryResult!13063)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522192 (= lt!659519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48898 a!2804) j!70) mask!2512) (select (arr!48898 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522193 () Bool)

(declare-fun res!1041413 () Bool)

(assert (=> b!1522193 (=> (not res!1041413) (not e!848768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522193 (= res!1041413 (validKeyInArray!0 (select (arr!48898 a!2804) j!70)))))

(declare-fun b!1522194 () Bool)

(declare-fun res!1041416 () Bool)

(assert (=> b!1522194 (=> (not res!1041416) (not e!848769))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522194 (= res!1041416 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48898 a!2804) j!70) a!2804 mask!2512) lt!659520))))

(declare-fun b!1522195 () Bool)

(declare-fun res!1041418 () Bool)

(assert (=> b!1522195 (=> (not res!1041418) (not e!848769))))

(assert (=> b!1522195 (= res!1041418 (= lt!659519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101332 (store (arr!48898 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49448 a!2804)) mask!2512)))))

(declare-fun b!1522196 () Bool)

(assert (=> b!1522196 (= e!848769 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101331 (_ BitVec 32)) Bool)

(assert (=> b!1522196 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50910 0))(
  ( (Unit!50911) )
))
(declare-fun lt!659521 () Unit!50910)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50910)

(assert (=> b!1522196 (= lt!659521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522197 () Bool)

(declare-fun res!1041420 () Bool)

(assert (=> b!1522197 (=> (not res!1041420) (not e!848768))))

(assert (=> b!1522197 (= res!1041420 (validKeyInArray!0 (select (arr!48898 a!2804) i!961)))))

(declare-fun b!1522198 () Bool)

(declare-fun res!1041415 () Bool)

(assert (=> b!1522198 (=> (not res!1041415) (not e!848768))))

(assert (=> b!1522198 (= res!1041415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522199 () Bool)

(declare-fun res!1041421 () Bool)

(assert (=> b!1522199 (=> (not res!1041421) (not e!848768))))

(assert (=> b!1522199 (= res!1041421 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49448 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49448 a!2804))))))

(assert (= (and start!129656 res!1041414) b!1522191))

(assert (= (and b!1522191 res!1041412) b!1522197))

(assert (= (and b!1522197 res!1041420) b!1522193))

(assert (= (and b!1522193 res!1041413) b!1522198))

(assert (= (and b!1522198 res!1041415) b!1522190))

(assert (= (and b!1522190 res!1041419) b!1522199))

(assert (= (and b!1522199 res!1041421) b!1522192))

(assert (= (and b!1522192 res!1041417) b!1522194))

(assert (= (and b!1522194 res!1041416) b!1522195))

(assert (= (and b!1522195 res!1041418) b!1522196))

(declare-fun m!1405327 () Bool)

(assert (=> b!1522195 m!1405327))

(declare-fun m!1405329 () Bool)

(assert (=> b!1522195 m!1405329))

(assert (=> b!1522195 m!1405329))

(declare-fun m!1405331 () Bool)

(assert (=> b!1522195 m!1405331))

(assert (=> b!1522195 m!1405331))

(assert (=> b!1522195 m!1405329))

(declare-fun m!1405333 () Bool)

(assert (=> b!1522195 m!1405333))

(declare-fun m!1405335 () Bool)

(assert (=> b!1522193 m!1405335))

(assert (=> b!1522193 m!1405335))

(declare-fun m!1405337 () Bool)

(assert (=> b!1522193 m!1405337))

(assert (=> b!1522194 m!1405335))

(assert (=> b!1522194 m!1405335))

(declare-fun m!1405339 () Bool)

(assert (=> b!1522194 m!1405339))

(declare-fun m!1405341 () Bool)

(assert (=> b!1522196 m!1405341))

(declare-fun m!1405343 () Bool)

(assert (=> b!1522196 m!1405343))

(assert (=> b!1522192 m!1405335))

(assert (=> b!1522192 m!1405335))

(declare-fun m!1405345 () Bool)

(assert (=> b!1522192 m!1405345))

(assert (=> b!1522192 m!1405345))

(assert (=> b!1522192 m!1405335))

(declare-fun m!1405347 () Bool)

(assert (=> b!1522192 m!1405347))

(declare-fun m!1405349 () Bool)

(assert (=> start!129656 m!1405349))

(declare-fun m!1405351 () Bool)

(assert (=> start!129656 m!1405351))

(declare-fun m!1405353 () Bool)

(assert (=> b!1522198 m!1405353))

(declare-fun m!1405355 () Bool)

(assert (=> b!1522197 m!1405355))

(assert (=> b!1522197 m!1405355))

(declare-fun m!1405357 () Bool)

(assert (=> b!1522197 m!1405357))

(declare-fun m!1405359 () Bool)

(assert (=> b!1522190 m!1405359))

(push 1)

(assert (not b!1522196))

(assert (not b!1522193))

(assert (not b!1522192))

(assert (not b!1522198))

