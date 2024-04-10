; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121956 () Bool)

(assert start!121956)

(declare-fun b!1415304 () Bool)

(declare-fun e!801017 () Bool)

(declare-fun e!801015 () Bool)

(assert (=> b!1415304 (= e!801017 e!801015)))

(declare-fun res!951347 () Bool)

(assert (=> b!1415304 (=> res!951347 e!801015)))

(declare-datatypes ((SeekEntryResult!10963 0))(
  ( (MissingZero!10963 (index!46244 (_ BitVec 32))) (Found!10963 (index!46245 (_ BitVec 32))) (Intermediate!10963 (undefined!11775 Bool) (index!46246 (_ BitVec 32)) (x!127858 (_ BitVec 32))) (Undefined!10963) (MissingVacant!10963 (index!46247 (_ BitVec 32))) )
))
(declare-fun lt!624050 () SeekEntryResult!10963)

(declare-fun lt!624049 () SeekEntryResult!10963)

(assert (=> b!1415304 (= res!951347 (or (= lt!624050 lt!624049) (not (is-Intermediate!10963 lt!624049))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96642 0))(
  ( (array!96643 (arr!46652 (Array (_ BitVec 32) (_ BitVec 64))) (size!47202 (_ BitVec 32))) )
))
(declare-fun lt!624053 () array!96642)

(declare-fun lt!624052 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96642 (_ BitVec 32)) SeekEntryResult!10963)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415304 (= lt!624049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624052 mask!2840) lt!624052 lt!624053 mask!2840))))

