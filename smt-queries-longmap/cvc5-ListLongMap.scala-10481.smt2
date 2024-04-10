; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123264 () Bool)

(assert start!123264)

(declare-fun b!1429410 () Bool)

(declare-fun res!964050 () Bool)

(declare-fun e!807130 () Bool)

(assert (=> b!1429410 (=> (not res!964050) (not e!807130))))

(declare-datatypes ((array!97425 0))(
  ( (array!97426 (arr!47024 (Array (_ BitVec 32) (_ BitVec 64))) (size!47574 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97425)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429410 (= res!964050 (validKeyInArray!0 (select (arr!47024 a!2831) i!982)))))

(declare-fun b!1429411 () Bool)

(declare-fun res!964043 () Bool)

(assert (=> b!1429411 (=> (not res!964043) (not e!807130))))

(declare-datatypes ((List!33534 0))(
  ( (Nil!33531) (Cons!33530 (h!34844 (_ BitVec 64)) (t!48228 List!33534)) )
))
(declare-fun arrayNoDuplicates!0 (array!97425 (_ BitVec 32) List!33534) Bool)

(assert (=> b!1429411 (= res!964043 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33531))))

(declare-fun b!1429412 () Bool)

(declare-fun e!807131 () Bool)

(declare-fun e!807129 () Bool)

(assert (=> b!1429412 (= e!807131 e!807129)))

(declare-fun res!964047 () Bool)

(assert (=> b!1429412 (=> (not res!964047) (not e!807129))))

(declare-fun lt!629355 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11303 0))(
  ( (MissingZero!11303 (index!47604 (_ BitVec 32))) (Found!11303 (index!47605 (_ BitVec 32))) (Intermediate!11303 (undefined!12115 Bool) (index!47606 (_ BitVec 32)) (x!129241 (_ BitVec 32))) (Undefined!11303) (MissingVacant!11303 (index!47607 (_ BitVec 32))) )
))
(declare-fun lt!629354 () SeekEntryResult!11303)

