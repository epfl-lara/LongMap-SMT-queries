; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123082 () Bool)

(assert start!123082)

(declare-fun b!1427349 () Bool)

(declare-fun e!806198 () Bool)

(declare-fun e!806195 () Bool)

(assert (=> b!1427349 (= e!806198 e!806195)))

(declare-fun res!962389 () Bool)

(assert (=> b!1427349 (=> (not res!962389) (not e!806195))))

(declare-datatypes ((SeekEntryResult!11266 0))(
  ( (MissingZero!11266 (index!47456 (_ BitVec 32))) (Found!11266 (index!47457 (_ BitVec 32))) (Intermediate!11266 (undefined!12078 Bool) (index!47458 (_ BitVec 32)) (x!129088 (_ BitVec 32))) (Undefined!11266) (MissingVacant!11266 (index!47459 (_ BitVec 32))) )
))
(declare-fun lt!628539 () SeekEntryResult!11266)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97345 0))(
  ( (array!97346 (arr!46987 (Array (_ BitVec 32) (_ BitVec 64))) (size!47537 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97345)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97345 (_ BitVec 32)) SeekEntryResult!11266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427349 (= res!962389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46987 a!2831) j!81) mask!2608) (select (arr!46987 a!2831) j!81) a!2831 mask!2608) lt!628539))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1427349 (= lt!628539 (Intermediate!11266 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427350 () Bool)

(declare-fun res!962383 () Bool)

(assert (=> b!1427350 (=> (not res!962383) (not e!806198))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427350 (= res!962383 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47537 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47537 a!2831))))))

(declare-fun b!1427351 () Bool)

(declare-fun e!806194 () Bool)

(assert (=> b!1427351 (= e!806194 (not true))))

(declare-fun e!806196 () Bool)

(assert (=> b!1427351 e!806196))

(declare-fun res!962390 () Bool)

(assert (=> b!1427351 (=> (not res!962390) (not e!806196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97345 (_ BitVec 32)) Bool)

(assert (=> b!1427351 (= res!962390 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48278 0))(
  ( (Unit!48279) )
))
(declare-fun lt!628538 () Unit!48278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48278)

(assert (=> b!1427351 (= lt!628538 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427352 () Bool)

(declare-fun res!962381 () Bool)

(assert (=> b!1427352 (=> (not res!962381) (not e!806194))))

(declare-fun lt!628537 () (_ BitVec 64))

(declare-fun lt!628535 () array!97345)

(declare-fun lt!628536 () SeekEntryResult!11266)

(assert (=> b!1427352 (= res!962381 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628537 lt!628535 mask!2608) lt!628536))))

(declare-fun b!1427353 () Bool)

(declare-fun res!962387 () Bool)

(assert (=> b!1427353 (=> (not res!962387) (not e!806198))))

(assert (=> b!1427353 (= res!962387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427355 () Bool)

(declare-fun res!962388 () Bool)

(assert (=> b!1427355 (=> (not res!962388) (not e!806194))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427355 (= res!962388 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427356 () Bool)

(declare-fun res!962384 () Bool)

(assert (=> b!1427356 (=> (not res!962384) (not e!806194))))

(assert (=> b!1427356 (= res!962384 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46987 a!2831) j!81) a!2831 mask!2608) lt!628539))))

(declare-fun b!1427357 () Bool)

(declare-fun res!962382 () Bool)

(assert (=> b!1427357 (=> (not res!962382) (not e!806198))))

(declare-datatypes ((List!33497 0))(
  ( (Nil!33494) (Cons!33493 (h!34801 (_ BitVec 64)) (t!48191 List!33497)) )
))
(declare-fun arrayNoDuplicates!0 (array!97345 (_ BitVec 32) List!33497) Bool)

(assert (=> b!1427357 (= res!962382 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33494))))

(declare-fun b!1427358 () Bool)

(declare-fun res!962380 () Bool)

(assert (=> b!1427358 (=> (not res!962380) (not e!806198))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427358 (= res!962380 (validKeyInArray!0 (select (arr!46987 a!2831) i!982)))))

(declare-fun b!1427359 () Bool)

(declare-fun res!962391 () Bool)

(assert (=> b!1427359 (=> (not res!962391) (not e!806198))))

(assert (=> b!1427359 (= res!962391 (validKeyInArray!0 (select (arr!46987 a!2831) j!81)))))

(declare-fun b!1427360 () Bool)

(assert (=> b!1427360 (= e!806195 e!806194)))

(declare-fun res!962392 () Bool)

(assert (=> b!1427360 (=> (not res!962392) (not e!806194))))

(assert (=> b!1427360 (= res!962392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628537 mask!2608) lt!628537 lt!628535 mask!2608) lt!628536))))

