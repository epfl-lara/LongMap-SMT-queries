; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123730 () Bool)

(assert start!123730)

(declare-fun b!1434281 () Bool)

(declare-fun res!967753 () Bool)

(declare-fun e!809502 () Bool)

(assert (=> b!1434281 (=> (not res!967753) (not e!809502))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97588 0))(
  ( (array!97589 (arr!47098 (Array (_ BitVec 32) (_ BitVec 64))) (size!47648 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97588)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1434281 (= res!967753 (and (= (size!47648 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47648 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47648 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!967744 () Bool)

(assert (=> start!123730 (=> (not res!967744) (not e!809502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123730 (= res!967744 (validMask!0 mask!2608))))

(assert (=> start!123730 e!809502))

(assert (=> start!123730 true))

(declare-fun array_inv!36126 (array!97588) Bool)

(assert (=> start!123730 (array_inv!36126 a!2831)))

(declare-fun b!1434282 () Bool)

(declare-fun res!967755 () Bool)

(declare-fun e!809504 () Bool)

(assert (=> b!1434282 (=> (not res!967755) (not e!809504))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434282 (= res!967755 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun e!809505 () Bool)

(declare-fun b!1434283 () Bool)

(declare-datatypes ((SeekEntryResult!11377 0))(
  ( (MissingZero!11377 (index!47900 (_ BitVec 32))) (Found!11377 (index!47901 (_ BitVec 32))) (Intermediate!11377 (undefined!12189 Bool) (index!47902 (_ BitVec 32)) (x!129549 (_ BitVec 32))) (Undefined!11377) (MissingVacant!11377 (index!47903 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97588 (_ BitVec 32)) SeekEntryResult!11377)

(assert (=> b!1434283 (= e!809505 (= (seekEntryOrOpen!0 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) (Found!11377 j!81)))))

(declare-fun b!1434284 () Bool)

(declare-fun res!967751 () Bool)

(assert (=> b!1434284 (=> (not res!967751) (not e!809502))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434284 (= res!967751 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47648 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47648 a!2831))))))

(declare-fun b!1434285 () Bool)

(declare-fun e!809503 () Bool)

(assert (=> b!1434285 (= e!809504 (not e!809503))))

(declare-fun res!967750 () Bool)

(assert (=> b!1434285 (=> res!967750 e!809503)))

(assert (=> b!1434285 (= res!967750 (or (= (select (arr!47098 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47098 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47098 a!2831) index!585) (select (arr!47098 a!2831) j!81)) (= (select (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434285 e!809505))

(declare-fun res!967756 () Bool)

(assert (=> b!1434285 (=> (not res!967756) (not e!809505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97588 (_ BitVec 32)) Bool)

(assert (=> b!1434285 (= res!967756 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48500 0))(
  ( (Unit!48501) )
))
(declare-fun lt!631403 () Unit!48500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48500)

(assert (=> b!1434285 (= lt!631403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434286 () Bool)

(declare-fun res!967749 () Bool)

(assert (=> b!1434286 (=> (not res!967749) (not e!809502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434286 (= res!967749 (validKeyInArray!0 (select (arr!47098 a!2831) i!982)))))

(declare-fun b!1434287 () Bool)

(declare-fun e!809506 () Bool)

(assert (=> b!1434287 (= e!809502 e!809506)))

(declare-fun res!967754 () Bool)

(assert (=> b!1434287 (=> (not res!967754) (not e!809506))))

(declare-fun lt!631404 () SeekEntryResult!11377)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97588 (_ BitVec 32)) SeekEntryResult!11377)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434287 (= res!967754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47098 a!2831) j!81) mask!2608) (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!631404))))

(assert (=> b!1434287 (= lt!631404 (Intermediate!11377 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434288 () Bool)

(declare-fun res!967745 () Bool)

(assert (=> b!1434288 (=> (not res!967745) (not e!809502))))

(assert (=> b!1434288 (= res!967745 (validKeyInArray!0 (select (arr!47098 a!2831) j!81)))))

(declare-fun b!1434289 () Bool)

(declare-fun res!967747 () Bool)

(assert (=> b!1434289 (=> (not res!967747) (not e!809504))))

(assert (=> b!1434289 (= res!967747 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47098 a!2831) j!81) a!2831 mask!2608) lt!631404))))

(declare-fun b!1434290 () Bool)

(declare-fun res!967743 () Bool)

(assert (=> b!1434290 (=> (not res!967743) (not e!809502))))

(assert (=> b!1434290 (= res!967743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434291 () Bool)

(declare-fun res!967746 () Bool)

(assert (=> b!1434291 (=> (not res!967746) (not e!809502))))

(declare-datatypes ((List!33608 0))(
  ( (Nil!33605) (Cons!33604 (h!34933 (_ BitVec 64)) (t!48302 List!33608)) )
))
(declare-fun arrayNoDuplicates!0 (array!97588 (_ BitVec 32) List!33608) Bool)

(assert (=> b!1434291 (= res!967746 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33605))))

(declare-fun b!1434292 () Bool)

(declare-fun res!967748 () Bool)

(assert (=> b!1434292 (=> (not res!967748) (not e!809504))))

(declare-fun lt!631400 () SeekEntryResult!11377)

(declare-fun lt!631401 () array!97588)

(declare-fun lt!631402 () (_ BitVec 64))

(assert (=> b!1434292 (= res!967748 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631402 lt!631401 mask!2608) lt!631400))))

(declare-fun b!1434293 () Bool)

(assert (=> b!1434293 (= e!809506 e!809504)))

(declare-fun res!967752 () Bool)

(assert (=> b!1434293 (=> (not res!967752) (not e!809504))))

(assert (=> b!1434293 (= res!967752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631402 mask!2608) lt!631402 lt!631401 mask!2608) lt!631400))))

(assert (=> b!1434293 (= lt!631400 (Intermediate!11377 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1434293 (= lt!631402 (select (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434293 (= lt!631401 (array!97589 (store (arr!47098 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47648 a!2831)))))

(declare-fun b!1434294 () Bool)

(assert (=> b!1434294 (= e!809503 true)))

(declare-fun lt!631399 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434294 (= lt!631399 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!123730 res!967744) b!1434281))

(assert (= (and b!1434281 res!967753) b!1434286))

(assert (= (and b!1434286 res!967749) b!1434288))

(assert (= (and b!1434288 res!967745) b!1434290))

(assert (= (and b!1434290 res!967743) b!1434291))

(assert (= (and b!1434291 res!967746) b!1434284))

(assert (= (and b!1434284 res!967751) b!1434287))

(assert (= (and b!1434287 res!967754) b!1434293))

(assert (= (and b!1434293 res!967752) b!1434289))

(assert (= (and b!1434289 res!967747) b!1434292))

(assert (= (and b!1434292 res!967748) b!1434282))

(assert (= (and b!1434282 res!967755) b!1434285))

(assert (= (and b!1434285 res!967756) b!1434283))

(assert (= (and b!1434285 (not res!967750)) b!1434294))

(declare-fun m!1323901 () Bool)

(assert (=> b!1434287 m!1323901))

(assert (=> b!1434287 m!1323901))

(declare-fun m!1323903 () Bool)

(assert (=> b!1434287 m!1323903))

(assert (=> b!1434287 m!1323903))

(assert (=> b!1434287 m!1323901))

(declare-fun m!1323905 () Bool)

(assert (=> b!1434287 m!1323905))

(assert (=> b!1434289 m!1323901))

(assert (=> b!1434289 m!1323901))

(declare-fun m!1323907 () Bool)

(assert (=> b!1434289 m!1323907))

(assert (=> b!1434283 m!1323901))

(assert (=> b!1434283 m!1323901))

(declare-fun m!1323909 () Bool)

(assert (=> b!1434283 m!1323909))

(declare-fun m!1323911 () Bool)

(assert (=> b!1434291 m!1323911))

(declare-fun m!1323913 () Bool)

(assert (=> start!123730 m!1323913))

(declare-fun m!1323915 () Bool)

(assert (=> start!123730 m!1323915))

(assert (=> b!1434288 m!1323901))

(assert (=> b!1434288 m!1323901))

(declare-fun m!1323917 () Bool)

(assert (=> b!1434288 m!1323917))

(declare-fun m!1323919 () Bool)

(assert (=> b!1434293 m!1323919))

(assert (=> b!1434293 m!1323919))

(declare-fun m!1323921 () Bool)

(assert (=> b!1434293 m!1323921))

(declare-fun m!1323923 () Bool)

(assert (=> b!1434293 m!1323923))

(declare-fun m!1323925 () Bool)

(assert (=> b!1434293 m!1323925))

(declare-fun m!1323927 () Bool)

(assert (=> b!1434292 m!1323927))

(declare-fun m!1323929 () Bool)

(assert (=> b!1434294 m!1323929))

(declare-fun m!1323931 () Bool)

(assert (=> b!1434290 m!1323931))

(assert (=> b!1434285 m!1323923))

(declare-fun m!1323933 () Bool)

(assert (=> b!1434285 m!1323933))

(declare-fun m!1323935 () Bool)

(assert (=> b!1434285 m!1323935))

(declare-fun m!1323937 () Bool)

(assert (=> b!1434285 m!1323937))

(assert (=> b!1434285 m!1323901))

(declare-fun m!1323939 () Bool)

(assert (=> b!1434285 m!1323939))

(declare-fun m!1323941 () Bool)

(assert (=> b!1434286 m!1323941))

(assert (=> b!1434286 m!1323941))

(declare-fun m!1323943 () Bool)

(assert (=> b!1434286 m!1323943))

(push 1)

