; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122740 () Bool)

(assert start!122740)

(declare-fun b!1422399 () Bool)

(declare-fun res!957832 () Bool)

(declare-fun e!804123 () Bool)

(assert (=> b!1422399 (=> (not res!957832) (not e!804123))))

(declare-datatypes ((array!97105 0))(
  ( (array!97106 (arr!46870 (Array (_ BitVec 32) (_ BitVec 64))) (size!47420 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97105)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422399 (= res!957832 (validKeyInArray!0 (select (arr!46870 a!2831) i!982)))))

(declare-fun b!1422400 () Bool)

(declare-fun res!957835 () Bool)

(assert (=> b!1422400 (=> (not res!957835) (not e!804123))))

(declare-datatypes ((List!33380 0))(
  ( (Nil!33377) (Cons!33376 (h!34678 (_ BitVec 64)) (t!48074 List!33380)) )
))
(declare-fun arrayNoDuplicates!0 (array!97105 (_ BitVec 32) List!33380) Bool)

(assert (=> b!1422400 (= res!957835 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33377))))

(declare-fun b!1422401 () Bool)

(declare-fun e!804128 () Bool)

(assert (=> b!1422401 (= e!804128 true)))

(declare-datatypes ((SeekEntryResult!11155 0))(
  ( (MissingZero!11155 (index!47012 (_ BitVec 32))) (Found!11155 (index!47013 (_ BitVec 32))) (Intermediate!11155 (undefined!11967 Bool) (index!47014 (_ BitVec 32)) (x!128653 (_ BitVec 32))) (Undefined!11155) (MissingVacant!11155 (index!47015 (_ BitVec 32))) )
))
(declare-fun lt!626659 () SeekEntryResult!11155)

(declare-fun lt!626664 () array!97105)

(declare-fun lt!626663 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!626658 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97105 (_ BitVec 32)) SeekEntryResult!11155)

(assert (=> b!1422401 (= lt!626659 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626663 lt!626658 lt!626664 mask!2608))))

(declare-fun b!1422403 () Bool)

(declare-fun res!957837 () Bool)

(assert (=> b!1422403 (=> (not res!957837) (not e!804123))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1422403 (= res!957837 (and (= (size!47420 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47420 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47420 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422404 () Bool)

(declare-fun e!804125 () Bool)

(declare-fun e!804124 () Bool)

(assert (=> b!1422404 (= e!804125 (not e!804124))))

(declare-fun res!957844 () Bool)

(assert (=> b!1422404 (=> res!957844 e!804124)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422404 (= res!957844 (or (= (select (arr!46870 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46870 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46870 a!2831) index!585) (select (arr!46870 a!2831) j!81)) (= (select (store (arr!46870 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804127 () Bool)

(assert (=> b!1422404 e!804127))

(declare-fun res!957847 () Bool)

(assert (=> b!1422404 (=> (not res!957847) (not e!804127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97105 (_ BitVec 32)) Bool)

(assert (=> b!1422404 (= res!957847 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48146 0))(
  ( (Unit!48147) )
))
(declare-fun lt!626660 () Unit!48146)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48146)

(assert (=> b!1422404 (= lt!626660 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422405 () Bool)

(declare-fun e!804122 () Bool)

(assert (=> b!1422405 (= e!804123 e!804122)))

(declare-fun res!957839 () Bool)

(assert (=> b!1422405 (=> (not res!957839) (not e!804122))))

(declare-fun lt!626662 () SeekEntryResult!11155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422405 (= res!957839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46870 a!2831) j!81) mask!2608) (select (arr!46870 a!2831) j!81) a!2831 mask!2608) lt!626662))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422405 (= lt!626662 (Intermediate!11155 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422406 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97105 (_ BitVec 32)) SeekEntryResult!11155)

(assert (=> b!1422406 (= e!804127 (= (seekEntryOrOpen!0 (select (arr!46870 a!2831) j!81) a!2831 mask!2608) (Found!11155 j!81)))))

(declare-fun b!1422407 () Bool)

(declare-fun res!957840 () Bool)

(assert (=> b!1422407 (=> (not res!957840) (not e!804123))))

(assert (=> b!1422407 (= res!957840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422408 () Bool)

(declare-fun res!957843 () Bool)

(assert (=> b!1422408 (=> (not res!957843) (not e!804123))))

(assert (=> b!1422408 (= res!957843 (validKeyInArray!0 (select (arr!46870 a!2831) j!81)))))

(declare-fun b!1422409 () Bool)

(declare-fun res!957842 () Bool)

(assert (=> b!1422409 (=> (not res!957842) (not e!804125))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422409 (= res!957842 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422410 () Bool)

(declare-fun res!957833 () Bool)

(assert (=> b!1422410 (=> res!957833 e!804128)))

(assert (=> b!1422410 (= res!957833 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626663 (select (arr!46870 a!2831) j!81) a!2831 mask!2608) lt!626662)))))

(declare-fun b!1422411 () Bool)

(declare-fun res!957841 () Bool)

(assert (=> b!1422411 (=> (not res!957841) (not e!804123))))

(assert (=> b!1422411 (= res!957841 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47420 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47420 a!2831))))))

(declare-fun b!1422412 () Bool)

(declare-fun res!957834 () Bool)

(assert (=> b!1422412 (=> (not res!957834) (not e!804125))))

(declare-fun lt!626661 () SeekEntryResult!11155)

(assert (=> b!1422412 (= res!957834 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626658 lt!626664 mask!2608) lt!626661))))

(declare-fun b!1422413 () Bool)

(declare-fun res!957838 () Bool)

(assert (=> b!1422413 (=> (not res!957838) (not e!804125))))

(assert (=> b!1422413 (= res!957838 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46870 a!2831) j!81) a!2831 mask!2608) lt!626662))))

(declare-fun b!1422414 () Bool)

(assert (=> b!1422414 (= e!804122 e!804125)))

(declare-fun res!957845 () Bool)

(assert (=> b!1422414 (=> (not res!957845) (not e!804125))))

(assert (=> b!1422414 (= res!957845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626658 mask!2608) lt!626658 lt!626664 mask!2608) lt!626661))))

