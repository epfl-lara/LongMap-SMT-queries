; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129960 () Bool)

(assert start!129960)

(declare-fun b!1525016 () Bool)

(declare-fun res!1043382 () Bool)

(declare-fun e!850103 () Bool)

(assert (=> b!1525016 (=> (not res!1043382) (not e!850103))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101436 0))(
  ( (array!101437 (arr!48946 (Array (_ BitVec 32) (_ BitVec 64))) (size!49496 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101436)

(assert (=> b!1525016 (= res!1043382 (and (= (size!49496 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49496 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49496 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525017 () Bool)

(declare-fun res!1043379 () Bool)

(declare-fun e!850101 () Bool)

(assert (=> b!1525017 (=> (not res!1043379) (not e!850101))))

(declare-datatypes ((SeekEntryResult!13111 0))(
  ( (MissingZero!13111 (index!54839 (_ BitVec 32))) (Found!13111 (index!54840 (_ BitVec 32))) (Intermediate!13111 (undefined!13923 Bool) (index!54841 (_ BitVec 32)) (x!136532 (_ BitVec 32))) (Undefined!13111) (MissingVacant!13111 (index!54842 (_ BitVec 32))) )
))
(declare-fun lt!660541 () SeekEntryResult!13111)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101436 (_ BitVec 32)) SeekEntryResult!13111)

(assert (=> b!1525017 (= res!1043379 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) lt!660541))))

(declare-fun b!1525018 () Bool)

(declare-fun res!1043380 () Bool)

(assert (=> b!1525018 (=> (not res!1043380) (not e!850103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525018 (= res!1043380 (validKeyInArray!0 (select (arr!48946 a!2804) i!961)))))

(declare-fun res!1043384 () Bool)

(assert (=> start!129960 (=> (not res!1043384) (not e!850103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129960 (= res!1043384 (validMask!0 mask!2512))))

(assert (=> start!129960 e!850103))

(assert (=> start!129960 true))

(declare-fun array_inv!37974 (array!101436) Bool)

(assert (=> start!129960 (array_inv!37974 a!2804)))

(declare-fun b!1525019 () Bool)

(assert (=> b!1525019 (= e!850101 (not true))))

(declare-fun e!850105 () Bool)

(assert (=> b!1525019 e!850105))

(declare-fun res!1043388 () Bool)

(assert (=> b!1525019 (=> (not res!1043388) (not e!850105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101436 (_ BitVec 32)) Bool)

(assert (=> b!1525019 (= res!1043388 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51006 0))(
  ( (Unit!51007) )
))
(declare-fun lt!660540 () Unit!51006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51006)

(assert (=> b!1525019 (= lt!660540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525020 () Bool)

(declare-fun res!1043387 () Bool)

(assert (=> b!1525020 (=> (not res!1043387) (not e!850103))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525020 (= res!1043387 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49496 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49496 a!2804))))))

(declare-fun e!850102 () Bool)

(declare-fun b!1525021 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101436 (_ BitVec 32)) SeekEntryResult!13111)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101436 (_ BitVec 32)) SeekEntryResult!13111)

(assert (=> b!1525021 (= e!850102 (= (seekEntryOrOpen!0 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48946 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525022 () Bool)

(declare-fun res!1043389 () Bool)

(assert (=> b!1525022 (=> (not res!1043389) (not e!850101))))

(declare-fun lt!660539 () SeekEntryResult!13111)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525022 (= res!1043389 (= lt!660539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101437 (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49496 a!2804)) mask!2512)))))

(declare-fun b!1525023 () Bool)

(declare-fun res!1043386 () Bool)

(assert (=> b!1525023 (=> (not res!1043386) (not e!850103))))

(declare-datatypes ((List!35429 0))(
  ( (Nil!35426) (Cons!35425 (h!36855 (_ BitVec 64)) (t!50123 List!35429)) )
))
(declare-fun arrayNoDuplicates!0 (array!101436 (_ BitVec 32) List!35429) Bool)

(assert (=> b!1525023 (= res!1043386 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35426))))

(declare-fun b!1525024 () Bool)

(declare-fun res!1043378 () Bool)

(assert (=> b!1525024 (=> (not res!1043378) (not e!850103))))

(assert (=> b!1525024 (= res!1043378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525025 () Bool)

(assert (=> b!1525025 (= e!850103 e!850101)))

(declare-fun res!1043383 () Bool)

(assert (=> b!1525025 (=> (not res!1043383) (not e!850101))))

(assert (=> b!1525025 (= res!1043383 (= lt!660539 lt!660541))))

(assert (=> b!1525025 (= lt!660541 (Intermediate!13111 false resIndex!21 resX!21))))

(assert (=> b!1525025 (= lt!660539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48946 a!2804) j!70) mask!2512) (select (arr!48946 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525026 () Bool)

(assert (=> b!1525026 (= e!850105 e!850102)))

(declare-fun res!1043377 () Bool)

(assert (=> b!1525026 (=> res!1043377 e!850102)))

(assert (=> b!1525026 (= res!1043377 (or (not (= (select (arr!48946 a!2804) j!70) (select (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48946 a!2804) index!487) (select (arr!48946 a!2804) j!70)) (not (= (select (arr!48946 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525027 () Bool)

(declare-fun res!1043385 () Bool)

(assert (=> b!1525027 (=> (not res!1043385) (not e!850105))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101436 (_ BitVec 32)) SeekEntryResult!13111)

(assert (=> b!1525027 (= res!1043385 (= (seekEntry!0 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) (Found!13111 j!70)))))

(declare-fun b!1525028 () Bool)

(declare-fun res!1043381 () Bool)

(assert (=> b!1525028 (=> (not res!1043381) (not e!850103))))

(assert (=> b!1525028 (= res!1043381 (validKeyInArray!0 (select (arr!48946 a!2804) j!70)))))

(assert (= (and start!129960 res!1043384) b!1525016))

(assert (= (and b!1525016 res!1043382) b!1525018))

(assert (= (and b!1525018 res!1043380) b!1525028))

(assert (= (and b!1525028 res!1043381) b!1525024))

(assert (= (and b!1525024 res!1043378) b!1525023))

(assert (= (and b!1525023 res!1043386) b!1525020))

(assert (= (and b!1525020 res!1043387) b!1525025))

(assert (= (and b!1525025 res!1043383) b!1525017))

(assert (= (and b!1525017 res!1043379) b!1525022))

(assert (= (and b!1525022 res!1043389) b!1525019))

(assert (= (and b!1525019 res!1043388) b!1525027))

(assert (= (and b!1525027 res!1043385) b!1525026))

(assert (= (and b!1525026 (not res!1043377)) b!1525021))

(declare-fun m!1407897 () Bool)

(assert (=> b!1525021 m!1407897))

(assert (=> b!1525021 m!1407897))

(declare-fun m!1407899 () Bool)

(assert (=> b!1525021 m!1407899))

(assert (=> b!1525021 m!1407897))

(declare-fun m!1407901 () Bool)

(assert (=> b!1525021 m!1407901))

(assert (=> b!1525028 m!1407897))

(assert (=> b!1525028 m!1407897))

(declare-fun m!1407903 () Bool)

(assert (=> b!1525028 m!1407903))

(declare-fun m!1407905 () Bool)

(assert (=> b!1525022 m!1407905))

(declare-fun m!1407907 () Bool)

(assert (=> b!1525022 m!1407907))

(assert (=> b!1525022 m!1407907))

(declare-fun m!1407909 () Bool)

(assert (=> b!1525022 m!1407909))

(assert (=> b!1525022 m!1407909))

(assert (=> b!1525022 m!1407907))

(declare-fun m!1407911 () Bool)

(assert (=> b!1525022 m!1407911))

(assert (=> b!1525027 m!1407897))

(assert (=> b!1525027 m!1407897))

(declare-fun m!1407913 () Bool)

(assert (=> b!1525027 m!1407913))

(declare-fun m!1407915 () Bool)

(assert (=> b!1525023 m!1407915))

(assert (=> b!1525017 m!1407897))

(assert (=> b!1525017 m!1407897))

(declare-fun m!1407917 () Bool)

(assert (=> b!1525017 m!1407917))

(declare-fun m!1407919 () Bool)

(assert (=> b!1525018 m!1407919))

(assert (=> b!1525018 m!1407919))

(declare-fun m!1407921 () Bool)

(assert (=> b!1525018 m!1407921))

(assert (=> b!1525025 m!1407897))

(assert (=> b!1525025 m!1407897))

(declare-fun m!1407923 () Bool)

(assert (=> b!1525025 m!1407923))

(assert (=> b!1525025 m!1407923))

(assert (=> b!1525025 m!1407897))

(declare-fun m!1407925 () Bool)

(assert (=> b!1525025 m!1407925))

(declare-fun m!1407927 () Bool)

(assert (=> start!129960 m!1407927))

(declare-fun m!1407929 () Bool)

(assert (=> start!129960 m!1407929))

(declare-fun m!1407931 () Bool)

(assert (=> b!1525024 m!1407931))

(assert (=> b!1525026 m!1407897))

(assert (=> b!1525026 m!1407905))

(assert (=> b!1525026 m!1407907))

(declare-fun m!1407933 () Bool)

(assert (=> b!1525026 m!1407933))

(declare-fun m!1407935 () Bool)

(assert (=> b!1525019 m!1407935))

(declare-fun m!1407937 () Bool)

(assert (=> b!1525019 m!1407937))

(push 1)

