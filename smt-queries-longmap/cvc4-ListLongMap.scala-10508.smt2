; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123868 () Bool)

(assert start!123868)

(declare-fun b!1435401 () Bool)

(declare-fun e!810113 () Bool)

(assert (=> b!1435401 (= e!810113 true)))

(declare-fun lt!631871 () (_ BitVec 64))

(declare-fun lt!631874 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11386 0))(
  ( (MissingZero!11386 (index!47936 (_ BitVec 32))) (Found!11386 (index!47937 (_ BitVec 32))) (Intermediate!11386 (undefined!12198 Bool) (index!47938 (_ BitVec 32)) (x!129600 (_ BitVec 32))) (Undefined!11386) (MissingVacant!11386 (index!47939 (_ BitVec 32))) )
))
(declare-fun lt!631870 () SeekEntryResult!11386)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97612 0))(
  ( (array!97613 (arr!47107 (Array (_ BitVec 32) (_ BitVec 64))) (size!47657 (_ BitVec 32))) )
))
(declare-fun lt!631873 () array!97612)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97612 (_ BitVec 32)) SeekEntryResult!11386)

(assert (=> b!1435401 (= lt!631870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631874 lt!631871 lt!631873 mask!2608))))

(declare-fun b!1435402 () Bool)

(declare-fun res!968420 () Bool)

(declare-fun e!810117 () Bool)

(assert (=> b!1435402 (=> (not res!968420) (not e!810117))))

(declare-fun a!2831 () array!97612)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435402 (= res!968420 (validKeyInArray!0 (select (arr!47107 a!2831) i!982)))))

(declare-fun res!968418 () Bool)

(assert (=> start!123868 (=> (not res!968418) (not e!810117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123868 (= res!968418 (validMask!0 mask!2608))))

(assert (=> start!123868 e!810117))

(assert (=> start!123868 true))

(declare-fun array_inv!36135 (array!97612) Bool)

(assert (=> start!123868 (array_inv!36135 a!2831)))

(declare-fun b!1435403 () Bool)

(declare-fun res!968419 () Bool)

(assert (=> b!1435403 (=> (not res!968419) (not e!810117))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1435403 (= res!968419 (validKeyInArray!0 (select (arr!47107 a!2831) j!81)))))

(declare-fun b!1435404 () Bool)

(declare-fun res!968409 () Bool)

(declare-fun e!810115 () Bool)

(assert (=> b!1435404 (=> (not res!968409) (not e!810115))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!631872 () SeekEntryResult!11386)

(assert (=> b!1435404 (= res!968409 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47107 a!2831) j!81) a!2831 mask!2608) lt!631872))))

(declare-fun b!1435405 () Bool)

(declare-fun e!810118 () Bool)

(assert (=> b!1435405 (= e!810115 (not e!810118))))

(declare-fun res!968416 () Bool)

(assert (=> b!1435405 (=> res!968416 e!810118)))