(assert (=> b!1422414 (= lt!626661 (Intermediate!11155 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422414 (= lt!626658 (select (store (arr!46870 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422414 (= lt!626664 (array!97106 (store (arr!46870 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47420 a!2831)))))

(declare-fun res!957846 () Bool)

(assert (=> start!122740 (=> (not res!957846) (not e!804123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122740 (= res!957846 (validMask!0 mask!2608))))

(assert (=> start!122740 e!804123))

(assert (=> start!122740 true))

(declare-fun array_inv!35898 (array!97105) Bool)

(assert (=> start!122740 (array_inv!35898 a!2831)))

(declare-fun b!1422402 () Bool)

(assert (=> b!1422402 (= e!804124 e!804128)))

(declare-fun res!957836 () Bool)

(assert (=> b!1422402 (=> res!957836 e!804128)))

(assert (=> b!1422402 (= res!957836 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626663 #b00000000000000000000000000000000) (bvsge lt!626663 (size!47420 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422402 (= lt!626663 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122740 res!957846) b!1422403))

(assert (= (and b!1422403 res!957837) b!1422399))

(assert (= (and b!1422399 res!957832) b!1422408))

(assert (= (and b!1422408 res!957843) b!1422407))

(assert (= (and b!1422407 res!957840) b!1422400))

(assert (= (and b!1422400 res!957835) b!1422411))

(assert (= (and b!1422411 res!957841) b!1422405))

(assert (= (and b!1422405 res!957839) b!1422414))

(assert (= (and b!1422414 res!957845) b!1422413))

(assert (= (and b!1422413 res!957838) b!1422412))

(assert (= (and b!1422412 res!957834) b!1422409))

(assert (= (and b!1422409 res!957842) b!1422404))

(assert (= (and b!1422404 res!957847) b!1422406))

(assert (= (and b!1422404 (not res!957844)) b!1422402))

(assert (= (and b!1422402 (not res!957836)) b!1422410))

(assert (= (and b!1422410 (not res!957833)) b!1422401))

(declare-fun m!1312947 () Bool)

(assert (=> b!1422408 m!1312947))

(assert (=> b!1422408 m!1312947))

(declare-fun m!1312949 () Bool)

(assert (=> b!1422408 m!1312949))

(assert (=> b!1422410 m!1312947))

(assert (=> b!1422410 m!1312947))

(declare-fun m!1312951 () Bool)

(assert (=> b!1422410 m!1312951))

(declare-fun m!1312953 () Bool)

(assert (=> b!1422401 m!1312953))

(declare-fun m!1312955 () Bool)

(assert (=> b!1422402 m!1312955))

(declare-fun m!1312957 () Bool)

(assert (=> b!1422400 m!1312957))

(declare-fun m!1312959 () Bool)

(assert (=> b!1422404 m!1312959))

(declare-fun m!1312961 () Bool)

(assert (=> b!1422404 m!1312961))

(declare-fun m!1312963 () Bool)

(assert (=> b!1422404 m!1312963))

(declare-fun m!1312965 () Bool)

(assert (=> b!1422404 m!1312965))

(assert (=> b!1422404 m!1312947))

(declare-fun m!1312967 () Bool)

(assert (=> b!1422404 m!1312967))

(declare-fun m!1312969 () Bool)

(assert (=> b!1422399 m!1312969))

(assert (=> b!1422399 m!1312969))

(declare-fun m!1312971 () Bool)

(assert (=> b!1422399 m!1312971))

(assert (=> b!1422413 m!1312947))

(assert (=> b!1422413 m!1312947))

(declare-fun m!1312973 () Bool)

(assert (=> b!1422413 m!1312973))

(declare-fun m!1312975 () Bool)

(assert (=> b!1422414 m!1312975))

(assert (=> b!1422414 m!1312975))

(declare-fun m!1312977 () Bool)

(assert (=> b!1422414 m!1312977))

(assert (=> b!1422414 m!1312959))

(declare-fun m!1312979 () Bool)

(assert (=> b!1422414 m!1312979))

(declare-fun m!1312981 () Bool)

(assert (=> start!122740 m!1312981))

(declare-fun m!1312983 () Bool)

(assert (=> start!122740 m!1312983))

(assert (=> b!1422406 m!1312947))

(assert (=> b!1422406 m!1312947))

(declare-fun m!1312985 () Bool)

(assert (=> b!1422406 m!1312985))

(assert (=> b!1422405 m!1312947))

(assert (=> b!1422405 m!1312947))

(declare-fun m!1312987 () Bool)

(assert (=> b!1422405 m!1312987))

(assert (=> b!1422405 m!1312987))

(assert (=> b!1422405 m!1312947))

(declare-fun m!1312989 () Bool)

(assert (=> b!1422405 m!1312989))

(declare-fun m!1312991 () Bool)

(assert (=> b!1422412 m!1312991))

(declare-fun m!1312993 () Bool)

(assert (=> b!1422407 m!1312993))

(push 1)

