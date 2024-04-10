; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123718 () Bool)

(assert start!123718)

(declare-fun b!1434029 () Bool)

(declare-fun res!967501 () Bool)

(declare-fun e!809396 () Bool)

(assert (=> b!1434029 (=> (not res!967501) (not e!809396))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97576 0))(
  ( (array!97577 (arr!47092 (Array (_ BitVec 32) (_ BitVec 64))) (size!47642 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97576)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1434029 (= res!967501 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47642 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47642 a!2831))))))

(declare-fun b!1434030 () Bool)

(declare-fun res!967499 () Bool)

(declare-fun e!809398 () Bool)

(assert (=> b!1434030 (=> (not res!967499) (not e!809398))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1434030 (= res!967499 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1434031 () Bool)

(declare-fun res!967502 () Bool)

(assert (=> b!1434031 (=> (not res!967502) (not e!809396))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1434031 (= res!967502 (validKeyInArray!0 (select (arr!47092 a!2831) i!982)))))

(declare-fun b!1434032 () Bool)

(declare-fun e!809394 () Bool)

(assert (=> b!1434032 (= e!809394 e!809398)))

(declare-fun res!967504 () Bool)

(assert (=> b!1434032 (=> (not res!967504) (not e!809398))))

(declare-datatypes ((SeekEntryResult!11371 0))(
  ( (MissingZero!11371 (index!47876 (_ BitVec 32))) (Found!11371 (index!47877 (_ BitVec 32))) (Intermediate!11371 (undefined!12183 Bool) (index!47878 (_ BitVec 32)) (x!129527 (_ BitVec 32))) (Undefined!11371) (MissingVacant!11371 (index!47879 (_ BitVec 32))) )
))
(declare-fun lt!631294 () SeekEntryResult!11371)

(declare-fun lt!631295 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!631291 () array!97576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97576 (_ BitVec 32)) SeekEntryResult!11371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434032 (= res!967504 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631295 mask!2608) lt!631295 lt!631291 mask!2608) lt!631294))))

(assert (=> b!1434032 (= lt!631294 (Intermediate!11371 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1434032 (= lt!631295 (select (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1434032 (= lt!631291 (array!97577 (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47642 a!2831)))))

(declare-fun b!1434033 () Bool)

(assert (=> b!1434033 (= e!809396 e!809394)))

(declare-fun res!967498 () Bool)

(assert (=> b!1434033 (=> (not res!967498) (not e!809394))))

(declare-fun lt!631296 () SeekEntryResult!11371)

(assert (=> b!1434033 (= res!967498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47092 a!2831) j!81) mask!2608) (select (arr!47092 a!2831) j!81) a!2831 mask!2608) lt!631296))))

(assert (=> b!1434033 (= lt!631296 (Intermediate!11371 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1434034 () Bool)

(declare-fun res!967496 () Bool)

(assert (=> b!1434034 (=> (not res!967496) (not e!809398))))

(assert (=> b!1434034 (= res!967496 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47092 a!2831) j!81) a!2831 mask!2608) lt!631296))))

(declare-fun b!1434035 () Bool)

(declare-fun res!967503 () Bool)

