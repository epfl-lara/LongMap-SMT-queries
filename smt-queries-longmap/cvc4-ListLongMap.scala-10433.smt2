; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122764 () Bool)

(assert start!122764)

(declare-fun b!1422975 () Bool)

(declare-fun e!804376 () Bool)

(declare-fun e!804378 () Bool)

(assert (=> b!1422975 (= e!804376 e!804378)))

(declare-fun res!958412 () Bool)

(assert (=> b!1422975 (=> (not res!958412) (not e!804378))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11167 0))(
  ( (MissingZero!11167 (index!47060 (_ BitVec 32))) (Found!11167 (index!47061 (_ BitVec 32))) (Intermediate!11167 (undefined!11979 Bool) (index!47062 (_ BitVec 32)) (x!128697 (_ BitVec 32))) (Undefined!11167) (MissingVacant!11167 (index!47063 (_ BitVec 32))) )
))
(declare-fun lt!626915 () SeekEntryResult!11167)

(declare-fun lt!626913 () (_ BitVec 64))

(declare-datatypes ((array!97129 0))(
  ( (array!97130 (arr!46882 (Array (_ BitVec 32) (_ BitVec 64))) (size!47432 (_ BitVec 32))) )
))
(declare-fun lt!626911 () array!97129)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97129 (_ BitVec 32)) SeekEntryResult!11167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422975 (= res!958412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626913 mask!2608) lt!626913 lt!626911 mask!2608) lt!626915))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422975 (= lt!626915 (Intermediate!11167 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97129)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422975 (= lt!626913 (select (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422975 (= lt!626911 (array!97130 (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47432 a!2831)))))

(declare-fun b!1422976 () Bool)

(declare-fun res!958423 () Bool)

(declare-fun e!804377 () Bool)

(assert (=> b!1422976 (=> (not res!958423) (not e!804377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422976 (= res!958423 (validKeyInArray!0 (select (arr!46882 a!2831) j!81)))))

(declare-fun b!1422977 () Bool)

(declare-fun res!958411 () Bool)

(declare-fun e!804375 () Bool)

(assert (=> b!1422977 (=> res!958411 e!804375)))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626916 () (_ BitVec 32))

(declare-fun lt!626912 () SeekEntryResult!11167)

(assert (=> b!1422977 (= res!958411 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626916 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!626912)))))

(declare-fun e!804374 () Bool)

(declare-fun b!1422978 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97129 (_ BitVec 32)) SeekEntryResult!11167)

(assert (=> b!1422978 (= e!804374 (= (seekEntryOrOpen!0 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) (Found!11167 j!81)))))

(declare-fun b!1422979 () Bool)

(declare-fun res!958419 () Bool)

(assert (=> b!1422979 (=> (not res!958419) (not e!804378))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422979 (= res!958419 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626913 lt!626911 mask!2608) lt!626915))))

(declare-fun b!1422980 () Bool)

(assert (=> b!1422980 (= e!804377 e!804376)))

(declare-fun res!958421 () Bool)

(assert (=> b!1422980 (=> (not res!958421) (not e!804376))))

(assert (=> b!1422980 (= res!958421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46882 a!2831) j!81) mask!2608) (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!626912))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422980 (= lt!626912 (Intermediate!11167 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422981 () Bool)

(declare-fun res!958420 () Bool)

(assert (=> b!1422981 (=> (not res!958420) (not e!804378))))

(assert (=> b!1422981 (= res!958420 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422983 () Bool)

(declare-fun res!958416 () Bool)

(assert (=> b!1422983 (=> (not res!958416) (not e!804378))))

(assert (=> b!1422983 (= res!958416 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46882 a!2831) j!81) a!2831 mask!2608) lt!626912))))

(declare-fun b!1422984 () Bool)

(declare-fun res!958410 () Bool)

(assert (=> b!1422984 (=> (not res!958410) (not e!804377))))

