; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130440 () Bool)

(assert start!130440)

(declare-fun b!1528396 () Bool)

(declare-fun res!1044948 () Bool)

(declare-fun e!852083 () Bool)

(assert (=> b!1528396 (=> (not res!1044948) (not e!852083))))

(declare-datatypes ((SeekEntryResult!13073 0))(
  ( (MissingZero!13073 (index!54687 (_ BitVec 32))) (Found!13073 (index!54688 (_ BitVec 32))) (Intermediate!13073 (undefined!13885 Bool) (index!54689 (_ BitVec 32)) (x!136598 (_ BitVec 32))) (Undefined!13073) (MissingVacant!13073 (index!54690 (_ BitVec 32))) )
))
(declare-fun lt!661831 () SeekEntryResult!13073)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101590 0))(
  ( (array!101591 (arr!49015 (Array (_ BitVec 32) (_ BitVec 64))) (size!49566 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101590)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13073)

(assert (=> b!1528396 (= res!1044948 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) lt!661831))))

(declare-fun b!1528397 () Bool)

(declare-fun res!1044944 () Bool)

(declare-fun e!852084 () Bool)

(assert (=> b!1528397 (=> (not res!1044944) (not e!852084))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528397 (= res!1044944 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49566 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49566 a!2804))))))

(declare-fun b!1528398 () Bool)

(declare-fun e!852086 () Bool)

(declare-fun e!852082 () Bool)

(assert (=> b!1528398 (= e!852086 e!852082)))

(declare-fun res!1044949 () Bool)

(assert (=> b!1528398 (=> (not res!1044949) (not e!852082))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13073)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13073)

