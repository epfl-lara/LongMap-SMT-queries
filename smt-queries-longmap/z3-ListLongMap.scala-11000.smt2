; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128780 () Bool)

(assert start!128780)

(declare-fun res!1029488 () Bool)

(declare-fun e!842973 () Bool)

(assert (=> start!128780 (=> (not res!1029488) (not e!842973))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128780 (= res!1029488 (validMask!0 mask!2512))))

(assert (=> start!128780 e!842973))

(assert (=> start!128780 true))

(declare-datatypes ((array!100636 0))(
  ( (array!100637 (arr!48556 (Array (_ BitVec 32) (_ BitVec 64))) (size!49108 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100636)

(declare-fun array_inv!37789 (array!100636) Bool)

(assert (=> start!128780 (array_inv!37789 a!2804)))

(declare-fun b!1509369 () Bool)

(declare-fun res!1029481 () Bool)

(assert (=> b!1509369 (=> (not res!1029481) (not e!842973))))

(declare-datatypes ((List!35117 0))(
  ( (Nil!35114) (Cons!35113 (h!36526 (_ BitVec 64)) (t!49803 List!35117)) )
))
(declare-fun arrayNoDuplicates!0 (array!100636 (_ BitVec 32) List!35117) Bool)

(assert (=> b!1509369 (= res!1029481 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35114))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun b!1509370 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!842976 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509370 (= e!842976 (not (or (not (= (select (arr!48556 a!2804) j!70) (select (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48556 a!2804) index!487) (select (arr!48556 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!842974 () Bool)

(assert (=> b!1509370 e!842974))

(declare-fun res!1029487 () Bool)

(assert (=> b!1509370 (=> (not res!1029487) (not e!842974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100636 (_ BitVec 32)) Bool)

(assert (=> b!1509370 (= res!1029487 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50207 0))(
  ( (Unit!50208) )
))
(declare-fun lt!654678 () Unit!50207)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50207)

(assert (=> b!1509370 (= lt!654678 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509371 () Bool)

(declare-fun res!1029483 () Bool)

(assert (=> b!1509371 (=> (not res!1029483) (not e!842973))))

(assert (=> b!1509371 (= res!1029483 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49108 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49108 a!2804))))))

(declare-fun b!1509372 () Bool)

(declare-fun res!1029480 () Bool)

(assert (=> b!1509372 (=> (not res!1029480) (not e!842976))))

(declare-datatypes ((SeekEntryResult!12750 0))(
  ( (MissingZero!12750 (index!53395 (_ BitVec 32))) (Found!12750 (index!53396 (_ BitVec 32))) (Intermediate!12750 (undefined!13562 Bool) (index!53397 (_ BitVec 32)) (x!135150 (_ BitVec 32))) (Undefined!12750) (MissingVacant!12750 (index!53398 (_ BitVec 32))) )
))
(declare-fun lt!654676 () SeekEntryResult!12750)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100636 (_ BitVec 32)) SeekEntryResult!12750)

(assert (=> b!1509372 (= res!1029480 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48556 a!2804) j!70) a!2804 mask!2512) lt!654676))))

(declare-fun b!1509373 () Bool)

(assert (=> b!1509373 (= e!842973 e!842976)))

(declare-fun res!1029482 () Bool)

(assert (=> b!1509373 (=> (not res!1029482) (not e!842976))))

(declare-fun lt!654677 () SeekEntryResult!12750)

(assert (=> b!1509373 (= res!1029482 (= lt!654677 lt!654676))))

(assert (=> b!1509373 (= lt!654676 (Intermediate!12750 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509373 (= lt!654677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48556 a!2804) j!70) mask!2512) (select (arr!48556 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509374 () Bool)

(declare-fun res!1029479 () Bool)

(assert (=> b!1509374 (=> (not res!1029479) (not e!842973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509374 (= res!1029479 (validKeyInArray!0 (select (arr!48556 a!2804) j!70)))))

(declare-fun b!1509375 () Bool)

(declare-fun res!1029485 () Bool)

(assert (=> b!1509375 (=> (not res!1029485) (not e!842973))))

(assert (=> b!1509375 (= res!1029485 (and (= (size!49108 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49108 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49108 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509376 () Bool)

(declare-fun res!1029478 () Bool)

(assert (=> b!1509376 (=> (not res!1029478) (not e!842973))))

(assert (=> b!1509376 (= res!1029478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509377 () Bool)

(declare-fun res!1029486 () Bool)

(assert (=> b!1509377 (=> (not res!1029486) (not e!842976))))

(assert (=> b!1509377 (= res!1029486 (= lt!654677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100637 (store (arr!48556 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49108 a!2804)) mask!2512)))))

(declare-fun b!1509378 () Bool)

(declare-fun res!1029484 () Bool)

(assert (=> b!1509378 (=> (not res!1029484) (not e!842973))))

(assert (=> b!1509378 (= res!1029484 (validKeyInArray!0 (select (arr!48556 a!2804) i!961)))))

(declare-fun b!1509379 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100636 (_ BitVec 32)) SeekEntryResult!12750)

(assert (=> b!1509379 (= e!842974 (= (seekEntry!0 (select (arr!48556 a!2804) j!70) a!2804 mask!2512) (Found!12750 j!70)))))

(assert (= (and start!128780 res!1029488) b!1509375))

(assert (= (and b!1509375 res!1029485) b!1509378))

(assert (= (and b!1509378 res!1029484) b!1509374))

(assert (= (and b!1509374 res!1029479) b!1509376))

(assert (= (and b!1509376 res!1029478) b!1509369))

(assert (= (and b!1509369 res!1029481) b!1509371))

(assert (= (and b!1509371 res!1029483) b!1509373))

(assert (= (and b!1509373 res!1029482) b!1509372))

(assert (= (and b!1509372 res!1029480) b!1509377))

(assert (= (and b!1509377 res!1029486) b!1509370))

(assert (= (and b!1509370 res!1029487) b!1509379))

(declare-fun m!1391309 () Bool)

(assert (=> b!1509372 m!1391309))

(assert (=> b!1509372 m!1391309))

(declare-fun m!1391311 () Bool)

(assert (=> b!1509372 m!1391311))

(assert (=> b!1509379 m!1391309))

(assert (=> b!1509379 m!1391309))

(declare-fun m!1391313 () Bool)

(assert (=> b!1509379 m!1391313))

(declare-fun m!1391315 () Bool)

(assert (=> b!1509377 m!1391315))

(declare-fun m!1391317 () Bool)

(assert (=> b!1509377 m!1391317))

(assert (=> b!1509377 m!1391317))

(declare-fun m!1391319 () Bool)

(assert (=> b!1509377 m!1391319))

(assert (=> b!1509377 m!1391319))

(assert (=> b!1509377 m!1391317))

(declare-fun m!1391321 () Bool)

(assert (=> b!1509377 m!1391321))

(assert (=> b!1509373 m!1391309))

(assert (=> b!1509373 m!1391309))

(declare-fun m!1391323 () Bool)

(assert (=> b!1509373 m!1391323))

(assert (=> b!1509373 m!1391323))

(assert (=> b!1509373 m!1391309))

(declare-fun m!1391325 () Bool)

(assert (=> b!1509373 m!1391325))

(declare-fun m!1391327 () Bool)

(assert (=> start!128780 m!1391327))

(declare-fun m!1391329 () Bool)

(assert (=> start!128780 m!1391329))

(assert (=> b!1509370 m!1391309))

(declare-fun m!1391331 () Bool)

(assert (=> b!1509370 m!1391331))

(assert (=> b!1509370 m!1391315))

(declare-fun m!1391333 () Bool)

(assert (=> b!1509370 m!1391333))

(assert (=> b!1509370 m!1391317))

(declare-fun m!1391335 () Bool)

(assert (=> b!1509370 m!1391335))

(assert (=> b!1509374 m!1391309))

(assert (=> b!1509374 m!1391309))

(declare-fun m!1391337 () Bool)

(assert (=> b!1509374 m!1391337))

(declare-fun m!1391339 () Bool)

(assert (=> b!1509369 m!1391339))

(declare-fun m!1391341 () Bool)

(assert (=> b!1509378 m!1391341))

(assert (=> b!1509378 m!1391341))

(declare-fun m!1391343 () Bool)

(assert (=> b!1509378 m!1391343))

(declare-fun m!1391345 () Bool)

(assert (=> b!1509376 m!1391345))

(check-sat (not b!1509376) (not b!1509378) (not b!1509370) (not b!1509379) (not b!1509369) (not b!1509377) (not b!1509374) (not start!128780) (not b!1509373) (not b!1509372))
(check-sat)