(assert (=> b!1427360 (= lt!628536 (Intermediate!11266 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1427360 (= lt!628537 (select (store (arr!46987 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427360 (= lt!628535 (array!97346 (store (arr!46987 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47537 a!2831)))))

(declare-fun b!1427361 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97345 (_ BitVec 32)) SeekEntryResult!11266)

(assert (=> b!1427361 (= e!806196 (= (seekEntryOrOpen!0 (select (arr!46987 a!2831) j!81) a!2831 mask!2608) (Found!11266 j!81)))))

(declare-fun res!962386 () Bool)

(assert (=> start!123082 (=> (not res!962386) (not e!806198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123082 (= res!962386 (validMask!0 mask!2608))))

(assert (=> start!123082 e!806198))

(assert (=> start!123082 true))

(declare-fun array_inv!36015 (array!97345) Bool)

(assert (=> start!123082 (array_inv!36015 a!2831)))

(declare-fun b!1427354 () Bool)

(declare-fun res!962385 () Bool)

(assert (=> b!1427354 (=> (not res!962385) (not e!806198))))

(assert (=> b!1427354 (= res!962385 (and (= (size!47537 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47537 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47537 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123082 res!962386) b!1427354))

(assert (= (and b!1427354 res!962385) b!1427358))

(assert (= (and b!1427358 res!962380) b!1427359))

(assert (= (and b!1427359 res!962391) b!1427353))

(assert (= (and b!1427353 res!962387) b!1427357))

(assert (= (and b!1427357 res!962382) b!1427350))

(assert (= (and b!1427350 res!962383) b!1427349))

(assert (= (and b!1427349 res!962389) b!1427360))

(assert (= (and b!1427360 res!962392) b!1427356))

(assert (= (and b!1427356 res!962384) b!1427352))

(assert (= (and b!1427352 res!962381) b!1427355))

(assert (= (and b!1427355 res!962388) b!1427351))

(assert (= (and b!1427351 res!962390) b!1427361))

(declare-fun m!1317721 () Bool)

(assert (=> b!1427360 m!1317721))

(assert (=> b!1427360 m!1317721))

(declare-fun m!1317723 () Bool)

(assert (=> b!1427360 m!1317723))

(declare-fun m!1317725 () Bool)

(assert (=> b!1427360 m!1317725))

(declare-fun m!1317727 () Bool)

(assert (=> b!1427360 m!1317727))

(declare-fun m!1317729 () Bool)

(assert (=> b!1427358 m!1317729))

(assert (=> b!1427358 m!1317729))

(declare-fun m!1317731 () Bool)

(assert (=> b!1427358 m!1317731))

(declare-fun m!1317733 () Bool)

(assert (=> b!1427349 m!1317733))

(assert (=> b!1427349 m!1317733))

(declare-fun m!1317735 () Bool)

(assert (=> b!1427349 m!1317735))

(assert (=> b!1427349 m!1317735))

(assert (=> b!1427349 m!1317733))

(declare-fun m!1317737 () Bool)

(assert (=> b!1427349 m!1317737))

(assert (=> b!1427356 m!1317733))

(assert (=> b!1427356 m!1317733))

(declare-fun m!1317739 () Bool)

(assert (=> b!1427356 m!1317739))

(declare-fun m!1317741 () Bool)

(assert (=> b!1427352 m!1317741))

(declare-fun m!1317743 () Bool)

(assert (=> b!1427351 m!1317743))

(declare-fun m!1317745 () Bool)

(assert (=> b!1427351 m!1317745))

(declare-fun m!1317747 () Bool)

(assert (=> b!1427353 m!1317747))

(declare-fun m!1317749 () Bool)

(assert (=> b!1427357 m!1317749))

(declare-fun m!1317751 () Bool)

(assert (=> start!123082 m!1317751))

(declare-fun m!1317753 () Bool)

(assert (=> start!123082 m!1317753))

(assert (=> b!1427359 m!1317733))

(assert (=> b!1427359 m!1317733))

(declare-fun m!1317755 () Bool)

(assert (=> b!1427359 m!1317755))

(assert (=> b!1427361 m!1317733))

(assert (=> b!1427361 m!1317733))

(declare-fun m!1317757 () Bool)

(assert (=> b!1427361 m!1317757))

(push 1)