(assert (=> b!1435405 (= res!968416 (or (= (select (arr!47107 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47107 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47107 a!2831) index!585) (select (arr!47107 a!2831) j!81)) (= (select (store (arr!47107 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810114 () Bool)

(assert (=> b!1435405 e!810114))

(declare-fun res!968411 () Bool)

(assert (=> b!1435405 (=> (not res!968411) (not e!810114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97612 (_ BitVec 32)) Bool)

(assert (=> b!1435405 (= res!968411 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48518 0))(
  ( (Unit!48519) )
))
(declare-fun lt!631869 () Unit!48518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48518)

(assert (=> b!1435405 (= lt!631869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435406 () Bool)

(declare-fun res!968417 () Bool)

(assert (=> b!1435406 (=> (not res!968417) (not e!810117))))

(assert (=> b!1435406 (= res!968417 (and (= (size!47657 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47657 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47657 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435407 () Bool)

(declare-fun e!810116 () Bool)

(assert (=> b!1435407 (= e!810116 e!810115)))

(declare-fun res!968412 () Bool)

(assert (=> b!1435407 (=> (not res!968412) (not e!810115))))

(declare-fun lt!631875 () SeekEntryResult!11386)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435407 (= res!968412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631871 mask!2608) lt!631871 lt!631873 mask!2608) lt!631875))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435407 (= lt!631875 (Intermediate!11386 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435407 (= lt!631871 (select (store (arr!47107 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435407 (= lt!631873 (array!97613 (store (arr!47107 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47657 a!2831)))))

(declare-fun b!1435408 () Bool)

(assert (=> b!1435408 (= e!810117 e!810116)))

(declare-fun res!968410 () Bool)

(assert (=> b!1435408 (=> (not res!968410) (not e!810116))))

(assert (=> b!1435408 (= res!968410 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47107 a!2831) j!81) mask!2608) (select (arr!47107 a!2831) j!81) a!2831 mask!2608) lt!631872))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435408 (= lt!631872 (Intermediate!11386 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435409 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97612 (_ BitVec 32)) SeekEntryResult!11386)

(assert (=> b!1435409 (= e!810114 (= (seekEntryOrOpen!0 (select (arr!47107 a!2831) j!81) a!2831 mask!2608) (Found!11386 j!81)))))

(declare-fun b!1435410 () Bool)

(declare-fun res!968408 () Bool)

(assert (=> b!1435410 (=> (not res!968408) (not e!810117))))

(assert (=> b!1435410 (= res!968408 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47657 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47657 a!2831))))))

(declare-fun b!1435411 () Bool)

(declare-fun res!968414 () Bool)

(assert (=> b!1435411 (=> (not res!968414) (not e!810117))))

(assert (=> b!1435411 (= res!968414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435412 () Bool)

(declare-fun res!968415 () Bool)

(assert (=> b!1435412 (=> (not res!968415) (not e!810115))))

(assert (=> b!1435412 (= res!968415 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435413 () Bool)

(declare-fun res!968413 () Bool)

(assert (=> b!1435413 (=> (not res!968413) (not e!810115))))

(assert (=> b!1435413 (= res!968413 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631871 lt!631873 mask!2608) lt!631875))))

(declare-fun b!1435414 () Bool)

(assert (=> b!1435414 (= e!810118 e!810113)))

(declare-fun res!968421 () Bool)

(assert (=> b!1435414 (=> res!968421 e!810113)))

(assert (=> b!1435414 (= res!968421 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631874 #b00000000000000000000000000000000) (bvsge lt!631874 (size!47657 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435414 (= lt!631874 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435415 () Bool)

(declare-fun res!968422 () Bool)

(assert (=> b!1435415 (=> (not res!968422) (not e!810117))))

(declare-datatypes ((List!33617 0))(
  ( (Nil!33614) (Cons!33613 (h!34948 (_ BitVec 64)) (t!48311 List!33617)) )
))
(declare-fun arrayNoDuplicates!0 (array!97612 (_ BitVec 32) List!33617) Bool)

(assert (=> b!1435415 (= res!968422 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33614))))

(declare-fun b!1435416 () Bool)

(declare-fun res!968407 () Bool)

(assert (=> b!1435416 (=> res!968407 e!810113)))

(assert (=> b!1435416 (= res!968407 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631874 (select (arr!47107 a!2831) j!81) a!2831 mask!2608) lt!631872)))))

(assert (= (and start!123868 res!968418) b!1435406))

(assert (= (and b!1435406 res!968417) b!1435402))

(assert (= (and b!1435402 res!968420) b!1435403))

(assert (= (and b!1435403 res!968419) b!1435411))

(assert (= (and b!1435411 res!968414) b!1435415))

(assert (= (and b!1435415 res!968422) b!1435410))

(assert (= (and b!1435410 res!968408) b!1435408))

(assert (= (and b!1435408 res!968410) b!1435407))

(assert (= (and b!1435407 res!968412) b!1435404))

(assert (= (and b!1435404 res!968409) b!1435413))

(assert (= (and b!1435413 res!968413) b!1435412))

(assert (= (and b!1435412 res!968415) b!1435405))

(assert (= (and b!1435405 res!968411) b!1435409))

(assert (= (and b!1435405 (not res!968416)) b!1435414))

(assert (= (and b!1435414 (not res!968421)) b!1435416))

(assert (= (and b!1435416 (not res!968407)) b!1435401))

(declare-fun m!1324761 () Bool)

(assert (=> b!1435409 m!1324761))

(assert (=> b!1435409 m!1324761))

(declare-fun m!1324763 () Bool)

(assert (=> b!1435409 m!1324763))

(declare-fun m!1324765 () Bool)

(assert (=> b!1435405 m!1324765))

(declare-fun m!1324767 () Bool)

(assert (=> b!1435405 m!1324767))

(declare-fun m!1324769 () Bool)

(assert (=> b!1435405 m!1324769))

(declare-fun m!1324771 () Bool)

(assert (=> b!1435405 m!1324771))

(assert (=> b!1435405 m!1324761))

(declare-fun m!1324773 () Bool)

(assert (=> b!1435405 m!1324773))

(assert (=> b!1435403 m!1324761))

(assert (=> b!1435403 m!1324761))

(declare-fun m!1324775 () Bool)

(assert (=> b!1435403 m!1324775))

(declare-fun m!1324777 () Bool)

(assert (=> start!123868 m!1324777))

(declare-fun m!1324779 () Bool)

(assert (=> start!123868 m!1324779))

(declare-fun m!1324781 () Bool)

(assert (=> b!1435411 m!1324781))

(declare-fun m!1324783 () Bool)

(assert (=> b!1435415 m!1324783))

(declare-fun m!1324785 () Bool)

(assert (=> b!1435414 m!1324785))

(assert (=> b!1435416 m!1324761))

(assert (=> b!1435416 m!1324761))

(declare-fun m!1324787 () Bool)

(assert (=> b!1435416 m!1324787))

(declare-fun m!1324789 () Bool)

(assert (=> b!1435413 m!1324789))

(assert (=> b!1435408 m!1324761))

(assert (=> b!1435408 m!1324761))

(declare-fun m!1324791 () Bool)

(assert (=> b!1435408 m!1324791))

(assert (=> b!1435408 m!1324791))

(assert (=> b!1435408 m!1324761))

(declare-fun m!1324793 () Bool)

(assert (=> b!1435408 m!1324793))

(assert (=> b!1435404 m!1324761))

(assert (=> b!1435404 m!1324761))

(declare-fun m!1324795 () Bool)

(assert (=> b!1435404 m!1324795))

(declare-fun m!1324797 () Bool)

(assert (=> b!1435407 m!1324797))

(assert (=> b!1435407 m!1324797))

(declare-fun m!1324799 () Bool)

(assert (=> b!1435407 m!1324799))

(assert (=> b!1435407 m!1324765))

(declare-fun m!1324801 () Bool)

(assert (=> b!1435407 m!1324801))

(declare-fun m!1324803 () Bool)

(assert (=> b!1435401 m!1324803))

(declare-fun m!1324805 () Bool)

(assert (=> b!1435402 m!1324805))

(assert (=> b!1435402 m!1324805))

(declare-fun m!1324807 () Bool)

(assert (=> b!1435402 m!1324807))

(push 1)

