; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130056 () Bool)

(assert start!130056)

(declare-fun b!1526799 () Bool)

(declare-fun res!1045027 () Bool)

(declare-fun e!850971 () Bool)

(assert (=> b!1526799 (=> (not res!1045027) (not e!850971))))

(declare-datatypes ((array!101467 0))(
  ( (array!101468 (arr!48961 (Array (_ BitVec 32) (_ BitVec 64))) (size!49513 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101467)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101467 (_ BitVec 32)) Bool)

(assert (=> b!1526799 (= res!1045027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1045020 () Bool)

(assert (=> start!130056 (=> (not res!1045020) (not e!850971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130056 (= res!1045020 (validMask!0 mask!2512))))

(assert (=> start!130056 e!850971))

(assert (=> start!130056 true))

(declare-fun array_inv!38194 (array!101467) Bool)

(assert (=> start!130056 (array_inv!38194 a!2804)))

(declare-fun b!1526800 () Bool)

(declare-fun res!1045024 () Bool)

(assert (=> b!1526800 (=> (not res!1045024) (not e!850971))))

(declare-datatypes ((List!35522 0))(
  ( (Nil!35519) (Cons!35518 (h!36952 (_ BitVec 64)) (t!50208 List!35522)) )
))
(declare-fun arrayNoDuplicates!0 (array!101467 (_ BitVec 32) List!35522) Bool)

(assert (=> b!1526800 (= res!1045024 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35519))))

(declare-fun e!850974 () Bool)

(declare-fun b!1526801 () Bool)

(declare-fun lt!661029 () array!101467)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!661032 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13149 0))(
  ( (MissingZero!13149 (index!54991 (_ BitVec 32))) (Found!13149 (index!54992 (_ BitVec 32))) (Intermediate!13149 (undefined!13961 Bool) (index!54993 (_ BitVec 32)) (x!136686 (_ BitVec 32))) (Undefined!13149) (MissingVacant!13149 (index!54994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13149)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13149)

(assert (=> b!1526801 (= e!850974 (= (seekEntryOrOpen!0 lt!661032 lt!661029 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661032 lt!661029 mask!2512)))))

(declare-fun b!1526802 () Bool)

(declare-fun res!1045029 () Bool)

(assert (=> b!1526802 (=> (not res!1045029) (not e!850971))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526802 (= res!1045029 (validKeyInArray!0 (select (arr!48961 a!2804) j!70)))))

(declare-fun b!1526803 () Bool)

(declare-fun e!850975 () Bool)

(assert (=> b!1526803 (= e!850971 e!850975)))

(declare-fun res!1045028 () Bool)

(assert (=> b!1526803 (=> (not res!1045028) (not e!850975))))

(declare-fun lt!661030 () SeekEntryResult!13149)

(declare-fun lt!661028 () SeekEntryResult!13149)

(assert (=> b!1526803 (= res!1045028 (= lt!661030 lt!661028))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526803 (= lt!661028 (Intermediate!13149 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13149)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526803 (= lt!661030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48961 a!2804) j!70) mask!2512) (select (arr!48961 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526804 () Bool)

(declare-fun e!850972 () Bool)

(assert (=> b!1526804 (= e!850972 (not true))))

(declare-fun e!850969 () Bool)

(assert (=> b!1526804 e!850969))

(declare-fun res!1045030 () Bool)

(assert (=> b!1526804 (=> (not res!1045030) (not e!850969))))

(assert (=> b!1526804 (= res!1045030 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50921 0))(
  ( (Unit!50922) )
))
(declare-fun lt!661031 () Unit!50921)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50921)

(assert (=> b!1526804 (= lt!661031 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526805 () Bool)

(declare-fun res!1045019 () Bool)

(assert (=> b!1526805 (=> (not res!1045019) (not e!850971))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526805 (= res!1045019 (validKeyInArray!0 (select (arr!48961 a!2804) i!961)))))

(declare-fun b!1526806 () Bool)

(declare-fun res!1045021 () Bool)

(assert (=> b!1526806 (=> (not res!1045021) (not e!850975))))

(assert (=> b!1526806 (= res!1045021 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) lt!661028))))

(declare-fun b!1526807 () Bool)

(declare-fun res!1045023 () Bool)

(assert (=> b!1526807 (=> (not res!1045023) (not e!850971))))

(assert (=> b!1526807 (= res!1045023 (and (= (size!49513 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49513 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49513 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526808 () Bool)

(assert (=> b!1526808 (= e!850975 e!850972)))

(declare-fun res!1045025 () Bool)

(assert (=> b!1526808 (=> (not res!1045025) (not e!850972))))

(assert (=> b!1526808 (= res!1045025 (= lt!661030 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661032 mask!2512) lt!661032 lt!661029 mask!2512)))))

(assert (=> b!1526808 (= lt!661032 (select (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526808 (= lt!661029 (array!101468 (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49513 a!2804)))))

(declare-fun b!1526809 () Bool)

(declare-fun res!1045018 () Bool)

(assert (=> b!1526809 (=> (not res!1045018) (not e!850971))))

(assert (=> b!1526809 (= res!1045018 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49513 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49513 a!2804))))))

(declare-fun b!1526810 () Bool)

(declare-fun e!850970 () Bool)

(assert (=> b!1526810 (= e!850969 e!850970)))

(declare-fun res!1045022 () Bool)

(assert (=> b!1526810 (=> res!1045022 e!850970)))

(assert (=> b!1526810 (= res!1045022 (or (not (= (select (arr!48961 a!2804) j!70) lt!661032)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48961 a!2804) index!487) (select (arr!48961 a!2804) j!70)) (not (= (select (arr!48961 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526811 () Bool)

(assert (=> b!1526811 (= e!850970 e!850974)))

(declare-fun res!1045026 () Bool)

(assert (=> b!1526811 (=> (not res!1045026) (not e!850974))))

(assert (=> b!1526811 (= res!1045026 (= (seekEntryOrOpen!0 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48961 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526812 () Bool)

(declare-fun res!1045017 () Bool)

(assert (=> b!1526812 (=> (not res!1045017) (not e!850969))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101467 (_ BitVec 32)) SeekEntryResult!13149)

(assert (=> b!1526812 (= res!1045017 (= (seekEntry!0 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) (Found!13149 j!70)))))

(assert (= (and start!130056 res!1045020) b!1526807))

(assert (= (and b!1526807 res!1045023) b!1526805))

(assert (= (and b!1526805 res!1045019) b!1526802))

(assert (= (and b!1526802 res!1045029) b!1526799))

(assert (= (and b!1526799 res!1045027) b!1526800))

(assert (= (and b!1526800 res!1045024) b!1526809))

(assert (= (and b!1526809 res!1045018) b!1526803))

(assert (= (and b!1526803 res!1045028) b!1526806))

(assert (= (and b!1526806 res!1045021) b!1526808))

(assert (= (and b!1526808 res!1045025) b!1526804))

(assert (= (and b!1526804 res!1045030) b!1526812))

(assert (= (and b!1526812 res!1045017) b!1526810))

(assert (= (and b!1526810 (not res!1045022)) b!1526811))

(assert (= (and b!1526811 res!1045026) b!1526801))

(declare-fun m!1409087 () Bool)

(assert (=> b!1526805 m!1409087))

(assert (=> b!1526805 m!1409087))

(declare-fun m!1409089 () Bool)

(assert (=> b!1526805 m!1409089))

(declare-fun m!1409091 () Bool)

(assert (=> b!1526806 m!1409091))

(assert (=> b!1526806 m!1409091))

(declare-fun m!1409093 () Bool)

(assert (=> b!1526806 m!1409093))

(assert (=> b!1526802 m!1409091))

(assert (=> b!1526802 m!1409091))

(declare-fun m!1409095 () Bool)

(assert (=> b!1526802 m!1409095))

(declare-fun m!1409097 () Bool)

(assert (=> b!1526808 m!1409097))

(assert (=> b!1526808 m!1409097))

(declare-fun m!1409099 () Bool)

(assert (=> b!1526808 m!1409099))

(declare-fun m!1409101 () Bool)

(assert (=> b!1526808 m!1409101))

(declare-fun m!1409103 () Bool)

(assert (=> b!1526808 m!1409103))

(declare-fun m!1409105 () Bool)

(assert (=> b!1526801 m!1409105))

(declare-fun m!1409107 () Bool)

(assert (=> b!1526801 m!1409107))

(assert (=> b!1526812 m!1409091))

(assert (=> b!1526812 m!1409091))

(declare-fun m!1409109 () Bool)

(assert (=> b!1526812 m!1409109))

(declare-fun m!1409111 () Bool)

(assert (=> b!1526800 m!1409111))

(declare-fun m!1409113 () Bool)

(assert (=> b!1526799 m!1409113))

(declare-fun m!1409115 () Bool)

(assert (=> start!130056 m!1409115))

(declare-fun m!1409117 () Bool)

(assert (=> start!130056 m!1409117))

(assert (=> b!1526811 m!1409091))

(assert (=> b!1526811 m!1409091))

(declare-fun m!1409119 () Bool)

(assert (=> b!1526811 m!1409119))

(assert (=> b!1526811 m!1409091))

(declare-fun m!1409121 () Bool)

(assert (=> b!1526811 m!1409121))

(declare-fun m!1409123 () Bool)

(assert (=> b!1526804 m!1409123))

(declare-fun m!1409125 () Bool)

(assert (=> b!1526804 m!1409125))

(assert (=> b!1526810 m!1409091))

(declare-fun m!1409127 () Bool)

(assert (=> b!1526810 m!1409127))

(assert (=> b!1526803 m!1409091))

(assert (=> b!1526803 m!1409091))

(declare-fun m!1409129 () Bool)

(assert (=> b!1526803 m!1409129))

(assert (=> b!1526803 m!1409129))

(assert (=> b!1526803 m!1409091))

(declare-fun m!1409131 () Bool)

(assert (=> b!1526803 m!1409131))

(check-sat (not b!1526811) (not b!1526800) (not b!1526802) (not b!1526803) (not b!1526804) (not b!1526799) (not b!1526806) (not b!1526808) (not b!1526805) (not b!1526801) (not b!1526812) (not start!130056))
(check-sat)
