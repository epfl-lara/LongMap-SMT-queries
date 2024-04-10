; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123256 () Bool)

(assert start!123256)

(declare-fun b!1429254 () Bool)

(declare-fun res!963888 () Bool)

(declare-fun e!807068 () Bool)

(assert (=> b!1429254 (=> (not res!963888) (not e!807068))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97417 0))(
  ( (array!97418 (arr!47020 (Array (_ BitVec 32) (_ BitVec 64))) (size!47570 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97417)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429254 (= res!963888 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47570 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47570 a!2831))))))

(declare-fun b!1429255 () Bool)

(declare-fun e!807067 () Bool)

(assert (=> b!1429255 (= e!807067 (not true))))

(declare-fun e!807069 () Bool)

(assert (=> b!1429255 e!807069))

(declare-fun res!963891 () Bool)

(assert (=> b!1429255 (=> (not res!963891) (not e!807069))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97417 (_ BitVec 32)) Bool)

(assert (=> b!1429255 (= res!963891 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48344 0))(
  ( (Unit!48345) )
))
(declare-fun lt!629298 () Unit!48344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48344)

(assert (=> b!1429255 (= lt!629298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429256 () Bool)

(declare-fun e!807071 () Bool)

(assert (=> b!1429256 (= e!807068 e!807071)))

(declare-fun res!963884 () Bool)

(assert (=> b!1429256 (=> (not res!963884) (not e!807071))))

(declare-datatypes ((SeekEntryResult!11299 0))(
  ( (MissingZero!11299 (index!47588 (_ BitVec 32))) (Found!11299 (index!47589 (_ BitVec 32))) (Intermediate!11299 (undefined!12111 Bool) (index!47590 (_ BitVec 32)) (x!129221 (_ BitVec 32))) (Undefined!11299) (MissingVacant!11299 (index!47591 (_ BitVec 32))) )
))
(declare-fun lt!629295 () SeekEntryResult!11299)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97417 (_ BitVec 32)) SeekEntryResult!11299)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429256 (= res!963884 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47020 a!2831) j!81) mask!2608) (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629295))))