(declare-fun a!2901 () array!96642)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415304 (= lt!624052 (select (store (arr!46652 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415304 (= lt!624053 (array!96643 (store (arr!46652 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47202 a!2901)))))

(declare-fun b!1415305 () Bool)

(declare-fun res!951350 () Bool)

(declare-fun e!801016 () Bool)

(assert (=> b!1415305 (=> (not res!951350) (not e!801016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415305 (= res!951350 (validKeyInArray!0 (select (arr!46652 a!2901) i!1037)))))

(declare-fun b!1415306 () Bool)

(declare-fun res!951351 () Bool)

(assert (=> b!1415306 (=> (not res!951351) (not e!801016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96642 (_ BitVec 32)) Bool)

(assert (=> b!1415306 (= res!951351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!801019 () Bool)

(declare-fun b!1415307 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96642 (_ BitVec 32)) SeekEntryResult!10963)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96642 (_ BitVec 32)) SeekEntryResult!10963)

(assert (=> b!1415307 (= e!801019 (= (seekEntryOrOpen!0 lt!624052 lt!624053 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127858 lt!624049) (index!46246 lt!624049) (index!46246 lt!624049) (select (arr!46652 a!2901) j!112) lt!624053 mask!2840)))))

(declare-fun b!1415308 () Bool)

(assert (=> b!1415308 (= e!801016 (not e!801017))))

(declare-fun res!951349 () Bool)

(assert (=> b!1415308 (=> res!951349 e!801017)))

(assert (=> b!1415308 (= res!951349 (or (not (is-Intermediate!10963 lt!624050)) (undefined!11775 lt!624050)))))

(declare-fun e!801020 () Bool)

(assert (=> b!1415308 e!801020))

(declare-fun res!951348 () Bool)

(assert (=> b!1415308 (=> (not res!951348) (not e!801020))))

(assert (=> b!1415308 (= res!951348 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47900 0))(
  ( (Unit!47901) )
))
(declare-fun lt!624048 () Unit!47900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47900)

(assert (=> b!1415308 (= lt!624048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624054 () (_ BitVec 32))

(assert (=> b!1415308 (= lt!624050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624054 (select (arr!46652 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415308 (= lt!624054 (toIndex!0 (select (arr!46652 a!2901) j!112) mask!2840))))

(declare-fun b!1415309 () Bool)

(assert (=> b!1415309 (= e!801015 true)))

(assert (=> b!1415309 e!801019))

(declare-fun res!951355 () Bool)

(assert (=> b!1415309 (=> (not res!951355) (not e!801019))))

(assert (=> b!1415309 (= res!951355 (and (not (undefined!11775 lt!624049)) (= (index!46246 lt!624049) i!1037) (bvslt (x!127858 lt!624049) (x!127858 lt!624050)) (= (select (store (arr!46652 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46246 lt!624049)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624051 () Unit!47900)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47900)

(assert (=> b!1415309 (= lt!624051 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624054 (x!127858 lt!624050) (index!46246 lt!624050) (x!127858 lt!624049) (index!46246 lt!624049) (undefined!11775 lt!624049) mask!2840))))

(declare-fun res!951353 () Bool)

(assert (=> start!121956 (=> (not res!951353) (not e!801016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121956 (= res!951353 (validMask!0 mask!2840))))

(assert (=> start!121956 e!801016))

(assert (=> start!121956 true))

(declare-fun array_inv!35680 (array!96642) Bool)

(assert (=> start!121956 (array_inv!35680 a!2901)))

(declare-fun b!1415310 () Bool)

(declare-fun res!951346 () Bool)

(assert (=> b!1415310 (=> (not res!951346) (not e!801016))))

(declare-datatypes ((List!33171 0))(
  ( (Nil!33168) (Cons!33167 (h!34454 (_ BitVec 64)) (t!47865 List!33171)) )
))
(declare-fun arrayNoDuplicates!0 (array!96642 (_ BitVec 32) List!33171) Bool)

(assert (=> b!1415310 (= res!951346 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33168))))

(declare-fun b!1415311 () Bool)

(declare-fun res!951352 () Bool)

(assert (=> b!1415311 (=> (not res!951352) (not e!801016))))

(assert (=> b!1415311 (= res!951352 (validKeyInArray!0 (select (arr!46652 a!2901) j!112)))))

(declare-fun b!1415312 () Bool)

(assert (=> b!1415312 (= e!801020 (= (seekEntryOrOpen!0 (select (arr!46652 a!2901) j!112) a!2901 mask!2840) (Found!10963 j!112)))))

(declare-fun b!1415313 () Bool)

(declare-fun res!951354 () Bool)

(assert (=> b!1415313 (=> (not res!951354) (not e!801016))))

(assert (=> b!1415313 (= res!951354 (and (= (size!47202 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47202 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47202 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121956 res!951353) b!1415313))

(assert (= (and b!1415313 res!951354) b!1415305))

(assert (= (and b!1415305 res!951350) b!1415311))

(assert (= (and b!1415311 res!951352) b!1415306))

(assert (= (and b!1415306 res!951351) b!1415310))

(assert (= (and b!1415310 res!951346) b!1415308))

(assert (= (and b!1415308 res!951348) b!1415312))

(assert (= (and b!1415308 (not res!951349)) b!1415304))

(assert (= (and b!1415304 (not res!951347)) b!1415309))

(assert (= (and b!1415309 res!951355) b!1415307))

(declare-fun m!1305531 () Bool)

(assert (=> b!1415311 m!1305531))

(assert (=> b!1415311 m!1305531))

(declare-fun m!1305533 () Bool)

(assert (=> b!1415311 m!1305533))

(assert (=> b!1415312 m!1305531))

(assert (=> b!1415312 m!1305531))

(declare-fun m!1305535 () Bool)

(assert (=> b!1415312 m!1305535))

(declare-fun m!1305537 () Bool)

(assert (=> b!1415310 m!1305537))

(declare-fun m!1305539 () Bool)

(assert (=> b!1415309 m!1305539))

(declare-fun m!1305541 () Bool)

(assert (=> b!1415309 m!1305541))

(declare-fun m!1305543 () Bool)

(assert (=> b!1415309 m!1305543))

(declare-fun m!1305545 () Bool)

(assert (=> b!1415305 m!1305545))

(assert (=> b!1415305 m!1305545))

(declare-fun m!1305547 () Bool)

(assert (=> b!1415305 m!1305547))

(declare-fun m!1305549 () Bool)

(assert (=> b!1415304 m!1305549))

(assert (=> b!1415304 m!1305549))

(declare-fun m!1305551 () Bool)

(assert (=> b!1415304 m!1305551))

(assert (=> b!1415304 m!1305539))

(declare-fun m!1305553 () Bool)

(assert (=> b!1415304 m!1305553))

(declare-fun m!1305555 () Bool)

(assert (=> b!1415306 m!1305555))

(declare-fun m!1305557 () Bool)

(assert (=> start!121956 m!1305557))

(declare-fun m!1305559 () Bool)

(assert (=> start!121956 m!1305559))

(assert (=> b!1415308 m!1305531))

(declare-fun m!1305561 () Bool)

(assert (=> b!1415308 m!1305561))

(assert (=> b!1415308 m!1305531))

(assert (=> b!1415308 m!1305531))

(declare-fun m!1305563 () Bool)

(assert (=> b!1415308 m!1305563))

(declare-fun m!1305565 () Bool)

(assert (=> b!1415308 m!1305565))

(declare-fun m!1305567 () Bool)

(assert (=> b!1415308 m!1305567))

(declare-fun m!1305569 () Bool)

(assert (=> b!1415307 m!1305569))

(assert (=> b!1415307 m!1305531))

(assert (=> b!1415307 m!1305531))

(declare-fun m!1305571 () Bool)

(assert (=> b!1415307 m!1305571))

(push 1)