(assert (=> b!1528398 (= res!1044949 (= (seekEntryOrOpen!0 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49015 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1528400 () Bool)

(declare-fun e!852087 () Bool)

(assert (=> b!1528400 (= e!852087 e!852086)))

(declare-fun res!1044954 () Bool)

(assert (=> b!1528400 (=> res!1044954 e!852086)))

(declare-fun lt!661830 () (_ BitVec 64))

(assert (=> b!1528400 (= res!1044954 (or (not (= (select (arr!49015 a!2804) j!70) lt!661830)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49015 a!2804) index!487) (select (arr!49015 a!2804) j!70)) (not (= (select (arr!49015 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528401 () Bool)

(declare-fun res!1044957 () Bool)

(assert (=> b!1528401 (=> (not res!1044957) (not e!852084))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528401 (= res!1044957 (validKeyInArray!0 (select (arr!49015 a!2804) i!961)))))

(declare-fun b!1528402 () Bool)

(declare-fun e!852085 () Bool)

(assert (=> b!1528402 (= e!852085 (not true))))

(assert (=> b!1528402 e!852087))

(declare-fun res!1044951 () Bool)

(assert (=> b!1528402 (=> (not res!1044951) (not e!852087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101590 (_ BitVec 32)) Bool)

(assert (=> b!1528402 (= res!1044951 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50965 0))(
  ( (Unit!50966) )
))
(declare-fun lt!661833 () Unit!50965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50965)

(assert (=> b!1528402 (= lt!661833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528403 () Bool)

(declare-fun res!1044947 () Bool)

(assert (=> b!1528403 (=> (not res!1044947) (not e!852084))))

(assert (=> b!1528403 (= res!1044947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528404 () Bool)

(assert (=> b!1528404 (= e!852083 e!852085)))

(declare-fun res!1044955 () Bool)

(assert (=> b!1528404 (=> (not res!1044955) (not e!852085))))

(declare-fun lt!661829 () SeekEntryResult!13073)

(declare-fun lt!661832 () array!101590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528404 (= res!1044955 (= lt!661829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661830 mask!2512) lt!661830 lt!661832 mask!2512)))))

(assert (=> b!1528404 (= lt!661830 (select (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528404 (= lt!661832 (array!101591 (store (arr!49015 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49566 a!2804)))))

(declare-fun b!1528405 () Bool)

(assert (=> b!1528405 (= e!852084 e!852083)))

(declare-fun res!1044950 () Bool)

(assert (=> b!1528405 (=> (not res!1044950) (not e!852083))))

(assert (=> b!1528405 (= res!1044950 (= lt!661829 lt!661831))))

(assert (=> b!1528405 (= lt!661831 (Intermediate!13073 false resIndex!21 resX!21))))

(assert (=> b!1528405 (= lt!661829 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49015 a!2804) j!70) mask!2512) (select (arr!49015 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528406 () Bool)

(declare-fun res!1044945 () Bool)

(assert (=> b!1528406 (=> (not res!1044945) (not e!852084))))

(assert (=> b!1528406 (= res!1044945 (and (= (size!49566 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49566 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49566 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528407 () Bool)

(assert (=> b!1528407 (= e!852082 (= (seekEntryOrOpen!0 lt!661830 lt!661832 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661830 lt!661832 mask!2512)))))

(declare-fun res!1044956 () Bool)

(assert (=> start!130440 (=> (not res!1044956) (not e!852084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130440 (= res!1044956 (validMask!0 mask!2512))))

(assert (=> start!130440 e!852084))

(assert (=> start!130440 true))

(declare-fun array_inv!38296 (array!101590) Bool)

(assert (=> start!130440 (array_inv!38296 a!2804)))

(declare-fun b!1528399 () Bool)

(declare-fun res!1044953 () Bool)

(assert (=> b!1528399 (=> (not res!1044953) (not e!852084))))

(declare-datatypes ((List!35485 0))(
  ( (Nil!35482) (Cons!35481 (h!36932 (_ BitVec 64)) (t!50171 List!35485)) )
))
(declare-fun arrayNoDuplicates!0 (array!101590 (_ BitVec 32) List!35485) Bool)

(assert (=> b!1528399 (= res!1044953 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35482))))

(declare-fun b!1528408 () Bool)

(declare-fun res!1044946 () Bool)

(assert (=> b!1528408 (=> (not res!1044946) (not e!852084))))

(assert (=> b!1528408 (= res!1044946 (validKeyInArray!0 (select (arr!49015 a!2804) j!70)))))

(declare-fun b!1528409 () Bool)

(declare-fun res!1044952 () Bool)

(assert (=> b!1528409 (=> (not res!1044952) (not e!852087))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13073)

(assert (=> b!1528409 (= res!1044952 (= (seekEntry!0 (select (arr!49015 a!2804) j!70) a!2804 mask!2512) (Found!13073 j!70)))))

(assert (= (and start!130440 res!1044956) b!1528406))

(assert (= (and b!1528406 res!1044945) b!1528401))

(assert (= (and b!1528401 res!1044957) b!1528408))

(assert (= (and b!1528408 res!1044946) b!1528403))

(assert (= (and b!1528403 res!1044947) b!1528399))

(assert (= (and b!1528399 res!1044953) b!1528397))

(assert (= (and b!1528397 res!1044944) b!1528405))

(assert (= (and b!1528405 res!1044950) b!1528396))

(assert (= (and b!1528396 res!1044948) b!1528404))

(assert (= (and b!1528404 res!1044955) b!1528402))

(assert (= (and b!1528402 res!1044951) b!1528409))

(assert (= (and b!1528409 res!1044952) b!1528400))

(assert (= (and b!1528400 (not res!1044954)) b!1528398))

(assert (= (and b!1528398 res!1044949) b!1528407))

(declare-fun m!1411015 () Bool)

(assert (=> b!1528408 m!1411015))

(assert (=> b!1528408 m!1411015))

(declare-fun m!1411017 () Bool)

(assert (=> b!1528408 m!1411017))

(declare-fun m!1411019 () Bool)

(assert (=> b!1528402 m!1411019))

(declare-fun m!1411021 () Bool)

(assert (=> b!1528402 m!1411021))

(declare-fun m!1411023 () Bool)

(assert (=> b!1528399 m!1411023))

(assert (=> b!1528398 m!1411015))

(assert (=> b!1528398 m!1411015))

(declare-fun m!1411025 () Bool)

(assert (=> b!1528398 m!1411025))

(assert (=> b!1528398 m!1411015))

(declare-fun m!1411027 () Bool)

(assert (=> b!1528398 m!1411027))

(declare-fun m!1411029 () Bool)

(assert (=> start!130440 m!1411029))

(declare-fun m!1411031 () Bool)

(assert (=> start!130440 m!1411031))

(declare-fun m!1411033 () Bool)

(assert (=> b!1528407 m!1411033))

(declare-fun m!1411035 () Bool)

(assert (=> b!1528407 m!1411035))

(assert (=> b!1528409 m!1411015))

(assert (=> b!1528409 m!1411015))

(declare-fun m!1411037 () Bool)

(assert (=> b!1528409 m!1411037))

(declare-fun m!1411039 () Bool)

(assert (=> b!1528403 m!1411039))

(assert (=> b!1528396 m!1411015))

(assert (=> b!1528396 m!1411015))

(declare-fun m!1411041 () Bool)

(assert (=> b!1528396 m!1411041))

(assert (=> b!1528405 m!1411015))

(assert (=> b!1528405 m!1411015))

(declare-fun m!1411043 () Bool)

(assert (=> b!1528405 m!1411043))

(assert (=> b!1528405 m!1411043))

(assert (=> b!1528405 m!1411015))

(declare-fun m!1411045 () Bool)

(assert (=> b!1528405 m!1411045))

(assert (=> b!1528400 m!1411015))

(declare-fun m!1411047 () Bool)

(assert (=> b!1528400 m!1411047))

(declare-fun m!1411049 () Bool)

(assert (=> b!1528404 m!1411049))

(assert (=> b!1528404 m!1411049))

(declare-fun m!1411051 () Bool)

(assert (=> b!1528404 m!1411051))

(declare-fun m!1411053 () Bool)

(assert (=> b!1528404 m!1411053))

(declare-fun m!1411055 () Bool)

(assert (=> b!1528404 m!1411055))

(declare-fun m!1411057 () Bool)

(assert (=> b!1528401 m!1411057))

(assert (=> b!1528401 m!1411057))

(declare-fun m!1411059 () Bool)

(assert (=> b!1528401 m!1411059))

(check-sat (not b!1528407) (not b!1528396) (not start!130440) (not b!1528408) (not b!1528402) (not b!1528405) (not b!1528404) (not b!1528398) (not b!1528409) (not b!1528399) (not b!1528401) (not b!1528403))
(check-sat)
