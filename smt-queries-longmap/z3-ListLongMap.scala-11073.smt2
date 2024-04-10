; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129272 () Bool)

(assert start!129272)

(declare-fun b!1518059 () Bool)

(declare-fun res!1037968 () Bool)

(declare-fun e!846902 () Bool)

(assert (=> b!1518059 (=> (not res!1037968) (not e!846902))))

(declare-datatypes ((array!101128 0))(
  ( (array!101129 (arr!48801 (Array (_ BitVec 32) (_ BitVec 64))) (size!49351 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101128)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101128 (_ BitVec 32)) Bool)

(assert (=> b!1518059 (= res!1037968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518060 () Bool)

(declare-fun res!1037969 () Bool)

(declare-fun e!846904 () Bool)

(assert (=> b!1518060 (=> (not res!1037969) (not e!846904))))

(declare-datatypes ((SeekEntryResult!12972 0))(
  ( (MissingZero!12972 (index!54283 (_ BitVec 32))) (Found!12972 (index!54284 (_ BitVec 32))) (Intermediate!12972 (undefined!13784 Bool) (index!54285 (_ BitVec 32)) (x!135962 (_ BitVec 32))) (Undefined!12972) (MissingVacant!12972 (index!54286 (_ BitVec 32))) )
))
(declare-fun lt!658026 () SeekEntryResult!12972)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518060 (= res!1037969 (= lt!658026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48801 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48801 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101129 (store (arr!48801 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49351 a!2804)) mask!2512)))))

(declare-fun b!1518061 () Bool)

(declare-fun res!1037966 () Bool)

(assert (=> b!1518061 (=> (not res!1037966) (not e!846902))))

(assert (=> b!1518061 (= res!1037966 (and (= (size!49351 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49351 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49351 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518062 () Bool)

(declare-fun res!1037967 () Bool)

(assert (=> b!1518062 (=> (not res!1037967) (not e!846902))))

(declare-datatypes ((List!35284 0))(
  ( (Nil!35281) (Cons!35280 (h!36692 (_ BitVec 64)) (t!49978 List!35284)) )
))
(declare-fun arrayNoDuplicates!0 (array!101128 (_ BitVec 32) List!35284) Bool)

(assert (=> b!1518062 (= res!1037967 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35281))))

(declare-fun b!1518063 () Bool)

(declare-fun e!846901 () Bool)

(assert (=> b!1518063 (= e!846901 true)))

(declare-fun lt!658027 () (_ BitVec 32))

(declare-fun lt!658024 () SeekEntryResult!12972)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518063 (= lt!658024 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658027 (select (arr!48801 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037962 () Bool)

(assert (=> start!129272 (=> (not res!1037962) (not e!846902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129272 (= res!1037962 (validMask!0 mask!2512))))

(assert (=> start!129272 e!846902))

(assert (=> start!129272 true))

(declare-fun array_inv!37829 (array!101128) Bool)

(assert (=> start!129272 (array_inv!37829 a!2804)))

(declare-fun b!1518064 () Bool)

(declare-fun res!1037974 () Bool)

(assert (=> b!1518064 (=> (not res!1037974) (not e!846902))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518064 (= res!1037974 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49351 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49351 a!2804))))))

(declare-fun b!1518065 () Bool)

(declare-fun e!846903 () Bool)

(assert (=> b!1518065 (= e!846903 e!846901)))

(declare-fun res!1037965 () Bool)

(assert (=> b!1518065 (=> res!1037965 e!846901)))

(assert (=> b!1518065 (= res!1037965 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658027 #b00000000000000000000000000000000) (bvsge lt!658027 (size!49351 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518065 (= lt!658027 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518066 () Bool)

(declare-fun res!1037971 () Bool)

(assert (=> b!1518066 (=> (not res!1037971) (not e!846902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518066 (= res!1037971 (validKeyInArray!0 (select (arr!48801 a!2804) i!961)))))

(declare-fun b!1518067 () Bool)

(declare-fun res!1037970 () Bool)

(assert (=> b!1518067 (=> (not res!1037970) (not e!846904))))

(declare-fun lt!658023 () SeekEntryResult!12972)

(assert (=> b!1518067 (= res!1037970 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48801 a!2804) j!70) a!2804 mask!2512) lt!658023))))

(declare-fun b!1518068 () Bool)

(declare-fun res!1037963 () Bool)

(assert (=> b!1518068 (=> (not res!1037963) (not e!846902))))

(assert (=> b!1518068 (= res!1037963 (validKeyInArray!0 (select (arr!48801 a!2804) j!70)))))

(declare-fun b!1518069 () Bool)

(assert (=> b!1518069 (= e!846904 (not e!846903))))

(declare-fun res!1037964 () Bool)

(assert (=> b!1518069 (=> res!1037964 e!846903)))

(assert (=> b!1518069 (= res!1037964 (or (not (= (select (arr!48801 a!2804) j!70) (select (store (arr!48801 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846899 () Bool)

(assert (=> b!1518069 e!846899))

(declare-fun res!1037973 () Bool)

(assert (=> b!1518069 (=> (not res!1037973) (not e!846899))))

(assert (=> b!1518069 (= res!1037973 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50812 0))(
  ( (Unit!50813) )
))
(declare-fun lt!658025 () Unit!50812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50812)

(assert (=> b!1518069 (= lt!658025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518070 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12972)

(assert (=> b!1518070 (= e!846899 (= (seekEntry!0 (select (arr!48801 a!2804) j!70) a!2804 mask!2512) (Found!12972 j!70)))))

(declare-fun b!1518071 () Bool)

(assert (=> b!1518071 (= e!846902 e!846904)))

(declare-fun res!1037972 () Bool)

(assert (=> b!1518071 (=> (not res!1037972) (not e!846904))))

(assert (=> b!1518071 (= res!1037972 (= lt!658026 lt!658023))))

(assert (=> b!1518071 (= lt!658023 (Intermediate!12972 false resIndex!21 resX!21))))

(assert (=> b!1518071 (= lt!658026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48801 a!2804) j!70) mask!2512) (select (arr!48801 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129272 res!1037962) b!1518061))

(assert (= (and b!1518061 res!1037966) b!1518066))

(assert (= (and b!1518066 res!1037971) b!1518068))

(assert (= (and b!1518068 res!1037963) b!1518059))

(assert (= (and b!1518059 res!1037968) b!1518062))

(assert (= (and b!1518062 res!1037967) b!1518064))

(assert (= (and b!1518064 res!1037974) b!1518071))

(assert (= (and b!1518071 res!1037972) b!1518067))

(assert (= (and b!1518067 res!1037970) b!1518060))

(assert (= (and b!1518060 res!1037969) b!1518069))

(assert (= (and b!1518069 res!1037973) b!1518070))

(assert (= (and b!1518069 (not res!1037964)) b!1518065))

(assert (= (and b!1518065 (not res!1037965)) b!1518063))

(declare-fun m!1401365 () Bool)

(assert (=> start!129272 m!1401365))

(declare-fun m!1401367 () Bool)

(assert (=> start!129272 m!1401367))

(declare-fun m!1401369 () Bool)

(assert (=> b!1518070 m!1401369))

(assert (=> b!1518070 m!1401369))

(declare-fun m!1401371 () Bool)

(assert (=> b!1518070 m!1401371))

(assert (=> b!1518067 m!1401369))

(assert (=> b!1518067 m!1401369))

(declare-fun m!1401373 () Bool)

(assert (=> b!1518067 m!1401373))

(declare-fun m!1401375 () Bool)

(assert (=> b!1518066 m!1401375))

(assert (=> b!1518066 m!1401375))

(declare-fun m!1401377 () Bool)

(assert (=> b!1518066 m!1401377))

(declare-fun m!1401379 () Bool)

(assert (=> b!1518065 m!1401379))

(assert (=> b!1518069 m!1401369))

(declare-fun m!1401381 () Bool)

(assert (=> b!1518069 m!1401381))

(declare-fun m!1401383 () Bool)

(assert (=> b!1518069 m!1401383))

(declare-fun m!1401385 () Bool)

(assert (=> b!1518069 m!1401385))

(declare-fun m!1401387 () Bool)

(assert (=> b!1518069 m!1401387))

(assert (=> b!1518063 m!1401369))

(assert (=> b!1518063 m!1401369))

(declare-fun m!1401389 () Bool)

(assert (=> b!1518063 m!1401389))

(declare-fun m!1401391 () Bool)

(assert (=> b!1518059 m!1401391))

(assert (=> b!1518071 m!1401369))

(assert (=> b!1518071 m!1401369))

(declare-fun m!1401393 () Bool)

(assert (=> b!1518071 m!1401393))

(assert (=> b!1518071 m!1401393))

(assert (=> b!1518071 m!1401369))

(declare-fun m!1401395 () Bool)

(assert (=> b!1518071 m!1401395))

(declare-fun m!1401397 () Bool)

(assert (=> b!1518062 m!1401397))

(assert (=> b!1518068 m!1401369))

(assert (=> b!1518068 m!1401369))

(declare-fun m!1401399 () Bool)

(assert (=> b!1518068 m!1401399))

(assert (=> b!1518060 m!1401383))

(assert (=> b!1518060 m!1401385))

(assert (=> b!1518060 m!1401385))

(declare-fun m!1401401 () Bool)

(assert (=> b!1518060 m!1401401))

(assert (=> b!1518060 m!1401401))

(assert (=> b!1518060 m!1401385))

(declare-fun m!1401403 () Bool)

(assert (=> b!1518060 m!1401403))

(check-sat (not b!1518062) (not b!1518071) (not b!1518066) (not b!1518063) (not b!1518070) (not start!129272) (not b!1518065) (not b!1518068) (not b!1518059) (not b!1518069) (not b!1518060) (not b!1518067))
(check-sat)
