; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128816 () Bool)

(assert start!128816)

(declare-fun res!1029368 () Bool)

(declare-fun e!843105 () Bool)

(assert (=> start!128816 (=> (not res!1029368) (not e!843105))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128816 (= res!1029368 (validMask!0 mask!2512))))

(assert (=> start!128816 e!843105))

(assert (=> start!128816 true))

(declare-datatypes ((array!100672 0))(
  ( (array!100673 (arr!48573 (Array (_ BitVec 32) (_ BitVec 64))) (size!49123 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100672)

(declare-fun array_inv!37601 (array!100672) Bool)

(assert (=> start!128816 (array_inv!37601 a!2804)))

(declare-fun b!1509458 () Bool)

(declare-fun res!1029362 () Bool)

(assert (=> b!1509458 (=> (not res!1029362) (not e!843105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100672 (_ BitVec 32)) Bool)

(assert (=> b!1509458 (= res!1029362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509459 () Bool)

(declare-fun res!1029361 () Bool)

(assert (=> b!1509459 (=> (not res!1029361) (not e!843105))))

(declare-datatypes ((List!35056 0))(
  ( (Nil!35053) (Cons!35052 (h!36464 (_ BitVec 64)) (t!49750 List!35056)) )
))
(declare-fun arrayNoDuplicates!0 (array!100672 (_ BitVec 32) List!35056) Bool)

(assert (=> b!1509459 (= res!1029361 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35053))))

(declare-fun b!1509460 () Bool)

(declare-fun res!1029369 () Bool)

(assert (=> b!1509460 (=> (not res!1029369) (not e!843105))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509460 (= res!1029369 (validKeyInArray!0 (select (arr!48573 a!2804) j!70)))))

(declare-fun b!1509461 () Bool)

(declare-fun res!1029363 () Bool)

(assert (=> b!1509461 (=> (not res!1029363) (not e!843105))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509461 (= res!1029363 (validKeyInArray!0 (select (arr!48573 a!2804) i!961)))))

(declare-fun b!1509462 () Bool)

(declare-fun e!843106 () Bool)

(assert (=> b!1509462 (= e!843105 e!843106)))

(declare-fun res!1029366 () Bool)

(assert (=> b!1509462 (=> (not res!1029366) (not e!843106))))

(declare-datatypes ((SeekEntryResult!12744 0))(
  ( (MissingZero!12744 (index!53371 (_ BitVec 32))) (Found!12744 (index!53372 (_ BitVec 32))) (Intermediate!12744 (undefined!13556 Bool) (index!53373 (_ BitVec 32)) (x!135126 (_ BitVec 32))) (Undefined!12744) (MissingVacant!12744 (index!53374 (_ BitVec 32))) )
))
(declare-fun lt!654900 () SeekEntryResult!12744)

(declare-fun lt!654899 () SeekEntryResult!12744)

(assert (=> b!1509462 (= res!1029366 (= lt!654900 lt!654899))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509462 (= lt!654899 (Intermediate!12744 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100672 (_ BitVec 32)) SeekEntryResult!12744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509462 (= lt!654900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48573 a!2804) j!70) mask!2512) (select (arr!48573 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509463 () Bool)

(assert (=> b!1509463 (= e!843106 (not true))))

(assert (=> b!1509463 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50356 0))(
  ( (Unit!50357) )
))
(declare-fun lt!654901 () Unit!50356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50356)

(assert (=> b!1509463 (= lt!654901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509464 () Bool)

(declare-fun res!1029370 () Bool)

(assert (=> b!1509464 (=> (not res!1029370) (not e!843105))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509464 (= res!1029370 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49123 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49123 a!2804))))))

(declare-fun b!1509465 () Bool)

(declare-fun res!1029367 () Bool)

(assert (=> b!1509465 (=> (not res!1029367) (not e!843106))))

(assert (=> b!1509465 (= res!1029367 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48573 a!2804) j!70) a!2804 mask!2512) lt!654899))))

(declare-fun b!1509466 () Bool)

(declare-fun res!1029365 () Bool)

(assert (=> b!1509466 (=> (not res!1029365) (not e!843105))))

(assert (=> b!1509466 (= res!1029365 (and (= (size!49123 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49123 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49123 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509467 () Bool)

(declare-fun res!1029364 () Bool)

(assert (=> b!1509467 (=> (not res!1029364) (not e!843106))))

(assert (=> b!1509467 (= res!1029364 (= lt!654900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48573 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48573 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100673 (store (arr!48573 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49123 a!2804)) mask!2512)))))

(assert (= (and start!128816 res!1029368) b!1509466))

(assert (= (and b!1509466 res!1029365) b!1509461))

(assert (= (and b!1509461 res!1029363) b!1509460))

(assert (= (and b!1509460 res!1029369) b!1509458))

(assert (= (and b!1509458 res!1029362) b!1509459))

(assert (= (and b!1509459 res!1029361) b!1509464))

(assert (= (and b!1509464 res!1029370) b!1509462))

(assert (= (and b!1509462 res!1029366) b!1509465))

(assert (= (and b!1509465 res!1029367) b!1509467))

(assert (= (and b!1509467 res!1029364) b!1509463))

(declare-fun m!1391939 () Bool)

(assert (=> start!128816 m!1391939))

(declare-fun m!1391941 () Bool)

(assert (=> start!128816 m!1391941))

(declare-fun m!1391943 () Bool)

(assert (=> b!1509463 m!1391943))

(declare-fun m!1391945 () Bool)

(assert (=> b!1509463 m!1391945))

(declare-fun m!1391947 () Bool)

(assert (=> b!1509459 m!1391947))

(declare-fun m!1391949 () Bool)

(assert (=> b!1509465 m!1391949))

(assert (=> b!1509465 m!1391949))

(declare-fun m!1391951 () Bool)

(assert (=> b!1509465 m!1391951))

(declare-fun m!1391953 () Bool)

(assert (=> b!1509461 m!1391953))

(assert (=> b!1509461 m!1391953))

(declare-fun m!1391955 () Bool)

(assert (=> b!1509461 m!1391955))

(assert (=> b!1509462 m!1391949))

(assert (=> b!1509462 m!1391949))

(declare-fun m!1391957 () Bool)

(assert (=> b!1509462 m!1391957))

(assert (=> b!1509462 m!1391957))

(assert (=> b!1509462 m!1391949))

(declare-fun m!1391959 () Bool)

(assert (=> b!1509462 m!1391959))

(assert (=> b!1509460 m!1391949))

(assert (=> b!1509460 m!1391949))

(declare-fun m!1391961 () Bool)

(assert (=> b!1509460 m!1391961))

(declare-fun m!1391963 () Bool)

(assert (=> b!1509458 m!1391963))

(declare-fun m!1391965 () Bool)

(assert (=> b!1509467 m!1391965))

(declare-fun m!1391967 () Bool)

(assert (=> b!1509467 m!1391967))

(assert (=> b!1509467 m!1391967))

(declare-fun m!1391969 () Bool)

(assert (=> b!1509467 m!1391969))

(assert (=> b!1509467 m!1391969))

(assert (=> b!1509467 m!1391967))

(declare-fun m!1391971 () Bool)

(assert (=> b!1509467 m!1391971))

(check-sat (not b!1509460) (not start!128816) (not b!1509463) (not b!1509459) (not b!1509465) (not b!1509461) (not b!1509458) (not b!1509462) (not b!1509467))
(check-sat)
