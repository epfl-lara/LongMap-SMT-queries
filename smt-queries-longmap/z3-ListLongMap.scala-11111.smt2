; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129720 () Bool)

(assert start!129720)

(declare-fun b!1522869 () Bool)

(declare-fun res!1041966 () Bool)

(declare-fun e!849046 () Bool)

(assert (=> b!1522869 (=> (not res!1041966) (not e!849046))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101314 0))(
  ( (array!101315 (arr!48889 (Array (_ BitVec 32) (_ BitVec 64))) (size!49441 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101314)

(assert (=> b!1522869 (= res!1041966 (and (= (size!49441 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49441 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49441 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522870 () Bool)

(declare-fun res!1041961 () Bool)

(assert (=> b!1522870 (=> (not res!1041961) (not e!849046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522870 (= res!1041961 (validKeyInArray!0 (select (arr!48889 a!2804) i!961)))))

(declare-fun b!1522871 () Bool)

(declare-fun res!1041965 () Bool)

(assert (=> b!1522871 (=> (not res!1041965) (not e!849046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101314 (_ BitVec 32)) Bool)

(assert (=> b!1522871 (= res!1041965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!849048 () Bool)

(declare-fun b!1522872 () Bool)

(declare-datatypes ((SeekEntryResult!13077 0))(
  ( (MissingZero!13077 (index!54703 (_ BitVec 32))) (Found!13077 (index!54704 (_ BitVec 32))) (Intermediate!13077 (undefined!13889 Bool) (index!54705 (_ BitVec 32)) (x!136398 (_ BitVec 32))) (Undefined!13077) (MissingVacant!13077 (index!54706 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101314 (_ BitVec 32)) SeekEntryResult!13077)

(assert (=> b!1522872 (= e!849048 (= (seekEntry!0 (select (arr!48889 a!2804) j!70) a!2804 mask!2512) (Found!13077 j!70)))))

(declare-fun b!1522873 () Bool)

(declare-fun res!1041970 () Bool)

(assert (=> b!1522873 (=> (not res!1041970) (not e!849046))))

(declare-datatypes ((List!35450 0))(
  ( (Nil!35447) (Cons!35446 (h!36871 (_ BitVec 64)) (t!50136 List!35450)) )
))
(declare-fun arrayNoDuplicates!0 (array!101314 (_ BitVec 32) List!35450) Bool)

(assert (=> b!1522873 (= res!1041970 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35447))))

(declare-fun b!1522874 () Bool)

(declare-fun e!849047 () Bool)

(assert (=> b!1522874 (= e!849046 e!849047)))

(declare-fun res!1041960 () Bool)

(assert (=> b!1522874 (=> (not res!1041960) (not e!849047))))

(declare-fun lt!659598 () SeekEntryResult!13077)

(declare-fun lt!659597 () SeekEntryResult!13077)

(assert (=> b!1522874 (= res!1041960 (= lt!659598 lt!659597))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522874 (= lt!659597 (Intermediate!13077 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101314 (_ BitVec 32)) SeekEntryResult!13077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522874 (= lt!659598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48889 a!2804) j!70) mask!2512) (select (arr!48889 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1041963 () Bool)

(assert (=> start!129720 (=> (not res!1041963) (not e!849046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129720 (= res!1041963 (validMask!0 mask!2512))))

(assert (=> start!129720 e!849046))

(assert (=> start!129720 true))

(declare-fun array_inv!38122 (array!101314) Bool)

(assert (=> start!129720 (array_inv!38122 a!2804)))

(declare-fun b!1522875 () Bool)

(declare-fun res!1041968 () Bool)

(assert (=> b!1522875 (=> (not res!1041968) (not e!849047))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522875 (= res!1041968 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48889 a!2804) j!70) a!2804 mask!2512) lt!659597))))

(declare-fun b!1522876 () Bool)

(assert (=> b!1522876 (= e!849047 (not true))))

(assert (=> b!1522876 e!849048))

(declare-fun res!1041964 () Bool)

(assert (=> b!1522876 (=> (not res!1041964) (not e!849048))))

(assert (=> b!1522876 (= res!1041964 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50777 0))(
  ( (Unit!50778) )
))
(declare-fun lt!659596 () Unit!50777)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101314 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50777)

(assert (=> b!1522876 (= lt!659596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522877 () Bool)

(declare-fun res!1041967 () Bool)

(assert (=> b!1522877 (=> (not res!1041967) (not e!849046))))

(assert (=> b!1522877 (= res!1041967 (validKeyInArray!0 (select (arr!48889 a!2804) j!70)))))

(declare-fun b!1522878 () Bool)

(declare-fun res!1041969 () Bool)

(assert (=> b!1522878 (=> (not res!1041969) (not e!849046))))

(assert (=> b!1522878 (= res!1041969 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49441 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49441 a!2804))))))

(declare-fun b!1522879 () Bool)

(declare-fun res!1041962 () Bool)

(assert (=> b!1522879 (=> (not res!1041962) (not e!849047))))

(assert (=> b!1522879 (= res!1041962 (= lt!659598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101315 (store (arr!48889 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49441 a!2804)) mask!2512)))))

(assert (= (and start!129720 res!1041963) b!1522869))

(assert (= (and b!1522869 res!1041966) b!1522870))

(assert (= (and b!1522870 res!1041961) b!1522877))

(assert (= (and b!1522877 res!1041967) b!1522871))

(assert (= (and b!1522871 res!1041965) b!1522873))

(assert (= (and b!1522873 res!1041970) b!1522878))

(assert (= (and b!1522878 res!1041969) b!1522874))

(assert (= (and b!1522874 res!1041960) b!1522875))

(assert (= (and b!1522875 res!1041968) b!1522879))

(assert (= (and b!1522879 res!1041962) b!1522876))

(assert (= (and b!1522876 res!1041964) b!1522872))

(declare-fun m!1405385 () Bool)

(assert (=> start!129720 m!1405385))

(declare-fun m!1405387 () Bool)

(assert (=> start!129720 m!1405387))

(declare-fun m!1405389 () Bool)

(assert (=> b!1522877 m!1405389))

(assert (=> b!1522877 m!1405389))

(declare-fun m!1405391 () Bool)

(assert (=> b!1522877 m!1405391))

(declare-fun m!1405393 () Bool)

(assert (=> b!1522873 m!1405393))

(assert (=> b!1522872 m!1405389))

(assert (=> b!1522872 m!1405389))

(declare-fun m!1405395 () Bool)

(assert (=> b!1522872 m!1405395))

(assert (=> b!1522875 m!1405389))

(assert (=> b!1522875 m!1405389))

(declare-fun m!1405397 () Bool)

(assert (=> b!1522875 m!1405397))

(declare-fun m!1405399 () Bool)

(assert (=> b!1522876 m!1405399))

(declare-fun m!1405401 () Bool)

(assert (=> b!1522876 m!1405401))

(assert (=> b!1522874 m!1405389))

(assert (=> b!1522874 m!1405389))

(declare-fun m!1405403 () Bool)

(assert (=> b!1522874 m!1405403))

(assert (=> b!1522874 m!1405403))

(assert (=> b!1522874 m!1405389))

(declare-fun m!1405405 () Bool)

(assert (=> b!1522874 m!1405405))

(declare-fun m!1405407 () Bool)

(assert (=> b!1522871 m!1405407))

(declare-fun m!1405409 () Bool)

(assert (=> b!1522870 m!1405409))

(assert (=> b!1522870 m!1405409))

(declare-fun m!1405411 () Bool)

(assert (=> b!1522870 m!1405411))

(declare-fun m!1405413 () Bool)

(assert (=> b!1522879 m!1405413))

(declare-fun m!1405415 () Bool)

(assert (=> b!1522879 m!1405415))

(assert (=> b!1522879 m!1405415))

(declare-fun m!1405417 () Bool)

(assert (=> b!1522879 m!1405417))

(assert (=> b!1522879 m!1405417))

(assert (=> b!1522879 m!1405415))

(declare-fun m!1405419 () Bool)

(assert (=> b!1522879 m!1405419))

(check-sat (not start!129720) (not b!1522875) (not b!1522870) (not b!1522872) (not b!1522879) (not b!1522873) (not b!1522871) (not b!1522874) (not b!1522876) (not b!1522877))
(check-sat)
