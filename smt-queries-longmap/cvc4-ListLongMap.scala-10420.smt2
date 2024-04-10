; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122686 () Bool)

(assert start!122686)

(declare-fun b!1421287 () Bool)

(declare-fun res!956725 () Bool)

(declare-fun e!803686 () Bool)

(assert (=> b!1421287 (=> (not res!956725) (not e!803686))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97051 0))(
  ( (array!97052 (arr!46843 (Array (_ BitVec 32) (_ BitVec 64))) (size!47393 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97051)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421287 (= res!956725 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47393 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47393 a!2831))))))

(declare-fun b!1421288 () Bool)

(declare-fun res!956726 () Bool)

(assert (=> b!1421288 (=> (not res!956726) (not e!803686))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421288 (= res!956726 (validKeyInArray!0 (select (arr!46843 a!2831) i!982)))))

(declare-fun res!956728 () Bool)

(assert (=> start!122686 (=> (not res!956728) (not e!803686))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122686 (= res!956728 (validMask!0 mask!2608))))

(assert (=> start!122686 e!803686))

(assert (=> start!122686 true))

(declare-fun array_inv!35871 (array!97051) Bool)

(assert (=> start!122686 (array_inv!35871 a!2831)))

(declare-fun b!1421289 () Bool)

(declare-fun e!803684 () Bool)

(assert (=> b!1421289 (= e!803684 (not (bvsge mask!2608 #b00000000000000000000000000000000)))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97051 (_ BitVec 32)) Bool)

(assert (=> b!1421289 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48092 0))(
  ( (Unit!48093) )
))
(declare-fun lt!626205 () Unit!48092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97051 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48092)

(assert (=> b!1421289 (= lt!626205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421290 () Bool)

(declare-fun res!956720 () Bool)

(assert (=> b!1421290 (=> (not res!956720) (not e!803686))))

(assert (=> b!1421290 (= res!956720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421291 () Bool)

(declare-fun e!803687 () Bool)

(assert (=> b!1421291 (= e!803687 e!803684)))

(declare-fun res!956727 () Bool)

(assert (=> b!1421291 (=> (not res!956727) (not e!803684))))

(declare-datatypes ((SeekEntryResult!11128 0))(
  ( (MissingZero!11128 (index!46904 (_ BitVec 32))) (Found!11128 (index!46905 (_ BitVec 32))) (Intermediate!11128 (undefined!11940 Bool) (index!46906 (_ BitVec 32)) (x!128554 (_ BitVec 32))) (Undefined!11128) (MissingVacant!11128 (index!46907 (_ BitVec 32))) )
))
(declare-fun lt!626202 () SeekEntryResult!11128)

(declare-fun lt!626201 () array!97051)

(declare-fun lt!626203 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97051 (_ BitVec 32)) SeekEntryResult!11128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421291 (= res!956727 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626203 mask!2608) lt!626203 lt!626201 mask!2608) lt!626202))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421291 (= lt!626202 (Intermediate!11128 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421291 (= lt!626203 (select (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421291 (= lt!626201 (array!97052 (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47393 a!2831)))))

(declare-fun b!1421292 () Bool)

(declare-fun res!956721 () Bool)

(assert (=> b!1421292 (=> (not res!956721) (not e!803686))))

(assert (=> b!1421292 (= res!956721 (validKeyInArray!0 (select (arr!46843 a!2831) j!81)))))

(declare-fun b!1421293 () Bool)

(declare-fun res!956723 () Bool)

(assert (=> b!1421293 (=> (not res!956723) (not e!803686))))

(declare-datatypes ((List!33353 0))(
  ( (Nil!33350) (Cons!33349 (h!34651 (_ BitVec 64)) (t!48047 List!33353)) )
))
(declare-fun arrayNoDuplicates!0 (array!97051 (_ BitVec 32) List!33353) Bool)

(assert (=> b!1421293 (= res!956723 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33350))))

(declare-fun b!1421294 () Bool)

(declare-fun res!956729 () Bool)

(assert (=> b!1421294 (=> (not res!956729) (not e!803684))))

(declare-fun lt!626204 () SeekEntryResult!11128)

(assert (=> b!1421294 (= res!956729 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46843 a!2831) j!81) a!2831 mask!2608) lt!626204))))

(declare-fun b!1421295 () Bool)

(declare-fun res!956724 () Bool)

(assert (=> b!1421295 (=> (not res!956724) (not e!803684))))

(assert (=> b!1421295 (= res!956724 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421296 () Bool)

(declare-fun res!956730 () Bool)

(assert (=> b!1421296 (=> (not res!956730) (not e!803684))))

(assert (=> b!1421296 (= res!956730 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626203 lt!626201 mask!2608) lt!626202))))

(declare-fun b!1421297 () Bool)

(assert (=> b!1421297 (= e!803686 e!803687)))

(declare-fun res!956722 () Bool)

(assert (=> b!1421297 (=> (not res!956722) (not e!803687))))

(assert (=> b!1421297 (= res!956722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46843 a!2831) j!81) mask!2608) (select (arr!46843 a!2831) j!81) a!2831 mask!2608) lt!626204))))