(assert (=> b!1429256 (= lt!629295 (Intermediate!11299 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429257 () Bool)

(declare-fun res!963894 () Bool)

(assert (=> b!1429257 (=> (not res!963894) (not e!807067))))

(assert (=> b!1429257 (= res!963894 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) lt!629295))))

(declare-fun b!1429258 () Bool)

(declare-fun res!963895 () Bool)

(assert (=> b!1429258 (=> (not res!963895) (not e!807068))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429258 (= res!963895 (validKeyInArray!0 (select (arr!47020 a!2831) i!982)))))

(declare-fun b!1429259 () Bool)

(assert (=> b!1429259 (= e!807071 e!807067)))

(declare-fun res!963887 () Bool)

(assert (=> b!1429259 (=> (not res!963887) (not e!807067))))

(declare-fun lt!629297 () array!97417)

(declare-fun lt!629296 () SeekEntryResult!11299)

(declare-fun lt!629294 () (_ BitVec 64))

(assert (=> b!1429259 (= res!963887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629294 mask!2608) lt!629294 lt!629297 mask!2608) lt!629296))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429259 (= lt!629296 (Intermediate!11299 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429259 (= lt!629294 (select (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429259 (= lt!629297 (array!97418 (store (arr!47020 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47570 a!2831)))))

(declare-fun b!1429260 () Bool)

(declare-fun res!963883 () Bool)

(assert (=> b!1429260 (=> (not res!963883) (not e!807068))))

(declare-datatypes ((List!33530 0))(
  ( (Nil!33527) (Cons!33526 (h!34840 (_ BitVec 64)) (t!48224 List!33530)) )
))
(declare-fun arrayNoDuplicates!0 (array!97417 (_ BitVec 32) List!33530) Bool)

(assert (=> b!1429260 (= res!963883 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33527))))

(declare-fun b!1429261 () Bool)

(declare-fun res!963892 () Bool)

(assert (=> b!1429261 (=> (not res!963892) (not e!807068))))

(assert (=> b!1429261 (= res!963892 (and (= (size!47570 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47570 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47570 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429262 () Bool)

(declare-fun res!963890 () Bool)

(assert (=> b!1429262 (=> (not res!963890) (not e!807067))))

(assert (=> b!1429262 (= res!963890 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629294 lt!629297 mask!2608) lt!629296))))

(declare-fun b!1429263 () Bool)

(declare-fun res!963886 () Bool)

(assert (=> b!1429263 (=> (not res!963886) (not e!807068))))

(assert (=> b!1429263 (= res!963886 (validKeyInArray!0 (select (arr!47020 a!2831) j!81)))))

(declare-fun b!1429264 () Bool)

(declare-fun res!963889 () Bool)

(assert (=> b!1429264 (=> (not res!963889) (not e!807067))))

(assert (=> b!1429264 (= res!963889 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429265 () Bool)

(declare-fun res!963893 () Bool)

(assert (=> b!1429265 (=> (not res!963893) (not e!807068))))

(assert (=> b!1429265 (= res!963893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!963885 () Bool)

(assert (=> start!123256 (=> (not res!963885) (not e!807068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123256 (= res!963885 (validMask!0 mask!2608))))

(assert (=> start!123256 e!807068))

(assert (=> start!123256 true))

(declare-fun array_inv!36048 (array!97417) Bool)

(assert (=> start!123256 (array_inv!36048 a!2831)))

(declare-fun b!1429266 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97417 (_ BitVec 32)) SeekEntryResult!11299)

(assert (=> b!1429266 (= e!807069 (= (seekEntryOrOpen!0 (select (arr!47020 a!2831) j!81) a!2831 mask!2608) (Found!11299 j!81)))))

(assert (= (and start!123256 res!963885) b!1429261))

(assert (= (and b!1429261 res!963892) b!1429258))

(assert (= (and b!1429258 res!963895) b!1429263))

(assert (= (and b!1429263 res!963886) b!1429265))

(assert (= (and b!1429265 res!963893) b!1429260))

(assert (= (and b!1429260 res!963883) b!1429254))

(assert (= (and b!1429254 res!963888) b!1429256))

(assert (= (and b!1429256 res!963884) b!1429259))

(assert (= (and b!1429259 res!963887) b!1429257))

(assert (= (and b!1429257 res!963894) b!1429262))

(assert (= (and b!1429262 res!963890) b!1429264))

(assert (= (and b!1429264 res!963889) b!1429255))

(assert (= (and b!1429255 res!963891) b!1429266))

(declare-fun m!1319359 () Bool)

(assert (=> b!1429255 m!1319359))

(declare-fun m!1319361 () Bool)

(assert (=> b!1429255 m!1319361))

(declare-fun m!1319363 () Bool)

(assert (=> b!1429258 m!1319363))

(assert (=> b!1429258 m!1319363))

(declare-fun m!1319365 () Bool)

(assert (=> b!1429258 m!1319365))

(declare-fun m!1319367 () Bool)

(assert (=> b!1429262 m!1319367))

(declare-fun m!1319369 () Bool)

(assert (=> b!1429260 m!1319369))

(declare-fun m!1319371 () Bool)

(assert (=> start!123256 m!1319371))

(declare-fun m!1319373 () Bool)

(assert (=> start!123256 m!1319373))

(declare-fun m!1319375 () Bool)

(assert (=> b!1429256 m!1319375))

(assert (=> b!1429256 m!1319375))

(declare-fun m!1319377 () Bool)

(assert (=> b!1429256 m!1319377))

(assert (=> b!1429256 m!1319377))

(assert (=> b!1429256 m!1319375))

(declare-fun m!1319379 () Bool)

(assert (=> b!1429256 m!1319379))

(assert (=> b!1429263 m!1319375))

(assert (=> b!1429263 m!1319375))

(declare-fun m!1319381 () Bool)

(assert (=> b!1429263 m!1319381))

(declare-fun m!1319383 () Bool)

(assert (=> b!1429265 m!1319383))

(declare-fun m!1319385 () Bool)

(assert (=> b!1429259 m!1319385))

(assert (=> b!1429259 m!1319385))

(declare-fun m!1319387 () Bool)

(assert (=> b!1429259 m!1319387))

(declare-fun m!1319389 () Bool)

(assert (=> b!1429259 m!1319389))

(declare-fun m!1319391 () Bool)

(assert (=> b!1429259 m!1319391))

(assert (=> b!1429257 m!1319375))

(assert (=> b!1429257 m!1319375))

(declare-fun m!1319393 () Bool)

(assert (=> b!1429257 m!1319393))

(assert (=> b!1429266 m!1319375))

(assert (=> b!1429266 m!1319375))

(declare-fun m!1319395 () Bool)

(assert (=> b!1429266 m!1319395))

(push 1)

