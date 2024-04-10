; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128712 () Bool)

(assert start!128712)

(declare-fun b!1508409 () Bool)

(declare-fun res!1028418 () Bool)

(declare-fun e!842694 () Bool)

(assert (=> b!1508409 (=> (not res!1028418) (not e!842694))))

(declare-datatypes ((array!100607 0))(
  ( (array!100608 (arr!48542 (Array (_ BitVec 32) (_ BitVec 64))) (size!49092 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100607)

(declare-datatypes ((List!35025 0))(
  ( (Nil!35022) (Cons!35021 (h!36430 (_ BitVec 64)) (t!49719 List!35025)) )
))
(declare-fun arrayNoDuplicates!0 (array!100607 (_ BitVec 32) List!35025) Bool)

(assert (=> b!1508409 (= res!1028418 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35022))))

(declare-fun res!1028420 () Bool)

(assert (=> start!128712 (=> (not res!1028420) (not e!842694))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128712 (= res!1028420 (validMask!0 mask!2512))))

(assert (=> start!128712 e!842694))

(assert (=> start!128712 true))

(declare-fun array_inv!37570 (array!100607) Bool)

(assert (=> start!128712 (array_inv!37570 a!2804)))

(declare-fun b!1508410 () Bool)

(declare-fun res!1028423 () Bool)

(assert (=> b!1508410 (=> (not res!1028423) (not e!842694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100607 (_ BitVec 32)) Bool)

(assert (=> b!1508410 (= res!1028423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508411 () Bool)

(declare-fun res!1028419 () Bool)

(assert (=> b!1508411 (=> (not res!1028419) (not e!842694))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1508411 (= res!1028419 (and (= (size!49092 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49092 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49092 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508412 () Bool)

(declare-fun e!842695 () Bool)

(assert (=> b!1508412 (= e!842694 e!842695)))

(declare-fun res!1028417 () Bool)

(assert (=> b!1508412 (=> (not res!1028417) (not e!842695))))

(declare-datatypes ((SeekEntryResult!12713 0))(
  ( (MissingZero!12713 (index!53247 (_ BitVec 32))) (Found!12713 (index!53248 (_ BitVec 32))) (Intermediate!12713 (undefined!13525 Bool) (index!53249 (_ BitVec 32)) (x!135009 (_ BitVec 32))) (Undefined!12713) (MissingVacant!12713 (index!53250 (_ BitVec 32))) )
))
(declare-fun lt!654624 () SeekEntryResult!12713)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100607 (_ BitVec 32)) SeekEntryResult!12713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508412 (= res!1028417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48542 a!2804) j!70) mask!2512) (select (arr!48542 a!2804) j!70) a!2804 mask!2512) lt!654624))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508412 (= lt!654624 (Intermediate!12713 false resIndex!21 resX!21))))

(declare-fun b!1508413 () Bool)

(declare-fun res!1028422 () Bool)

(assert (=> b!1508413 (=> (not res!1028422) (not e!842695))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508413 (= res!1028422 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48542 a!2804) j!70) a!2804 mask!2512) lt!654624))))

(declare-fun b!1508414 () Bool)

(declare-fun res!1028424 () Bool)

(assert (=> b!1508414 (=> (not res!1028424) (not e!842694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508414 (= res!1028424 (validKeyInArray!0 (select (arr!48542 a!2804) j!70)))))

(declare-fun b!1508415 () Bool)

(declare-fun res!1028421 () Bool)

(assert (=> b!1508415 (=> (not res!1028421) (not e!842694))))

(assert (=> b!1508415 (= res!1028421 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49092 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49092 a!2804))))))

(declare-fun b!1508416 () Bool)

(assert (=> b!1508416 (= e!842695 false)))

(declare-fun lt!654625 () (_ BitVec 32))

(assert (=> b!1508416 (= lt!654625 (toIndex!0 (select (store (arr!48542 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508417 () Bool)

(declare-fun res!1028425 () Bool)

(assert (=> b!1508417 (=> (not res!1028425) (not e!842694))))

(assert (=> b!1508417 (= res!1028425 (validKeyInArray!0 (select (arr!48542 a!2804) i!961)))))

(assert (= (and start!128712 res!1028420) b!1508411))

(assert (= (and b!1508411 res!1028419) b!1508417))

(assert (= (and b!1508417 res!1028425) b!1508414))

(assert (= (and b!1508414 res!1028424) b!1508410))

(assert (= (and b!1508410 res!1028423) b!1508409))

(assert (= (and b!1508409 res!1028418) b!1508415))

(assert (= (and b!1508415 res!1028421) b!1508412))

(assert (= (and b!1508412 res!1028417) b!1508413))

(assert (= (and b!1508413 res!1028422) b!1508416))

(declare-fun m!1390915 () Bool)

(assert (=> b!1508414 m!1390915))

(assert (=> b!1508414 m!1390915))

(declare-fun m!1390917 () Bool)

(assert (=> b!1508414 m!1390917))

(declare-fun m!1390919 () Bool)

(assert (=> b!1508416 m!1390919))

(declare-fun m!1390921 () Bool)

(assert (=> b!1508416 m!1390921))

(assert (=> b!1508416 m!1390921))

(declare-fun m!1390923 () Bool)

(assert (=> b!1508416 m!1390923))

(declare-fun m!1390925 () Bool)

(assert (=> b!1508410 m!1390925))

(declare-fun m!1390927 () Bool)

(assert (=> b!1508409 m!1390927))

(assert (=> b!1508412 m!1390915))

(assert (=> b!1508412 m!1390915))

(declare-fun m!1390929 () Bool)

(assert (=> b!1508412 m!1390929))

(assert (=> b!1508412 m!1390929))

(assert (=> b!1508412 m!1390915))

(declare-fun m!1390931 () Bool)

(assert (=> b!1508412 m!1390931))

(declare-fun m!1390933 () Bool)

(assert (=> b!1508417 m!1390933))

(assert (=> b!1508417 m!1390933))

(declare-fun m!1390935 () Bool)

(assert (=> b!1508417 m!1390935))

(declare-fun m!1390937 () Bool)

(assert (=> start!128712 m!1390937))

(declare-fun m!1390939 () Bool)

(assert (=> start!128712 m!1390939))

(assert (=> b!1508413 m!1390915))

(assert (=> b!1508413 m!1390915))

(declare-fun m!1390941 () Bool)

(assert (=> b!1508413 m!1390941))

(push 1)