(declare-fun lt!629356 () array!97425)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97425 (_ BitVec 32)) SeekEntryResult!11303)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429412 (= res!964047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629355 mask!2608) lt!629355 lt!629356 mask!2608) lt!629354))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429412 (= lt!629354 (Intermediate!11303 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1429412 (= lt!629355 (select (store (arr!47024 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429412 (= lt!629356 (array!97426 (store (arr!47024 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47574 a!2831)))))

(declare-fun b!1429413 () Bool)

(declare-fun res!964039 () Bool)

(assert (=> b!1429413 (=> (not res!964039) (not e!807129))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429413 (= res!964039 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429414 () Bool)

(declare-fun res!964044 () Bool)

(assert (=> b!1429414 (=> (not res!964044) (not e!807130))))

(assert (=> b!1429414 (= res!964044 (and (= (size!47574 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47574 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47574 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429415 () Bool)

(declare-fun res!964040 () Bool)

(assert (=> b!1429415 (=> (not res!964040) (not e!807130))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429415 (= res!964040 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47574 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47574 a!2831))))))

(declare-fun b!1429416 () Bool)

(assert (=> b!1429416 (= e!807130 e!807131)))

(declare-fun res!964042 () Bool)

(assert (=> b!1429416 (=> (not res!964042) (not e!807131))))

(declare-fun lt!629357 () SeekEntryResult!11303)

(assert (=> b!1429416 (= res!964042 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47024 a!2831) j!81) mask!2608) (select (arr!47024 a!2831) j!81) a!2831 mask!2608) lt!629357))))

(assert (=> b!1429416 (= lt!629357 (Intermediate!11303 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!964048 () Bool)

(assert (=> start!123264 (=> (not res!964048) (not e!807130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123264 (= res!964048 (validMask!0 mask!2608))))

(assert (=> start!123264 e!807130))

(assert (=> start!123264 true))

(declare-fun array_inv!36052 (array!97425) Bool)

(assert (=> start!123264 (array_inv!36052 a!2831)))

(declare-fun b!1429417 () Bool)

(assert (=> b!1429417 (= e!807129 (not true))))

(declare-fun e!807127 () Bool)

(assert (=> b!1429417 e!807127))

(declare-fun res!964049 () Bool)

(assert (=> b!1429417 (=> (not res!964049) (not e!807127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97425 (_ BitVec 32)) Bool)

(assert (=> b!1429417 (= res!964049 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48352 0))(
  ( (Unit!48353) )
))
(declare-fun lt!629358 () Unit!48352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48352)

(assert (=> b!1429417 (= lt!629358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429418 () Bool)

(declare-fun res!964046 () Bool)

(assert (=> b!1429418 (=> (not res!964046) (not e!807130))))

(assert (=> b!1429418 (= res!964046 (validKeyInArray!0 (select (arr!47024 a!2831) j!81)))))

(declare-fun b!1429419 () Bool)

(declare-fun res!964045 () Bool)

(assert (=> b!1429419 (=> (not res!964045) (not e!807130))))

(assert (=> b!1429419 (= res!964045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429420 () Bool)

(declare-fun res!964041 () Bool)

(assert (=> b!1429420 (=> (not res!964041) (not e!807129))))

(assert (=> b!1429420 (= res!964041 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47024 a!2831) j!81) a!2831 mask!2608) lt!629357))))

(declare-fun b!1429421 () Bool)

(declare-fun res!964051 () Bool)

(assert (=> b!1429421 (=> (not res!964051) (not e!807129))))

(assert (=> b!1429421 (= res!964051 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629355 lt!629356 mask!2608) lt!629354))))

(declare-fun b!1429422 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97425 (_ BitVec 32)) SeekEntryResult!11303)

(assert (=> b!1429422 (= e!807127 (= (seekEntryOrOpen!0 (select (arr!47024 a!2831) j!81) a!2831 mask!2608) (Found!11303 j!81)))))

(assert (= (and start!123264 res!964048) b!1429414))

(assert (= (and b!1429414 res!964044) b!1429410))

(assert (= (and b!1429410 res!964050) b!1429418))

(assert (= (and b!1429418 res!964046) b!1429419))

(assert (= (and b!1429419 res!964045) b!1429411))

(assert (= (and b!1429411 res!964043) b!1429415))

(assert (= (and b!1429415 res!964040) b!1429416))

(assert (= (and b!1429416 res!964042) b!1429412))

(assert (= (and b!1429412 res!964047) b!1429420))

(assert (= (and b!1429420 res!964041) b!1429421))

(assert (= (and b!1429421 res!964051) b!1429413))

(assert (= (and b!1429413 res!964039) b!1429417))

(assert (= (and b!1429417 res!964049) b!1429422))

(declare-fun m!1319511 () Bool)

(assert (=> b!1429422 m!1319511))

(assert (=> b!1429422 m!1319511))

(declare-fun m!1319513 () Bool)

(assert (=> b!1429422 m!1319513))

(assert (=> b!1429420 m!1319511))

(assert (=> b!1429420 m!1319511))

(declare-fun m!1319515 () Bool)

(assert (=> b!1429420 m!1319515))

(declare-fun m!1319517 () Bool)

(assert (=> b!1429410 m!1319517))

(assert (=> b!1429410 m!1319517))

(declare-fun m!1319519 () Bool)

(assert (=> b!1429410 m!1319519))

(declare-fun m!1319521 () Bool)

(assert (=> b!1429419 m!1319521))

(declare-fun m!1319523 () Bool)

(assert (=> b!1429412 m!1319523))

(assert (=> b!1429412 m!1319523))

(declare-fun m!1319525 () Bool)

(assert (=> b!1429412 m!1319525))

(declare-fun m!1319527 () Bool)

(assert (=> b!1429412 m!1319527))

(declare-fun m!1319529 () Bool)

(assert (=> b!1429412 m!1319529))

(assert (=> b!1429416 m!1319511))

(assert (=> b!1429416 m!1319511))

(declare-fun m!1319531 () Bool)

(assert (=> b!1429416 m!1319531))

(assert (=> b!1429416 m!1319531))

(assert (=> b!1429416 m!1319511))

(declare-fun m!1319533 () Bool)

(assert (=> b!1429416 m!1319533))

(declare-fun m!1319535 () Bool)

(assert (=> b!1429411 m!1319535))

(assert (=> b!1429418 m!1319511))

(assert (=> b!1429418 m!1319511))

(declare-fun m!1319537 () Bool)

(assert (=> b!1429418 m!1319537))

(declare-fun m!1319539 () Bool)

(assert (=> b!1429417 m!1319539))

(declare-fun m!1319541 () Bool)

(assert (=> b!1429417 m!1319541))

(declare-fun m!1319543 () Bool)

(assert (=> start!123264 m!1319543))

(declare-fun m!1319545 () Bool)

(assert (=> start!123264 m!1319545))

(declare-fun m!1319547 () Bool)

(assert (=> b!1429421 m!1319547))

(push 1)