(assert (=> b!1422984 (= res!958410 (and (= (size!47432 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47432 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47432 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422985 () Bool)

(declare-fun e!804379 () Bool)

(assert (=> b!1422985 (= e!804378 (not e!804379))))

(declare-fun res!958418 () Bool)

(assert (=> b!1422985 (=> res!958418 e!804379)))

(assert (=> b!1422985 (= res!958418 (or (= (select (arr!46882 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46882 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46882 a!2831) index!585) (select (arr!46882 a!2831) j!81)) (= (select (store (arr!46882 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422985 e!804374))

(declare-fun res!958422 () Bool)

(assert (=> b!1422985 (=> (not res!958422) (not e!804374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97129 (_ BitVec 32)) Bool)

(assert (=> b!1422985 (= res!958422 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48170 0))(
  ( (Unit!48171) )
))
(declare-fun lt!626914 () Unit!48170)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48170)

(assert (=> b!1422985 (= lt!626914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422986 () Bool)

(assert (=> b!1422986 (= e!804379 e!804375)))

(declare-fun res!958413 () Bool)

(assert (=> b!1422986 (=> res!958413 e!804375)))

(assert (=> b!1422986 (= res!958413 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626916 #b00000000000000000000000000000000) (bvsge lt!626916 (size!47432 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422986 (= lt!626916 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422987 () Bool)

(declare-fun res!958415 () Bool)

(assert (=> b!1422987 (=> (not res!958415) (not e!804377))))

(declare-datatypes ((List!33392 0))(
  ( (Nil!33389) (Cons!33388 (h!34690 (_ BitVec 64)) (t!48086 List!33392)) )
))
(declare-fun arrayNoDuplicates!0 (array!97129 (_ BitVec 32) List!33392) Bool)

(assert (=> b!1422987 (= res!958415 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33389))))

(declare-fun b!1422988 () Bool)

(declare-fun res!958417 () Bool)

(assert (=> b!1422988 (=> (not res!958417) (not e!804377))))

(assert (=> b!1422988 (= res!958417 (validKeyInArray!0 (select (arr!46882 a!2831) i!982)))))

(declare-fun b!1422989 () Bool)

(declare-fun res!958414 () Bool)

(assert (=> b!1422989 (=> (not res!958414) (not e!804377))))

(assert (=> b!1422989 (= res!958414 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47432 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47432 a!2831))))))

(declare-fun b!1422990 () Bool)

(assert (=> b!1422990 (= e!804375 true)))

(declare-fun lt!626910 () SeekEntryResult!11167)

(assert (=> b!1422990 (= lt!626910 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626916 lt!626913 lt!626911 mask!2608))))

(declare-fun b!1422982 () Bool)

(declare-fun res!958408 () Bool)

(assert (=> b!1422982 (=> (not res!958408) (not e!804377))))

(assert (=> b!1422982 (= res!958408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!958409 () Bool)

(assert (=> start!122764 (=> (not res!958409) (not e!804377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122764 (= res!958409 (validMask!0 mask!2608))))

(assert (=> start!122764 e!804377))

(assert (=> start!122764 true))

(declare-fun array_inv!35910 (array!97129) Bool)

(assert (=> start!122764 (array_inv!35910 a!2831)))

(assert (= (and start!122764 res!958409) b!1422984))

(assert (= (and b!1422984 res!958410) b!1422988))

(assert (= (and b!1422988 res!958417) b!1422976))

(assert (= (and b!1422976 res!958423) b!1422982))

(assert (= (and b!1422982 res!958408) b!1422987))

(assert (= (and b!1422987 res!958415) b!1422989))

(assert (= (and b!1422989 res!958414) b!1422980))

(assert (= (and b!1422980 res!958421) b!1422975))

(assert (= (and b!1422975 res!958412) b!1422983))

(assert (= (and b!1422983 res!958416) b!1422979))

(assert (= (and b!1422979 res!958419) b!1422981))

(assert (= (and b!1422981 res!958420) b!1422985))

(assert (= (and b!1422985 res!958422) b!1422978))

(assert (= (and b!1422985 (not res!958418)) b!1422986))

(assert (= (and b!1422986 (not res!958413)) b!1422977))

(assert (= (and b!1422977 (not res!958411)) b!1422990))

(declare-fun m!1313523 () Bool)

(assert (=> b!1422987 m!1313523))

(declare-fun m!1313525 () Bool)

(assert (=> b!1422979 m!1313525))

(declare-fun m!1313527 () Bool)

(assert (=> b!1422990 m!1313527))

(declare-fun m!1313529 () Bool)

(assert (=> b!1422977 m!1313529))

(assert (=> b!1422977 m!1313529))

(declare-fun m!1313531 () Bool)

(assert (=> b!1422977 m!1313531))

(declare-fun m!1313533 () Bool)

(assert (=> b!1422988 m!1313533))

(assert (=> b!1422988 m!1313533))

(declare-fun m!1313535 () Bool)

(assert (=> b!1422988 m!1313535))

(declare-fun m!1313537 () Bool)

(assert (=> b!1422975 m!1313537))

(assert (=> b!1422975 m!1313537))

(declare-fun m!1313539 () Bool)

(assert (=> b!1422975 m!1313539))

(declare-fun m!1313541 () Bool)

(assert (=> b!1422975 m!1313541))

(declare-fun m!1313543 () Bool)

(assert (=> b!1422975 m!1313543))

(declare-fun m!1313545 () Bool)

(assert (=> b!1422986 m!1313545))

(assert (=> b!1422976 m!1313529))

(assert (=> b!1422976 m!1313529))

(declare-fun m!1313547 () Bool)

(assert (=> b!1422976 m!1313547))

(declare-fun m!1313549 () Bool)

(assert (=> b!1422982 m!1313549))

(assert (=> b!1422985 m!1313541))

(declare-fun m!1313551 () Bool)

(assert (=> b!1422985 m!1313551))

(declare-fun m!1313553 () Bool)

(assert (=> b!1422985 m!1313553))

(declare-fun m!1313555 () Bool)

(assert (=> b!1422985 m!1313555))

(assert (=> b!1422985 m!1313529))

(declare-fun m!1313557 () Bool)

(assert (=> b!1422985 m!1313557))

(assert (=> b!1422978 m!1313529))

(assert (=> b!1422978 m!1313529))

(declare-fun m!1313559 () Bool)

(assert (=> b!1422978 m!1313559))

(declare-fun m!1313561 () Bool)

(assert (=> start!122764 m!1313561))

(declare-fun m!1313563 () Bool)

(assert (=> start!122764 m!1313563))

(assert (=> b!1422983 m!1313529))

(assert (=> b!1422983 m!1313529))

(declare-fun m!1313565 () Bool)

(assert (=> b!1422983 m!1313565))

(assert (=> b!1422980 m!1313529))

(assert (=> b!1422980 m!1313529))

(declare-fun m!1313567 () Bool)

(assert (=> b!1422980 m!1313567))

(assert (=> b!1422980 m!1313567))

(assert (=> b!1422980 m!1313529))

(declare-fun m!1313569 () Bool)

(assert (=> b!1422980 m!1313569))

(push 1)

