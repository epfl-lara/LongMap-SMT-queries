; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123352 () Bool)

(assert start!123352)

(declare-fun b!1430390 () Bool)

(declare-fun res!964822 () Bool)

(declare-fun e!807571 () Bool)

(assert (=> b!1430390 (=> (not res!964822) (not e!807571))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97462 0))(
  ( (array!97463 (arr!47041 (Array (_ BitVec 32) (_ BitVec 64))) (size!47591 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97462)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11320 0))(
  ( (MissingZero!11320 (index!47672 (_ BitVec 32))) (Found!11320 (index!47673 (_ BitVec 32))) (Intermediate!11320 (undefined!12132 Bool) (index!47674 (_ BitVec 32)) (x!129304 (_ BitVec 32))) (Undefined!11320) (MissingVacant!11320 (index!47675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97462 (_ BitVec 32)) SeekEntryResult!11320)

(assert (=> b!1430390 (= res!964822 (= (seekEntryOrOpen!0 (select (arr!47041 a!2831) j!81) a!2831 mask!2608) (Found!11320 j!81)))))

(declare-fun b!1430391 () Bool)

(declare-fun res!964821 () Bool)

(declare-fun e!807572 () Bool)

(assert (=> b!1430391 (=> (not res!964821) (not e!807572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1430391 (= res!964821 (validKeyInArray!0 (select (arr!47041 a!2831) j!81)))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun e!807575 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun b!1430392 () Bool)

(assert (=> b!1430392 (= e!807575 (not (or (= (select (arr!47041 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47041 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47041 a!2831) index!585) (select (arr!47041 a!2831) j!81)) (not (= (select (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= intermediateAfterIndex!13 i!982))))))

(assert (=> b!1430392 e!807571))

(declare-fun res!964831 () Bool)

(assert (=> b!1430392 (=> (not res!964831) (not e!807571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97462 (_ BitVec 32)) Bool)

(assert (=> b!1430392 (= res!964831 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48386 0))(
  ( (Unit!48387) )
))
(declare-fun lt!629745 () Unit!48386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48386)

(assert (=> b!1430392 (= lt!629745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1430393 () Bool)

(declare-fun res!964828 () Bool)

(assert (=> b!1430393 (=> (not res!964828) (not e!807572))))

(declare-datatypes ((List!33551 0))(
  ( (Nil!33548) (Cons!33547 (h!34864 (_ BitVec 64)) (t!48245 List!33551)) )
))
(declare-fun arrayNoDuplicates!0 (array!97462 (_ BitVec 32) List!33551) Bool)

(assert (=> b!1430393 (= res!964828 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33548))))

(declare-fun b!1430394 () Bool)

(declare-fun res!964830 () Bool)

(assert (=> b!1430394 (=> (not res!964830) (not e!807575))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!629742 () SeekEntryResult!11320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97462 (_ BitVec 32)) SeekEntryResult!11320)

(assert (=> b!1430394 (= res!964830 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47041 a!2831) j!81) a!2831 mask!2608) lt!629742))))

(declare-fun res!964827 () Bool)

(assert (=> start!123352 (=> (not res!964827) (not e!807572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123352 (= res!964827 (validMask!0 mask!2608))))

(assert (=> start!123352 e!807572))

(assert (=> start!123352 true))

(declare-fun array_inv!36069 (array!97462) Bool)

(assert (=> start!123352 (array_inv!36069 a!2831)))

(declare-fun b!1430395 () Bool)

(declare-fun res!964824 () Bool)

(assert (=> b!1430395 (=> (not res!964824) (not e!807572))))

(assert (=> b!1430395 (= res!964824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1430396 () Bool)

(declare-fun res!964819 () Bool)

(assert (=> b!1430396 (=> (not res!964819) (not e!807572))))

(assert (=> b!1430396 (= res!964819 (validKeyInArray!0 (select (arr!47041 a!2831) i!982)))))

(declare-fun b!1430397 () Bool)

(declare-fun res!964820 () Bool)

(assert (=> b!1430397 (=> (not res!964820) (not e!807575))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1430397 (= res!964820 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1430398 () Bool)

(declare-fun e!807573 () Bool)

(assert (=> b!1430398 (= e!807573 e!807575)))

(declare-fun res!964826 () Bool)

(assert (=> b!1430398 (=> (not res!964826) (not e!807575))))

(declare-fun lt!629744 () SeekEntryResult!11320)

(declare-fun lt!629743 () (_ BitVec 64))

(declare-fun lt!629741 () array!97462)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1430398 (= res!964826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629743 mask!2608) lt!629743 lt!629741 mask!2608) lt!629744))))

(assert (=> b!1430398 (= lt!629744 (Intermediate!11320 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1430398 (= lt!629743 (select (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1430398 (= lt!629741 (array!97463 (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47591 a!2831)))))

(declare-fun b!1430399 () Bool)

(assert (=> b!1430399 (= e!807572 e!807573)))

(declare-fun res!964818 () Bool)

(assert (=> b!1430399 (=> (not res!964818) (not e!807573))))

(assert (=> b!1430399 (= res!964818 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47041 a!2831) j!81) mask!2608) (select (arr!47041 a!2831) j!81) a!2831 mask!2608) lt!629742))))

(assert (=> b!1430399 (= lt!629742 (Intermediate!11320 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1430400 () Bool)

(declare-fun res!964823 () Bool)

(assert (=> b!1430400 (=> (not res!964823) (not e!807572))))

(assert (=> b!1430400 (= res!964823 (and (= (size!47591 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47591 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47591 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1430401 () Bool)

(declare-fun res!964829 () Bool)

(assert (=> b!1430401 (=> (not res!964829) (not e!807575))))

(assert (=> b!1430401 (= res!964829 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629743 lt!629741 mask!2608) lt!629744))))

(declare-fun b!1430402 () Bool)

(declare-fun res!964825 () Bool)

(assert (=> b!1430402 (=> (not res!964825) (not e!807572))))

(assert (=> b!1430402 (= res!964825 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47591 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47591 a!2831))))))

(declare-fun b!1430403 () Bool)

(assert (=> b!1430403 (= e!807571 (or (= (select (arr!47041 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47041 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47041 a!2831) index!585) (select (arr!47041 a!2831) j!81)) (not (= (select (store (arr!47041 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!585 intermediateAfterIndex!13)))))

(assert (= (and start!123352 res!964827) b!1430400))

(assert (= (and b!1430400 res!964823) b!1430396))

(assert (= (and b!1430396 res!964819) b!1430391))

(assert (= (and b!1430391 res!964821) b!1430395))

(assert (= (and b!1430395 res!964824) b!1430393))

(assert (= (and b!1430393 res!964828) b!1430402))

(assert (= (and b!1430402 res!964825) b!1430399))

(assert (= (and b!1430399 res!964818) b!1430398))

(assert (= (and b!1430398 res!964826) b!1430394))

(assert (= (and b!1430394 res!964830) b!1430401))

(assert (= (and b!1430401 res!964829) b!1430397))

(assert (= (and b!1430397 res!964820) b!1430392))

(assert (= (and b!1430392 res!964831) b!1430390))

(assert (= (and b!1430390 res!964822) b!1430403))

(declare-fun m!1320363 () Bool)

(assert (=> b!1430396 m!1320363))

(assert (=> b!1430396 m!1320363))

(declare-fun m!1320365 () Bool)

(assert (=> b!1430396 m!1320365))

(declare-fun m!1320367 () Bool)

(assert (=> start!123352 m!1320367))

(declare-fun m!1320369 () Bool)

(assert (=> start!123352 m!1320369))

(declare-fun m!1320371 () Bool)

(assert (=> b!1430394 m!1320371))

(assert (=> b!1430394 m!1320371))

(declare-fun m!1320373 () Bool)

(assert (=> b!1430394 m!1320373))

(declare-fun m!1320375 () Bool)

(assert (=> b!1430398 m!1320375))

(assert (=> b!1430398 m!1320375))

(declare-fun m!1320377 () Bool)

(assert (=> b!1430398 m!1320377))

(declare-fun m!1320379 () Bool)

(assert (=> b!1430398 m!1320379))

(declare-fun m!1320381 () Bool)

(assert (=> b!1430398 m!1320381))

(declare-fun m!1320383 () Bool)

(assert (=> b!1430403 m!1320383))

(assert (=> b!1430403 m!1320371))

(assert (=> b!1430403 m!1320379))

(declare-fun m!1320385 () Bool)

(assert (=> b!1430403 m!1320385))

(assert (=> b!1430390 m!1320371))

(assert (=> b!1430390 m!1320371))

(declare-fun m!1320387 () Bool)

(assert (=> b!1430390 m!1320387))

(assert (=> b!1430391 m!1320371))

(assert (=> b!1430391 m!1320371))

(declare-fun m!1320389 () Bool)

(assert (=> b!1430391 m!1320389))

(declare-fun m!1320391 () Bool)

(assert (=> b!1430401 m!1320391))

(assert (=> b!1430392 m!1320379))

(assert (=> b!1430392 m!1320385))

(assert (=> b!1430392 m!1320383))

(declare-fun m!1320393 () Bool)

(assert (=> b!1430392 m!1320393))

(assert (=> b!1430392 m!1320371))

(declare-fun m!1320395 () Bool)

(assert (=> b!1430392 m!1320395))

(declare-fun m!1320397 () Bool)

(assert (=> b!1430393 m!1320397))

(assert (=> b!1430399 m!1320371))

(assert (=> b!1430399 m!1320371))

(declare-fun m!1320399 () Bool)

(assert (=> b!1430399 m!1320399))

(assert (=> b!1430399 m!1320399))

(assert (=> b!1430399 m!1320371))

(declare-fun m!1320401 () Bool)

(assert (=> b!1430399 m!1320401))

(declare-fun m!1320403 () Bool)

(assert (=> b!1430395 m!1320403))

(push 1)

(assert (not b!1430392))

(assert (not b!1430401))

(assert (not b!1430391))

