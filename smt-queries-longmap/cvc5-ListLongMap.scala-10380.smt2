; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122202 () Bool)

(assert start!122202)

(declare-fun b!1417596 () Bool)

(declare-fun res!953382 () Bool)

(declare-fun e!802274 () Bool)

(assert (=> b!1417596 (=> (not res!953382) (not e!802274))))

(declare-datatypes ((array!96739 0))(
  ( (array!96740 (arr!46698 (Array (_ BitVec 32) (_ BitVec 64))) (size!47250 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96739)

(declare-datatypes ((List!33295 0))(
  ( (Nil!33292) (Cons!33291 (h!34584 (_ BitVec 64)) (t!47981 List!33295)) )
))
(declare-fun arrayNoDuplicates!0 (array!96739 (_ BitVec 32) List!33295) Bool)

(assert (=> b!1417596 (= res!953382 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33292))))

(declare-fun res!953380 () Bool)

(assert (=> start!122202 (=> (not res!953380) (not e!802274))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122202 (= res!953380 (validMask!0 mask!2840))))

(assert (=> start!122202 e!802274))

(assert (=> start!122202 true))

(declare-fun array_inv!35931 (array!96739) Bool)

(assert (=> start!122202 (array_inv!35931 a!2901)))

(declare-fun b!1417597 () Bool)

(assert (=> b!1417597 (= e!802274 (not true))))

(declare-fun e!802273 () Bool)

(assert (=> b!1417597 e!802273))

(declare-fun res!953381 () Bool)

(assert (=> b!1417597 (=> (not res!953381) (not e!802273))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96739 (_ BitVec 32)) Bool)

(assert (=> b!1417597 (= res!953381 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47887 0))(
  ( (Unit!47888) )
))
(declare-fun lt!625249 () Unit!47887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47887)

(assert (=> b!1417597 (= lt!625249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11035 0))(
  ( (MissingZero!11035 (index!46532 (_ BitVec 32))) (Found!11035 (index!46533 (_ BitVec 32))) (Intermediate!11035 (undefined!11847 Bool) (index!46534 (_ BitVec 32)) (x!128123 (_ BitVec 32))) (Undefined!11035) (MissingVacant!11035 (index!46535 (_ BitVec 32))) )
))
(declare-fun lt!625250 () SeekEntryResult!11035)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96739 (_ BitVec 32)) SeekEntryResult!11035)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417597 (= lt!625250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46698 a!2901) j!112) mask!2840) (select (arr!46698 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417598 () Bool)

(declare-fun res!953377 () Bool)

(assert (=> b!1417598 (=> (not res!953377) (not e!802274))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417598 (= res!953377 (validKeyInArray!0 (select (arr!46698 a!2901) i!1037)))))

(declare-fun b!1417599 () Bool)

(declare-fun res!953378 () Bool)

(assert (=> b!1417599 (=> (not res!953378) (not e!802274))))

(assert (=> b!1417599 (= res!953378 (and (= (size!47250 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47250 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47250 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417600 () Bool)

(declare-fun res!953379 () Bool)

(assert (=> b!1417600 (=> (not res!953379) (not e!802274))))

(assert (=> b!1417600 (= res!953379 (validKeyInArray!0 (select (arr!46698 a!2901) j!112)))))

(declare-fun b!1417601 () Bool)

(declare-fun res!953383 () Bool)

(assert (=> b!1417601 (=> (not res!953383) (not e!802274))))

(assert (=> b!1417601 (= res!953383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417602 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96739 (_ BitVec 32)) SeekEntryResult!11035)

(assert (=> b!1417602 (= e!802273 (= (seekEntryOrOpen!0 (select (arr!46698 a!2901) j!112) a!2901 mask!2840) (Found!11035 j!112)))))

(assert (= (and start!122202 res!953380) b!1417599))

(assert (= (and b!1417599 res!953378) b!1417598))

(assert (= (and b!1417598 res!953377) b!1417600))

(assert (= (and b!1417600 res!953379) b!1417601))

(assert (= (and b!1417601 res!953383) b!1417596))

(assert (= (and b!1417596 res!953382) b!1417597))

(assert (= (and b!1417597 res!953381) b!1417602))

(declare-fun m!1307915 () Bool)

(assert (=> b!1417601 m!1307915))

(declare-fun m!1307917 () Bool)

(assert (=> b!1417598 m!1307917))

(assert (=> b!1417598 m!1307917))

(declare-fun m!1307919 () Bool)

(assert (=> b!1417598 m!1307919))

(declare-fun m!1307921 () Bool)

(assert (=> b!1417597 m!1307921))

(declare-fun m!1307923 () Bool)

(assert (=> b!1417597 m!1307923))

(assert (=> b!1417597 m!1307921))

(declare-fun m!1307925 () Bool)

(assert (=> b!1417597 m!1307925))

(assert (=> b!1417597 m!1307923))

(assert (=> b!1417597 m!1307921))

(declare-fun m!1307927 () Bool)

(assert (=> b!1417597 m!1307927))

(declare-fun m!1307929 () Bool)

(assert (=> b!1417597 m!1307929))

(assert (=> b!1417602 m!1307921))

(assert (=> b!1417602 m!1307921))

(declare-fun m!1307931 () Bool)

(assert (=> b!1417602 m!1307931))

(assert (=> b!1417600 m!1307921))

(assert (=> b!1417600 m!1307921))

(declare-fun m!1307933 () Bool)

(assert (=> b!1417600 m!1307933))

(declare-fun m!1307935 () Bool)

(assert (=> b!1417596 m!1307935))

(declare-fun m!1307937 () Bool)

(assert (=> start!122202 m!1307937))

(declare-fun m!1307939 () Bool)

(assert (=> start!122202 m!1307939))

(push 1)

(assert (not start!122202))

(assert (not b!1417597))

(assert (not b!1417598))

(assert (not b!1417601))

(assert (not b!1417600))

(assert (not b!1417596))

(assert (not b!1417602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

