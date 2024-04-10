; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128810 () Bool)

(assert start!128810)

(declare-fun b!1509368 () Bool)

(declare-fun res!1029277 () Bool)

(declare-fun e!843078 () Bool)

(assert (=> b!1509368 (=> (not res!1029277) (not e!843078))))

(declare-datatypes ((array!100666 0))(
  ( (array!100667 (arr!48570 (Array (_ BitVec 32) (_ BitVec 64))) (size!49120 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100666)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509368 (= res!1029277 (validKeyInArray!0 (select (arr!48570 a!2804) j!70)))))

(declare-fun b!1509369 () Bool)

(declare-fun res!1029280 () Bool)

(assert (=> b!1509369 (=> (not res!1029280) (not e!843078))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509369 (= res!1029280 (validKeyInArray!0 (select (arr!48570 a!2804) i!961)))))

(declare-fun b!1509370 () Bool)

(declare-fun res!1029279 () Bool)

(assert (=> b!1509370 (=> (not res!1029279) (not e!843078))))

(declare-datatypes ((List!35053 0))(
  ( (Nil!35050) (Cons!35049 (h!36461 (_ BitVec 64)) (t!49747 List!35053)) )
))
(declare-fun arrayNoDuplicates!0 (array!100666 (_ BitVec 32) List!35053) Bool)

(assert (=> b!1509370 (= res!1029279 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35050))))

(declare-fun b!1509371 () Bool)

(declare-fun e!843077 () Bool)

(assert (=> b!1509371 (= e!843078 e!843077)))

(declare-fun res!1029272 () Bool)

(assert (=> b!1509371 (=> (not res!1029272) (not e!843077))))

(declare-datatypes ((SeekEntryResult!12741 0))(
  ( (MissingZero!12741 (index!53359 (_ BitVec 32))) (Found!12741 (index!53360 (_ BitVec 32))) (Intermediate!12741 (undefined!13553 Bool) (index!53361 (_ BitVec 32)) (x!135115 (_ BitVec 32))) (Undefined!12741) (MissingVacant!12741 (index!53362 (_ BitVec 32))) )
))
(declare-fun lt!654872 () SeekEntryResult!12741)

(declare-fun lt!654874 () SeekEntryResult!12741)

(assert (=> b!1509371 (= res!1029272 (= lt!654872 lt!654874))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509371 (= lt!654874 (Intermediate!12741 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100666 (_ BitVec 32)) SeekEntryResult!12741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509371 (= lt!654872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48570 a!2804) j!70) mask!2512) (select (arr!48570 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509372 () Bool)

(declare-fun res!1029271 () Bool)

(assert (=> b!1509372 (=> (not res!1029271) (not e!843077))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509372 (= res!1029271 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48570 a!2804) j!70) a!2804 mask!2512) lt!654874))))

(declare-fun b!1509373 () Bool)

(declare-fun res!1029275 () Bool)

(assert (=> b!1509373 (=> (not res!1029275) (not e!843078))))

(assert (=> b!1509373 (= res!1029275 (and (= (size!49120 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49120 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49120 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509374 () Bool)

(declare-fun res!1029278 () Bool)

(assert (=> b!1509374 (=> (not res!1029278) (not e!843078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100666 (_ BitVec 32)) Bool)

(assert (=> b!1509374 (= res!1029278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509376 () Bool)

(assert (=> b!1509376 (= e!843077 (not true))))

(assert (=> b!1509376 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50350 0))(
  ( (Unit!50351) )
))
(declare-fun lt!654873 () Unit!50350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50350)

(assert (=> b!1509376 (= lt!654873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509377 () Bool)

(declare-fun res!1029273 () Bool)

(assert (=> b!1509377 (=> (not res!1029273) (not e!843078))))

(assert (=> b!1509377 (= res!1029273 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49120 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49120 a!2804))))))

(declare-fun res!1029276 () Bool)

(assert (=> start!128810 (=> (not res!1029276) (not e!843078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128810 (= res!1029276 (validMask!0 mask!2512))))

(assert (=> start!128810 e!843078))

(assert (=> start!128810 true))

(declare-fun array_inv!37598 (array!100666) Bool)

(assert (=> start!128810 (array_inv!37598 a!2804)))

(declare-fun b!1509375 () Bool)

(declare-fun res!1029274 () Bool)

(assert (=> b!1509375 (=> (not res!1029274) (not e!843077))))

(assert (=> b!1509375 (= res!1029274 (= lt!654872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48570 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48570 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100667 (store (arr!48570 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49120 a!2804)) mask!2512)))))

(assert (= (and start!128810 res!1029276) b!1509373))

(assert (= (and b!1509373 res!1029275) b!1509369))

(assert (= (and b!1509369 res!1029280) b!1509368))

(assert (= (and b!1509368 res!1029277) b!1509374))

(assert (= (and b!1509374 res!1029278) b!1509370))

(assert (= (and b!1509370 res!1029279) b!1509377))

(assert (= (and b!1509377 res!1029273) b!1509371))

(assert (= (and b!1509371 res!1029272) b!1509372))

(assert (= (and b!1509372 res!1029271) b!1509375))

(assert (= (and b!1509375 res!1029274) b!1509376))

(declare-fun m!1391837 () Bool)

(assert (=> b!1509372 m!1391837))

(assert (=> b!1509372 m!1391837))

(declare-fun m!1391839 () Bool)

(assert (=> b!1509372 m!1391839))

(declare-fun m!1391841 () Bool)

(assert (=> b!1509370 m!1391841))

(assert (=> b!1509368 m!1391837))

(assert (=> b!1509368 m!1391837))

(declare-fun m!1391843 () Bool)

(assert (=> b!1509368 m!1391843))

(declare-fun m!1391845 () Bool)

(assert (=> start!128810 m!1391845))

(declare-fun m!1391847 () Bool)

(assert (=> start!128810 m!1391847))

(declare-fun m!1391849 () Bool)

(assert (=> b!1509376 m!1391849))

(declare-fun m!1391851 () Bool)

(assert (=> b!1509376 m!1391851))

(declare-fun m!1391853 () Bool)

(assert (=> b!1509374 m!1391853))

(declare-fun m!1391855 () Bool)

(assert (=> b!1509375 m!1391855))

(declare-fun m!1391857 () Bool)

(assert (=> b!1509375 m!1391857))

(assert (=> b!1509375 m!1391857))

(declare-fun m!1391859 () Bool)

(assert (=> b!1509375 m!1391859))

(assert (=> b!1509375 m!1391859))

(assert (=> b!1509375 m!1391857))

(declare-fun m!1391861 () Bool)

(assert (=> b!1509375 m!1391861))

(declare-fun m!1391863 () Bool)

(assert (=> b!1509369 m!1391863))

(assert (=> b!1509369 m!1391863))

(declare-fun m!1391865 () Bool)

(assert (=> b!1509369 m!1391865))

(assert (=> b!1509371 m!1391837))

(assert (=> b!1509371 m!1391837))

(declare-fun m!1391867 () Bool)

(assert (=> b!1509371 m!1391867))

(assert (=> b!1509371 m!1391867))

(assert (=> b!1509371 m!1391837))

(declare-fun m!1391869 () Bool)

(assert (=> b!1509371 m!1391869))

(check-sat (not b!1509369) (not b!1509370) (not b!1509371) (not b!1509375) (not start!128810) (not b!1509372) (not b!1509368) (not b!1509374) (not b!1509376))
(check-sat)