(assert (=> b!1434035 (=> (not res!967503) (not e!809396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97576 (_ BitVec 32)) Bool)

(assert (=> b!1434035 (= res!967503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1434036 () Bool)

(declare-fun e!809397 () Bool)

(assert (=> b!1434036 (= e!809397 true)))

(declare-fun lt!631293 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1434036 (= lt!631293 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun e!809395 () Bool)

(declare-fun b!1434037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97576 (_ BitVec 32)) SeekEntryResult!11371)

(assert (=> b!1434037 (= e!809395 (= (seekEntryOrOpen!0 (select (arr!47092 a!2831) j!81) a!2831 mask!2608) (Found!11371 j!81)))))

(declare-fun res!967494 () Bool)

(assert (=> start!123718 (=> (not res!967494) (not e!809396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123718 (= res!967494 (validMask!0 mask!2608))))

(assert (=> start!123718 e!809396))

(assert (=> start!123718 true))

(declare-fun array_inv!36120 (array!97576) Bool)

(assert (=> start!123718 (array_inv!36120 a!2831)))

(declare-fun b!1434038 () Bool)

(declare-fun res!967495 () Bool)

(assert (=> b!1434038 (=> (not res!967495) (not e!809396))))

(assert (=> b!1434038 (= res!967495 (validKeyInArray!0 (select (arr!47092 a!2831) j!81)))))

(declare-fun b!1434039 () Bool)

(declare-fun res!967492 () Bool)

(assert (=> b!1434039 (=> (not res!967492) (not e!809396))))

(declare-datatypes ((List!33602 0))(
  ( (Nil!33599) (Cons!33598 (h!34927 (_ BitVec 64)) (t!48296 List!33602)) )
))
(declare-fun arrayNoDuplicates!0 (array!97576 (_ BitVec 32) List!33602) Bool)

(assert (=> b!1434039 (= res!967492 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33599))))

(declare-fun b!1434040 () Bool)

(declare-fun res!967493 () Bool)

(assert (=> b!1434040 (=> (not res!967493) (not e!809398))))

(assert (=> b!1434040 (= res!967493 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631295 lt!631291 mask!2608) lt!631294))))

(declare-fun b!1434041 () Bool)

(assert (=> b!1434041 (= e!809398 (not e!809397))))

(declare-fun res!967491 () Bool)

(assert (=> b!1434041 (=> res!967491 e!809397)))

(assert (=> b!1434041 (= res!967491 (or (= (select (arr!47092 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47092 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47092 a!2831) index!585) (select (arr!47092 a!2831) j!81)) (= (select (store (arr!47092 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1434041 e!809395))

(declare-fun res!967497 () Bool)

(assert (=> b!1434041 (=> (not res!967497) (not e!809395))))

(assert (=> b!1434041 (= res!967497 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48488 0))(
  ( (Unit!48489) )
))
(declare-fun lt!631292 () Unit!48488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48488)

(assert (=> b!1434041 (= lt!631292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1434042 () Bool)

(declare-fun res!967500 () Bool)

(assert (=> b!1434042 (=> (not res!967500) (not e!809396))))

(assert (=> b!1434042 (= res!967500 (and (= (size!47642 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47642 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47642 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123718 res!967494) b!1434042))

(assert (= (and b!1434042 res!967500) b!1434031))

(assert (= (and b!1434031 res!967502) b!1434038))

(assert (= (and b!1434038 res!967495) b!1434035))

(assert (= (and b!1434035 res!967503) b!1434039))

(assert (= (and b!1434039 res!967492) b!1434029))

(assert (= (and b!1434029 res!967501) b!1434033))

(assert (= (and b!1434033 res!967498) b!1434032))

(assert (= (and b!1434032 res!967504) b!1434034))

(assert (= (and b!1434034 res!967496) b!1434040))

(assert (= (and b!1434040 res!967493) b!1434030))

(assert (= (and b!1434030 res!967499) b!1434041))

(assert (= (and b!1434041 res!967497) b!1434037))

(assert (= (and b!1434041 (not res!967491)) b!1434036))

(declare-fun m!1323637 () Bool)

(assert (=> b!1434037 m!1323637))

(assert (=> b!1434037 m!1323637))

(declare-fun m!1323639 () Bool)

(assert (=> b!1434037 m!1323639))

(declare-fun m!1323641 () Bool)

(assert (=> start!123718 m!1323641))

(declare-fun m!1323643 () Bool)

(assert (=> start!123718 m!1323643))

(declare-fun m!1323645 () Bool)

(assert (=> b!1434041 m!1323645))

(declare-fun m!1323647 () Bool)

(assert (=> b!1434041 m!1323647))

(declare-fun m!1323649 () Bool)

(assert (=> b!1434041 m!1323649))

(declare-fun m!1323651 () Bool)

(assert (=> b!1434041 m!1323651))

(assert (=> b!1434041 m!1323637))

(declare-fun m!1323653 () Bool)

(assert (=> b!1434041 m!1323653))

(declare-fun m!1323655 () Bool)

(assert (=> b!1434032 m!1323655))

(assert (=> b!1434032 m!1323655))

(declare-fun m!1323657 () Bool)

(assert (=> b!1434032 m!1323657))

(assert (=> b!1434032 m!1323645))

(declare-fun m!1323659 () Bool)

(assert (=> b!1434032 m!1323659))

(assert (=> b!1434033 m!1323637))

(assert (=> b!1434033 m!1323637))

(declare-fun m!1323661 () Bool)

(assert (=> b!1434033 m!1323661))

(assert (=> b!1434033 m!1323661))

(assert (=> b!1434033 m!1323637))

(declare-fun m!1323663 () Bool)

(assert (=> b!1434033 m!1323663))

(declare-fun m!1323665 () Bool)

(assert (=> b!1434035 m!1323665))

(assert (=> b!1434034 m!1323637))

(assert (=> b!1434034 m!1323637))

(declare-fun m!1323667 () Bool)

(assert (=> b!1434034 m!1323667))

(declare-fun m!1323669 () Bool)

(assert (=> b!1434036 m!1323669))

(declare-fun m!1323671 () Bool)

(assert (=> b!1434040 m!1323671))

(declare-fun m!1323673 () Bool)

(assert (=> b!1434031 m!1323673))

(assert (=> b!1434031 m!1323673))

(declare-fun m!1323675 () Bool)

(assert (=> b!1434031 m!1323675))

(declare-fun m!1323677 () Bool)

(assert (=> b!1434039 m!1323677))

(assert (=> b!1434038 m!1323637))

(assert (=> b!1434038 m!1323637))

(declare-fun m!1323679 () Bool)

(assert (=> b!1434038 m!1323679))

(push 1)