(assert (=> b!1421297 (= lt!626204 (Intermediate!11128 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421298 () Bool)

(declare-fun res!956731 () Bool)

(assert (=> b!1421298 (=> (not res!956731) (not e!803686))))

(assert (=> b!1421298 (= res!956731 (and (= (size!47393 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47393 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47393 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122686 res!956728) b!1421298))

(assert (= (and b!1421298 res!956731) b!1421288))

(assert (= (and b!1421288 res!956726) b!1421292))

(assert (= (and b!1421292 res!956721) b!1421290))

(assert (= (and b!1421290 res!956720) b!1421293))

(assert (= (and b!1421293 res!956723) b!1421287))

(assert (= (and b!1421287 res!956725) b!1421297))

(assert (= (and b!1421297 res!956722) b!1421291))

(assert (= (and b!1421291 res!956727) b!1421294))

(assert (= (and b!1421294 res!956729) b!1421296))

(assert (= (and b!1421296 res!956730) b!1421295))

(assert (= (and b!1421295 res!956724) b!1421289))

(declare-fun m!1311831 () Bool)

(assert (=> b!1421297 m!1311831))

(assert (=> b!1421297 m!1311831))

(declare-fun m!1311833 () Bool)

(assert (=> b!1421297 m!1311833))

(assert (=> b!1421297 m!1311833))

(assert (=> b!1421297 m!1311831))

(declare-fun m!1311835 () Bool)

(assert (=> b!1421297 m!1311835))

(declare-fun m!1311837 () Bool)

(assert (=> b!1421290 m!1311837))

(assert (=> b!1421292 m!1311831))

(assert (=> b!1421292 m!1311831))

(declare-fun m!1311839 () Bool)

(assert (=> b!1421292 m!1311839))

(declare-fun m!1311841 () Bool)

(assert (=> b!1421288 m!1311841))

(assert (=> b!1421288 m!1311841))

(declare-fun m!1311843 () Bool)

(assert (=> b!1421288 m!1311843))

(declare-fun m!1311845 () Bool)

(assert (=> b!1421293 m!1311845))

(declare-fun m!1311847 () Bool)

(assert (=> start!122686 m!1311847))

(declare-fun m!1311849 () Bool)

(assert (=> start!122686 m!1311849))

(declare-fun m!1311851 () Bool)

(assert (=> b!1421296 m!1311851))

(declare-fun m!1311853 () Bool)

(assert (=> b!1421289 m!1311853))

(declare-fun m!1311855 () Bool)

(assert (=> b!1421289 m!1311855))

(declare-fun m!1311857 () Bool)

(assert (=> b!1421291 m!1311857))

(assert (=> b!1421291 m!1311857))

(declare-fun m!1311859 () Bool)

(assert (=> b!1421291 m!1311859))

(declare-fun m!1311861 () Bool)

(assert (=> b!1421291 m!1311861))

(declare-fun m!1311863 () Bool)

(assert (=> b!1421291 m!1311863))

(assert (=> b!1421294 m!1311831))

(assert (=> b!1421294 m!1311831))

(declare-fun m!1311865 () Bool)

(assert (=> b!1421294 m!1311865))

(push 1)

(assert (not b!1421297))

(assert (not b!1421294))

(assert (not b!1421292))

(assert (not b!1421288))

(assert (not b!1421289))

